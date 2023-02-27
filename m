Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 178CC6A41D3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:40:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcns-0004Dn-Cy; Mon, 27 Feb 2023 07:40:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcnU-0003Z5-9h
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:40:09 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcnO-0001IV-5K
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:40:03 -0500
Received: by mail-wm1-x32b.google.com with SMTP id c18so4124744wmr.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:39:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NboHHvIMFzubbkVniaiYtplieW5qFThca0VsvjVWsA0=;
 b=BtUGWbkGMNLBhdUujq7iVjpY4/6VcViA/G8ioKn7NBRewJigYOH2T3zJRqzKpAFQmR
 OQqc+u+CBw4F3VGujSC7km5bYaCNbI1ryxge+tY5ppk9t5vcahA43TeBemmdZqApt8VJ
 K8+Gryyqk9uyu1i5ar+TDn02tlQLwFRuIDwPOjdBV8hXS6vUaWh9miBYVp/q0tCmaPzx
 YmNg+Y2iXBETrV8RvpY8tdbb3Cr3PqJ4gpNkb1j0NZiE2CIpSQeyWySA6sTgfjQw+4Uj
 JIQ8mBXuDXj6s7UhDiIIoPIWBk+ykE6wt8RlJwgWzy57prKPB/Y3PrR6+9wy3eLpjWTZ
 n7oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NboHHvIMFzubbkVniaiYtplieW5qFThca0VsvjVWsA0=;
 b=YCEne4AEgXFtnWNP85Oi2VJj0deRWWNyBjauVftRzVjUO5PrQ1mET3LKJ6MYCfZizx
 wU09+mYfAiK+4GQx04DsuJfpMKpreE1zgrcj8DPv0Rje7ySHLH00EtIwZA9L2JtJYqCu
 wklDV85Uuiw5lCmiOH9JfmTqutTPD7f+eihQp16HMbKtEw752mkuslLoQhK7FiMBwtp5
 Ic8Xx3s98bMMLowSSCh0Lq1Te5hql0GQQW4H9/D/qLRPuMv1L3tcXBtJnHvtXQchjE/Y
 HRthiQl0UXFOczY1JkExSqkuqbF0ZC+AxzIy6iqoDmfbqTyzVYGUmBxeQtXxsrcjzDmg
 RyxA==
X-Gm-Message-State: AO0yUKW1FNRfb0SzZscdiGkRhs7Pu3cEkta4diIueiJphsexXPrjZ1W0
 MmAyeb2WBlwJFCFGM0ftvgzHwB4Lkf3Xegfz
X-Google-Smtp-Source: AK7set+fMZNPXEOwQyPLMwlNgznkZWA5xUAaA5+Adxcb9lZYiJ9VBssUt50kH9Ak+oOgbzkw3SfSnQ==
X-Received: by 2002:a05:600c:1608:b0:3eb:39c9:ecb0 with SMTP id
 m8-20020a05600c160800b003eb39c9ecb0mr4154482wmn.8.1677501596443; 
 Mon, 27 Feb 2023 04:39:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l15-20020a05600012cf00b002be505ab59asm7054918wrx.97.2023.02.27.04.39.54
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 04:39:55 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 010/123] target/hppa: Extract FPU helpers to fpu_helper.c
Date: Mon, 27 Feb 2023 13:36:54 +0100
Message-Id: <20230227123847.27110-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227123847.27110-1-philmd@linaro.org>
References: <20230227123847.27110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221217173219.8715-2-philmd@linaro.org>
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


