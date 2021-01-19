Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 697F62FBAE5
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 16:18:41 +0100 (CET)
Received: from localhost ([::1]:39724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1smG-0006zb-Fv
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 10:18:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sf2-0007Ku-UT
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:12 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:37755)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l1sey-000188-OR
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 10:11:12 -0500
Received: by mail-wr1-x431.google.com with SMTP id v15so16427976wrx.4
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 07:11:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Bey3G+qdk8F70SMlWfpFjgMA0oumKCDHtiyUSpGRFX0=;
 b=E7n116nAlNrje1gKJ3RD5KGxVyGvP/kXgyquK90uyl+sYsbGjR147sUPlaPgPlQ0an
 s32zcISTI8GMgqJhxu3CaiLrpTEykGh7qx+R12K6p7PNAm56V+XTV0aDlQBArlYENnIc
 nQybOwIrhGjAPYoVtFu6zOF30Of9HxlsafJ5DPZ71dQp9jLn6OUeUStkRPUyOGoUA/+Q
 cPXR01fMi9MshqrK+9ReE5kII4AkLUb6mc4zxdOpfAHr40F8s/BLjIbK3P39UDL8FCBX
 KAJrJFz6I476ZHN7bZIxVQnWpkGkTgLbJwwh7lwuhrnul969HNIS+zLi29OG8LxCgawX
 jFqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bey3G+qdk8F70SMlWfpFjgMA0oumKCDHtiyUSpGRFX0=;
 b=g03kgoanqMvRFFahVym+5nUQUFVQT3lj7gQQedJ1w8HU+rcZVOF4tQyvaTUL/FJn9D
 iwaTCpd7BPZfZu1pCYtp4teyctA8sLnYcfJxAjRgdmQhv8nGEiB6hICR9oDZqj0+QDSV
 aGWSAS4G7hUCBNhJjrUEXTgOCemFpgTdiXiYVzfYJ1dAmofLppMT6bBjilukMkH70nVp
 swfz/zcY84qRtOeMFq68+o+j3dchEXd3N7UgKHVP7SbmS6J65zmD4ApwNUbmRAmI0kLU
 ZnRr4MCXBkNO9t4N+ofy6NiGylQB1TTSM1mGLdQ/w2ySEEyw2FQoH2FWKrtKSJ1V5UaV
 e4CQ==
X-Gm-Message-State: AOAM532FHabAG2K8uNEScI+JUDeUfCh6O/RvzigrXbnoLvtKqlxiYHSA
 PnnhP5kdxSk5lLbmNhFtHHeYinwDzPCZVQ==
X-Google-Smtp-Source: ABdhPJyr7VC4vHuh2YzKQdxwdF9lgGUSLXrBOMtg/tFOxSevdbl5TfpQAmJiIfgK2Csot8zXyI1keA==
X-Received: by 2002:adf:83a6:: with SMTP id 35mr4812174wre.274.1611069067371; 
 Tue, 19 Jan 2021 07:11:07 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id a184sm4843699wme.35.2021.01.19.07.11.06
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 07:11:06 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/33] target/arm: Implement an IMPDEF pauth algorithm
Date: Tue, 19 Jan 2021 15:10:32 +0000
Message-Id: <20210119151104.16264-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210119151104.16264-1-peter.maydell@linaro.org>
References: <20210119151104.16264-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Without hardware acceleration, a cryptographically strong
algorithm is too expensive for pauth_computepac.

Even with hardware accel, we are not currently expecting
to link the linux-user binaries to any crypto libraries,
and doing so would generally make the --static build fail.

So choose XXH64 as a reasonably quick and decent hash.

Tested-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210111235740.462469-2-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/qemu/xxhash.h     | 98 +++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.h          | 15 ++++--
 target/arm/pauth_helper.c | 27 +++++++++--
 3 files changed, 131 insertions(+), 9 deletions(-)

diff --git a/include/qemu/xxhash.h b/include/qemu/xxhash.h
index 076f1f60544..c2dcccadbf7 100644
--- a/include/qemu/xxhash.h
+++ b/include/qemu/xxhash.h
@@ -119,4 +119,102 @@ static inline uint32_t qemu_xxhash6(uint64_t ab, uint64_t cd, uint32_t e,
     return qemu_xxhash7(ab, cd, e, f, 0);
 }
 
