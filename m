Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C62042BB83C
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 22:21:52 +0100 (CET)
Received: from localhost ([::1]:38288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgDqp-0006ln-Rs
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 16:21:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfX-0004GB-JL
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:11 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:37920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kgDfV-00047S-Dl
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 16:10:10 -0500
Received: by mail-wr1-x42f.google.com with SMTP id p8so11710899wrx.5
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 13:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yEPTreAcbmYuWQ/wNZf45C6fc4wRRcv0srLw4kg+KsE=;
 b=RVbt5BO3aY2rd/K4BEnZA/k7HLmYBwURaXB0YTkE0eeoX39OnNnehbCsKe6wWh/Ma2
 p5w4nLyABYEW4nnWmKn2UjRe/RLQNdGW4sDIMsaGkhqypIn8ehQYu4HYYTRZpeHJVFR9
 mCV5voyNHrFSNVabIhz6JgWTKkKYXbIWF2GpfPYBnK3ea2Y01DyuwtLMDbDgVpoPtgeC
 RR4cP6X7UZsqurcBCOYX5MkSaBF+ZJS3HI+vIPHuIuiPeHlpif02AMdFmJYmDvd4l1QB
 PiQ+5mvNqFKWwbJ8WAlZOfg7WbrWnW3ecQ9Mx09UERWBf6EGC5AF2s9DChSm+SpFlM8r
 Zqtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=yEPTreAcbmYuWQ/wNZf45C6fc4wRRcv0srLw4kg+KsE=;
 b=bkKuy4kpF8484bAWKtF5MLeuFScTOCDjf45BkkMNvYFnHSpJDbd7NoalxdBKNDWXno
 DY9q6LMqde9ZoAw9qqaE7ZKfDatry4W6c3ECMvP7VADelV+iQcnuGo2bFLoPOffP1IPf
 G2zDEfaN5xTmQo/ZDHubb7p7iSuEGQHeMsV5KkyTme1+UslbbFfpSatwD5ii2MfEXNl6
 NmcOkjW+cD6Rre7EraYesULuaJKR+q3YOENJoN5l0Ak5nyESNwG0ekJ5zECRszDPzZMR
 geGySjSeNirehudwz5phucEr8RY1vbKA3Y6H6sc/ZHYKF+ZF3oF1JOL8p7vb4ERyRSXM
 rTtg==
X-Gm-Message-State: AOAM532By0+Or007qblXnO1aVNe/Y6ojkyEorwY1Gv9xmmmtB9d32K6x
 DYHKUXrc59vuJueBv+Ww+TOhzUG4Hxw=
X-Google-Smtp-Source: ABdhPJxqkJB7aYRijiVJL7s5nyKRmLXfIBurxYsRZI1v+TtDEAkMJ9UtR7xj+Rp9luiEnca1qPS2hw==
X-Received: by 2002:a5d:5222:: with SMTP id i2mr19165213wra.247.1605906605979; 
 Fri, 20 Nov 2020 13:10:05 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id w186sm5417507wmb.26.2020.11.20.13.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Nov 2020 13:10:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/26] target/mips: Extract NEC Vr54xx translation routines
Date: Fri, 20 Nov 2020 22:08:33 +0100
Message-Id: <20201120210844.2625602-16-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201120210844.2625602-1-f4bug@amsat.org>
References: <20201120210844.2625602-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
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
Cc: Fredrik Noring <noring@nocrew.org>, Craig Janeczek <jancraig@amazon.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, Paolo Bonzini <pbonzini@redhat.com>,
 Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Extract the NEC Vr54xx translation routines to
'vendor-vr54xx_translate.c.inc'.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c                   | 86 +--------------------
 target/mips/vendor-vr54xx_translate.c.inc | 93 +++++++++++++++++++++++
 2 files changed, 95 insertions(+), 84 deletions(-)
 create mode 100644 target/mips/vendor-vr54xx_translate.c.inc

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 095ee31ab5f..b01a16e9da4 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -295,26 +295,6 @@ enum {
     OPC_DLSA = 0x15 | OPC_SPECIAL,
 };
 
-/* Multiplication variants of the vr54xx. */
-#define MASK_MUL_VR54XX(op)         (MASK_SPECIAL(op) | (op & (0x1F << 6)))
-
-enum {
-    OPC_VR54XX_MULS    = (0x03 << 6) | OPC_MULT,
-    OPC_VR54XX_MULSU   = (0x03 << 6) | OPC_MULTU,
-    OPC_VR54XX_MACC    = (0x05 << 6) | OPC_MULT,
-    OPC_VR54XX_MACCU   = (0x05 << 6) | OPC_MULTU,
-    OPC_VR54XX_MSAC    = (0x07 << 6) | OPC_MULT,
-    OPC_VR54XX_MSACU   = (0x07 << 6) | OPC_MULTU,
-    OPC_VR54XX_MULHI   = (0x09 << 6) | OPC_MULT,
-    OPC_VR54XX_MULHIU  = (0x09 << 6) | OPC_MULTU,
-    OPC_VR54XX_MULSHI  = (0x0B << 6) | OPC_MULT,
-    OPC_VR54XX_MULSHIU = (0x0B << 6) | OPC_MULTU,
-    OPC_VR54XX_MACCHI  = (0x0D << 6) | OPC_MULT,
-    OPC_VR54XX_MACCHIU = (0x0D << 6) | OPC_MULTU,
-    OPC_VR54XX_MSACHI  = (0x0F << 6) | OPC_MULT,
-    OPC_VR54XX_MSACHIU = (0x0F << 6) | OPC_MULTU,
-};
-
 /* REGIMM (rt field) opcodes */
 #define MASK_REGIMM(op)             (MASK_OP_MAJOR(op) | (op & (0x1F << 16)))
 
