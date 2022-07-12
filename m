Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 467AC5727FD
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 22:57:59 +0200 (CEST)
Received: from localhost ([::1]:44782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBMxC-0002ok-CG
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 16:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtV-0005oM-EG
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:09 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oBMtT-0007Cw-Jt
 for qemu-devel@nongnu.org; Tue, 12 Jul 2022 16:54:09 -0400
Received: by mail-wr1-x42c.google.com with SMTP id r10so6668376wrv.4
 for <qemu-devel@nongnu.org>; Tue, 12 Jul 2022 13:54:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E7dRTXUUzgxvPS19+m/y28601cGMXs22U9f29w3+aDI=;
 b=j2lp57LtmUHzU2Xs6EDrHR5GnSexvaBw/c2n5XxglFr4dI527Py43dbBMSPUbxgj4d
 jmxi2AsiCdR4UoywnbYyu9tse1aNaqsUgrtrB3dCNevfbv7tEAb5fVl6z2ADENzuVxk6
 yN5XNz9WThJjpjU7b75Q44kdWmIr+l87R4pEG8dOYZMY2KB3a5uy7FAXg+8r52bhN+7c
 j5YfXIu+VSRzBpV3dWXsEozlUvxI79AMGNtieTgR9e4b05qmEbTEAaQ/ZT73dlpLTyrz
 PMs07B319SkcaBU2a7/4FyVSahVVt1RyBqUh1N46ft5iPZdnEOECGkfh0wfCbvHtKGDo
 ku7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=E7dRTXUUzgxvPS19+m/y28601cGMXs22U9f29w3+aDI=;
 b=wKaLuNxC7ipQjXH6V2t1CZjXUjJvHk1SOUZ4+N1F0nlzHmHxSlKqH0wRHqtzXBlXVa
 KjMGP56Y8rdAMb5JfShT8BiktgE++HBwRY0WduCTQOV39inKNQlkWYn6WuBv/KUIj29O
 NhZXJNsDBvCtZOe77Pu+5MdD3K6xJzTlHN8hLWGwJMFTQ5ibg8o4zEgkT9RnSIOc8LWb
 LdDvG77XqCAHSYhjAJL4WH6Gtg/lVCyA0J/n8rTR0ZTxCX8HIEPOBG6FPOvtjbarGz/S
 LVD0/GmCgxQXR2Qun7gc1P4guljHpe+Z95BRcI2sd4UHiAS2X9KHWT6zr7TJtikLFxff
 zCWA==
X-Gm-Message-State: AJIora/2i2vnkv2yLi11oStxDjKVeVxAaodfnMTnii8/VagH3hq+tayR
 yjzi+n7NtHXb26Mq8dGeUO9icN13asHVqlcA
X-Google-Smtp-Source: AGRyM1vD0JwfbXc4gEQ3g6WtmPPbe6R0oH+8T2xsyIAcknlvBfMylVpwMz2gJD5bf/62r2aLNrd2aQ==
X-Received: by 2002:a5d:440f:0:b0:21d:888b:a65b with SMTP id
 z15-20020a5d440f000000b0021d888ba65bmr24400381wrq.655.1657659245971; 
 Tue, 12 Jul 2022 13:54:05 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a5d46ca000000b0021badf3cb26sm10896005wrs.63.2022.07.12.13.54.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Jul 2022 13:54:05 -0700 (PDT)
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>,
 Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 03/12] target/mips: implement Octeon-specific arithmetic
 instructions
Date: Tue, 12 Jul 2022 22:53:38 +0200
Message-Id: <20220712205347.58372-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712205347.58372-1-f4bug@amsat.org>
References: <20220712205347.58372-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

This patch implements several Octeon-specific instructions:
- BADDU
- DMUL
- EXTS/EXTS32
- CINS/CINS32
- POP/DPOP
- SEQ/SEQI
- SNE/SNEI

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <165572673245.167724.17377788816335619000.stgit@pasha-ThinkPad-X280>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/octeon.decode      |  26 +++++
 target/mips/tcg/octeon_translate.c | 155 +++++++++++++++++++++++++++++
 2 files changed, 181 insertions(+)

diff --git a/target/mips/tcg/octeon.decode b/target/mips/tcg/octeon.decode
index 8062715578..8929ad088e 100644
--- a/target/mips/tcg/octeon.decode
+++ b/target/mips/tcg/octeon.decode
@@ -13,3 +13,29 @@
 
 %bbit_p      28:1 16:5
 BBIT         11 set:1 . 10 rs:5 ..... offset:16 p=%bbit_p
