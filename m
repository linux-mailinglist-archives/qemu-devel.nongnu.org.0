Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C065F1CE0
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:37:32 +0200 (CEST)
Received: from localhost ([::1]:42112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedcR-000554-Ct
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:37:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCA-0003Aw-D6
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:25 -0400
Received: from mail-qk1-x730.google.com ([2607:f8b0:4864:20::730]:45601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedC8-0004G7-LA
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:22 -0400
Received: by mail-qk1-x730.google.com with SMTP id i17so4401822qkk.12
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=7viKvjcXaJUmhs/jWaqdA+F5KcYGZ9/wwoS7PEa0LGk=;
 b=xlu/zBoerwn3J0ipLwfI88KsTRacDBFIYJMTM+HCyp6Sxfx60xRt3WX8Ld2AgNttTj
 610E7ZZv7D7M/aOGv1Mt49ostMIv4Ges4IDod9We6QO5UxkC2oo/OOQ52V7U8Tb9M9z6
 98O0Z0k9q/hwjbxT5SstM8gDdTQIQUbJuOm3k02aiQLt25/NDpJycNHrrHoX/5ru9b9S
 zMt/At0L20JNCpjzkXd0NaltpZ7CvSHqz5Vu6e1GaajFFqee1UEycI6XxQcB6abp8Zbq
 fkq9M7lYLkb1JwXlt1lacM4V0kvsszP9rKC/gCzU5qYsM4cknHtwSqL2caqKj/+Z9pr7
 qQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7viKvjcXaJUmhs/jWaqdA+F5KcYGZ9/wwoS7PEa0LGk=;
 b=pPM8beKp8MQyNIDi/nI9Bg/L9iVkK52bDuZsZdSL8BijbhK76t+ho9pIBZhbEL+22a
 isnwHdr/LjAF03rSMVUwg4AwKFmwFItWJSnpYT7HO6zyyUOQm8vmro3gMfA7Q46ApCNf
 d+CD4Rz9Da2qbW9oSIPhviYOPSkphWmq1itGbiJFN3tJcCQMzsebahagdTAdAIzsOQ+6
 j6xTMcDD8+k3kN7WtZY4L9JxftCx/l4nwIy3WEHuXn0lyzONDfvOebYEBlgMQGB/IgoD
 ZI/VzcB5E1MVLDG4y4fLCGzHQ5cPbcJkQlA6zwLN1NjmfChWV4P0OH9SByAT2n6NVhcs
 kDQQ==
X-Gm-Message-State: ACrzQf1PhxeHXxhGAAtwv9YI6ZP621Er4mdp6GvgC7xMJdRS30mtstaf
 HI2MCDDNbKc5FkaM8J3TJgURG1lGp4WYgx1g
X-Google-Smtp-Source: AMsMyM6kRBt2zLwf0KrX6dcSXqlWfPlfJx9bsTAKw97w8NC914BO+GQxYqgRnEaDI/YOfwIxMikNig==
X-Received: by 2002:a37:5343:0:b0:6cf:9ee8:7cda with SMTP id
 h64-20020a375343000000b006cf9ee87cdamr9366003qkb.528.1664633419758; 
 Sat, 01 Oct 2022 07:10:19 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 16/26] target/i386: Use DISAS_TOO_MANY to exit after
 gen_io_start
Date: Sat,  1 Oct 2022 07:09:25 -0700
Message-Id: <20221001140935.465607-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::730;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x730.google.com
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

We can set is_jmp early, using only one if, and let that
be overwritten by gen_rep*'s calls to gen_jmp_tb.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 42 +++++++++----------------------------
 1 file changed, 10 insertions(+), 32 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index be29ea7a03..11aaba8a65 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5660,14 +5660,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
+                s->base.is_jmp = DISAS_TOO_MANY;
             }
             gen_helper_rdrand(s->T0, cpu_env);
             rm = (modrm & 7) | REX_B(s);
             gen_op_mov_reg_v(s, dflag, rm, s->T0);
             set_cc_op(s, CC_OP_EFLAGS);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
             break;
 
         default:
@@ -6704,15 +6702,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_ins(s, ot);
-            /* jump generated by gen_repz_ins */
         } else {
             gen_ins(s, ot);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
         }
         break;
     case 0x6e: /* outsS */
@@ -6725,15 +6720,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         if (prefixes & (PREFIX_REPZ | PREFIX_REPNZ)) {
             gen_repz_outs(s, ot);
-            /* jump generated by gen_repz_outs */
         } else {
             gen_outs(s, ot);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
         }
         break;
 
@@ -6750,13 +6742,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0xe6:
     case 0xe7:
@@ -6768,14 +6758,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0xec:
     case 0xed:
@@ -6787,13 +6775,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0xee:
     case 0xef:
@@ -6805,14 +6791,12 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
 
         /************************/
@@ -7478,11 +7462,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         gen_update_eip_cur(s);
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         gen_helper_rdtsc(cpu_env);
-        if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-            gen_jmp(s, s->pc - s->cs_base);
-        }
         break;
     case 0x133: /* rdpmc */
         gen_update_cc_op(s);
@@ -7939,11 +7921,9 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_update_eip_cur(s);
             if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
                 gen_io_start();
+                s->base.is_jmp = DISAS_TOO_MANY;
             }
             gen_helper_rdtscp(cpu_env);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
             break;
 
         default:
@@ -8307,6 +8287,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
 
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
+            s->base.is_jmp = DISAS_TOO_MANY;
         }
         if (b & 2) {
             gen_svm_check_intercept(s, SVM_EXIT_WRITE_CR0 + reg);
@@ -8317,9 +8298,6 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_svm_check_intercept(s, SVM_EXIT_READ_CR0 + reg);
             gen_helper_read_crN(s->T0, cpu_env, tcg_constant_i32(reg));
             gen_op_mov_reg_v(s, ot, rm, s->T0);
-            if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
-                gen_jmp(s, s->pc - s->cs_base);
-            }
         }
         break;
 
-- 
2.34.1


