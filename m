Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A863436CE2
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 23:42:43 +0200 (CEST)
Received: from localhost ([::1]:50770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdfpi-0001mU-8L
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 17:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJK-0003nI-TZ
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:14 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:45867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mdfJI-0008VT-Mz
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 17:09:14 -0400
Received: by mail-pj1-x102c.google.com with SMTP id
 ls14-20020a17090b350e00b001a00e2251c8so1493130pjb.4
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 14:09:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4peLAaBX1JXxddh7SAc9adEMPD07opOaRpK6mFtuTqo=;
 b=rrI0kpXTC/serDI1fdq17NKpYJODjInJ3HW5/Aqpb7ileSsNTT9E0/vQFF7BhjfwQY
 TzlldF4aYVCNCEQggVoIDKcbSTLemNp0lh5ip0+x3r9ttf7TcbXeENHUSaaitmZBKKgM
 oSBjZkqVfg8W62seX1K3zqM8Cr3VKJB/JsYly/NrneyQJcJjGlT0cvwDrHkACOujGJ//
 3hfpqCgxkB4iTNuUZa6BEgXgzOHUFzKu83DxeyGneMYNOYVjBc4OMX0AqpEAwnnmAIc/
 5smOUughKIeSnYQDtBDUeWroNhL/IujhmWjs62yRGaujGM/NncAbXa0PSTF+04wjjomg
 DG4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4peLAaBX1JXxddh7SAc9adEMPD07opOaRpK6mFtuTqo=;
 b=r4DhQo+u79Pg2ucroX6TmB+oxisN/iUhD2pblDuLgI8zYW8lvwU4XgUKM8mFH/i+R8
 pJw25GD2K+sQ/+H+v/J8SxSR579u78hTzG1JP3mFAnaTUaUGQks8ga7kABFpj281TeWp
 STp7RQ0Sx/ygthgpW2d77+Bt4h8LVbiY9A82mgHjVgdZYlTzbaMXUg2FUie1ECTrHMha
 GI+aOYcYu6ZosZgcmdMdb7rH9bOd45emRWpNiCCtUcbsb0Ov5UWu8Nc+sMm7Ni1VQkgI
 6APDkFN49L63zPpC90T1uWQF/kGjfknSrp2tUE69xNXZM+yshltZO8y6g6kC3n5b2d0V
 vzxA==
X-Gm-Message-State: AOAM531oTdjrRvoP1I3mNqADO0wkDnOql1oDJqQmXkcn6hIWgM/R6Hul
 Gw4cHrYY/G7eXoYkYeNFMS84/Vw5pKHJhQ==
X-Google-Smtp-Source: ABdhPJx6v2IScMxeNkVTCE8zpFv7NZMYnGGubZO+N90LFk102VPXctaX/VCz0oTWRKnAE8hR2fDm6w==
X-Received: by 2002:a17:90b:1e01:: with SMTP id
 pg1mr9572088pjb.73.1634850551306; 
 Thu, 21 Oct 2021 14:09:11 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id i5sm6258856pgo.36.2021.10.21.14.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Oct 2021 14:09:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 40/48] tcg/optimize: Expand fold_addsub2_i32 to 64-bit ops
Date: Thu, 21 Oct 2021 14:05:31 -0700
Message-Id: <20211021210539.825582-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211021210539.825582-1-richard.henderson@linaro.org>
References: <20211021210539.825582-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename to fold_addsub2.
Use Int128 to implement the wider operation.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 65 ++++++++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 21 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index efd5f58137..ba068e7d3e 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -24,6 +24,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/int128.h"
 #include "tcg/tcg-op.h"
 #include "tcg-internal.h"
 
@@ -838,37 +839,59 @@ static bool fold_add(OptContext *ctx, TCGOp *op)
     return false;
 }
 
