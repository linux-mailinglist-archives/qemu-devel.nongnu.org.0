Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73DD3C3F65
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 23:06:38 +0200 (CEST)
Received: from localhost ([::1]:50080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ger-0007KL-LO
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 17:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZf-0007Gt-Tz
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:16 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:38858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m2gZc-0000sF-Eu
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 17:01:14 -0400
Received: by mail-wr1-x431.google.com with SMTP id g16so12170467wrw.5
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 14:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHcqs60mfxo/e3jX7K3pLTYrZwZ3U9mqtq1fq2E7FmU=;
 b=DJlM6GK3XS4YRn6llladplsOp4fGPoWxJKcNwHbwlXcic78iRs2bI2HrIziWaRbOPW
 nVq58dJPsBlbx5eV5g1Exmo5J07WaM2nxlX1aJHlXTIm88osLZdwCxWS4MNmKUfKFxtq
 oah4aVxhvpmWvIrksWWK24F96tsuBG6TeXAoUd626gsw0h2Hmo7yH3smrcSAuFctoo/k
 sFKQVsThAg7iy84Dtx9/oTa92dvjxbK0xbM23PD+recpALDdBSVRwiX2uWyBNzhjywwO
 W6CJBXi/KTAhnFMcGaw/3G7g09e85V5V1Yzb+l6D4dFhgh2jREhJv3/fnZOlfO/jC/0L
 Ei+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=tHcqs60mfxo/e3jX7K3pLTYrZwZ3U9mqtq1fq2E7FmU=;
 b=kcq6EOS4OvaqYoXeQcyaqgkuhfCODUvr0u/6YR9tuaWvwB6xp46X/NKch6op3GBfSz
 6hpieOsSIpcCo8BQl/B+U7n9up1sQXaRaiywuBad7DscHiSvwpzCyg7Ik53nYX226Ykq
 qgEvlQ6a2amDpMYtvTcmvBaSIPdpbHxG+ugCt/iP8Vr/iEwG/5pYylpSfFvaInvBWt+9
 TCIbyEIXVU065BA2nWyJdzO8Zhb1m37tqIezgCYdGA0Fk0szk6yJ3CFlLxrlliZzCPxf
 iOwmeb8vcS4pImTq9sGAixplrDkDDeHdD5bfMVSWiviRRpHQFtuvMS7FaygIRi9xzoRw
 u6eQ==
X-Gm-Message-State: AOAM532iz1rSahEYPXycd1ONejfpmO5sFTG4M+gXCV3YM1+qauqrYZ1M
 GEz34n1k1uQz+ZXpzF5XlFtalgO9NTjXJjfr
X-Google-Smtp-Source: ABdhPJxr4B+iP59QLojWnXEjJTvXqhLHwSKxJrDlFPYIUNo0pf62S1ppYd6XALNGo+9x9YOjh5+FLw==
X-Received: by 2002:adf:90c6:: with SMTP id i64mr55417248wri.168.1626037269838; 
 Sun, 11 Jul 2021 14:01:09 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id f1sm11819055wri.74.2021.07.11.14.01.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 11 Jul 2021 14:01:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/19] target/mips/tx79: Introduce PPACW opcode (Parallel Pack
 to Word)
Date: Sun, 11 Jul 2021 23:00:06 +0200
Message-Id: <20210711210016.2710100-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210711210016.2710100-1-f4bug@amsat.org>
References: <20210711210016.2710100-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fredrik Noring <noring@nocrew.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the PPACW opcode (Parallel Pack to Word).

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210214175912.732946-22-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/tx79.decode      |  1 +
 target/mips/tcg/tx79_translate.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/target/mips/tcg/tx79.decode b/target/mips/tcg/tx79.decode
index 63fbe9694bb..653910371d2 100644
--- a/target/mips/tcg/tx79.decode
+++ b/target/mips/tcg/tx79.decode
@@ -38,6 +38,7 @@ PCGTH           011100 ..... ..... ..... 00110 001000   @rs_rt_rd
 PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
 PCGTB           011100 ..... ..... ..... 01010 001000   @rs_rt_rd
 PEXTLW          011100 ..... ..... ..... 10010 001000   @rs_rt_rd
+PPACW           011100 ..... ..... ..... 10011 001000   @rs_rt_rd
 PEXTLH          011100 ..... ..... ..... 10110 001000   @rs_rt_rd
 PEXTLB          011100 ..... ..... ..... 11010 001000   @rs_rt_rd
 
diff --git a/target/mips/tcg/tx79_translate.c b/target/mips/tcg/tx79_translate.c
index f0e3d8c0b66..90c33d26a9f 100644
--- a/target/mips/tcg/tx79_translate.c
+++ b/target/mips/tcg/tx79_translate.c
@@ -374,6 +374,36 @@ static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
  * PEXTLW  rd, rs, rt        Parallel Extend Lower from Word
  */
 
+/* Parallel Pack to Word */
+static bool trans_PPACW(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 a0, b0, t0;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    a0 = tcg_temp_new_i64();
+    b0 = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+
+    gen_load_gpr(a0, a->rs);
+    gen_load_gpr(b0, a->rt);
+
+    gen_load_gpr_hi(t0, a->rt); /* b1 */
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], b0, t0, 32, 32);
+
+    gen_load_gpr_hi(t0, a->rs); /* a1 */
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], a0, t0, 32, 32);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(b0);
+    tcg_temp_free(a0);
+
+    return true;
+}
+
 static void gen_pextw(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 a, TCGv_i64 b)
 {
     tcg_gen_deposit_i64(dl, b, a, 32, 32);
-- 
2.31.1


