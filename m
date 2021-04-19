Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23FF364BEC
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 22:49:03 +0200 (CEST)
Received: from localhost ([::1]:34538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYapK-0001mA-Ni
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 16:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQN-0006x7-SS
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:15 -0400
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29]:41790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYaQL-0002S9-A1
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 16:23:15 -0400
Received: by mail-qv1-xf29.google.com with SMTP id gv2so8246685qvb.8
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 13:23:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uYiRAnSfwVHdllJLvSqBfEkQEHsgdmkBoFxU3uRnYcI=;
 b=bvCVDXAWOdC5rLijtozLfoFqI1dfEZqgrQPah8jDXpcmyVT6iOg3e7fV1BpeaK8+Iu
 T+cJK9ejy+SpJU8QFFnP6Riah++JwWIQ0NK1xPVvVysYzGgvv7RY5qcd4ImoRcLkgE+P
 mRg8nHJoAUxbb//6NIjwmYquy2xUQOsof3ouTi26tP3utLXs2TKBg1F+ry2+4IgpodaV
 UUVs9STzjUvEZRzqPiIVuwcdpmAxYU/QnyShd0/Geu7mKVqLFqYOAIzbREPHippYAvua
 nF7h7YYKSuicEfHsdoxRPlZn8GVHaNCbHu+mkK1mDhAkoJ+Gb0zt/JxnNvNLQON36bs9
 0/9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uYiRAnSfwVHdllJLvSqBfEkQEHsgdmkBoFxU3uRnYcI=;
 b=csr9wUzswwruA3nfc5bcGeL/gOq8nroeBykiDo1YWBvu9yD8cDSrHZgUiWtPgAQZ0W
 bCntO3m4YLse4j6nxpRC8bcBFRq1KVwUMcmQlw0CVCWVDCqAezLds8lwWhG1XA5esQs+
 aDWSfBOiGY/h5D+dEe1pZaMM0V44479KCloIxWtNMijqyYo2VvRYlZsDYg1xdKfQcgsf
 uHdjt3wYQaUknFqFO9NTinO94DdDmCkcC4a94XT0HhSAQa5JQ2wjrqca/7AiRUHFl75O
 dCgW2RXjsQz+3PtWrM2B323iWnkKz37k1MDsNPNgfOfql8lzgWrPd9fvs8KHJcoAhD4a
 APdw==
X-Gm-Message-State: AOAM5339PN09SDSJdBTcJ0z4owR2KyrWLLZr3PDH83MTwKtbVcrG7NzN
 kBvy2Kf69j0Kki/vCYLvxfK8fkUuPhxpycej
X-Google-Smtp-Source: ABdhPJxRyFUFQxqjqxkBFiIT/VWplcFdBMkXMfjJSB6rUwycOW7MII5aNcSzvWqmpEqzToTlDvRJjQ==
X-Received: by 2002:a05:6214:3eb:: with SMTP id
 cf11mr23722076qvb.37.1618863792304; 
 Mon, 19 Apr 2021 13:23:12 -0700 (PDT)
Received: from localhost.localdomain ([2607:fb90:80c7:aba4:3594:91a:8889:c77a])
 by smtp.gmail.com with ESMTPSA id c23sm10007835qtm.46.2021.04.19.13.23.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 13:23:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 06/31] target/arm: Move mode specific TB flags to
 tb->cs_base
Date: Mon, 19 Apr 2021 13:22:32 -0700
Message-Id: <20210419202257.161730-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210419202257.161730-1-richard.henderson@linaro.org>
References: <20210419202257.161730-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f29;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have all of the proper macros defined, expanding
the CPUARMTBFlags structure and populating the two TB fields
is relatively simple.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v5: Adjust assert_hflags_rebuild_correctly.
---
 target/arm/cpu.h       | 49 ++++++++++++++++++++++++------------------
 target/arm/translate.h |  2 +-
 target/arm/helper.c    | 10 +++++----
 3 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 79af9a7c62..a8da7c55a6 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -228,6 +228,7 @@ typedef struct ARMPACKey {
 /* See the commentary above the TBFLAG field definitions.  */
 typedef struct CPUARMTBFlags {
     uint32_t flags;
+    target_ulong flags2;
 } CPUARMTBFlags;
 
 typedef struct CPUARMState {
@@ -3381,20 +3382,26 @@ typedef ARMCPU ArchCPU;
 #include "exec/cpu-all.h"
 
 /*
- * Bit usage in the TB flags field: bit 31 indicates whether we are
- * in 32 or 64 bit mode. The meaning of the other bits depends on that.
- * We put flags which are shared between 32 and 64 bit mode at the top
- * of the word, and flags which apply to only one mode at the bottom.
+ * We have more than 32-bits worth of state per TB, so we split the data
+ * between tb->flags and tb->cs_base, which is otherwise unused for ARM.
+ * We collect these two parts in CPUARMTBFlags where they are named
+ * flags and flags2 respectively.
  *
- *  31          20    18    14          9              0
- * +--------------+-----+-----+----------+--------------+
- * |              |     |   TBFLAG_A32   |              |
- * |              |     +-----+----------+  TBFLAG_AM32 |
- * |  TBFLAG_ANY  |           |TBFLAG_M32|              |
- * |              +-----------+----------+--------------|
- * |              |            TBFLAG_A64               |
- * +--------------+-------------------------------------+
- *  31          20                                     0
+ * The flags that are shared between all execution modes, TBFLAG_ANY,
+ * are stored in flags.  The flags that are specific to a given mode
+ * are stores in flags2.  Since cs_base is sized on the configured
+ * address size, flags2 always has 64-bits for A64, and a minimum of
+ * 32-bits for A32 and M32.
+ *
+ * The bits for 32-bit A-profile and M-profile partially overlap:
+ *
+ *  18             9              0
+ * +----------------+--------------+
+ * |   TBFLAG_A32   |              |
+ * +-----+----------+  TBFLAG_AM32 |
+ * |     |TBFLAG_M32|              |
+ * +-----+----------+--------------+
+ *     14          9              0
  *
  * Unless otherwise noted, these bits are cached in env->hflags.
  */
@@ -3472,19 +3479,19 @@ FIELD(TBFLAG_A64, MTE0_ACTIVE, 19, 1)
 #define DP_TBFLAG_ANY(DST, WHICH, VAL) \
     (DST.flags = FIELD_DP32(DST.flags, TBFLAG_ANY, WHICH, VAL))
 #define DP_TBFLAG_A64(DST, WHICH, VAL) \
-    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_A64, WHICH, VAL))
+    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_A64, WHICH, VAL))
 #define DP_TBFLAG_A32(DST, WHICH, VAL) \
