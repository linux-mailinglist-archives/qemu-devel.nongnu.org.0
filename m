Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB5031B1DA
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:16:45 +0100 (CET)
Received: from localhost ([::1]:47416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLwq-00080z-B9
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:16:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgr-0007XH-2j
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:16 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:37555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLgp-0004J7-F5
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:12 -0500
Received: by mail-wr1-x433.google.com with SMTP id v15so6102595wrx.4
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Sk3H3tNjhYyZizn2BRPOZozRHHD0lIYvG7jQLlgzeOg=;
 b=sZGGuxfxbZKnJuPZP0iFDEGUF5EsKNwnm/rV9BLxoknXRHtFgT5oHWLXbhxF1G46AJ
 UoE81BZL3TqeU1h1ZzKVkqlLUrywX920WTZ+uRE4T6zxdEIsSH9TtZumAbF3s9JIt4qv
 1TnRGDW2yvTBJPSZa/E2FWq5Xe3mRfPk4hdv8WLUmi+I/OxjMGh8hajJU0vpiToGQHa0
 Fbq1qT+yMWk/3K3Bd2kvj8cjqhppApWdVdncTxYPCL440tX36VeTWj2A8Q6G7lV0pzEb
 jKpF8e7TXdl6T7mRbXemdkgd9iuuQRtiPVNWqLUbBI+GLcHODtj6hiyJMhBhg7SGBIEC
 H8vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=Sk3H3tNjhYyZizn2BRPOZozRHHD0lIYvG7jQLlgzeOg=;
 b=RThjsf/sseNTfv16y7mq50YLR/v8S/sfp6O+WU0P3MEl5xu5mRID6tzDzxfCSQbgn7
 BckZMrUmGGjZWM7+QxuwLeNKmruziVdkkfBIpfwtyaRK4FztPcBwQ/g5Mji8RxahmyAF
 tQDiRDklVhhnuVDW+7azW3Qew0gvyBnsSQ4k64R5Xy5dacRORLTV+eR7Jq6iMkFkKFyl
 xHU7O9xfYF6J8PHC1ifDuy2SgoDYitPA5irvgpo0CZZpThJiVsQltdk29sDZhSnPqf7Z
 Vg69Cmw2XiKfKX9mzcd6ioFfEwa8S4ay5C77uuAvKUrmMcwXDuZeJaVnUyVox5c4k1uY
 HziA==
X-Gm-Message-State: AOAM533vbZ2Xd87nuV7E/iWS1SYkIvZbDX1PRl4r3pSQnw/+qdSPCgyx
 0fTTBdwGXRvKBDPIvR0UJDvLYyToXlI=
X-Google-Smtp-Source: ABdhPJzuVAfERUQlDJG4n5Dct6jMnm4PkmrsXpJzmBBTZWBwJGT0733x/Bp7CzNT7v6Al9Fv7YtOqg==
X-Received: by 2002:adf:ce8a:: with SMTP id r10mr15109728wrn.1.1613325609895; 
 Sun, 14 Feb 2021 10:00:09 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id v204sm22373706wmg.38.2021.02.14.10.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:00:09 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 11/42] target/mips/tx79: Move PCPYH opcode to decodetree
Date: Sun, 14 Feb 2021 18:58:41 +0100
Message-Id: <20210214175912.732946-12-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
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

Move the existing PCPYH opcode (Parallel Copy Halfword) to decodetree.
Remove unnecessary code / comments.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  5 +++++
 target/mips/translate.c      | 39 ------------------------------------
 target/mips/tx79_translate.c | 22 ++++++++++++++++++++
 3 files changed, 27 insertions(+), 39 deletions(-)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 30737da54e4..7af35458b0a 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -17,6 +17,7 @@
 # Named instruction formats.  These are generally used to
 # reduce the amount of duplication between instruction patterns.
 
+@rt_rd          ...... ..... rt:5  rd:5  ..... ......   &rtype rs=0 sa=0
 @rs             ...... rs:5  ..... ..........  ......   &rtype rt=0 rd=0 sa=0
 @rd             ...... ..........  rd:5  ..... ......   &rtype rs=0 rt=0 sa=0
 
@@ -26,3 +27,7 @@ MFHI1           011100 0000000000  ..... 00000 010000   @rd
 MTHI1           011100 .....  0000000000 00000 010001   @rs
 MFLO1           011100 0000000000  ..... 00000 010010   @rd
 MTLO1           011100 .....  0000000000 00000 010011   @rs
+
+# MMI3
+
+PCPYH           011100 00000 ..... ..... 11011 101001   @rt_rd
diff --git a/target/mips/translate.c b/target/mips/translate.c
index a13ad4959b4..b81a66ed373 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24733,42 +24733,6 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
  *                     PEXTUW
  */
 
-/*
- *  PCPYH rd, rt
- *
- *    Parallel Copy Halfword
- *
- *   1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
- *  +-----------+---------+---------+---------+---------+-----------+
- *  |    MMI    |0 0 0 0 0|   rt    |   rd    |  PCPYH  |    MMI3   |
- *  +-----------+---------+---------+---------+---------+-----------+
- */
-static void gen_mmi_pcpyh(DisasContext *ctx)
-{
-    uint32_t pd, rt, rd;
-    uint32_t opcode;
-
-    opcode = ctx->opcode;
-
-    pd = extract32(opcode, 21, 5);
-    rt = extract32(opcode, 16, 5);
-    rd = extract32(opcode, 11, 5);
-
-    if (unlikely(pd != 0)) {
-        gen_reserved_instruction(ctx);
-    } else if (rd == 0) {
-        /* nop */
-    } else if (rt == 0) {
-        tcg_gen_movi_i64(cpu_gpr[rd], 0);
-        tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
-    } else {
-        tcg_gen_deposit_i64(cpu_gpr[rd], cpu_gpr[rt], cpu_gpr[rt], 16, 16);
-        tcg_gen_deposit_i64(cpu_gpr[rd], cpu_gpr[rd], cpu_gpr[rd], 32, 32);
-        tcg_gen_deposit_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rt], cpu_gpr_hi[rt], 16, 16);
-        tcg_gen_deposit_i64(cpu_gpr_hi[rd], cpu_gpr_hi[rd], cpu_gpr_hi[rd], 32, 32);
-    }
-}
-
 /*
  *  PCPYLD rd, rs, rt
  *
@@ -27923,9 +27887,6 @@ static void decode_mmi3(CPUMIPSState *env, DisasContext *ctx)
     case MMI_OPC_3_PEXCW:      /* TODO: MMI_OPC_3_PEXCW */
         gen_reserved_instruction(ctx); /* TODO: MMI_OPC_CLASS_MMI3 */
         break;
-    case MMI_OPC_3_PCPYH:
-        gen_mmi_pcpyh(ctx);
-        break;
     case MMI_OPC_3_PCPYUD:
         gen_mmi_pcpyud(ctx);
         break;
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 905245cece7..d58b4fcd7b3 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -49,3 +49,25 @@ static bool trans_MTLO1(DisasContext *ctx, arg_rtype *a)
 
     return true;
 }
+
+/* Parallel Copy Halfword */
+static bool trans_PCPYH(DisasContext *s, arg_rtype *a)
+{
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    if (a->rt == 0) {
+        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+        return true;
+    }
+
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rt], cpu_gpr[a->rt], 16, 16);
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], cpu_gpr[a->rd], 32, 32);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rt], cpu_gpr_hi[a->rt], 16, 16);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], 32, 32);
+
+    return true;
+}
-- 
2.26.2


