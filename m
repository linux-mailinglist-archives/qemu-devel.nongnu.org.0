Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7856AEDB8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 19:06:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZbe2-0002fa-B1; Tue, 07 Mar 2023 13:02:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdy-0002ET-3J
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:34 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZbdw-000140-8G
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 13:02:33 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so17336562pjg.4
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 10:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678212151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HqVYTGWT7jeQfdWYdhIL5u6To2oyL4lphfw9D9/1xXA=;
 b=orErRXQlSKyjl7CqloHs/lubCy6ze1a29pVvI7b02zk5TRDYqACj1qWHR3C7eDRZx5
 J2/L/yB27coaXZOcHERdvRR5DL31vPQNco1P2DP/TvcTEtRuWHl+5uSblrUDjnPqghWH
 kgYaa8Cc+Uhv83dK0bn9CtwyobVDuYsO5jusvEOIy50A2MkPtM1QtTL/AYLVf8LLW+0o
 d3s1KVaGAsr0oLLfXKeiQgSw4sgcR6bc0L0NYHNj8x0z9cmCQ583ng9NR+JicIJwzXiH
 Cma+dtderHE0oHPpJMeixr9fYh+IrXpZUKpvLoysjoHcUBxMqqdt1PJ4VHn9kpLklzO1
 R8Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678212151;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HqVYTGWT7jeQfdWYdhIL5u6To2oyL4lphfw9D9/1xXA=;
 b=xSTMVqqup7n/t+kUCDKZudr9Mk9gU4ES0LjXCT1+eglrubGnuLf1EaTOH2k+VlvUkE
 0H5SWf0EmbHOp8sFSGZhHo/ntFWSCffNXAcdLAPOdUKDyLf854mw2H5ZgAoWN4+70b7X
 bOxOAwgGAz/DWnuO3zzx/iAqaPlnYslgRfP++tyQqnqtQNSME/AF+qlJswp3j0j/Jj42
 W50jv/wYyIvp6yTYBxQZ4jZRA36dM1XViymAVV4vB9TnOyWoD8rovqQSzwAu8AsL3z9v
 O+jd35Gk8N7L10TgV/KRvHxoPueoCAlj8oxXLxx8urs6EgA72wTZ5wnAAZZVl35O1s0l
 uHzQ==
X-Gm-Message-State: AO0yUKW2l5+wsW0XSpMPwkmqTlvJlKqBIGM3r9xrX1bEqC48CPqPLphM
 R3Or8aXGkTsJ/Zghq9lpRaeS6F/4VqqoC+LDx6E=
X-Google-Smtp-Source: AK7set99iNAc4SoKX83yxrv0A+cA5bvBk+nnBnh9w1kD7p94/nVIG7D7nJgNu28onA14Fjyy10SwWg==
X-Received: by 2002:a05:6a20:3d05:b0:cd:9da2:ebed with SMTP id
 y5-20020a056a203d0500b000cd9da2ebedmr19051042pzi.43.1678212151370; 
 Tue, 07 Mar 2023 10:02:31 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:b1e0:bfd9:8b1a:efeb])
 by smtp.gmail.com with ESMTPSA id
 z4-20020a63e544000000b00502fd70b0bdsm8080441pgj.52.2023.03.07.10.02.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 10:02:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 52/67] target/ppc: Split out gen_vx_vmul10
Date: Tue,  7 Mar 2023 09:58:33 -0800
Message-Id: <20230307175848.2508955-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307175848.2508955-1-richard.henderson@linaro.org>
References: <20230307175848.2508955-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
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

Move the body out of this large macro.
Use tcg_constant_i64.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/translate/vmx-impl.c.inc | 95 +++++++++++++++--------------
 1 file changed, 49 insertions(+), 46 deletions(-)

diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 05ba9c9492..ee656d6a44 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -171,53 +171,56 @@ static void gen_mtvscr(DisasContext *ctx)
     gen_helper_mtvscr(cpu_env, val);
 }
 
