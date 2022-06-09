Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C43544870
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 12:14:28 +0200 (CEST)
Received: from localhost ([::1]:33072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzFBL-0007wq-0r
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 06:14:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39580)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7L-0001Ys-U6
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:18 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:46819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzE7H-0005xd-GH
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 05:06:15 -0400
Received: by mail-wr1-x435.google.com with SMTP id u8so27137707wrm.13
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 02:06:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7iWAmr8aLaBxhjnqmS0IabAjJ74tn9UJA1n63C3136o=;
 b=HNL4ROPLJvjh4JaPHTWCeUuweTRQ81y7PyFIBHd8wx4uAjAR7e8JuBTNbKpZ5Y4sM1
 B/4dZpBRuvmT8LhC8EsqHjb/ebNsHqM3pvSfiswEk0PaQHHt9vYFIhumMcRglNlkFwCS
 80rzdEVa0xIG1NacQAeV2TK+8IWK0trkcpEt7QwYFxBrauGgeY2L9I5fxcaDGnuL7OwV
 STS0II2jv8amtgt6r48vq9Y0AGK3NPpRGCUVDWESqJToqwQckfKKT4L8hOefQmQHU5w8
 lYR9AFPAT/2FbqkqTOPj6hydajpOWmBsNgj4y3609MxIQOn7HNg3X0gXIa49CCx/fsBa
 m7hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7iWAmr8aLaBxhjnqmS0IabAjJ74tn9UJA1n63C3136o=;
 b=Pd8yJRLdVAcReDENDMQzyyC0is3nJERN49fAi1Z330x1xJEu68npVkpJuZ4A0CHlt7
 +fLf+5CJBOoNxnS408bOd/qPDCaG4c0/Tq8Uqpp1cRu4pMqhZeq5zV5SnJ7nyIsPOIqz
 +KjJkupABarHsSjXJeMsOPJTLzep5iWq4QPu8WI5cj9AJg3w/Ft/3f4FsTqMcG5glr/+
 1pErzJajFtI9nA/82/3ueR+6w7WsTxbciTkP/2gDYakKjnyWhotI4BM51r9GVI6GaxCa
 W3/9MOeTFyza4Q9Vbo/DviLJeum2rBLeMyTF3Zvjb4zirfTbjEYuWXKBYLlyskPZTqff
 bu+A==
X-Gm-Message-State: AOAM533CKrpbzijRKLfq209oKLvAuUu6wEKeelbyiT1mTqFD6mqbPTnl
 zOO0FiwOVCQgwWd5nvqWvJ/ZBg3Q9cNEUw==
X-Google-Smtp-Source: ABdhPJzytP9NINA+npM9t6rvut5dZAyplPIogvkB02BqfaUraSwItPFyUWZGZYntU7IXd9pweGQHHw==
X-Received: by 2002:a5d:620b:0:b0:210:11d9:770 with SMTP id
 y11-20020a5d620b000000b0021011d90770mr37270326wru.11.1654765570493; 
 Thu, 09 Jun 2022 02:06:10 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c13-20020adffb0d000000b002183cf9cd69sm11349796wrr.15.2022.06.09.02.06.09
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 02:06:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 27/55] target/arm: Move check_s2_mmu_setup to ptw.c
Date: Thu,  9 Jun 2022 10:05:09 +0100
Message-Id: <20220609090537.1971756-28-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220609090537.1971756-1-peter.maydell@linaro.org>
References: <20220609090537.1971756-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Richard Henderson <richard.henderson@linaro.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220604040607.269301-21-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.h    |  2 --
 target/arm/helper.c | 70 ---------------------------------------------
 target/arm/ptw.c    | 70 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+), 72 deletions(-)

diff --git a/target/arm/ptw.h b/target/arm/ptw.h
index 93147e0b065..a71161b01bd 100644
--- a/target/arm/ptw.h
+++ b/target/arm/ptw.h
@@ -27,8 +27,6 @@ simple_ap_to_rw_prot(CPUARMState *env, ARMMMUIdx mmu_idx, int ap)
 
 ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
                                    ARMMMUIdx mmu_idx);
-bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                        int inputsize, int stride, int outputsize);
 
 #endif /* !CONFIG_USER_ONLY */
 #endif /* TARGET_ARM_PTW_H */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 148eb28ba8c..2526f4c6c4a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10614,76 +10614,6 @@ int simple_ap_to_rw_prot_is_user(int ap, bool is_user)
         g_assert_not_reached();
     }
 }
