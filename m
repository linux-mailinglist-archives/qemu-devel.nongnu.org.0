Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F27F55F1CCE
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:35:10 +0200 (CEST)
Received: from localhost ([::1]:50366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oeda9-0000jJ-Vv
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:35:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedC7-00034J-LP
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:19 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:33586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedC5-0004F7-TV
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:19 -0400
Received: by mail-qk1-x735.google.com with SMTP id h28so4429403qka.0
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=FYbyb3P7MQzycJWSUdzIEkO4+A5NeCGxIS9iNLSrvuo=;
 b=vwsUF6rmE83/tkWPHByYzr7WrIVsvhfT7/JhC3Cy9W8vhthnyipB2Ugzm9X129EqCz
 H80r9VB/mCvicKCP6hl6a7QvLgdAsOkrBigZa1UH1RuYZLp/xjT1b/jwzXWkK7mlLQT9
 swm5YvlbDVOT8ombqVEZqoMy+uZ5EjaYZJID95z0sv/+scj7IiQjxZKSsPV23loWZy5F
 THhqPp36L/tqpvdwUBkNB1OmnVHmScIE7Y8l2MiYf1i85V0lU70xsxM1PkWWtflZOnoQ
 igsPTIEbvj8OwsLxD+i0MT3/FRc8e+KUucgIwdHXEkcVdw7zdxD0LH05H8HdUkHNWejp
 dSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=FYbyb3P7MQzycJWSUdzIEkO4+A5NeCGxIS9iNLSrvuo=;
 b=vHsMkAxSnzxp8L07BBAf21vcTK6eYgKACc9hgN47sW2gVhM/MsJmx96KMvLFQGDmdS
 XEaC3SaPPoXZZftMbRC4FpImSVJmFvbf6vjYvU89AnatN/APKMWnGJrxx3nZEX7Vm1KU
 YYbiN65HK6eX6sJ2jy8WsfjZdwBwHhgFPJy7YDWnnFmXprrGV0REXpI/B6BEI/KMR387
 Tb4p0KrsfNzR0UbTBKKXYm3L3NWzq0+gjHw3t3W+9DE+xQQR9pwbJKQkHtyilEv+L2jP
 hdTlCuedSVLfOo4rnI6kF0077A2hBtgEzcqlOeuKs73d+IwQsvRsvTmVmgTlui3Shu9V
 o0Ww==
X-Gm-Message-State: ACrzQf0xYvVhZpXSFwja99/F2l1M1rPyhS5QJTRo/JyHboM8QDIpzk5+
 JUyOCvKiUAdHPhPrMCtqaBePYeQQnwfgj6As
X-Google-Smtp-Source: AMsMyM6ByPQtJT1Zvss5V137diBbiFEGxuJoKSxOt2fEKUgK4mDYMKqC1ayN7unpGaftayXqTTLFgA==
X-Received: by 2002:a05:620a:4052:b0:6ce:d5bc:a905 with SMTP id
 i18-20020a05620a405200b006ced5bca905mr9606260qko.629.1664633417031; 
 Sat, 01 Oct 2022 07:10:17 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 15/26] target/i386: Create eip_next_*
Date: Sat,  1 Oct 2022 07:09:24 -0700
Message-Id: <20221001140935.465607-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create helpers for loading the address of the next insn.
Use tcg_constant_* in adjacent code where convenient.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 55 +++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 1aa5b37ea6..be29ea7a03 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -541,6 +541,27 @@ static TCGv_i32 cur_insn_len_i32(DisasContext *s)
     return tcg_constant_i32(cur_insn_len(s));
 }
 
+static TCGv_i32 eip_next_i32(DisasContext *s)
+{
+    /*
+     * This function has two users: lcall_real (always 16-bit mode), and
+     * iret_protected (16, 32, or 64-bit mode).  IRET only uses the value
+     * when EFLAGS.NT is set, which is illegal in 64-bit mode, which is
+     * why passing a 32-bit value isn't broken.  To avoid using this where
+     * we shouldn't, return -1 in 64-bit mode so that execution goes into
+     * the weeds quickly.
+     */
+    if (CODE64(s)) {
+        return tcg_constant_i32(-1);
+    }
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
@@ -1213,12 +1234,9 @@ static void gen_bpt_io(DisasContext *s, TCGv_i32 t_port, int ot)
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
@@ -5324,9 +5342,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -5342,14 +5358,14 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -5372,7 +5388,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             if (PE(s) && !VM86(s)) {
                 tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
                 gen_helper_ljmp_protected(cpu_env, s->tmp2_i32, s->T1,
-                                          tcg_const_tl(s->pc - s->cs_base));
+                                          eip_next_tl(s));
             } else {
                 gen_op_movl_seg_T0_vm(s, R_CS);
                 gen_op_jmp_v(s->T1);
@@ -6854,8 +6870,8 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -6867,15 +6883,13 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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
@@ -7409,8 +7423,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


