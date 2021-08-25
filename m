Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7313F75AA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 15:12:48 +0200 (CEST)
Received: from localhost ([::1]:45246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIshz-0005hX-CD
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 09:12:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYd-0007fc-9J
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:07 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mIsYY-0002SN-Ma
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 09:03:06 -0400
Received: by mail-wr1-x42f.google.com with SMTP id h13so36392260wrp.1
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 06:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LZap06vt4iJXyncO8vRLHIVIRkkdsRFHm2whoM92bZc=;
 b=T5pjpeHl7MMnKujbgucKKqvO+I1ucFdjcEnJ3Wkek3ydJLzbfwqzKWbOm/1FyZZe5/
 shymscM/wEvL/BkvYtZLNraUGdIy2dFtL66+apgf0wtfeOtz66mfkEyOR7FKU8XEvtOs
 QGH2mg3vENjq479SE12kvvRCp2RjFyAfn5VMX5pkNRuDtZnu8zHyr/rPA0dF93tlW22n
 f/e6Rve+n6LJRxwq9JH7jff680pqsqSvdTVLdGuee/AhNxiKF82fv7EGDLHIonUgoHBi
 i1ZslJSSrrsebQmDeY2Kso6wdA1/rnmi17qMalk824PmAH9wOo4c3+r3KuRn6TfVL5TF
 gx8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=LZap06vt4iJXyncO8vRLHIVIRkkdsRFHm2whoM92bZc=;
 b=Hi3UqJdTeuSFDZs8GF4QG5jf5w1TdBXUbV5G7eAxnNG13dZk3AXfKlogc2H1cdeugf
 Pg1KVDZUHXQ1CYOCSj4Yv4MqLG8gTiLI0MHxWwAxv9BbOUcof88Vtkij+C6FZrEmGdFC
 STvadNlZuerGK4V+f4yuohIfUDl7oACNEXZvDMIfecqlAXGhO2QALHzAO1+/5vP5x2xz
 9L0uPAzKpk48R8CiEYQgivEtOB+HYpwszHyyxkIBCt+W8cGucL1jGHJ1jQAPg0oALwS4
 S9QHb/HqJuA29b3cWlC4YXvOArXfbSgH5gtH+LWrnzMbZlxxv9BPuC5azEXlr/dIu/Tz
 +6OQ==
X-Gm-Message-State: AOAM532T+SuqyZ8JvAc9xUDnHToDe0jPYRpfkJhNHJe+0ArbPzwdOTOs
 iuVBJIZhOCV0WCQK5PjOhlLHj1oTJYg=
X-Google-Smtp-Source: ABdhPJwntRhH9ALzT3dnleKVhQGNHcsUm+37bTc45wLA7KpCylKACPUZBnC33KBShOkkYaqVdxf4AA==
X-Received: by 2002:adf:e6c5:: with SMTP id y5mr20893871wrm.198.1629896580653; 
 Wed, 25 Aug 2021 06:03:00 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 m12sm4770251wrq.29.2021.08.25.06.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 06:03:00 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/28] target/mips: Convert Vr54xx MACC* opcodes to decodetree
Date: Wed, 25 Aug 2021 15:01:53 +0200
Message-Id: <20210825130211.1542338-11-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825130211.1542338-1-f4bug@amsat.org>
References: <20210825130211.1542338-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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

 * MACC         Multiply, accumulate, and move LO
 * MACCHI       Multiply, accumulate, and move HI
 * MACCHIU      Unsigned multiply, accumulate, and move HI
 * MACCU        Unsigned multiply, accumulate, and move LO

Since all opcodes are generated using the same pattern, we
add the gen_helper_mult_acc_t typedef and MULT_ACC() macro
to remove boilerplate code.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210808173018.90960-6-f4bug@amsat.org>
---
 target/mips/tcg/vr54xx.decode      |  9 ++++++++
 target/mips/tcg/translate.c        | 16 ---------------
 target/mips/tcg/vr54xx_translate.c | 33 ++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/target/mips/tcg/vr54xx.decode b/target/mips/tcg/vr54xx.decode
index f6b3e42c999..73778f101a5 100644
--- a/target/mips/tcg/vr54xx.decode
+++ b/target/mips/tcg/vr54xx.decode
@@ -6,3 +6,12 @@
 #
 # Reference: VR5432 Microprocessor User’s Manual
 #            (Document Number U13751EU5V0UM00)
