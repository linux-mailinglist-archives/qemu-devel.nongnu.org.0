Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E116332AF8
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:48:03 +0100 (CET)
Received: from localhost ([::1]:37738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeaY-0006HM-J4
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdos-00063c-02
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:46 -0500
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536]:45854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoq-0002yG-AC
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:45 -0500
Received: by mail-ed1-x536.google.com with SMTP id dm26so20651542edb.12
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y78UYhzpjwwqyIkKdZskzp+sDvMwTfmnMMTxyxcUqTQ=;
 b=nmv7vBPk25/FIE3RQwb38P+mL2oTue9Z/aRq236XaEdpff0zBEIb6b40lB7KZ2E2E1
 CGEZm02xS0Ys4hh17VibVANImElOHitohM5QyHSWQB434UXMsk5Bo5+DASazXm8TjX2/
 y2+qUedMdybuoa2lnc5yTKMg4mF83vABav1w0YzCxFBbxOJm0cfmsMFAxjkBw6HPuWDI
 2cwpAIAUSteYk3228bcAdBN4dLKvLn1XoMZbGXfwqCt8MhtJ8o5by6I2/sDZsMPjJlUk
 6f8h3MJ3HN06A2sT5rsJLvFD6LEV8yN2MRIKywLISm7cPQRYHnOZ4O36ZHMb6cFL9t9l
 CWSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=y78UYhzpjwwqyIkKdZskzp+sDvMwTfmnMMTxyxcUqTQ=;
 b=eP+8M5GeQHa9DrEC46x2UlhkLMNsX2nxtOZqiWg5YCs52IdFsye9HZF50junCsKMgZ
 TnqKcxiPxgIFmVWuC0Hm6k1LI2qbb28CRoJ/vVTtQhJxPYm4tlOx/C5sa4bmd2Wo7z4F
 28wqyUal8NtmnKm9KXlbJGgQDsLxDFcvqa9KT4P35vFfS1ZM3xLcI/JikUGLZy4F2OC9
 Ii0U488k6wS6LvVLpqICbjVbISJi/Q2Q24tby3de2S/Upw4YvDDt+8iYZxAU6xV98KUK
 11DrK+/aNahdPd7+mf+VlyC6IQQE9n1SEAqvuVptp6oYHUbURWMoFIu9NpDimZrgBzIA
 JXtw==
X-Gm-Message-State: AOAM531/Rjv4/OiJFJ2eb0HY/XuUcItNFPghiJnRytIwloS7yXS5NgXV
 5XlDX8t4BVoJEoQwsiuZYhU20vt4Qp8=
X-Google-Smtp-Source: ABdhPJxFU24/zE7Oa6xcLXJkxjK1TuIXdvwz96wPl0C9lHXBjRfDcqP5+3ohxRFKm9aRuv68e5EL4A==
X-Received: by 2002:aa7:d4d2:: with SMTP id t18mr4572526edr.342.1615301922732; 
 Tue, 09 Mar 2021 06:58:42 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id s13sm9551481edr.86.2021.03.09.06.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:58:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 21/22] target/mips/tx79: Move RDHWR usermode kludge to
 trans_SQ()
Date: Tue,  9 Mar 2021 15:56:52 +0100
Message-Id: <20210309145653.743937-22-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x536.google.com
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
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now than SQ is properly implemented, we can move the RDHWR
kludge required to have usermode working with recent glibc.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: { RDHWR_user } (rth)
---
 target/mips/tx79.decode      |  5 +++-
 target/mips/translate.c      | 56 ------------------------------------
 target/mips/tx79_translate.c | 31 ++++++++++++++++++++
 3 files changed, 35 insertions(+), 57 deletions(-)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index f1cb7ebfa3c..4e8acb7ab9a 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -73,4 +73,7 @@ PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
 # SPECIAL
 
 LQ              011110 ..... ..... ................     @ldst
