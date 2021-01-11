Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB1E2F1C92
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 18:37:37 +0100 (CET)
Received: from localhost ([::1]:38344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz18K-0001yA-CY
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 12:37:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rh-0003GL-2L
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:25 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:33157)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kz0rT-00009V-TW
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 12:20:24 -0500
Received: by mail-pl1-x634.google.com with SMTP id b8so199775plx.0
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 09:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=mSdOJnq5o42NhYADknuNWjZocBsJJt/CxyEeh2zDN58=;
 b=INmTOLG9mza0lGnsPZOLiT4aWjsMGCiU52Yx/IxTtMuPeogVchxfS9EuVc6KqHMP+3
 LVRH4oq+swhbOyyHYFY3oSPmNQlez7lPxilNn0QrcvlnuhKTWuPERWohYu6gD1MW3VZa
 zcZNI+djoFB8K8ZQqdSr+Mmxam45pR+KhBgbv8WixSfxlfDNeeMcGya3fQJmekkjCzn7
 Diu0EBzfURMeKTMGdLTgYATE6AOrxN8rqfvg9v0K0GgjF+7lBeioXvC2mBEN/wrbgQXQ
 ndg764ahVMvI38TWqQ9T5UiHhphQqYjlt36uUmBbRPTfpHSXEbfGAlMuSaQulvJfvnOS
 aSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mSdOJnq5o42NhYADknuNWjZocBsJJt/CxyEeh2zDN58=;
 b=l3vqMKVixEfUJFs2etioqToWlKq3zx2iMC8te//gxtSQozRTrndtqlFkrdWFPA/in1
 8JDwYSm8KIt3jpgGIVXPq5e3k+n2YCU4WI87kTOE1bPvUT5bL2askfzISkHtDeNwTAFX
 RGild2vUuS5qClcp17K0HS/t1B2Y6XKh7DWPI5KU6WdX+mLmBP8WRKK5G6Gk3R8c8X0o
 UN38Gm1fkJrb28C8yMJbzN5dNo8N4qzzX9Trkkk3EUhlPo6YKvjMt1jyumE5TzT6FxLS
 eKmu4L8n8ryTwzsrrTSzNHRVmuuoXWNazxnGn24lfZIRPtPH8MCG6Aeb8HEuF6AxwaPG
 HOqg==
X-Gm-Message-State: AOAM532lsQToYrlO7TTxulHPR9OM6oPwihESKt8rwvUPkQC23XHWgxVB
 mnc5wHzRQuqX2tunvtpMfQp9TGyzsXTAEQ==
X-Google-Smtp-Source: ABdhPJzgsYq/Ez0DbLy0rJ4PfvtHcT+v38QdoklWsBHYLgCnqlP81IHhBu2N9OT3jBhndSDmROccMw==
X-Received: by 2002:a17:90a:520e:: with SMTP id v14mr279579pjh.9.1610385609859; 
 Mon, 11 Jan 2021 09:20:09 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id k64sm206666pfd.75.2021.01.11.09.20.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 09:20:09 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 12/23] tcg: Convert tcg_gen_dupi_vec to TCG_CONST
Date: Mon, 11 Jan 2021 07:19:35 -1000
Message-Id: <20210111171946.219469-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210111171946.219469-1-richard.henderson@linaro.org>
References: <20210111171946.219469-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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

Because we now store uint64_t in TCGTemp, we can now always
store the full 64-bit duplicate immediate.  So remove the
difference between 32- and 64-bit hosts.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c   |  9 ++++-----
 tcg/tcg-op-vec.c | 39 ++++++++++-----------------------------
 tcg/tcg.c        |  7 +------
 3 files changed, 15 insertions(+), 40 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index bda727d5ed..dbb03ef96b 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -1120,11 +1120,10 @@ void tcg_optimize(TCGContext *s)
         case INDEX_op_dup2_vec:
             assert(TCG_TARGET_REG_BITS == 32);
             if (arg_is_const(op->args[1]) && arg_is_const(op->args[2])) {
-                tmp = arg_info(op->args[1])->val;
-                if (tmp == arg_info(op->args[2])->val) {
-                    tcg_opt_gen_movi(s, &temps_used, op, op->args[0], tmp);
-                    break;
-                }
+                tcg_opt_gen_movi(s, &temps_used, op, op->args[0],
+                                 deposit64(arg_info(op->args[1])->val, 32, 32,
+                                           arg_info(op->args[2])->val));
+                break;
             } else if (args_are_copies(op->args[1], op->args[2])) {
                 op->opc = INDEX_op_dup_vec;
                 TCGOP_VECE(op) = MO_32;
diff --git a/tcg/tcg-op-vec.c b/tcg/tcg-op-vec.c
index cdbf11c573..9fbed1366c 100644
--- a/tcg/tcg-op-vec.c
+++ b/tcg/tcg-op-vec.c
@@ -216,25 +216,17 @@ void tcg_gen_mov_vec(TCGv_vec r, TCGv_vec a)
     }
 }
 
