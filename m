Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 164E5397614
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Jun 2021 17:07:55 +0200 (CEST)
Received: from localhost ([::1]:50734 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lo5zm-0003Wn-4a
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 11:07:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36360)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tR-0002JB-3O
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:21 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:34346)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lo5tP-0002X7-44
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 11:01:20 -0400
Received: by mail-il1-x12d.google.com with SMTP id r6so5806557ilj.1
 for <qemu-devel@nongnu.org>; Tue, 01 Jun 2021 08:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jSaz+LuJWA3wmNZOjCVQV+X0EdRWWlfraiiVpW/EU7A=;
 b=cT5QyQ5ArCkFm6ZKnr92g+21Vp9kkJa60SQqu+VpMQsE6glcUaIJKZAtLP1dqql04S
 KXSXXnOpGTiINCvz/7lmlJHbDbic4JsmFUEKp7fnAQZoj3IGweFBSpnjMZ2j14t7k4Mm
 HpIBnBK4gFFSNpxxnS3pLXCI8I2lUXKyT0qqvFpkrs/ys6ewIbkbr4lTlutyyA1HAKmO
 kjBNZTzL7/sKAw5z+L9yYpp2pNafjXstITJtarU6w5JobbmAyeq3kGJzR8aBtonvaHUy
 C2JULzknQFNTzLhbZrB4G4i5ZqRgxuIK8zca2bJ7kbvWpOLB2bhzilP953uw4uhuIaNu
 qF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jSaz+LuJWA3wmNZOjCVQV+X0EdRWWlfraiiVpW/EU7A=;
 b=RI89/qzm11wDKS+WpmkFD2kHYPmvDEQfO58AroXvFOYGvuq+fP003OZr0tK6X5XCwk
 Ji14Yh7F62NdM3rAstilgfNhN8NApocqQkz0bd3yOtfh79PLvf8+MPZSCfWZqVo1f7h0
 Fka0ANbpunwTjcEMaZ6xCxUDW8JE3QKS2jc2wVfjcf7ug2SneDvEl43yaG7xVe/UtolW
 yiP/L5hjPOUvsRF/xc7GkKPTaUz1bWQ/F/E5QCnZoAZk0hc1+4JZMcEB7ntRFu9lO/lz
 B+/OA0rbRjN5QKlRnlE56IFOv9e0bbNEH+TicwuT4uacbJ2IJRdtZRGQNr/W/rVSYtjU
 1h+A==
X-Gm-Message-State: AOAM530j2VxnkSkXTjZuYPvHWCYhUn41iM9Mrk/+CTLkDYiwtS7U66qj
 4vXClpUI41rOOuZwnclT/T/t4l69FJxC1x7v
X-Google-Smtp-Source: ABdhPJyl3jZDxM9lgxaAVUFFh2pli0jvbZojAoZzbM4UZYw7DtCzWwmzPdTQpuB8d4fnh+FIoP8Skg==
X-Received: by 2002:a92:c24f:: with SMTP id k15mr3158739ilo.129.1622559677845; 
 Tue, 01 Jun 2021 08:01:17 -0700 (PDT)
Received: from localhost.localdomain
 ([2607:fb90:806c:3e8a:9cf0:b3be:5e07:b99f])
 by smtp.gmail.com with ESMTPSA id f8sm4109909ilj.37.2021.06.01.08.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:01:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 06/27] tcg: Store the TCGHelperInfo in the TCGOp for call
Date: Tue,  1 Jun 2021 08:00:45 -0700
Message-Id: <20210601150106.12761-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601150106.12761-1-richard.henderson@linaro.org>
References: <20210601150106.12761-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::12d;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x12d.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This will give us both flags and typemask for use later.

We also fix a dumping bug, wherein calls generated for plugins
fail tcg_find_helper and print (null) instead of either a name
or the raw function pointer.

Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/internal.h | 14 +++++++++++++-
 tcg/tcg.c      | 49 +++++++++++++++++++++----------------------------
 2 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/tcg/internal.h b/tcg/internal.h
index 35a8a0d9fa..c2d5e9c42f 100644
--- a/tcg/internal.h
+++ b/tcg/internal.h
@@ -25,9 +25,21 @@
 #ifndef TCG_INTERNAL_H
 #define TCG_INTERNAL_H 1
 
