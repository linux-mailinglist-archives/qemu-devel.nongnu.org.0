Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B414769FF72
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 00:28:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUyWf-0000V5-HZ; Wed, 22 Feb 2023 18:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWW-0000Ug-Di
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:44 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUyWU-0005M4-SR
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 18:27:44 -0500
Received: by mail-pj1-x1032.google.com with SMTP id x34so7425241pjj.0
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 15:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nOjB7Oa3s7/QHz69KU/odzNJz8JnUW0khbG4X3to11I=;
 b=Bq5QV1d8qvERu5zCl5pO3jOSLJAzYXcNociJzIiTcHbEgiB3EKctECfZBSskDz/0Yv
 pQnDj0+XSFskUPCm1GZ6j1kS46OVJjoCompM05YYhybkWCRXQviqbshiGcLpgkHR2cmu
 UW4kWNnnO2a9c9csLKcxt94DDNHqcvCwc/8bTNqjJkKwSqLQ1k3H4TpHcYEiDjurp1eP
 2lmVA7NnaPRsApngqYPrDoSLQqteNK/97Vlnq+xiVBxwOJdvmF8vGCVmwrj0MUcWDYq/
 Gxy0/ynW3ZympevH4jnFcmg5fWtBfct+Kitn0lVIFnq1nvBmZk8L/Fk12tC6snqN1gGC
 rxhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nOjB7Oa3s7/QHz69KU/odzNJz8JnUW0khbG4X3to11I=;
 b=7cpUZQzQI2osP/bjVf66xFNBxpWzsUDJBUr2mE8QVy+Gs/PWM+utczaKYZpTzurCFW
 MsqFGFF+yHkV+rqr3cwqVoBDRyeCPf9IzadYFnnvg8dunevLKU6196YmjDhKWXGIQD4v
 XwF7tmOXeSSEh+dSXqtghoane/b9gYR+OV+/19xEFfpfYLUNCDar1kLvzCQd76gsX+ca
 ktnq41geI+LUCuttc/lrg5OwPXAcHII3MOuD9+6C3WzKFMO1OCP6TrDo5v6Yq0K/I44w
 QQWgJCm5EFMeucp8hSvTHuV2iX1HyypAGmWLMqvADXViZbPt6Wc5l2p55uI4XNuIuIsU
 jsrA==
X-Gm-Message-State: AO0yUKVv4pgPcDvKjhF6sHynOzd1lcdC2byBkL6Yv0+BFI0hljyXFqGi
 g2VDCCrWkiebN+yiJfAz+R6HlhcgnVXH9jDdL7w=
X-Google-Smtp-Source: AK7set8KLcLF8OHwhRbQpl3r6Pd1ylBsucoIb2Pf0l0CwHlKd1a/AYRtfWaTd6xIkKwZdlVPtMMdaw==
X-Received: by 2002:a17:90b:1a85:b0:237:35f9:655c with SMTP id
 ng5-20020a17090b1a8500b0023735f9655cmr5928552pjb.36.1677108461556; 
 Wed, 22 Feb 2023 15:27:41 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 s16-20020a17090ad49000b00234e6d2de3dsm5008918pju.11.2023.02.22.15.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 15:27:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 17/28] target/arm: Don't use tcg_temp_local_new_*
Date: Wed, 22 Feb 2023 13:27:04 -1000
Message-Id: <20230222232715.15034-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230222232715.15034-1-richard.henderson@linaro.org>
References: <20230222232715.15034-1-richard.henderson@linaro.org>
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


