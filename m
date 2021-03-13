Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2E8433A0EB
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 21:11:09 +0100 (CET)
Received: from localhost ([::1]:38958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLAbM-00009R-Sf
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 15:11:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHY-0000Oq-5F
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:40 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAHR-0007iG-Ns
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:35 -0500
Received: by mail-wr1-x436.google.com with SMTP id l11so6620312wrp.7
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/YG4Md8ZPkAURrr+St5wr7wofQ8IOyRe0AIoTOauk6w=;
 b=vYgB0HNgNBKvP6UeNTAtXoIymYFv1OqHz5syfDb6p6ZANQnangrXzZYGjReYwueeoD
 Au/2+s8Jm0soXoDh/vAl6lndXUiOPhUzPIG81Ot4BE1HFUoI6PmJDNDFUlQRbPpYpZTE
 aDlVpTmu08Ct3C8MkvYj3rFIH3MCg2R8QnI+/3io2KjWpk8dN0yqDK50vn4a+Y7d6Jxt
 mIlWeg2vMOu3tORDysL0AlB4FEJBlHWtzAZqT3bDmgk/cdGFp3F9l2h2ZXkqhMFol0rB
 yeWE8m46FILS71IUUMJhhnKYT9nWw5E7PqhM6H/f0IrsbF9euC4N1fA9m93x91T2NEEm
 yqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/YG4Md8ZPkAURrr+St5wr7wofQ8IOyRe0AIoTOauk6w=;
 b=Q+Pb67otrf6aC1m+PHi85M4NzACdSyPkuyvCdyfzzp4xttjEZZ8fG7zMqWn3tYYgJ4
 iSJLPlVvOFFWB92MzYE/toegcZH1ODOSUmQ0qXLXpJgE8mJ76MFR7UzI2vKckEuCV+HU
 Y9XHaH3e2gZgRSIX7Mod3dHVmFccbJsb/cMDS7AY2CdjIytnMIi5UTFtxC1ZjkF9YSYG
 atHKmW8DkzhAm5r0YRlhIcgsPvIReWqUlF5u2lMj6X5uzUcrrK/XU3zPFNDlP6q9RdKE
 1974bQeWKI1weobp4+bFTvVAr/ZashK5qI3NSDnEBP6wVyBvEqKedUcNiUf+/JmhIpfe
 MdOw==
X-Gm-Message-State: AOAM530lS8o7U+SyV4+rCy9oONJ7LptfA5K05fN99Ik1lPTrwb2yn2Ql
 HHsB9dsnzNomTzLBiunUWDN7Cvx2HJcKFA==
X-Google-Smtp-Source: ABdhPJyQxQ4OLLFzl5lnPIlPu3azDf+MAHIJOXFBIbTRpH0IKEl0TQOyjKpn+dPKRKekGrlB6SKP6Q==
X-Received: by 2002:adf:dc4e:: with SMTP id m14mr20999837wrj.248.1615665032200; 
 Sat, 13 Mar 2021 11:50:32 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id j16sm30759735wmi.2.2021.03.13.11.50.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:50:31 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/27] target/mips/tx79: Move PCPYH opcode to decodetree
Date: Sat, 13 Mar 2021 20:48:26 +0100
Message-Id: <20210313194829.2193621-25-f4bug@amsat.org>
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

Move the existing PCPYH opcode (Parallel Copy Halfword) to decodetree.
Remove unnecessary code / comments.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-12-f4bug@amsat.org>
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
index 1967c12d807..80fcab5a564 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -24062,42 +24062,6 @@ static void decode_opc_special(CPUMIPSState *env, DisasContext *ctx)
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
@@ -25016,9 +24980,6 @@ static void decode_mmi3(CPUMIPSState *env, DisasContext *ctx)
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


