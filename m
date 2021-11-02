Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE8A442F4C
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 14:47:51 +0100 (CET)
Received: from localhost ([::1]:41856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhu8k-0006u3-L7
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 09:47:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4Y-0000Bo-5Y
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:30 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:51826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mhu4V-000618-Ox
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 09:43:29 -0400
Received: by mail-wm1-x329.google.com with SMTP id z200so14804920wmc.1
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 06:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pGmk5nM4J97afcci2ysvn5KSokS31yrMASYWBaOPBcc=;
 b=MBvhUq//kir1aolO3zfUXcSO4lwTohkVDDgvdqFuuMl0P7lmVyvveWIJoHv/ehR2gb
 kVee0aUktt1AwyliFHpvDb/sNmQ5lFHZa2lEmEfkFjcJugmwFj8FMIM2zxkE/+5pxCuy
 pwxJDZo7Zsb7eDxkxkNbDJC08bhCaZQCIti7+QYUUwb7lhWmZtvSHFsX7FPKz+RYGhSq
 Bl8icc/2Z8kBqPZX6Ow4MKSqffMngP1n9XwzbDd+J1Wm7hT7ddWF21Xxyazac3is0Zzz
 0oJaROMGJRu1bQsx7n6NaSsuX9UALCrqrStrcbKow00j9iRnqqC+VzWcVJDgrtZVig1t
 JWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=pGmk5nM4J97afcci2ysvn5KSokS31yrMASYWBaOPBcc=;
 b=L4vJc1KeC1/lbBhasaDyFOAfytSW14Pg19dxyDZeg2NSStocv+OjqW6rn3NBEwgATD
 GPUesgMq6cGWtC3UNZQgoNj5QFHY4fY855Zv7chTM5cHMc6gLA+DsgOKY3zprVGUTaHu
 w+p6Xnj4mpHkuofrLpysBUnXsjsFBIBQ+hQST8tcf0q0FKPjdYrNxEBbHBtFT1elR/TO
 SW8Di9mIBhTLNqhQwzh7eYlJi0pg+0qg0E1N43sMsytAFuSNRjIhnnZawGUlJcvrrONs
 Ve1ML8l5zzzJEKMgzj0Xp2ZeYsNC4BiDe2GPBwq1WqWrSausK6JDWU3+dBae978t8btj
 9ODQ==
X-Gm-Message-State: AOAM530aeJLiPdZteI7Sx8EVjyiNFkaJGHpV3RLreyfy4l6MHW8zsslq
 DnUPyvPTvgsI+JFqBSRHkVKoUIM51vA=
X-Google-Smtp-Source: ABdhPJzIuGS3WyhAj6kJ/vCgSKsCoUl+EemXb/frMorabTehwIPL49xHou/4r11HArRliQKxLpMskQ==
X-Received: by 2002:a7b:cf10:: with SMTP id l16mr7274133wmg.17.1635860606019; 
 Tue, 02 Nov 2021 06:43:26 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 8sm2543510wmg.24.2021.11.02.06.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 06:43:25 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/41] target/mips: Use enum definitions from
 CPUMIPSMSADataFormat enum
Date: Tue,  2 Nov 2021 14:42:08 +0100
Message-Id: <20211102134240.3036524-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211102134240.3036524-1-f4bug@amsat.org>
References: <20211102134240.3036524-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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

Replace magic DataFormat value by the corresponding
enum from CPUMIPSMSADataFormat.

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20211028210843.2120802-7-f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index e0ccd8c1cb8..56a0148fec2 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -1791,10 +1791,10 @@ static void gen_msa_3rf(DisasContext *ctx)
     case OPC_MULR_Q_df:
     case OPC_MADDR_Q_df:
     case OPC_MSUBR_Q_df:
-        tdf = tcg_constant_i32(df + 1);
+        tdf = tcg_constant_i32(DF_HALF + df);
         break;
     default:
-        tdf = tcg_constant_i32(df + 2);
+        tdf = tcg_constant_i32(DF_WORD + df);
         break;
     }
 
@@ -2023,7 +2023,7 @@ static void gen_msa_2rf(DisasContext *ctx)
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
     /* adjust df value for floating-point instruction */
-    TCGv_i32 tdf = tcg_constant_i32(df + 2);
+    TCGv_i32 tdf = tcg_constant_i32(DF_WORD + df);
 
     switch (MASK_MSA_2RF(ctx->opcode)) {
     case OPC_FCLASS_df:
-- 
2.31.1


