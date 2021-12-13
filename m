Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C528473480
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Dec 2021 19:58:30 +0100 (CET)
Received: from localhost ([::1]:37992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwqWr-0006xQ-7P
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 13:58:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwqUt-0004Lh-UY
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:56:29 -0500
Received: from [2a00:1450:4864:20::331] (port=56033
 helo=mail-wm1-x331.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mwqUp-0001yg-WB
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 13:56:26 -0500
Received: by mail-wm1-x331.google.com with SMTP id p18so12641346wmq.5
 for <qemu-devel@nongnu.org>; Mon, 13 Dec 2021 10:56:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mbs0XnxAH9XZ1rqWsX8q/JBDekNQiMIH/00Vs+Bfjx8=;
 b=JFKS5mQHN8821VaJhUAUg/Dzr0jAK/sNb+RHEnD9SZVivZKJB2+3D8XngGmUWi8kB2
 vBi3s0+X2mchW/kWth3ftHP0diuDeT0fmrXHGeqOCZv+KWaqKMQ+g/9Bd8kTFDdqcKOj
 gqtan/MLrEmCnePaf4E+VBkZCWORnTSzYHjYOuxLaKGWFD72jRqUMEGVVrd6MJN/pswW
 dJlojhT5uZ8M73ZHZRLK3m3plUaFUxkKWgF1JH8LB6ZanXvLr2K31EEoHCykghYFdNBS
 OQCS/28LBbjLj3VtiZDoOcRxzlrjgnHpMppyp2zS5QZeJrlimwtSIQuJHxb8I7g5U0Rh
 WDng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=mbs0XnxAH9XZ1rqWsX8q/JBDekNQiMIH/00Vs+Bfjx8=;
 b=m5RcDoqY5P1ExDsPZ+Oi4+X2Z46zvrQxwVYUe3a9pYQIi19zc6Mt3z3za8yRo4RtrJ
 Qy7jX+1F/cquB6gnCsNsEuOW6zdlA3563fLg0F71cICWcpkPNWEx1bkBh3geTNK3H53e
 dGtftEYoM0SzOUrycgzZnjPJOQt/qDSCzfaMvRM5BLYkqXpiXhrRx1kia5+XDf0082gw
 qOdoNkgZGinCHqhqiRMwRTHcFAQfSo4AZ1HvcrpX6eRg7+lMizoOBsqPBxUzFrHPP2e5
 e5jNU2Bmg+3cx4+kd4q0HHGcY1C3teNHL6QCc5B0JoIK1PmBLKrkuVkVEnedFRp+78O0
 mIxQ==
X-Gm-Message-State: AOAM530usamtVvJz4InfiibaPvrEHFIihxAFTa8krTOLEsBZ49+Lq2Z5
 NF1oVcrecpioNxzSXkfOipkLMDzOQqA=
X-Google-Smtp-Source: ABdhPJwnzGyngdYa0UAmNr3GfJPhDslH89Ek9Dzb5gFTxrWBj6Fq0SmpmHkP4VwrwzB7/tlM+8a2KQ==
X-Received: by 2002:a7b:c155:: with SMTP id z21mr39315256wmi.107.1639421782208; 
 Mon, 13 Dec 2021 10:56:22 -0800 (PST)
Received: from x1w.redhat.com (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id u13sm9389401wmq.14.2021.12.13.10.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Dec 2021 10:56:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] target/hppa: Fix deposit assert from trans_shrpw_imm
Date: Mon, 13 Dec 2021 19:56:10 +0100
Message-Id: <20211213185610.1987974-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211213185610.1987974-1-f4bug@amsat.org>
References: <20211213185610.1987974-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::331
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Sven Schnelle <svens@stackframe.org>, Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Because sa may be 0,

    tcg_gen_deposit_reg(dest, t0, cpu_gr[a->r1], 32 - sa, sa);

may attempt a zero-width deposit at bit 32, which will assert
for TARGET_REGISTER_BITS == 32.

Use the newer extract2 when possible, which itself includes the
rotri special case; otherwise mirror the code from trans_shrpw_sar,
using concat and shri.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/635
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20211213174248.29222-1-richard.henderson@linaro.org>
---
 target/hppa/translate.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/target/hppa/translate.c b/target/hppa/translate.c
index 261e4c75c7c..952027a28e1 100644
--- a/target/hppa/translate.c
+++ b/target/hppa/translate.c
@@ -140,6 +140,7 @@
 #define tcg_gen_deposit_z_reg tcg_gen_deposit_z_i64
 #define tcg_gen_extract_reg  tcg_gen_extract_i64
 #define tcg_gen_sextract_reg tcg_gen_sextract_i64
+#define tcg_gen_extract2_reg tcg_gen_extract2_i64
 #define tcg_const_reg        tcg_const_i64
 #define tcg_const_local_reg  tcg_const_local_i64
 #define tcg_constant_reg     tcg_constant_i64
@@ -234,6 +235,7 @@
 #define tcg_gen_deposit_z_reg tcg_gen_deposit_z_i32
 #define tcg_gen_extract_reg  tcg_gen_extract_i32
 #define tcg_gen_sextract_reg tcg_gen_sextract_i32
+#define tcg_gen_extract2_reg tcg_gen_extract2_i32
 #define tcg_const_reg        tcg_const_i32
 #define tcg_const_local_reg  tcg_const_local_i32
 #define tcg_constant_reg     tcg_constant_i32
@@ -3206,6 +3208,8 @@ static bool trans_shrpw_imm(DisasContext *ctx, arg_shrpw_imm *a)
     t2 = load_gpr(ctx, a->r2);
     if (a->r1 == 0) {
         tcg_gen_extract_reg(dest, t2, sa, 32 - sa);
+    } else if (TARGET_REGISTER_BITS == 32) {
+        tcg_gen_extract2_reg(dest, t2, cpu_gr[a->r1], sa);
     } else if (a->r1 == a->r2) {
         TCGv_i32 t32 = tcg_temp_new_i32();
         tcg_gen_trunc_reg_i32(t32, t2);
@@ -3213,10 +3217,11 @@ static bool trans_shrpw_imm(DisasContext *ctx, arg_shrpw_imm *a)
         tcg_gen_extu_i32_reg(dest, t32);
         tcg_temp_free_i32(t32);
     } else {
-        TCGv_reg t0 = tcg_temp_new();
-        tcg_gen_extract_reg(t0, t2, sa, 32 - sa);
-        tcg_gen_deposit_reg(dest, t0, cpu_gr[a->r1], 32 - sa, sa);
-        tcg_temp_free(t0);
+        TCGv_i64 t64 = tcg_temp_new_i64();
+        tcg_gen_concat_reg_i64(t64, t2, cpu_gr[a->r1]);
+        tcg_gen_shri_i64(t64, t64, sa);
+        tcg_gen_trunc_i64_reg(dest, t64);
+        tcg_temp_free_i64(t64);
     }
     save_gpr(ctx, a->t, dest);
 
-- 
2.33.1


