Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 54EEB315F5B
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:24:09 +0100 (CET)
Received: from localhost ([::1]:53402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9iv2-0008Px-EF
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:24:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip7-0001dG-Cg; Wed, 10 Feb 2021 01:18:01 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:39889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ip3-0000Nh-PG; Wed, 10 Feb 2021 01:18:00 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gn1cR0z9sW3; Wed, 10 Feb 2021 17:17:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937861;
 bh=AYs/+Y4DCvUcMkZ1/4xBB01VSIj4e3ryZtoxHaIY5U0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mDT+XWcALU8LgMfSFycbKqvnWgHLuU9rhfBvc1MnPJTHth3nckv/x69p3J9E2rGF8
 1CqUJY93os+/iWVcVrBniVO0AfL0J3citOIxMa+7dlP4IbfDjnBT2tfcRvH5YI60VW
 ljMKSXX7mdLy5isk08TOivXoAhB6VJua9ts92070=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 12/19] spapr: move spapr_machine_using_legacy_numa() to
 spapr_numa.c
Date: Wed, 10 Feb 2021 17:17:28 +1100
Message-Id: <20210210061735.304384-13-david@gibson.dropbear.id.au>
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

This function is used only in spapr_numa.c.

Tested-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210128174213.1349181-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c         | 9 ---------
 hw/ppc/spapr_numa.c    | 9 +++++++++
 include/hw/ppc/spapr.h | 1 -
 3 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index f9ea9d1097..8a1a979257 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -296,15 +296,6 @@ static hwaddr spapr_node0_size(MachineState *machine)
     return machine->ram_size;
 }
 
-bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
-{
-    MachineState *machine = MACHINE(spapr);
-    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
-
-    return smc->pre_5_2_numa_associativity ||
-           machine->numa_state->num_nodes <= 1;
-}
-
 static void add_str(GString *s, const gchar *s1)
 {
     g_string_append_len(s, s1, strlen(s1) + 1);
diff --git a/hw/ppc/spapr_numa.c b/hw/ppc/spapr_numa.c
index b50796bbe3..261810525b 100644
--- a/hw/ppc/spapr_numa.c
+++ b/hw/ppc/spapr_numa.c
@@ -19,6 +19,15 @@
 /* Moved from hw/ppc/spapr_pci_nvlink2.c */
 #define SPAPR_GPU_NUMA_ID           (cpu_to_be32(1))
 
+static bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr)
+{
+    MachineState *machine = MACHINE(spapr);
+    SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
+
+    return smc->pre_5_2_numa_associativity ||
+           machine->numa_state->num_nodes <= 1;
+}
+
 static bool spapr_numa_is_symmetrical(MachineState *ms)
 {
     int src, dst;
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index c27c7ce515..ccbeeca1de 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -851,7 +851,6 @@ int spapr_max_server_number(SpaprMachineState *spapr);
 void spapr_store_hpte(PowerPCCPU *cpu, hwaddr ptex,
                       uint64_t pte0, uint64_t pte1);
 void spapr_mce_req_event(PowerPCCPU *cpu, bool recovered);
-bool spapr_machine_using_legacy_numa(SpaprMachineState *spapr);
 
 /* DRC callbacks. */
 void spapr_core_release(DeviceState *dev);
-- 
2.29.2


