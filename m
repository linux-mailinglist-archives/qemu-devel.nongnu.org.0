Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7B8585CCB
	for <lists+qemu-devel@lfdr.de>; Sun, 31 Jul 2022 03:35:57 +0200 (CEST)
Received: from localhost ([::1]:46296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHxs4-0005Cg-DU
	for lists+qemu-devel@lfdr.de; Sat, 30 Jul 2022 21:35:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1oHxqP-0003YV-7b; Sat, 30 Jul 2022 21:34:13 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33379)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1oHxqM-0001nN-NT; Sat, 30 Jul 2022 21:34:12 -0400
Received: by mail-pg1-x52a.google.com with SMTP id 206so3389667pgb.0;
 Sat, 30 Jul 2022 18:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0LlphKAwfG3dVbupznqUe/EEtjtLfUKYJY5w5nWI91Q=;
 b=f1NpuWII/6yJq/TTPduahT4TeLQvseGQm3/R//j7CCLi7IsCiDG8jLzhPEd16ko0Uy
 3p8xhohysSX60P/0Vw3X77y+JLEG9o++w22hSUgJSX5/0j9cE1PcC3m2ZH3Ie2hKDnvG
 2VXm/gWpWTpBIisNiALcuvEGNZfDOOcN+kCkTjDDfo8MZxQ+TK0411mBNTz2n16yYBfk
 r+QKyVrpf7QW+xlAr50/bZwVRLvRmThrCTEFFJXsYdvDjV+UJfYOWmJwYnKRjeexA66s
 PWBsHTxJP/jLA5fMnmjG2pHC5H0RiicEfVb0fwC0K8CQRvG+V9ZXU13NkQWqDifDjcyS
 eipA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0LlphKAwfG3dVbupznqUe/EEtjtLfUKYJY5w5nWI91Q=;
 b=bx6Xt0LfSADJq+jD1rA8at2czvzbR61je5HvjjSjQOx7ZoK3RRt34/5t4kObq1xMEM
 9lwakHa39qRDJDpgM4XCYF/44eOnnByfk+1X2JEXtwVmGE0uFG2YUK+8Rgg2sdwiRHTP
 CbLz3+raQltqgzofrBeZnCtbR8PMVuVL2YUQ+dz2bvlLJN2tYRDPl+vHIDHwvE8bWiOF
 qe/1EqdmPW3w+i0gLQRRPZkTCJmy8CFSlGDFjeYSzZa6wxuMcI4izNI5XXK6gEPWTmaA
 xrxAdMnvQqTJBNYEqAGSaGlzi8EYx6R1IgagoItbAeZMgmQki2zs8HKXwxeCLaqDUiPQ
 TaBQ==
X-Gm-Message-State: AJIora971vPuRmAUF2tpehPsFn5vaNBHXJTLACxhzW7xA06FuocNJlHC
 aUqB+t+k88CtEq8GQLRF7YU=
X-Google-Smtp-Source: AGRyM1ttwb0/PlEfWGVYQgJ4qD9eHcMBzfbQTtO/yjRApxHsjNPXgPIeC7wr0hfwfYyN3gpXMazY2A==
X-Received: by 2002:a63:211b:0:b0:41b:8f73:576d with SMTP id
 h27-20020a63211b000000b0041b8f73576dmr7861688pgh.106.1659231248318; 
 Sat, 30 Jul 2022 18:34:08 -0700 (PDT)
Received: from bobo.ibm.com (193-116-97-43.tpgi.com.au. [193.116.97.43])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a170903234a00b0016da9128169sm6483188plh.130.2022.07.30.18.34.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Jul 2022 18:34:07 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: Nicholas Piggin <npiggin@gmail.com>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: [PATCH v4] target/ppc: Fix host PVR matching for KVM
Date: Sun, 31 Jul 2022 11:33:58 +1000
Message-Id: <20220731013358.170187-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=npiggin@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ppc_cpu_compare_class_pvr_mask() should match the best CPU class in the
family, because it is used by the KVM subsystem to find the host CPU
class. Since commit 03ae4133ab8 ("target-ppc: Add pvr_match()
callback"), it matches any class in the family (the first one in the
comparison list).

Since commit f30c843ced5 ("ppc/pnv: Introduce PowerNV machines with
fixed CPU models"), pnv has relied on pnv_match having these new
semantics to check machine compatibility with a CPU family.

Resolve this by adding a parameter to the pvr_match function to select
the best or any match, and restore the old behaviour for the KVM case.

Prior to this fix, e.g., a POWER9 DD2.3 KVM host matches to the
power9_v1.0 class (because that happens to be the first POWER9 family
CPU compared). After the patch, it matches the power9_v2.0 class.

This approach requires pnv_match contain knowledge of the CPU classes
implemented in the same family, which feels ugly. But pushing the 'best'
match down to the class would still require they know about one another
which is not obviously much better. For now this gets things working.

Fixes: 03ae4133ab8 ("target-ppc: Add pvr_match() callback")
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---

This is extracted from patch 1 in the series here:

https://lists.gnu.org/archive/html/qemu-ppc/2022-03/msg00226.html

I finally went back and worked out what the issue was, which is the
new usage of pvr_match that pnv has. That should now be fixed.

Thanks,
Nick

 hw/ppc/pnv.c          |  2 +-
 target/ppc/cpu-qom.h  |  6 ++-
 target/ppc/cpu_init.c | 91 +++++++++++++++++++++++++++++++++----------
 target/ppc/machine.c  |  2 +-
 4 files changed, 77 insertions(+), 24 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index d3f77c8367..a4cb4cf10b 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -714,7 +714,7 @@ static bool pnv_match_cpu(const char *default_type, const char *cpu_type)
     PowerPCCPUClass *ppc =
         POWERPC_CPU_CLASS(object_class_by_name(cpu_type));
 
-    return ppc_default->pvr_match(ppc_default, ppc->pvr);
+    return ppc_default->pvr_match(ppc_default, ppc->pvr, false);
 }
 
 static void pnv_ipmi_bt_init(ISABus *bus, IPMIBmc *bmc, uint32_t irq)
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index ad7e3c3db9..89ff88f28c 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -158,7 +158,11 @@ struct PowerPCCPUClass {
     void (*parent_parse_features)(const char *type, char *str, Error **errp);
 
     uint32_t pvr;
-    bool (*pvr_match)(struct PowerPCCPUClass *pcc, uint32_t pvr);
+    /*
+     * If @best is false, match if pcc is in the family of pvr
+     * Else match only if pcc is the best match for pvr in this family.
+     */
+    bool (*pvr_match)(struct PowerPCCPUClass *pcc, uint32_t pvr, bool best);
     uint64_t pcr_mask;          /* Available bits in PCR register */
     uint64_t pcr_supported;     /* Bits for supported PowerISA versions */
     uint32_t svr;
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index d1493a660c..899c4a586e 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5912,15 +5912,25 @@ static void init_proc_POWER7(CPUPPCState *env)
     ppcPOWER7_irq_init(env_archcpu(env));
 }
 
