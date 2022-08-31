Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA62B5A8620
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 20:57:56 +0200 (CEST)
Received: from localhost ([::1]:47462 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTSuR-0003ob-OS
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 14:57:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37214)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSni-0001f2-DI; Wed, 31 Aug 2022 14:50:59 -0400
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34]:36841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oTSng-0007wu-FZ; Wed, 31 Aug 2022 14:50:58 -0400
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11f11d932a8so17868900fac.3; 
 Wed, 31 Aug 2022 11:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=rH1YGZ9eN+Fe6GUWgr5ltiNXy3QFC8xKrs4659x9y3g=;
 b=ER4aBg5M3y8jkeNFBGy471aT4RNytoLD/kznlfV4IiiJ8Mn/b/7GDT4hD4SOPI8Ffw
 SnH3S750If8UmjtwcM5EqtCRvPq2shvdDQAjIYkrxQVV31tL0kjGC5q+rrJCr+wz5tUM
 rT8hGpxYskKolRUbnetvK2LR0bUBZ9cLGrXlFWwASdp98O1eSpISaanlYZwOGpQkVnG/
 xExazRJUr2SJBbm4cs2iyxvORTgcDeE6xmpRT/Cpv9R1qLX4sSQ2zrR2SRp3LnAXYOI6
 6LKndYzquFOLkTXrY9sSBdrImQdvP95SYySzehEZZslgA/J0ME5xnigCW4ShClGb2gch
 15WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=rH1YGZ9eN+Fe6GUWgr5ltiNXy3QFC8xKrs4659x9y3g=;
 b=IZqDNAuZYy1KYPrN/7I0xzqJcMKvMA+3tItw+1jO3nFsoXtBmJzmbtkFriK8J2tZaE
 SVZWfPESjjeT1nY3ck78F9iVpa68bO6H8SFNgiKJsEWMC0VhfauCsSz09TeRYM+2KQIZ
 Yc9ebZl3TJeqLBfuh/AMcJj8vkJ7aRw0PNIcJBgQ07H36HFeDHqwxoNdCrK48aPAfOMt
 5ACqYh9GXLag1UoBxgq3DQQf2TfJNQWBk0Nt8rgZF/n/BFoZ1B9MSmsVljbJcR939q3g
 baT8nGE5BgwoNPnD6JkCjJUDCJWYD78PV/j9YbTc5+ss4aZPY66R0dVxr7wQ1u7pceCS
 MLrw==
X-Gm-Message-State: ACgBeo0ExPgQL8GoZqt6kmy4wGoOU9wI9lm3xVAh1CX3CdgsFJBK2zsq
 fhDvJqf3DllaAYVjzlM++Xlu1KHqBgk=
X-Google-Smtp-Source: AA6agR7bFCcSOuHTCIlBmnyr4cndd7e8dZmtJAKn2s0N9ty7cFPa8QuvTGdWwoKLvz9eOQz03Dx9SQ==
X-Received: by 2002:a05:6870:a446:b0:11e:9189:b25d with SMTP id
 n6-20020a056870a44600b0011e9189b25dmr2282379oal.206.1661971853642; 
 Wed, 31 Aug 2022 11:50:53 -0700 (PDT)
Received: from balboa.COMFAST ([177.189.45.98])
 by smtp.gmail.com with ESMTPSA id
 p4-20020a9d4544000000b0061cbd18bd18sm9599927oti.45.2022.08.31.11.50.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Aug 2022 11:50:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Nicholas Piggin <npiggin@gmail.com>
Subject: [PULL 02/60] target/ppc: Fix host PVR matching for KVM
Date: Wed, 31 Aug 2022 15:49:36 -0300
Message-Id: <20220831185034.23240-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220831185034.23240-1-danielhb413@gmail.com>
References: <20220831185034.23240-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::34;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x34.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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

From: Nicholas Piggin <npiggin@gmail.com>

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
Reviewed-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20220731013358.170187-1-npiggin@gmail.com>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
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
2.37.2


