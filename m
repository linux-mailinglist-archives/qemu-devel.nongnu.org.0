Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0850B3F75B0
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:14:39 +0200 (CEST)
Received: from localhost ([::1]:53066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIsjm-0002ae-3T
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:14:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYg-0007pJ-0d
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:10 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:43772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYd-0002U9-2j
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:09 -0400
Received: by mail-wr1-x431.google.com with SMTP id b6so886556wrh.10
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1InHLDyLMoVIPgUl5N57kBbU8uQ5248f3m0OzX9ka6c=;
 b=dDCd5pDYUGUOHXFOQhjfq0rCpErfu+Xpf9EwjwxvKHCUjMjjIuv4/JNbctKMMTYaFM
 qblSzjzWzU5/VbZ4vPQlER+jw86MxWjdTegImJ9wuL0JVazBEH0vgyleEjZbUB0GviXb
 F3jo6lQyWafBqojw1wwz/2VlJIrof7lCacLXBHo1ADeAk0YH+NZQRqGoMLq5QKzQwgTa
 w4RxacV04V3ENPp4yt+YQaVXHJHVamfY54dlaHFTkwF+ZAvg+G7ly/uyFhG4mHFUQ5Zq
 XTg37ivUiCeXhwgm/CPr8PoS2wmWdMq6K6erxZ/BH8tM6lac3hseYqC5DiJBa6+CpEYC
 LXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=1InHLDyLMoVIPgUl5N57kBbU8uQ5248f3m0OzX9ka6c=;
 b=r+4PZEBRO5VqwHNTI6biz8iuh8geYKfkKJ1B4ErKGPHiv2GtYk5LpS9v0xLrbw9ulF
 9rQ9vLfJ24sgbfcXKE2434NfiCDqCo+MY/SEy4iSHON1xWKi5G654iG4krQDeAQSsVoW
 UnV/PbOcquVMorRMDKlRfUeXRCCFUm1RXYvPqHAvz5a4N4JOnnVxoFmSxkAfWNh17H7B
 BCdruG9g73oFnk55Sz2HJw4X9u+1i0zank8y9Gk3AWDbRFSUaKPGPmbnCh9rBs/ZLEGy
 JCPP1Fxwi2CsG2ZeL+cFDwTGe9SO6+hQGgxngeMiEK5QmeF2iNsrqnCSva7PoN1SynD7
 oPng==
X-Gm-Message-State: AOAM533AGg8Hnvtq/lKQuzi3TKOtr6yjSH8pn6Nnr/PkAqDGmh7+/dme
 HJiL7gOckeBp6cCbnwEXusPiFAvMjN4=
X-Google-Smtp-Source: ABdhPJzKkqB3/Bv0Kt6O+2Zd6VNCmW5UzFD3ukl+93R4AWAckFZtRiU4MV7XWbc1LDNDV0As3f0c2g==
X-Received: by 2002:a5d:67c6:: with SMTP id n6mr25164076wrw.150.1629896585348; 
 Wed, 25 Aug 2021 06:03:05 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 q9sm5720738wrs.3.2021.08.25.06.03.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/28] target/mips: Convert Vr54xx MUL* opcodes to decodetree
Date: Wed, 25 Aug 2021 15:01:54 +0200
Message-Id: <20210825130211.1542338-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the following Integer Multiply-Accumulate opcodes:

 * MULHI        Multiply and move HI
 * MULHIU       Unsigned multiply and move HI
 * MULS         Multiply, negate, and move LO
 * MULSHI       Multiply, negate, and move HI
 * MULSHIU      Unsigned multiply, negate, and move HI
 * MULSU        Unsigned multiply, negate, and move LO

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210808173018.90960-7-f4bug@amsat.org>
---
 target/mips/tcg/vr54xx.decode      |  6 ++++++
 target/mips/tcg/translate.c        | 24 ------------------------
 target/mips/tcg/vr54xx_translate.c | 12 ++++++++++++
 3 files changed, 18 insertions(+), 24 deletions(-)

diff --git a/target/mips/tcg/vr54xx.decode b/target/mips/tcg/vr54xx.decode
index 73778f101a5..79bb5175eab 100644
--- a/target/mips/tcg/vr54xx.decode
+++ b/target/mips/tcg/vr54xx.decode
@@ -11,7 +11,13 @@
 
 @rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &r
 