-#define MO_REG  (TCG_TARGET_REG_BITS == 64 ? MO_64 : MO_32)
-
-static void do_dupi_vec(TCGv_vec r, unsigned vece, TCGArg a)
-{
-    TCGTemp *rt = tcgv_vec_temp(r);
-    vec_gen_2(INDEX_op_dupi_vec, rt->base_type, vece, temp_arg(rt), a);
-}
-
 TCGv_vec tcg_const_zeros_vec(TCGType type)
 {
     TCGv_vec ret = tcg_temp_new_vec(type);
-    do_dupi_vec(ret, MO_REG, 0);
+    tcg_gen_dupi_vec(MO_64, ret, 0);
     return ret;
 }
 
 TCGv_vec tcg_const_ones_vec(TCGType type)
 {
     TCGv_vec ret = tcg_temp_new_vec(type);
-    do_dupi_vec(ret, MO_REG, -1);
+    tcg_gen_dupi_vec(MO_64, ret, -1);
     return ret;
 }
 
@@ -252,39 +244,28 @@ TCGv_vec tcg_const_ones_vec_matching(TCGv_vec m)
 
 void tcg_gen_dup64i_vec(TCGv_vec r, uint64_t a)
 {
-    if (TCG_TARGET_REG_BITS == 64) {
-        do_dupi_vec(r, MO_64, a);
-    } else if (a == dup_const(MO_32, a)) {
-        do_dupi_vec(r, MO_32, a);
-    } else {
-        TCGv_i64 c = tcg_const_i64(a);
-        tcg_gen_dup_i64_vec(MO_64, r, c);
-        tcg_temp_free_i64(c);
-    }
+    tcg_gen_dupi_vec(MO_64, r, a);
 }
 
 void tcg_gen_dup32i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_32, a));
+    tcg_gen_dupi_vec(MO_32, r, a);
 }
 
 void tcg_gen_dup16i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_16, a));
+    tcg_gen_dupi_vec(MO_16, r, a);
 }
 
 void tcg_gen_dup8i_vec(TCGv_vec r, uint32_t a)
 {
-    do_dupi_vec(r, MO_REG, dup_const(MO_8, a));
+    tcg_gen_dupi_vec(MO_8, r, a);
 }
 
 void tcg_gen_dupi_vec(unsigned vece, TCGv_vec r, uint64_t a)
 {
-    if (vece == MO_64) {
-        tcg_gen_dup64i_vec(r, a);
-    } else {
-        do_dupi_vec(r, MO_REG, dup_const(vece, a));
-    }
+    TCGTemp *rt = tcgv_vec_temp(r);
+    tcg_gen_mov_vec(r, tcg_constant_vec(rt->base_type, vece, a));
 }
 
 void tcg_gen_dup_i64_vec(unsigned vece, TCGv_vec r, TCGv_i64 a)
@@ -489,8 +470,8 @@ void tcg_gen_abs_vec(unsigned vece, TCGv_vec r, TCGv_vec a)
             if (tcg_can_emit_vec_op(INDEX_op_sari_vec, type, vece) > 0) {
                 tcg_gen_sari_vec(vece, t, a, (8 << vece) - 1);
             } else {
-                do_dupi_vec(t, MO_REG, 0);
-                tcg_gen_cmp_vec(TCG_COND_LT, vece, t, a, t);
+                tcg_gen_cmp_vec(TCG_COND_LT, vece, t, a,
+                                tcg_constant_vec(type, vece, 0));
             }
             tcg_gen_xor_vec(vece, r, a, t);
             tcg_gen_sub_vec(vece, r, r, t);
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 802f0b8a32..ad1348d811 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -3539,16 +3539,11 @@ static void temp_load(TCGContext *s, TCGTemp *ts, TCGRegSet desired_regs,
              * The targets will, in general, have to do this search anyway,
              * do this generically.
              */
-            if (TCG_TARGET_REG_BITS == 32) {
-                val = dup_const(MO_32, val);
-                vece = MO_32;
-            }
             if (val == dup_const(MO_8, val)) {
                 vece = MO_8;
             } else if (val == dup_const(MO_16, val)) {
                 vece = MO_16;
-            } else if (TCG_TARGET_REG_BITS == 64 &&
-                       val == dup_const(MO_32, val)) {
+            } else if (val == dup_const(MO_32, val)) {
                 vece = MO_32;
             }
 
-- 
2.25.1


