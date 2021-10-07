Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6B4425CE5
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 22:06:59 +0200 (CEST)
Received: from localhost ([::1]:52326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYZfN-0003W2-3Z
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 16:06:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZU0-0000L7-6D
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:14 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:46618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYZTw-00079x-Nl
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 15:55:11 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 pi19-20020a17090b1e5300b0019fdd3557d3so6005391pjb.5
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 12:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AyLUBtxbPeKzXjyQ5K6kYUzoBjWab2ZZtvxniXAJP+o=;
 b=H7rzkVZMdPY79Ed/05P3XpcxM+B1k5dWjCIF0TjFPjouxG+wuzUZACkp+0D6HAnYEd
 gVx6eddP9nNHCj/xeT5XBITqULO5iOYG83NDXQxZy19fxPlYlRDRqP9qIGtWG0sua7AS
 3DSKG1TIQz/v7jMHnNELa+fMLImOReCBBOYzbhkn77GluTSNHxaXRlpwT1NpCQv1U126
 X/5Q5e1XiNXnmVxqo2EeS075TiE243se0fwdU8A/xUsYzH7abv1f03jR2ZiQ1a0RDPh8
 gMuQ/vy2X3xhSBhPUbj0BgpG1LoX689wSRdFbhgZN1lEpL6iomK0O437IigLJQeAk6bb
 aMbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AyLUBtxbPeKzXjyQ5K6kYUzoBjWab2ZZtvxniXAJP+o=;
 b=2SpxWaWBp9WrnH2sw57j57GtlNp2pW6E3qwaccj4lQYnuxKdVR2/egPoVhlllYOW0O
 DyU/6dbrueYTlJ8L/iP4+MnbGKGQJq4sSx1pZVb+iIhqq3beGav7Nnar/Ri7qW6JdAcu
 3jyy0dW/3qK5dE8SHMjYq83bgV6wxY7rUAuN4qoUGbhtK9qgxxucfxMuc2f4uEi1empc
 K0I0kzeJ351qtzqah32s3QMizVsSb2UgzQP6OBewSGpvyzvTpWGjQu6s8LAHIEBi8oNT
 zkJ+bEkihCbwn0WHDJPYvQp8yRDCvOGy5klQMnJoc01yv6nDiv8U0+knzQhBJzCuXNCF
 RQEQ==
X-Gm-Message-State: AOAM533wC9/XHanbgcPa/uvQKuU/zEi7ni36i84aHoJDiG6kh4tHwFfc
 gUnsBPEBr7dLrjab/RAYs7/V+N0fpwnIfQ==
X-Google-Smtp-Source: ABdhPJwpyYUrsZjTcrK4pULbqfwSGvblPNKx4x5x+n43hiZ0MvELyuNGWKB+JRYpzNPEbEyVcIDjgA==
X-Received: by 2002:a17:90a:a60e:: with SMTP id
 c14mr7714016pjq.70.1633636507407; 
 Thu, 07 Oct 2021 12:55:07 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id y4sm216555pfn.193.2021.10.07.12.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 12:55:07 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/48] tcg/optimize: Use a boolean to avoid a mass of
 continues
Date: Thu,  7 Oct 2021 12:54:21 -0700
Message-Id: <20211007195456.1168070-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211007195456.1168070-1-richard.henderson@linaro.org>
References: <20211007195456.1168070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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


