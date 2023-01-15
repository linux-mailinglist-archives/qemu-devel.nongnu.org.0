Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D870E66B272
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 17:08:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH5Xg-0003zC-4n; Sun, 15 Jan 2023 11:07:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH5XI-0003tu-Bu
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 11:07:09 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pH5XF-0002lM-TP
 for qemu-devel@nongnu.org; Sun, 15 Jan 2023 11:07:08 -0500
Received: by mail-pf1-x436.google.com with SMTP id 127so2092730pfe.4
 for <qemu-devel@nongnu.org>; Sun, 15 Jan 2023 08:07:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XP1mndVM3IiukMxTyvVrQ+ffw9ega/+GFt5gwvN3oKI=;
 b=sj9f7iiJg+F9AHu/KHluKcdJK5UZK+qDWgcaLqEpGW9OlTbfGa9oG1YNR69uR54Ben
 g/P2O/lU3z5lOJmRi54TJTDr3h16Rba7P3I3IinfSRdqfbL/wk19QOGRzpNCXwJ/MSmL
 +Fr7b4/zAE9W7FTW7v/yyFbnB48dPEWIAUBgXirV+dKPYYDtgntnBov71N4oGDg99doq
 m3NVpx6K5MgEyqMZLzthlliSlNI/OMafVeU89To/8thYNU1xRaqNap6PiodABSbIxGWq
 p2XuvK/6YTIzcrpWBKJb6e0JsDbN3FVBMlqr3q1VXt/TUgwrLrlg8KfUfcFrwyrmPnie
 A9wQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XP1mndVM3IiukMxTyvVrQ+ffw9ega/+GFt5gwvN3oKI=;
 b=Oba7oGcA79hB/j9X7nBunHda80+z3na6XNac1+GL7OqVQ69AISg3Hud0Aisbv3sntd
 k3ksyUps8Y4HhTCPgAdopY6WrJYi9YksC62KZw4HnBo7rjuKjUtT7e1rLX4w8lXsxJON
 lDimhCjiubThc4g0zKZ2HgdoB7hoOYT/Y2bns30VWLZY+LHvI2fBUlenEwFwdo46zMIt
 rK+gsXW5fd7/BmS/E+ZwRDHxcIqi3ruHirt0Q6w0PSYhiCoOZ0gowOceoV4EiTW2FaFy
 7k8erT59nkH7H1nziRk8H+cyyeGb3e5UKiHHUaU7VvfzqXk8+VYYenc7lc3rd70KWZBx
 XQDw==
X-Gm-Message-State: AFqh2koIaObSvPd48fEWkh352BqWZ1czpNScUCC6jjzl50mr5pNBbdzu
 lGWB6iVAy7vPpJINn+y4yA/BA9GMhlrLO/t8
X-Google-Smtp-Source: AMrXdXuJqDYY75KC1VopM0e2gYbtZFi6uW2Nkbn7u2pCrKHHc8/swHv7KWVat02x/i6VCnLUp0HY8w==
X-Received: by 2002:aa7:983b:0:b0:58b:aaaa:82a9 with SMTP id
 q27-20020aa7983b000000b0058baaaa82a9mr12249097pfl.25.1673798824640; 
 Sun, 15 Jan 2023 08:07:04 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 c76-20020a624e4f000000b00589c467ed88sm11422735pfb.69.2023.01.15.08.07.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Jan 2023 08:07:04 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com, bin.meng@windriver.com,
 abdulras@google.com
Subject: [PATCH 2/2] target/riscv: Remove helper_set_rod_rounding_mode
Date: Sun, 15 Jan 2023 06:06:57 -1000
Message-Id: <20230115160657.3169274-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230115160657.3169274-1-richard.henderson@linaro.org>
References: <20230115160657.3169274-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

The only setting of RISCV_FRM_ROD is from the vector unit,
and now handled by helper_set_rounding_mode_chkfrm.
This helper is now unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/helper.h     | 1 -
 target/riscv/fpu_helper.c | 5 -----
 target/riscv/translate.c  | 4 ----
 3 files changed, 10 deletions(-)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 9792ab5086..58a30f03d6 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -4,7 +4,6 @@ DEF_HELPER_2(raise_exception, noreturn, env, i32)
 /* Floating Point - rounding mode */
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_WG, void, env, i32)
 DEF_HELPER_FLAGS_2(set_rounding_mode_chkfrm, TCG_CALL_NO_WG, void, env, i32)
-DEF_HELPER_FLAGS_1(set_rod_rounding_mode, TCG_CALL_NO_WG, void, env)
 
 /* Floating Point - fused */
 DEF_HELPER_FLAGS_4(fmadd_s, TCG_CALL_NO_RWG, i64, env, i64, i64, i64)
diff --git a/target/riscv/fpu_helper.c b/target/riscv/fpu_helper.c
index 96817df8ef..449d236df6 100644
--- a/target/riscv/fpu_helper.c
+++ b/target/riscv/fpu_helper.c
@@ -118,11 +118,6 @@ void helper_set_rounding_mode_chkfrm(CPURISCVState *env, uint32_t rm)
     set_float_rounding_mode(softrm, &env->fp_status);
 }
 
-void helper_set_rod_rounding_mode(CPURISCVState *env)
-{
-    set_float_rounding_mode(float_round_to_odd, &env->fp_status);
-}
-
 static uint64_t do_fmadd_h(CPURISCVState *env, uint64_t rs1, uint64_t rs2,
                            uint64_t rs3, int flags)
 {
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index 493c3815e1..01cc30a365 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -672,10 +672,6 @@ static void gen_set_rm(DisasContext *ctx, int rm)
     }
     ctx->frm = rm;
 
-    if (rm == RISCV_FRM_ROD) {
-        gen_helper_set_rod_rounding_mode(cpu_env);
-        return;
-    }
     if (rm == RISCV_FRM_DYN) {
         /* The helper will return only if frm valid. */
         ctx->frm_valid = true;
-- 
2.34.1


