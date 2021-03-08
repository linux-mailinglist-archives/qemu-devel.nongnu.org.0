Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84141331056
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 15:05:46 +0100 (CET)
Received: from localhost ([::1]:50356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJGW1-0006nR-Eh
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 09:05:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJFk6-0002ZQ-IB
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:16:14 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:39752)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lJFk2-00031w-5h
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 08:16:13 -0500
Received: by mail-ej1-x62a.google.com with SMTP id p7so8881250eju.6
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 05:16:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5dXYvOToBh/C14fhRk4mzy7G6kcw3Nk7ptzwZz1U4kA=;
 b=ttx2KpEoAUH76/RRf3KNY42VZxOh6v29ZfGTBDrnTEZv1FRl3EF8Ep0LBGKIBy6Mag
 HbqdOTU7zhZZUuKpZmM4A00WJBDebiCwjDSvtHzjxKTtdgM9C3fFQ0jlQyu2tH/H20kx
 MLhI7oRoM4tg0IqBj9Wwv5R1dABZII7Q+mC6WILP/dlSFEXvgeXbGyJTiLAsYBCTTN4t
 u1m6NcAEqHV0uIMgA5FxeTIp7bOBe3JHTHkwcSgr00gHFIi+pDxaHZDUPLeb78xR42qN
 i4T0kadV80MDZPc2TPjkU225hPrgKIH46Es6uQrSoAYmmOHU5wMYBzEdMkmEmWWlwkGw
 iDkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=5dXYvOToBh/C14fhRk4mzy7G6kcw3Nk7ptzwZz1U4kA=;
 b=nxAOlhh1JMeOJRrPP+IPoZZmfei9LPXMos4dH1kwHvgzCFX+eKJ35jcV/17OrfkeMu
 oTszu8lVXagRIx2XiJmHVm8OwUvvqkeV9czuzkGv0pM1qMOIquODazyUDvLqlrBwbsfY
 mqqev89uAX3lk9A5vcFLnbsjk4PDVdPxdM2GeWNw32R835TdeIhmatnxIKTs87EWSpzv
 7OnY2vUVZUnlLSKfpJy1Q8ZF5/qQ7tBRC8Pqj13MMeAzCj4Xd+EGUTWDkl0xSQL5paRa
 Bgjc1Ql1FYG9vUow2LJYMNAW1b1L/44btRLRqwVtYH6CPNO30pAgvcIE0IXFWOvGKJMo
 OlNg==
X-Gm-Message-State: AOAM532u73J5XGajJCk6Yi0bj1RD+M/MLLQl+TPiQ0U75M9kqFrEtdes
 /WAQF4TBGRh/s0i2YVyLSgmrFjqvq78=
X-Google-Smtp-Source: ABdhPJwxIc5n2yFPZjrtmaND6V8kYMSszuwstst94BKdfXnqGemuSypzVsKlGea8PekxyIdzqrIbYA==
X-Received: by 2002:a17:906:5797:: with SMTP id
 k23mr15344811ejq.515.1615209366539; 
 Mon, 08 Mar 2021 05:16:06 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id m7sm6646349ejk.52.2021.03.08.05.16.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 05:16:06 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] target/mips: Use gen_load_gpr[_hi]() when possible
Date: Mon,  8 Mar 2021 14:16:04 +0100
Message-Id: <20210308131604.460693-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x62a.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
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
---
 target/mips/translate.c | 29 ++++++-----------------------
 1 file changed, 6 insertions(+), 23 deletions(-)

diff --git a/target/mips/translate.c b/target/mips/translate.c
index 64e0baf11b7..9b08785f2b8 100644
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


