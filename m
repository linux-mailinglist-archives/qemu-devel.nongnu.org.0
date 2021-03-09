Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0711332ABF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:40:35 +0100 (CET)
Received: from localhost ([::1]:40642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeTL-000454-1P
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:40:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdo8-0005Iz-Bi
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:00 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:46093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdo6-0002h3-LD
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:00 -0500
Received: by mail-ej1-x62c.google.com with SMTP id r17so28447056ejy.13
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:57:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QOhpnrF1XVp829jjkXzuMvSRqzxbno4iUbDwXPyc+ek=;
 b=Shb2d8hHigh3WWhJYFupMaJyEc/gJhOFAwJBM95zIzFnq5ElK3hNkrXsnhcfmb5eky
 /oHYwVb6SmjUwV/ScC0ei+SF8Pt1coCZpLW9fkmbBZ3Ctu3TjSGiKV23Qma0vE5tFPCe
 qRywlV7OVuhMdy1yWtbnHAVExLlED7RI3h0gwnLFrC0b967CT3q72O2SwqngJwPxkUs9
 dbmKyimXw+SaSBMPHzpQFVhMvo2JVXRRGv1GVUQ0rtL4MPL7cW8G14SlqsGmGgoR4BOz
 23Me0TvUAKLjoZG+Isc5F0YPLo1r/sMbMUG1PNhe3Dk20S8QOykyTPwW+FqbXqppz2TE
 GFlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QOhpnrF1XVp829jjkXzuMvSRqzxbno4iUbDwXPyc+ek=;
 b=mvFMq4l73xMKxhuOeGdDY/mf0QQNWwhN5xitCpOpQYS1Mycu3R1gt0QTrypmGugeSq
 TNazDm1ZyDkOMwPXcW+7encJP4lns7VJ7NYMQ8v2HPZVr7L9xqCFNVKN5eTif/ff7r78
 R5stXT7zDBjeTRpXi/O3jCg6bSxaNAzpPpWmAcVg3ccN06gqjErdWlJeVxVm39P7XiSG
 XS1OeOKQeAZlqMdT4aB866IfPTuh4BZxF4mXhBoD3Mr5o+bfKR4ZIMUnJpiPqP2LBHnR
 O63eYtCmvOXY0FaiiAS2QW3Ok2jxXk9oh/D4HBusbczhnYN03nifXO8wcx+gqGMNQFa/
 wVPA==
X-Gm-Message-State: AOAM531nZG30MywQI8Eqx/PBoKDGYnntMCYqNYiwWq7D8vIoIRV3LcNh
 EJlGAHuYVqa65yB4STmWmCB3Ax6huCk=
X-Google-Smtp-Source: ABdhPJx8ElgFvDx5JTD22RjDIhPfyrPzWW193uAHMGJGiVzOZdGTp8otaPdyty/nlwD2lirVWZJFGQ==
X-Received: by 2002:a17:906:add7:: with SMTP id
 lb23mr20596390ejb.273.1615301876888; 
 Tue, 09 Mar 2021 06:57:56 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id h13sm9439857edz.71.2021.03.09.06.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:57:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 12/22] target/mips/tx79: Introduce PEXTL[BHW] opcodes
 (Parallel Extend Lower)
Date: Tue,  9 Mar 2021 15:56:43 +0100
Message-Id: <20210309145653.743937-13-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62c.google.com
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

Introduce the 'Parallel Extend Lower' opcodes:

 - PEXTLB (Parallel Extend Upper from Byte)
 - PEXTLH (Parallel Extend Upper from Halfword)
 - PEXTLW (Parallel Extend Upper from Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: Uses gen_pextw, still unoptimized, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg782796.html
---
 target/mips/tx79.decode      |  3 ++
 target/mips/tx79_translate.c | 75 ++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index ead5f8281e5..98f21d33e3f 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -34,6 +34,9 @@ MTLO1           011100 .....  0000000000 00000 010011   @rs
 PSUBW           011100 ..... ..... ..... 00001 001000   @rs_rt_rd
 PSUBH           011100 ..... ..... ..... 00101 001000   @rs_rt_rd
 PSUBB           011100 ..... ..... ..... 01001 001000   @rs_rt_rd
+PEXTLW          011100 ..... ..... ..... 10010 001000   @rs_rt_rd
+PEXTLH          011100 ..... ..... ..... 10110 001000   @rs_rt_rd
+PEXTLB          011100 ..... ..... ..... 11010 001000   @rs_rt_rd
 
 # MMI1
 
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 68c56affc4c..c4656a4c21d 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -297,6 +297,81 @@ static void gen_pextw(TCGv_i64 dl, TCGv_i64 dh, TCGv_i64 a, TCGv_i64 b)
     tcg_gen_deposit_i64(dh, a, b, 0, 32);
 }
 
+static bool trans_PEXTLx(DisasContext *ctx, arg_rtype *a, unsigned wlen)
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
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+
+    /* Lower half */
+    for (int i = 0; i < 64 / (2 * wlen); i++) {
+        tcg_gen_deposit_i64(cpu_gpr[a->rd],
+                            cpu_gpr[a->rd], bx, 2 * wlen * i, wlen);
+        tcg_gen_deposit_i64(cpu_gpr[a->rd],
+                            cpu_gpr[a->rd], ax, 2 * wlen * i + wlen, wlen);
+        tcg_gen_shri_i64(bx, bx, wlen);
+        tcg_gen_shri_i64(ax, ax, wlen);
+    }
+    /* Upper half */
+    for (int i = 0; i < 64 / (2 * wlen); i++) {
+        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd],
+                            cpu_gpr_hi[a->rd], bx, 2 * wlen * i, wlen);
+        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd],
+                            cpu_gpr_hi[a->rd], ax, 2 * wlen * i + wlen, wlen);
+        tcg_gen_shri_i64(bx, bx, wlen);
+        tcg_gen_shri_i64(ax, ax, wlen);
+    }
+
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
+
+/* Parallel Extend Lower from Byte */
+static bool trans_PEXTLB(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_PEXTLx(ctx, a, 8);
+}
+
+/* Parallel Extend Lower from Halfword */
+static bool trans_PEXTLH(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_PEXTLx(ctx, a, 16);
+}
+
+/* Parallel Extend Lower from Word */
+static bool trans_PEXTLW(DisasContext *ctx, arg_rtype *a)
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
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+    gen_pextw(cpu_gpr[a->rd], cpu_gpr_hi[a->rd], ax, bx);
+
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+
+    return true;
+}
+
 /* Parallel Extend Upper from Word */
 static bool trans_PEXTUW(DisasContext *ctx, arg_rtype *a)
 {
-- 
2.26.2


