Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6204F388E67
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:54:52 +0200 (CEST)
Received: from localhost ([::1]:59150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLis-0003XC-I8
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:54:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33004)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgQ-00009F-VP; Wed, 19 May 2021 08:52:18 -0400
Received: from ozlabs.org ([203.11.71.1]:50281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgN-0000u0-TM; Wed, 19 May 2021 08:52:18 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnW1dGJz9sW4; Wed, 19 May 2021 22:51:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428719;
 bh=UO6os0+vfAzQShdgN+GBe7ZtACXALNneJWbkKexnSZ4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CcaQk9PScXK/ad2GKZRzHlV8sADtnpm3//rp/eoa0UAB3u0bQOy7HxjUO3uf/+ReB
 M/2gDBjGUJeJMSRk+ZH2CCABqDgJwxPkHgKfIMckTiHwSfe5OoucDcFthgY9OA+Nay
 pQqKAKL3gksCfVGCvoUPtWBZoEmu6BnZm4nThLWs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 01/48] hw/ppc/spapr.c: Extract MMU mode error reporting into a
 function
Date: Wed, 19 May 2021 22:51:01 +1000
Message-Id: <20210519125148.27720-2-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: richard.henderson@linaro.org, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

A following patch will make use of it.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20210505001130.3999968-2-farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 hw/ppc/spapr.c         | 16 ++++++++++++++++
 hw/ppc/spapr_hcall.c   | 14 ++------------
 include/hw/ppc/spapr.h |  1 +
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 8f40319aee..3e51560d57 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1556,6 +1556,22 @@ void spapr_setup_hpt(SpaprMachineState *spapr)
     }
 }
 
+void spapr_check_mmu_mode(bool guest_radix)
+{
+    if (guest_radix) {
+        if (kvm_enabled() && !kvmppc_has_cap_mmu_radix()) {
+            error_report("Guest requested unavailable MMU mode (radix).");
+            exit(EXIT_FAILURE);
+        }
+    } else {
+        if (kvm_enabled() && kvmppc_has_cap_mmu_radix()
+            && !kvmppc_has_cap_mmu_hash_v3()) {
+            error_report("Guest requested unavailable MMU mode (hash).");
+            exit(EXIT_FAILURE);
+        }
+    }
+}
+
 static void spapr_machine_reset(MachineState *machine)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(machine);
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 16c719c3de..186b7666cc 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1760,18 +1760,8 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     spapr_ovec_intersect(spapr->ov5_cas, spapr->ov5, ov5_guest);
     spapr_ovec_cleanup(ov5_guest);
 
-    if (guest_radix) {
-        if (kvm_enabled() && !kvmppc_has_cap_mmu_radix()) {
-            error_report("Guest requested unavailable MMU mode (radix).");
-            exit(EXIT_FAILURE);
-        }
-    } else {
-        if (kvm_enabled() && kvmppc_has_cap_mmu_radix()
-            && !kvmppc_has_cap_mmu_hash_v3()) {
-            error_report("Guest requested unavailable MMU mode (hash).");
-            exit(EXIT_FAILURE);
-        }
-    }
+    spapr_check_mmu_mode(guest_radix);
+
     spapr->cas_pre_isa3_guest = !spapr_ovec_test(ov1_guest, OV1_PPC_3_00);
     spapr_ovec_cleanup(ov1_guest);
 
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 7f40a158f4..92ca246509 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -821,6 +821,7 @@ void spapr_dt_events(SpaprMachineState *sm, void *fdt);
 void close_htab_fd(SpaprMachineState *spapr);
 void spapr_setup_hpt(SpaprMachineState *spapr);
 void spapr_free_hpt(SpaprMachineState *spapr);
+void spapr_check_mmu_mode(bool guest_radix);
 SpaprTceTable *spapr_tce_new_table(DeviceState *owner, uint32_t liobn);
 void spapr_tce_table_enable(SpaprTceTable *tcet,
                             uint32_t page_shift, uint64_t bus_offset,
-- 
2.31.1


