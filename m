Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9BEF678C60
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 01:01:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pK6kD-000860-78; Mon, 23 Jan 2023 19:00:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6kB-0007zc-56
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:00:55 -0500
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pK6k7-0001qY-MF
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 19:00:54 -0500
Received: by mail-pf1-x429.google.com with SMTP id s3so10082576pfd.12
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 16:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QFtg05tnMoQbda+pdmKHzaqxzHXCvc/zyUatL7UKJGo=;
 b=TFJTT63Q32h0RPFn5vpwT6oN4dPiuhk6QriCs8aekolb+D/IpCyfPtXP4GnEA66Zq5
 XHocpe+mrwj0VqEqXJrh2uE8dt05J1LH6MRrpcPXwoB2XoxfNNdC3KqxghH7iK0pNYCC
 +kBh9sRwJI1bMHJ7UQQgW0jNn6EtBoDHt1FeucNjFvOiHBPJtjXSfIsCcfTANdQoqsF3
 V+wwXayNSCIhHJIP+pSIHpmvBLsQElkROKx7xCj5PNPH4XoXF/jkgbGun9gYBR/6Tz3a
 qwKPnlnNpKbhq6vXG7yoUoctNh6sfUVNH+1XxAAgQmAZOQvVs0M4DLsmay09Bs4HmLgn
 pdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QFtg05tnMoQbda+pdmKHzaqxzHXCvc/zyUatL7UKJGo=;
 b=ZAJbfaORJtcyez9vRUcdxfn2rqVpOLbR78lLr+Qm1XCJ9VA0gBpjGyH92GBZGGAyfv
 yrLmvt+kZPAgyLdVzZgEj0CA6lkGqIX1dIN7F4EivihN0C70s9ovodP8rw/fuUMTT9CM
 nVJlGmQAIkYsbuQYbhrGd6URRlxCleYibLzRAX1wJWf0RYH2gp/3IFMXPBaoIzSQ4l/y
 x9fkiw2pJGZqmu9c5mMdAPsYqvor+jBpp+C1VUjNP5DiKICq97cpaDhXqfsaBqRco0qi
 SaMGQN1phvVYVpFLEtDbvSPWd35U97sekHnlyu4Y/bSeCsazr2/gc3RoekXgkQWic5bz
 k2RA==
X-Gm-Message-State: AFqh2koVoqXjXS4rs/NM2dcOxmiIT/vul642sHOjD6WjWAog71JNTBBZ
 e+I54v8VEzrnt4JOHJ/6ESHXTYEW4nLW7QuX
X-Google-Smtp-Source: AMrXdXsPTV8wAL3HB0CDu3ebq2kA2K+f6DQpth8uSUXBIyNYdm/1NhyPxBmBOU8/zxXfLKc51G6JBg==
X-Received: by 2002:aa7:9467:0:b0:58b:aaaa:82a9 with SMTP id
 t7-20020aa79467000000b0058baaaa82a9mr26859532pfq.25.1674518450151; 
 Mon, 23 Jan 2023 16:00:50 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 x21-20020a056a00189500b0058bc37f3d13sm174104pfh.43.2023.01.23.16.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 16:00:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, yier.jin@huawei.com, jonathan.cameron@huawei.com,
 leonardo.garcia@linaro.org
Subject: [PATCH 02/22] target/arm: Rewrite check_s2_mmu_setup
Date: Mon, 23 Jan 2023 14:00:07 -1000
Message-Id: <20230124000027.3565716-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124000027.3565716-1-richard.henderson@linaro.org>
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x429.google.com
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

Integrate neighboring code from get_phys_addr_lpae which computed
starting level, as it is easier to validate when doing both at the
same time.  Mirror the checks at the start of AArch{64,32}.S2Walk,
especially S2InvalidESL and S2InconsistentSL.

This reverts 49ba115bb74, which was incorrect -- there is nothing
in the ARM pseudocode that depends on TxSZ, i.e. outputsize; the
pseudocode is consistent in referencing PAMax.

Fixes: 49ba115bb74 ("target/arm: Pass outputsize down to check_s2_mmu_setup")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 173 ++++++++++++++++++++++++++---------------------
 1 file changed, 97 insertions(+), 76 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index b0f8c59767..437f6fefa9 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -1077,70 +1077,119 @@ static ARMVAParameters aa32_va_parameters(CPUARMState *env, uint32_t va,
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
@@ -1296,38 +1345,10 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
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


