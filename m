Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8259420332
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 20:03:31 +0200 (CEST)
Received: from localhost ([::1]:47842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5pi-00013c-Qj
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 14:03:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kR-0002fF-VB
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:03 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:52079)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kO-0003P0-GO
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:02 -0400
Received: by mail-wm1-x32e.google.com with SMTP id p21so1819279wmq.1
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XxuEIy1tj7Fs3MbSgOfbbhEpKEgia9N0pym7Jb9gPes=;
 b=I9wcFshD0ucYa2NhQzSylmOLO5zpFA6uYnC/roHPmREspjyv5rEzoGORGOmmB+ZcRX
 UFpit91wLeIcB8fFWoApSK8y18uCIoRtaeyhdivy0MF207mTuueq69syYB5XiAjYwUG0
 UoBg57YpJR7FfvK71YNhQ8dTQlL5S4HOjIQSnWwqISkq8ldRg9BlT4VIrSgFqUP/u4cV
 pSLDSYijPPN4rdHNEA45dBr2D5nkiMKt8kvl2SLuhjs+t72KdAJcBvmmf1oQ7gh2KlLO
 QivTLYVkOhwt8RQ2NoxWCyaNXqE99wr4c+mJ1vkDaSOC5DgEG6jNKHeNSZv9hFPFq5Vt
 /wvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=XxuEIy1tj7Fs3MbSgOfbbhEpKEgia9N0pym7Jb9gPes=;
 b=hpFHp+/s9dCI1ckvsv6gMaSef6vM9zLH2bVbqAk/rWWtUcOejG2xXp/rv0H90x5DUN
 hMl4qL+3VnpcWbBOVBcR8Hu0hIMs3XdUcMm+2a8MFX6WtveCOXRNwQmPCAI0hYDiKnsd
 MrQL42J1yX6GAfh4s+21BaNz4b+YzZzZS4wrL6f7trL+L18oyEhep7wrmYnOqNIeSeov
 wQjqgeyQ+4GuXsAjfLtRwpLKi7B8koU+5xStpZMERMDPdZkgcz1Q48262ayy+ju2tnNn
 LxaxXpcymmw/P6kkeyAnJuUA8SLQLeNosPY1s0n0UqfMCdIAIEsg7YYjgRuFeaWpSX+6
 H8Qw==
X-Gm-Message-State: AOAM532Ggp/wxNz2xK3V5SJakWXBf5CZwzZutXBHXcYxmc7Hc8X1EYXj
 uKNBIAXVJ76RVXnSrun7oKbUs7MBz7w=
X-Google-Smtp-Source: ABdhPJxzQPm7/EkbskeBO4xIHgdQBj8QcWThbKZDRYLSKkw+47WVVi2FWbwPkPo1nSIq8I9H89CqvA==
X-Received: by 2002:a05:600c:218:: with SMTP id
 24mr2675927wmi.124.1633283878905; 
 Sun, 03 Oct 2021 10:57:58 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 i27sm14364760wmb.40.2021.10.03.10.57.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:57:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/8] target/mips: Use tcg_constant_i32() in gen_msa_2rf()
Date: Sun,  3 Oct 2021 19:57:38 +0200
Message-Id: <20211003175743.3738710-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003175743.3738710-1-f4bug@amsat.org>
References: <20211003175743.3738710-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using a TCG temporary by moving Data Format to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 20036ae4968..5e8f80f2f23 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -2028,7 +2028,7 @@ static void gen_msa_2rf(DisasContext *ctx)
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
     /* adjust df value for floating-point instruction */
-    TCGv_i32 tdf = tcg_const_i32(df + 2);
+    TCGv_i32 tdf = tcg_constant_i32(df + 2);
 
     switch (MASK_MSA_2RF(ctx->opcode)) {
     case OPC_FCLASS_df:
@@ -2083,7 +2083,6 @@ static void gen_msa_2rf(DisasContext *ctx)
 
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
-    tcg_temp_free_i32(tdf);
 }
 
 static void gen_msa_vec_v(DisasContext *ctx)
-- 
2.31.1


