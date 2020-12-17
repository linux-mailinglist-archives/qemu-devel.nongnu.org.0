Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF962DD3FD
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:20:57 +0100 (CET)
Received: from localhost ([::1]:51936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpv5M-00051i-T3
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:20:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudx-0003Pa-S5
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:37 -0500
Received: from mail-oo1-xc31.google.com ([2607:f8b0:4864:20::c31]:42133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpudn-0004uS-VD
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 09:52:37 -0500
Received: by mail-oo1-xc31.google.com with SMTP id x203so6868878ooa.9
 for <qemu-devel@nongnu.org>; Thu, 17 Dec 2020 06:52:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=KysIP4SxxPHUzbaJQ7kkTPCy9I7LKQnOtelCJefhblY=;
 b=yIKD49JAu+6AueDqQFIaf02ddPzsHKJ54J+oQYJJYI7EAB875UO8mMJvzJNmDFCcVS
 +abi1Nu9XI+QU/MzII5299JymmjCEgNKuzEoYq3jpfzcRhsq3/F67dYjh4U8agAtcn7W
 zdENWOTlSi0ES2jfGah5rTbJfy9U/RnVJFuZYBcT3U/0x3FxrViAeopQAnHKxvuU3afc
 Z2irNilExahD2gecsuMaGa6KFvUBjVsiLXhg3yeLwQS52iE5U2J1dS3aaWV+c+BX8PJ6
 mEY8ES8Lg0yY8jaAaHrwBnBChDwe7YDmpGRYo6pXngsccDzyOf3+FNMt5jNabt9c24Zd
 ojCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KysIP4SxxPHUzbaJQ7kkTPCy9I7LKQnOtelCJefhblY=;
 b=ROD/J04/nXaTiqokTwnGdkGF/uUz9wa8iXH0j0lPSjCvo0QjBhQkeQBgZeQRFDRp0X
 z5DpGOD9UgNnSnOTxhG6ydigBejaGRcIV8nuMuyTOURuNfHMWqCsMilRqwdkSFQCEfCA
 cnimqCN+xsPM1/CrgNgwJXMPmcAn69/3I7fWW3vXov0BxDzCTRdeoExF4MOTkTkAi9AH
 XPJO/zvYKcEE5ljwhRN9a3dS1uON5v3GLxeMH7wVHVfUyeglt5avaKSPt+lMWj8E/dLi
 5QN0co5j8/K/YN+ekS0yPvZR1J78N2F4kSlsfDK8RQug+0DBPqpIHwmLPgqkXMom7Uph
 1xXQ==
X-Gm-Message-State: AOAM531YZb3JTHcItKCIjwvVyw1HAIyqE1e3scjB93PF0ocSoOWddVS5
 zldApR2xDIN3KW+oKqoH8mQ+GLoks+O6nXlM
X-Google-Smtp-Source: ABdhPJx7cw/RRdbNjjHgIsxZqMN1CB4FuLYzb1Sv9s+rE5t1Uz4ySEXN8gkAZiAfU36HgItADfbuWg==
X-Received: by 2002:a4a:6c45:: with SMTP id u5mr13203208oof.61.1608216745352; 
 Thu, 17 Dec 2020 06:52:25 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id x130sm1136342oif.3.2020.12.17.06.52.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Dec 2020 06:52:24 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 07/23] tcg: Expand TempOptInfo to 64-bits
Date: Thu, 17 Dec 2020 08:51:59 -0600
Message-Id: <20201217145215.534637-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201217145215.534637-1-richard.henderson@linaro.org>
References: <20201217145215.534637-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c31;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc31.google.com
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
index 81faf7cf10..33d1fc8f87 100644
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
 
@@ -1221,14 +1221,15 @@ void tcg_optimize(TCGContext *s)
 
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
@@ -1267,9 +1268,10 @@ void tcg_optimize(TCGContext *s)
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


