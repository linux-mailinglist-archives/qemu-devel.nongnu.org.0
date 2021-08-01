Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE52A3DCE3D
	for <lists+qemu-devel@lfdr.de>; Mon,  2 Aug 2021 02:02:00 +0200 (CEST)
Received: from localhost ([::1]:39016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mALP5-0006PP-SP
	for lists+qemu-devel@lfdr.de; Sun, 01 Aug 2021 20:01:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALMv-0003l5-Iv
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:45 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:42612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mALMu-0006tA-0L
 for qemu-devel@nongnu.org; Sun, 01 Aug 2021 19:59:45 -0400
Received: by mail-wr1-x432.google.com with SMTP id j2so19277641wrx.9
 for <qemu-devel@nongnu.org>; Sun, 01 Aug 2021 16:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ygTviteO4ICr+Dt5AxHx9smElVVVjf1jYJCNvq3bytw=;
 b=PipBSvp9aZ87XDb0yLykTwnPrk78rZzJHZ6+T2bDEvRM+RbNENTm/fiLKoLfPPaim5
 BS0vfP3rNiZncbKVqKQDQuY7VZWFqx07DWLbAKVb3ng2WzgLJ9/Xs8l1Ae2NEtDIbpaN
 WlPhzLpNqKQrJ9x5LB24wpTvjrRN4BG4UZLwTdEFPXAMXAmxUMqRo4u8ojTTS1RIsBgV
 RqgY+93c4/6cFThoPRG+pr23FGWwcq99Mptijzhwnc2f7ugjYkIc/ECyMe628mybVbxc
 szKdjvdILAL30aXE1vZpwmks+eFaJTklvUsetyrfDeLT8LgbcYElHIzGGZKTwKZmwIob
 Cpuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=ygTviteO4ICr+Dt5AxHx9smElVVVjf1jYJCNvq3bytw=;
 b=qqbPnRpsxNJuIaWmuSTlX2fDfxVd1Dh70o0nvhMTkU36oycrMdlBFst4gRSQO9Fk7j
 Vj7COJbYyz1AHvT/u7VJ+sA3jAgGSmccUMZdtDqms5Zl1ysHkn6K6PoyeIJNV0RM2k/W
 r6c5e9q8vN0Zy1Mas6XsyRUF0rtig0VkfefxPnhwWxASyT+k/UnQpDAYXigTCrRmERxo
 n06HQimWjWjnBRbAHxVFz5Wmh9otUwVuf/CghmZWoBIyW9C5wlsCV9HsTb8j27Gqhzwo
 hutBcgEqeLKElcRsQj+4bhQpuz5b/AVbS75suKMEhEj7mQrlKFekQY9YFbsXopqEUREH
 /l/g==
X-Gm-Message-State: AOAM531SmdxO4NJsKT5ZzuxewbSnXcTROT4Slfvcisgmkj7NpMP3/wI+
 AgwOrgJ4sMul85KDX1AQHpIUAwxb+jEOYw==
X-Google-Smtp-Source: ABdhPJzwghYsWLAQxqrLnerG9aZf8/xK3Ha068VBmZKl7nUYXzLp/dO+HI8FyIe+sck/whpj7mIt7Q==
X-Received: by 2002:a5d:5147:: with SMTP id u7mr14611186wrt.181.1627862382412; 
 Sun, 01 Aug 2021 16:59:42 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 u11sm9647414wrt.89.2021.08.01.16.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Aug 2021 16:59:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.2 3/5] target/mips: Convert Vr54xx MACC* opcodes to
 decodetree
Date: Mon,  2 Aug 2021 01:59:24 +0200
Message-Id: <20210801235926.3178085-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210801235926.3178085-1-f4bug@amsat.org>
References: <20210801235926.3178085-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
 Aurelien Jarno <aurelien@aurel32.net>,
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/vr54xx.decode      |  9 +++++++
 target/mips/tcg/translate.c        | 16 ------------
 target/mips/tcg/vr54xx_translate.c | 40 ++++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+), 16 deletions(-)

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
index 98dfcf5afd1..8d29a0d4e4b 100644
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
index 13e58fdd8df..85e2ec371b9 100644
--- a/target/mips/tcg/vr54xx_translate.c
+++ b/target/mips/tcg/vr54xx_translate.c
@@ -17,3 +17,43 @@
 
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
+typedef void gen_helper_mult_acc_t(TCGv, TCGv_ptr, TCGv, TCGv);
+
+static bool trans_mult_acc(DisasContext *ctx, arg_r *a,
+                           gen_helper_mult_acc_t *gen_helper_mult_acc)
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
+#define MULT_ACC(opcode, gen_helper) \
+static bool trans_##opcode(DisasContext *ctx, arg_r *a) \
+{ \
+    return trans_mult_acc(ctx, a, gen_helper); \
+}
+MULT_ACC(MACC,      gen_helper_macc);
+MULT_ACC(MACCHI,    gen_helper_macchi);
+MULT_ACC(MACCHIU,   gen_helper_macchiu);
+MULT_ACC(MACCU,     gen_helper_maccu);
-- 
2.31.1


