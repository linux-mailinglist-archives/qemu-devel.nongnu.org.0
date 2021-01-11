Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DFBC2F1C50
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:29:12 +0100 (CET)
Received: from localhost ([::1]:49512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz10B-0002vK-AJ
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:29:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0re-0003Eq-Ga
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:22 -0500
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:40351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rO-00008P-NY
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:16 -0500
Received: by mail-pf1-x42c.google.com with SMTP id x126so313980pfc.7
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=HdlisOqlJWN9os3gMBGAWcsA358Yd0mVBunQfB+T/MQ=;
 b=ylfKq7M9LUgg8dgdY2+DKERfm62yR41OhUsuk5lOtG4h1OHMf2EPcP6tuzfSQBuLJt
 C2O4IIpbZejCHac8ILD2ZQH8ptKgcfJQ+cAnNNQ4PGGyMlT0L5Zbw679h+Rw+3BxesAd
 FBnwbuUr0mcbcXGEL/sad+0VDwU6N6I4wxpQManiJnEA7gqkXwm7O+9zjVR/gqj3EbXL
 FbIug7+JXudTOK9NllAWuZ6VT0S6t0BPfsUUY79zSR2RMOtJzpSA+b6rydWD9bYLAtM7
 kY8qAdYY9na8huBgU5Klsbi9U0xvDKC0Tudn4bE9+bXPCv1DDSvVDis7uVLM8f2N+Ezq
 /L6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HdlisOqlJWN9os3gMBGAWcsA358Yd0mVBunQfB+T/MQ=;
 b=nXkTvuV6pOb5PQXV1NV0D3+SfqX4QX3oeqL5pulTPfzfLVXErEAtpTjkjIHS7X7QWi
 0ign976WAXfaeFfWyMbMVRuaiqKOpy3vskqX/UEkeofkVfG8E38aZRGRTrxiyeNKmgXP
 M1FRoctfFMuLGJisvOyygy/U3i3hbLbLdbFgrM1yGN/rHkI+KWAW0NEKQqyWERyUl2oD
 WXqmgjqgRPERJ2mJUyhsleT9RmlJaTUW7r3EapPQT0nSus/PCP0ZxA1QgpU6NfRqJPQO
 0QVzMpiXRFRjpr/23bpIoYc/5pNfpDK9drnPfsgz1G2o0Lb7++smY+fMkPr5IGs0SkJ2
 VyEw==
X-Gm-Message-State: AOAM531TCgJCG8TEKZXieKoICRAfybqjUg5D15cEOxPoeD9OdI11BOVO
 52jYyuT8c/DGgYWIhBP6Nj+4SHN/OGCB3Q==
X-Google-Smtp-Source: ABdhPJyYQAlPkWPe+gqoUGlNfHE7oYJZEFMg870rGwEEbpENWmHftF1EVHgWQXkkcroONE42fFfffg==
X-Received: by 2002:a63:4b54:: with SMTP id k20mr552059pgl.290.1610385602043; 
 Mon, 11 Jan 2021 09:20:02 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:01 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 07/23] tcg: Expand TempOptInfo to 64-bits
Date: Mon, 11 Jan 2021 07:19:30 -1000
Message-Id: <20210111171946.219469-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

This propagates the extended value of TCGTemp.val that we did before.
In addition, it will be required for vector constants.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 40 +++++++++++++++++++++-------------------
 1 file changed, 21 insertions(+), 19 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 0da9750b65..433d2540f4 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -39,8 +39,8 @@ typedef struct TempOptInfo {
     bool is_const;
     TCGTemp *prev_copy;
     TCGTemp *next_copy;
-    tcg_target_ulong val;
-    tcg_target_ulong mask;
+    uint64_t val;
+    uint64_t mask;
 } TempOptInfo;
 
 static inline TempOptInfo *ts_info(TCGTemp *ts)
@@ -166,11 +166,11 @@ static bool args_are_copies(TCGArg arg1, TCGArg arg2)
     return ts_are_copies(arg_temp(arg1), arg_temp(arg2));
 }
 
