Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D8AD64FB51
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Dec 2022 18:34:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6b3H-0005Ke-BJ; Sat, 17 Dec 2022 12:32:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b36-0005Gy-RW
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:32:39 -0500
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6b33-00033X-9L
 for qemu-devel@nongnu.org; Sat, 17 Dec 2022 12:32:36 -0500
Received: by mail-ej1-x62c.google.com with SMTP id m18so12959707eji.5
 for <qemu-devel@nongnu.org>; Sat, 17 Dec 2022 09:32:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n1j0r9rDeaSISVSa+E569qhI1K+O0LZVWUwwb9iEr9w=;
 b=SELaShA9dQPvl7VMRWNYcBbXSmsg9lwPqUYIcSE9mwQHN6mshqFAz/eJsdZdSCam08
 oNmTbfQOOAM2I0yEAK4jKmplpJRoWmPeWza0+7XPdDUWFFBoSW/HHbPqEbz0F+pIIJUf
 DYDI+sa90r/KiHSH2YuSwyTJXZIduDtFWTuHf8gs8au+3OfOFy83BnV2eALMBB5ysTH1
 dksxw0QxBaIRMuh1BFHR8s4jOO28yFX3P2OrxeE3PdBQN2cLt7lgRBU6y6gWRs+buB3z
 QzvJ3EHMWay1s1XZULDRrehnf2G3gfR7KNUqUbXXamXJFjnWl1Mh4AIO/pIHiIOMgwLA
 b7Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n1j0r9rDeaSISVSa+E569qhI1K+O0LZVWUwwb9iEr9w=;
 b=X10LZN/wrCU8Y7g6Bu0aWRqWtSj2SOftyzcu/ujJaOdLhRo8SUZ1lxBVVJm3hlbH7n
 FXoRVdMgld851DihaRUc/HRpXM5vQaQgLgzppCOkwsL3Ny1tnsrE3XaqC0J/qX+tCkV2
 8MJj4SyzNfnpetuT+QZOVMOPFw/KT6R10/POz07B6FDLieRcRH31Cetgdivt75Nbd4Q9
 //shHSBZ9TCFu5fz4uWCQxMXjK4x8bDT2oOOdlbyS9QlMe3Fe3sGOrGD1iRnvUuXLFJf
 LUeMrbLTT1hxxkser6asRKFzg6kn6v37fXBndsBYw0lDrxhJdYqaNjNNflaBILnMoI/5
 ugng==
X-Gm-Message-State: ANoB5pn/lUmDlReXqZs7sBfTOc6KpWr6AgIfeSuxrbhr2qg5NTpDQ0xR
 WpK2VPI0N9nPT2nmS98fyziEiREODu5KwhUd4GA=
X-Google-Smtp-Source: AA0mqf5/xL3B417GybxMdJcueNKSZutf3aAHXUquSa3XuEq5UM3VcM3XwjLJ3atg+QDr+K45yRY3Xg==
X-Received: by 2002:a17:906:3008:b0:7b5:73aa:9984 with SMTP id
 8-20020a170906300800b007b573aa9984mr31289344ejz.14.1671298351474; 
 Sat, 17 Dec 2022 09:32:31 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 gx26-20020a1709068a5a00b007ba9c181202sm2190943ejc.56.2022.12.17.09.32.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 17 Dec 2022 09:32:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] target/hppa: Extract FPU helpers to fpu_helper.c
Date: Sat, 17 Dec 2022 18:32:18 +0100
Message-Id: <20221217173219.8715-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221217173219.8715-1-philmd@linaro.org>
References: <20221217173219.8715-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x62c.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/hppa/fpu_helper.c | 450 +++++++++++++++++++++++++++++++++++++++
 target/hppa/meson.build  |   1 +
 target/hppa/op_helper.c  | 427 -------------------------------------
 3 files changed, 451 insertions(+), 427 deletions(-)
 create mode 100644 target/hppa/fpu_helper.c

