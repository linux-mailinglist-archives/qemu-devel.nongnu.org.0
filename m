Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC73A6A2809
	for <lists+qemu-devel@lfdr.de>; Sat, 25 Feb 2023 10:02:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqQK-0002F3-9w; Sat, 25 Feb 2023 04:00:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPn-0000cE-Am
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:23 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqPk-00055l-4p
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:00:21 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so684568pjg.4
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOjB7Oa3s7/QHz69KU/odzNJz8JnUW0khbG4X3to11I=;
 b=um6gzMSQMiO40ZzPHH6gCRrgy7L+DP/WuKBQE4Jo/B3Ww1gDdc93beDn9XrgTj9NlP
 xiAzbK+yRthFzTDrqvshLEYjg9eXiN29Zru6CfTuSpVl2arWtq5WANQTXRtg0U/P87W2
 QSG8WbL3STvVtKAF53DiswxzNUXFGVdvcfV0ebQIRZfEoaX15oTrV/tjrg3ilNAN2luC
 /8FYOb1aJSiYZ1mR/FT51zdYL8rR1Pgg0RfF++lmXWRmxMG3X/wEp+meMpjsT6Eeu6kd
 zfT6DppuhL65fqU4mrDH5FbKAjXPQMS4nY4gMHQiSKM4HgQ3FynG2PPXmXCHCiLloVZt
 qDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOjB7Oa3s7/QHz69KU/odzNJz8JnUW0khbG4X3to11I=;
 b=BJ5gqM1CrVBwGRjC68K4Zl4OcBjsJ7YL6iV0vQrcy/DIJoDq13J3oiXmleZ2eXodIr
 tbdo45TcuInM4MhYLmyemTIJRPsoSwMMHrWJuyVo5t/7HCj3H2AbSa7o/afFcUyc3HZJ
 j86zaTmhyYfoRwkk58ws779xlJPejgyM/0UIVg9f9t10wYfgZ+DG5QSRNnS6Zqp1MCdW
 1WgpKNUKO4k4Kkag9tHgbiXUptw42SGXlfv2d8YaJQpC2Vblx66b70HZGGqakwC39rsH
 QqUu7DUiVt6aRtRTq5n5eb+UA5SoblbjVJ54UgO/hb7zLe1ravZS7AMd5VoCSG9qYQg5
 K0YQ==
X-Gm-Message-State: AO0yUKXtvRKKAd2xtutPbbmokAw2P9+BUA2w2D553VH+opKR2bmoBhyl
 3IvvAneVfW4wi+NVorRh8cWgC0RntRBqZYU/qtI=
X-Google-Smtp-Source: AK7set9QbldsprxFseHFyoeofmfb6qO5g+0TEAIBY8Dy2OPHJdKx7YYca2aNZJ0tNO+BnrQxpf7hpQ==
X-Received: by 2002:a05:6a20:a692:b0:cc:ab23:aa83 with SMTP id
 ba18-20020a056a20a69200b000ccab23aa83mr2154429pzb.53.1677315618740; 
 Sat, 25 Feb 2023 01:00:18 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a639251000000b00502ecb91940sm715546pgn.55.2023.02.25.01.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:00:18 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 20/30] target/arm: Don't use tcg_temp_local_new_*
Date: Fri, 24 Feb 2023 22:59:35 -1000
Message-Id: <20230225085945.1798188-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225085945.1798188-1-richard.henderson@linaro.org>
References: <20230225085945.1798188-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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

Since tcg_temp_new_* is now identical, use those.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 6 +++---
 target/arm/translate.c     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 02150d93e8..718a5bce1b 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -2694,7 +2694,7 @@ static bool do_clast_vector(DisasContext *s, arg_rprr_esz *a, bool before)
         return true;
     }
 
-    last = tcg_temp_local_new_i32();
+    last = tcg_temp_new_i32();
     over = gen_new_label();
 
     find_last_active(s, last, esz, a->pg);
@@ -4342,7 +4342,7 @@ void gen_sve_ldr(DisasContext *s, TCGv_ptr base, int vofs,
         tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_local_ptr(0);
+        TCGv_ptr tp, i = tcg_const_ptr(0);
 
         gen_set_label(loop);
 
@@ -4427,7 +4427,7 @@ void gen_sve_str(DisasContext *s, TCGv_ptr base, int vofs,
         tcg_temp_free_i64(t0);
     } else {
         TCGLabel *loop = gen_new_label();
-        TCGv_ptr tp, i = tcg_const_local_ptr(0);
+        TCGv_ptr tp, i = tcg_const_ptr(0);
 
         gen_set_label(loop);
 
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 92955d505c..9c8e1ac04c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -7136,7 +7136,7 @@ static bool op_strex(DisasContext *s, arg_STREX *a, MemOp mop, bool rel)
         tcg_gen_mb(TCG_MO_ALL | TCG_BAR_STRL);
     }
 
-    addr = tcg_temp_local_new_i32();
+    addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     tcg_gen_addi_i32(addr, addr, a->imm);
 
@@ -7289,7 +7289,7 @@ static bool op_ldrex(DisasContext *s, arg_LDREX *a, MemOp mop, bool acq)
         return true;
     }
 
-    addr = tcg_temp_local_new_i32();
+    addr = tcg_temp_new_i32();
     load_reg_var(s, addr, a->rn);
     tcg_gen_addi_i32(addr, addr, a->imm);
 
@@ -8696,7 +8696,7 @@ static bool trans_LE(DisasContext *s, arg_LE *a)
          * Decrement by 1 << (4 - LTPSIZE). We need to use a TCG local
          * so that decr stays live after the brcondi.
          */
-        TCGv_i32 decr = tcg_temp_local_new_i32();
+        TCGv_i32 decr = tcg_temp_new_i32();
         TCGv_i32 ltpsize = load_cpu_field(v7m.ltpsize);
         tcg_gen_sub_i32(decr, tcg_constant_i32(4), ltpsize);
         tcg_gen_shl_i32(decr, tcg_constant_i32(1), decr);
-- 
2.34.1


