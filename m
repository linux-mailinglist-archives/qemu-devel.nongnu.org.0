Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA83332A67
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 16:28:34 +0100 (CET)
Received: from localhost ([::1]:38100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJeHh-0007hV-JK
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 10:28:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoX-0005dp-F7
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:25 -0500
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530]:36240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJdoV-0002qb-Pn
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 09:58:25 -0500
Received: by mail-ed1-x530.google.com with SMTP id l12so20764861edt.3
 for <qemu-devel@nongnu.org>; Tue, 09 Mar 2021 06:58:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8smUmlgkKy5kU6GHKPn53J5syMPm8er0j9E7+m5z5Ww=;
 b=fVBFUw9Z2u+YrohjbQkqB4bUIqAkkjoQD0GojIVEl3NKoBNMABv6D71ts8Rn2moREp
 iDnbky9qRMcd9KyHk37xMC6NAQ6cPY+nfL6i+mJg+AbRhXSSKVsI8nTbVK8sw7ves5HL
 yWEVNszLhkjbVaatsIlG3aAfj9H422rPonIQuMCXmPtOGtW3rNVJ0Q0ELG6vXQ5pZN11
 7WHUuWlQEXN5ayUWAkbIxDJDlKwlD7M4tRZkxjkQ9EbvDI31M51NHSp1DdIHHagzcG5j
 imHVQVl2i+/xvndipZX4kUpE/ULygP8z3M3NL0cjIEcAdcL1GIoIJa2z/tfE1UTpWkBS
 77aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=8smUmlgkKy5kU6GHKPn53J5syMPm8er0j9E7+m5z5Ww=;
 b=Qlhyeb1I/4NLhrtdyXYJwHJQ93ODF5BNwocC9egY7hS2UABdd1Ssl7KFXBm3LbP6B4
 XuWhsRCGQv/1zH8g01Q8jCHFoVmbYx4CvWOqoddZwPUZdr1hu/sMfxyp6r665HAqp25Y
 tGyXRz8TJJTHD3iH+DIvl9BQO4ZBhvt95Ykv/xgfba4tz3E+iVu7K1fMhU4rfj033vrJ
 jUtt+EtH/rmBtauJWazP7GgxeW0yvFdMTNLj/rQ6rNbQxwtGaquk1uCJjIewJX1hkigN
 w9YL5fGC1vT5jpxWFVAYLIw+Eui7EOfv7CPB7r9iuVfbWLqN+uJXwlUi1so15l83MBRI
 nVrg==
X-Gm-Message-State: AOAM531XnRQwa6JIPttPlCM2Iluo7dlOF5Q3qcJKcz2DlXr/at1X/aTY
 ppwgcuJJQdUyTMnl3aLqalVfx0oyZ/g=
X-Google-Smtp-Source: ABdhPJwuF0p5MTbapzJj8Q6be+KuJK8aXiT13e+6tD/iMaHC02uQk2h7Nr8lrrMaaOhWp98hgmsIkQ==
X-Received: by 2002:aa7:c5c4:: with SMTP id h4mr4361172eds.375.1615301902331; 
 Tue, 09 Mar 2021 06:58:22 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id y11sm8343050ejd.72.2021.03.09.06.58.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 06:58:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 17/22] target/mips/tx79: Introduce PEXE[HW] opcodes
 (Parallel Exchange Even)
Date: Tue,  9 Mar 2021 15:56:48 +0100
Message-Id: <20210309145653.743937-18-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210309145653.743937-1-f4bug@amsat.org>
References: <20210309145653.743937-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::530;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x530.google.com
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

Introduce the PEXEH (Parallel Exchange Even Halfword) and PEXEW
(Parallel Exchange Even Word) opcodes.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
v2: unoptimized, see:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg782831.html
---
 target/mips/tx79.decode      |  2 ++
 target/mips/tx79_translate.c | 70 ++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+)

diff --git a/target/mips/tx79.decode b/target/mips/tx79.decode
index fbd2be569ad..0ea9fc95568 100644
--- a/target/mips/tx79.decode
+++ b/target/mips/tx79.decode
@@ -54,6 +54,8 @@ PEXTUW          011100 ..... ..... ..... 10010 101000   @rs_rt_rd
 PCPYLD          011100 ..... ..... ..... 01110 001001   @rs_rt_rd
 PAND            011100 ..... ..... ..... 10010 001001   @rs_rt_rd
 PXOR            011100 ..... ..... ..... 10011 001001   @rs_rt_rd
+PEXEH           011100 00000 ..... ..... 11010 001001   @rt_rd
+PEXEW           011100 00000 ..... ..... 11110 001001   @rt_rd
 
 # MMI3
 
diff --git a/target/mips/tx79_translate.c b/target/mips/tx79_translate.c
index 7c7879face0..b23e0a1b048 100644
--- a/target/mips/tx79_translate.c
+++ b/target/mips/tx79_translate.c
@@ -615,3 +615,73 @@ static bool trans_PINTEH(DisasContext *ctx, arg_rtype *a)
 {
     return trans_parallel_arith(ctx, a, gen_vec_pinteh);
 }
+
+/* Parallel Exchange Even Halfword */
+static bool trans_PEXEH(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 ax;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+    if (a->rt == 0) {
+        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+        return true;
+    }
+
+    ax = tcg_temp_new_i64();
+
+    /* Lower half */
+    tcg_gen_mov_i64(ax, cpu_gpr[a->rt]);
+    if (a->rd != a->rt) {
+        tcg_gen_mov_i64(cpu_gpr[a->rd], cpu_gpr[a->rt]);
+    }
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], ax, 32, 16);
+    tcg_gen_shri_i64(ax, ax, 32);
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], cpu_gpr[a->rd], ax, 0, 16);
+
+    /* Upper half */
+    tcg_gen_mov_i64(ax, cpu_gpr_hi[a->rt]);
+    if (a->rd != a->rt) {
+        tcg_gen_mov_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rt]);
+    }
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], ax, 32, 16);
+    tcg_gen_shri_i64(ax, ax, 32);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], cpu_gpr_hi[a->rd], ax, 0, 16);
+
+    tcg_temp_free(ax);
+
+    return true;
+}
+
+/* Parallel Exchange Even Word */
+static bool trans_PEXEW(DisasContext *ctx, arg_rtype *a)
+{
+    TCGv_i64 ah, al;
+
+    if (a->rd == 0) {
+        /* nop */
+        return true;
+    }
+    if (a->rt == 0) {
+        tcg_gen_movi_i64(cpu_gpr[a->rd], 0);
+        tcg_gen_movi_i64(cpu_gpr_hi[a->rd], 0);
+        return true;
+    }
+
+    ah = tcg_temp_new_i64();
+    al = tcg_temp_new_i64();
+
+    gen_load_gpr(ah, a->rt);
+    gen_load_gpr_hi(al, a->rt);
+
+    tcg_gen_deposit_i64(cpu_gpr[a->rd], ah, al, 0, 32);
+    tcg_gen_deposit_i64(cpu_gpr_hi[a->rd], al, ah, 0, 32);
+
+    tcg_temp_free(al);
+    tcg_temp_free(ah);
+
+    return true;
+}
-- 
2.26.2


