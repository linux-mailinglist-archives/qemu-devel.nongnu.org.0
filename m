Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6AB531B1D6
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:13:48 +0100 (CET)
Received: from localhost ([::1]:40676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBLtz-00054W-Nj
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:13:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhQ-0007ib-Us
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:49 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:40741)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhO-0004XW-Uj
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:48 -0500
Received: by mail-wr1-x432.google.com with SMTP id v14so6088198wro.7
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SDHdCg7Mye3AzFKx4ibkRRFtRHfjnUTnAAujz3rX0fg=;
 b=WXjrqFIBE+198Wt61yI6B5UNkEvJfUx64IhHrzNV1R0qbkJiHB7E3aI9Mr5vVlbMil
 lDezMOMIOmAw+klnrbpqdOfbX0HG4HpOd0GMQ7Jl9jtkxQCkfdOTJWWt0ff2YrWN3lVd
 tVTQCdxv3ZuqQTIKYa1xc8jcbPtiuR3dVVfDXsm6rW1iCC8hWYOpYaNDpxlu9UVfo6SP
 q3r+VkZ73qiDw0PY4Yx7bcRahX4JBqlzj0dn0nUrR1Fb0dokmndsPUE8ytJmORCW8D9i
 1gHUmQPoWpy3ntUDlvtURj+22OJIzV9RlFFvvhV6PrgdtWhLKdYjqUepj7UgBCC9oyyb
 c7wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=SDHdCg7Mye3AzFKx4ibkRRFtRHfjnUTnAAujz3rX0fg=;
 b=dUHdKpL9kOJyg1rg3M7JPf+gm1isgI2Ew1wrgkOdXg+pRH3nCdNK6LP58fXEmv7zCQ
 /yNx4Yj4F/unC+jb+RR6tVuCp1Y30ioTP/NJbq0pYuZMybI8KsPRDjsipWVeJnsfg7Wj
 10KEBwRkHeFNLULgLKLaZF7+VYl2ryZ6wzSIJXZrQTONqjXYMN8xsXy7fW3WK/PNSV3b
 q1S1p03sY5ZwCHVKsojNfwd/gHYjvDGjkUEC6WdHTk6ZaIlV/QjEXcaXyGwH2lZpMd6g
 OWKJir96aPWjJC/9ZvIIYTbxwsWePL/SgtOl5op/frSme6QJPigGAQvLBxdAHkU0+2hw
 Wnig==
X-Gm-Message-State: AOAM530pT+xbFAQOaQot/ksFnbbKSBtsxHLoBwdDZbz1J9kZsrmgZmPt
 subhQx9m0pPDSK6QH0W+8ngrCsVYtWw=
X-Google-Smtp-Source: ABdhPJwxbkOoVkbbuR2FAuCskz60XedGxH9bmv3Yjcz9gbU3/uEUg7mRx+RV60NhDmaPedqK6uEZqQ==
X-Received: by 2002:adf:f542:: with SMTP id j2mr7412226wrp.46.1613325644748;
 Sun, 14 Feb 2021 10:00:44 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id f7sm10918378wmh.39.2021.02.14.10.00.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:00:44 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 18/42] target/mips/tx79: Introduce PEXTU[BHW] opcodes
 (Parallel Extend Lower)
Date: Sun, 14 Feb 2021 18:58:48 +0100
Message-Id: <20210214175912.732946-19-f4bug@amsat.org>
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

Introduce the 'Parallel Extend Lower' opcodes:

 - PEXTLB (Parallel Extend Upper from Byte)
 - PEXTLH (Parallel Extend Upper from Halfword)
 - PEXTLW (Parallel Extend Upper from Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tx79.decode      |  3 ++
 target/mips/tx79_translate.c | 78 ++++++++++++++++++++++++++++++++++++
 2 files changed, 81 insertions(+)

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
index 0a2fb28600b..11968d6edab 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -332,6 +332,84 @@ static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
  * PEXTLW  rd, rs, rt        Parallel Extend Lower from Word
  */
 
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
+    /* Lower halve */
+    for (int i = 0; i < 64 / (2 * wlen); i++) {
+        tcg_gen_deposit_i64(cpu_gpr[a->rd],
+                            cpu_gpr[a->rd], bx, 2 * wlen * i, wlen);
+        tcg_gen_deposit_i64(cpu_gpr[a->rd],
+                            cpu_gpr[a->rd], ax, 2 * wlen * i + wlen, wlen);
+        tcg_gen_shri_i64(bx, bx, wlen);
+        tcg_gen_shri_i64(ax, ax, wlen);
+    }
+    /* Upper halve */
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
 /* Parallel Extend Upper from Word */
 static bool trans_PEXTUW(DisasContext *ctx, arg_rtype *a)
 {
-- 
2.26.2


