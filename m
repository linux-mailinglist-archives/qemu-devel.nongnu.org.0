Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49FD033A0C7
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Mar 2021 20:55:06 +0100 (CET)
Received: from localhost ([::1]:44444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLALp-00049C-6e
	for lists+qemu-devel@lfdr.de; Sat, 13 Mar 2021 14:55:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAH4-0000At-PM
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:15 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:39911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lLAH2-0007QB-QA
 for qemu-devel@nongnu.org; Sat, 13 Mar 2021 14:50:10 -0500
Received: by mail-wr1-x432.google.com with SMTP id e18so3612991wrt.6
 for <qemu-devel@nongnu.org>; Sat, 13 Mar 2021 11:50:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dJN4s/QBRDf82xfd1MF/HucGEm4ujocGtjrEvCQHbMw=;
 b=gAhE3tx1POQ3OoeOFNygvXYvWClFEd/fefUJKUquXE+lAJtBabNBf1OPhcgLdlfw2Q
 UPftBL5i9XmJ0ZOkXGnLvTb0SGjA6KTalb57M3L3RzC/IWa45x7BN5WAghH8WLwQcAkf
 c6IefHoOCuxxUixcmlqNf6zEqNpJDoY5SwPVZP/Gj0CfIUS9zKRo7plhhTb0Ks4PCMMm
 aE5QmdT+Lj9WlSyGzX6yFabj1xrLFA17PVnAU8iRxyoypEXA/JJem6SOMRUPtSXP3ZgM
 b8VlnoguamzqJNsimVXmh0zIuTBLbm5UrDa2raG7E+QwQzApz8wIpfo7Z9o+zoEAaOms
 ZSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=dJN4s/QBRDf82xfd1MF/HucGEm4ujocGtjrEvCQHbMw=;
 b=OQjvixRVlRzxMdV1JiqcKFTIlenl7Ri9UJ0cA+bj3AJwoQUKRcnilivqPAFJvH8C0Z
 1pFM1p27/+e8CHvoG3py+478YhLxntPHuMVZhYfz4tnsWAbFo1bLqK89tJf7iGjmt5tT
 3AzARnKcco76cu75Vylu4/Wn2JkSFx8RurzKYS/44uDUvKNJWWdj3WJwC+EWkmz0g8yU
 QiaAGyUkh/67ec/yMh0ZJRPy5fE49h4qfEKwg4Oe9KV7OFx6oGw9IndlhZne4xixnSjz
 w99DxxEQ3w5WCr/E0JLJ4NwrbMAMiZSzSAOswRYt2Zu+JzKyb7SWLN/YvtcKJJugL0ii
 i3/A==
X-Gm-Message-State: AOAM530MEqLZOJwdIhEuEmSxSLP37LSVwGsaMjaSPTFQus/A6R0Jag2S
 bgnH/zA+LyOFzpegpFuPEl22aX5A7hCmyQ==
X-Google-Smtp-Source: ABdhPJwtHrLJ6hyr7BojDEHEzUchrWi4k1M3DmrDsB6bPlLq+4GQs/PZhRzybflJ8BoaRvy28AQb7Q==
X-Received: by 2002:adf:de92:: with SMTP id w18mr19877087wrl.217.1615665007195; 
 Sat, 13 Mar 2021 11:50:07 -0800 (PST)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id f22sm7274974wmc.33.2021.03.13.11.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Mar 2021 11:50:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PULL 19/27] target/mips: Use gen_load_gpr[_hi]() when possible
Date: Sat, 13 Mar 2021 20:48:21 +0100
Message-Id: <20210313194829.2193621-20-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210313194829.2193621-1-f4bug@amsat.org>
References: <20210313194829.2193621-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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
 Richard Henderson <richard.henderson@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use gen_load_gpr[_hi]() instead of open coding it.

Patch generated using the following spatch script:

  @gen_load_gpr@
  identifier reg_idx;
  expression tcg_reg;
  @@
  -if (reg_idx == 0) {
  -    tcg_gen_movi_tl(tcg_reg, 0);
  -} else {
  -    tcg_gen_mov_tl(tcg_reg, cpu_gpr[reg_idx]);
  -}
  +gen_load_gpr(tcg_reg, reg_idx);

  @gen_load_gpr_hi@
  identifier reg_idx;
  expression tcg_reg;
  @@
  -if (reg_idx == 0) {
  -    tcg_gen_movi_i64(tcg_reg, 0);
  -} else {
  -    tcg_gen_mov_i64(tcg_reg, cpu_gpr_hi[reg_idx]);
  -}
  +gen_load_gpr_hi(tcg_reg, reg_idx);

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210308131604.460693-1-f4bug@amsat.org>
---
 target/mips/translate.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 92dcd2a54be..d1335b9f9f8 100644
--- a/target/mips/translate.c
+++ b/target/mips/translate.c
@@ -10460,11 +10460,7 @@ static void gen_movci(DisasContext *ctx, int rd, int rs, int cc, int tf)
     tcg_gen_andi_i32(t0, fpu_fcr31, 1 << get_fp_bit(cc));
     tcg_gen_brcondi_i32(cond, t0, 0, l1);
     tcg_temp_free_i32(t0);
-    if (rs == 0) {
-        tcg_gen_movi_tl(cpu_gpr[rd], 0);
-    } else {
-        tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rs]);
-    }
+    gen_load_gpr(cpu_gpr[rd], rs);
     gen_set_label(l1);
 }
 
@@ -14794,24 +14790,15 @@ static void gen_pool16c_insn(DisasContext *ctx)
 static inline void gen_movep(DisasContext *ctx, int enc_dest, int enc_rt,
                              int enc_rs)
 {
-    int rd, rs, re, rt;
+    int rd, re;
     static const int rd_enc[] = { 5, 5, 6, 4, 4, 4, 4, 4 };
     static const int re_enc[] = { 6, 7, 7, 21, 22, 5, 6, 7 };
     static const int rs_rt_enc[] = { 0, 17, 2, 3, 16, 18, 19, 20 };
+
     rd = rd_enc[enc_dest];
     re = re_enc[enc_dest];
-    rs = rs_rt_enc[enc_rs];
-    rt = rs_rt_enc[enc_rt];
-    if (rs) {
-        tcg_gen_mov_tl(cpu_gpr[rd], cpu_gpr[rs]);
-    } else {
-        tcg_gen_movi_tl(cpu_gpr[rd], 0);
-    }
-    if (rt) {
-        tcg_gen_mov_tl(cpu_gpr[re], cpu_gpr[rt]);
-    } else {
-        tcg_gen_movi_tl(cpu_gpr[re], 0);
-    }
+    gen_load_gpr(cpu_gpr[rd], rs_rt_enc[enc_rs]);
+    gen_load_gpr(cpu_gpr[re], rs_rt_enc[enc_rt]);
 }
 
 static void gen_pool16c_r6_insn(DisasContext *ctx)
@@ -24229,11 +24216,7 @@ static void gen_mmi_pcpyud(DisasContext *ctx)
     if (rd == 0) {
         /* nop */
     } else {
-        if (rs == 0) {
-            tcg_gen_movi_i64(cpu_gpr[rd], 0);
-        } else {
-            tcg_gen_mov_i64(cpu_gpr[rd], cpu_gpr_hi[rs]);
-        }
+        gen_load_gpr_hi(cpu_gpr[rd], rs);
         if (rt == 0) {
             tcg_gen_movi_i64(cpu_gpr_hi[rd], 0);
         } else {
-- 
2.26.2


