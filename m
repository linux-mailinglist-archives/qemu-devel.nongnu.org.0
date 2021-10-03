Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC24420333
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 20:03:44 +0200 (CEST)
Received: from localhost ([::1]:48160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX5pv-0001IY-7J
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 14:03:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kZ-0002tM-G8
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:11 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:35749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX5kX-0003Wl-TM
 for qemu-devel@nongnu.org; Sun, 03 Oct 2021 13:58:11 -0400
Received: by mail-wr1-x42e.google.com with SMTP id v25so15404461wra.2
 for <qemu-devel@nongnu.org>; Sun, 03 Oct 2021 10:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2n9LSU1b2DlEwFolRpa1OCTd/teoFX3/1wugs2VhoEo=;
 b=SO06pSfq2CCDJxqQQ5sCvbpP5HSge2Hl36omH3M5jizdjqg/lkmu5dRqvP4G88TpYi
 sV3TVQBtJPp/PjoYH84URx0xRnPAsbbcXNufDpNPpc/IgZXn/I1j2sbKEPk++BG0Gl2N
 Slpe5MkFHxrNOnX5Apok/tqDyC6Lyfq8GYbd6dL6vpkpEFNxT3isv9WmzSRUZX5j71lg
 l+IGa3cB814m4DNoSTKgJ2cR+ZXniCNnYXgzFSbpB8U4bKeE4PIzX4dF0A0gMXq2EdfS
 7VU4EsjwmrUQkUs1rN+W7ZNt1CEOWBZ+9PuygdD/utaGhcRCyRzQYxvWY2/AELIaQ0Zi
 bDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=2n9LSU1b2DlEwFolRpa1OCTd/teoFX3/1wugs2VhoEo=;
 b=Zu+iK8Hv08LJgBXVn6atosQiDggv4x4ELVKriHvUKlKAfkMMhtyX1I1TkCfKmBw4Ez
 LNl4WhkZ6Ot5x4AdAw+K6bPtpVBRIE5OjJeUVYxQ1M2cycVqK/VPuAxoL5SboclGVhQB
 vWSj6fWRPG0cl9+Vrf3uG+vhgUvoMkjIQ94Bm5jhyfm3pV6j8SeSr3cbxa15uFdeRx5q
 qjvma7IYmeQ25kDKSC6bQ2mwgbH5eokQoB8m/CsgXHb9qr79gXobNRKbhaRkey629OsZ
 61TL/8Zjp3YPV2bTcuTPDEBRPi9INc9UffzQalq677ffzLbYMvQZglUA9Aa1TZsE0bkB
 gqZA==
X-Gm-Message-State: AOAM531vXhp7oDBcpgA5ftOxCTmpphe4aJrakrOsa17EA8HiLr4MU8ub
 AkhnVDzWNwfhEu/yX2wnLnUL4Rh07TE=
X-Google-Smtp-Source: ABdhPJxw+wMy5P1ZQfwNeBbQoeaFyc7lv9XiHtXRAEhGQoGlYoE1/+D9087VqBkRwa+Ma+7UJ9kz8w==
X-Received: by 2002:a5d:6d8e:: with SMTP id l14mr9803986wrs.196.1633283888347; 
 Sun, 03 Oct 2021 10:58:08 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 k18sm11933999wrh.68.2021.10.03.10.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 10:58:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] target/mips: Use tcg_constant_i32() in gen_msa_3rf()
Date: Sun,  3 Oct 2021 19:57:40 +0200
Message-Id: <20211003175743.3738710-6-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003175743.3738710-1-f4bug@amsat.org>
References: <20211003175743.3738710-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Avoid using a TCG temporary by moving Data Format to the constant pool.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/msa_translate.c | 23 ++++++++++++++---------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/target/mips/tcg/msa_translate.c b/target/mips/tcg/msa_translate.c
index bbe9146513a..e107cad57ee 100644
--- a/target/mips/tcg/msa_translate.c
+++ b/target/mips/tcg/msa_translate.c
@@ -1790,10 +1790,22 @@ static void gen_msa_3rf(DisasContext *ctx)
     TCGv_i32 twd = tcg_const_i32(wd);
     TCGv_i32 tws = tcg_const_i32(ws);
     TCGv_i32 twt = tcg_const_i32(wt);
-    TCGv_i32 tdf = tcg_temp_new_i32();
+    TCGv_i32 tdf;
 
     /* adjust df value for floating-point instruction */
-    tcg_gen_movi_i32(tdf, df + 2);
+    switch (MASK_MSA_3RF(ctx->opcode)) {
+    case OPC_MUL_Q_df:
+    case OPC_MADD_Q_df:
+    case OPC_MSUB_Q_df:
+    case OPC_MULR_Q_df:
+    case OPC_MADDR_Q_df:
+    case OPC_MSUBR_Q_df:
+        tdf = tcg_constant_i32(df + 1);
+        break;
+    default:
+        tdf = tcg_constant_i32(df + 2);
+        break;
+    }
 
     switch (MASK_MSA_3RF(ctx->opcode)) {
     case OPC_FCAF_df:
@@ -1836,7 +1848,6 @@ static void gen_msa_3rf(DisasContext *ctx)
         gen_helper_msa_fmadd_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MUL_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_mul_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FCULT_df:
@@ -1846,14 +1857,12 @@ static void gen_msa_3rf(DisasContext *ctx)
         gen_helper_msa_fmsub_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MADD_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_madd_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FCLE_df:
         gen_helper_msa_fcle_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MSUB_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_msub_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FCULE_df:
@@ -1896,7 +1905,6 @@ static void gen_msa_3rf(DisasContext *ctx)
         gen_helper_msa_fmin_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MULR_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_mulr_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FSULT_df:
@@ -1906,7 +1914,6 @@ static void gen_msa_3rf(DisasContext *ctx)
         gen_helper_msa_fmin_a_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MADDR_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_maddr_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FSLE_df:
@@ -1916,7 +1923,6 @@ static void gen_msa_3rf(DisasContext *ctx)
         gen_helper_msa_fmax_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_MSUBR_Q_df:
-        tcg_gen_movi_i32(tdf, df + 1);
         gen_helper_msa_msubr_q_df(cpu_env, tdf, twd, tws, twt);
         break;
     case OPC_FSULE_df:
@@ -1934,7 +1940,6 @@ static void gen_msa_3rf(DisasContext *ctx)
     tcg_temp_free_i32(twd);
     tcg_temp_free_i32(tws);
     tcg_temp_free_i32(twt);
-    tcg_temp_free_i32(tdf);
 }
 
 static void gen_msa_2r(DisasContext *ctx)
-- 
2.31.1