+static void gen_vx_vmul10(DisasContext *ctx, bool add_cin, bool ret_carry)
+{
+    TCGv_i64 t0;
+    TCGv_i64 t1;
+    TCGv_i64 t2;
+    TCGv_i64 avr;
+    TCGv_i64 ten, z;
+
+    if (unlikely(!ctx->altivec_enabled)) {
+        gen_exception(ctx, POWERPC_EXCP_VPU);
+        return;
+    }
+
+    t0 = tcg_temp_new_i64();
+    t1 = tcg_temp_new_i64();
+    t2 = tcg_temp_new_i64();
+    avr = tcg_temp_new_i64();
+    ten = tcg_constant_i64(10);
+    z = tcg_constant_i64(0);
+
+    if (add_cin) {
+        get_avr64(avr, rA(ctx->opcode), false);
+        tcg_gen_mulu2_i64(t0, t1, avr, ten);
+        get_avr64(avr, rB(ctx->opcode), false);
+        tcg_gen_andi_i64(t2, avr, 0xF);
+        tcg_gen_add2_i64(avr, t2, t0, t1, t2, z);
+        set_avr64(rD(ctx->opcode), avr, false);
+    } else {
+        get_avr64(avr, rA(ctx->opcode), false);
+        tcg_gen_mulu2_i64(avr, t2, avr, ten);
+        set_avr64(rD(ctx->opcode), avr, false);
+    }
+
+    if (ret_carry) {
+        get_avr64(avr, rA(ctx->opcode), true);
+        tcg_gen_mulu2_i64(t0, t1, avr, ten);
+        tcg_gen_add2_i64(t0, avr, t0, t1, t2, z);
+        set_avr64(rD(ctx->opcode), avr, false);
+        set_avr64(rD(ctx->opcode), z, true);
+    } else {
+        get_avr64(avr, rA(ctx->opcode), true);
+        tcg_gen_mul_i64(t0, avr, ten);
+        tcg_gen_add_i64(avr, t0, t2);
+        set_avr64(rD(ctx->opcode), avr, true);
+    }
+}
+
 #define GEN_VX_VMUL10(name, add_cin, ret_carry)                         \
-static void glue(gen_, name)(DisasContext *ctx)                         \
-{                                                                       \
-    TCGv_i64 t0;                                                        \
-    TCGv_i64 t1;                                                        \
-    TCGv_i64 t2;                                                        \
-    TCGv_i64 avr;                                                       \
-    TCGv_i64 ten, z;                                                    \
-                                                                        \
-    if (unlikely(!ctx->altivec_enabled)) {                              \
-        gen_exception(ctx, POWERPC_EXCP_VPU);                           \
-        return;                                                         \
-    }                                                                   \
-                                                                        \
-    t0 = tcg_temp_new_i64();                                            \
-    t1 = tcg_temp_new_i64();                                            \
-    t2 = tcg_temp_new_i64();                                            \
-    avr = tcg_temp_new_i64();                                           \
-    ten = tcg_const_i64(10);                                            \
-    z = tcg_const_i64(0);                                               \
-                                                                        \
-    if (add_cin) {                                                      \
-        get_avr64(avr, rA(ctx->opcode), false);                         \
-        tcg_gen_mulu2_i64(t0, t1, avr, ten);                            \
-        get_avr64(avr, rB(ctx->opcode), false);                         \
-        tcg_gen_andi_i64(t2, avr, 0xF);                                 \
-        tcg_gen_add2_i64(avr, t2, t0, t1, t2, z);                       \
-        set_avr64(rD(ctx->opcode), avr, false);                         \
-    } else {                                                            \
-        get_avr64(avr, rA(ctx->opcode), false);                         \
-        tcg_gen_mulu2_i64(avr, t2, avr, ten);                           \
-        set_avr64(rD(ctx->opcode), avr, false);                         \
-    }                                                                   \
-                                                                        \
-    if (ret_carry) {                                                    \
-        get_avr64(avr, rA(ctx->opcode), true);                          \
-        tcg_gen_mulu2_i64(t0, t1, avr, ten);                            \
-        tcg_gen_add2_i64(t0, avr, t0, t1, t2, z);                       \
-        set_avr64(rD(ctx->opcode), avr, false);                         \
-        set_avr64(rD(ctx->opcode), z, true);                            \
-    } else {                                                            \
-        get_avr64(avr, rA(ctx->opcode), true);                          \
-        tcg_gen_mul_i64(t0, avr, ten);                                  \
-        tcg_gen_add_i64(avr, t0, t2);                                   \
-        set_avr64(rD(ctx->opcode), avr, true);                          \
-    }                                                                   \
-}                                                                       \
+    static void glue(gen_, name)(DisasContext *ctx)                     \
+    { gen_vx_vmul10(ctx, add_cin, ret_carry); }
 
 GEN_VX_VMUL10(vmul10uq, 0, 0);
 GEN_VX_VMUL10(vmul10euq, 1, 0);
-- 
2.34.1


