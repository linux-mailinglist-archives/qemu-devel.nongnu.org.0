Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E3B3FB13F
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 08:34:42 +0200 (CEST)
Received: from localhost ([::1]:55316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKasT-0003zg-7i
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 02:34:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj9-0003im-5b
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:03 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:39455)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mKaj6-0007RW-BG
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 02:25:02 -0400
Received: by mail-pf1-x433.google.com with SMTP id e16so10955318pfc.6
 for <qemu-devel@nongnu.org>; Sun, 29 Aug 2021 23:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PI8aDp4ig85+pYLUGhK9PJCZ2fmihYb1XAo4Ckg6K5o=;
 b=oE214MegMkQjjS2GUsV1025SxtATDdBqI5tQgBU5/OJMwMNSCna92TqGytqWU4hx5z
 JwmEEicLHpuH1mSnqTSrysQxnA3PZ/8qUvPJtegUx6VmVCgJ8cZnibiPY27ZMKL/Fn2Z
 qhZt51In8p2ooDlo1EO/kAKVDGiMNGWg6EPfG15inciQar0In4n+doGEu5vXYaEZMVZL
 aJN/Dwm+Gi2PcSrvqVQ7FwztVQi5yKWQx2S9IyPrL5jnhCQJBqvyMo2l6HAucARLhB9s
 2trdCsuLhE2qOsT9k0C2J0YYy048CccGM3Bhj+x8Hj3ZyoKV7Gp45Z8/1krK66yYPINd
 zeHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PI8aDp4ig85+pYLUGhK9PJCZ2fmihYb1XAo4Ckg6K5o=;
 b=lHf1sgtGAnU0fS9bNtfSi31WlmjYiOs7SmLHZALqqRt3mOsiI+oNwmqm/S0438FMWg
 mrUD4LCJCU+fFwAhyMdpjD0AYVPN95xdF9N4lPLTMRzIs2BdRUDvPV9ksj1hpnWadMkM
 PVs13E7FpJtK0NkIpWBjoHjL0Q2pfKqlATR/S0oimG70c9S2OgT6hmwPoJy61EbbYvN3
 gfrZU895Vkg7i+y9vWPjE/UGM0NCr/YquoYc1caJZXJkcuWXVebhaNwkeOOD0yjX+BgP
 DobAbOP/jcLqHH31vGiDUMyqEtkQ7UoaGa4zJi3r0oH9EzrJEsoMzxuDFHX6/2Ld1Udt
 nxpw==
X-Gm-Message-State: AOAM53006a9eFPxk0JeiJLS75OOnqZmJvwitg4BVPojtHH0Vlt6NSZz7
 NIPAya39vJfEdovPLGtGjmKw1HnXjJ/7Ew==
X-Google-Smtp-Source: ABdhPJwVSdZVqw+7aP5jgwGgxB4dKqJ2m7gyaM3sdY9yBB2v7oM28HcJig92cV/fgY61ttuWSq0ksQ==
X-Received: by 2002:a63:504a:: with SMTP id q10mr13216994pgl.37.1630304699095; 
 Sun, 29 Aug 2021 23:24:59 -0700 (PDT)
Received: from localhost.localdomain (174-21-72-39.tukw.qwest.net.
 [174.21.72.39])
 by smtp.gmail.com with ESMTPSA id b12sm13942084pff.63.2021.08.29.23.24.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 29 Aug 2021 23:24:58 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/48] tcg/optimize: Drop nb_oargs, nb_iargs locals
Date: Sun, 29 Aug 2021 23:24:12 -0700
Message-Id: <20210830062451.639572-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830062451.639572-1-richard.henderson@linaro.org>
References: <20210830062451.639572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
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
index 4a0949d1c0..96012a6da8 100644
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
-                TCGMemOpIdx oi = op->args[nb_oargs + nb_iargs];
+                TCGMemOpIdx oi = op->args[def->nb_oargs + def->nb_iargs];
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


