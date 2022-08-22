Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A5959CCC1
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 02:05:49 +0200 (CEST)
Received: from localhost ([::1]:39700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHQS-0006Fu-QH
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 20:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvb-0006AP-Si
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:57 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40909)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-0007H7-AG
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:54 -0400
Received: by mail-pg1-x52c.google.com with SMTP id w13so5685527pgq.7
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=StqOv8lM7EsBPsIyrOVv+mUXMeqQOE/sW2DxFQvSCeI=;
 b=aIzOR5Qb0GeCtNLKCDsWMRL65pD5AqF8HaC1xEONBY7HzMnV6PxDKIpTWhlB1+YvoU
 ZeImsWMQte2krtVF2kIn6PLDryxzQiw+qU7MxCw4NM9kiK5Q3HdFjqKNUTUx/npnuE3e
 h4L/BPErFVeDGd/HiX0Jl+yiIFBb/Wsj4n02DTBYjv5CE0VhqmsP7+AzAINBkYktgyse
 8NOMQLh8ofTDoqVbvac8NtreY/sMuN/I8kK4V4kTrASpEquPw1ZhPg1/lNCbYf4ipSX8
 QZhUwtwHmtU+UYnsmFD9r0YlrkohzHxBQ8KbIY2dSHhQOdp+6koXcS8oM34m1uuNJBKO
 Eygw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=StqOv8lM7EsBPsIyrOVv+mUXMeqQOE/sW2DxFQvSCeI=;
 b=BrW+Bddw/HjJc5i2wTPo08AtTTxdCnJTW9ipdHSbDb2ubrIZuwZ5fS2BrutF2M5fr2
 tvUubK1JUNAET5mjUczjo3cFPkM8J4Nf/MJVkeXqlSEvZnX3+8HgFbnhjCMFScdqQiaT
 NcEBHUd0l5G9Qx02tBNshbL4cUWEwZXknPlKWYdr391p/cKtucl2LLF2qFiFg9MYxB0D
 Q8PzEG16T6kYqrxK3RRn3jzGv+rOI1tgWM57+CJX3h9IgqobgK9tNeSST3KEecS7Ooqi
 QDHPFwCS+NdZzKkQSvDPk15jvRcXdzr06mdxycYDLMiU3+AozAxKftK8wEN22TWCDS/v
 vYVA==
X-Gm-Message-State: ACgBeo1Y0WeqAqM1OfQZPNl213nwD0rqxbSLWlpP7+nlJRwZbCWjghmz
 xXBwReg/Fn9iWWfid4OkQXrfOxBZIYOwxw==
X-Google-Smtp-Source: AA6agR7PaMHlyiORxL6zfss6OQPfIEfTqsOnNeEKsJ4oxxr6T9bE9AUDJiHa7J4NTUjIPT1oTTH1+g==
X-Received: by 2002:a05:6a00:c96:b0:52e:979c:dd63 with SMTP id
 a22-20020a056a000c9600b0052e979cdd63mr23123909pfv.50.1661211215360; 
 Mon, 22 Aug 2022 16:33:35 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.34
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/22] target/i386: Introduce DISAS_JUMP
Date: Mon, 22 Aug 2022 16:33:08 -0700
Message-Id: <20220822233318.1728621-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
index 38f4589fd2..367a7a335a 100644
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
@@ -5171,7 +5172,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_push_v(s, s->T1);
             gen_op_jmp_v(s->T0);
             gen_bnd_jmp(s);
-            gen_jr(s, s->T0);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 3: /* lcall Ev */
             if (mod == 3) {
@@ -5192,8 +5193,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                                       tcg_const_i32(dflag - 1),
                                       tcg_const_i32(s->pc - s->cs_base));
             }
-            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
-            gen_jr(s, s->tmp4);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 4: /* jmp Ev */
             if (dflag == MO_16) {
@@ -5201,7 +5201,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_op_jmp_v(s->T0);
             gen_bnd_jmp(s);
-            gen_jr(s, s->T0);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 5: /* ljmp Ev */
             if (mod == 3) {
@@ -5219,8 +5219,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 gen_op_movl_seg_T0_vm(s, R_CS);
                 gen_op_jmp_v(s->T1);
             }
-            tcg_gen_ld_tl(s->tmp4, cpu_env, offsetof(CPUX86State, eip));
-            gen_jr(s, s->tmp4);
+            s->base.is_jmp = DISAS_JUMP;
             break;
         case 6: /* push Ev */
             gen_push_v(s, s->T0);
@@ -6660,7 +6659,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(s->T0);
         gen_bnd_jmp(s);
-        gen_jr(s, s->T0);
+        s->base.is_jmp = DISAS_JUMP;
         break;
     case 0xc3: /* ret */
         ot = gen_pop_T0(s);
@@ -6668,7 +6667,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* Note that gen_pop_T0 uses a zero-extending load.  */
         gen_op_jmp_v(s->T0);
         gen_bnd_jmp(s);
-        gen_jr(s, s->T0);
+        s->base.is_jmp = DISAS_JUMP;
         break;
     case 0xca: /* lret im */
         val = x86_ldsw_code(env, s);
@@ -8698,6 +8697,9 @@ static void i386_tr_tb_stop(DisasContextBase *dcbase, CPUState *cpu)
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


