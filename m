Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5A0F3ADB41
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 20:19:58 +0200 (CEST)
Received: from localhost ([::1]:42084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lufZV-0000wM-VV
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 14:19:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUi-0000eY-11
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:15:00 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:37520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lufUg-0002ES-6j
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 14:14:59 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 22-20020a17090a0c16b0290164a5354ad0so10053295pjs.2
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 11:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P6VUODZQuiU48isUCRVC+niQheqohXOPGz/BPO/+Smw=;
 b=yJlNRkW9NUjQJAHqRgWdUAE+KBQ7mTXr89wWLj/3JbD085ywl8FvpprRdAqrpHA6Tp
 M416lnOr1wHHWTx8j75+JkTkesbv9m1DCRc2du2eAf6TsC+S7XFB2srj5w2zWkscwKYP
 QSXBCEpcqp78eqDDIp8QxSi1lDydLoLXKOUrgX81IPfsTbcQo/E2sucuSmRH5/iZP0j+
 GsXlrMYbNR4cpKDumHt0d2Jq11+CuWPSOMN85mr2LicSj8cirDlz9AD/yG/o3q+y+lc6
 1+YjR/wmAgs4bHlevBP1OTd9jmUUnUG/X5D4VW1m24u1DNf5zijXC7lhNB4RowrCeYp4
 q5Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P6VUODZQuiU48isUCRVC+niQheqohXOPGz/BPO/+Smw=;
 b=tDTiZZSfj06+DSqRcbTuLdQXyxhnZE9qJW1vKwMTSp3lIrSS7S6HnmhWptBHk4KtDn
 bK44ZCoLKFlnMh4w0ZfOhUpWQDRNNBBeCQIFLTi+221aWABV/LmB20VNK5iB/lWx5lZp
 ArxEJH05HMYg93XHOSxbbJviJwZTRRLRvqXGZ4H2tliXvMNRBl4n0AbwslY1AhPb2t8+
 Y0NDGjAhEXQFeLUDP5b7aELWJ/ibvSfZWrXEFouiZ77Vu2f3NHvrEBLs0hs7w4/dyR8c
 gIVMwedeNurn1i3w8QWH6HLY2QFXlwafOvlhLJ1kd3ef4EFiBo0nkIs5ytVlW+2jlFcV
 AIKg==
X-Gm-Message-State: AOAM5314U/yh3gJ1pdMduhKANjDuDQ9YePeO6D/F+Uj5xKkuge3txhFS
 CvSVEXxx+1URQGkZ1r18mhEBSvM7k1naag==
X-Google-Smtp-Source: ABdhPJz/qqRHmdmGrIE0fVh1s31AgdHqH/CZmlSERugblI1H/jW1Lns8uTOlyfnd1FkG5hubFA8s0g==
X-Received: by 2002:a17:90a:8b0d:: with SMTP id
 y13mr28145254pjn.14.1624126496891; 
 Sat, 19 Jun 2021 11:14:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id k35sm12059113pgi.21.2021.06.19.11.14.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 11:14:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 06/33] tcg: Store the TCGHelperInfo in the TCGOp for call
Date: Sat, 19 Jun 2021 11:14:25 -0700
Message-Id: <20210619181452.877683-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619181452.877683-1-richard.henderson@linaro.org>
References: <20210619181452.877683-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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
 tcg/tcg-internal.h | 14 ++++++++++++-
 tcg/tcg.c          | 49 ++++++++++++++++++++--------------------------
 2 files changed, 34 insertions(+), 29 deletions(-)

diff --git a/tcg/tcg-internal.h b/tcg/tcg-internal.h
index 0796407c13..6ab8910210 100644
--- a/tcg/tcg-internal.h
+++ b/tcg/tcg-internal.h
@@ -27,6 +27,13 @@
 
 #define TCG_HIGHWATER 1024
 
+typedef struct TCGHelperInfo {
+    void *func;
+    const char *name;
+    unsigned flags;
+    unsigned typemask;
+} TCGHelperInfo;
+
 extern TCGContext tcg_init_ctx;
 extern TCGContext **tcg_ctxs;
 extern unsigned int tcg_cur_ctxs;
@@ -37,9 +44,14 @@ bool tcg_region_alloc(TCGContext *s);
 void tcg_region_initial_alloc(TCGContext *s);
 void tcg_region_prologue_set(TCGContext *s);
 
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
index 51c1f61828..0dc99cc65b 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -532,13 +532,6 @@ void tcg_pool_reset(TCGContext *s)
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
@@ -1395,12 +1388,11 @@ bool tcg_op_supported(TCGOpcode op)
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
@@ -1538,7 +1530,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         real_args++;
     }
     op->args[pi++] = (uintptr_t)func;
-    op->args[pi++] = flags;
+    op->args[pi++] = (uintptr_t)info;
     TCGOP_CALLI(op) = real_args;
 
     /* Make sure the fields didn't overflow.  */
@@ -1657,19 +1649,6 @@ static char *tcg_get_arg_str(TCGContext *s, char *buf,
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
@@ -1760,15 +1739,29 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
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


