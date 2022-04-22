Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 812D050BEE8
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 19:42:11 +0200 (CEST)
Received: from localhost ([::1]:44770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhxII-0006W7-KP
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 13:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwah-0008Vg-Sr
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:07 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:42506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nhwag-0007zs-Ap
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 12:57:07 -0400
Received: by mail-il1-x134.google.com with SMTP id r17so5413488iln.9
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 09:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yLnKk6KeXtnOdH9WAfFyAEdKebgTI3uohXWuThUdcek=;
 b=FVxODr7qSXnXdWGJfWCWCYxIjfIuryTcqYc6V/TFhtEtYBLpfATWllmH1pPZI3yw6c
 5k8ZhK7CbGGMXakwIOoSWOo9tKTu2t/wpdfjFvt54pVP1kmiDVngID+uEkiqJbRtQGpo
 lNyWzkGLr94lthCW4GHi2j90YMbxHtgRAjXXyb34ZM7qRncay3Ohkfi9l/aM1G72Nl4U
 LO+7In0NOq9a+DOEbc99fXtKbcVj00gyxFIl4PbU5HkoR70vXdCu5a1GtxplL0+rmGy4
 lY2QvA3dour9cuZOY6Aoq21XO25QX5pGs6TuC9MD8JyAFfRBO8bmsVSK+gZRNUkNoV6K
 wbAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yLnKk6KeXtnOdH9WAfFyAEdKebgTI3uohXWuThUdcek=;
 b=wpEI/ft/w7oZLKt7tl8KrNrJPEvewdWzDXMUBjIKK8dkNPOvPWk+vWNXoWW6Qpdlii
 54FzZpJq/IU7XEisBmFzbBAr6pb+HrIyVO1Vb8IFzcs/mdDNKEkcpB/7QnZD/QJEAFY1
 FfM6iD/iY0wLxGWp1hZgMRiP5v6J+Nd4eZGsMc3QTJrRXswKPj2ibOMGMhMn06+Bc45q
 meq7X7cRHjfj9S5GFXarCSGwENRyiNsTOnwskOLA05eWSKWqsx6yj9bVRWYsc1AZ9BYl
 Wqa/bbvd2mwpM0r4PfFxBX4zYGtt+k7ik4h99vPIxMNte+T9oNflqvYxMJ4FqiUbmbfm
 GKow==
X-Gm-Message-State: AOAM530PdP3IlL5I9uI+r+qDykQMhExB2VbbGznOVnt3fwNIRCCEoL27
 w9led7rpV+iGAZIlEqm6yv8WxvzV+Qn4xaYb
X-Google-Smtp-Source: ABdhPJwiQZC7KPqpYLNGwJijNDCnCSETaY5UfcHdSVHBYVyg7HwMGtmaU4dksavvIyoL/HjyZRMizQ==
X-Received: by 2002:a05:6e02:1563:b0:2cb:88aa:fd18 with SMTP id
 k3-20020a056e02156300b002cb88aafd18mr2414507ilu.216.1650646625288; 
 Fri, 22 Apr 2022 09:57:05 -0700 (PDT)
Received: from stoup.. ([2607:fb90:27d0:b0f2:934d:3e2:9f8c:dd1])
 by smtp.gmail.com with ESMTPSA id
 n23-20020a6b8b17000000b00649a2634725sm816380iod.17.2022.04.22.09.57.04
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 09:57:04 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 47/68] target/nios2: Split out helpers for gen_rr_mul_high
Date: Fri, 22 Apr 2022 09:52:17 -0700
Message-Id: <20220422165238.1971496-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220422165238.1971496-1-richard.henderson@linaro.org>
References: <20220422165238.1971496-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::134;
 envelope-from=richard.henderson@linaro.org; helo=mail-il1-x134.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Rename the macro from gen_r_mul, because these are the multiply
variants that produce a high-part result.  Do as little work as
possible within the macro; split out helper functions and pass
in arguments instead.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/translate.c | 31 ++++++++++++++++++-------------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/target/nios2/translate.c b/target/nios2/translate.c
index 4f52606516..5979427c8e 100644
--- a/target/nios2/translate.c
+++ b/target/nios2/translate.c
@@ -122,6 +122,7 @@ typedef struct {
 
 typedef void GenFn2i(TCGv, TCGv, target_long);
 typedef void GenFn3(TCGv, TCGv, TCGv);
+typedef void GenFn4(TCGv, TCGv, TCGv, TCGv);
 
 typedef struct DisasContext {
     DisasContextBase  base;
@@ -669,21 +670,25 @@ gen_ri_math_logic(srli, shri)
 gen_ri_math_logic(slli, shli)
 gen_ri_math_logic(roli, rotli)
 
-#define gen_r_mul(fname, insn)                                         \
-static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)   \
-{                                                                      \
-    R_TYPE(instr, (code));                                             \
-    if (likely(instr.c != R_ZERO)) {                                   \
-        TCGv t0 = tcg_temp_new();                                      \
-        tcg_gen_##insn(t0, cpu_R[instr.c],                             \
-                       load_gpr(dc, instr.a), load_gpr(dc, instr.b));  \
-        tcg_temp_free(t0);                                             \
-    }                                                                  \
+static void do_rr_mul_high(DisasContext *dc, uint32_t insn, GenFn4 *fn)
+{
+    R_TYPE(instr, insn);
+
+    if (likely(instr.c != R_ZERO)) {
+        TCGv discard = tcg_temp_new();
+        fn(discard, cpu_R[instr.c], load_gpr(dc, instr.a),
+           load_gpr(dc, instr.b));
+        tcg_temp_free(discard);
+    }
 }
 
-gen_r_mul(mulxss, muls2_tl)
-gen_r_mul(mulxuu, mulu2_tl)
-gen_r_mul(mulxsu, mulsu2_tl)
+#define gen_rr_mul_high(fname, insn)                                        \
+    static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)    \
+    { do_rr_mul_high(dc, code, tcg_gen_##insn##_tl); }
+
+gen_rr_mul_high(mulxss, muls2)
+gen_rr_mul_high(mulxuu, mulu2)
+gen_rr_mul_high(mulxsu, mulsu2)
 
 #define gen_r_shift_s(fname, insn)                                         \
 static void (fname)(DisasContext *dc, uint32_t code, uint32_t flags)       \
-- 
2.34.1


