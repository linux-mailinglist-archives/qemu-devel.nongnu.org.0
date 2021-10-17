Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A037430CCF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 01:02:21 +0200 (CEST)
Received: from localhost ([::1]:45166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcFAa-0008Nn-Gj
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 19:02:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2C-0004aQ-BP
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:40 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36354)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF2A-0000RH-Sh
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:40 -0400
Received: by mail-wr1-x430.google.com with SMTP id o20so37912288wro.3
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7ZOWz1dqlyuDuaBH4MOae8nY6kvv2jHAcqCGnp8bCU=;
 b=GLkhx14j8yQC1rw4qmvomPHcyZ9v8dJ9LdsoupN8IXdIuxDPwF4l4CX/Nx1Mk2zmsH
 150ygLCC/4be7CplfAyf+JbQ7IdYI4p44AEo8c7whH8onwvQjWSzkXh+E3vhigAhSqdO
 2HrMEQ51UD3SE4F6vzyHFybtSemuYF8wjb9wh9vkvbtMsi/3bWCPOp0K5tV/HhEUZgbD
 nM/MSHPJFhq+4JYd2BNdDZ89CN78zA4PmZ22VdSOdKTVjii96Fv23Tcck3a5lH1Ecyx6
 ht0grXQRf0LOXkMhUk5ErMuIkcAp4xh22ZdBrZgTYq8Asi/waqt7Q+sdgxd6lNRKr2jY
 xQTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E7ZOWz1dqlyuDuaBH4MOae8nY6kvv2jHAcqCGnp8bCU=;
 b=wbBynUOFDQ1ZWA2yeVQAPNHmvmRW/VkVoqBEa5nYa399hVLmRZwnphm3VccLjMxYiw
 g+QCwBhUQhKA7hhnBuUnQJCOGHfv/sNmT6X/XIEyXHdSBu/mRWENk232+CKLUtzqTc/Z
 mDvQRPQ2Dk8zvAXI2pzACmLB/mdxpReMoW2+X7jFM5jCzny4qs0QzazCU65bKmLJIp9G
 Y/eHcIM0IaH7qilSqybF4rTItL6SPxlEYdEPBrxzfFjOl4PJw3tnFNsGIi3KEwsZnCgl
 9LZUiioZlzZIk9w5HRSWwmRIQJIxDl3slmT99xVBUCnoXXKPMYLGSoeZItQUGylSvj51
 xLeQ==
X-Gm-Message-State: AOAM533YQGrVy4UF8gcQOVXh8XWYFWeVO3PAIB8Fb3qtXHYNeX4bakb5
 GRpW2cihJ4pqj0g1uy/aYlmCBJf0DrE=
X-Google-Smtp-Source: ABdhPJzx9hldujAUa8dVJlq5IHwVOvAonR5lXX6CYHOs+rvgwYiYvuOrJTYHvyEYi9/X5c24WF36jg==
X-Received: by 2002:adf:a455:: with SMTP id e21mr30657937wra.232.1634511217399; 
 Sun, 17 Oct 2021 15:53:37 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id v3sm11035849wrg.23.2021.10.17.15.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/17] target/mips: Use explicit extract32() calls in
 gen_msa_i5()
Date: Mon, 18 Oct 2021 00:52:38 +0200
Message-Id: <20211017225245.2618892-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Huacai Chen <chenhuacai@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paul Burton <paulburton@kernel.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We already use sextract32(), use extract32() for completeness
instead of open-coding it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211003175743.3738710-7-f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index e107cad57ee..3ef912da6b8 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -473,15 +473,12 @@ static void gen_msa_i8(DisasContext *ctx)
 static void gen_msa_i5(DisasContext *ctx)
 {
 #define MASK_MSA_I5(op)    (MASK_MSA_MINOR(op) | (op & (0x7 << 23)))
-    uint8_t df = (ctx->opcode >> 21) & 0x3;
     int8_t s5 = (int8_t) sextract32(ctx->opcode, 16, 5);
-    uint8_t u5 = (ctx->opcode >> 16) & 0x1f;
-    uint8_t ws = (ctx->opcode >> 11) & 0x1f;
-    uint8_t wd = (ctx->opcode >> 6) & 0x1f;
+    uint8_t u5 = extract32(ctx->opcode, 16, 5);
 
-    TCGv_i32 tdf = tcg_const_i32(df);
-    TCGv_i32 twd = tcg_const_i32(wd);
-    TCGv_i32 tws = tcg_const_i32(ws);
+    TCGv_i32 tdf = tcg_const_i32(extract32(ctx->opcode, 21, 2));
+    TCGv_i32 twd = tcg_const_i32(extract32(ctx->opcode, 11, 5));
+    TCGv_i32 tws = tcg_const_i32(extract32(ctx->opcode, 6, 5));
     TCGv_i32 timm = tcg_temp_new_i32();
     tcg_gen_movi_i32(timm, u5);
 
-- 
2.31.1


