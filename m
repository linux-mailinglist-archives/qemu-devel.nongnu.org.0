Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6964B5F1CB6
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:26:13 +0200 (CEST)
Received: from localhost ([::1]:35334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedRU-0003E0-H1
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:26:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedC4-0002tT-U9
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:16 -0400
Received: from mail-qk1-x731.google.com ([2607:f8b0:4864:20::731]:36819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedC1-0003zL-6w
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:16 -0400
Received: by mail-qk1-x731.google.com with SMTP id i3so4421508qkl.3
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=pntBHSAnX5mi4oiOai+36DUHzxSYy9nHpLFFCxW4XJ8=;
 b=z8Rcwo+cDzgURV5AginvEgAReYCANnWP+DeBX8o1Vfo0lu9cI6eCF7xy3QCXPImgmT
 RDP/58OlNny6+UngdxLRdRvylbV7YTjGE3BxYlTRYv37sxChEGooEGJnRguoOW1hIj8G
 MmPVZPIQIVNztfx+C7wU5aBQ51yiD5J3ZEktzkmAHLLZxFqnDaYvznoLuASvVo8mDXfd
 tI9XfKwel45OLfMaUB62QtUl1j4TMdZw85DDa+vlC4QI1ZczFnaAAB7M5sX4N+Mii1iq
 suRuemM5Qgm5qD9YdBe7ISKYKCOcYYtB/7K2HwR7sYFwTlXCoCvJRiZrkDAq5dm/sVT6
 Xpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=pntBHSAnX5mi4oiOai+36DUHzxSYy9nHpLFFCxW4XJ8=;
 b=U84yzB7XgVM7sS6zNQFxQv0AiAwmADn6vm2020s2uHf+bSxHjImqA7XzdFGSvP6tGE
 Y+1SCVH3D0mScD7+teXoi6hFXCHGfUmWMoQCPbhK8bw4D3khtzoMfPaIWP7/nJen/G1P
 ZU7pG9qiF1/6raiovx5VQd5p2BEwHnjfcoYX72BIVyVr6M/xjYFo7eLZuV2nJwk2oYG7
 22rfyjPpeRkT9C+p89s3z3NLbQrWrHwEW6ObPHYRHCmutE0m2HzESUoLuWVj1LR+NiRx
 o8IrDy9O6qbtB6I7V51bGM/xT1ThM/NyfhEz07f9YxGQaRbaKPFi1ugZWNmso8SJ2jLp
 G4pg==
X-Gm-Message-State: ACrzQf3VGXwTW5dbJpzDo+hJhx1hPhtkVHMEGCQ7OfEzMhw+tJlG5w59
 drDDV3rVxgZHAt4zyESloSebAJPfnUsDRI8J
X-Google-Smtp-Source: AMsMyM4j2xEMW7NBWeeEiePx2yGLjTrMsKuILJfx99UC0O9hUEuN8x6qCReK/D36XSlhBaKBwBBM7w==
X-Received: by 2002:a05:620a:29cf:b0:6d3:2762:57e5 with SMTP id
 s15-20020a05620a29cf00b006d3276257e5mr2799300qkp.389.1664633412552; 
 Sat, 01 Oct 2022 07:10:12 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 13/26] target/i386: Introduce DISAS_JUMP
Date: Sat,  1 Oct 2022 07:09:22 -0700
Message-Id: <20221001140935.465607-14-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::731;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x731.google.com
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

Drop the unused dest argument to gen_jr().
Remove most of the calls to gen_jr, and use DISAS_JUMP.
Remove some unused loads of eip for lcall and ljmp.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index c8ef9f0356..7db6f617a1 100644
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
@@ -2385,7 +2386,7 @@ static void gen_goto_tb(DisasContext *s, int tb_num, target_ulong eip)
     } else {
         /* jump to another page */
         gen_jmp_im(s, eip);
-        gen_jr(s, s->tmp0);
+        gen_jr(s);
     }
 }
 
@@ -2754,7 +2755,7 @@ static void gen_eob(DisasContext *s)
 }
 
 /* Jump to register */
-static void gen_jr(DisasContext *s, TCGv dest)
+static void gen_jr(DisasContext *s)
 {
     do_gen_eob_worker(s, false, false, true);
 }
@@ -5328,7 +5329,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_push_v(s, s->T1);
             gen_op_jmp_v(s->T0);
             gen_bnd_jmp(s);
-            gen_jr(s, s->T0);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 3: /* lcall Ev */
             if (mod == 3) {
@@ -5349,8 +5350,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                       tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
-            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
-            gen_jr(s, s->tmp4);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 4: /* jmp Ev */
             if (dflag == MO_16) {
@@ -5358,7 +5358,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_op_jmp_v(s->T0);
             gen_bnd_jmp(s);
-            gen_jr(s, s->T0);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 5: /* ljmp Ev */
             if (mod == 3) {
@@ -5376,8 +5376,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_movl_seg_T0_vm(s, R_CS);
                 gen_op_jmp_v(s->T1);
             }
-            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
-            gen_jr(s, s->tmp4);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 6: /* push Ev */
             gen_push_v(s, s->T0);
@@ -6808,7 +6807,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(s->T0);
         gen_bnd_jmp(s);
-        gen_jr(s, s->T0);
+        s->base.is_jmp = DISAS_JUMP;
         break;
     case 0xc3: /* ret */
         ot = gen_pop_T0(s);
@@ -6816,7 +6815,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(s->T0);
         gen_bnd_jmp(s);
-        gen_jr(s, s->T0);
+        s->base.is_jmp = DISAS_JUMP;
         break;
     case 0xca: /* lret im */
         val = x86_ldsw_code(env, s);
@@ -8846,6 +8845,9 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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


