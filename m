Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEB6136DE34
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 19:24:55 +0200 (CEST)
Received: from localhost ([::1]:58804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbnvi-00060F-QA
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 13:24:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbneA-0001hk-53
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:47 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:40877)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lbne8-0006n4-Et
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 13:06:45 -0400
Received: by mail-wr1-x42d.google.com with SMTP id e5so35183930wrg.7
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 10:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DMCAo+wC8HY/UfjCzg1y7H88VRtuoDpPVZxw1qG03XE=;
 b=CQe0DmiYEbrM84r4S/vW5BpHQiRVKsTHbpzrIMhBSx0fa08ZA9HQQx613iEFc794sy
 5lG5J0Z49W7EKpmPSv3XSN1ebOCXesd0CMMQbd64XR4v+E/TFLtqIbRvFF077YFru4wp
 yZOntwoC5hMQHSS9rpm7RahyRuhE4JWdOrQlmv772/Cnqd0b4mdGhSmzWTgGDXIktnKb
 y0XcliPVwq/uOYbMm/emvkbecuC3h09gW2FfYNswvOgN3C/BIMfQGZoDQqVUK1FO7HzE
 LfKllK0SuAgvLoth4uE0d5rXLc/lXN/mEnu41Gmu1a01Ove6TNgrwCZ3ffQsuH4nGqnC
 NM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DMCAo+wC8HY/UfjCzg1y7H88VRtuoDpPVZxw1qG03XE=;
 b=r59wnuZjQqXfynZRxrHHsbJngv//l5Yr6pWvlmlpqi1xtaOLmH5ttoJEVGC9TVrWSN
 NYvype20EIjMIQWLT6mCTWxdVwvqw74grCNWc5bsemhKnrzyE1NJgL6cPq/QqDCbAAtq
 QVy0Ub4pXed/zmMQu6UU29LXfLI8KsmByrKQvaArQPhfcg/NTNCNXNqEjoZbpwx+HTpb
 M4BD6Z7bek1o/OYyeFs3flCfeZfS3gnwb3GjFmpFdSahHzhXK7ztErqjuZgdJj8l8LxA
 stsxj3fCLIEFF8goIbdD4JMH3z6cqvJGZdCY2R1VeZUJzDwRk+ghDV0b8vtEe+kLGCru
 Hppw==
X-Gm-Message-State: AOAM5331w5DqUtrctcpNSI2H8NH51WCeT6brD1d4JUBnzUy957WuY8NI
 W64UpYP3hst9MMV0hVLA/iIlzcLQrqqsLQ==
X-Google-Smtp-Source: ABdhPJxqnTk4fM0HoNWEYMuAwb//kipq6mv3UU/OLdnK04N/skob3i/hsltnNtn/zQR4xsf6CvKquA==
X-Received: by 2002:adf:e60d:: with SMTP id p13mr27846688wrm.326.1619629603059; 
 Wed, 28 Apr 2021 10:06:43 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id p14sm468189wrx.88.2021.04.28.10.06.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Apr 2021 10:06:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 24/30] target/mips: Move helper_cache() to
 tcg/sysemu/special_helper.c
Date: Wed, 28 Apr 2021 19:04:04 +0200
Message-Id: <20210428170410.479308-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210428170410.479308-1-f4bug@amsat.org>
References: <20210428170410.479308-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move helper_cache() to tcg/sysemu/special_helper.c.

The CACHE opcode is privileged and is not accessible in user
emulation. However we get a link failure when restricting the
symbol to sysemu. For now, add a stub helper to satisfy linking,
which abort if ever called.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v4: qemu_build_not_reached -> g_assert_not_reached (rth)
---
 target/mips/helper.h                    |  2 --
 target/mips/tcg/sysemu_helper.h.inc     |  1 +
 target/mips/op_helper.c                 | 35 -------------------------
 target/mips/tcg/sysemu/special_helper.c | 33 +++++++++++++++++++++++
 target/mips/translate.c                 | 13 +++++++++
 5 files changed, 47 insertions(+), 37 deletions(-)

diff --git a/target/mips/helper.h b/target/mips/helper.h
index 4ee7916d8b2..d49620f9282 100644
--- a/target/mips/helper.h
+++ b/target/mips/helper.h
@@ -614,8 +614,6 @@ DEF_HELPER_FLAGS_3(dmthlip, 0, void, tl, tl, env)
 DEF_HELPER_FLAGS_3(wrdsp, 0, void, tl, tl, env)
 DEF_HELPER_FLAGS_2(rddsp, 0, tl, tl, env)
 
-DEF_HELPER_3(cache, void, env, tl, i32)
-
 #ifndef CONFIG_USER_ONLY
 #include "tcg/sysemu_helper.h.inc"
 #endif /* !CONFIG_USER_ONLY */
