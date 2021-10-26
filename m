Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 43B4743BDAC
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 01:15:16 +0200 (CEST)
Received: from localhost ([::1]:36614 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfVf1-00033X-AL
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 19:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZv-0002uP-BE
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:59 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:39913)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfVZt-0001x9-QI
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 19:09:59 -0400
Received: by mail-pg1-x52a.google.com with SMTP id g184so1023379pgc.6
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 16:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aQUcMu1Ri+jkcKMkTmUqdfPvjg+0V++WEX2k8DhqwDc=;
 b=uA3w2vqLSyCJDK9/reIpww/3X77kGTYIsMPMjpEaOVDFabWxzeGeOxR7KonlRumu8x
 7V5Z340ye/OZEFH7uRdVrnCcQJgLsRvP5CmAdkZbVRBdRpoPTHgHcM774jCAj0FI9kpw
 B+RKDiW2jsO/QUVoj5CHX7AAo/KLs/nwKrvgnhgtDisvaY1Y2ccAXzwouVLLscyRzRSM
 KXvX30MTBf7V5VYvwdfTdW0iUXvP0ZXWGDxIZdfHPK/NNfSINES2Z2ggxuj5nBj84EgD
 5zrD9XHTKfYgbsamx67vrksRxyJLZgL7m5oeiLf8TplvBhG3XQK93F9qMzzH2UzCR1BA
 Pbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQUcMu1Ri+jkcKMkTmUqdfPvjg+0V++WEX2k8DhqwDc=;
 b=ikMy0OiEjxjbWSI1uYpP9EiTNkGKufD93pyGOOhjPJ2cnpRAahLeZVk6JECxvjj003
 0PLpbh27MBZBrizkIDKHJEELfUY2NRNNpQw5bg593W+dRDHMWjkVDpRFHoxr/wp8HbR6
 +BifP9J13DPSiM/5kxWGeRQlHJz87lObitiu99Wj5jgtJvLJ/jib2elqc5sN7++a+MH8
 C14YSrUhrlcEo2mTo1ley4eOxiEFucgPk+CHS1x9vt0I9qFs4cVbSebz9ScMOG211dbA
 buL8+URFcAAB+zCLrBex5aw5WRxLOK71dMjaV9zT35h38vKPB9bCUOpjSDmPY/uzTFtN
 vczQ==
X-Gm-Message-State: AOAM531lUGAtSig+qsVikfPaXEW74alqsCGQQnatXRxo1FrR2qubYQa3
 fa416CemAXPvk+Kc21Se9oq47R14TZ8EBw==
X-Google-Smtp-Source: ABdhPJz6FnN3eWQbmmD1RLtdSChsdgmvn439EZLObQgerT2YKRokEvj+325SihNOS9gZy8BcBne6EA==
X-Received: by 2002:a63:9a12:: with SMTP id o18mr21311873pge.419.1635289796522; 
 Tue, 26 Oct 2021 16:09:56 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id t22sm4450630pfg.63.2021.10.26.16.09.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Oct 2021 16:09:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 13/51] tcg/optimize: Use a boolean to avoid a mass of
 continues
Date: Tue, 26 Oct 2021 16:09:05 -0700
Message-Id: <20211026230943.1225890-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211026230943.1225890-1-richard.henderson@linaro.org>
References: <20211026230943.1225890-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Luis Pires <luis.pires@eldorado.org.br>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/optimize.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/tcg/optimize.c b/tcg/optimize.c
index 368457f4a2..699476e2f1 100644
--- a/tcg/optimize.c
+++ b/tcg/optimize.c
@@ -713,6 +713,7 @@ void tcg_optimize(TCGContext *s)
         uint64_t z_mask, partmask, affected, tmp;
         TCGOpcode opc = op->opc;
         const TCGOpDef *def;
+        bool done = false;
 
         /* Calls are special. */
         if (opc == INDEX_op_call) {
@@ -1212,8 +1213,8 @@ void tcg_optimize(TCGContext *s)
            allocator where needed and possible.  Also detect copies. */
         switch (opc) {
         CASE_OP_32_64_VEC(mov):
-            tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
-            continue;
+            done = tcg_opt_gen_mov(&ctx, op, op->args[0], op->args[1]);
+            break;
 
         case INDEX_op_dup_vec:
             if (arg_is_const(op->args[1])) {
@@ -1602,7 +1603,9 @@ void tcg_optimize(TCGContext *s)
             break;
         }
 
-        finish_folding(&ctx, op);
+        if (!done) {
+            finish_folding(&ctx, op);
+        }
 
         /* Eliminate duplicate and redundant fence instructions.  */
         if (ctx.prev_mb) {
-- 
2.25.1


