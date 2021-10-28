Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2AE43D988
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 04:50:44 +0200 (CEST)
Received: from localhost ([::1]:32956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfvV6-0008KS-29
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 22:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMR-0004lN-WD
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:48 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:37627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mfvMP-0003Oi-S4
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 22:41:47 -0400
Received: by mail-pg1-x52b.google.com with SMTP id s136so4936316pgs.4
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 19:41:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aQUcMu1Ri+jkcKMkTmUqdfPvjg+0V++WEX2k8DhqwDc=;
 b=v6XN2R0ZyRMTid1aMa67jPw2F6MlBjgshi2e/M2SBQVO6lgmNjk/bnlsP0t4uKpJcl
 kHq24UNX3QaQI8fvSV/waxaW171U5YlSYXMZ12GWrRe5scrbEvXvMHcEIy4DbUikK/uX
 HJc79MYOwZSmc1TJ1QWMBzUcR7kCOlp7Bssg69ZbB5rw/ML8OGGrgPEruimnCp68r4zO
 Em4lulIl/d/1HA5/PHMQI2vG2LlQ5cabqspEHmM52SvhAqYllSpSZUz2IXzWbZ/SgKzm
 0ghWiwko/r5ZF+7IzWOw09Ox/IUFxwhXuCeyiBSIFSzeo38UJhjI1uvVbBqyntFrOs22
 agjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aQUcMu1Ri+jkcKMkTmUqdfPvjg+0V++WEX2k8DhqwDc=;
 b=CETepA+mRxOAXKc2zO/dCdXrFGotOoVQh01V97wDswmEhGtkV8G+gvv75ooPWO7j98
 YrKgC2sOLFPOdWEHJm5WfA/rtGO020DqoLqmnYQPTWm5jWbuHFNAA35fV1V2klEo2qA4
 UZzXQ+Eu48PD0NrU0e7aHMuGzV0x98HE3p9tUX13PfbzYBGo0Q8XJz8XLDYdc004UcMf
 uMl+Er4wae92XeEVF8Tpsizm064IA3L5gGbtBEwqb60CNNQXbm9Couj4tPeaXSCuWtpV
 PC4K8PuXlf/20cE4GvOzrFP4nbgkK5P6LTtXEt/NKsUm9MBwwNEMYn+Fyz1/dAJ0ZgLD
 dMQg==
X-Gm-Message-State: AOAM533LBZHah+iDVJUqxYuSUoZ5bXVugzarqciE14dZiaZ73SzXUoHb
 XO0KNw9bzoCSll3Lfv0eXH7xVsxMPSE7yA==
X-Google-Smtp-Source: ABdhPJwm6l0MPg3DNnK27gl2QrnFbbZtZw56GUNRUwI9rVQniXbG0Ad3DxVc5gZk9jwa8rm78LHczQ==
X-Received: by 2002:a63:6f44:: with SMTP id k65mr1196108pgc.440.1635388904632; 
 Wed, 27 Oct 2021 19:41:44 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id c25sm1218824pfn.159.2021.10.27.19.41.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 19:41:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/56] tcg/optimize: Use a boolean to avoid a mass of continues
Date: Wed, 27 Oct 2021 19:40:53 -0700
Message-Id: <20211028024131.1492790-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211028024131.1492790-1-richard.henderson@linaro.org>
References: <20211028024131.1492790-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
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