-static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr)
+static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
 {
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER7P_BASE) {
-        return true;
+    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
+    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
+
+    if (!best) {
+        if (base == CPU_POWERPC_POWER7_BASE) {
+            return true;
+        }
+        if (base == CPU_POWERPC_POWER7P_BASE) {
+            return true;
+        }
     }
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER7_BASE) {
-        return true;
+
+    if (base != pcc_base) {
+        return false;
     }
-    return false;
+
+    return true;
 }
 
 static bool cpu_has_work_POWER7(CPUState *cs)
@@ -6073,18 +6083,27 @@ static void init_proc_POWER8(CPUPPCState *env)
     ppcPOWER7_irq_init(env_archcpu(env));
 }
 
-static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr)
+static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
 {
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8NVL_BASE) {
-        return true;
-    }
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8E_BASE) {
-        return true;
+    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
+    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
+
+    if (!best) {
+        if (base == CPU_POWERPC_POWER8_BASE) {
+            return true;
+        }
+        if (base == CPU_POWERPC_POWER8E_BASE) {
+            return true;
+        }
+        if (base == CPU_POWERPC_POWER8NVL_BASE) {
+            return true;
+        }
     }
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER8_BASE) {
-        return true;
+    if (base != pcc_base) {
+        return false;
     }
-    return false;
+
+    return true;
 }
 
 static bool cpu_has_work_POWER8(CPUState *cs)
@@ -6282,11 +6301,26 @@ static void init_proc_POWER9(CPUPPCState *env)
     ppcPOWER9_irq_init(env_archcpu(env));
 }
 
-static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr)
+static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
 {
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER9_BASE) {
+    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
+    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
+
+    if (!best) {
+        if (base == CPU_POWERPC_POWER9_BASE) {
+            return true;
+        }
+    }
+
+    if (base != pcc_base) {
+        return false;
+    }
+
+    if ((pvr & 0x0f00) == (pcc->pvr & 0x0f00)) {
+        /* Major DD version matches to power9_v1.0 and power9_v2.0 */
         return true;
     }
+
     return false;
 }
 
@@ -6499,11 +6533,26 @@ static void init_proc_POWER10(CPUPPCState *env)
     ppcPOWER9_irq_init(env_archcpu(env));
 }
 
-static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr)
+static bool ppc_pvr_match_power10(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
 {
-    if ((pvr & CPU_POWERPC_POWER_SERVER_MASK) == CPU_POWERPC_POWER10_BASE) {
+    uint32_t base = pvr & CPU_POWERPC_POWER_SERVER_MASK;
+    uint32_t pcc_base = pcc->pvr & CPU_POWERPC_POWER_SERVER_MASK;
+
+    if (!best) {
+        if (base == CPU_POWERPC_POWER10_BASE) {
+            return true;
+        }
+    }
+
+    if (base != pcc_base) {
+        return false;
+    }
+
+    if ((pvr & 0x0f00) == (pcc->pvr & 0x0f00)) {
+        /* Major DD version matches to power10_v1.0 and power10_v2.0 */
         return true;
     }
+
     return false;
 }
 
@@ -6910,7 +6959,7 @@ static gint ppc_cpu_compare_class_pvr_mask(gconstpointer a, gconstpointer b)
         return -1;
     }
 
-    if (pcc->pvr_match(pcc, pvr)) {
+    if (pcc->pvr_match(pcc, pvr, true)) {
         return 0;
     }
 
@@ -7308,7 +7357,7 @@ static void ppc_cpu_instance_finalize(Object *obj)
     ppc_hash64_finalize(cpu);
 }
 
-static bool ppc_pvr_match_default(PowerPCCPUClass *pcc, uint32_t pvr)
+static bool ppc_pvr_match_default(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
 {
     return pcc->pvr == pvr;
 }
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index a7d9036c09..be6eb3d968 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -234,7 +234,7 @@ static bool pvr_match(PowerPCCPU *cpu, uint32_t pvr)
     if (pvr == pcc->pvr) {
         return true;
     }
-    return pcc->pvr_match(pcc, pvr);
+    return pcc->pvr_match(pcc, pvr, true);
 }
 
 static int cpu_post_load(void *opaque, int version_id)
-- 
2.35.1


