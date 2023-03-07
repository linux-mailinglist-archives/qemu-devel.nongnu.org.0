Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 208776AF0BE
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:36:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZc9Y-0003YX-M7; Tue, 07 Mar 2023 13:35:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9W-0003X4-3b
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:10 -0500
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZc9T-0007i1-VU
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:35:09 -0500
Received: by mail-pj1-x102e.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so17418338pjg.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:35:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678214106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1cudVQ02HiPN679lxe7GeIU6QCBZXBjPIrdLqimdu9w=;
 b=hCs5dLm2yjZyYiqPFggW1DTvUd6IN0dtG9EcJAA52dItHZeb42g9NmFzd2c3y1Q8D5
 xTfCcVVYIezr0ooitXNH7BFUA9hFCiPeidMSQ+j0ugQOC7mmCA8TO2qWoa21S7uk6CTF
 R+WtqRwWAvT3QQnunWaigglikcO1ju54JXSq8dlhPiFamOP9mN5pgeFWp+HE3cZ8NIM+
 uzgNiPNXI5ZsVcezQ4ve8EELj6P3oLS4orBQaJLed8zXTupiGfaY0YUQFzryUr0njr2F
 86a39TpRa2JMyLTvuoj5g3/SfOH/+TAC6NWHYmjm+kpGJ46GdaXXGZHuYzKlrvVuBezX
 S/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678214106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1cudVQ02HiPN679lxe7GeIU6QCBZXBjPIrdLqimdu9w=;
 b=zzjcYEZfiWXLp0B3VymS2sH2kjTAsCCM+evM/tjfxQU9xqE+cQtNDlT3tP47hvpk0f
 LOQr3ZmCxYM1o4QLv4jl7kVOJr6mWGtciZE/2Dx2Xx66763CVU8q6hHGGa4EgXfkdbhk
 mpYM5bcEujFU6fpPpK+EW4PYNXSsLANE2tNznSRVcbGw+IL6qrUhnh9J4yl8C7VwzLKp
 n+wkSMQY9InZhSpQ34dnJyX2OmLGYjyXxS9rcsfTrmcSsjHrPzgJ0LTCNKVg7o1+kc66
 j+74QnjDQHygAyqYxaHW2uu8pMizD6PG6xT0+SVsQkIAzEKR55TCOorT32ctJBWOcuSN
 rzKg==
X-Gm-Message-State: AO0yUKXNaNrUviBylpFlcr/5Wrr8TnCQPq8vxWBFisYlJoYY6iIIYKp2
 +5yBvk2UG7bLIVxXk5upTu6qJ9CcoyhvpValNxo=
X-Google-Smtp-Source: AK7set/GK42aE9ERBvG26iW4YDBRufpwHGMKDpKNbS8Mw4Y3NtFEXjVtq6VdTEkKY9hK023vOOsJgg==
X-Received: by 2002:a17:90b:4c43:b0:237:5db6:22be with SMTP id
 np3-20020a17090b4c4300b002375db622bemr15729937pjb.49.1678214106647; 
 Tue, 07 Mar 2023 10:35:06 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a17090a1b0100b0022c0a05229fsm7757940pjq.41.2023.03.07.10.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:35:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 03/25] target/arm: Improve arm_rmode_to_sf
Date: Tue,  7 Mar 2023 10:34:41 -0800
Message-Id: <20230307183503.2512684-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307183503.2512684-1-richard.henderson@linaro.org>
References: <20230307183503.2512684-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102e.google.com
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


