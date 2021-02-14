Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8132131B1CB
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:08:12 +0100 (CET)
Received: from localhost ([::1]:53094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLoZ-0006e3-GQ
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:08:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgh-0007KQ-Aj
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:03 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:50454)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgf-0004GT-IQ
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:03 -0500
Received: by mail-wm1-x32d.google.com with SMTP id u5so1452759wmj.0
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dZm99mVT7JaBB4xmS9yAUoqcDoFfjcDlrtAsNfxgXks=;
 b=EOs5gU+venZRDc+Y5Ji64oU/91i+AyfEXfHxzxYRTVkFth6Gb63ulj1+EJzlfRwRew
 6vjw/y0Mfv/caXtwnVptU9swDKBcmRkIAQJU+EmBgqqHdAWL7vvpg0ibQFDWr7So/7c8
 56Fpu54yepoep54PytggYVx/WW7o7i86yfexetRHuXeMg4BYl1QrEVXdFUTBS3Oq+z2+
 yZlG9/FrFZ46Pco+2GztsOMetViBFZsYGZBpVHVWUDsK7qA0736ANENavGKQ+gP2jJjJ
 +xYmn7YMh5s45DMF+ByzjJExFVus1ECiq1wx8zxsgCu2X+E839yMO6xtq2gEfobJavpT
 S/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dZm99mVT7JaBB4xmS9yAUoqcDoFfjcDlrtAsNfxgXks=;
 b=KBfYqILE2CsGOQiEL9GL0r3y/Dgax0b68eORoT5Pzo8GgUmE+gTr5BohWdKuYa+hLg
 5g9cBMtg9AmQsuIdoNmGgk6n0iNfWFBjcDj5WW0fRN9UZTyC0IJnc87JdbPWVv0WPake
 XCFJTy7IEgdflWx8uoV9SaE8sH2cxPVkoF2u//q36i5T3nwu97gDyF4spewIG401gkHP
 ef02ddXaGKwxGodrQI8FlpWIePEbWFeHysvAk6TFxqxFjpy7TmTiHO882o+mvK7MaHMK
 rGJYNTsOgi8aI2nVk78loyBovJiZp73YKvh1c6uHEFyO88nXLRl3541aiZfBuwg2N7mt
 SkFQ==
X-Gm-Message-State: AOAM53267VOEW+kOEz/xZ+eaNjfnFZ4Go1J/HWwZ+g9JvXPMFe8a1KAM
 IBCi71VyuaQv8XknmRhgx50EbnS2+Xo=
X-Google-Smtp-Source: ABdhPJxmuFHPLGe36k0Juo0vfNG5z5uuyMK+VRxu04t9ay3yeutSCg0/M864BbODVn39s2yMfX4CFg==
X-Received: by 2002:a1c:bd84:: with SMTP id
 n126mr10550692wmf.173.1613325599959; 
 Sun, 14 Feb 2021 09:59:59 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id i10sm26058908wrp.0.2021.02.14.09.59.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 09:59:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 09/42] target/mips/tx79: Move MTHI1 / MTLO1 opcodes to
 decodetree
Date: Sun, 14 Feb 2021 18:58:39 +0100
Message-Id: <20210214175912.732946-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>, "Maciej W. Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  3 +++
 target/mips/translate.c      | 25 -------------------------
 target/mips/tx79_translate.c | 14 ++++++++++++++
 3 files changed, 17 insertions(+), 25 deletions(-)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 2e287ebbf36..30737da54e4 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -17,9 +17,12 @@
 # Named instruction formats.  These are generally used to
 # reduce the amount of duplication between instruction patterns.
 
+@rs             ...... rs:5  ..... ..........  ......   &rtype rt=0 rd=0 sa=0
 @rd             ...... ..........  rd:5  ..... ......   &rtype rs=0 rt=0 sa=0
 
 ###########################################################################
 
 MFHI1           011100 0000000000  ..... 00000 010000   @rd
+MTHI1           011100 .....  0000000000 00000 010001   @rs
 MFLO1           011100 0000000000  ..... 00000 010010   @rd
+MTLO1           011100 .....  0000000000 00000 010011   @rs
diff --git a/target/mips/translate.c b/target/mips/translate.c
index de67e534121..7bd951d3a06 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1973,8 +1973,6 @@ enum {
     MMI_OPC_PLZCW      = 0x04 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI0 = 0x08 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI2 = 0x09 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_MTHI1      = 0x11 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MTHI */
-    MMI_OPC_MTLO1      = 0x13 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MTLO */
     MMI_OPC_MULT1      = 0x18 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MULT */
     MMI_OPC_MULTU1     = 0x19 | MMI_OPC_CLASS_MMI, /* Same min. as OPC_MULTU */
     MMI_OPC_DIV1       = 0x1A | MMI_OPC_CLASS_MMI, /* Same minor as OPC_DIV  */
@@ -4120,25 +4118,6 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-#if defined(TARGET_MIPS64)
-/* Copy GPR to and from TX79 HI1/LO1 register. */
-static void gen_HILO1_tx79(DisasContext *ctx, uint32_t opc, int reg)
-{
-    switch (opc) {
-    case MMI_OPC_MTHI1:
-        gen_load_gpr(cpu_HI[1], reg);
-        break;
-    case MMI_OPC_MTLO1:
-        gen_load_gpr(cpu_LO[1], reg);
-        break;
-    default:
-        MIPS_INVAL("mfthilo1 TX79");
-        gen_reserved_instruction(ctx);
-        break;
-    }
-}
-#endif
-
 /* Arithmetic on HI/LO registers */
 static void gen_HILO(DisasContext *ctx, uint32_t opc, int acc, int reg)
 {
@@ -28015,10 +27994,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_DIVU1:
         gen_div1_tx79(ctx, opc, rs, rt);
         break;
-    case MMI_OPC_MTLO1:
-    case MMI_OPC_MTHI1:
-        gen_HILO1_tx79(ctx, opc, rs);
-        break;
     case MMI_OPC_PLZCW:         /* TODO: MMI_OPC_PLZCW */
     case MMI_OPC_PMFHL:         /* TODO: MMI_OPC_PMFHL */
     case MMI_OPC_PMTHL:         /* TODO: MMI_OPC_PMTHL */
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 22bd6033e55..905245cece7 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -35,3 +35,17 @@ static bool trans_MFLO1(DisasContext *ctx, arg_rtype *a)
 
     return true;
 }
+
+static bool trans_MTHI1(DisasContext *ctx, arg_rtype *a)
+{
+    gen_load_gpr(cpu_HI[1], a->rs);
+
+    return true;
+}
+
+static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
+{
+    gen_load_gpr(cpu_LO[1], a->rs);
+
+    return true;
+}
-- 
2.26.2


