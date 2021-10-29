Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9AC43F643
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 06:48:33 +0200 (CEST)
Received: from localhost ([::1]:43472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgJoe-0006xV-F0
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 00:48:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaP-00044v-Qd
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:49 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:39805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgJaN-0007x8-7z
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 00:33:49 -0400
Received: by mail-pl1-x629.google.com with SMTP id t21so5991652plr.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 21:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aQUcMu1Ri+jkcKMkTmUqdfPvjg+0V++WEX2k8DhqwDc=;
 b=j/Vi5ncR/zsM4nJRpbw0PdkawnFOSikHPXpTaRigA2lOy997IJn/Ac2FbKRTo4MaU4
 yGbnxXJmMJ363madWAEP6u/lOhhaW6Hl8iKzneQXXyMcZU+u8jV0F4HdTTv7lpkgPMfA
 OEu9azGwKf2y/oD/mV54N6IUFPkFKOFfyPaDT5oC7Kaj6SyYimng09JIFyP/gEYFwbAB
 5je5wm4UChM3VxtQNidUljS5dEAqU/Fp+FKF5hMN00dTUDXl+Nd2ejAUmbCYkdEregD/
 e8GhaW7upqWCMDPpF7MaBEcn074YC2gN+Jd2hZiE9D0g6Cn3Ory7cITMfMcP5WtIK19s
 laRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQUcMu1Ri+jkcKMkTmUqdfPvjg+0V++WEX2k8DhqwDc=;
 b=lKDDoUlb0oCkejrPio3ANmc1tVzWc2dkRHF+W+NlzryBc2ASpZ/U1nxT8KbDpOsvXd
 r4DEHbEeloOnxSuEDZ4ztwFslzuLnhPbTlNXPPNTigi3ZDAB1+HE1Uc0+Ts7q7mJzwv8
 obxsjKQJhvqNGR+2qWSo+iSl21GEdQTutP7dfsQnHprZLrGNLZwjVtrdD3zj97NFIuWl
 FwVwFDDmq8seyDu3iOfQPfN1xoxyZi2g/Hh5vN0LQbwOslDEoG8hIPv+U3wX9bwEivMh
 cn/kayKlhg+be7WKqfD4fLS1i48QsQQ7/xDB+Nv83q2OXQDMIfVt5uKwT9QZGKtpmQIL
 k2rw==
X-Gm-Message-State: AOAM531SYu98Ky1qxSG7uj7QEMEufZipVNrX68OrDGShikvtlnnlvsSU
 J9OzWYLjsk3xmiKyKGuBVccWMeDtl69mYw==
X-Google-Smtp-Source: ABdhPJz08qR5bapBALHe0AAyXlvi6hkI5HbQgtPkdYGR0kMJFZe3GBQ5oKzINS01YoLD4LCJTjlaXw==
X-Received: by 2002:a17:90b:1112:: with SMTP id
 gi18mr9011170pjb.136.1635482025996; 
 Thu, 28 Oct 2021 21:33:45 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id i11sm4120257pgp.18.2021.10.28.21.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 21:33:45 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 18/60] tcg/optimize: Use a boolean to avoid a mass of
 continues
Date: Thu, 28 Oct 2021 21:32:47 -0700
Message-Id: <20211029043329.1518029-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211029043329.1518029-1-richard.henderson@linaro.org>
References: <20211029043329.1518029-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


