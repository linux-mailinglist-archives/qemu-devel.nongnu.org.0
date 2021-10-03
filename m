Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E419142020A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 16:27:14 +0200 (CEST)
Received: from localhost ([::1]:47170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX2SQ-0001zl-0l
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 10:27:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2Pp-0000hS-1t
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 10:24:33 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:37457)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2Pn-0001jJ-M2
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 10:24:32 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 j10-20020a1c230a000000b0030d523b6693so6117033wmj.2
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 07:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lpJOcUfX3QlDekAfq0GErVJB9iwYa3lMEMw+O6tafBY=;
 b=J/Zm4zBQwyoaLu1qnU15ykisco4YdtElGt5o0VBU/pymyGYeF3EDkvmByFgJ2GaUhw
 o4h/ROvvlHUgeBXOvgwqQsrVW/wT6JdeW1BP4AoCVQ/vWoerfglyF6sPl7fJDj6BDcZt
 KCcwZtyg2y9J1V2UzHq8ZUKebpN2iX5iQzLyA+lVtZgjAAY+jcdjtOWHDIBBX3CWzhFI
 rIPi7zadJT5mwRPLS97TY6lM2dNtg6hcmtodozYDLAlCIz36mWRjw5gjdu57DxuMPJWE
 YpdSiLbTx9wPRidRBMCBayAx3pY0BrC96jI/mWKa1mBqgs3rsIdO5KxyjIDkh2A0t/lk
 f/OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=lpJOcUfX3QlDekAfq0GErVJB9iwYa3lMEMw+O6tafBY=;
 b=kj8pTTThXFtkPU1gyUiAKLiuSKYSsfB1114btCSh6cdcgRPsjDcAOgpQhD7SYYcXnz
 r28jlJfMDDtWMTcF8qqBFYUg+thu8LgnKKZsFYJapc1i6tczlcyb4DI9iB2t9NNNEUQ5
 x1m4txM0aViKOH+3de4iGtYMYsFEo6Ydo/KKi8FI23KNwIk190ezfHE7C8jGH9AciVZu
 UIXBHCUYxSQBvi0BKG3eOQZdsrxA8Oz8CWqxqU3OvYQkB8tklvVWNqM3atY9tj25VDgj
 6Suxijz06IMMs88sW2AtZjIeMTTUFKR1T/WIeuJ3wD2IRc51rWaVcMhoqBGzCpHCj6Lf
 veWQ==
X-Gm-Message-State: AOAM533ceJEHWs1hq+mDbR0gL97eFRt7nbnZgv9+qpNYqt4e40Q7kplY
 nGY/tISde99rnZmHByU8yTAvj9jjx44=
X-Google-Smtp-Source: ABdhPJyqHicNb6oWLeDKGgpnNkv2pqWJeal6vKJy2ZYi2+d/9HOQ2VZfaaWTqhq+WoHC3ORKa8EKNA==
X-Received: by 2002:a7b:c74d:: with SMTP id w13mr14208229wmk.11.1633271069787; 
 Sun, 03 Oct 2021 07:24:29 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 l124sm13845926wml.8.2021.10.03.07.24.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 07:24:29 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/m68k: Optimize shift_mem() using extract() TCG opcode
Date: Sun,  3 Oct 2021 16:24:28 +0200
Message-Id: <20211003142428.3676092-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
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
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When running the scripts/coccinelle/tcg_gen_extract.cocci
Coccinelle semantic patch on target/m68k/, we get:

    [DBG] candidate at target/m68k/translate.c:3668

Manually inspect and replace combinations of (shri, andi)
and (movi, andi) opcodes by the extract opcode.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/m68k/translate.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 50a55f949cd..a38cf414077 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -3665,7 +3665,7 @@ DISAS_INSN(shift_mem)
     SRC_EA(env, src, OS_WORD, !logical, &addr);
     tcg_gen_movi_i32(QREG_CC_V, 0);
     if (left) {
-        tcg_gen_shri_i32(QREG_CC_C, src, 15);
+        tcg_gen_extract_i32(QREG_CC_C, src, 15, 1);
         tcg_gen_shli_i32(QREG_CC_N, src, 1);
 
         /*
@@ -3678,7 +3678,7 @@ DISAS_INSN(shift_mem)
             tcg_gen_xor_i32(QREG_CC_V, QREG_CC_N, src);
         }
     } else {
-        tcg_gen_mov_i32(QREG_CC_C, src);
+        tcg_gen_extract_i32(QREG_CC_C, src, 0, 1);
         if (logical) {
             tcg_gen_shri_i32(QREG_CC_N, src, 1);
         } else {
@@ -3687,7 +3687,6 @@ DISAS_INSN(shift_mem)
     }
 
     gen_ext(QREG_CC_N, QREG_CC_N, OS_WORD, 1);
-    tcg_gen_andi_i32(QREG_CC_C, QREG_CC_C, 1);
     tcg_gen_mov_i32(QREG_CC_Z, QREG_CC_N);
     tcg_gen_mov_i32(QREG_CC_X, QREG_CC_C);
 
-- 
2.31.1


