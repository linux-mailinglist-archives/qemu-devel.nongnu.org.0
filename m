Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1470315F53
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 07:20:46 +0100 (CET)
Received: from localhost ([::1]:44238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9irk-0004Rm-Pl
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 01:20:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ioz-0001Sm-TJ; Wed, 10 Feb 2021 01:17:53 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:47485 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1l9ioq-0000Cf-OD; Wed, 10 Feb 2021 01:17:53 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Db8gk23vBz9sVr; Wed, 10 Feb 2021 17:17:37 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1612937858;
 bh=FnUTaNZUejbuviVmxF4NYYomVv93F2/VgYdKnQf/+9Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=PylFBI6vYyJkQLWovXPw5I6GoXVQUFZ3Smch7k0W5aZ/NYPzcSa9kkJeJeZ4VQ/kg
 3jJEZZVhiXLLdqBauQHmjSaolfnw5I7CvBucAX6ZuOGDGoIO1rX5xrlZaE+kE+vwpM
 R6gL+PnUVVMGW2fElT7EpUK5+VS2Is7f1SB+5vCs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 01/19] spapr.c: use g_auto* with 'nodename' in CPU DT functions
Date: Wed, 10 Feb 2021 17:17:17 +1100
Message-Id: <20210210061735.304384-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210210061735.304384-1-david@gibson.dropbear.id.au>
References: <20210210061735.304384-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
 qemu-devel@nongnu.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Next patch will use the 'nodename' string in spapr_core_dt_populate()
after the point it's being freed today.

Instead of moving 'g_free(nodename)' around, let's do a QoL change in
both CPU DT functions where 'nodename' is being freed, and use
g_autofree to avoid the 'g_free()' call altogether.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20210120232305.241521-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 612356e9ec..e7992c0422 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -791,7 +791,6 @@ static void spapr_dt_cpus(void *fdt, SpaprMachineState *spapr)
     CPUState *cs;
     int n_cpus;
     int cpus_offset;
-    char *nodename;
     int i;
 
     cpus_offset = fdt_add_subnode(fdt, 0, "cpus");
@@ -819,6 +818,7 @@ static void spapr_dt_cpus(void *fdt, SpaprMachineState *spapr)
         PowerPCCPU *cpu = POWERPC_CPU(cs);
         int index = spapr_get_vcpu_id(cpu);
         DeviceClass *dc = DEVICE_GET_CLASS(cs);
+        g_autofree char *nodename = NULL;
         int offset;
 
         if (!spapr_is_thread0_in_vcore(spapr, cpu)) {
@@ -827,7 +827,6 @@ static void spapr_dt_cpus(void *fdt, SpaprMachineState *spapr)
 
         nodename = g_strdup_printf("%s@%x", dc->fw_name, index);
         offset = fdt_add_subnode(fdt, cpus_offset, nodename);
-        g_free(nodename);
         _FDT(offset);
         spapr_dt_cpu(cs, fdt, offset, spapr);
     }
@@ -3749,12 +3748,11 @@ int spapr_core_dt_populate(SpaprDrc *drc, SpaprMachineState *spapr,
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     DeviceClass *dc = DEVICE_GET_CLASS(cs);
     int id = spapr_get_vcpu_id(cpu);
-    char *nodename;
+    g_autofree char *nodename = NULL;
     int offset;
 
     nodename = g_strdup_printf("%s@%x", dc->fw_name, id);
     offset = fdt_add_subnode(fdt, 0, nodename);
-    g_free(nodename);
 
     spapr_dt_cpu(cs, fdt, offset, spapr);
 
-- 
2.29.2