+/*
+ * Component parts of the XXH64 algorithm from
+ * https://github.com/Cyan4973/xxHash/blob/v0.8.0/xxhash.h
+ *
+ * The complete algorithm looks like
+ *
+ *  i = 0;
+ *  if (len >= 32) {
+ *      v1 = seed + XXH_PRIME64_1 + XXH_PRIME64_2;
+ *      v2 = seed + XXH_PRIME64_2;
+ *      v3 = seed + 0;
+ *      v4 = seed - XXH_PRIME64_1;
+ *      do {
+ *          v1 = XXH64_round(v1, get64bits(input + i));
+ *          v2 = XXH64_round(v2, get64bits(input + i + 8));
+ *          v3 = XXH64_round(v3, get64bits(input + i + 16));
+ *          v4 = XXH64_round(v4, get64bits(input + i + 24));
+ *      } while ((i += 32) <= len);
+ *      h64 = XXH64_mergerounds(v1, v2, v3, v4);
+ *  } else {
+ *      h64 = seed + XXH_PRIME64_5;
+ *  }
+ *  h64 += len;
+ *
+ *  for (; i + 8 <= len; i += 8) {
+ *      h64 ^= XXH64_round(0, get64bits(input + i));
+ *      h64 = rol64(h64, 27) * XXH_PRIME64_1 + XXH_PRIME64_4;
+ *  }
+ *  for (; i + 4 <= len; i += 4) {
+ *      h64 ^= get32bits(input + i) * PRIME64_1;
+ *      h64 = rol64(h64, 23) * XXH_PRIME64_2 + XXH_PRIME64_3;
+ *  }
+ *  for (; i < len; i += 1) {
+ *      h64 ^= get8bits(input + i) * XXH_PRIME64_5;
+ *      h64 = rol64(h64, 11) * XXH_PRIME64_1;
+ *  }
+ *
+ *  return XXH64_avalanche(h64)
+ *
+ * Exposing the pieces instead allows for simplified usage when
+ * the length is a known constant and the inputs are in registers.
+ */
+#define XXH_PRIME64_1   0x9E3779B185EBCA87ULL
+#define XXH_PRIME64_2   0xC2B2AE3D27D4EB4FULL
+#define XXH_PRIME64_3   0x165667B19E3779F9ULL
+#define XXH_PRIME64_4   0x85EBCA77C2B2AE63ULL
+#define XXH_PRIME64_5   0x27D4EB2F165667C5ULL
+
+static inline uint64_t XXH64_round(uint64_t acc, uint64_t input)
+{
+    return rol64(acc + input * XXH_PRIME64_2, 31) * XXH_PRIME64_1;
+}
+
+static inline uint64_t XXH64_mergeround(uint64_t acc, uint64_t val)
+{
+    return (acc ^ XXH64_round(0, val)) * XXH_PRIME64_1 + XXH_PRIME64_4;
+}
+
+static inline uint64_t XXH64_mergerounds(uint64_t v1, uint64_t v2,
+                                         uint64_t v3, uint64_t v4)
+{
+    uint64_t h64;
+
+    h64 = rol64(v1, 1) + rol64(v2, 7) + rol64(v3, 12) + rol64(v4, 18);
+    h64 = XXH64_mergeround(h64, v1);
+    h64 = XXH64_mergeround(h64, v2);
+    h64 = XXH64_mergeround(h64, v3);
+    h64 = XXH64_mergeround(h64, v4);
+
+    return h64;
+}
+
+static inline uint64_t XXH64_avalanche(uint64_t h64)
+{
+    h64 ^= h64 >> 33;
+    h64 *= XXH_PRIME64_2;
+    h64 ^= h64 >> 29;
+    h64 *= XXH_PRIME64_3;
+    h64 ^= h64 >> 32;
+    return h64;
+}
+
+static inline uint64_t qemu_xxhash64_4(uint64_t a, uint64_t b,
+                                       uint64_t c, uint64_t d)
+{
+    uint64_t v1 = QEMU_XXHASH_SEED + XXH_PRIME64_1 + XXH_PRIME64_2;
+    uint64_t v2 = QEMU_XXHASH_SEED + XXH_PRIME64_2;
+    uint64_t v3 = QEMU_XXHASH_SEED + 0;
+    uint64_t v4 = QEMU_XXHASH_SEED - XXH_PRIME64_1;
+
+    v1 = XXH64_round(v1, a);
+    v2 = XXH64_round(v2, b);
+    v3 = XXH64_round(v3, c);
+    v4 = XXH64_round(v4, d);
+
+    return XXH64_avalanche(XXH64_mergerounds(v1, v2, v3, v4));
+}
+
 #endif /* QEMU_XXHASH_H */
diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 84cc2de3b11..84784070a74 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3918,10 +3918,8 @@ static inline bool isar_feature_aa64_fcma(const ARMISARegisters *id)
 static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
 {
     /*
-     * Note that while QEMU will only implement the architected algorithm
-     * QARMA, and thus APA+GPA, the host cpu for kvm may use implementation
-     * defined algorithms, and thus API+GPI, and this predicate controls
-     * migration of the 128-bit keys.
+     * Return true if any form of pauth is enabled, as this
+     * predicate controls migration of the 128-bit keys.
      */
     return (id->id_aa64isar1 &
             (FIELD_DP64(0, ID_AA64ISAR1, APA, 0xf) |
@@ -3930,6 +3928,15 @@ static inline bool isar_feature_aa64_pauth(const ARMISARegisters *id)
              FIELD_DP64(0, ID_AA64ISAR1, GPI, 0xf))) != 0;
 }
 
+static inline bool isar_feature_aa64_pauth_arch(const ARMISARegisters *id)
+{
+    /*
+     * Return true if pauth is enabled with the architected QARMA algorithm.
+     * QEMU will always set APA+GPA to the same value.
+     */
+    return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, APA) != 0;
+}
+
 static inline bool isar_feature_aa64_sb(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64isar1, ID_AA64ISAR1, SB) != 0;
diff --git a/target/arm/pauth_helper.c b/target/arm/pauth_helper.c
index 564c48faa67..cd6df18150b 100644
--- a/target/arm/pauth_helper.c
+++ b/target/arm/pauth_helper.c
@@ -24,6 +24,7 @@
 #include "exec/cpu_ldst.h"
 #include "exec/helper-proto.h"
 #include "tcg/tcg-gvec-desc.h"
+#include "qemu/xxhash.h"
 
 
 static uint64_t pac_cell_shuffle(uint64_t i)
@@ -207,8 +208,8 @@ static uint64_t tweak_inv_shuffle(uint64_t i)
     return o;
 }
 
-static uint64_t pauth_computepac(uint64_t data, uint64_t modifier,
-                                 ARMPACKey key)
+static uint64_t pauth_computepac_architected(uint64_t data, uint64_t modifier,
+                                             ARMPACKey key)
 {
     static const uint64_t RC[5] = {
         0x0000000000000000ull,
@@ -272,6 +273,22 @@ static uint64_t pauth_computepac(uint64_t data, uint64_t modifier,
     return workingval;
 }
 
+static uint64_t pauth_computepac_impdef(uint64_t data, uint64_t modifier,
+                                        ARMPACKey key)
+{
+    return qemu_xxhash64_4(data, modifier, key.lo, key.hi);
+}
+
+static uint64_t pauth_computepac(CPUARMState *env, uint64_t data,
+                                 uint64_t modifier, ARMPACKey key)
+{
+    if (cpu_isar_feature(aa64_pauth_arch, env_archcpu(env))) {
+        return pauth_computepac_architected(data, modifier, key);
+    } else {
+        return pauth_computepac_impdef(data, modifier, key);
+    }
+}
+
 static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
                              ARMPACKey *key, bool data)
 {
@@ -292,7 +309,7 @@ static uint64_t pauth_addpac(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     bot_bit = 64 - param.tsz;
     ext_ptr = deposit64(ptr, bot_bit, top_bit - bot_bit, ext);
 
-    pac = pauth_computepac(ext_ptr, modifier, *key);
+    pac = pauth_computepac(env, ext_ptr, modifier, *key);
 
     /*
      * Check if the ptr has good extension bits and corrupt the
@@ -341,7 +358,7 @@ static uint64_t pauth_auth(CPUARMState *env, uint64_t ptr, uint64_t modifier,
     uint64_t pac, orig_ptr, test;
 
     orig_ptr = pauth_original_ptr(ptr, param);
-    pac = pauth_computepac(orig_ptr, modifier, *key);
+    pac = pauth_computepac(env, orig_ptr, modifier, *key);
     bot_bit = 64 - param.tsz;
     top_bit = 64 - 8 * param.tbi;
 
@@ -442,7 +459,7 @@ uint64_t HELPER(pacga)(CPUARMState *env, uint64_t x, uint64_t y)
     uint64_t pac;
 
     pauth_check_trap(env, arm_current_el(env), GETPC());
-    pac = pauth_computepac(x, y, env->keys.apga);
+    pac = pauth_computepac(env, x, y, env->keys.apga);
 
     return pac & 0xffffffff00000000ull;
 }
-- 
2.20.1


