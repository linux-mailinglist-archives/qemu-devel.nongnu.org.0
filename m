Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9586441FEE7
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 02:26:46 +0200 (CEST)
Received: from localhost ([::1]:44144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWpL3-0006tZ-54
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 20:26:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWpJV-0005oz-KS
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 20:25:10 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:45038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mWpJS-0005hH-5o
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 20:25:09 -0400
Received: by mail-wr1-x430.google.com with SMTP id d6so22239703wrc.11
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 17:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bHLBIM+b4jIVlcHZ7FsZZyBCDk6uMDEA7gC0gz8KNOE=;
 b=Fn7YeSQ/btjWYO+iTZl/cGY8udemiufA7WWgfQ+Z1Lcw6UyD7eHcwRe10yT0k4bhQE
 n0jtK3AnLqojdZh9Y2HylzPnhK0PYEfU821PhD2vrEyvEeWV84ojbxTtnqCHK2hNKS7R
 e85jKRIhg4E1OTrBYsEpUwBe6sQc1OI05TKJnbfPGWrU+gU9N07MwLnkVyk7VD/z66MW
 JPpMgOvOhZC9yGf39ZCMtJ7XpafCRNPmyNRP7Yd/Kmwiv7Qkjv8774KXUJQee5qgg5iU
 R9TPwlzPk0xdrjrXmYGqxbA/3QPOtTlj69TqwEPQ1qMGG7rsdeuvnzEu+yfH6ea8F55B
 vi+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=bHLBIM+b4jIVlcHZ7FsZZyBCDk6uMDEA7gC0gz8KNOE=;
 b=xvwRMGM/f0Ry8v74UyIOiCciB5Erok7j/NTkW2Ly4ebf98TGLu0o/Ic/rCjjkvFpUo
 lxYbbNltMnh1udLgICeUv9XAlnb4mno3/X4IjKwqjC9CtFSr9yxdiQlscV8DP3mqi4B1
 bNTWKJLf11d5JGoS/u2pkvI82YFfYEvzG3U4zKQbLe4ENCJh5oheN8cA5xvjCtjGbVAN
 6lxrX6tfJybGdS+rvgO3w57iyZHnHMk7NW6yZAhEoK8Y1YlLR3PFEZ0Q0ee9xKbY6DIX
 dbtX6uYafen1RTbGf5D3fTiPe08ZwqOfsi8r3biFVydEd7s2Qx9y5OLkOazNOuU6239/
 wNcQ==
X-Gm-Message-State: AOAM533JWVbxuSH4+tAqEFZZEqSB5Cx1+LNkVsNyw8von+cXdv0uQqUn
 mDsAPMJiE0h3enH+OgyXwRxhHR4jmXs=
X-Google-Smtp-Source: ABdhPJwmuzQx4aa4AOv3ZEUmVGhra2cm6HWRWgd8VRIYDNsNw8BY/dI7+GwYYLDwPTkzScMdxLgtAQ==
X-Received: by 2002:adf:e0cc:: with SMTP id m12mr5771100wri.62.1633220704111; 
 Sat, 02 Oct 2021 17:25:04 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 k26sm13314798wms.39.2021.10.02.17.25.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Oct 2021 17:25:03 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Remove unused register from MSA 2R/2RF
 instruction format
Date: Sun,  3 Oct 2021 02:25:01 +0200
Message-Id: <20211003002501.3598540-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

MSA 2R/2RF instructions don't use any target vector register.
Remove the unused TCG temporaries.

Fixes: cbe50b9a8e7 ("target-mips: add MSA VEC/2R format instructions")
Fixes: 3bdeb68866e ("target-mips: add MSA 2RF format instructions")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 8170a8df26b..ee6424126f7 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -1942,13 +1942,11 @@ static void gen_msa_2r(DisasContext *ctx)
 {
 #define MASK_MSA_2R(op)     (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
                             (op & (0x7 << 18)))
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
     uint8_t ws = (ctx->opcode >> 11) & 0x1f;
     uint8_t wd = (ctx->opcode >> 6) & 0x1f;
     uint8_t df = (ctx->opcode >> 16) & 0x3;
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twt = tcg_const_i32(wt);
     TCGv_i32 tdf = tcg_const_i32(df);
 
     switch (MASK_MSA_2R(ctx->opcode)) {
@@ -2018,7 +2016,6 @@ static void gen_msa_2r(DisasContext *ctx)
 
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(twt);
     tcg_temp_free_i32(tdf);
 }
 
@@ -2026,13 +2023,11 @@ static void gen_msa_2rf(DisasContext *ctx)
 {
 #define MASK_MSA_2RF(op)    (MASK_MSA_MINOR(op) | (op & (0x1f << 21)) | \
                             (op & (0xf << 17)))
-    uint8_t wt = (ctx->opcode >> 16) & 0x1f;
     uint8_t ws = (ctx->opcode >> 11) & 0x1f;
     uint8_t wd = (ctx->opcode >> 6) & 0x1f;
     uint8_t df = (ctx->opcode >> 16) & 0x1;
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
-    TCGv_i32 twt = tcg_const_i32(wt);
     /* adjust df value for floating-point instruction */
     TCGv_i32 tdf = tcg_const_i32(df + 2);
 
@@ -2089,7 +2084,6 @@ static void gen_msa_2rf(DisasContext *ctx)
 
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(twt);
     tcg_temp_free_i32(tdf);
 }
 
-- 
2.31.1