-SQ              011111 ..... ..... ................     @ldst
+{
+  RDHWR_user    011111 00000 ..... ..... 00000 111011   @rt_rd
+  SQ            011111 ..... ..... ................     @ldst
+}
diff --git a/target/mips/translate.c b/target/mips/translate.c
index 0d20a0e3b84..b01022a6ad7 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1167,7 +1167,6 @@ enum {
 
 enum {
     MMI_OPC_CLASS_MMI = 0x1C << 26,    /* Same as OPC_SPECIAL2 */
-    MMI_OPC_SQ        = 0x1F << 26,    /* Same as OPC_SPECIAL3 */
 };
 
 /*
@@ -24428,53 +24427,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
     }
 }
 
-static void gen_mmi_sq(DisasContext *ctx, int base, int rt, int offset)
-{
-    gen_reserved_instruction(ctx);    /* TODO: MMI_OPC_SQ */
-}
-
-/*
- * The TX79-specific instruction Store Quadword
- *
- * +--------+-------+-------+------------------------+
- * | 011111 |  base |   rt  |           offset       | SQ
- * +--------+-------+-------+------------------------+
- *      6       5       5                 16
- *
- * has the same opcode as the Read Hardware Register instruction
- *
- * +--------+-------+-------+-------+-------+--------+
- * | 011111 | 00000 |   rt  |   rd  | 00000 | 111011 | RDHWR
- * +--------+-------+-------+-------+-------+--------+
- *      6       5       5       5       5        6
- *
- * that is required, trapped and emulated by the Linux kernel. However, all
- * RDHWR encodings yield address error exceptions on the TX79 since the SQ
- * offset is odd. Therefore all valid SQ instructions can execute normally.
- * In user mode, QEMU must verify the upper and lower 11 bits to distinguish
- * between SQ and RDHWR, as the Linux kernel does.
- */
-static void decode_mmi_sq(CPUMIPSState *env, DisasContext *ctx)
-{
-    int base = extract32(ctx->opcode, 21, 5);
-    int rt = extract32(ctx->opcode, 16, 5);
-    int offset = extract32(ctx->opcode, 0, 16);
-
-#ifdef CONFIG_USER_ONLY
-    uint32_t op1 = MASK_SPECIAL3(ctx->opcode);
-    uint32_t op2 = extract32(ctx->opcode, 6, 5);
-
-    if (base == 0 && op2 == 0 && op1 == OPC_RDHWR) {
-        int rd = extract32(ctx->opcode, 11, 5);
-
-        gen_rdhwr(ctx, rt, rd, 0);
-        return;
-    }
-#endif
-
-    gen_mmi_sq(ctx, base, rt, offset);
-}
-
 #endif
 
 static void decode_opc_special3(CPUMIPSState *env, DisasContext *ctx)
@@ -24664,15 +24616,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         decode_opc_special2_legacy(env, ctx);
         break;
     case OPC_SPECIAL3:
-#if defined(TARGET_MIPS64)
-        if (ctx->insn_flags & INSN_R5900) {
-            decode_mmi_sq(env, ctx);    /* MMI_OPC_SQ */
-        } else {
-            decode_opc_special3(env, ctx);
-        }
-#else
         decode_opc_special3(env, ctx);
-#endif
         break;
     case OPC_REGIMM:
         op1 = MASK_REGIMM(ctx->opcode);
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index e32c6218852..5e69783420a 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -396,6 +396,37 @@ static bool trans_SQ(DisasContext *ctx, arg_itype *a)
     return true;
 }
 
+/*
+ * The TX79-specific instruction Store Quadword
+ *
+ * +--------+-------+-------+------------------------+
+ * | 011111 |  base |   rt  |           offset       | SQ
+ * +--------+-------+-------+------------------------+
+ *      6       5       5                 16
+ *
+ * has the same opcode as the Read Hardware Register instruction
+ *
+ * +--------+-------+-------+-------+-------+--------+
+ * | 011111 | 00000 |   rt  |   rd  | 00000 | 111011 | RDHWR
+ * +--------+-------+-------+-------+-------+--------+
+ *      6       5       5       5       5        6
+ *
+ * that is required, trapped and emulated by the Linux kernel. However, all
+ * RDHWR encodings yield address error exceptions on the TX79 since the SQ
+ * offset is odd. Therefore all valid SQ instructions can execute normally.
+ * In user mode, QEMU must verify the upper and lower 11 bits to distinguish
+ * between SQ and RDHWR, as the Linux kernel does.
+ */
+static bool trans_RDHWR_user(DisasContext *ctx, arg_rtype *a)
+{
+#if defined(CONFIG_USER_ONLY)
+    gen_rdhwr(ctx, a->rt, a->rd, 0);
+    return true;
+#else
+    return false;
+#endif
+}
+
 /*
  *     Multiply and Divide (19 instructions)
  *     -------------------------------------
-- 
2.26.2


