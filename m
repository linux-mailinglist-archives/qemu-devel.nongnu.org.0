Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532DE3B40E9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 11:52:25 +0200 (CEST)
Received: from localhost ([::1]:45878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwiVc-0005vr-Ai
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 05:52:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi42-0004Zw-Bu
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:23:54 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:33730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwi40-0001hn-NP
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 05:23:54 -0400
Received: by mail-wr1-x42a.google.com with SMTP id d11so9876590wrm.0
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 02:23:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vux3pRxRjKycdWHxcdq6t2Uw4/zpg6Clkow+InjP29Q=;
 b=mFJBwGdydAYfpQyoRXJrQCUfQ/BHdeVZs/1l+VVgftCQRSSjK/8gEQQ2HLql1z3Qrn
 yuUiW05o9AcH1UQ0tk0sszsoGDU2k0RGzi5CFcgtV34lewr1l50DHbCz+HjU20GomztN
 WLadwpdgKNeutQabIjjnh57mhjaKv6sUZkdOnLRKiIvYcsL2Gw8rcJPYOxGZF5e6cS6K
 +M5opfO44GJ+hI1O6DAqF2AKI+s98FuRL+MyY/rStgBTDQa0IUB2jFOX0FQo3urSEYq+
 n4QhM9BgLDIUuQEqj8mLJRwDgasdhXmHSr4SuQ7g5Cgz/zD42UMDs9GoXNNhwWZEALcB
 uokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=vux3pRxRjKycdWHxcdq6t2Uw4/zpg6Clkow+InjP29Q=;
 b=mZcolQIpzQC+5qz/MGgt5zL0gpoSsVqvGwleKxXu5qBZUnwevz3dRq/VNDtfkSvf7R
 uEZ5vswCV15/3SOjTdZzy7T1clRSH98peKmzjqzOpaeXcduGbVdsTAL2ogd9PtkpPHEO
 O1d2YWtuQxKmZj/zGUGjtEXgvN0UuKihbkknbOS3qT9m/oWv2dPdlmHymAn2X7m0rdqF
 8ArqZ6zwYgTxU48Hr0Cdbsx3REYskz2y7X5y2eCj11ntgq8ma3OgBMp7PO7jbjX9FVVw
 Bu/6ZV3+1lqbhSf04SOSbPNIRHBVzW4uCoaOLDW8i5ZlbT3X2KD0hPGkX0opVK8IIj6I
 zwZw==
X-Gm-Message-State: AOAM533Xxg4MaQcR2hT59VDgYjj9iP2G5rXZ0bgCJCDYKsc6VagrLV2y
 W/EPTeLJfIlHnduq5nJlzkkTCyxq9UF5jw==
X-Google-Smtp-Source: ABdhPJyACY5tC87R5tPnFolNYvIu7yaY7tTMWDt+fiNi6JxP/2yIKKpUhV1zoQg9sJUFAkLvTdpb+A==
X-Received: by 2002:a05:6000:1245:: with SMTP id
 j5mr9677750wrx.371.1624613031263; 
 Fri, 25 Jun 2021 02:23:51 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n7sm10503951wmq.37.2021.06.25.02.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 02:23:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/15] target/mips: Raise exception when DINSV opcode used with
 DSP disabled
Date: Fri, 25 Jun 2021 11:23:18 +0200
Message-Id: <20210625092329.1529100-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625092329.1529100-1-f4bug@amsat.org>
References: <20210625092329.1529100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Jia Liu <proljc@gmail.com>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the "MIPS® DSP Module for MIPS64 Architecture" manual, rev. 3.02,
Table 5.3 "SPECIAL3 Encoding of Function Field for DSP Module":

  If the Module/ASE is not implemented, executing such an instruction
  must cause a Reserved Instruction Exception.

The DINSV instruction lists the following exceptions:
- Reserved Instruction
- DSP Disabled

If the MIPS core doesn't support the DSP module, or the DSP is
disabled, do not handle the '$rt = $0' case as a no-op but raise
the proper exception instead.

Cc: Jia Liu <proljc@gmail.com>
Fixes: 1cb6686cf92 ("target-mips: Add ASE DSP bit/manipulation instructions")
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210529165443.1114402-1-f4bug@amsat.org>
---
 target/mips/tcg/translate.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 09b19262c8c..3fd0c48d772 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -24379,10 +24379,11 @@ static void decode_opc_special3_legacy(CPUMIPSState *env, DisasContext *ctx)
         {
             TCGv t0, t1;
 
+            check_dsp(ctx);
+
             if (rt == 0) {
                 break;
             }
-            check_dsp(ctx);
 
             t0 = tcg_temp_new();
             t1 = tcg_temp_new();
-- 
2.31.1