+
+&r              rs rt rd
+
+@rs_rt_rd       ...... rs:5  rt:5  rd:5  ..... ......   &r
+
+MACC            000000 ..... ..... ..... 00101011000    @rs_rt_rd
+MACCU           000000 ..... ..... ..... 00101011001    @rs_rt_rd
+MACCHI          000000 ..... ..... ..... 01101011000    @rs_rt_rd
+MACCHIU         000000 ..... ..... ..... 01101011001    @rs_rt_rd
diff --git a/target/mips/tcg/translate.c b/target/mips/tcg/translate.c
index 34363639937..fd8ffadf06e 100644
--- a/target/mips/tcg/translate.c
+++ b/target/mips/tcg/translate.c
@@ -300,16 +300,12 @@ enum {
 enum {
     OPC_VR54XX_MULS    = (0x03 << 6) | OPC_MULT,
     OPC_VR54XX_MULSU   = (0x03 << 6) | OPC_MULTU,
-    OPC_VR54XX_MACC    = (0x05 << 6) | OPC_MULT,
-    OPC_VR54XX_MACCU   = (0x05 << 6) | OPC_MULTU,
     OPC_VR54XX_MSAC    = (0x07 << 6) | OPC_MULT,
     OPC_VR54XX_MSACU   = (0x07 << 6) | OPC_MULTU,
     OPC_VR54XX_MULHI   = (0x09 << 6) | OPC_MULT,
     OPC_VR54XX_MULHIU  = (0x09 << 6) | OPC_MULTU,
     OPC_VR54XX_MULSHI  = (0x0B << 6) | OPC_MULT,
     OPC_VR54XX_MULSHIU = (0x0B << 6) | OPC_MULTU,
-    OPC_VR54XX_MACCHI  = (0x0D << 6) | OPC_MULT,
-    OPC_VR54XX_MACCHIU = (0x0D << 6) | OPC_MULTU,
     OPC_VR54XX_MSACHI  = (0x0F << 6) | OPC_MULT,
     OPC_VR54XX_MSACHIU = (0x0F << 6) | OPC_MULTU,
 };
@@ -3780,12 +3776,6 @@ static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
     case OPC_VR54XX_MULSU:
         gen_helper_mulsu(t0, cpu_env, t0, t1);
         break;
-    case OPC_VR54XX_MACC:
-        gen_helper_macc(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MACCU:
-        gen_helper_maccu(t0, cpu_env, t0, t1);
-        break;
     case OPC_VR54XX_MSAC:
         gen_helper_msac(t0, cpu_env, t0, t1);
         break;
@@ -3804,12 +3794,6 @@ static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
     case OPC_VR54XX_MULSHIU:
         gen_helper_mulshiu(t0, cpu_env, t0, t1);
         break;
-    case OPC_VR54XX_MACCHI:
-        gen_helper_macchi(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MACCHIU:
-        gen_helper_macchiu(t0, cpu_env, t0, t1);
-        break;
     case OPC_VR54XX_MSACHI:
         gen_helper_msachi(t0, cpu_env, t0, t1);
         break;
diff --git a/target/mips/tcg/vr54xx_translate.c b/target/mips/tcg/vr54xx_translate.c
index 13e58fdd8df..0e2d460c985 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -17,3 +17,36 @@
 
 /* Include the auto-generated decoder. */
 #include "decode-vr54xx.c.inc"
+
+/*
+ * Integer Multiply-Accumulate Instructions
+ *
+ * MACC         Multiply, accumulate, and move LO
+ * MACCHI       Multiply, accumulate, and move HI
+ * MACCHIU      Unsigned multiply, accumulate, and move HI
+ * MACCU        Unsigned multiply, accumulate, and move LO
+ */
+
+static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
+                           void (*gen_helper_mult_acc)(TCGv, TCGv_ptr, TCGv, TCGv))
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    gen_helper_mult_acc(t0, cpu_env, t0, t1);
+
+    gen_store_gpr(t0, a->rd);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return false;
+}
+
+TRANS(MACC,     trans_mult_acc, gen_helper_macc);
+TRANS(MACCHI,   trans_mult_acc, gen_helper_macchi);
+TRANS(MACCHIU,  trans_mult_acc, gen_helper_macchiu);
+TRANS(MACCU,    trans_mult_acc, gen_helper_maccu);
-- 
2.31.1


