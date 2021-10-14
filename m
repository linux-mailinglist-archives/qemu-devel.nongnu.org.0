Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6086542E478
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 00:54:16 +0200 (CEST)
Received: from localhost ([::1]:36970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mb9c6-0000Jy-QK
	for lists+qemu-devel@lfdr.de; Thu, 14 Oct 2021 18:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mb9U6-0005AY-2y
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:45:58 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:39498)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mb9U3-00064u-Fv
 for qemu-devel@nongnu.org; Thu, 14 Oct 2021 18:45:57 -0400
Received: by mail-wr1-x42b.google.com with SMTP id r18so23031484wrg.6
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 15:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KkLAy/ew2yxLTkRCGtOHPZGMM/WOij2TDcygHE6a+iU=;
 b=jN7dgGwUIl0OEJtOY73l5qT9zYczmsIBEiYPhkZ5Xj8kzQSewSbgNSbP7HCFnTYyOG
 e7srnxm5WoZ2fuZTzWdqUjaM2dYYKdugfZ/gPQfKDGY0q3nIjXOjVyqTxYqqKF2fTcGB
 LBagzABk6kS1Q3XZY6mZtZNQhwm17o2hunzWuXJNqVAFTO2oYkNpmn7HvPWnTLFwJ4wl
 fdoswSj2CXelFYLaLwVafH/4+aLaHPOuXVemroC94drZKkAd/Ketj5N4RqJJfvRikfE2
 ANPu81w/C/OKbKH5m2lm674HxvD6tuumssNXUqjYK7MuFnTcaThG9lsLpS9LIprOBJEu
 1eZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=KkLAy/ew2yxLTkRCGtOHPZGMM/WOij2TDcygHE6a+iU=;
 b=t0osN26lFl/kFJ0mG7K2NqaOp9AuguWNE2bin2pXSeP82VsYJMXPWsI8YorI4fJPcP
 BivgEggxdd9/zaED2Vip/O02JesgKGoIAZ+U8LZMszsBC6Ni5JVihF03+yLNMkBKTYcv
 Wn36e7BdZ3x9UPeerQkgVuB0oiCq8yUmnHzjB5EwXOvZtIfjD/BWwZju46xUHotqfsFV
 /32cSzd+WGemsYCe+yo0wO5DgVIK52cNdijwXlPTVeOx1GGX6ZgMM76XV5OU+ND2l8Ok
 5JVHjlaXgJFL8NSGJIc1WgEQ0QBA8xOqJgrBAgvv7OGLRcksKcefyrL+2XHZ0Ngc30BK
 y4Wg==
X-Gm-Message-State: AOAM533suahMS/5lms7WV2bO1CITJKRiUJEe296Y/rXAESv0J65l/Lsv
 TjTYezHskZw8aY8iA3SYIaLeCSfpu0w=
X-Google-Smtp-Source: ABdhPJzRYhIN8ncukqqL88QAyzGBW6UzYbM0pJQ9ehW0eFtjDiGJvrLR40FqUjtHHil3y4V+zzt9Kg==
X-Received: by 2002:adf:9147:: with SMTP id j65mr10155593wrj.163.1634251553853; 
 Thu, 14 Oct 2021 15:45:53 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id o11sm4549482wry.0.2021.10.14.15.45.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 15:45:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Remove unused TCG temporary in
 gen_mipsdsp_accinsn()
Date: Fri, 15 Oct 2021 00:45:51 +0200
Message-Id: <20211014224551.2204949-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jia Liu <proljc@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since gen_mipsdsp_accinsn() got added in commit b53371ed5d4
("target-mips: Add ASE DSP accumulator instructions"), the
'v2_t' TCG temporary has never been used. Remove it.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 794676d42ff..cafc21088a5 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -13627,7 +13627,6 @@ static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
     TCGv t0;
     TCGv t1;
     TCGv v1_t;
-    TCGv v2_t;
     int16_t imm;
 
     if ((ret == 0) && (check_ret == 1)) {
@@ -13638,10 +13637,8 @@ static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
     t0 = tcg_temp_new();
     t1 = tcg_temp_new();
     v1_t = tcg_temp_new();
-    v2_t = tcg_temp_new();
 
     gen_load_gpr(v1_t, v1);
-    gen_load_gpr(v2_t, v2);
 
     switch (op1) {
     case OPC_EXTR_W_DSP:
@@ -13841,7 +13838,6 @@ static void gen_mipsdsp_accinsn(DisasContext *ctx, uint32_t op1, uint32_t op2,
     tcg_temp_free(t0);
     tcg_temp_free(t1);
     tcg_temp_free(v1_t);
-    tcg_temp_free(v2_t);
 }
 
 /* End MIPSDSP functions. */
-- 
2.31.1


