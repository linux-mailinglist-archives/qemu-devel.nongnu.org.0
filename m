Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1BDB430CD0
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 01:03:16 +0200 (CEST)
Received: from localhost ([::1]:45788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcFBS-0000Qs-W9
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 19:03:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1x-0003u9-LV
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:25 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:51845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mcF1w-0000EK-8n
 for qemu-devel@nongnu.org; Sun, 17 Oct 2021 18:53:25 -0400
Received: by mail-wm1-x332.google.com with SMTP id p21so7142239wmq.1
 for <qemu-devel@nongnu.org>; Sun, 17 Oct 2021 15:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R+vpKgozfTgGwcsxxqzQt2Abc5pKt4wV9EGNm7o9fLM=;
 b=ZxmsuFENZWIElSbYhRXaRqemtLRRqGYyy/aL5cua0+pRYNAhwNuX68m+ExaNyD2V1E
 8fKPGHgtsux7bHwVuwANZHJV4WrukKSRj2S1nyGd4+9vOEAZGTPOrmzSnAhZ+2PYofuP
 cQ+qFp9OMfgZ2c6I/h52hQFYCoatuDxN1B/z48BgoXb4nVjcqRIyk2a6EM76AmeKQShU
 mrxqz/cNm63badrZ8JO+xPuszglxzLe0eU8G7koahAJ0U/znkoqwHOthhyHuVAc/fw+7
 bBhp/hLalle2pjQQjbKJH+Ga7uj7GFNZ8vKhvRnkIX38za9Efp+BK7tuuACUEPf4VlMI
 DkKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=R+vpKgozfTgGwcsxxqzQt2Abc5pKt4wV9EGNm7o9fLM=;
 b=TsWJt+sN21+wK/M5hdcUBOMaLd7dnNtvOAbRXNog8GUhf2rdvohM40y6k3+mKQ9axK
 fE3ICCC0cHBvRDtQnseptocYCF2llp+kPmhuxAQOdaGU080Sjs4udToBvcZf89xGhbs1
 Jto8aqh/BrnRa6HJQR8dGLLx6RS9E9ZQlCEz1voe7tQzGdiVU6/9FaCYmTaqAr9cUkgM
 B7HaQr1uErl5TNxw3NythRYhLFfkKfPRIpdeTka1OUjqZV8LBmH8PERxkeVuAdvMiHua
 BtLCtuNL28OOsT8ruXg8vVQ9AtXhh9WGpZkC/7BOX17deyR7nxAo4fPbJXhPbnp48KzI
 d9AQ==
X-Gm-Message-State: AOAM531Pmh9e3WrAf+JDbKsA/dm7ROjJhDXOwM70B1Xo/rhAyAlnljEh
 Y0uOfks4/UTTSNXQ4amDunIE7hr2Jw8=
X-Google-Smtp-Source: ABdhPJynSIc5oH9CwdPfByYoTsDQAz/WM8HGkFmXV+BwR9EjWtbKL6UIsHz99vVnwjYgnv4jc/wBHA==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr40516669wmj.84.1634511202719; 
 Sun, 17 Oct 2021 15:53:22 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id n9sm2274116wmq.6.2021.10.17.15.53.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 15:53:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/17] target/mips: Use tcg_constant_i32() in gen_msa_2rf()
Date: Mon, 18 Oct 2021 00:52:35 +0200
Message-Id: <20211017225245.2618892-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211017225245.2618892-1-f4bug@amsat.org>
References: <20211017225245.2618892-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

Avoid using a TCG temporary by moving Data Format to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211003175743.3738710-4-f4bug@amsat.org>
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


