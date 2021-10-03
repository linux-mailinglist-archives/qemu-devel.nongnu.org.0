Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EEF142021A
	for <lists+qemu-devel@lfdr.de>; Sun,  3 Oct 2021 16:47:42 +0200 (CEST)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mX2mB-0004Jt-8V
	for lists+qemu-devel@lfdr.de; Sun, 03 Oct 2021 10:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2e9-0004Fr-88; Sun, 03 Oct 2021 10:39:21 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:36427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mX2e7-0006nH-KM; Sun, 03 Oct 2021 10:39:20 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so16695110wmq.1; 
 Sun, 03 Oct 2021 07:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sX5SHn+t1hUwUCEa3NcF3T73v997Fa0S7tR6YYfqS+4=;
 b=qwZNrFbibhpBh+oyOBL24w3nguIZMcDRw9CGn4M+Ga9Rv75N7p/8ZRuDtimr4P9xZQ
 fNZu3MFVWvPbj9XJpiP4UZqGKeH/bm3gH0BnTXkAhlZ4wGz0c/v3J941hES/LhzRoL8i
 1Oaoc+4PSuA3Zlt8hnY0ad1OTcSoonBabQgicAsL8m1aP0ugYIr8LmwdQaftErM4DaAv
 BfWzJiqTr4lAei97CRxFWiT6Hkq8j6Wapn+VlU4E7pp9aaGCFUOZYfoPCzsWr8BGHa8T
 aJmw1vF5MzQ+TW2EmTK7xqRIzmQDmipKB13IX4FUfDyFebWK2jcXGGXDL9XKZW+fzRRj
 Feqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=sX5SHn+t1hUwUCEa3NcF3T73v997Fa0S7tR6YYfqS+4=;
 b=Tnz1btrK/oUXFleuFfNrYo9tyFFYQQz0PMI5shKu1fDWAnaGDdkqJK2JPbzBH6mdWv
 lIM4sOfw9Pbr8LCNFn52BuwxR3tXb8Uxs9A3fcoggw4qWG1k5ewkDH5w8ZKERE1wYPjb
 YrfpPsCGJKhR+BGIIEvRxj86bI2lBTyDm+eDOo46gL5LosJykpE34pkrUKatoKU+dWDI
 aY0CpkZw8ZdYEVIHS70rG7TWRKAjl050QFT6TZOqYZv7QZ/KPHp43geyGktFR1JNiRG4
 EqUTuCUey79EhKmwoNqTpTcHCNQNP/iYiZ1TglcKboNesA8Ywuef8Rp6q4BY+PwF1s75
 DXCw==
X-Gm-Message-State: AOAM533cpuMhaEkiqpQYggG5b4SBT/RQVOqSLezmC2rO1X2EoEmp8Kpd
 3WyJ7vhuQe5FmuTX3KAmt2GyNHDSqpg=
X-Google-Smtp-Source: ABdhPJzkj3ZQMjpVeD3E5uCz1dAYuHyWaCZVamc4Ml8o8VOelHYe1QnRJ5942zz6XkxMSPgIPD00Ow==
X-Received: by 2002:a05:600c:378f:: with SMTP id
 o15mr12178673wmr.89.1633271957702; 
 Sun, 03 Oct 2021 07:39:17 -0700 (PDT)
Received: from x1w.. (118.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id
 h3sm4632267wro.42.2021.10.03.07.39.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Oct 2021 07:39:17 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: Use the constant variant of store_cpu_field()
 when possible
Date: Sun,  3 Oct 2021 16:39:01 +0200
Message-Id: <20211003143901.3681356-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211003143901.3681356-1-f4bug@amsat.org>
References: <20211003143901.3681356-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When using a constant variable, we can replace the store_cpu_field()
call by store_cpu_field_constant() which avoid using TCG temporaries.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/arm/translate.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index b41e0f50dfe..77c7a3ab2ec 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -388,8 +388,7 @@ void clear_eci_state(DisasContext *s)
      * multiple insn executes.
      */
     if (s->eci) {
-        TCGv_i32 tmp = tcg_const_i32(0);
-        store_cpu_field(tmp, condexec_bits);
+        store_cpu_field_constant(0, condexec_bits);
         s->eci = 0;
     }
 }
@@ -764,9 +763,8 @@ void gen_set_condexec(DisasContext *s)
 {
     if (s->condexec_mask) {
         uint32_t val = (s->condexec_cond << 4) | (s->condexec_mask >> 1);
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, val);
-        store_cpu_field(tmp, condexec_bits);
+
+        store_cpu_field_constant(val, condexec_bits);
     }
 }
 
@@ -8386,8 +8384,6 @@ static bool trans_BL(DisasContext *s, arg_i *a)
 
 static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
 {
-    TCGv_i32 tmp;
-
     /*
      * BLX <imm> would be useless on M-profile; the encoding space
      * is used for other insns from v8.1M onward, and UNDEFs before that.
@@ -8401,8 +8397,7 @@ static bool trans_BLX_i(DisasContext *s, arg_BLX_i *a)
         return false;
     }
     tcg_gen_movi_i32(cpu_R[14], s->base.pc_next | s->thumb);
-    tmp = tcg_const_i32(!s->thumb);
-    store_cpu_field(tmp, thumb);
+    store_cpu_field_constant(!s->thumb, thumb);
     gen_jmp(s, (read_pc(s) & ~3) + a->imm);
     return true;
 }
@@ -8701,7 +8696,6 @@ static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
      * doesn't cache branch information, all we need to do is reset
      * FPSCR.LTPSIZE to 4.
      */
-    TCGv_i32 ltpsize;
 
     if (!dc_isar_feature(aa32_lob, s) ||
         !dc_isar_feature(aa32_mve, s)) {
@@ -8712,8 +8706,7 @@ static bool trans_LCTP(DisasContext *s, arg_LCTP *a)
         return true;
     }
 
-    ltpsize = tcg_const_i32(4);
-    store_cpu_field(ltpsize, v7m.ltpsize);
+    store_cpu_field_constant(4, v7m.ltpsize);
     return true;
 }
 
@@ -9511,9 +9504,7 @@ static void arm_tr_tb_start(DisasContextBase *dcbase, CPUState *cpu)
     /* Reset the conditional execution bits immediately. This avoids
        complications trying to do it at the end of the block.  */
     if (dc->condexec_mask || dc->condexec_cond) {
-        TCGv_i32 tmp = tcg_temp_new_i32();
-        tcg_gen_movi_i32(tmp, 0);
-        store_cpu_field(tmp, condexec_bits);
+        store_cpu_field_constant(0, condexec_bits);
     }
 }
 
-- 
2.31.1