diff --git a/target/hppa/fpu_helper.c b/target/hppa/fpu_helper.c
new file mode 100644
index 0000000000..576f283b04
--- /dev/null
+++ b/target/hppa/fpu_helper.c
@@ -0,0 +1,450 @@
+/*
+ * Helpers for HPPA FPU instructions.
+ *
+ * Copyright (c) 2016 Richard Henderson <rth@twiddle.net>
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "exec/exec-all.h"
+#include "exec/helper-proto.h"
+#include "fpu/softfloat.h"
+
+void HELPER(loaded_fr0)(CPUHPPAState *env)
+{
+    uint32_t shadow = env->fr[0] >> 32;
+    int rm, d;
+
+    env->fr0_shadow = shadow;
+
+    switch (extract32(shadow, 9, 2)) {
+    default:
+        rm = float_round_nearest_even;
+        break;
+    case 1:
+        rm = float_round_to_zero;
+        break;
+    case 2:
+        rm = float_round_up;
+        break;
+    case 3:
+        rm = float_round_down;
+        break;
+    }
+    set_float_rounding_mode(rm, &env->fp_status);
+
+    d = extract32(shadow, 5, 1);
+    set_flush_to_zero(d, &env->fp_status);
+    set_flush_inputs_to_zero(d, &env->fp_status);
+}
+
+void cpu_hppa_loaded_fr0(CPUHPPAState *env)
+{
+    helper_loaded_fr0(env);
+}
+
+#define CONVERT_BIT(X, SRC, DST)        \
+    ((SRC) > (DST)                      \
+     ? (X) / ((SRC) / (DST)) & (DST)    \
+     : ((X) & (SRC)) * ((DST) / (SRC)))
+
+static void update_fr0_op(CPUHPPAState *env, uintptr_t ra)
+{
+    uint32_t soft_exp = get_float_exception_flags(&env->fp_status);
+    uint32_t hard_exp = 0;
+    uint32_t shadow = env->fr0_shadow;
+
+    if (likely(soft_exp == 0)) {
+        env->fr[0] = (uint64_t)shadow << 32;
+        return;
+    }
+    set_float_exception_flags(0, &env->fp_status);
+
+    hard_exp |= CONVERT_BIT(soft_exp, float_flag_inexact,   1u << 0);
+    hard_exp |= CONVERT_BIT(soft_exp, float_flag_underflow, 1u << 1);
+    hard_exp |= CONVERT_BIT(soft_exp, float_flag_overflow,  1u << 2);
+    hard_exp |= CONVERT_BIT(soft_exp, float_flag_divbyzero, 1u << 3);
+    hard_exp |= CONVERT_BIT(soft_exp, float_flag_invalid,   1u << 4);
+    shadow |= hard_exp << (32 - 5);
+    env->fr0_shadow = shadow;
+    env->fr[0] = (uint64_t)shadow << 32;
+
+    if (hard_exp & shadow) {
+        hppa_dynamic_excp(env, EXCP_ASSIST, ra);
+    }
+}
+
+float32 HELPER(fsqrt_s)(CPUHPPAState *env, float32 arg)
+{
+    float32 ret = float32_sqrt(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float32 HELPER(frnd_s)(CPUHPPAState *env, float32 arg)
+{
+    float32 ret = float32_round_to_int(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float32 HELPER(fadd_s)(CPUHPPAState *env, float32 a, float32 b)
+{
+    float32 ret = float32_add(a, b, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float32 HELPER(fsub_s)(CPUHPPAState *env, float32 a, float32 b)
+{
+    float32 ret = float32_sub(a, b, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float32 HELPER(fmpy_s)(CPUHPPAState *env, float32 a, float32 b)
+{
+    float32 ret = float32_mul(a, b, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float32 HELPER(fdiv_s)(CPUHPPAState *env, float32 a, float32 b)
+{
+    float32 ret = float32_div(a, b, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fsqrt_d)(CPUHPPAState *env, float64 arg)
+{
+    float64 ret = float64_sqrt(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(frnd_d)(CPUHPPAState *env, float64 arg)
+{
+    float64 ret = float64_round_to_int(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fadd_d)(CPUHPPAState *env, float64 a, float64 b)
+{
+    float64 ret = float64_add(a, b, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fsub_d)(CPUHPPAState *env, float64 a, float64 b)
+{
+    float64 ret = float64_sub(a, b, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fmpy_d)(CPUHPPAState *env, float64 a, float64 b)
+{
+    float64 ret = float64_mul(a, b, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fdiv_d)(CPUHPPAState *env, float64 a, float64 b)
+{
+    float64 ret = float64_div(a, b, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fcnv_s_d)(CPUHPPAState *env, float32 arg)
+{
+    float64 ret = float32_to_float64(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float32 HELPER(fcnv_d_s)(CPUHPPAState *env, float64 arg)
+{
+    float32 ret = float64_to_float32(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float32 HELPER(fcnv_w_s)(CPUHPPAState *env, int32_t arg)
+{
+    float32 ret = int32_to_float32(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float32 HELPER(fcnv_dw_s)(CPUHPPAState *env, int64_t arg)
+{
+    float32 ret = int64_to_float32(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fcnv_w_d)(CPUHPPAState *env, int32_t arg)
+{
+    float64 ret = int32_to_float64(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fcnv_dw_d)(CPUHPPAState *env, int64_t arg)
+{
+    float64 ret = int64_to_float64(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+int32_t HELPER(fcnv_s_w)(CPUHPPAState *env, float32 arg)
+{
+    int32_t ret = float32_to_int32(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+int32_t HELPER(fcnv_d_w)(CPUHPPAState *env, float64 arg)
+{
+    int32_t ret = float64_to_int32(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+int64_t HELPER(fcnv_s_dw)(CPUHPPAState *env, float32 arg)
+{
+    int64_t ret = float32_to_int64(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+int64_t HELPER(fcnv_d_dw)(CPUHPPAState *env, float64 arg)
+{
+    int64_t ret = float64_to_int64(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+int32_t HELPER(fcnv_t_s_w)(CPUHPPAState *env, float32 arg)
+{
+    int32_t ret = float32_to_int32_round_to_zero(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+int32_t HELPER(fcnv_t_d_w)(CPUHPPAState *env, float64 arg)
+{
+    int32_t ret = float64_to_int32_round_to_zero(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+int64_t HELPER(fcnv_t_s_dw)(CPUHPPAState *env, float32 arg)
+{
+    int64_t ret = float32_to_int64_round_to_zero(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+int64_t HELPER(fcnv_t_d_dw)(CPUHPPAState *env, float64 arg)
+{
+    int64_t ret = float64_to_int64_round_to_zero(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float32 HELPER(fcnv_uw_s)(CPUHPPAState *env, uint32_t arg)
+{
+    float32 ret = uint32_to_float32(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float32 HELPER(fcnv_udw_s)(CPUHPPAState *env, uint64_t arg)
+{
+    float32 ret = uint64_to_float32(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fcnv_uw_d)(CPUHPPAState *env, uint32_t arg)
+{
+    float64 ret = uint32_to_float64(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fcnv_udw_d)(CPUHPPAState *env, uint64_t arg)
+{
+    float64 ret = uint64_to_float64(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+uint32_t HELPER(fcnv_s_uw)(CPUHPPAState *env, float32 arg)
+{
+    uint32_t ret = float32_to_uint32(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+uint32_t HELPER(fcnv_d_uw)(CPUHPPAState *env, float64 arg)
+{
+    uint32_t ret = float64_to_uint32(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+uint64_t HELPER(fcnv_s_udw)(CPUHPPAState *env, float32 arg)
+{
+    uint64_t ret = float32_to_uint64(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+uint64_t HELPER(fcnv_d_udw)(CPUHPPAState *env, float64 arg)
+{
+    uint64_t ret = float64_to_uint64(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+uint32_t HELPER(fcnv_t_s_uw)(CPUHPPAState *env, float32 arg)
+{
+    uint32_t ret = float32_to_uint32_round_to_zero(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+uint32_t HELPER(fcnv_t_d_uw)(CPUHPPAState *env, float64 arg)
+{
+    uint32_t ret = float64_to_uint32_round_to_zero(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+uint64_t HELPER(fcnv_t_s_udw)(CPUHPPAState *env, float32 arg)
+{
+    uint64_t ret = float32_to_uint64_round_to_zero(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+uint64_t HELPER(fcnv_t_d_udw)(CPUHPPAState *env, float64 arg)
+{
+    uint64_t ret = float64_to_uint64_round_to_zero(arg, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+static void update_fr0_cmp(CPUHPPAState *env, uint32_t y,
+                           uint32_t c, FloatRelation r)
+{
+    uint32_t shadow = env->fr0_shadow;
+
+    switch (r) {
+    case float_relation_greater:
+        c = extract32(c, 4, 1);
+        break;
+    case float_relation_less:
+        c = extract32(c, 3, 1);
+        break;
+    case float_relation_equal:
+        c = extract32(c, 2, 1);
+        break;
+    case float_relation_unordered:
+        c = extract32(c, 1, 1);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+
+    if (y) {
+        /* targeted comparison */
+        /* set fpsr[ca[y - 1]] to current compare */
+        shadow = deposit32(shadow, 21 - (y - 1), 1, c);
+    } else {
+        /* queued comparison */
+        /* shift cq right by one place */
+        shadow = deposit32(shadow, 11, 10, extract32(shadow, 12, 10));
+        /* move fpsr[c] to fpsr[cq[0]] */
+        shadow = deposit32(shadow, 21, 1, extract32(shadow, 26, 1));
+        /* set fpsr[c] to current compare */
+        shadow = deposit32(shadow, 26, 1, c);
+    }
+
+    env->fr0_shadow = shadow;
+    env->fr[0] = (uint64_t)shadow << 32;
+}
+
+void HELPER(fcmp_s)(CPUHPPAState *env, float32 a, float32 b,
+                    uint32_t y, uint32_t c)
+{
+    FloatRelation r;
+    if (c & 1) {
+        r = float32_compare(a, b, &env->fp_status);
+    } else {
+        r = float32_compare_quiet(a, b, &env->fp_status);
+    }
+    update_fr0_op(env, GETPC());
+    update_fr0_cmp(env, y, c, r);
+}
+
+void HELPER(fcmp_d)(CPUHPPAState *env, float64 a, float64 b,
+                    uint32_t y, uint32_t c)
+{
+    FloatRelation r;
+    if (c & 1) {
+        r = float64_compare(a, b, &env->fp_status);
+    } else {
+        r = float64_compare_quiet(a, b, &env->fp_status);
+    }
+    update_fr0_op(env, GETPC());
+    update_fr0_cmp(env, y, c, r);
+}
+
+float32 HELPER(fmpyfadd_s)(CPUHPPAState *env, float32 a, float32 b, float32 c)
+{
+    float32 ret = float32_muladd(a, b, c, 0, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float32 HELPER(fmpynfadd_s)(CPUHPPAState *env, float32 a, float32 b, float32 c)
+{
+    float32 ret = float32_muladd(a, b, c, float_muladd_negate_product,
+                                 &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fmpyfadd_d)(CPUHPPAState *env, float64 a, float64 b, float64 c)
+{
+    float64 ret = float64_muladd(a, b, c, 0, &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
+
+float64 HELPER(fmpynfadd_d)(CPUHPPAState *env, float64 a, float64 b, float64 c)
+{
+    float64 ret = float64_muladd(a, b, c, float_muladd_negate_product,
+                                 &env->fp_status);
+    update_fr0_op(env, GETPC());
+    return ret;
+}
diff --git a/target/hppa/meson.build b/target/hppa/meson.build
index 021e42a2d0..fb90aed5de 100644
--- a/target/hppa/meson.build
+++ b/target/hppa/meson.build
@@ -4,6 +4,7 @@ hppa_ss = ss.source_set()
 hppa_ss.add(gen)
 hppa_ss.add(files(
   'cpu.c',
+  'fpu_helper.c',
   'gdbstub.c',
   'helper.c',
   'int_helper.c',
diff --git a/target/hppa/op_helper.c b/target/hppa/op_helper.c
index fbd80e4248..f5905c9fc2 100644
--- a/target/hppa/op_helper.c
+++ b/target/hppa/op_helper.c
@@ -25,7 +25,6 @@
 #include "exec/cpu_ldst.h"
 #include "qemu/timer.h"
 #include "sysemu/runstate.h"
-#include "fpu/softfloat.h"
 #include "trace.h"
 
 G_NORETURN void HELPER(excp)(CPUHPPAState *env, int excp)
@@ -197,432 +196,6 @@ target_ureg HELPER(probe)(CPUHPPAState *env, target_ulong addr,
 #endif
 }
 
-void HELPER(loaded_fr0)(CPUHPPAState *env)
-{
-    uint32_t shadow = env->fr[0] >> 32;
-    int rm, d;
-
-    env->fr0_shadow = shadow;
-
-    switch (extract32(shadow, 9, 2)) {
-    default:
-        rm = float_round_nearest_even;
-        break;
-    case 1:
-        rm = float_round_to_zero;
-        break;
-    case 2:
-        rm = float_round_up;
-        break;
-    case 3:
-        rm = float_round_down;
-        break;
-    }
-    set_float_rounding_mode(rm, &env->fp_status);
-
-    d = extract32(shadow, 5, 1);
-    set_flush_to_zero(d, &env->fp_status);
-    set_flush_inputs_to_zero(d, &env->fp_status);
-}
-
-void cpu_hppa_loaded_fr0(CPUHPPAState *env)
-{
-    helper_loaded_fr0(env);
-}
-
-#define CONVERT_BIT(X, SRC, DST)        \
-    ((SRC) > (DST)                      \
-     ? (X) / ((SRC) / (DST)) & (DST)    \
-     : ((X) & (SRC)) * ((DST) / (SRC)))
-
-static void update_fr0_op(CPUHPPAState *env, uintptr_t ra)
-{
-    uint32_t soft_exp = get_float_exception_flags(&env->fp_status);
-    uint32_t hard_exp = 0;
-    uint32_t shadow = env->fr0_shadow;
-
-    if (likely(soft_exp == 0)) {
-        env->fr[0] = (uint64_t)shadow << 32;
-        return;
-    }
-    set_float_exception_flags(0, &env->fp_status);
-
-    hard_exp |= CONVERT_BIT(soft_exp, float_flag_inexact,   1u << 0);
-    hard_exp |= CONVERT_BIT(soft_exp, float_flag_underflow, 1u << 1);
-    hard_exp |= CONVERT_BIT(soft_exp, float_flag_overflow,  1u << 2);
-    hard_exp |= CONVERT_BIT(soft_exp, float_flag_divbyzero, 1u << 3);
-    hard_exp |= CONVERT_BIT(soft_exp, float_flag_invalid,   1u << 4);
-    shadow |= hard_exp << (32 - 5);
-    env->fr0_shadow = shadow;
-    env->fr[0] = (uint64_t)shadow << 32;
-
-    if (hard_exp & shadow) {
-        hppa_dynamic_excp(env, EXCP_ASSIST, ra);
-    }
-}
-
-float32 HELPER(fsqrt_s)(CPUHPPAState *env, float32 arg)
-{
-    float32 ret = float32_sqrt(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float32 HELPER(frnd_s)(CPUHPPAState *env, float32 arg)
-{
-    float32 ret = float32_round_to_int(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float32 HELPER(fadd_s)(CPUHPPAState *env, float32 a, float32 b)
-{
-    float32 ret = float32_add(a, b, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float32 HELPER(fsub_s)(CPUHPPAState *env, float32 a, float32 b)
-{
-    float32 ret = float32_sub(a, b, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float32 HELPER(fmpy_s)(CPUHPPAState *env, float32 a, float32 b)
-{
-    float32 ret = float32_mul(a, b, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float32 HELPER(fdiv_s)(CPUHPPAState *env, float32 a, float32 b)
-{
-    float32 ret = float32_div(a, b, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fsqrt_d)(CPUHPPAState *env, float64 arg)
-{
-    float64 ret = float64_sqrt(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(frnd_d)(CPUHPPAState *env, float64 arg)
-{
-    float64 ret = float64_round_to_int(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fadd_d)(CPUHPPAState *env, float64 a, float64 b)
-{
-    float64 ret = float64_add(a, b, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fsub_d)(CPUHPPAState *env, float64 a, float64 b)
-{
-    float64 ret = float64_sub(a, b, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fmpy_d)(CPUHPPAState *env, float64 a, float64 b)
-{
-    float64 ret = float64_mul(a, b, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fdiv_d)(CPUHPPAState *env, float64 a, float64 b)
-{
-    float64 ret = float64_div(a, b, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fcnv_s_d)(CPUHPPAState *env, float32 arg)
-{
-    float64 ret = float32_to_float64(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float32 HELPER(fcnv_d_s)(CPUHPPAState *env, float64 arg)
-{
-    float32 ret = float64_to_float32(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float32 HELPER(fcnv_w_s)(CPUHPPAState *env, int32_t arg)
-{
-    float32 ret = int32_to_float32(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float32 HELPER(fcnv_dw_s)(CPUHPPAState *env, int64_t arg)
-{
-    float32 ret = int64_to_float32(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fcnv_w_d)(CPUHPPAState *env, int32_t arg)
-{
-    float64 ret = int32_to_float64(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fcnv_dw_d)(CPUHPPAState *env, int64_t arg)
-{
-    float64 ret = int64_to_float64(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-int32_t HELPER(fcnv_s_w)(CPUHPPAState *env, float32 arg)
-{
-    int32_t ret = float32_to_int32(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-int32_t HELPER(fcnv_d_w)(CPUHPPAState *env, float64 arg)
-{
-    int32_t ret = float64_to_int32(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-int64_t HELPER(fcnv_s_dw)(CPUHPPAState *env, float32 arg)
-{
-    int64_t ret = float32_to_int64(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-int64_t HELPER(fcnv_d_dw)(CPUHPPAState *env, float64 arg)
-{
-    int64_t ret = float64_to_int64(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-int32_t HELPER(fcnv_t_s_w)(CPUHPPAState *env, float32 arg)
-{
-    int32_t ret = float32_to_int32_round_to_zero(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-int32_t HELPER(fcnv_t_d_w)(CPUHPPAState *env, float64 arg)
-{
-    int32_t ret = float64_to_int32_round_to_zero(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-int64_t HELPER(fcnv_t_s_dw)(CPUHPPAState *env, float32 arg)
-{
-    int64_t ret = float32_to_int64_round_to_zero(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-int64_t HELPER(fcnv_t_d_dw)(CPUHPPAState *env, float64 arg)
-{
-    int64_t ret = float64_to_int64_round_to_zero(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float32 HELPER(fcnv_uw_s)(CPUHPPAState *env, uint32_t arg)
-{
-    float32 ret = uint32_to_float32(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float32 HELPER(fcnv_udw_s)(CPUHPPAState *env, uint64_t arg)
-{
-    float32 ret = uint64_to_float32(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fcnv_uw_d)(CPUHPPAState *env, uint32_t arg)
-{
-    float64 ret = uint32_to_float64(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fcnv_udw_d)(CPUHPPAState *env, uint64_t arg)
-{
-    float64 ret = uint64_to_float64(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-uint32_t HELPER(fcnv_s_uw)(CPUHPPAState *env, float32 arg)
-{
-    uint32_t ret = float32_to_uint32(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-uint32_t HELPER(fcnv_d_uw)(CPUHPPAState *env, float64 arg)
-{
-    uint32_t ret = float64_to_uint32(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-uint64_t HELPER(fcnv_s_udw)(CPUHPPAState *env, float32 arg)
-{
-    uint64_t ret = float32_to_uint64(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-uint64_t HELPER(fcnv_d_udw)(CPUHPPAState *env, float64 arg)
-{
-    uint64_t ret = float64_to_uint64(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-uint32_t HELPER(fcnv_t_s_uw)(CPUHPPAState *env, float32 arg)
-{
-    uint32_t ret = float32_to_uint32_round_to_zero(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-uint32_t HELPER(fcnv_t_d_uw)(CPUHPPAState *env, float64 arg)
-{
-    uint32_t ret = float64_to_uint32_round_to_zero(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-uint64_t HELPER(fcnv_t_s_udw)(CPUHPPAState *env, float32 arg)
-{
-    uint64_t ret = float32_to_uint64_round_to_zero(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-uint64_t HELPER(fcnv_t_d_udw)(CPUHPPAState *env, float64 arg)
-{
-    uint64_t ret = float64_to_uint64_round_to_zero(arg, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-static void update_fr0_cmp(CPUHPPAState *env, uint32_t y,
-                           uint32_t c, FloatRelation r)
-{
-    uint32_t shadow = env->fr0_shadow;
-
-    switch (r) {
-    case float_relation_greater:
-        c = extract32(c, 4, 1);
-        break;
-    case float_relation_less:
-        c = extract32(c, 3, 1);
-        break;
-    case float_relation_equal:
-        c = extract32(c, 2, 1);
-        break;
-    case float_relation_unordered:
-        c = extract32(c, 1, 1);
-        break;
-    default:
-        g_assert_not_reached();
-    }
-
-    if (y) {
-        /* targeted comparison */
-        /* set fpsr[ca[y - 1]] to current compare */
-        shadow = deposit32(shadow, 21 - (y - 1), 1, c);
-    } else {
-        /* queued comparison */
-        /* shift cq right by one place */
-        shadow = deposit32(shadow, 11, 10, extract32(shadow, 12, 10));
-        /* move fpsr[c] to fpsr[cq[0]] */
-        shadow = deposit32(shadow, 21, 1, extract32(shadow, 26, 1));
-        /* set fpsr[c] to current compare */
-        shadow = deposit32(shadow, 26, 1, c);
-    }
-
-    env->fr0_shadow = shadow;
-    env->fr[0] = (uint64_t)shadow << 32;
-}
-
-void HELPER(fcmp_s)(CPUHPPAState *env, float32 a, float32 b,
-                    uint32_t y, uint32_t c)
-{
-    FloatRelation r;
-    if (c & 1) {
-        r = float32_compare(a, b, &env->fp_status);
-    } else {
-        r = float32_compare_quiet(a, b, &env->fp_status);
-    }
-    update_fr0_op(env, GETPC());
-    update_fr0_cmp(env, y, c, r);
-}
-
-void HELPER(fcmp_d)(CPUHPPAState *env, float64 a, float64 b,
-                    uint32_t y, uint32_t c)
-{
-    FloatRelation r;
-    if (c & 1) {
-        r = float64_compare(a, b, &env->fp_status);
-    } else {
-        r = float64_compare_quiet(a, b, &env->fp_status);
-    }
-    update_fr0_op(env, GETPC());
-    update_fr0_cmp(env, y, c, r);
-}
-
-float32 HELPER(fmpyfadd_s)(CPUHPPAState *env, float32 a, float32 b, float32 c)
-{
-    float32 ret = float32_muladd(a, b, c, 0, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float32 HELPER(fmpynfadd_s)(CPUHPPAState *env, float32 a, float32 b, float32 c)
-{
-    float32 ret = float32_muladd(a, b, c, float_muladd_negate_product,
-                                 &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fmpyfadd_d)(CPUHPPAState *env, float64 a, float64 b, float64 c)
-{
-    float64 ret = float64_muladd(a, b, c, 0, &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
-float64 HELPER(fmpynfadd_d)(CPUHPPAState *env, float64 a, float64 b, float64 c)
-{
-    float64 ret = float64_muladd(a, b, c, float_muladd_negate_product,
-                                 &env->fp_status);
-    update_fr0_op(env, GETPC());
-    return ret;
-}
-
 target_ureg HELPER(read_interval_timer)(void)
 {
 #ifdef CONFIG_USER_ONLY
-- 
2.38.1