+typedef struct TCGHelperInfo {
+    void *func;
+    const char *name;
+    unsigned flags;
+    unsigned typemask;
+} TCGHelperInfo;
+
+static inline const TCGHelperInfo *tcg_call_info(TCGOp *op)
+{
+    return (void *)(uintptr_t)op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
+}
+
 static inline unsigned tcg_call_flags(TCGOp *op)
 {
-    return op->args[TCGOP_CALLO(op) + TCGOP_CALLI(op) + 1];
+    return tcg_call_info(op)->flags;
 }
 
 #endif /* TCG_INTERNAL_H */
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 1fb4604e45..6e5b70215a 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1084,13 +1084,6 @@ void tcg_pool_reset(TCGContext *s)
     s->pool_current = NULL;
 }
 
-typedef struct TCGHelperInfo {
-    void *func;
-    const char *name;
-    unsigned flags;
-    unsigned typemask;
-} TCGHelperInfo;
-
 #include "exec/helper-proto.h"
 
 static const TCGHelperInfo all_helpers[] = {
@@ -1963,12 +1956,11 @@ bool tcg_op_supported(TCGOpcode op)
 void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
 {
     int i, real_args, nb_rets, pi;
-    unsigned typemask, flags;
-    TCGHelperInfo *info;
+    unsigned typemask;
+    const TCGHelperInfo *info;
     TCGOp *op;
 
     info = g_hash_table_lookup(helper_table, (gpointer)func);
-    flags = info->flags;
     typemask = info->typemask;
 
 #ifdef CONFIG_PLUGIN
@@ -2106,7 +2098,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         real_args++;
     }
     op->args[pi++] = (uintptr_t)func;
-    op->args[pi++] = flags;
+    op->args[pi++] = (uintptr_t)info;
     TCGOP_CALLI(op) = real_args;
 
     /* Make sure the fields didn't overflow.  */
@@ -2225,19 +2217,6 @@ static char *tcg_get_arg_str(TCGContext *s, char *buf,
     return tcg_get_arg_str_ptr(s, buf, buf_size, arg_temp(arg));
 }
 
-/* Find helper name.  */
-static inline const char *tcg_find_helper(TCGContext *s, uintptr_t val)
-{
-    const char *ret = NULL;
-    if (helper_table) {
-        TCGHelperInfo *info = g_hash_table_lookup(helper_table, (gpointer)val);
-        if (info) {
-            ret = info->name;
-        }
-    }
-    return ret;
-}
-
 static const char * const cond_name[] =
 {
     [TCG_COND_NEVER] = "never",
@@ -2328,15 +2307,29 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
                 col += qemu_log(" " TARGET_FMT_lx, a);
             }
         } else if (c == INDEX_op_call) {
+            const TCGHelperInfo *info = tcg_call_info(op);
+            void *func;
+
             /* variable number of arguments */
             nb_oargs = TCGOP_CALLO(op);
             nb_iargs = TCGOP_CALLI(op);
             nb_cargs = def->nb_cargs;
 
-            /* function name, flags, out args */
-            col += qemu_log(" %s %s,$0x%x,$%d", def->name,
-                            tcg_find_helper(s, op->args[nb_oargs + nb_iargs]),
-                            tcg_call_flags(op), nb_oargs);
+            col += qemu_log(" %s ", def->name);
+
+            /*
+             * Print the function name from TCGHelperInfo, if available.
+             * Note that plugins have a template function for the info,
+             * but the actual function pointer comes from the plugin.
+             */
+            func = (void *)(uintptr_t)op->args[nb_oargs + nb_iargs];
+            if (func == info->func) {
+                col += qemu_log("%s", info->name);
+            } else {
+                col += qemu_log("plugin(%p)", func);
+            }
+
+            col += qemu_log("$0x%x,$%d", info->flags, nb_oargs);
             for (i = 0; i < nb_oargs; i++) {
                 col += qemu_log(",%s", tcg_get_arg_str(s, buf, sizeof(buf),
                                                        op->args[i]));
-- 
2.25.1


