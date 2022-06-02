Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE8E53C08F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:03:30 +0200 (CEST)
Received: from localhost ([::1]:44034 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwsuf-0007As-4I
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgo-0004en-NQ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:10 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:44705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgk-00005u-EV
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:09 -0400
Received: by mail-pf1-x433.google.com with SMTP id g205so5773136pfb.11
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X907WscUJ/vcZY0rjH59HojFCAmIiYCNZ0u3IiREgKo=;
 b=vpnDYxlYuZYLgYNpIYFkkT24zO6YkyrtA8Gc1rtudDgRGZfMAiBLme/WfIVuCdy/MA
 Bexr6gWCUxz61KB4H71Ijv3dAKTFgmHeEn7nwY12nHBLMiUl3BwZITTUincJ0OIZwHaG
 MzD8Cf0VyIycjteSUUEuwgG8FgITh2Hjb93DuonlFzf4z2m3cLBIoBicgW1O5q6834yh
 qrH6eP2vZv+mvirXdE57/UJvN/Hazqsc4ALeAglWiZfGzApVWTq6RmY/Z4TJGJUQvh2h
 aVJ05WKTtNKNMNWDHZuYIDqXhHzgdmhHMRWChsz4cPej9V5WGBA8FxrsE03tvq0P7AVJ
 gHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X907WscUJ/vcZY0rjH59HojFCAmIiYCNZ0u3IiREgKo=;
 b=CPdyzPDLuBW+QhLalEk888HV3mYKlUGM1lPCR9b83DJczxzwvH31BdHVLQjS1lkibe
 ZizYtbW4xRSQpL7LIkEqoJ+j7Qpb8rnRUkJWJ6jOwKQbI9u067vMacaA9usW4lBxUo35
 FUD+NFBj8hlSYhspZr4qsXndFfL5CVB+QQIYIAa3ImC+8n0tcfOzVVxFtP+AxCdm7IYl
 AcX2xhzF7GKVRg9+HBNjT5k4el04A69XJ///P7maiy5EWcYw/8hTec9VG6vT+OudiJ/q
 XngsxJh86ddg6olh8cR9oU2UUuwX0s1pnAwga0fdNBZq5QQg5VFSwJOIBk39+S8A50BE
 cy8w==
X-Gm-Message-State: AOAM532oT3f2QIg+7aBw9q5TYun7GXHOkIyDpB2pj2PjVlDsXXf9hKs+
 sABFEBP/TsmWf81FUFUy6g5htBubUA8okQ==
X-Google-Smtp-Source: ABdhPJwQ6DBMhl5awfoK4T3GPqjPSSTuCHoHuKle7vsDGM5VQLeJCdsmX994gvesHmCtZItRblwruQ==
X-Received: by 2002:aa7:90d5:0:b0:4e1:307c:d94a with SMTP id
 k21-20020aa790d5000000b004e1307cd94amr7127556pfk.38.1654206545025; 
 Thu, 02 Jun 2022 14:49:05 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 12/71] target/arm: Rename sve_zcr_len_for_el to sve_vqm1_for_el
Date: Thu,  2 Jun 2022 14:47:54 -0700
Message-Id: <20220602214853.496211-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

This will be used for both Normal and Streaming SVE, and the value
does not necessarily come from ZCR_ELx.  While we're at it, emphasize
the units in which the value is returned.

Patch produced by
    git grep -l sve_zcr_len_for_el | \
    xargs -n1 sed -i 's/sve_zcr_len_for_el/sve_vqm1_for_el/g'

