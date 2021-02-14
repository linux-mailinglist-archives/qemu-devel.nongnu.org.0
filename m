Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9188231B1D9
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:15:04 +0100 (CET)
Received: from localhost ([::1]:44728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLvD-0006qi-IR
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:15:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhL-0007fu-36
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:47 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:44568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhJ-0004Vg-NM
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:42 -0500
Received: by mail-wr1-x432.google.com with SMTP id g6so6065409wrs.11
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U+V4mgoYQ8a3cKweLkQIShkW02XCP8ivJVee8UjrEHo=;
 b=dlxzrA+zv+GRNm37c1NMndsCwHA7t/eXJkN+TKLQ7L8gf1qet5HCUdeRy5SkIs+vPf
 mRmq/F9leZx2LnVN5YQ5pkhU2J8u4PDXxPBnFr19zLjHvTMP/xwacLumOs2z7MSAUfLZ
 5Wii+rFtl4zk+yLtDiuxLSyU9r5yQwI/DaTCyoFkO1o9vDd2YR/l3u5ug0d2OJ5SgV4O
 gFK4R3PqlHH4kPiQ5C2aAzSaY+jZOBSY85n8IUaNKRGUn9KwGEN3SGPmnWFVFSHiNUD4
 S2O2g4/4VW+dA17wizBM1h9GQCgTJqSaRjZrbu0dcnMFV4lr8qWZasnVXr+boigIJ2Uf
 qzkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U+V4mgoYQ8a3cKweLkQIShkW02XCP8ivJVee8UjrEHo=;
 b=RV9GK95bNP8RLPRPKTgD+/olBjeTpts7z/3PcQd3DgJRJ3SoQH6pbCwlsWAOdwHzZC
 GeWwdOuOHsALEwIADSv7Ml8TPffEo4dEMEIyOY/oJbJ4JbPll4DXUJuen73W41TGjadq
 EyC6qKKB1ownLm43DAog9rkIrmm2x3yTfX6+em0QRolGScROXvGCFmgfKCfcNaH8L+8Y
 McJIxiCf7IbolU0FD4UHnUJ14m5kihIRxO4LoXbJzysXqbNF2k4pPw0Az6rVXKK1cBCL
 fWcUoQkRvawLPfi1l5RIxiZv8uviNHTxDOcnAZyG3tPkRSndu6yfWq0LQ/Yb8KMLNww0
 GZew==
X-Gm-Message-State: AOAM532RMzvoHxHr9KTw7w3ZwZ9KdXHKymh7W6uspafNpEIvj2CEkvAG
 r35zBunWUrsH/OSL3E++V5+cK7b3nio=
X-Google-Smtp-Source: ABdhPJzJKdSKdL74uaZXjTmaKRj0UWLWKTYZmp5FpyuI2vjxI/3BtMw8vUQbjIcgIwDFwfssLRkyjw==
X-Received: by 2002:a05:6000:1543:: with SMTP id
 3mr15024308wry.254.1613325639825; 
 Sun, 14 Feb 2021 10:00:39 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm27880973wrs.45.2021.02.14.10.00.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:00:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 17/42] target/mips/tx79: Introduce PEXTUW (Parallel Extend
 Upper from Word)
Date: Sun, 14 Feb 2021 18:58:47 +0100
Message-Id: <20210214175912.732946-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
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

Introduce the PEXTUW opcode (Parallel Extend Upper from Word).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  4 ++++
 target/mips/tx79_translate.c | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index d1c07c7d901..ead5f8281e5 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -35,6 +35,10 @@ PSUBW           011100 ..... ..... ..... 00001 001000   @rs_rt_rd
 PSUBH           011100 ..... ..... ..... 00101 001000   @rs_rt_rd
 PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
 
+# MMI1
+
+PEXTUW          011100 ..... ..... ..... 10010 101000   @rs_rt_rd
+
 # MMI2
 
 PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 23146f6bfac..0a2fb28600b 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -332,6 +332,32 @@ static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
  * PEXTLW  rd, rs, rt        Parallel Extend Lower from Word
  */
 
+/* Parallel Extend Upper from Word */
+static bool trans_PEXTUW(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 ax, bx;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+    bx = tcg_temp_new_i64();
+
+    gen_load_gpr_hi(ax, a->rs);
+    gen_load_gpr_hi(bx, a->rt);
+
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], bx, ax, 32, 32);
+    tcg_gen_shri_i64(bx, bx, 32);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], ax, bx, 0, 32);
+
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
+
 /*
  *     Others (16 instructions)
  *     ------------------------
-- 
2.26.2


