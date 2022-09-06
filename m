Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F332C5AE699
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 13:29:48 +0200 (CEST)
Received: from localhost ([::1]:47046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWm4-00021L-12
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 07:29:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWh-0000D3-0T
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:51 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWd-0003ap-TA
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:50 -0400
Received: by mail-wr1-x430.google.com with SMTP id bz13so11245730wrb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=d8ffsVZkLEZvnlAE0C/NKDkyUKVmXsiu73u3Z9HHWRQ=;
 b=suRtMRUkU0dTblvq742cGnhsU8oVAudfjxGzcKKbp1JamxiUBTVkoYi2lh1lXFcPJ9
 Sug+4bRJeVnJjfyMm/2IlatZ584YBUVCN1W7FXP9dut/MuHAFkhW+prpPM/5PcS5mbcB
 QdyxJssMv/uFDG7Yt87aut3UDJVUFJ9VKV+PXPkxIa33Cc1ZIhBhGnjXXB20PtU7zgDT
 99pCKJ4fpEmaONShJbloBnxWhK6pvirnHhzWlnY6cEOe/03jtbwE126prVa8PNiVSsVw
 7fRa6qZDIhSJFRved3uMTMUKQIPi/AQ9jNIEzJbrHBwpYLvs4A0uGBBrhxDtxa0XU6oE
 rRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=d8ffsVZkLEZvnlAE0C/NKDkyUKVmXsiu73u3Z9HHWRQ=;
 b=ITrmOgAlBzzYIJIq66EiGfOYd47wFfoH5M6bjw4fF/iM5RXJQatYIkEZlctJm+D7Oj
 Mx5tkzBZUCqT4KjLG07OIE8x/Fdgn4JtijDAjq8iJ+TuYFslO1yKhlmrh6CpX9jgbsin
 B125vnR1VRYz4dxty8Xn6f9vjOGi82Yf7k/oeeNDYzFexNmjgQ7eAZLO65dnj7vVqQUE
 qqkPoljXtxqCIHTPSlBSk0Sq/9sdysXV2zO2h4FTOj/Yqb431661yBOd4m/jSir9IZxB
 WgWjyGiJ7/Bss8cwlFMop5N5C17Nk+NQAXOJu8Zc6s+BRZR4tX4RXy+GZ1J4ZvafIbzb
 lAJQ==
X-Gm-Message-State: ACgBeo2YZrt6+q9PYAW+CRti7dTvK/8CalvY45Y4hdEi0pGxArl2R/Rs
 YoZI5fY6T7cVl3+7e9b/E5RqB5rPsqkmif/A
X-Google-Smtp-Source: AA6agR4wmjA4Y8+Jk+Eo1ixd8RsYEb5CUN6qOMq1oJYH0HITaG+PxQwohNgfPTHphZCDnLKOhpWz5g==
X-Received: by 2002:adf:fbc7:0:b0:220:6004:18ca with SMTP id
 d7-20020adffbc7000000b00220600418camr25957334wrs.632.1662458986542; 
 Tue, 06 Sep 2022 03:09:46 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:46 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 13/23] target/i386: Introduce DISAS_JUMP
Date: Tue,  6 Sep 2022 11:09:22 +0100
Message-Id: <20220906100932.343523-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x430.google.com
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

Drop the unused dest argument to gen_jr().
Remove most of the calls to gen_jr, and use DISAS_JUMP.
Remove some unused loads of eip for lcall and ljmp.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index f3c26a9956..1997f8d291 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -135,6 +135,7 @@ typedef struct DisasContext {
 #define DISAS_EOB_ONLY         DISAS_TARGET_0
 #define DISAS_EOB_NEXT         DISAS_TARGET_1
 #define DISAS_EOB_INHIBIT_IRQ  DISAS_TARGET_2
+#define DISAS_JUMP             DISAS_TARGET_3
 
 /* The environment in which user-only runs is constrained. */
 #ifdef CONFIG_USER_ONLY
@@ -222,7 +223,7 @@ STUB_HELPER(wrmsr, TCGv_env env)
 #endif
 
 static void gen_eob(DisasContext *s);
-static void gen_jr(DisasContext *s, TCGv dest);
+static void gen_jr(DisasContext *s);
 static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
@@ -2360,7 +2361,7 @@ static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
     } else {
         /* jump to another page */
         gen_jmp_im(s, eip);
-        gen_jr(s, s->tmp0);
+        gen_jr(s);
     }
 }
 
@@ -2729,7 +2730,7 @@ static void gen_eob(DisasContext *s)
 }
 
 /* Jump to register */
-static void gen_jr(DisasContext *s, TCGv dest)
+static void gen_jr(DisasContext *s)
 {
     do_gen_eob_worker(s, false, false, true);
 }
@@ -5284,7 +5285,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_push_v(s, s->T1);
             gen_op_jmp_v(s->T0);
             gen_bnd_jmp(s);
-            gen_jr(s, s->T0);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 3: /* lcall Ev */
             if (mod == 3) {
@@ -5305,8 +5306,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                       tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
-            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
-            gen_jr(s, s->tmp4);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 4: /* jmp Ev */
             if (dflag == MO_16) {
@@ -5314,7 +5314,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_op_jmp_v(s->T0);
             gen_bnd_jmp(s);
-            gen_jr(s, s->T0);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 5: /* ljmp Ev */
             if (mod == 3) {
@@ -5332,8 +5332,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_movl_seg_T0_vm(s, R_CS);
                 gen_op_jmp_v(s->T1);
             }
-            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
-            gen_jr(s, s->tmp4);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 6: /* push Ev */
             gen_push_v(s, s->T0);
@@ -6773,7 +6772,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(s->T0);
         gen_bnd_jmp(s);
-        gen_jr(s, s->T0);
+        s->base.is_jmp = DISAS_JUMP;
         break;
     case 0xc3: /* ret */
         ot = gen_pop_T0(s);
@@ -6781,7 +6780,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(s->T0);
         gen_bnd_jmp(s);
-        gen_jr(s, s->T0);
+        s->base.is_jmp = DISAS_JUMP;
         break;
     case 0xca: /* lret im */
         val = x86_ldsw_code(env, s);
@@ -8811,6 +8810,9 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
         gen_update_eip_cur(dc);
         gen_eob_inhibit_irq(dc, true);
         break;
+    case DISAS_JUMP:
+        gen_jr(dc);
+        break;
     default:
         g_assert_not_reached();
     }
-- 
2.34.1


