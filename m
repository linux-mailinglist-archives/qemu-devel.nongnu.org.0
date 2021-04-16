Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE56362859
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Apr 2021 21:09:12 +0200 (CEST)
Received: from localhost ([::1]:54352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lXTq3-0004L5-Aq
	for lists+qemu-devel@lfdr.de; Fri, 16 Apr 2021 15:09:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThU-0003Qi-RT
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:22 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:34717)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lXThH-0004Gg-Iz
 for qemu-devel@nongnu.org; Fri, 16 Apr 2021 15:00:20 -0400
Received: by mail-pg1-x533.google.com with SMTP id z16so19807724pga.1
 for <qemu-devel@nongnu.org>; Fri, 16 Apr 2021 12:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=L/RYbqAiFAcdBNCHFx5fvkgfYEDJ6jX69rjW9+yXFZA=;
 b=HA4IRj2bqRw/IZm0L+FQakcyO/pIAfpOjeEdaAbNQymJATjvxxk05+yJjnDqwIMQIe
 vrCLHvHFY5f5lm95QO9FOZOLgkg4XHFGy2oQY4Qa/6fJBF7I7xMKVk3lQC5kssbAOJeM
 hzJeUP4X4jtBGfDze5m5kP7KCBxtK+TgQoaiQqeJsXiXTgEfVIptnc9xGFID0eQNxmgU
 /I1Pf0JiBSZw6ss93NYilbnmeYU9E9EwE+kH/1kjUCv7lbhSdBnxENtrYcw2Ci0FwRiL
 0sLx5z47aGXDa9QYFCimPYt3lVfQYsRpYWeFz/XXjGXvjsDYL5tlAPiALxcP7GuK2YaJ
 s/uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L/RYbqAiFAcdBNCHFx5fvkgfYEDJ6jX69rjW9+yXFZA=;
 b=kqJ5mEpnq2QzemKqy1Eil8Ymun47m0gcC21LOXK2qtEd2N4pbgu1vgq19MuOS8Jnsb
 22fbte4RmVBE4Mk6f1vDByuJiHzoguWhcaZexqMgRt8kNzC3iPypbijRhBHLg01OTlwb
 vWzflwX4Fn5K4OVRHvmQiusS3Wbr+KJc9vGt6Nm7UEmxXVdqwNB6EoN8Yp+FsC+CkLiz
 wLbZlkg1f6iEdB9Hik+tBas3g5ccmVnxE0y/TsOhqPEmuJ1BCARlbAm3L8sM21mew5Ez
 Ha39kkiWwxMwY9/s2UHTQb1A8HPHGkh02+vzs1RalNRFuSVVr7JXFm4y6Rpe5oL0jM6o
 KzyQ==
X-Gm-Message-State: AOAM530/GzZGsPoFC3/dmbXfVIbbJVPjgQ1nTSFwIWz6IbEVozSJ97NZ
 Og+VCyhSsBxHeeA31IBbeIhiGToB7sPG0Q==
X-Google-Smtp-Source: ABdhPJypZ96Whp6u1nVFYr4aqg0QoJOTm5bmm8TbygYmXT0V6w/mrv362cSJezRpOkUH5kTrMCYW3Q==
X-Received: by 2002:a65:4202:: with SMTP id c2mr480869pgq.282.1618599606265;
 Fri, 16 Apr 2021 12:00:06 -0700 (PDT)
Received: from localhost.localdomain ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id d7sm1988337pfv.197.2021.04.16.12.00.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 12:00:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/30] target/arm: Move mode specific TB flags to
 tb->cs_base
Date: Fri, 16 Apr 2021 11:59:35 -0700
Message-Id: <20210416185959.1520974-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210416185959.1520974-1-richard.henderson@linaro.org>
References: <20210416185959.1520974-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that we have all of the proper macros defined, expanding
the CPUARMTBFlags structure and populating the two TB fields
is relatively simple.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h       | 49 ++++++++++++++++++++++++------------------
 target/arm/translate.h |  2 +-
 target/arm/helper.c    |  2 +-
 3 files changed, 30 insertions(+), 23 deletions(-)

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
index 9070b773a9..85b7d6add0 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13271,7 +13271,6 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
 {
     CPUARMTBFlags flags;
 
-    *cs_base = 0;
     assert_hflags_rebuild_correctly(env);
     flags = env->hflags;
 
@@ -13340,6 +13339,7 @@ void cpu_get_tb_cpu_state(CPUARMState *env, target_ulong *pc,
     }
 
     *pflags = flags.flags;
+    *cs_base = flags.flags2;
 }
 
 #ifdef TARGET_AARCH64
-- 
2.25.1