and then adding a function comment.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 11 ++++++++++-
 target/arm/arch_dump.c |  2 +-
 target/arm/cpu.c       |  2 +-
 target/arm/gdbstub64.c |  2 +-
 target/arm/helper.c    | 12 ++++++------
 5 files changed, 19 insertions(+), 10 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index ef51c3774e..cb37787c35 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1132,7 +1132,16 @@ void aarch64_sync_64_to_32(CPUARMState *env);
 
 int fp_exception_el(CPUARMState *env, int cur_el);
 int sve_exception_el(CPUARMState *env, int cur_el);
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el);
+
+/**
+ * sve_vqm1_for_el:
+ * @env: CPUARMState
+ * @el: exception level
+ *
+ * Compute the current SVE vector length for @el, in units of
+ * Quadwords Minus 1 -- the same scale used for ZCR_ELx.LEN.
+ */
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el);
 
 static inline bool is_a64(CPUARMState *env)
 {
diff --git a/target/arm/arch_dump.c b/target/arm/arch_dump.c
index 0184845310..b1f040e69f 100644
--- a/target/arm/arch_dump.c
+++ b/target/arm/arch_dump.c
@@ -166,7 +166,7 @@ static off_t sve_fpcr_offset(uint32_t vq)
 
 static uint32_t sve_current_vq(CPUARMState *env)
 {
-    return sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+    return sve_vqm1_for_el(env, arm_current_el(env)) + 1;
 }
 
 static size_t sve_size_vq(uint32_t vq)
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 0621944167..1b5d535788 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -925,7 +925,7 @@ static void aarch64_cpu_dump_state(CPUState *cs, FILE *f, int flags)
                  vfp_get_fpcr(env), vfp_get_fpsr(env));
 
     if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
-        int j, zcr_len = sve_zcr_len_for_el(env, el);
+        int j, zcr_len = sve_vqm1_for_el(env, el);
 
         for (i = 0; i <= FFR_PRED_NUM; i++) {
             bool eol;
diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index 596878666d..07a6746944 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -152,7 +152,7 @@ int arm_gdb_get_svereg(CPUARMState *env, GByteArray *buf, int reg)
          * We report in Vector Granules (VG) which is 64bit in a Z reg
          * while the ZCR works in Vector Quads (VQ) which is 128bit chunks.
          */
-        int vq = sve_zcr_len_for_el(env, arm_current_el(env)) + 1;
+        int vq = sve_vqm1_for_el(env, arm_current_el(env)) + 1;
         return gdb_get_reg64(buf, vq * 2);
     }
     default:
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 7b6f31e9c8..cb44d528c0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -6225,7 +6225,7 @@ int sve_exception_el(CPUARMState *env, int el)
 /*
  * Given that SVE is enabled, return the vector length for EL.
  */
-uint32_t sve_zcr_len_for_el(CPUARMState *env, int el)
+uint32_t sve_vqm1_for_el(CPUARMState *env, int el)
 {
     ARMCPU *cpu = env_archcpu(env);
     uint32_t len = cpu->sve_max_vq - 1;
@@ -6248,7 +6248,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
                       uint64_t value)
 {
     int cur_el = arm_current_el(env);
-    int old_len = sve_zcr_len_for_el(env, cur_el);
+    int old_len = sve_vqm1_for_el(env, cur_el);
     int new_len;
 
     /* Bits other than [3:0] are RAZ/WI.  */
@@ -6259,7 +6259,7 @@ static void zcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
      * Because we arrived here, we know both FP and SVE are enabled;
      * otherwise we would have trapped access to the ZCR_ELn register.
      */
-    new_len = sve_zcr_len_for_el(env, cur_el);
+    new_len = sve_vqm1_for_el(env, cur_el);
     if (new_len < old_len) {
         aarch64_sve_narrow_vq(env, new_len + 1);
     }
@@ -13683,7 +13683,7 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                 sve_el = 0;
             }
         } else if (sve_el == 0) {
-            DP_TBFLAG_A64(flags, VL, sve_zcr_len_for_el(env, el));
+            DP_TBFLAG_A64(flags, VL, sve_vqm1_for_el(env, el));
         }
         DP_TBFLAG_A64(flags, SVEEXC_EL, sve_el);
     }
@@ -14049,10 +14049,10 @@ void aarch64_sve_change_el(CPUARMState *env, int old_el,
      */
     old_a64 = old_el ? arm_el_is_aa64(env, old_el) : el0_a64;
     old_len = (old_a64 && !sve_exception_el(env, old_el)
-               ? sve_zcr_len_for_el(env, old_el) : 0);
+               ? sve_vqm1_for_el(env, old_el) : 0);
     new_a64 = new_el ? arm_el_is_aa64(env, new_el) : el0_a64;
     new_len = (new_a64 && !sve_exception_el(env, new_el)
-               ? sve_zcr_len_for_el(env, new_el) : 0);
+               ? sve_vqm1_for_el(env, new_el) : 0);
 
     /* When changing vector length, clear inaccessible state.  */
     if (new_len < old_len) {
-- 
2.34.1


