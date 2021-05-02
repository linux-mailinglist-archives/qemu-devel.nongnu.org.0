Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF26370FFA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 02:04:59 +0200 (CEST)
Received: from localhost ([::1]:44602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldM54-0007XD-TV
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 20:04:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43576)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxx-0007Zd-Es
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:37 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:35520)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldLxu-0000Ya-Cf
 for qemu-devel@nongnu.org; Sun, 02 May 2021 19:57:37 -0400
Received: by mail-pf1-x430.google.com with SMTP id i13so3003097pfu.2
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 16:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=S9uEc9+2uQlOVA8HUtZmIX/997Spq7ORMY4TU3ztzbw=;
 b=SbcdSAzElV4zXl9K9rj5hbsyTRhcCtmA5w6CMFqR8Fu0qR60Gjp6S26P3v2Vr1ThQD
 eI5MbcJ2OSZKl94qnRIu/4j3vzU/GWOCwfTEKI5xNmk8a2eKPcygiWz08w9+Rb/tYx/w
 0ryMLV+lB3+iBnMFVXsHpWqHHik230lRNiF0VNsdBmE594msDfPHEMz23IUoda6aBJ+z
 ASHGQcbXdCE3xUxjCqkQn6tc9E/iSxKQVDa2Yn9lCpdLtcsnmJY5u20uYrlsQ058vium
 Y5vcBk2/MXemSHfv1Em/OcqLKa2JAE4ll7dqtYWdiNHpAdhwBWP+DmfKBozHg1nI8LCH
 Sxxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S9uEc9+2uQlOVA8HUtZmIX/997Spq7ORMY4TU3ztzbw=;
 b=F2nHYzhopMh7uxrRoQ/BwmUS5NxTebJu8PtWqtpOCsDMLK9nKbgkubseMc94XpyA1Q
 LF+YjCFJ+aFaIrRjrL4Q5kmxFzNghjPdGXMGA54cKvgau5+w7gQ5rVb/P8FtD2v6MQ05
 TEiH4G6EVoK6Pvzwp4vhhimoaPYLth71E1tX3hiQyJfjlY3kbzu/7JJGbVUPN2jqrzqB
 R7hM2cKx+AopmXzXwFMmE0iWtk2xFkysXsM2uzgoQSj5UV1mTIsEMx6G89pLWMHuCqZ5
 cK+ZOeKNfn8ifqZHUN33Xvkmo5yWFBtxMfH0EeVD86U1GXB692mO7EilY2tHcZ3tjt0E
 L2eQ==
X-Gm-Message-State: AOAM53050wYOetx0ywqEk9QdIN9QyXkYmAd6sqsrTa+283PpnpN8vrxr
 CG4CX1hHU/QkeCDAy7p007DaAFzWvymmRQ==
X-Google-Smtp-Source: ABdhPJzZQpYtopfNtqHg11zlHq1cbfuBhjtmBUTYQxK78Qi3XIaL+3ABwOlcF1Rmi3dhV3Wzk1NNFQ==
X-Received: by 2002:a62:8fd2:0:b029:28e:8c64:52a4 with SMTP id
 n201-20020a628fd20000b029028e8c6452a4mr3718426pfd.3.1619999853099; 
 Sun, 02 May 2021 16:57:33 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id t184sm8098054pgt.32.2021.05.02.16.57.32
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 16:57:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 06/26] tcg: Store the TCGHelperInfo in the TCGOp for call
Date: Sun,  2 May 2021 16:57:07 -0700
Message-Id: <20210502235727.1979457-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502235727.1979457-1-richard.henderson@linaro.org>
References: <20210502235727.1979457-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x430.google.com
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

This will give us both flags and typemask for use later.

We also fix a dumping bug, wherein calls generated for plugins
fail tcg_find_helper and print (null) instead of either a name
or the raw function pointer.

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
index b590f8d0de..d42fa6c956 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1086,13 +1086,6 @@ void tcg_pool_reset(TCGContext *s)
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
@@ -1965,12 +1958,11 @@ bool tcg_op_supported(TCGOpcode op)
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
@@ -2108,7 +2100,7 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
         real_args++;
     }
     op->args[pi++] = (uintptr_t)func;
-    op->args[pi++] = flags;
+    op->args[pi++] = (uintptr_t)info;
     TCGOP_CALLI(op) = real_args;
 
     /* Make sure the fields didn't overflow.  */
@@ -2227,19 +2219,6 @@ static char *tcg_get_arg_str(TCGContext *s, char *buf,
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
@@ -2330,15 +2309,29 @@ static void tcg_dump_ops(TCGContext *s, bool have_prefs)
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


