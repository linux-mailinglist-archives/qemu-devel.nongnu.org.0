Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95F0A33A0DD
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:04:45 +0100 (CET)
Received: from localhost ([::1]:45128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAVA-0007qD-DT
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:04:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHF-0000Ek-9c
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:21 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHD-0007Um-Kx
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:21 -0500
Received: by mail-wr1-x436.google.com with SMTP id x16so3620382wrn.4
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=O314qlIj7arWsupg5EFdCLic7PcyuMDeKjWuDIw/LHI=;
 b=l++6N9cLMB0bCWNgWM/psccDets1YDL3iPf2g0xqAZtIAu1tHfPbXEAYgDgkbTThia
 B7Fs3OXv0It3K4KpyvT2wdbIJ+OqF+6E6HGCjCc9x/ZNBZHlL0vdaD/orhfCm8yQDzbl
 giu/NyN9ypMTQeygfG0lUIh5uu/7yp4HqXdkOUPDLdVdq38/pLfC30aqL6kbkArSqy8R
 xctRabEfA5UZ2t8PlOUfoNyJ8u8diqtbx2A4M6UMA/mxjS11i3t7kIo8NKpgwhJODAMQ
 oPI+OIVmJKrbp416UBISOIMUn0Aae7xq3gLqIDmNXWLhBbWdlyNn7SzgSTbwQBd0Nl7e
 bofw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=O314qlIj7arWsupg5EFdCLic7PcyuMDeKjWuDIw/LHI=;
 b=UAq58NTkqdWCUTjM2AXkoDkmayRcOMMMDKAmXzkT+p8rdgp014ogFhJ3XPChxFUcAr
 Miv+nVu69YZOn6jDGT2N25gyY5Tg2jwBnE7SgzHW+oovQJdVDqMoaS6gHxfrdvjdSnit
 fKClPU6w3EjkxpbF4HWj3Eob9a0eY2jiHJdx0yDa7CfoFprHfK5MyaxL99l8w9GD3mUw
 WbXLhDrcnKQUjlGMSjjsOCoqqwDzunYlE6+po7w7v6QkSGuh52GJwAnD98jCSlT5c1Oo
 bE77lxahLD/KSw14oZ2fuvJDyr1a2DRZBAQKt/s10sGqSvRRO1ZZCs45mr6wjFX/X2EP
 fVsA==
X-Gm-Message-State: AOAM531qGGpVIfRMnP+T9VOMMYOjBB5PwcOL3KK4GiLgMtBqmnspP1XR
 skr5gh6UZSMABSFNiJIDYBU5e6yEyZME4A==
X-Google-Smtp-Source: ABdhPJyQuCXSQLTtDPeYaBUpM1FF1OcIL9HyaX2aipMyVSrO7t5nPG+VsNLUnpVE1bv/WRbt2WsxOw==
X-Received: by 2002:adf:a18a:: with SMTP id u10mr20259328wru.197.1615665017233; 
 Sat, 13 Mar 2021 11:50:17 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id v189sm7767583wme.39.2021.03.13.11.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:50:16 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 21/27] target/mips/tx79: Move MTHI1 / MTLO1 opcodes to
 decodetree
Date: Sat, 13 Mar 2021 20:48:23 +0100
Message-Id: <20210313194829.2193621-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-10-f4bug@amsat.org>
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
index 889c89696b1..256e2956c4b 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1360,8 +1360,6 @@ enum {
     MMI_OPC_PLZCW      = 0x04 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI0 = 0x08 | MMI_OPC_CLASS_MMI,
     MMI_OPC_CLASS_MMI2 = 0x09 | MMI_OPC_CLASS_MMI,
-    MMI_OPC_MTHI1      = 0x11 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MTHI */
-    MMI_OPC_MTLO1      = 0x13 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MTLO */
     MMI_OPC_MULT1      = 0x18 | MMI_OPC_CLASS_MMI, /* Same minor as OPC_MULT */
     MMI_OPC_MULTU1     = 0x19 | MMI_OPC_CLASS_MMI, /* Same min. as OPC_MULTU */
     MMI_OPC_DIV1       = 0x1A | MMI_OPC_CLASS_MMI, /* Same minor as OPC_DIV  */
@@ -3462,25 +3460,6 @@ static void gen_shift(DisasContext *ctx, uint32_t opc,
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
@@ -25108,10 +25087,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
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