-static void tcg_opt_gen_movi(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg val)
+static void tcg_opt_gen_movi(TCGContext *s, TCGOp *op, TCGArg dst, uint64_t val)
 {
     const TCGOpDef *def;
     TCGOpcode new_op;
-    tcg_target_ulong mask;
+    uint64_t mask;
     TempOptInfo *di = arg_info(dst);
 
     def = &tcg_op_defs[op->opc];
@@ -204,7 +204,7 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
     const TCGOpDef *def;
     TempOptInfo *di;
     TempOptInfo *si;
-    tcg_target_ulong mask;
+    uint64_t mask;
     TCGOpcode new_op;
 
     if (ts_are_copies(dst_ts, src_ts)) {
@@ -247,7 +247,7 @@ static void tcg_opt_gen_mov(TCGContext *s, TCGOp *op, TCGArg dst, TCGArg src)
     }
 }
 
-static TCGArg do_constant_folding_2(TCGOpcode op, TCGArg x, TCGArg y)
+static uint64_t do_constant_folding_2(TCGOpcode op, uint64_t x, uint64_t y)
 {
     uint64_t l64, h64;
 
@@ -410,10 +410,10 @@ static TCGArg do_constant_folding_2(TCGOpcode op, TCGArg x, TCGArg y)
     }
 }
 
-static TCGArg do_constant_folding(TCGOpcode op, TCGArg x, TCGArg y)
+static uint64_t do_constant_folding(TCGOpcode op, uint64_t x, uint64_t y)
 {
     const TCGOpDef *def = &tcg_op_defs[op];
-    TCGArg res = do_constant_folding_2(op, x, y);
+    uint64_t res = do_constant_folding_2(op, x, y);
     if (!(def->flags & TCG_OPF_64BIT)) {
         res = (int32_t)res;
     }
@@ -501,8 +501,9 @@ static bool do_constant_folding_cond_eq(TCGCond c)
 static TCGArg do_constant_folding_cond(TCGOpcode op, TCGArg x,
                                        TCGArg y, TCGCond c)
 {
-    tcg_target_ulong xv = arg_info(x)->val;
-    tcg_target_ulong yv = arg_info(y)->val;
+    uint64_t xv = arg_info(x)->val;
+    uint64_t yv = arg_info(y)->val;
+
     if (arg_is_const(x) && arg_is_const(y)) {
         const TCGOpDef *def = &tcg_op_defs[op];
         tcg_debug_assert(!(def->flags & TCG_OPF_VECTOR));
@@ -613,9 +614,8 @@ void tcg_optimize(TCGContext *s)
     infos = tcg_malloc(sizeof(TempOptInfo) * nb_temps);
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
-        tcg_target_ulong mask, partmask, affected;
+        uint64_t mask, partmask, affected, tmp;
         int nb_oargs, nb_iargs, i;
-        TCGArg tmp;
         TCGOpcode opc = op->opc;
         const TCGOpDef *def = &tcg_op_defs[opc];
 
@@ -1225,14 +1225,15 @@ void tcg_optimize(TCGContext *s)
 
         CASE_OP_32_64(extract2):
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                TCGArg v1 = arg_info(op->args[1])->val;
-                TCGArg v2 = arg_info(op->args[2])->val;
+                uint64_t v1 = arg_info(op->args[1])->val;
+                uint64_t v2 = arg_info(op->args[2])->val;
+                int shr = op->args[3];
 
                 if (opc == INDEX_op_extract2_i64) {
-                    tmp = (v1 >> op->args[3]) | (v2 << (64 - op->args[3]));
+                    tmp = (v1 >> shr) | (v2 << (64 - shr));
                 } else {
-                    tmp = (int32_t)(((uint32_t)v1 >> op->args[3]) |
-                                    ((uint32_t)v2 << (32 - op->args[3])));
+                    tmp = (int32_t)(((uint32_t)v1 >> shr) |
+                                    ((uint32_t)v2 << (32 - shr)));
                 }
                 tcg_opt_gen_movi(s, op, op->args[0], tmp);
                 break;
@@ -1271,9 +1272,10 @@ void tcg_optimize(TCGContext *s)
                 break;
             }
             if (arg_is_const(op->args[3]) && arg_is_const(op->args[4])) {
-                tcg_target_ulong tv = arg_info(op->args[3])->val;
-                tcg_target_ulong fv = arg_info(op->args[4])->val;
+                uint64_t tv = arg_info(op->args[3])->val;
+                uint64_t fv = arg_info(op->args[4])->val;
                 TCGCond cond = op->args[5];
+
                 if (fv == 1 && tv == 0) {
                     cond = tcg_invert_cond(cond);
                 } else if (!(tv == 1 && fv == 0)) {
-- 
2.25.1


