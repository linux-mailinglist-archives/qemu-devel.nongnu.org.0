Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FA731B1EE
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Feb 2021 19:22:55 +0100 (CET)
Received: from localhost ([::1]:33558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBM2o-0006Fw-Rt
	for lists+qemu-devel@lfdr.de; Sun, 14 Feb 2021 13:22:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhV-0007mm-KC
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:53 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:37552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lBLhT-0004YI-AR
 for qemu-devel@nongnu.org; Sun, 14 Feb 2021 13:00:52 -0500
Received: by mail-wr1-x42c.google.com with SMTP id v15so6105098wrx.4
 for <qemu-devel@nongnu.org>; Sun, 14 Feb 2021 10:00:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=MZnb2f0oqLbgB+c7ANHKvpi9xEka37HUd4LIx2gMYzU=;
 b=XbXD16rlF+fJtkdoQNBAXecczOqW93y7hSfOKJqIjZ9Euz4v8k0hvFsb/LLwDeICTC
 J6gzQjbhbPc4omLfRa0hWaEcTir7gM3s8SPwRu69B/2Bd2ETdLypfdwXWcWlRjw7i0kC
 3Gd3y4CZPT6NdqVrx6MwSsf9GoXz2lxCI7gonUCyzO4dCI0vD/5Nc3zT+bjcP7gehCtM
 6S8KI+KiDlDsWkX1a8JVYfH9/YfiLdJ/Pkn4vDhHa988SyEgYPjN81qaISVfGkI8Y9H7
 YRXOGqdZ6BJWDNz37Vh72ed102koNUYXDKYJxnw5M6YQOGduL7cEYqF+XCJHC/Uues0S
 g1Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=MZnb2f0oqLbgB+c7ANHKvpi9xEka37HUd4LIx2gMYzU=;
 b=iOjIl6Yey3bm/oznyZwvDfXLr5Mn6wmGsfzNSW5XyznwB9KNbtqiu0a4bZfrahicFu
 xuabTbi9pu1C4WOI1BpuWJNZUyYN1AMwL3viKVwM6tbEkLYXqys8/A/lpW3I76EVXdku
 3KTQJZpk5dDaALWrz9D72PyL83Ey9Hfn2HN+ZhX0tsLnTNDDwxoHbFzAoZXRiQuPST8n
 wOUmdlmVnZLLz7ehF2eeAXGZJN3wH47NSar1PYosRIwG059fZ5k6auh6+oBDSLe9kQks
 9nYcH7L55Dg+/rIF/I4frjqSP4eaWiG6Z+YqOU7G0zbHk3hJcL3aQroZMaLxInjJhdEU
 jvww==
X-Gm-Message-State: AOAM532tL6LOFjQAf3671dGv3ASyr9tTBB4FzAfz8X6IWQh8dqro/Us9
 8sbFNPozZ7rblxrfJ3p3XhwDfip5VCQ=
X-Google-Smtp-Source: ABdhPJyXzF5oSjM736azj8MX/79+VOs0g5QWmjaQo/j5SeOh2JZE5X1U2UNofJ1rVeaED6dWk0oASQ==
X-Received: by 2002:adf:8544:: with SMTP id 62mr15261450wrh.336.1613325649781; 
 Sun, 14 Feb 2021 10:00:49 -0800 (PST)
Received: from localhost.localdomain (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j40sm20223076wmp.47.2021.02.14.10.00.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Feb 2021 10:00:49 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 19/42] target/mips/tx79: Introduce PCEQ* opcodes (Parallel
 Compare for Equal)
Date: Sun, 14 Feb 2021 18:58:49 +0100
Message-Id: <20210214175912.732946-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210214175912.732946-1-f4bug@amsat.org>
References: <20210214175912.732946-1-f4bug@amsat.org>
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

Introduce the 'Parallel Compare for Equal' opcodes:

 - PCEQB (Parallel Compare for Equal Byte)
 - PCEQH (Parallel Compare for Equal Halfword)
 - PCEQW (Parallel Compare for Equal Word)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 11968d6edab..f084faa48a7 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -279,6 +279,72 @@ static bool trans_PNOR(DisasContext *ctx, arg_rtype *a)
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
+    /* Lower halve */
+    gen_load_gpr(ax, a->rs);
+    gen_load_gpr(bx, a->rt);
+    for (int i = 0; i < (64 / wlen); i++) {
+        tcg_gen_sextract_i64(t0, ax, wlen * i, wlen);
+        tcg_gen_sextract_i64(t1, bx, wlen * i, wlen);
+        tcg_gen_movcond_i64(cond, t2, t1, t0, c1, c0);
+        tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], t2, wlen * i, wlen);
+    }
+    /* Upper halve */
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


