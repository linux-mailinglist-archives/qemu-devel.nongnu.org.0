Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 416C9332ABC
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:40:22 +0100 (CET)
Received: from localhost ([::1]:39306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeT7-0003XM-85
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:40:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoE-0005Ni-PI
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:07 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:35715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoB-0002jp-PB
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:05 -0500
Received: by mail-ej1-x62d.google.com with SMTP id dx17so28485041ejb.2
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:58:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KiD91N4cl6AAk7p2Aqg/9eZRSUZMrKmMXWieEDLSTqc=;
 b=Zf7zMLnzlnsv5rXxnmr6uxlSgseGSfmpGk0vLcH832Fvp+vVyhjLym1WCgNBGXQV0U
 TuQk5sIqUShtnAMu1rWvxsbGh4TYwUuM7TO94XOBuQW51odf4jwGoOrPgzxl8w3w1zRn
 aa3oKWZ2CRDBdIXsaBXhg/f3dpbOeABZt8c/CUYUzus+VwUllyjWx3kx0ozbA3gWU8pl
 ETHw8g9ZPGK/ACBkqKjcNqOkiY9dJDUD3/jUDgU0FPuhNvLrEXgVwOpd0CkIAH7zW1y7
 yfs9AAKqb+XBN6WRbPezEljszRqih547EOVXa5lTualyQjrDz8KuwjsAfuF5C7eMSkFy
 lRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=KiD91N4cl6AAk7p2Aqg/9eZRSUZMrKmMXWieEDLSTqc=;
 b=EDI6jjCcAN5s2pY4t9UaIrMnFXm6BqNXvgpUOiZ2VQ9ibxXTtwuEu09XX60e+bp46E
 9yVR9/8g8yGcqPhLEJoREZH2Z9A1eaCjZDyxbZqvdJK17DEXD1bGvt/bZYEF19m2oxGQ
 p32xjZmvscCXQ3o55a0GQ9zPnKC1oeyQhb49XubWI51B8sZNQSCEkPb5a8VeoMlULjCr
 auOnA6DSkseoXH1S0PQANcOtBd4Pbf3HMs3mTi3WSJ0EbZAXRnSdAJ+DNwukqtZa2JAN
 t8QnyLF5b1P+DQOWMrzM+l7H9TYn8lrBKVoT1wbHEZFTd48wFO6C0Qna3ArzoddhsSt5
 OKkA==
X-Gm-Message-State: AOAM5315NyRzgDg6xCbdZ+NfR0vWX9Zrhhp3894XINAMKgTYJFi6Ecom
 dBBEopluuprcMrsoDBJLdjmy26fdkec=
X-Google-Smtp-Source: ABdhPJzz4mdBv5zMzUr8MNeHkIvxTo88KHklY1+rOrUICV3+FhheXKVEvl3w0WDEHYHjFmmHllKgcQ==
X-Received: by 2002:a17:906:1a44:: with SMTP id
 j4mr21107824ejf.401.1615301881930; 
 Tue, 09 Mar 2021 06:58:01 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id x10sm8140987ejd.69.2021.03.09.06.58.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:58:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 13/22] target/mips/tx79: Introduce PCEQ* opcodes
 (Parallel Compare for Equal)
Date: Tue,  9 Mar 2021 15:56:44 +0100
Message-Id: <20210309145653.743937-14-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62d.google.com
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

Introduce the 'Parallel Compare for Equal' opcodes:

 - PCEQB (Parallel Compare for Equal Byte)
 - PCEQH (Parallel Compare for Equal Halfword)
 - PCEQW (Parallel Compare for Equal Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2:
unoptimized, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg782827.html
---
 target/mips/tx79.decode      |  3 ++
 target/mips/tx79_translate.c | 66 ++++++++++++++++++++++++++++++++++++
 2 files changed, 69 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index 98f21d33e3f..cfe721755ca 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -40,6 +40,9 @@ PEXTLB          011100 ..... ..... ..... 11010 001000   @rs_rt_rd
 
 # MMI1
 
+PCEQW           011100 ..... ..... ..... 00010 101000   @rs_rt_rd
+PCEQH           011100 ..... ..... ..... 00110 101000   @rs_rt_rd
+PCEQB           011100 ..... ..... ..... 01010 101000   @rs_rt_rd
 PEXTUW          011100 ..... ..... ..... 10010 101000   @rs_rt_rd
 
 # MMI2
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index c4656a4c21d..8dd510c2719 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -237,6 +237,72 @@ static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
  * PCEQW   rd, rs, rt        Parallel Compare for Equal Word
  */
 
+static bool trans_parallel_compare(DisasContext *ctx, arg_rtype *a,
+                                   TCGCond cond, unsigned wlen)
+{
+    TCGv_i64 c0, c1, ax, bx, t0, t1, t2;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+
+    c0 = tcg_const_tl(0);
+    c1 = tcg_const_tl(0xffffffff);
+    ax = tcg_temp_new_i64();
+    bx = tcg_temp_new_i64();
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+
+    /* Lower half */
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+    for (int i = 0; i < (64 / wlen); i++) {
+        tcg_gen_sextract_i64(t0, ax, wlen * i, wlen);
+        tcg_gen_sextract_i64(t1, bx, wlen * i, wlen);
+        tcg_gen_movcond_i64(cond, t2, t1, t0, c1, c0);
+        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t2, wlen * i, wlen);
+    }
+    /* Upper half */
+    gen_load_gpr_hi(ax, a->rs);
+    gen_load_gpr_hi(bx, a->rt);
+    for (int i = 0; i < (64 / wlen); i++) {
+        tcg_gen_sextract_i64(t0, ax, wlen * i, wlen);
+        tcg_gen_sextract_i64(t1, bx, wlen * i, wlen);
+        tcg_gen_movcond_i64(cond, t2, t1, t0, c1, c0);
+        tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], t2, wlen * i, wlen);
+    }
+
+    tcg_temp_free(t2);
+    tcg_temp_free(t1);
+    tcg_temp_free(t0);
+    tcg_temp_free(bx);
+    tcg_temp_free(ax);
+    tcg_temp_free(c1);
+    tcg_temp_free(c0);
+
+    return true;
+}
+
+/* Parallel Compare for Equal Byte */
+static bool trans_PCEQB(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_EQ, 8);
+}
+
+/* Parallel Compare for Equal Halfword */
+static bool trans_PCEQH(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_EQ, 16);
+}
+
+/* Parallel Compare for Equal Word */
+static bool trans_PCEQW(DisasContext *ctx, arg_rtype *a)
+{
+    return trans_parallel_compare(ctx, a, TCG_COND_EQ, 32);
+}
+
 /*
  *     LZC (1 instruction)
  *     -------------------
-- 
2.26.2


