Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C913ABAD8
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 19:48:40 +0200 (CEST)
Received: from localhost ([::1]:43010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltw87-0005z5-Bh
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 13:48:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3j-0006qp-3J
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:44:07 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33308)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltw3g-0001Mg-1V
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 13:44:06 -0400
Received: by mail-wr1-x435.google.com with SMTP id d11so5335055wrm.0
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 10:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QQhnyJT7IqQiTtdyfsN9R/GF4TMQXLmBFDH1C75S2Y8=;
 b=OZ/74dMVEsOdFLewUxjSfBSqgE22ViKZop546vCdAhgg/ZsjTfZk4WhYuTEnbQyoMZ
 TqHzGUoGY8Hk+GAHpagGXddaFhFl0JMrSQGgiZZfwfqnkPqn8juQpLMkuJhZK+a9Zql1
 9vS0VqAdv1qZGTZS5zuGxBFazwA+1fSolSmBj7vRrBo75bn3rqOwqECDoEGrNTsPz+eN
 rqJbyq5Esft2ZE1h1RM72od5iCSnpZVyPHoWz/O4eDzQ765k9LmhkIdWKjsMRjmktezb
 L8ERbmRxI11zO7WrNptBDIBJ3OqZIGUoMM/FzNCZpoQOA0TSpHlbXK8UM2ECgm0q90Ph
 BT4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QQhnyJT7IqQiTtdyfsN9R/GF4TMQXLmBFDH1C75S2Y8=;
 b=jdVRQSiEAUOeRDQoqP3o1xZscKt/svrDPi0Zfsh7w2Jg0KX+uMT5gebj3si0wWg9h9
 eZ2IvA7GmsqAJpvZ7gPAoQ17CFe1WEFF14obAyjmznO+LSrxIjaJclWbVKaOAI8FoJY8
 MYB2egVGPS/SfSXYfculBOHQa48P/cyjSyKIhyumm0hQMKs8tJFwlry3mSySL7fWydhy
 N8L/yW85o4oQ3xT0z9kco9UOh196wMrLMOkz2OOqAyl5cSpzvpRTw5K5pfYz3uYYy99g
 /su5Od6AyZ8zp/F+aRKYsORla088TDHiDcFenFTmdDbJMMjBDgV/VrHPHGtH+luTLqGY
 N0OA==
X-Gm-Message-State: AOAM532o4xzsG26guR+zzfEELG3hzsXs1aAnIqPSVCLNWAKpBba6PnGM
 LUL1XiDe/GEp9Wv+5cZkCWz/kQKCZ7Ef+A==
X-Google-Smtp-Source: ABdhPJw0KDPjETB8KqTg2L7wX3/VrkmJgUcDiV6RRV1QCFlI7BClemxutP4dsuZMKRVnwdmyhlO+Iw==
X-Received: by 2002:a5d:4752:: with SMTP id o18mr7152889wrs.323.1623951838775; 
 Thu, 17 Jun 2021 10:43:58 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id h9sm8469142wmm.33.2021.06.17.10.43.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 10:43:58 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 7/9] target/mips: Remove microMIPS BPOSGE32 / BPOSGE64
 unuseful cases
Date: Thu, 17 Jun 2021 19:43:21 +0200
Message-Id: <20210617174323.2900831-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617174323.2900831-1-f4bug@amsat.org>
References: <20210617174323.2900831-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
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

These switch cases for the microMIPS BPOSGE32 / BPOSGE64 opcodes have
been added commit 3c824109da0 ("target-mips: microMIPS ASE support").
More than 11 years later it is safe to assume there won't be added
soon. The cases fall back to the default which generates a RESERVED
INSTRUCTION, so it is safe to remove them.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 47c7705f051..5d571d83c54 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -14077,8 +14077,6 @@ enum {
     BGEZALS = 0x13,
     BC2F = 0x14,
     BC2T = 0x15,
-    BPOSGE64 = 0x1a,
-    BPOSGE32 = 0x1b,
     /* These overlap and are distinguished by bit16 of the instruction */
     BC1F = 0x1c,
     BC1T = 0x1d,
@@ -16122,10 +16120,6 @@ static void decode_micromips32_opc(CPUMIPSState *env, DisasContext *ctx)
                 generate_exception_err(ctx, EXCP_CpU, 1);
             }
             break;
-        case BPOSGE64:
-        case BPOSGE32:
-            /* MIPS DSP: not implemented */
-            /* Fall through */
         default:
             MIPS_INVAL("pool32i");
             gen_reserved_instruction(ctx);
-- 
2.31.1


