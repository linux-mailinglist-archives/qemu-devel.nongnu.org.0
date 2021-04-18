Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 347AD3636E0
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Apr 2021 18:56:09 +0200 (CEST)
Received: from localhost ([::1]:45336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYAiO-0000vp-7g
	for lists+qemu-devel@lfdr.de; Sun, 18 Apr 2021 12:56:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAMD-0003rX-2G
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:13 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:34391)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lYAMB-0004p8-89
 for qemu-devel@nongnu.org; Sun, 18 Apr 2021 12:33:12 -0400
Received: by mail-wr1-x430.google.com with SMTP id r7so19491314wrm.1
 for <qemu-devel@nongnu.org>; Sun, 18 Apr 2021 09:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=A8lbUfK1w40PFVemkTmJo/R7GCvRlnRXvrae0FOQC8A=;
 b=j8WdstyJYyNVCCudYFC4CrGNuFQ46iErEgBBNvJ4Ho6RhDEWhrkM4Suga5Y4ZpnPLk
 RWrYxvP3vPX1Kg/FJQ3lpOQLRpzjjdQS6lWL044C7uIvmWDcO98BmlJbT8ghhij64/kK
 wtaL2UBo6IusibEDIBhJ7o7skPiq8GIiW3/ZzGWgUoWi2rwxIGsxfLK+lGQpiN8CSCQM
 H9UKrRKCOvjY88nv8A3GgC+f8RdIZMShbM6/40A9ZDIkZSU/wBI3YnOLIm9AvLh0tTm/
 UUPpphjdFMirzMAcHStoTxq/AaGv5jGz6O9sv+pFEtUuNEqnL9KSHYOyddiYLkgKnABV
 cRvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=A8lbUfK1w40PFVemkTmJo/R7GCvRlnRXvrae0FOQC8A=;
 b=Ahi6Pdr3kAJP/TBKB8nU52vxOgD90uf3r+0yMYLCTLU3QCItTwqRFJ3SSRoZ/6BgdI
 h+smH+5HFTnylb5B6FyW7FdczZA28UyHzEsivFTMNtmR2BK64H43vFWkJc43JU3xYOcE
 4EXM2hBhjJm/XB+WNHnnxXKL1V3b4pENIV5qUKkPmSMqO/z8nfW0cP1yp5V2zgJPxSvl
 ZiKFr5R/OQVkVgnWiACXq3d4uetwZviWO6JRjpzR3R8ZSsblssuAM8S7zZf4j1SLFGzd
 O2leJ1MV9KhNzpoHXamKf055U3pI53Mk+JAh2b/e6kLQXYo588o4a5s452LtH66OuDu0
 ROIA==
X-Gm-Message-State: AOAM532c5FRv5RW7ITetayg2t2vXEKfHF8qQ7etWbf1AQ6X5JchRKiTX
 GxbNznKUG98mGXIpjtghi7yvreayThGfhw==
X-Google-Smtp-Source: ABdhPJyScvqj5nu84KGqp7S0IyBDWG5M0PXirdXNMDkiUrlG9K57Et+aPSOmaR83XBKDGvuITs1i8g==
X-Received: by 2002:adf:ef84:: with SMTP id d4mr9844686wro.74.1618763587661;
 Sun, 18 Apr 2021 09:33:07 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x9sm7424160wrt.13.2021.04.18.09.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 09:33:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 19/26] target/mips: Move helper_cache() to
 tcg/sysemu/special_helper.c
Date: Sun, 18 Apr 2021 18:31:27 +0200
Message-Id: <20210418163134.1133100-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210418163134.1133100-1-f4bug@amsat.org>
References: <20210418163134.1133100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
symbol to sysemu. For now, add a stub to satisfy linking, which
abort if ever called.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/op_helper.c                 | 35 -------------------------
 target/mips/tcg/sysemu/special_helper.c | 33 +++++++++++++++++++++++
 target/mips/tcg/user/stubs.c            | 29 ++++++++++++++++++++
 target/mips/tcg/user/meson.build        |  1 +
 4 files changed, 63 insertions(+), 35 deletions(-)
 create mode 100644 target/mips/tcg/user/stubs.c

diff --git a/target/mips/op_helper.c b/target/mips/op_helper.c
index 3903545831f..659c4d15668 100644
--- a/target/mips/op_helper.c
+++ b/target/mips/op_helper.c
@@ -789,38 +789,3 @@ void mips_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
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
index f2cf7252484..ae8d0d03638 100644
--- a/target/mips/tcg/sysemu/special_helper.c
+++ b/target/mips/tcg/sysemu/special_helper.c
@@ -148,3 +148,36 @@ void helper_deret(CPUMIPSState *env)
 
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
diff --git a/target/mips/tcg/user/stubs.c b/target/mips/tcg/user/stubs.c
new file mode 100644
index 00000000000..adb2f8e301b
--- /dev/null
+++ b/target/mips/tcg/user/stubs.c
@@ -0,0 +1,29 @@
+/*
+ *  MIPS emulation helpers for qemu.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internal.h"
+#include "exec/helper-proto.h"
+
+void helper_cache(CPUMIPSState *env, target_ulong addr, uint32_t op)
+{
+    g_assert_not_reached();
+}
diff --git a/target/mips/tcg/user/meson.build b/target/mips/tcg/user/meson.build
index 2fe2062a73b..5f34783bdf2 100644
--- a/target/mips/tcg/user/meson.build
+++ b/target/mips/tcg/user/meson.build
@@ -1,3 +1,4 @@
 mips_user_ss.add(files(
   'helper.c',
+  'stubs.c',
 ))
-- 
2.26.3