@@ -4546,70 +4526,6 @@ static void gen_mul_txx9(DisasContext *ctx, uint32_t opc,
     tcg_temp_free(t1);
 }
 
-static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
-                           int rd, int rs, int rt)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-
-    gen_load_gpr(t0, rs);
-    gen_load_gpr(t1, rt);
-
-    switch (opc) {
-    case OPC_VR54XX_MULS:
-        gen_helper_muls(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MULSU:
-        gen_helper_mulsu(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MACC:
-        gen_helper_macc(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MACCU:
-        gen_helper_maccu(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MSAC:
-        gen_helper_msac(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MSACU:
-        gen_helper_msacu(t0, cpu_env, t0, t1);
-        break;
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
-    case OPC_VR54XX_MACCHI:
-        gen_helper_macchi(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MACCHIU:
-        gen_helper_macchiu(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MSACHI:
-        gen_helper_msachi(t0, cpu_env, t0, t1);
-        break;
-    case OPC_VR54XX_MSACHIU:
-        gen_helper_msachiu(t0, cpu_env, t0, t1);
-        break;
-    default:
-        MIPS_INVAL("mul vr54xx");
-        generate_exception_end(ctx, EXCP_RI);
-        goto out;
-    }
-    gen_store_gpr(t0, rd);
-
- out:
-    tcg_temp_free(t0);
-    tcg_temp_free(t1);
-}
-
 static void gen_cl(DisasContext *ctx, uint32_t opc,
                    int rd, int rs)
 {
@@ -13022,6 +12938,8 @@ out:
 
 #include "mod-mips-dsp_translate.c.inc"
 
+#include "vendor-vr54xx_translate.c.inc"
+
 static void decode_opc_special_r6(CPUMIPSState *env, DisasContext *ctx)
 {
     int rs, rt, rd, sa;
diff --git a/target/mips/vendor-vr54xx_translate.c.inc b/target/mips/vendor-vr54xx_translate.c.inc
new file mode 100644
index 00000000000..8c952a98ebc
--- /dev/null
+++ b/target/mips/vendor-vr54xx_translate.c.inc
@@ -0,0 +1,93 @@
+/*
+ *  MIPS NEC Vr54xx translation routines.
+ *
+ *  Copyright (c) 2004-2005 Jocelyn Mayer
+ *  Copyright (c) 2006 Marius Groeger (FPU operations)
+ *  Copyright (c) 2006 Thiemo Seufer (MIPS32R2 support)
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ */
+
+/* Multiplication variants of the vr54xx. */
+#define MASK_MUL_VR54XX(op)         (MASK_SPECIAL(op) | (op & (0x1F << 6)))
+
+enum {
+    OPC_VR54XX_MULS    = (0x03 << 6) | OPC_MULT,
+    OPC_VR54XX_MULSU   = (0x03 << 6) | OPC_MULTU,
+    OPC_VR54XX_MACC    = (0x05 << 6) | OPC_MULT,
+    OPC_VR54XX_MACCU   = (0x05 << 6) | OPC_MULTU,
+    OPC_VR54XX_MSAC    = (0x07 << 6) | OPC_MULT,
+    OPC_VR54XX_MSACU   = (0x07 << 6) | OPC_MULTU,
+    OPC_VR54XX_MULHI   = (0x09 << 6) | OPC_MULT,
+    OPC_VR54XX_MULHIU  = (0x09 << 6) | OPC_MULTU,
+    OPC_VR54XX_MULSHI  = (0x0B << 6) | OPC_MULT,
+    OPC_VR54XX_MULSHIU = (0x0B << 6) | OPC_MULTU,
+    OPC_VR54XX_MACCHI  = (0x0D << 6) | OPC_MULT,
+    OPC_VR54XX_MACCHIU = (0x0D << 6) | OPC_MULTU,
+    OPC_VR54XX_MSACHI  = (0x0F << 6) | OPC_MULT,
+    OPC_VR54XX_MSACHIU = (0x0F << 6) | OPC_MULTU,
+};
+
+static void gen_mul_vr54xx(DisasContext *ctx, uint32_t opc,
+                           int rd, int rs, int rt)
+{
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, rs);
+    gen_load_gpr(t1, rt);
+
+    switch (opc) {
+    case OPC_VR54XX_MULS:
+        gen_helper_muls(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MULSU:
+        gen_helper_mulsu(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MACC:
+        gen_helper_macc(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MACCU:
+        gen_helper_maccu(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MSAC:
+        gen_helper_msac(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MSACU:
+        gen_helper_msacu(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MULHI:
+        gen_helper_mulhi(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MULHIU:
+        gen_helper_mulhiu(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MULSHI:
+        gen_helper_mulshi(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MULSHIU:
+        gen_helper_mulshiu(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MACCHI:
+        gen_helper_macchi(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MACCHIU:
+        gen_helper_macchiu(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MSACHI:
+        gen_helper_msachi(t0, cpu_env, t0, t1);
+        break;
+    case OPC_VR54XX_MSACHIU:
+        gen_helper_msachiu(t0, cpu_env, t0, t1);
+        break;
+    default:
+        MIPS_INVAL("mul vr54xx");
+        generate_exception_end(ctx, EXCP_RI);
+        goto out;
+    }
+    gen_store_gpr(t0, rd);
+
+ out:
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+}
-- 
2.26.2