+
+# Arithmetic
+# BADDU rd, rs, rt
+# DMUL rd, rs, rt
+# EXTS rt, rs, p, lenm1
+# EXTS32 rt, rs, p, lenm1
+# CINS rt, rs, p, lenm1
+# CINS32 rt, rs, p, lenm1
+# DPOP rd, rs
+# POP rd, rs
+# SEQ rd, rs, rt
+# SEQI rt, rs, immediate
+# SNE rd, rs, rt
+# SNEI rt, rs, immediate
+
+@r3          ...... rs:5 rt:5 rd:5 ..... ......
+%bitfield_p  0:1 6:5
+@bitfield    ...... rs:5 rt:5 lenm1:5 ..... ..... . p=%bitfield_p
+
+BADDU        011100 ..... ..... ..... 00000 101000 @r3
+DMUL         011100 ..... ..... ..... 00000 000011 @r3
+EXTS         011100 ..... ..... ..... ..... 11101 . @bitfield
+CINS         011100 ..... ..... ..... ..... 11001 . @bitfield
+POP          011100 rs:5 00000 rd:5 00000 10110 dw:1
+SEQNE        011100 rs:5 rt:5 rd:5 00000 10101 ne:1
+SEQNEI       011100 rs:5 rt:5 imm:s10 10111 ne:1
diff --git a/target/mips/tcg/octeon_translate.c b/target/mips/tcg/octeon_translate.c
index 1558f74a8e..6a207d2e7e 100644
--- a/target/mips/tcg/octeon_translate.c
+++ b/target/mips/tcg/octeon_translate.c
@@ -44,3 +44,158 @@ static bool trans_BBIT(DisasContext *ctx, arg_BBIT *a)
     tcg_temp_free(t0);
     return true;
 }
+
+static bool trans_BADDU(DisasContext *ctx, arg_BADDU *a)
+{
+    TCGv t0, t1;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    tcg_gen_add_tl(t0, t0, t1);
+    tcg_gen_andi_i64(cpu_gpr[a->rd], t0, 0xff);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_DMUL(DisasContext *ctx, arg_DMUL *a)
+{
+    TCGv t0, t1;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    tcg_gen_mul_i64(cpu_gpr[a->rd], t0, t1);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_EXTS(DisasContext *ctx, arg_EXTS *a)
+{
+    TCGv t0;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    tcg_gen_sextract_tl(t0, t0, a->p, a->lenm1 + 1);
+    gen_store_gpr(t0, a->rt);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_CINS(DisasContext *ctx, arg_CINS *a)
+{
+    TCGv t0;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    tcg_gen_deposit_z_tl(t0, t0, a->p, a->lenm1 + 1);
+    gen_store_gpr(t0, a->rt);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_POP(DisasContext *ctx, arg_POP *a)
+{
+    TCGv t0;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rs);
+    if (!a->dw) {
+        tcg_gen_andi_i64(t0, t0, 0xffffffff);
+    }
+    tcg_gen_ctpop_tl(t0, t0);
+    gen_store_gpr(t0, a->rd);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool trans_SEQNE(DisasContext *ctx, arg_SEQNE *a)
+{
+    TCGv t0, t1;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rs);
+    gen_load_gpr(t1, a->rt);
+
+    if (a->ne) {
+        tcg_gen_setcond_tl(TCG_COND_NE, cpu_gpr[a->rd], t1, t0);
+    } else {
+        tcg_gen_setcond_tl(TCG_COND_EQ, cpu_gpr[a->rd], t1, t0);
+    }
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_SEQNEI(DisasContext *ctx, arg_SEQNEI *a)
+{
+    TCGv t0;
+
+    if (a->rt == 0) {
+        /* nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+
+    gen_load_gpr(t0, a->rs);
+
+    /* Sign-extend to 64 bit value */
+    target_ulong imm = a->imm;
+    if (a->ne) {
+        tcg_gen_setcondi_tl(TCG_COND_NE, cpu_gpr[a->rt], t0, imm);
+    } else {
+        tcg_gen_setcondi_tl(TCG_COND_EQ, cpu_gpr[a->rt], t0, imm);
+    }
+
+    tcg_temp_free(t0);
+
+    return true;
+}
-- 
2.36.1


