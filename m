Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F196F5AE5F5
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:54:15 +0200 (CEST)
Received: from localhost ([::1]:36666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWDf-0005CF-0Y
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:54:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWj-0000EC-6w
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWh-0003bN-I6
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id b16so14658534wru.7
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DsiG/W3NC5KvRWq7OQV8rlvT3xeYxHGERpFwH0qGMXk=;
 b=KlfRgnerrBAK2x2wp5+aHxCTu3RLs94kPjAVLmZra+EJnGjG7l29o4XwIFMxzgY1/e
 OrQvYpR94cFkcb9czqRVU1XXU1L2m+tOxaSOz67kSRAVNvHw82SYkYD07xpBgIy1dOn5
 GkZAkoKNrlmUpJqDY8y1rYW/xED/s35OyShu2rtAh3O9/B9d9viC4PgLeM8PVTDjD/YC
 QedixIZtZxApBZou+k/1MYIzRMwi5P+VNPmn2NRYzFqZ1SwPQtegjEjxW6UelbNYxmyv
 awrr6GXe6o3sD39sRFXyjayo40PE5NMrqC2kuvJclCCAiRayDAen+P+Ppn/hwaRciVVh
 Lghw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DsiG/W3NC5KvRWq7OQV8rlvT3xeYxHGERpFwH0qGMXk=;
 b=lt7AksVZUXLm5AsfCZgNIAUNzUNrT8AEenxayuMAyUXr24v5gOVWSOtow7J9PYSRdR
 jgr3+KSwQfn/R0xnqcDXRQFcxkNCeUqtA7amkvX7w65raCi66ig9jZKuEYaRPrsvCvTv
 BS47NP6BJrldHjm05hHAM2sSinDPLcl9MpK2k3zBKM/7b+qqFddiSshcvnyvX/V5qOC+
 IsFwfI0WcBBbgXlJ1yxdw+6Sqh8D7RA/dGwnqu7923sKWKmp9L5bV2o2+GTjy/IdiYpx
 HRSqckwz6sAEGqLVv/8mYkEsxhGWKXtXa4UNhrB+u6t69c1SuhcNHxB3l8hry1rdBHHs
 Zu0w==
X-Gm-Message-State: ACgBeo2kG+blridcCALy9GdNIedSy6U+vunvSz/kWzEW6XSTK4DT0QM/
 VcjmVfFMFUEQPKDJIA3iZSyktOxydFvTll0H
X-Google-Smtp-Source: AA6agR4oqcWS/1WnLYO3EGXGhA8Z6WJBp2cGZEaC9NUiiwG16vwtBKNISkJohYDzoUvmIKPadFes/w==
X-Received: by 2002:a5d:52d0:0:b0:21e:4923:fa09 with SMTP id
 r16-20020a5d52d0000000b0021e4923fa09mr27395672wrv.244.1662458989062; 
 Tue, 06 Sep 2022 03:09:49 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 15/23] target/i386: Create eip_next_*
Date: Tue,  6 Sep 2022 11:09:24 +0100
Message-Id: <20220906100932.343523-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x434.google.com
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
index 427ee72442..527fb79895 100644
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
@@ -5280,9 +5287,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -5298,14 +5303,14 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -5328,7 +5333,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (PE(s) && !VM86(s)) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ljmp_protected(cpu_env, s->tmp2_i32, s->T1,
-                                          tcg_const_tl(s->pc - s->cs_base));
+                                          eip_next_tl(s));
             } else {
                 gen_op_movl_seg_T0_vm(s, R_CS);
                 gen_op_jmp_v(s->T1);
@@ -6819,8 +6824,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6832,15 +6837,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -7374,8 +7377,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


