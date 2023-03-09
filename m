Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BF66B2E6B
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 21:17:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paMad-0005iX-1k; Thu, 09 Mar 2023 15:10:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaL-00059P-CE
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:57 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1paMaJ-0001c2-Lv
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 15:09:57 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 u3-20020a17090a450300b00239db6d7d47so2999438pjg.4
 for <qemu-devel@nongnu.org>; Thu, 09 Mar 2023 12:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678392594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1cudVQ02HiPN679lxe7GeIU6QCBZXBjPIrdLqimdu9w=;
 b=N6Aqxu+h7XKma8/6yd0681tHYOS5SeR+rbi35Hz951hfhwqPpizOoutPhxOwjux7yp
 6idup3etCenvOHk9ioHYLX4tAMenKiBeTbC1G5VeXhbVY95qbeiKmvCXXWzdiBTKNodw
 OCtJXep+epbmJ3ODSNtFt4bxsjfoUwkZqJzxDO8iLLbgsqRf8QPPpK/4L94zULz/FWq0
 +5gpLJxhyNnjREIpTWlx2t482f13yALAiSkcPJAhFDTpk74Y6bzRJHSVXLQVMJgOd3hN
 Br2YbGoHutpKuuqb8yyO5nO7wdI7k+kvXeHUPM2GlIZO/TugexrgaWMcL3KtbBsM4Uvl
 9Efg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678392594;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1cudVQ02HiPN679lxe7GeIU6QCBZXBjPIrdLqimdu9w=;
 b=vij7xI14NIrBU/OjPhpnL1YEvKwBrdo9pZhwBXNQYrPtcby2VmPZO1ebn1qm6KO3g0
 Lki5SXeGpokFAYr3PEwX8ZsiyVKV20geDlmBCcCddpuwbD3JMtDNy8V4Rpsmy/woiLy/
 ssu9IPMSoWFLafQ4QA59L9tz8nm+z8nMgv8qj8znzLYCunpqI2OXWrsKFz1tdrqtHppg
 Ny0TMV0+NSvAzbcMNUx4YfDG8QrI0gkhiGxMqLrUEi5kzEcxW3X0+qRRkJIHYfiC0+RB
 8+nF+z67YNs99WzcjjF1sWidPomUfYNuknqo35bBZ7+DXDDyaYEnKjPwgOEtSvFAgWE3
 1FSw==
X-Gm-Message-State: AO0yUKVKbBWwFH/AmD3oZ1BDazKMRtQ4B3I+i/x1GyNreym+NMY9MYC9
 EketV7E1e639du2VaHcTvcQyNLnUQoBb2PrDh9k=
X-Google-Smtp-Source: AK7set+4UhsRqDxFoOQZ7kXV6VMrgBKYrs2bMBGxgwTIfRIw3lo6DS7WrFOwvkA8IttBxGKKC8txnQ==
X-Received: by 2002:a17:902:ee45:b0:19e:6c7a:481 with SMTP id
 5-20020a170902ee4500b0019e6c7a0481mr19320956plo.68.1678392594075; 
 Thu, 09 Mar 2023 12:09:54 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:bf7f:79a0:a976:bdaf])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a170902aa4200b001991e4e0bdcsm43797plr.233.2023.03.09.12.09.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Mar 2023 12:09:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL v2 70/91] target/arm: Improve arm_rmode_to_sf
Date: Thu,  9 Mar 2023 12:05:29 -0800
Message-Id: <20230309200550.3878088-71-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309200550.3878088-1-richard.henderson@linaro.org>
References: <20230309200550.3878088-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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

Use proper enumeration types for input and output.
Use a const array to perform the mapping, with an
assert that the input is valid.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h         | 12 +++++++++---
 target/arm/tcg/translate-mve.c |  2 +-
 target/arm/vfp_helper.c        | 33 ++++++++-------------------------
 3 files changed, 18 insertions(+), 29 deletions(-)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index b1ef05963f..673519a24a 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -193,16 +193,22 @@ void arm_restore_state_to_opc(CPUState *cs,
 void arm_cpu_synchronize_from_tb(CPUState *cs, const TranslationBlock *tb);
 #endif /* CONFIG_TCG */
 
-enum arm_fprounding {
+typedef enum ARMFPRounding {
     FPROUNDING_TIEEVEN,
     FPROUNDING_POSINF,
     FPROUNDING_NEGINF,
     FPROUNDING_ZERO,
     FPROUNDING_TIEAWAY,
     FPROUNDING_ODD
-};
+} ARMFPRounding;
 
-int arm_rmode_to_sf(int rmode);
+extern const FloatRoundMode arm_rmode_to_sf_map[6];
+
+static inline FloatRoundMode arm_rmode_to_sf(ARMFPRounding rmode)
+{
+    assert((unsigned)rmode < ARRAY_SIZE(arm_rmode_to_sf_map));
+    return arm_rmode_to_sf_map[rmode];
+}
 
 static inline void aarch64_save_sp(CPUARMState *env, int el)
 {
diff --git a/target/arm/tcg/translate-mve.c b/target/arm/tcg/translate-mve.c
index 798b4fddfe..9744bf3de0 100644
--- a/target/arm/tcg/translate-mve.c
+++ b/target/arm/tcg/translate-mve.c
@@ -588,7 +588,7 @@ DO_VCVT(VCVT_FS, vcvt_hs, vcvt_fs)
 DO_VCVT(VCVT_FU, vcvt_hu, vcvt_fu)
 
 static bool do_vcvt_rmode(DisasContext *s, arg_1op *a,
-                          enum arm_fprounding rmode, bool u)
+                          ARMFPRounding rmode, bool u)
 {
     /*
      * Handle VCVT fp to int with specified rounding mode.
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 90cc324f71..36906db8e0 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -1104,31 +1104,14 @@ float64 HELPER(rintd)(float64 x, void *fp_status)
 }
 
 /* Convert ARM rounding mode to softfloat */
-int arm_rmode_to_sf(int rmode)
-{
-    switch (rmode) {
-    case FPROUNDING_TIEAWAY:
-        rmode = float_round_ties_away;
-        break;
-    case FPROUNDING_ODD:
-        rmode = float_round_to_odd;
-        break;
-    case FPROUNDING_TIEEVEN:
-    default:
-        rmode = float_round_nearest_even;
-        break;
-    case FPROUNDING_POSINF:
-        rmode = float_round_up;
-        break;
-    case FPROUNDING_NEGINF:
-        rmode = float_round_down;
-        break;
-    case FPROUNDING_ZERO:
-        rmode = float_round_to_zero;
-        break;
-    }
-    return rmode;
-}
+const FloatRoundMode arm_rmode_to_sf_map[] = {
+    [FPROUNDING_TIEEVEN] = float_round_nearest_even,
+    [FPROUNDING_POSINF] = float_round_up,
+    [FPROUNDING_NEGINF] = float_round_down,
+    [FPROUNDING_ZERO] = float_round_to_zero,
+    [FPROUNDING_TIEAWAY] = float_round_ties_away,
+    [FPROUNDING_ODD] = float_round_to_odd,
+};
 
 /*
  * Implement float64 to int32_t conversion without saturation;
-- 
2.34.1


