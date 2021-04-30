Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 386A636F8A5
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 12:45:37 +0200 (CEST)
Received: from localhost ([::1]:53904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcQeO-0002rD-7K
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 06:45:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU4-0007ap-Ku
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:56 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lcQU2-0001IS-B4
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 06:34:56 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 26-20020a05600c22dab029013efd7879b8so1486883wmg.0
 for <qemu-devel@nongnu.org>; Fri, 30 Apr 2021 03:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=qxfeJ+r48PTlYS71pSASDOPU4fkG5/jwNghgVWaWz5o=;
 b=at2b9+j7eHeEefirNlASKx9/BDKgrFeVVDF9fQh1WtlMNLRQfXr1tTlT5VYDOYaZ2N
 eZzvWDoVQwTU9/cPZYU5i72cWS8SK9W0u+7Z3nq420Kz+sJ+eulvPQqpgXV6DS9Ez2GB
 Db9Onmh17c+FGiVOFXhU2Bv6uXV9qm1+b8opgUU3ol65yi979cIHXwDGb5KJi3/eZMnS
 Cs1zCUN12JhWYIDLPRoqb7+RPpTe0m5FTLCbBEyU/59858g/Hgw5/FmI+gvdTJojtHYy
 gbEQe09VNw3ZE1fCqTTROrV5g3AavizH3a7zh1aHI+MPKJI/B0w1QbZZlTrBGHNqNf1A
 RYEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qxfeJ+r48PTlYS71pSASDOPU4fkG5/jwNghgVWaWz5o=;
 b=RjFI5hI0HyPaloJLbwevnVFlnkipe0s7yzyLUdXPNROgEAd7LNPEOH0jx4C3mHuMcM
 72rJLjAQPvUdf2wBnlCi3l1FS5H9OF8TgdhNZnEI3sxSit6L1n5SWjknOv8ZwJCdolNK
 K45G8+hrjVyKDsYX4rlhdsskLqnEW1oLDd5bjHQ2qz6fqDyUrEToHGu1SlZINhJZs1mt
 gLv84lAwwwYnFE2G5V3LpIbSzmy5IfzzUFavbvFbn56iVQeLcNERnD8Vtp10lpjcDqjg
 nucB53SKcYILCDzg7yARv3VkBVLt4heCZUv+suhhmIo161R7tsuV68KovovBiGAs5IGT
 r/SQ==
X-Gm-Message-State: AOAM530k9uwjl3fwoMDZ6KGFJ88ZvNN+51BI1/W6NE2h+FZWeJaP1Lho
 chmO41R22LqYbEeVhHCC2V+l6BcIL9oZoK5b
X-Google-Smtp-Source: ABdhPJx9RK6fw8gweCfRD2tz+532PMKSB13AEyo8mcoIWqfVW7IAgKWZTc2S2QLKzGHYysjzwXzIvw==
X-Received: by 2002:a7b:c5c1:: with SMTP id n1mr15598854wmk.83.1619778892792; 
 Fri, 30 Apr 2021 03:34:52 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id 18sm12997817wmo.47.2021.04.30.03.34.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Apr 2021 03:34:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/43] target/arm: Move mode specific TB flags to tb->cs_base
Date: Fri, 30 Apr 2021 11:34:11 +0100
Message-Id: <20210430103437.4140-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210430103437.4140-1-peter.maydell@linaro.org>
References: <20210430103437.4140-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
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

Now that we have all of the proper macros defined, expanding
the CPUARMTBFlags structure and populating the two TB fields
is relatively simple.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210419202257.161730-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h       | 49 ++++++++++++++++++++++++------------------
 target/arm/translate.h |  2 +-
 target/arm/helper.c    | 10 +++++----
 3 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 79af9a7c628..a8da7c55a6b 100644
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
index f30287e5546..50c2aba0667 100644
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
index f564e59084a..4aa7650d3a7 100644
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
2.20.1


