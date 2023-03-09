Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDD66B2E2F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:09:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMX3-0004sP-Iu; Thu, 09 Mar 2023 15:06:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWz-0004ji-BV
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:29 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMWx-0000p2-QV
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:06:29 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 y15-20020a17090aa40f00b00237ad8ee3a0so3012898pjp.2
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+dzaTq4Hk7e5zysi1fCZtiBija1HdA1vnsnzcrh5iSw=;
 b=qWWZzLzyjdTq6u+okw+af900gxC2+RqOC5yg1P+E84joHyZYpbrBp4P1gtACq+7wgx
 gTFJSMpF7CcLLnbiBYrnJl3MwZ6zdUKT7a81aVpcxlq52KMIhE9hEGjFqkNjEsZjqqTx
 qjJ4TQnt86cKvs1PHydkcoyncWVhNrSFMzAKJvEhSBI4Ah//Bz9rbNHASd+LQ0l52oSm
 YIXD6SwOiDTGXsmMPIwGM0aDMZa9HIVmFt0B82eidlI+3GQ8OklOv06BluZXoU8JCDwF
 yk/bR4TftxRjBkzzQgdwLRUV+PN4uwezIcRiHgv8vtFnMVAgMYzpCkU0Zb4xAdcTT8+O
 qeoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392386;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+dzaTq4Hk7e5zysi1fCZtiBija1HdA1vnsnzcrh5iSw=;
 b=UJ0zqNvpQOHlNn8cmieb5juEhSoNq5rNcZsTjqiMlkhGASxBhdehwplcDGqjMhvRmp
 G6gi60fE2A57DlXOtTeuRBX5zSQLNXsNKVZZRL9l/xlWz9VX9rQCe+5Eg3s80rIxldPM
 QxqMvvs/EPm5uZAt/dtflNXtrry2r7jEr+LDtl/LqRUqLbz6xncY2HtqOFkHmenJOW9A
 xx5IFWnfA6TTNjPyLxdyqGJ8V3vvy0p/7jxZnOa34SCutvxZOyj6YR/H/7B+UDSS4W4K
 dc8I67qG3HkMWjRLtuf/SUhEHpie7gkS/CwneHxgler3ADnk/GKwNJ+IXhYddOVr9URp
 oeKw==
X-Gm-Message-State: AO0yUKXQ+e7NDgviAukll1ot2HLsOUBrP2ZW80pD8bcNJahwcCvdzyck
 GcIObkBWURIbYvEUyDcWk8NKT5NOkP6+Zne5uDI=
X-Google-Smtp-Source: AK7set+M6olQqm1AINQRzXt5Zik1+BsH1N/I1stuqum8KILER2ru493uEw8faUemls8XMoJp4zvEgg==
X-Received: by 2002:a17:90b:38c7:b0:234:b03:5a70 with SMTP id
 nn7-20020a17090b38c700b002340b035a70mr23919769pjb.35.1678392386427; 
 Thu, 09 Mar 2023 12:06:26 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 t20-20020a17090ad15400b002340f58e19bsm308083pjw.45.2023.03.09.12.06.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:06:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 39/91] target/avr: Avoid use of tcg_const_i32 in SBIC, SBIS
Date: Thu,  9 Mar 2023 12:04:58 -0800
Message-Id: <20230309200550.3878088-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The use of separate data/port variables is existing
practice elsewhere, e.g. SBI, CBI.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index b9506a8d86..190d0c3f97 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -1288,12 +1288,13 @@ static bool trans_SBRS(DisasContext *ctx, arg_SBRS *a)
  */
 static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
 {
-    TCGv temp = tcg_const_i32(a->reg);
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_constant_i32(a->reg);
 
-    gen_helper_inb(temp, cpu_env, temp);
-    tcg_gen_andi_tl(temp, temp, 1 << a->bit);
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_andi_tl(data, data, 1 << a->bit);
     ctx->skip_cond = TCG_COND_EQ;
-    ctx->skip_var0 = temp;
+    ctx->skip_var0 = data;
 
     return true;
 }
@@ -1305,12 +1306,13 @@ static bool trans_SBIC(DisasContext *ctx, arg_SBIC *a)
  */
 static bool trans_SBIS(DisasContext *ctx, arg_SBIS *a)
 {
-    TCGv temp = tcg_const_i32(a->reg);
+    TCGv data = tcg_temp_new_i32();
+    TCGv port = tcg_constant_i32(a->reg);
 
-    gen_helper_inb(temp, cpu_env, temp);
-    tcg_gen_andi_tl(temp, temp, 1 << a->bit);
+    gen_helper_inb(data, cpu_env, port);
+    tcg_gen_andi_tl(data, data, 1 << a->bit);
     ctx->skip_cond = TCG_COND_NE;
-    ctx->skip_var0 = temp;
+    ctx->skip_var0 = data;
 
     return true;
 }
-- 
2.34.1


