Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F43B2CF732
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Dec 2020 00:02:14 +0100 (CET)
Received: from localhost ([::1]:55286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1klK5d-0000Sf-Cm
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 18:02:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klK3T-0008IQ-Fh
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:59:59 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:35488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1klK3S-000247-0S
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 17:59:59 -0500
Received: by mail-ed1-x542.google.com with SMTP id u19so7516192edx.2
 for <qemu-devel@nongnu.org>; Fri, 04 Dec 2020 14:59:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QBWY0gSLJ2OOvMeFl8vsP40E6Cg+fRCBYfmiDLBG1bo=;
 b=Z3Y7FCH/yESuL9NM4eDcqX8rhsx7WARNNBbeQGe/uEDy7WM55L8xzNVtEIvs/Gg3xM
 7m5z2gwLPWw8o8rXId/ccY0713kTk0AtMf5ZXCTqVz0NaR8IrhXQymEz9RtksGepJ03r
 E8f7bCD9y/70xhiaL7qjy3CYr+7OS29ZUGnCoPhImooSVJLHdSDbZFvCbab6ktZiOuad
 Qx+jhvqTr9Dl6GhU4QeYik/uUl5Hp5m6Cw2T5yiN4udoZXlemHMbQuop7rsLx2k+9wT4
 xDqJ/yL/CRmzO+ie5asQOWgaMLurZl18s3kt4I4d25B8dcHqZqFnekun/EtiqOH2I9tT
 ckRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=QBWY0gSLJ2OOvMeFl8vsP40E6Cg+fRCBYfmiDLBG1bo=;
 b=mDScXfwJbP4PWsKPN2WIb15nsc/3cpVMlrVftzZfVNgxkEyvjpF8NyZhumfEXOYCCq
 xYtOSJIddMoHLjEzfw1GlOG7Zv+uKC6flS3TI2nPGwaO4JhUOJOwB0qGw666sK+hEyH9
 Z2ppK9jVpF6cNaZig5lbVIC5rV/5VGpIGBEx+xHZNllaW9yBjQ/i35NLr4zU3yNVwLNQ
 H+UcZWJf2ZJSAzRTYf4dL2tNsFoiG6eEOOUEbZgTH4JkC+Ya+5m7Xzd1f7RO5xZMHI5B
 d/89UMieWa/ghUFM7V+78KQ+T2l80MHlmYm77A51TJsG9RAoH9x3TCQ61/cvY88AefPa
 HzoA==
X-Gm-Message-State: AOAM531xAP070Nel4uDZpV7PDYUbQDfdc/hKvL8p5gm37JAsCEpJ6bwH
 WdxJBxQIQZO2/M40Ppr3v8VMPn9Y9cs=
X-Google-Smtp-Source: ABdhPJykVD6IavRzrZjDiME+FThgqK3Gt5lyrKC5y3pjRYndt668x++cvpFNFyd6n7HMW90tfUBy/A==
X-Received: by 2002:a50:c406:: with SMTP id v6mr7299359edf.367.1607122795754; 
 Fri, 04 Dec 2020 14:59:55 -0800 (PST)
Received: from x1w.redhat.com (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id v24sm4387953edw.23.2020.12.04.14.59.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Dec 2020 14:59:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Simplify gen_msa_BxZ() 'if' condition
Date: Fri,  4 Dec 2020 23:59:53 +0100
Message-Id: <20201204225953.2755588-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As gen_check_zero_element() already produces a boolean,
replace 'if (x) tcg_gen_setcondi_tl()' by tcg_gen_xori_tl(x)
which already contains the if (x).

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Based-on: <20201202184415.1434484-1-f4bug@amsat.org>
---
 target/mips/translate.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 8a35d4d0d03..112a5becfbb 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -28778,9 +28778,7 @@ static bool gen_msa_BxZ(DisasContext *ctx, int df, int wt, int s16, bool if_not)
     }
 
     gen_check_zero_element(bcond, df, wt);
-    if (if_not) {
-        tcg_gen_setcondi_tl(TCG_COND_EQ, bcond, bcond, 0);
-    }
+    tcg_gen_xori_tl(bcond, bcond, if_not);
 
     ctx->btarget = ctx->base.pc_next + (s16 << 2) + 4;
     ctx->hflags |= MIPS_HFLAG_BC;
-- 
2.26.2


