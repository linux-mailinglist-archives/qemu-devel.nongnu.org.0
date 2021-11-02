Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 505B5442F8A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:56:50 +0100 (CET)
Received: from localhost ([::1]:40346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhuHR-0000Sp-E7
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:56:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4O-0008Th-Ri
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:20 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:33490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4M-00060Y-7H
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:20 -0400
Received: by mail-wr1-x430.google.com with SMTP id d24so2815431wra.0
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:43:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cqMjHHYN10H3op3QY78nRkjwyRaM4nA6KOm3QFWkggo=;
 b=ebPrOGqR+jFCdtjYa8fhw8ZKVIMlJm/11ws1hcFZ/RkzQtPq93/y1+nnxWZM50s39i
 GTqVfnCmuT0iJ5lV/78aUf1Wb8hpuvzHPeD/MgDIFZGsIPjEsqu0vjowbaAm4d85uYVM
 vaXJ7yqLtVSOfrMYxNSk7QSaX7AibPht0+goNwJ2IYp3qNB1/4MachooV9aOSyZlYSnn
 MO1FvBHRbcgs0Ou6I75GoLszLpa1TzVfJDGH0ySQigeBrGxfI5tfESOho3rn7Rd27nuh
 tNbtUKs+rngOrxyg0vUzBIzjBOB+1/czA6CQAOvH+Wpmg5inGztIfRqduToTeE5F4OD6
 tu6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=cqMjHHYN10H3op3QY78nRkjwyRaM4nA6KOm3QFWkggo=;
 b=KFlxaw1ZuAQ07pHoPDz33QmT10XD+OYew6Q5QTH3q0v081v48Ad5QVKjevKcd2G64y
 5ARsDDbx7BstnvKmYNhZdsQnQevsUDbPQrOwZxb8jnECh/g2ZxUGDHLuS8HlTPw/5QXq
 TMaIlfH+5SQba1m4VvUVAkb0UHV3mbs4NV3pDiu2EG5jfVnYMIctPsUkut7rhbM8WWbk
 Yk9XOaSAkbyEUsqkLbd6KCDtTXTEJ9QM6VjhUd8ztb7yxCUDNv7HhgiuLGjp4xXiLlUs
 1n6tW8wSIord39trjuyHZxPTr9Ew7gsDsTaL8puUy5iV5SfZqCGRwmdqAIxAugT5JbI9
 rViw==
X-Gm-Message-State: AOAM533Rs7YDD6aO0LVkyJWp+CkFW8eU3hHseKLEJ68u71IE2L2poaQa
 erfpCc/sMEwC/ZHwDJttdun5A52mJIM=
X-Google-Smtp-Source: ABdhPJzhwyo4vZwVoFFnQrj8JV+RIiOW+tnhV5PN8fc6Qfmi8wi1FwUG4OHZ2AS3v0oaB0xBE7Rz1g==
X-Received: by 2002:adf:ded0:: with SMTP id i16mr42517579wrn.335.1635860596651; 
 Tue, 02 Nov 2021 06:43:16 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 j38sm2614285wms.29.2021.11.02.06.43.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:43:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 07/41] target/mips: Use dup_const() to simplify
Date: Tue,  2 Nov 2021 14:42:06 +0100
Message-Id: <20211102134240.3036524-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
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
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

The dup_const() helper makes the code easier to follow, use it.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211028210843.2120802-5-f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index 3aa15e147c2..b135c58fd4f 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -315,28 +315,11 @@ static void gen_check_zero_element(TCGv tresult, uint8_t df, uint8_t wt,
 {
     /* generates tcg ops to check if any element is 0 */
     /* Note this function only works with MSA_WRLEN = 128 */
-    uint64_t eval_zero_or_big = 0;
-    uint64_t eval_big = 0;
+    uint64_t eval_zero_or_big = dup_const(df, 1);
+    uint64_t eval_big = eval_zero_or_big << ((8 << df) - 1);
     TCGv_i64 t0 = tcg_temp_new_i64();
     TCGv_i64 t1 = tcg_temp_new_i64();
-    switch (df) {
-    case DF_BYTE:
-        eval_zero_or_big = 0x0101010101010101ULL;
-        eval_big = 0x8080808080808080ULL;
-        break;
-    case DF_HALF:
-        eval_zero_or_big = 0x0001000100010001ULL;
-        eval_big = 0x8000800080008000ULL;
-        break;
-    case DF_WORD:
-        eval_zero_or_big = 0x0000000100000001ULL;
-        eval_big = 0x8000000080000000ULL;
-        break;
-    case DF_DOUBLE:
-        eval_zero_or_big = 0x0000000000000001ULL;
-        eval_big = 0x8000000000000000ULL;
-        break;
-    }
+
     tcg_gen_subi_i64(t0, msa_wr_d[wt << 1], eval_zero_or_big);
     tcg_gen_andc_i64(t0, t0, msa_wr_d[wt << 1]);
     tcg_gen_andi_i64(t0, t0, eval_big);
-- 
2.31.1


