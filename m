Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D107370DFF
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 18:38:11 +0200 (CEST)
Received: from localhost ([::1]:38922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldF6g-0000qw-Jx
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 12:38:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnU-00073X-Tr
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:21 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:35582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ldEnT-00083h-5T
 for qemu-devel@nongnu.org; Sun, 02 May 2021 12:18:20 -0400
Received: by mail-wr1-x429.google.com with SMTP id a4so3113293wrr.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 09:18:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xccbGy6b98qgbGQkHPDUbNVvkJNRN81dhxs2umRUhSw=;
 b=ecF/9lr+hie3NweRrMMK1MAdXXNnz5upv43OAVFoBENmA5viYY/O/41RgjfdbDWqQP
 0rm6xf3TnGHiF24PbIMcGGVwqEp0Kwq0/UjZnnvoNUPiJENWNZDiLrQAdu2N/elSjJEQ
 bH/i5sFeaBoLgNsor3wYa++vj0QLMocaAmZw5Y99pO7r79O1I6sjH+26HyKw5k+151Tj
 IGhwdvls1Nnzls+M6awYC2yhGt1u+jJOyuEUmfRn3TyB+WGCh4qH6W8AnyBQu/Hx+rah
 9H5nJl5DCwxtZotfFbgbxT3jflI7ho2A6JOYD2hiBUiJqIrs32W30GnBkA1mNikaCebV
 gsKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=xccbGy6b98qgbGQkHPDUbNVvkJNRN81dhxs2umRUhSw=;
 b=XiODGCVScyInt9IYJG9KWyw1y/c7GUBiMyJwhaPtAzbnHzbPJJtCXrxLvArW/+z0zg
 Y1fGe7poWAl7Zp9Tg6UJTJ9fScBkHo4ELyqAtNhJ1fgsV6gocLjY5boqJCw3zNCodifF
 vjQR//HyhgCEsC1onNyAZIZSzRdwJ6C9Yu9t/3vBBMb6zb/o4+7d45NG9HhK9VMlHlmA
 dJGP11tKPbex8AREGa2HYLwMPX0XZ5y5wHnKsdU9aU/6qfTiVKXEqWW1slsStPwcIjLd
 keNCjk8nJHE8kgJ/8+VuL3vntZbNMcb36UbwaMgyNftDfwOzSgJNPiiPIH5+RhyRKR1Q
 dorg==
X-Gm-Message-State: AOAM532nQRpPbcgE4OfvY/wd0Ao/F72WiBnT0MUdx9RkLY/fL3+8mEEh
 81/IIgapWLHZ0/M/stf0Ulrw/Ofd1CLY3G3I
X-Google-Smtp-Source: ABdhPJxVi4cTo+yE0W0+dhrKlvcpyRuI+1eq68wDiKWX6LSaD/5Q1BBlehNbec6Oy4eSxWUHoyqtOw==
X-Received: by 2002:adf:fe8e:: with SMTP id l14mr19445161wrr.305.1619972297360; 
 Sun, 02 May 2021 09:18:17 -0700 (PDT)
Received: from localhost.localdomain
 (anancy-651-1-208-144.w109-217.abo.wanadoo.fr. [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id y11sm9957508wmi.41.2021.05.02.09.18.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 09:18:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 30/36] target/mips: Move helper_cache() to
 tcg/sysemu/special_helper.c
Date: Sun,  2 May 2021 18:15:32 +0200
Message-Id: <20210502161538.534038-31-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210502161538.534038-1-f4bug@amsat.org>
References: <20210502161538.534038-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Message-Id: <20210428170410.479308-25-f4bug@amsat.org>
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


