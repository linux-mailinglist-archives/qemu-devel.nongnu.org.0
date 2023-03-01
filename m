Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F096A6632
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 04:05:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXCj2-000541-HC; Tue, 28 Feb 2023 22:01:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCib-0002Y4-EQ
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:25 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pXCiQ-0004K6-3J
 for qemu-devel@nongnu.org; Tue, 28 Feb 2023 22:01:15 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so11271898pjg.4
 for <qemu-devel@nongnu.org>; Tue, 28 Feb 2023 19:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xGY7q/yPLddMoy7AH1uiIntBQu8ixwcYrHQKBSt99aU=;
 b=m1wIw7VPMmEss7ajCIbC+IxgQo5sO3PhFwZclqvByaOf4I3MGfXB1LnLJVFIQ7eQHx
 jtIyA1+kBa0y/gh3oZGLDnYwKNVoTnV7fHiZ9P58qf0ekhYhSb46l2YbTErci0wv6inB
 Sw5/fK7W//Xy6cftyKoPEjElk2fRCkmxiZBNO76Yn3ph1lmO0SnkD2YHrDISze6+YoDm
 SKx6tCBDR1ncrvycvQQezcogSl2QQHxpz6d08JxOl6lA4WLZy+pF0J1axQ1sPbP73KfV
 gg/oIC5fBRpw9Iip7j37qKymduMMCy3PFoyoaES9E7tww7RSC1tF58CmuE5L3Rf3L4bZ
 ifZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xGY7q/yPLddMoy7AH1uiIntBQu8ixwcYrHQKBSt99aU=;
 b=NfIDPQhasA77yPlTLA06b7/AAPxYx7ZloKgsW3MHNYH8TZJwyC8NPJrtLifx1dDcjs
 KrMxORaQdN0FOcHI8DZs7ppmYeHHu3FjMs/MVh1x4OOQnhEX95DdMwyOFUfke0LURzRa
 htaYE9jGb2IOQeEjeZrT//+j+CIqyuapfgt9W+ZWpO8mHVyUzXQsoXWEFaKxiqeQSKU+
 s957/Ara4DXjmeDnya0fOPvT1FnEGxjfxKNhdJNKmj1hd1P3e3swFC7wj7CacM31tIod
 MA9g/siI7StfHINFhccSTUF5fOd8ndDMvrduHCVezyGqxWT/ksYxEjbsOf6RqL9b8u/k
 M4AQ==
X-Gm-Message-State: AO0yUKXy21TMf63iyuFtbyZ6br3e7pB8/vAOW+tfZpbhfXrS/6LnekEo
 DQ9Zadmi4HI1jqpKgF7Ie1wHmRftl/dTzkQ//70=
X-Google-Smtp-Source: AK7set/e3IqAQ78Z0rY67nCCTt6AdSTE7JBl4JGl7kxeD1gBMR95VoKcz3pOEmFgjf4mObR6XgbLEQ==
X-Received: by 2002:a17:902:c406:b0:19e:2631:7bfd with SMTP id
 k6-20020a170902c40600b0019e26317bfdmr6485234plk.45.1677639672807; 
 Tue, 28 Feb 2023 19:01:12 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 r11-20020a170902be0b00b0019aca830869sm7181444pls.238.2023.02.28.19.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Feb 2023 19:01:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 51/62] target/arm: Don't use tcg_temp_local_new_*
Date: Tue, 28 Feb 2023 16:56:32 -1000
Message-Id: <20230301025643.1227244-52-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230301025643.1227244-1-richard.henderson@linaro.org>
References: <20230301025643.1227244-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 target/arm/tcg/translate-sve.c | 6 +++---
 target/arm/tcg/translate.c     | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 02150d93e8..718a5bce1b 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
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
 
diff --git a/target/arm/tcg/translate.c b/target/arm/tcg/translate.c
index 63a1c8dd4f..f042069dc2 100644
--- a/target/arm/tcg/translate.c
+++ b/target/arm/tcg/translate.c
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