-    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_A32, WHICH, VAL))
+    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_A32, WHICH, VAL))
 #define DP_TBFLAG_M32(DST, WHICH, VAL) \
-    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_M32, WHICH, VAL))
+    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_M32, WHICH, VAL))
 #define DP_TBFLAG_AM32(DST, WHICH, VAL) \
-    (DST.flags = FIELD_DP32(DST.flags, TBFLAG_AM32, WHICH, VAL))
+    (DST.flags2 = FIELD_DP32(DST.flags2, TBFLAG_AM32, WHICH, VAL))
 
 #define EX_TBFLAG_ANY(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_ANY, WHICH)
-#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_A64, WHICH)
-#define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_A32, WHICH)
-#define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32(IN.flags, TBFLAG_M32, WHICH)
-#define EX_TBFLAG_AM32(IN, WHICH)  FIELD_EX32(IN.flags, TBFLAG_AM32, WHICH)
+#define EX_TBFLAG_A64(IN, WHICH)   FIELD_EX32(IN.flags2, TBFLAG_A64, WHICH)
+#define EX_TBFLAG_A32(IN, WHICH)   FIELD_EX32(IN.flags2, TBFLAG_A32, WHICH)
+#define EX_TBFLAG_M32(IN, WHICH)   FIELD_EX32(IN.flags2, TBFLAG_M32, WHICH)
+#define EX_TBFLAG_AM32(IN, WHICH)  FIELD_EX32(IN.flags2, TBFLAG_AM32, WHICH)
 
 /**
  * cpu_mmu_index:
diff --git a/target/arm/translate.h b/target/arm/translate.h
index f30287e554..50c2aba066 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -402,7 +402,7 @@ typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, MemOp);
  */
 static inline CPUARMTBFlags arm_tbflags_from_tb(const TranslationBlock *tb)
 {
-    return (CPUARMTBFlags){ tb->flags };
+    return (CPUARMTBFlags){ tb->flags, tb->cs_base };
 }
 
 /*
diff --git a/target/arm/helper.c b/target/arm/helper.c
index f564e59084..4aa7650d3a 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13256,9 +13256,11 @@ static inline void assert_hflags_rebuild_correctly(CPUARMState *env)
     CPUARMTBFlags c = env->hflags;
     CPUARMTBFlags r = rebuild_hflags_internal(env);
 
-    if (unlikely(c.flags != r.flags)) {
-        fprintf(stderr, "TCG hflags mismatch (current:0x%08x rebuilt:0x%08x)\n",
-                c.flags, r.flags);
+    if (unlikely(c.flags != r.flags || c.flags2 != r.flags2)) {
+        fprintf(stderr, "TCG hflags mismatch "
+                        "(current:(0x%08x,0x" TARGET_FMT_lx ")"
+                        " rebuilt:(0x%08x,0x" TARGET_FMT_lx ")\n",
+                c.flags, c.flags2, r.flags, r.flags2);
         abort();
     }
 #endif
@@ -13269,7 +13271,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 {
     CPUARMTBFlags flags;
 
-    *cs_base = 0;
     assert_hflags_rebuild_correctly(env);
     flags = env->hflags;
 
@@ -13338,6 +13339,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     }
 
     *pflags = flags.flags;
+    *cs_base = flags.flags2;
 }
 
 #ifdef TARGET_AARCH64
-- 
2.25.1