-
-/*
- * check_s2_mmu_setup
- * @cpu:        ARMCPU
- * @is_aa64:    True if the translation regime is in AArch64 state
- * @startlevel: Suggested starting level
- * @inputsize:  Bitsize of IPAs
- * @stride:     Page-table stride (See the ARM ARM)
- *
- * Returns true if the suggested S2 translation parameters are OK and
- * false otherwise.
- */
-bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                        int inputsize, int stride, int outputsize)
-{
-    const int grainsize = stride + 3;
-    int startsizecheck;
-
-    /*
-     * Negative levels are usually not allowed...
-     * Except for FEAT_LPA2, 4k page table, 52-bit address space, which
-     * begins with level -1.  Note that previous feature tests will have
-     * eliminated this combination if it is not enabled.
-     */
-    if (level < (inputsize == 52 && stride == 9 ? -1 : 0)) {
-        return false;
-    }
-
-    startsizecheck = inputsize - ((3 - level) * stride + grainsize);
-    if (startsizecheck < 1 || startsizecheck > stride + 4) {
-        return false;
-    }
-
-    if (is_aa64) {
-        switch (stride) {
-        case 13: /* 64KB Pages.  */
-            if (level == 0 || (level == 1 && outputsize <= 42)) {
-                return false;
-            }
-            break;
-        case 11: /* 16KB Pages.  */
-            if (level == 0 || (level == 1 && outputsize <= 40)) {
-                return false;
-            }
-            break;
-        case 9: /* 4KB Pages.  */
-            if (level == 0 && outputsize <= 42) {
-                return false;
-            }
-            break;
-        default:
-            g_assert_not_reached();
-        }
-
-        /* Inputsize checks.  */
-        if (inputsize > outputsize &&
-            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
-            /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
-            return false;
-        }
-    } else {
-        /* AArch32 only supports 4KB pages. Assert on that.  */
-        assert(stride == 9);
-
-        if (level == 0) {
-            return false;
-        }
-    }
-    return true;
-}
 #endif /* !CONFIG_USER_ONLY */
 
 int aa64_va_parameter_tbi(uint64_t tcr, ARMMMUIdx mmu_idx)
diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index af9ad420288..525272e99af 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -615,6 +615,76 @@ static int get_S1prot(CPUARMState *env, ARMMMUIdx mmu_idx, bool is_aa64,
     return prot_rw | PAGE_EXEC;
 }
 
+/*
+ * check_s2_mmu_setup
+ * @cpu:        ARMCPU
+ * @is_aa64:    True if the translation regime is in AArch64 state
+ * @startlevel: Suggested starting level
+ * @inputsize:  Bitsize of IPAs
+ * @stride:     Page-table stride (See the ARM ARM)
+ *
+ * Returns true if the suggested S2 translation parameters are OK and
+ * false otherwise.
+ */
+static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
+                               int inputsize, int stride, int outputsize)
+{
+    const int grainsize = stride + 3;
+    int startsizecheck;
+
+    /*
+     * Negative levels are usually not allowed...
+     * Except for FEAT_LPA2, 4k page table, 52-bit address space, which
+     * begins with level -1.  Note that previous feature tests will have
+     * eliminated this combination if it is not enabled.
+     */
+    if (level < (inputsize == 52 && stride == 9 ? -1 : 0)) {
+        return false;
+    }
+
+    startsizecheck = inputsize - ((3 - level) * stride + grainsize);
+    if (startsizecheck < 1 || startsizecheck > stride + 4) {
+        return false;
+    }
+
+    if (is_aa64) {
+        switch (stride) {
+        case 13: /* 64KB Pages.  */
+            if (level == 0 || (level == 1 && outputsize <= 42)) {
+                return false;
+            }
+            break;
+        case 11: /* 16KB Pages.  */
+            if (level == 0 || (level == 1 && outputsize <= 40)) {
+                return false;
+            }
+            break;
+        case 9: /* 4KB Pages.  */
+            if (level == 0 && outputsize <= 42) {
+                return false;
+            }
+            break;
+        default:
+            g_assert_not_reached();
+        }
+
+        /* Inputsize checks.  */
+        if (inputsize > outputsize &&
+            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
+            /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
+            return false;
+        }
+    } else {
+        /* AArch32 only supports 4KB pages. Assert on that.  */
+        assert(stride == 9);
+
+        if (level == 0) {
+            return false;
+        }
+    }
+    return true;
+}
+
 /**
  * get_phys_addr_lpae: perform one stage of page table walk, LPAE format
  *
-- 
2.25.1