diff --git a/target/mips/tcg/sysemu_helper.h.inc b/target/mips/tcg/sysemu_helper.h.inc
index 38e55cbf118..1ccbf687237 100644
--- a/target/mips/tcg/sysemu_helper.h.inc
+++ b/target/mips/tcg/sysemu_helper.h.inc
@@ -173,3 +173,4 @@ DEF_HELPER_1(ei, tl, env)
 DEF_HELPER_1(eret, void, env)
 DEF_HELPER_1(eretnc, void, env)
 DEF_HELPER_1(deret, void, env)
+DEF_HELPER_3(cache, void, env, tl, i32)
diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index a077535194b..a7fe1de8c42 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -788,38 +788,3 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
     }
 }
 #endif /* !CONFIG_USER_ONLY */
-
-void helper_cache(CPUMIPSState *env, target_ulong addr, uint32_t op)
-{
-#ifndef CONFIG_USER_ONLY
-    static const char *const type_name[] = {
-        "Primary Instruction",
-        "Primary Data or Unified Primary",
-        "Tertiary",
-        "Secondary"
-    };
-    uint32_t cache_type = extract32(op, 0, 2);
-    uint32_t cache_operation = extract32(op, 2, 3);
-    target_ulong index = addr & 0x1fffffff;
-
-    switch (cache_operation) {
-    case 0b010: /* Index Store Tag */
-        memory_region_dispatch_write(env->itc_tag, index, env->CP0_TagLo,
-                                     MO_64, MEMTXATTRS_UNSPECIFIED);
-        break;
-    case 0b001: /* Index Load Tag */
-        memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
-                                    MO_64, MEMTXATTRS_UNSPECIFIED);
-        break;
-    case 0b000: /* Index Invalidate */
-    case 0b100: /* Hit Invalidate */
-    case 0b110: /* Hit Writeback */
-        /* no-op */
-        break;
-    default:
-        qemu_log_mask(LOG_UNIMP, "cache operation:%u (type: %s cache)\n",
-                      cache_operation, type_name[cache_type]);
-        break;
-    }
-#endif
-}
diff --git a/target/mips/tcg/sysemu/special_helper.c b/target/mips/tcg/sysemu/special_helper.c
index 971883fa385..2a2afb49e81 100644
--- a/target/mips/tcg/sysemu/special_helper.c
+++ b/target/mips/tcg/sysemu/special_helper.c
@@ -138,3 +138,36 @@ void helper_deret(CPUMIPSState *env)
 
     debug_post_eret(env);
 }
+
+void helper_cache(CPUMIPSState *env, target_ulong addr, uint32_t op)
+{
+    static const char *const type_name[] = {
+        "Primary Instruction",
+        "Primary Data or Unified Primary",
+        "Tertiary",
+        "Secondary"
+    };
+    uint32_t cache_type = extract32(op, 0, 2);
+    uint32_t cache_operation = extract32(op, 2, 3);
+    target_ulong index = addr & 0x1fffffff;
+
+    switch (cache_operation) {
+    case 0b010: /* Index Store Tag */
+        memory_region_dispatch_write(env->itc_tag, index, env->CP0_TagLo,
+                                     MO_64, MEMTXATTRS_UNSPECIFIED);
+        break;
+    case 0b001: /* Index Load Tag */
+        memory_region_dispatch_read(env->itc_tag, index, &env->CP0_TagLo,
+                                    MO_64, MEMTXATTRS_UNSPECIFIED);
+        break;
+    case 0b000: /* Index Invalidate */
+    case 0b100: /* Hit Invalidate */
+    case 0b110: /* Hit Writeback */
+        /* no-op */
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "cache operation:%u (type: %s cache)\n",
+                      cache_operation, type_name[cache_type]);
+        break;
+    }
+}
diff --git a/target/mips/translate.c b/target/mips/translate.c
index f0ae3716022..c03a8ae1fed 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -39,6 +39,19 @@
 #include "fpu_helper.h"
 #include "translate.h"
 
+/*
+ * Many sysemu-only helpers are not reachable for user-only.
+ * Define stub generators here, so that we need not either sprinkle
+ * ifdefs through the translator, nor provide the helper function.
+ */
+#define STUB_HELPER(NAME, ...) \
+    static inline void gen_helper_##NAME(__VA_ARGS__) \
+    { g_assert_not_reached(); }
+
+#ifdef CONFIG_USER_ONLY
+STUB_HELPER(cache, TCGv_env env, TCGv val, TCGv_i32 reg)
+#endif
+
 enum {
     /* indirect opcode tables */
     OPC_SPECIAL  = (0x00 << 26),
-- 
2.26.3


