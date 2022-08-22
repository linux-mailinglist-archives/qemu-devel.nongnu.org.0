Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D72C59CC9A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:57:43 +0200 (CEST)
Received: from localhost ([::1]:50272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHIc-0002rR-Oa
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvZ-0006AJ-Dm
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:56 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:43617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-0007HH-A3
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:53 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 o5-20020a17090a3d4500b001ef76490983so12927440pjf.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=3+r7ENE17P6x6oNam3ERs0Fe6mXrQa7o5OMdmOs7Dek=;
 b=Za7FP29lBafCOlDjwBQmXdek551ji38LS2eYLls+IJYY9IB/dB6BGEeNx9KQr/JYtH
 2649HJClQra9ahfmgeJUsA9MemEdW7DBdzHxVjls/shisQi2MVhYou8X8EpCgC+kHYSy
 dCIxInUpWatjwKxPOxyv52L3aXzHAzBrVCoMwopMYVUKq50pGfeTuByOc7z9SZ/tA4L9
 acpO11b/BlkMSZGb4KBpB9oYlGx/r8LMr8wrB2tkf+1LLre/iL4OOEH83rCM9cb8zRK1
 TsYZ0sbBYMFSEHnNEklBdyaSKGM5cNh0gQ66j4ngS8MxUR4HvTIgQ6yOx1B+B7Md8Ec1
 oohA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=3+r7ENE17P6x6oNam3ERs0Fe6mXrQa7o5OMdmOs7Dek=;
 b=rNbVaO88O4whby1lyfJMCTvgIyoTpxDEmElg6HG1Bx2WZQjgP1fBcNf53jjVZc5toq
 ZuZJu0Vv68sXPO+4UmkX9e4MlsDJLp5fzjW7KFrAeKhfV6dJmL3CNe9xvuoLomh+KVI6
 aEdXxJbwWTzQIH6Mb35oOGMaKNFXlUh9Wx+9oT+2JU/4SBerFHsg+3aALHVq1PXlqkfH
 oApXFbXynN+NxouU1rjVmjzjDBD+T62ha5C8qjFBRbBH/HGYTN+XZ5x4CdTc5f+zWc2T
 k5sX6E7MMDh5JSqvsghxdyVuTNI48anyJWlETtFLTIacQgfmgOunNvW2IQfuoy7ZPVPF
 m1LQ==
X-Gm-Message-State: ACgBeo13mZ2g2Jtv9oU3HKJ3UD/fkiDwSvju3Z3FchQYSJFgZ5Rda6ve
 uf+zlmXQRcxjK1ZnpW2wDggZr4BQwE2CCA==
X-Google-Smtp-Source: AA6agR76xHYeZJ/tD037P0i6dzS67rSPNZyxYBtEn79AUI2YNrU+YFV5DNlp+om+M/pxOT2opwRo5g==
X-Received: by 2002:a17:902:e5c2:b0:172:f66b:c760 with SMTP id
 u2-20020a170902e5c200b00172f66bc760mr3857629plf.92.1661211218939; 
 Mon, 22 Aug 2022 16:33:38 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 14/22] target/i386: Create eip_next_*
Date: Mon, 22 Aug 2022 16:33:10 -0700
Message-Id: <20220822233318.1728621-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

Create helpers for loading the address of the next insn.
Use tcg_constant_* in adjacent code where convenient.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 44 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 13577f5d7b..47d6cd2fce 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -541,6 +541,16 @@ static TCGv_i32 cur_insn_len_i32(DisasContext *s)
     return tcg_constant_i32(cur_insn_len(s));
 }
 
