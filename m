Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3C86AC59A
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 16:37:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZCrZ-0004G1-6Y; Mon, 06 Mar 2023 10:34:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrW-0004BD-KI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:54 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pZCrU-0002CN-LD
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 10:34:54 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 d41-20020a05600c4c2900b003e9e066550fso5432713wmp.4
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 07:34:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678116891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=oM4iaq8anTSh1Jn8Mdn2lpnjy/er2PGT5FuI/Av5T4w=;
 b=DTlBZTk5H+x4iQnizfBciUiEbzN6320886uNX/vksW0KWaUBrfhH6ofk1nYCefxrq9
 tKYt0jwD2WpKW+owsO465cW73fB50wq+q0VagklvHVDelySRJccKOZl8f3RL0KVm+cBv
 E4dNuRNca+R9AYrk9h5G2WG50wBBeMGRt/oileqceH8NtpSIKknvOm/uXYpAfo+8i6Xv
 YGGM4vEa63LG7fHC8wx0fGj/EU06/Kc9fTp8tiL4RuAQrCfyZ6Lu35iHiq4dmMhW4IGP
 FSqlWiAEsreB6KduzeNTTqIaghqDtyU1+1U54xSQxNqaaIbhjjxo+880lNyvP7Wr3NLp
 JSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678116891;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oM4iaq8anTSh1Jn8Mdn2lpnjy/er2PGT5FuI/Av5T4w=;
 b=ks6eesXgFWH6Q1aB/j16lPpG14e0P3RbU6XCIPOGEEs4oaLT0vqRw4N+B3E0OzttYf
 J+PQBkIahEtiAHg8oEcvyjrmhxEDPviYhcpyFJmflMMZAi0iLwVBhib86lGHJvIHzpV0
 pgtpYKYGv8Bd8/Pz5YDkFBPtAgChRAcOv5dEWH+TwjY4sPj9YFAfl/V+noQmaho9mzaw
 HznipCvOU5/bEJfWj2WV2mR1Lj2xpPTLU4cdUkv4hKw+JIQymov/80f63W/XV17VN9Mn
 lCl0+aoyPYmYA3u9AJNkTl6mmbyt6eKxTPowBSWscgpqU6Ao7I/hS0Ypu+gLcACgFQKl
 HwnQ==
X-Gm-Message-State: AO0yUKWCbkpy3QsTsdbRBWb8Kjn0FYP+8jH8yvlYaYB7sHz3GiKTzpp3
 o6XXDlmnS1tdLUuRR6FYIIr+FEKNTPMkS1GzF4c=
X-Google-Smtp-Source: AK7set9AvSyzH0CIREuEjFr2/XO1el1KJWIDk2uJUTm+8A4O2p69gwP22cuzAewn9HMN6ufiNPmwVA==
X-Received: by 2002:a05:600c:1d09:b0:3eb:3945:d3f4 with SMTP id
 l9-20020a05600c1d0900b003eb3945d3f4mr10317302wms.2.1678116891346; 
 Mon, 06 Mar 2023 07:34:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a05600c444700b003eb0d6f48f3sm15287432wmn.27.2023.03.06.07.34.50
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 07:34:50 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/21] target/arm: Rewrite check_s2_mmu_setup
Date: Mon,  6 Mar 2023 15:34:32 +0000
Message-Id: <20230306153435.490894-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306153435.490894-1-peter.maydell@linaro.org>
References: <20230306153435.490894-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Richard Henderson <richard.henderson@linaro.org>

Integrate neighboring code from get_phys_addr_lpae which computed
starting level, as it is easier to validate when doing both at the
same time.  Mirror the checks at the start of AArch{64,32}.S2Walk,
especially S2InvalidSL and S2InconsistentSL.

This reverts 49ba115bb74, which was incorrect -- there is nothing
in the ARM pseudocode that depends on TxSZ, i.e. outputsize; the
pseudocode is consistent in referencing PAMax.

Fixes: 49ba115bb74 ("target/arm: Pass outputsize down to check_s2_mmu_setup")
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230227225832.816605-5-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/ptw.c | 173 ++++++++++++++++++++++++++---------------------
 1 file changed, 97 insertions(+), 76 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index 8541ef56d61..ec3f51782aa 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1081,70 +1081,119 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
  * check_s2_mmu_setup
  * @cpu:        ARMCPU
  * @is_aa64:    True if the translation regime is in AArch64 state
- * @startlevel: Suggested starting level
- * @inputsize:  Bitsize of IPAs
+ * @tcr:        VTCR_EL2 or VSTCR_EL2
+ * @ds:         Effective value of TCR.DS.
+ * @iasize:     Bitsize of IPAs
  * @stride:     Page-table stride (See the ARM ARM)
  *
- * Returns true if the suggested S2 translation parameters are OK and
- * false otherwise.
+ * Decode the starting level of the S2 lookup, returning INT_MIN if
+ * the configuration is invalid.
  */