-static bool fold_addsub2_i32(OptContext *ctx, TCGOp *op, bool add)
+static bool fold_addsub2(OptContext *ctx, TCGOp *op, bool add)
 {
     if (arg_is_const(op->args[2]) && arg_is_const(op->args[3]) &&
         arg_is_const(op->args[4]) && arg_is_const(op->args[5])) {
-        uint32_t al = arg_info(op->args[2])->val;
-        uint32_t ah = arg_info(op->args[3])->val;
-        uint32_t bl = arg_info(op->args[4])->val;
-        uint32_t bh = arg_info(op->args[5])->val;
-        uint64_t a = ((uint64_t)ah << 32) | al;
-        uint64_t b = ((uint64_t)bh << 32) | bl;
+        uint64_t al = arg_info(op->args[2])->val;
+        uint64_t ah = arg_info(op->args[3])->val;
+        uint64_t bl = arg_info(op->args[4])->val;
+        uint64_t bh = arg_info(op->args[5])->val;
         TCGArg rl, rh;
-        TCGOp *op2 = tcg_op_insert_before(ctx->tcg, op, INDEX_op_mov_i32);
+        TCGOp *op2;
 
-        if (add) {
-            a += b;
+        if (ctx->type == TCG_TYPE_I32) {
+            uint64_t a = deposit64(al, 32, 32, ah);
+            uint64_t b = deposit64(bl, 32, 32, bh);
+
+            if (add) {
+                a += b;
+            } else {
+                a -= b;
+            }
+
+            al = sextract64(a, 0, 32);
+            ah = sextract64(a, 32, 32);
         } else {
-            a -= b;
+            Int128 a = int128_make128(al, ah);
+            Int128 b = int128_make128(bl, bh);
+
+            if (add) {
+                a = int128_add(a, b);
+            } else {
+                a = int128_sub(a, b);
+            }
+
+            al = int128_getlo(a);
+            ah = int128_gethi(a);
         }
 
         rl = op->args[0];
         rh = op->args[1];
-        tcg_opt_gen_movi(ctx, op, rl, (int32_t)a);
-        tcg_opt_gen_movi(ctx, op2, rh, (int32_t)(a >> 32));
+
+        /* The proper opcode is supplied by tcg_opt_gen_mov. */
+        op2 = tcg_op_insert_before(ctx->tcg, op, 0);
+
+        tcg_opt_gen_movi(ctx, op, rl, al);
+        tcg_opt_gen_movi(ctx, op2, rh, ah);
         return true;
     }
     return false;
 }
 
-static bool fold_add2_i32(OptContext *ctx, TCGOp *op)
+static bool fold_add2(OptContext *ctx, TCGOp *op)
 {
-    return fold_addsub2_i32(ctx, op, true);
+    return fold_addsub2(ctx, op, true);
 }
 
 static bool fold_and(OptContext *ctx, TCGOp *op)
@@ -1705,9 +1728,9 @@ static bool fold_sub(OptContext *ctx, TCGOp *op)
     return false;
 }
 
-static bool fold_sub2_i32(OptContext *ctx, TCGOp *op)
+static bool fold_sub2(OptContext *ctx, TCGOp *op)
 {
-    return fold_addsub2_i32(ctx, op, false);
+    return fold_addsub2(ctx, op, false);
 }
 
 static bool fold_tcg_ld(OptContext *ctx, TCGOp *op)
@@ -1853,8 +1876,8 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(add):
             done = fold_add(&ctx, op);
             break;
-        case INDEX_op_add2_i32:
-            done = fold_add2_i32(&ctx, op);
+        CASE_OP_32_64(add2):
+            done = fold_add2(&ctx, op);
             break;
         CASE_OP_32_64_VEC(and):
             done = fold_and(&ctx, op);
@@ -1989,8 +2012,8 @@ void tcg_optimize(TCGContext *s)
         CASE_OP_32_64_VEC(sub):
             done = fold_sub(&ctx, op);
             break;
-        case INDEX_op_sub2_i32:
-            done = fold_sub2_i32(&ctx, op);
+        CASE_OP_32_64(sub2):
+            done = fold_sub2(&ctx, op);
             break;
         CASE_OP_32_64_VEC(xor):
             done = fold_xor(&ctx, op);
-- 
2.25.1


