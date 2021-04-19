Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C36D364AB4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 21:40:47 +0200 (CEST)
Received: from localhost ([::1]:53136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZlG-0005DF-DX
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 15:40:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZRZ-0000Ha-7z
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:20:25 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:56271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYZRX-0001km-Iu
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 15:20:25 -0400
Received: by mail-wm1-x329.google.com with SMTP id n127so7036644wmb.5
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 12:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3GmUY9SDQTId+vurOXkEi+R4oq195U5WUEXrZHtw3SI=;
 b=X4tfoBv7tBb5Qf0R7bkPWA26R6oo/e1rjXD7Xil9C7UGGl2D/slWuphIsOa7Ofxzcf
 BYAZzxCpWM5auKPNuvVQcyh92nwoY+9t9MUKmaGFn1mSm/XgGaBQ3dQ3/0oaK0LBtBhY
 f4ev6hHJ7Pb5GZhqBlkxeagOw1DtA0Yd2HEZbknriFJ2WcWJKxIi/BzmayUZnhNYPE9O
 mANc6JPAiei+m0Q9gSG/vhks8Z/BuCzE0m3roOj71wQE9Bf2nG90hWwzCwWzigVH9Fii
 eywuTPp37YIwQkdlMTmlQmLpfeMumEQI++Gt2M495EnmosZMrSdc4GS6QdBBlT4BK61F
 UlRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=3GmUY9SDQTId+vurOXkEi+R4oq195U5WUEXrZHtw3SI=;
 b=cjxXO1ETkH+CA3uU7j5UeEwa8ryfWfeUtQKfWJaZVdjMUo/up71Q3aGdqz675EN9B4
 AnyQpD0lAcBnoIlnnIa1B5ugAhf1kba6It0c/mG0NjIs/g06vHjw46UbNP3cbXlvX/Ja
 hVuqpYp3C1aMcbQZvggBAUjnFQy7yLoQrsVMa9OFDrgYz8Z7TLq1xQKMCRtuashMmepr
 SXPRzuOyUo4ggWxv8CVFffQw3KEjJjIHyOT+aG8iwe+2ZgD7Z+hlH8mbveAWM4ymPGfs
 /ZzLNnidoMAcm6glNF1wYsECnBdngPGvsRnQuLXA1Xig2Q5uUVsyKaaeQDlJi4aiuxGi
 EPtQ==
X-Gm-Message-State: AOAM531w7DrOERzJU+dUBoDBzmg9FqfX+6IHLQ31J6Dq38vsYDSwWEsw
 9cIUTC2O3xGSrEH5KfaZ71XxUmpOPIYoUg==
X-Google-Smtp-Source: ABdhPJy4e9wEv3y24dXmX9Uq0hlcu8QOTBRWF1j3uCnN2j72Cb4F+M2GPANZglnWUPk9XCpAgx/ZCA==
X-Received: by 2002:a1c:1b41:: with SMTP id b62mr580604wmb.170.1618860021999; 
 Mon, 19 Apr 2021 12:20:21 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n2sm576962wmb.32.2021.04.19.12.20.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 12:20:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 24/30] target/mips: Move helper_cache() to
 tcg/sysemu/special_helper.c
Date: Mon, 19 Apr 2021 21:18:17 +0200
Message-Id: <20210419191823.1555482-25-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210419191823.1555482-1-f4bug@amsat.org>
References: <20210419191823.1555482-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Use STUB_HELPER() :) (rth)
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
index 927a640d076..ffd5d0086b6 100644
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
index 8702f9220be..c2e60178d05 100644
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
+    { qemu_build_not_reached(); }
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