-static bool check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, int level,
-                               int inputsize, int stride, int outputsize)
+static int check_s2_mmu_setup(ARMCPU *cpu, bool is_aa64, uint64_t tcr,
+                              bool ds, int iasize, int stride)
 {
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
+    int sl0, sl2, startlevel, granulebits, levels;
+    int s1_min_iasize, s1_max_iasize;
 
+    sl0 = extract32(tcr, 6, 2);
     if (is_aa64) {
+        /*
+         * AArch64.S2InvalidTxSZ: While we checked tsz_oob near the top of
+         * get_phys_addr_lpae, that used aa64_va_parameters which apply
+         * to aarch64.  If Stage1 is aarch32, the min_txsz is larger.
+         * See AArch64.S2MinTxSZ, where min_tsz is 24, translated to
+         * inputsize is 64 - 24 = 40.
+         */
+        if (iasize < 40 && !arm_el_is_aa64(&cpu->env, 1)) {
+            goto fail;
+        }
+
+        /*
+         * AArch64.S2InvalidSL: Interpretation of SL depends on the page size,
+         * so interleave AArch64.S2StartLevel.
+         */
         switch (stride) {
-        case 13: /* 64KB Pages.  */
-            if (level == 0 || (level == 1 && outputsize <= 42)) {
-                return false;
+        case 9: /* 4KB */
+            /* SL2 is RES0 unless DS=1 & 4KB granule. */
+            sl2 = extract64(tcr, 33, 1);
+            if (ds && sl2) {
+                if (sl0 != 0) {
+                    goto fail;
+                }
+                startlevel = -1;
+            } else {
+                startlevel = 2 - sl0;
+                switch (sl0) {
+                case 2:
+                    if (arm_pamax(cpu) < 44) {
+                        goto fail;
+                    }
+                    break;
+                case 3:
+                    if (!cpu_isar_feature(aa64_st, cpu)) {
+                        goto fail;
+                    }
+                    startlevel = 3;
+                    break;
+                }
             }
             break;
-        case 11: /* 16KB Pages.  */
-            if (level == 0 || (level == 1 && outputsize <= 40)) {
-                return false;
+        case 11: /* 16KB */
+            switch (sl0) {
+            case 2:
+                if (arm_pamax(cpu) < 42) {
+                    goto fail;
+                }
+                break;
+            case 3:
+                if (!ds) {
+                    goto fail;
+                }
+                break;
             }
+            startlevel = 3 - sl0;
             break;
-        case 9: /* 4KB Pages.  */
-            if (level == 0 && outputsize <= 42) {
-                return false;
+        case 13: /* 64KB */
+            switch (sl0) {
+            case 2:
+                if (arm_pamax(cpu) < 44) {
+                    goto fail;
+                }
+                break;
+            case 3:
+                goto fail;
             }
+            startlevel = 3 - sl0;
             break;
         default:
             g_assert_not_reached();
         }
-
-        /* Inputsize checks.  */
-        if (inputsize > outputsize &&
-            (arm_el_is_aa64(&cpu->env, 1) || inputsize > 40)) {
-            /* This is CONSTRAINED UNPREDICTABLE and we choose to fault.  */
-            return false;
-        }
     } else {
-        /* AArch32 only supports 4KB pages. Assert on that.  */
+        /*
+         * Things are simpler for AArch32 EL2, with only 4k pages.
+         * There is no separate S2InvalidSL function, but AArch32.S2Walk
+         * begins with walkparms.sl0 in {'1x'}.
+         */
         assert(stride == 9);
-
-        if (level == 0) {
-            return false;
+        if (sl0 >= 2) {
+            goto fail;
         }
+        startlevel = 2 - sl0;
     }
-    return true;
+
+    /* AArch{64,32}.S2InconsistentSL are functionally equivalent.  */
+    levels = 3 - startlevel;
+    granulebits = stride + 3;
+
+    s1_min_iasize = levels * stride + granulebits + 1;
+    s1_max_iasize = s1_min_iasize + (stride - 1) + 4;
+
+    if (iasize >= s1_min_iasize && iasize <= s1_max_iasize) {
+        return startlevel;
+    }
+
+ fail:
+    return INT_MIN;
 }
 
 /**
@@ -1300,38 +1349,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
          */
         level = 4 - (inputsize - 4) / stride;
     } else {
-        /*
-         * For stage 2 translations the starting level is specified by the
-         * VTCR_EL2.SL0 field (whose interpretation depends on the page size)
-         */
-        uint32_t sl0 = extract32(tcr, 6, 2);
-        uint32_t sl2 = extract64(tcr, 33, 1);
-        int32_t startlevel;
-        bool ok;
-
-        /* SL2 is RES0 unless DS=1 & 4kb granule. */
-        if (param.ds && stride == 9 && sl2) {
-            if (sl0 != 0) {
-                level = 0;
-                goto do_translation_fault;
-            }
-            startlevel = -1;
-        } else if (!aarch64 || stride == 9) {
-            /* AArch32 or 4KB pages */
-            startlevel = 2 - sl0;
-
-            if (cpu_isar_feature(aa64_st, cpu)) {
-                startlevel &= 3;
-            }
-        } else {
-            /* 16KB or 64KB pages */
-            startlevel = 3 - sl0;
-        }
-
-        /* Check that the starting level is valid. */
-        ok = check_s2_mmu_setup(cpu, aarch64, startlevel,
-                                inputsize, stride, outputsize);
-        if (!ok) {
+        int startlevel = check_s2_mmu_setup(cpu, aarch64, tcr, param.ds,
+                                            inputsize, stride);
+        if (startlevel == INT_MIN) {
+            level = 0;
             goto do_translation_fault;
         }
         level = startlevel;
-- 
2.34.1