+static TCGv_i32 eip_next_i32(DisasContext *s)
+{
+    return tcg_constant_i32(s->pc - s->cs_base);
+}
+
+static TCGv eip_next_tl(DisasContext *s)
+{
+    return tcg_constant_tl(s->pc - s->cs_base);
+}
+
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
    (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
    indicate no override.  */
@@ -1213,12 +1223,9 @@ static void gen_bpt_io(DisasContext *s, TCGv_i32 t_port, int ot)
         /* user-mode cpu should not be in IOBPT mode */
         g_assert_not_reached();
 #else
-        TCGv_i32 t_size = tcg_const_i32(1 << ot);
-        TCGv t_next = tcg_const_tl(s->pc - s->cs_base);
-
+        TCGv_i32 t_size = tcg_constant_i32(1 << ot);
+        TCGv t_next = eip_next_tl(s);
         gen_helper_bpt_io(cpu_env, t_port, t_size, t_next);
-        tcg_temp_free_i32(t_size);
-        tcg_temp_free(t_next);
 #endif /* CONFIG_USER_ONLY */
     }
 }
@@ -5167,9 +5174,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (dflag == MO_16) {
                 tcg_gen_ext16u_tl(s->T0, s->T0);
             }
-            next_eip = s->pc - s->cs_base;
-            tcg_gen_movi_tl(s->T1, next_eip);
-            gen_push_v(s, s->T1);
+            gen_push_v(s, eip_next_tl(s));
             gen_op_jmp_v(s->T0);
             gen_bnd_jmp(s);
             s->base.is_jmp = DISAS_JUMP;
@@ -5185,14 +5190,14 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (PE(s) && !VM86(s)) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_lcall_protected(cpu_env, s->tmp2_i32, s->T1,
-                                           tcg_const_i32(dflag - 1),
-                                           tcg_const_tl(s->pc - s->cs_base));
+                                           tcg_constant_i32(dflag - 1),
+                                           eip_next_tl(s));
             } else {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
                 gen_helper_lcall_real(cpu_env, s->tmp2_i32, s->tmp3_i32,
-                                      tcg_const_i32(dflag - 1),
-                                      tcg_const_i32(s->pc - s->cs_base));
+                                      tcg_constant_i32(dflag - 1),
+                                      eip_next_i32(s));
             }
             s->base.is_jmp = DISAS_JUMP;
             break;
@@ -5215,7 +5220,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (PE(s) && !VM86(s)) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ljmp_protected(cpu_env, s->tmp2_i32, s->T1,
-                                          tcg_const_tl(s->pc - s->cs_base));
+                                          eip_next_tl(s));
             } else {
                 gen_op_movl_seg_T0_vm(s, R_CS);
                 gen_op_jmp_v(s->T1);
@@ -6706,8 +6711,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_helper_iret_real(cpu_env, tcg_const_i32(dflag - 1));
         } else {
-            gen_helper_iret_protected(cpu_env, tcg_const_i32(dflag - 1),
-                                      tcg_const_i32(s->pc - s->cs_base));
+            gen_helper_iret_protected(cpu_env, tcg_constant_i32(dflag - 1),
+                                      eip_next_i32(s));
         }
         set_cc_op(s, CC_OP_EFLAGS);
         s->base.is_jmp = DISAS_EOB_ONLY;
@@ -6719,15 +6724,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             } else {
                 tval = (int16_t)insn_get(env, s, MO_16);
             }
-            next_eip = s->pc - s->cs_base;
-            tval += next_eip;
+            tval += s->pc - s->cs_base;
             if (dflag == MO_16) {
                 tval &= 0xffff;
             } else if (!CODE64(s)) {
                 tval &= 0xffffffff;
             }
-            tcg_gen_movi_tl(s->T0, next_eip);
-            gen_push_v(s, s->T0);
+            gen_push_v(s, eip_next_tl(s));
             gen_bnd_jmp(s);
             gen_jmp(s, tval);
         }
@@ -7261,8 +7264,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             TCGLabel *l1, *l2, *l3;
 
             tval = (int8_t)insn_get(env, s, MO_8);
-            next_eip = s->pc - s->cs_base;
-            tval += next_eip;
+            tval += s->pc - s->cs_base;
             if (dflag == MO_16) {
                 tval &= 0xffff;
             }
-- 
2.34.1


