Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B31613E30AC
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 23:09:21 +0200 (CEST)
Received: from localhost ([::1]:48902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC75k-0002dG-PZ
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 17:09:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72j-0003zL-Q0
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:06:14 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:42928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC72i-0000B1-2w
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 17:06:13 -0400
Received: by mail-wr1-x435.google.com with SMTP id q11so495051wrr.9
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 14:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6SZML5P41Leg5fiH1VZakhfKR7iqv+jE35zozdqPu0Q=;
 b=Oq/AIUPthETedkPR1vYhAFmt0dOyu2Dsa8i9kJ7DrysdyAnZ9QLyH45EtEPqyf3fCA
 VwzscSd3nT8pblAH7Ou3hYfu0k+qeAy1cSUhTlDGxhmWWdBsslmL8sMt+0z9yLZyVxLr
 p+jvKH+JpeBQOD1BkHAsKP7cLxEGJes8YOTjRm/swpmkgy3xwohsClyiHVGJENvbOj9k
 5qplNT9LIqsEFmH6Cv3XgUof6JFicmx4DzF3vi2Idrnx1twCLhKL833s/ji7wKEDRT2U
 BGEOI0APjna0MxPyCvjqDn9PV7/OjXe3XyNAsjirVHdyl6Gnmv2pigUgdcpEsdrCLer+
 c8sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6SZML5P41Leg5fiH1VZakhfKR7iqv+jE35zozdqPu0Q=;
 b=cJ9/jiagPaQBS2FP1IQWtGS9NYIxF+1iXLgriSoI8BPV0ob8Q8zNzj72jrT9IHMiR/
 zsS9zFHiZYjZ2Cy+3LYv8SHP9NAl17oWBmcwLZ46IlFAimlmzkgbuK8T8ZgjIRx7ihbF
 ZqkaCp99DSskYGHXzCmw//gK5C33knxa8gS7DddOf89gY0yXbjlGSg5YuuYEM8egzroV
 4F9lQKg5JsB58hkZ2zjq2xBSo2V0dcfbxW5NmIjAYjrcR4D02afeYLCyAWbZA9DMQuKy
 DOj88cK4VxppguoF7UhQz9iFzow8Tp+PfChsgDCeLZpMNf+wqlmAW1xiJchy2T3nOIp9
 RAyA==
X-Gm-Message-State: AOAM531gclZ/eK+DyXFyyhWO5fVWogIXENVnwyIZqiBCtI51e5wE7fLI
 ZjU4cBBPIcarucv3MepMBYs2X7IWDvN8z4ywStA=
X-Google-Smtp-Source: ABdhPJzGI/uk3FcntvsA8ELqzmZCzabIsbOjbKAWo06OWP2ROzSiAOp+tpfYfIQrvA7ocD16SpNnNw==
X-Received: by 2002:a05:6000:120f:: with SMTP id
 e15mr12616111wrx.399.1628283970520; 
 Fri, 06 Aug 2021 14:06:10 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 h9sm9333216wmb.35.2021.08.06.14.06.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 14:06:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 v2 4/5] target/mips: Convert Vr54xx MUL* opcodes to
 decodetree
Date: Fri,  6 Aug 2021 23:05:47 +0200
Message-Id: <20210806210548.8568-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210806210548.8568-1-f4bug@amsat.org>
References: <20210806210548.8568-1-f4bug@amsat.org>
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Aurelien Jarno <aurelien@aurel32.net>
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
index 76e153d61aa..864773faf80 100644
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
index f749fc588b7..d70641dee13 100644
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
 
 typedef void gen_helper_mult_acc_t(TCGv, TCGv_ptr, TCGv, TCGv);
@@ -60,3 +66,9 @@ TRANS(MACC,     trans_mult_acc, gen_helper_macc);
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