+MULS            000000 ..... ..... ..... 00011011000    @rs_rt_rd
+MULSU           000000 ..... ..... ..... 00011011001    @rs_rt_rd
 MACC            000000 ..... ..... ..... 00101011000    @rs_rt_rd
 MACCU           000000 ..... ..... ..... 00101011001    @rs_rt_rd
+MULHI           000000 ..... ..... ..... 01001011000    @rs_rt_rd
+MULHIU          000000 ..... ..... ..... 01001011001    @rs_rt_rd
+MULSHI          000000 ..... ..... ..... 01011011000    @rs_rt_rd
+MULSHIU         000000 ..... ..... ..... 01011011001    @rs_rt_rd
 MACCHI          000000 ..... ..... ..... 01101011000    @rs_rt_rd
 MACCHIU         000000 ..... ..... ..... 01101011001    @rs_rt_rd
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index fd8ffadf06e..4b7f2d9ae8b 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -298,14 +298,8 @@ enum {
 #define MASK_MUL_VR54XX(op)         (MASK_SPECIAL(op) | (op & (0x1F << 6)))
 
 enum {
-    OPC_VR54XX_MULS    = (0x03 << 6) | OPC_MULT,
-    OPC_VR54XX_MULSU   = (0x03 << 6) | OPC_MULTU,
     OPC_VR54XX_MSAC    = (0x07 << 6) | OPC_MULT,
     OPC_VR54XX_MSACU   = (0x07 << 6) | OPC_MULTU,
-    OPC_VR54XX_MULHI   = (0x09 << 6) | OPC_MULT,
-    OPC_VR54XX_MULHIU  = (0x09 << 6) | OPC_MULTU,
-    OPC_VR54XX_MULSHI  = (0x0B << 6) | OPC_MULT,
-    OPC_VR54XX_MULSHIU = (0x0B << 6) | OPC_MULTU,
     OPC_VR54XX_MSACHI  = (0x0F << 6) | OPC_MULT,
     OPC_VR54XX_MSACHIU = (0x0F << 6) | OPC_MULTU,
 };
@@ -3770,30 +3764,12 @@ static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
     gen_load_gpr(t1, rt);
 
     switch (opc) {
-    case OPC_VR54XX_MULS:
-        gen_helper_muls(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MULSU:
-        gen_helper_mulsu(t0, cpu_env, t0, t1);
-        break;
     case OPC_VR54XX_MSAC:
         gen_helper_msac(t0, cpu_env, t0, t1);
         break;
     case OPC_VR54XX_MSACU:
         gen_helper_msacu(t0, cpu_env, t0, t1);
         break;
-    case OPC_VR54XX_MULHI:
-        gen_helper_mulhi(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MULHIU:
-        gen_helper_mulhiu(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MULSHI:
-        gen_helper_mulshi(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MULSHIU:
-        gen_helper_mulshiu(t0, cpu_env, t0, t1);
-        break;
     case OPC_VR54XX_MSACHI:
         gen_helper_msachi(t0, cpu_env, t0, t1);
         break;
diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 0e2d460c985..9f35b2c7e5d 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -25,6 +25,12 @@
  * MACCHI       Multiply, accumulate, and move HI
  * MACCHIU      Unsigned multiply, accumulate, and move HI
  * MACCU        Unsigned multiply, accumulate, and move LO
+ * MULHI        Multiply and move HI
+ * MULHIU       Unsigned multiply and move HI
+ * MULS         Multiply, negate, and move LO
+ * MULSHI       Multiply, negate, and move HI
+ * MULSHIU      Unsigned multiply, negate, and move HI
+ * MULSU        Unsigned multiply, negate, and move LO
  */
 
 static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
@@ -50,3 +56,9 @@ TRANS(MACC,     trans_mult_acc, gen_helper_macc);
 TRANS(MACCHI,   trans_mult_acc, gen_helper_macchi);
 TRANS(MACCHIU,  trans_mult_acc, gen_helper_macchiu);
 TRANS(MACCU,    trans_mult_acc, gen_helper_maccu);
+TRANS(MULHI,    trans_mult_acc, gen_helper_mulhi);
+TRANS(MULHIU,   trans_mult_acc, gen_helper_mulhiu);
+TRANS(MULS,     trans_mult_acc, gen_helper_muls);
+TRANS(MULSHI,   trans_mult_acc, gen_helper_mulshi);
+TRANS(MULSHIU,  trans_mult_acc, gen_helper_mulshiu);
+TRANS(MULSU,    trans_mult_acc, gen_helper_mulsu);
-- 
2.31.1


