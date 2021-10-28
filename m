Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA34C43D98A
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:52:01 +0200 (CEST)
Received: from localhost ([::1]:35004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvWK-0001J6-RR
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMP-0004fm-F2
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:45 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:34476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMN-0003LS-88
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:45 -0400
Received: by mail-pg1-x536.google.com with SMTP id h193so4963918pgc.1
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NYLWr1uKuQzUUVrza4V+n6K/acOPuYl97jiAhjg0Z5M=;
 b=XAKpgYmAhJM49SJkH+R2/7MEFaywotDEMqopjJHKXFq88/Y3pCmj+N1k03gjC+Ci5x
 P+QPbMz8UtZ9N2njBWLipoxvRJv4lOVzZAx0nnpdVEa42uWXuyA26bebrFf6hv8pjwP3
 rOYxvmH6RbyUFNrduV1eBF7zhFjFVBtWFNgZiQ+w8A3gw7673+T/UPepZthqSVKloSlP
 jjT2NR6LpDW2LKdsPVmnv21gxEJ/J3kGLSnoersE4eK5KsXGQPMasThq/UfHzF4J4NDN
 MBiSgNChYrMaC1QrdM/Fm72ASrVPr6UtMohY81zuixA/F5pYWol2DgbDm54uLgrF1v9L
 Pu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NYLWr1uKuQzUUVrza4V+n6K/acOPuYl97jiAhjg0Z5M=;
 b=2X/ShTHKaYFszRjlQS9h4MHhDJsxkVTAJlsEy5y1c8AXpdgm7YDSiUONX5/65lT4qQ
 x9l+/XvVOFhq8L8NnNVZFPSz9r0VW/yneEJdhAkLcWKST70Bu6k2zcO/IQAeMQ7PjrCB
 sDgACQvC/19RQJ5Po1rIf7w7kG9xc3RSr7MyM0L14GBwP1PejNImVT7rltwebX9fJH61
 RcFp6xohJFZJHpAC5nmmpDdM35cm64bPxljLCaUf7ESggp/I7WU3WQoYm/C3YFRw/IAZ
 vXE0USHlvNI1aFs0xjprfY7oRJz0xLIznNsZzV9luTXQ+oU3Y8nMuJyUZN3utlBxU2Ow
 go8w==
X-Gm-Message-State: AOAM5314z5ZNT+lHQrjZ4pvhCOMYdrfv0lIxVsygYQsQPmLTlBS5D4gG
 XhFrnFisW+rfQxoOTA0ULWB/LKxMcZl9Cg==
X-Google-Smtp-Source: ABdhPJzQqbCWm1PLiMc0mL8A0GfJIkhYpRj2X632i4zQqH8UYikT2yNzT0x7xd9tOduxHGbDMacV0w==
X-Received: by 2002:a65:6658:: with SMTP id z24mr1229451pgv.266.1635388901934; 
 Wed, 27 Oct 2021 19:41:41 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/56] tcg/optimize: Drop nb_oargs, nb_iargs locals
Date: Wed, 27 Oct 2021 19:40:49 -0700
Message-Id: <20211028024131.1492790-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
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
Cc: Luis Pires <luis.pires@eldorado.org.br>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
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


