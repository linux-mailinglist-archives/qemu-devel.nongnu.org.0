Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB4633937C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 17:34:27 +0100 (CET)
Received: from localhost ([::1]:44892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKkk5-0006qi-NX
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 11:34:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKkav-000632-T4
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:24:58 -0500
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lKkas-0005AP-6N
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 11:24:55 -0500
Received: by mail-wr1-x431.google.com with SMTP id 61so2101957wrm.12
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 08:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2gPDu/Ty5jqHRFQM/IZw1IHTYbKSYtKRCoaMu1hNtJg=;
 b=opaP+sKv3o+CTb/+1nZPe8WzTv0FMlPn9NoD4ukcUmfMee5p0WFmRA57rGzjmraDus
 +B8/hH1WAF4KwfkTAdj1vPqPOvd0Hz/qITa4VK+3fRnzGEII/SAkTbn65H0DKdC9SDFN
 SteFG4Tz3dT1kwKpulKVzyXaLha8Naf9eh52zh6P/kqR3X9xoHDMGht+AH/nXfRru5cs
 sfUHWfwOVCkJ3IoFN7ixPTjj1u4h7gZXx3vZG2zLdRzjUevxi1dO4pCNNLTLhqtfIoWu
 zwtrJFGu8hI6PhsJn/puRmht3Bh3K8WD47eYBiO8pICND7gz1o8BhU9fbrIBQ5EkiWrs
 4XsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2gPDu/Ty5jqHRFQM/IZw1IHTYbKSYtKRCoaMu1hNtJg=;
 b=iTY0eYI0ZelNikKkUVghrpX6EQQY7yHMsVkY8udZJG4CN0fQK3RyN5tXxOA7ZnduoT
 bS0bWzTrOmjKKRv13AJIg29fGYZ5n5axLNomoNqz+FwoI//IIUAxHRD0oOPeEJe8MXMy
 l0YL9gIadc1u5MO2HVlK6VZNWy3ClsYoe4XwqC+YkaDisB4thaLFUd3ySQshZPszOemZ
 QaGgc+yF6zDyoAZVujWQTgkwlzr4M7moeU5uw8k2rvHyTlQHpdr4lckcSum6inFNnp0e
 5mx8I0XwXTlGk7NXWnFA0H1bfeATm+ZW0zWFvNcbvORKG5/2n9mmm4w8KWDalcUDpoDj
 YuoQ==
X-Gm-Message-State: AOAM530U1xGIJYqTPHxgdyWLWLaKtSwsu0qIul9pzgKnxvgrkCiuqD7U
 KTpjTvll93hSXEBGlEFginqPDZy+PAU=
X-Google-Smtp-Source: ABdhPJytn7GnramAHLTdAS8CTpDSfs/HEECkrvhnWvw0oHWxuAORSRC2DZSkC/+wftr96QQZSQmx3w==
X-Received: by 2002:adf:de91:: with SMTP id w17mr15255416wrl.268.1615566292240; 
 Fri, 12 Mar 2021 08:24:52 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id 36sm8940686wrh.94.2021.03.12.08.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 08:24:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] target/mips/tx79: Move RDHWR usermode kludge to
 trans_SQ()
Date: Fri, 12 Mar 2021 17:24:32 +0100
Message-Id: <20210312162434.1869129-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210312162434.1869129-1-f4bug@amsat.org>
References: <20210312162434.1869129-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Maciej W . Rozycki" <macro@orcam.me.uk>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now than SQ is properly implemented, we can move the RDHWR
kludge required to have usermode working with recent glibc.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: { RDHWR_user } (rth)

Fredrik, I'm not understanding fully your discussion with Maciej:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg783053.html
So any help welcome to get your patch merged into mainstream.
---
 target/mips/tx79.decode      |  5 +++-
 target/mips/translate.c      | 56 ------------------------------------
 target/mips/tx79_translate.c | 31 ++++++++++++++++++++
 3 files changed, 35 insertions(+), 57 deletions(-)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 0756b13149e..25ddaa92bbd 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -45,4 +45,7 @@ PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
 # SPECIAL
 
 LQ              011110 ..... ..... ................     @ldst
-SQ              011111 ..... ..... ................     @ldst
+{
+  RDHWR_user    011111 00000 ..... ..... 00000 111011   @rt_rd
+  SQ            011111 ..... ..... ................     @ldst
+}
diff --git a/target/mips/translate.c b/target/mips/translate.c
index c822083f031..671c67f5fc7 100644
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
index d840dfdb9cc..3b1ef05e95b 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -239,6 +239,37 @@ static bool trans_SQ(DisasContext *ctx, arg_itype *a)
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


