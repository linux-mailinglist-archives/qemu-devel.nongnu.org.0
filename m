Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9FEF43BDAB
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:15:14 +0200 (CEST)
Received: from localhost ([::1]:36626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVez-00033v-QA
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:15:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZs-0002tT-Ew
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:57 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:33601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZq-0001wc-Ib
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:56 -0400
Received: by mail-pf1-x432.google.com with SMTP id t184so954651pfd.0
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NYLWr1uKuQzUUVrza4V+n6K/acOPuYl97jiAhjg0Z5M=;
 b=QgSpNdBbuu7+5VFbjA4opnx7Vw1oy9OZ0mhNYhpcf2Qp9IWxwCJPUDgL262cxm+fqu
 3CjKS3ePrCZNkgaWzGrn2GKQm9iQQS4PmBCIxX8q+TJEZIJ5tLpDRrcPIWOt+kX647TO
 sUcPUO+Tyn59TXR1pGugsz0reoXYNWouVLc13HvZOEyj3BAEZZ739fh24E9xMqIkptIt
 jgXDX9nGKiWXgElHPugodNxTT+kPXFrpdVBkNmn5+ugudEjcgnGh1pSPfd5QBF6NdbE+
 Ba3udcSwga0Zhcrc32uIg54L9KwvDR/inTD1IPsk8j69+MCY4iBRk51NiuSpn/AO/Xmg
 WBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NYLWr1uKuQzUUVrza4V+n6K/acOPuYl97jiAhjg0Z5M=;
 b=fYK6BgBHryFWtXY6am7tJiexFBKAoBLmDPdu7Mfb2vAonVuZohsOQjcZEXUvnsJX0N
 dDFzBOBWQPnwq+2Z4y06z4sFAzypskQJhgtddfniedjd8DdAHcjEjVeFEiwaFmnOpMul
 4WrGE1Oh1x8Ok3Bt0mlUx06eEW4SopGr38xpukRlLWRPC7jSIdWJqzLT9ADkPSKeEKnA
 J8mRvqUIn3sUpJZYZCZ+0+jrEsPpBdvZRsRX7039MhNX/a0WaFw2gZmw3efHCz+TVq6F
 EwaoTMTy8+vytNI5kxEE6vpZGzzoYOwDivrPeXRiXyxb55CIppi9xa4z2VMGixWEPbky
 cZCQ==
X-Gm-Message-State: AOAM532n0ZRjfdmD3a+j/aypZJNddFZpofYaEQ/UZ6A62vlEtTaOEA8w
 QCz8TYD+08Orpyn0dt36eIimsCn9NZI6eg==
X-Google-Smtp-Source: ABdhPJwXPE+d9KlRXrwv+Zg/EfO8avhF/XqZ/IgYFAwTZSUZqcMzAqoA/7n0MKJk9kLmAQtyiHT+gQ==
X-Received: by 2002:a63:ff11:: with SMTP id k17mr21269395pgi.405.1635289793202; 
 Tue, 26 Oct 2021 16:09:53 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 09/51] tcg/optimize: Drop nb_oargs, nb_iargs locals
Date: Tue, 26 Oct 2021 16:09:01 -0700
Message-Id: <20211026230943.1225890-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: luis.pires@eldorado.org.br, alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rather than try to keep these up-to-date across folding,
re-read nb_oargs at the end, after re-reading the opcode.

A couple of asserts need dropping, but that will take care
of itself as we split the function further.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
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


