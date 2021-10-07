Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D76425D04
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:13:48 +0200 (CEST)
Received: from localhost ([::1]:40982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZly-0006qR-B3
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTw-0000Hz-RP
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:08 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:43634)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTt-00077C-Ul
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:08 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 k23-20020a17090a591700b001976d2db364so6026547pji.2
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Kpelzxu+pseKSsdrmRZaJYnoThPJcyWO4xuGF5g68K0=;
 b=VfgDHYZWkRHvAfWnYxZI4HZ2/PrqfJv2RhsOkQyTT7hOX00ee+AHMX9cYQwVdcFV4S
 CAW8C4NRVlbqchJcGpdJRQkJPk/NwQzDiQ04wEKjSUtfAbXqKN8v3q6p9wf8sh57yW9x
 HKuhEVzoBCcqQhWZzImBp71VG+Q1Cqo9mIqjodrRJYg+z2S/2vuvrAuunZV74VT/okc3
 HemcDEgFntBaGmabUsY0YGHxtELGZwDeIr/ezWkImyNdYRcxjitdItRcvYZVqYoOipwu
 P86rcB8wZTxuf2iHkycsSgVCeTehkj5cD3Z2APTxcHVFgda7PE+0flr9tOVhJvFHCgIV
 9A+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Kpelzxu+pseKSsdrmRZaJYnoThPJcyWO4xuGF5g68K0=;
 b=57D2Q+Ptd6Kjj4sb6JcvfsVSKuGvBBSXZiLqEeNfdMidZp+GQ2rs5BZNZjoP99x/4a
 xxuhr1vzgVoHWNNwdJcz8pO9BFzprkeL+sY5kdHT8v/IQsaOo3R1P/7q4U5JnzeJiR0I
 GGj5kqeLyOtC6H+FXWUOrNtO60Lf7gZGcECEBmx9UzwahePRi8Ld1Y/CuV6AhyZgGfwu
 1a0PIjxrFyezqWSON7NX+m2LbAlgu7jX8PfKy0GN2T+6omEBV+hX+g2C0fv9C+99T8gW
 VZ4dmCcWjMgm7EdGKNCVcpfDMfYQZWj1mJLQAn1DAkQoMcOjpGSP+6Spc75vhzC8ZTWz
 CQxg==
X-Gm-Message-State: AOAM530YAgsk9Ti7eU26LX3VNma5aIb+rVnP365WGneldzhGqrG8ebcd
 i4gT/gihFE9eWZ5l0+GpydiuZcMrU0hB9w==
X-Google-Smtp-Source: ABdhPJxuCo3/NO9SrtOQTs+3JG1iGIH5sM/Ce881XyEL7eREq23vUi1vWiGOuCuNFgmqcpGV8Zb3GQ==
X-Received: by 2002:a17:90a:9f95:: with SMTP id
 o21mr6857439pjp.21.1633636504502; 
 Thu, 07 Oct 2021 12:55:04 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/48] tcg/optimize: Drop nb_oargs, nb_iargs locals
Date: Thu,  7 Oct 2021 12:54:17 -0700
Message-Id: <20211007195456.1168070-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
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

Rather than try to keep these up-to-date across folding,
re-read nb_oargs at the end, after re-reading the opcode.

A couple of asserts need dropping, but that will take care
of itself as we split the function further.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 14 ++++----------
 1 file changed, 4 insertions(+), 10 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 74b9aa025a..77cdffaaef 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -675,7 +675,6 @@ void tcg_optimize(TCGContext *s)
 
     QTAILQ_FOREACH_SAFE(op, &s->ops, link, op_next) {
         uint64_t z_mask, partmask, affected, tmp;
-        int nb_oargs, nb_iargs;
         TCGOpcode opc = op->opc;
         const TCGOpDef *def;
 
@@ -686,10 +685,8 @@ void tcg_optimize(TCGContext *s)
         }
 
         def = &tcg_op_defs[opc];
-        nb_oargs = def->nb_oargs;
-        nb_iargs = def->nb_iargs;
-        init_arguments(&ctx, op, nb_oargs + nb_iargs);
-        copy_propagate(&ctx, op, nb_oargs, nb_iargs);
+        init_arguments(&ctx, op, def->nb_oargs + def->nb_iargs);
+        copy_propagate(&ctx, op, def->nb_oargs, def->nb_iargs);
 
         /* For commutative operations make constant second argument */
         switch (opc) {
@@ -1063,7 +1060,7 @@ void tcg_optimize(TCGContext *s)
 
         CASE_OP_32_64(qemu_ld):
             {
-                MemOpIdx oi = op->args[nb_oargs + nb_iargs];
+                MemOpIdx oi = op->args[def->nb_oargs + def->nb_iargs];
                 MemOp mop = get_memop(oi);
                 if (!(mop & MO_SIGN)) {
                     z_mask = (2ULL << ((8 << (mop & MO_SIZE)) - 1)) - 1;
@@ -1122,12 +1119,10 @@ void tcg_optimize(TCGContext *s)
         }
 
         if (partmask == 0) {
-            tcg_debug_assert(nb_oargs == 1);
             tcg_opt_gen_movi(&ctx, op, op->args[0], 0);
             continue;
         }
         if (affected == 0) {
-            tcg_debug_assert(nb_oargs == 1);
             tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
             continue;
         }
@@ -1202,7 +1197,6 @@ void tcg_optimize(TCGContext *s)
             } else if (args_are_copies(op->args[1], op->args[2])) {
                 op->opc = INDEX_op_dup_vec;
                 TCGOP_VECE(op) = MO_32;
-                nb_iargs = 1;
             }
             break;
 
@@ -1371,7 +1365,6 @@ void tcg_optimize(TCGContext *s)
                 op->opc = opc = (opc == INDEX_op_movcond_i32
                                  ? INDEX_op_setcond_i32
                                  : INDEX_op_setcond_i64);
-                nb_iargs = 2;
             }
             break;
 
@@ -1579,6 +1572,7 @@ void tcg_optimize(TCGContext *s)
         if (def->flags & TCG_OPF_BB_END) {
             memset(&ctx.temps_used, 0, sizeof(ctx.temps_used));
         } else {
+            int nb_oargs = def->nb_oargs;
             for (i = 0; i < nb_oargs; i++) {
                 reset_temp(op->args[i]);
                 /* Save the corresponding known-zero bits mask for the
-- 
2.25.1


