Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 207AD31B1FF
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:29:17 +0100 (CET)
Received: from localhost ([::1]:50590 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM8y-0005Hl-60
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:29:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiE-0000OB-DO
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:38 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLiC-0004bi-K1
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:01:38 -0500
Received: by mail-wm1-x331.google.com with SMTP id l17so4228079wmq.2
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d546qymlao/rzWtR36sSyopsQgU3D8u3O18dLCPSATQ=;
 b=ZMjnLcRY1+EILKAApUubkZ0uzZnVCg5UfW1UOttGln5PJ5eR2aAQoWXTkcuBIbUeQG
 /fGFj4raEFC4n4aOP92hwOTIzhIm4cgAZcWb1hwUvd8AMIZoZ82WgTLef/nhIq1TOE+r
 UEs7dhEnhaNj9CYtTc2FGMgdTYcUu+QwZMKOtuXblLvl/KhYpXcKPANdD41BDdnZqJOv
 TIdbqzqAvPid0aO2EOsy2U6LnfLcV3t1wwEHXL3/OZdxiuBL7Qq9V2mMwLIIbvo2+nZZ
 2exF/t0zNoroX61qmi9sbqD+xU9yL+J3VJFw/yHkGs3NBoCtwdjxhNgR7YsTNMFCb5Jg
 nGJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=d546qymlao/rzWtR36sSyopsQgU3D8u3O18dLCPSATQ=;
 b=NKFbB4afp+LZwcoh7n/O0miALxMp6viu8tQLktqDkVPhUhKG6Haxz5857Fa/lcyzDd
 BmYy22tvWcYQXdMyoQReA0Zf2CufO38r/+lJ7DsvqjohTREZ7Kw604oBVIRJ8XzsJF7A
 2WdzQveHTjxyrIN8ppdYUxCxLdWT5EfJewfhcyt+PYIPLI9BY+PI0yea1w6ZVDMOwLp/
 KNaCzwmSgMD7ybbYO1zNXKWKAL6tdnvS+yYJAc+ghUVrS8urxlduh7YkAw+pR27YrioJ
 s1YuSghDx+kGL63rN74tZqoc1wRXj0elrkWD+7vjHOxpIoEW+WOQ6WplfRu/NC7OrcMt
 wang==
X-Gm-Message-State: AOAM531+o3W2QsD8w/nZ3TtphnW1DTRfv943zoniZW/lrcZclrldFTV6
 cPxoF6HAaFI0hmY2dEHtOqkkzAnPPZ8=
X-Google-Smtp-Source: ABdhPJzIEuXfnUmiISWhrN/Tu/rLJ0f60OjCGa57Eq49WB5yvf3BShtly44I8uakgAerqc4H+Jjf+A==
X-Received: by 2002:a7b:cf33:: with SMTP id m19mr11031041wmg.53.1613325695015; 
 Sun, 14 Feb 2021 10:01:35 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id c3sm7167927wrr.29.2021.02.14.10.01.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:01:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 28/42] target/mips/tx79: Move RDHWR usermode kludge to
 trans_SQ()
Date: Sun, 14 Feb 2021 18:58:58 +0100
Message-Id: <20210214175912.732946-29-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
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

Now than SQ is properly implemented, we can move the RDHWR
kludge required to have usermode working with recent glibc.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/translate.c      | 56 ------------------------------------
 target/mips/tx79_translate.c | 34 +++++++++++++++++++++-
 2 files changed, 33 insertions(+), 57 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index c1d07a4591d..0fa2b3bcc15 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -1780,7 +1780,6 @@ enum {
 
 enum {
     MMI_OPC_CLASS_MMI = 0x1C << 26,    /* Same as OPC_SPECIAL2 */
-    MMI_OPC_SQ        = 0x1F << 26,    /* Same as OPC_SPECIAL3 */
 };
 
 /*
@@ -27330,53 +27329,6 @@ static void decode_mmi(CPUMIPSState *env, DisasContext *ctx)
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
@@ -27561,15 +27513,7 @@ static bool decode_opc_legacy(CPUMIPSState *env, DisasContext *ctx)
         }
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
index 386bae7808b..2aa3182d21d 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -411,7 +411,7 @@ static bool trans_LQ(DisasContext *ctx, arg_itype *a)
     return true;
 }
 
-static bool trans_SQ(DisasContext *ctx, arg_itype *a)
+static bool trans_SQ_real(DisasContext *ctx, arg_itype *a)
 {
     TCGv_i64 t0 = tcg_temp_new_i64();
     TCGv addr = tcg_temp_new();
@@ -438,6 +438,38 @@ static bool trans_SQ(DisasContext *ctx, arg_itype *a)
     return true;
 }
 
+static bool trans_SQ(DisasContext *ctx, arg_itype *a)
+{
+    /*
+     * The TX79-specific instruction Store Quadword
+     *
+     * +--------+-------+-------+------------------------+
+     * | 011111 |  base |   rt  |           offset       | SQ
+     * +--------+-------+-------+------------------------+
+     *      6       5       5                 16
+     *
+     * has the same opcode as the Read Hardware Register instruction
+     *
+     * +--------+-------+-------+-------+-------+--------+
+     * | 011111 | 00000 |   rt  |   rd  | 00000 | 111011 | RDHWR
+     * +--------+-------+-------+-------+-------+--------+
+     *      6       5       5       5       5        6
+     *
+     * that is required, trapped and emulated by the Linux kernel. However, all
+     * RDHWR encodings yield address error exceptions on the TX79 since the SQ
+     * offset is odd. Therefore all valid SQ instructions can execute normally.
+     * In user mode, QEMU must verify the upper and lower 13 bits to distinguish
+     * between SQ and RDHWR, as the Linux kernel does.
+     */
+#if defined(CONFIG_USER_ONLY)
+    if (!a->base && extract32(a->offset, 0, 11) == 0b00000111011) {
+        gen_rdhwr(ctx, a->rt, extract32(ctx->opcode, 11, 5), 0);
+        return true;
+    }
+#endif
+    return trans_SQ_real(ctx, a);
+}
+
 /*
  *     Multiply and Divide (19 instructions)
  *     -------------------------------------
-- 
2.26.2


