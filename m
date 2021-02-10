Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C758F315F73
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:27:27 +0100 (CET)
Received: from localhost ([::1]:32868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9iyE-0003Pu-Pn
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:27:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip9-0001ip-FJ; Wed, 10 Feb 2021 01:18:03 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:42049 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip7-0000Qq-LG; Wed, 10 Feb 2021 01:18:03 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gp17qLz9sWF; Wed, 10 Feb 2021 17:17:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937862;
 bh=8ThZC5jw5bRucRV+ryJsGdKqx6SgBpNqDr6183suprk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UwGP5T9Mn7fzPFMF5uWkklYdEUiVDWiWWPvKi8+Ejsya33jp2vgjDNLtrC0zVEDmg
 YiBxFQjl0kVAJIqRK2zk2WY/na9QHM4hEXeZR+zfZqzyk/wED2DHrE5BZhl3mciTDb
 mkNpPzVIjcm3vuhyivG4IBhcGphLDWaPB2DIKh0Q=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 14/19] spapr_numa.c: fix ibm,
 max-associativity-domains calculation
Date: Wed, 10 Feb 2021 17:17:30 +1100
Message-Id: <20210210061735.304384-15-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

The current logic for calculating 'maxdomain' making it a sum of
numa_state->num_nodes with spapr->gpu_numa_id. spapr->gpu_numa_id is
used as a index to determine the next available NUMA id that a
given NVGPU can use.

The problem is that the initial value of gpu_numa_id, for any topology
that has more than one NUMA node, is equal to numa_state->num_nodes.
This means that our maxdomain will always be, at least, twice the
amount of existing NUMA nodes. This means that a guest with 4 NUMA
nodes will end up with the following max-associativity-domains:

rtas/ibm,max-associativity-domains
                 00000004 00000008 00000008 00000008 00000008

This overtuning of maxdomains doesn't go unnoticed in the guest, being
detected in SLUB during boot:

 dmesg | grep SLUB
[    0.000000] SLUB: HWalign=128, Order=0-3, MinObjects=0, CPUs=4, Nodes=8

SLUB is detecting 8 total nodes, with 4 nodes being online.

This patch fixes ibm,max-associativity-domains by considering the amount
of NVGPUs NUMA nodes presented in the guest, instead of just
spapr->gpu_numa_id.

Reported-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210128174213.1349181-4-danielhb413@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr_numa.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index a757dd88b8..779f18b994 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -311,6 +311,8 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
 {
     MachineState *ms = MACHINE(spapr);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(spapr);
+    uint32_t number_nvgpus_nodes = spapr->gpu_numa_id -
+                                   spapr_numa_initial_nvgpu_numa_id(ms);
     uint32_t refpoints[] = {
         cpu_to_be32(0x4),
         cpu_to_be32(0x3),
@@ -318,7 +320,7 @@ void spapr_numa_write_rtas_dt(SpaprMachineState *spapr, void *fdt, int rtas)
         cpu_to_be32(0x1),
     };
     uint32_t nr_refpoints = ARRAY_SIZE(refpoints);
-    uint32_t maxdomain = ms->numa_state->num_nodes + spapr->gpu_numa_id;
+    uint32_t maxdomain = ms->numa_state->num_nodes + number_nvgpus_nodes;
     uint32_t maxdomains[] = {
         cpu_to_be32(4),
         cpu_to_be32(maxdomain),
-- 
2.29.2


