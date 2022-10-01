Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D534F5F1CCA
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:33:01 +0200 (CEST)
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedY4-0006F4-Sj
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:33:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCQ-0003JY-8x
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:39 -0400
Received: from mail-qv1-xf30.google.com ([2607:f8b0:4864:20::f30]:40839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedCF-0003zX-JW
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:38 -0400
Received: by mail-qv1-xf30.google.com with SMTP id h10so2805337qvq.7
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=yUBX+GiCjhWeGfhxd+AJVciwu72rM90hc2ACBcF3wCA=;
 b=oMiFAh97TnoM56gQ6JzDl20HJWAeQhPsyhZqgdqOqGvqCHsc1C4Y3ACekBMzHI8r/8
 wXUzv5Dfppefq86rAMcyWGw9vsz1kIX3qzOdw99mxq34dAPq3SPc9QgO6b0+fzvmf9+d
 FJ+KshlVgNu9yqDUdWt4Hdd2HEPh+zSVCN3/AnzIVuJNIyRrPLF49IDXWs/qm7V1Hvx9
 6GhVd+qHr02RovakQDi4CN5Y4fyhvItc9pnT6wOdaP3o85YBxrTJloir567vAez2T51q
 hRh04pjgM49MCZBk3tdjmHIHegi52CRHCwERU7HznlDW2S507wuZmhjyXJz9kTlzH5Wd
 rZjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=yUBX+GiCjhWeGfhxd+AJVciwu72rM90hc2ACBcF3wCA=;
 b=yQm0wgbGhAMiIYxNE39wvK2Zw7OlNun3HPOsjpEc3z26w8lw7BXYBg3H83Jb4TmE+9
 0jRS03Ircle9V7mxlLBvqFXygpFPFpOSN4JZje4R1XM9Kpdz4c+eg3kXkQbMBORwG+Lr
 LTydOCz+tllmj+60z24ibWEcJd6/EFzQCL3Dq9QbSpq1S6uLxYRsZ+AmYYSr8rRRwmNR
 27J9dUeRHXM3EfwV711CbyoQEF7JJmk7UGtPEcHnwr5EOkZXjjicYzkyPO0VEDnI0p62
 cyZHbEbi3ekgIF48Qzdf4hTKaEoi3MhOrd6KHzuMHStlHf+7cjTBEN+3Xmx9/thk96xa
 zijQ==
X-Gm-Message-State: ACrzQf3fMm3kCNIihypElYlfKOFT0Ny6HdwOq5rArOvLSidW605OZy+I
 qu3h/kIpO85RDddkmYX+tYV5x/VuXuIt9vRf
X-Google-Smtp-Source: AMsMyM58Fw838zxYH5/7xZaHDzv/TruOtenoUol9yM78R3M0q6izS/TODtYNkUV043IAtALGuGqauQ==
X-Received: by 2002:a05:6214:21a9:b0:4aa:b0e6:c6f5 with SMTP id
 t9-20020a05621421a900b004aab0e6c6f5mr10782257qvc.19.1664633424264; 
 Sat, 01 Oct 2022 07:10:24 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v3 18/26] target/i386: Use gen_jmp_rel for loop, repz,
 jecxz insns
Date: Sat,  1 Oct 2022 07:09:27 -0700
Message-Id: <20221001140935.465607-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f30;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf30.google.com
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

With gen_jmp_rel, we may chain to the next tb instead of merely
writing to eip and exiting.  For repz, subtract cur_insn_len to
restart the current insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 36 +++++++++++++++---------------------
 1 file changed, 15 insertions(+), 21 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index ba1bd7c707..434a6ad6cd 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -224,9 +224,9 @@ STUB_HELPER(wrmsr, TCGv_env env)
 
 static void gen_eob(DisasContext *s);
 static void gen_jr(DisasContext *s);
-static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num);
+static void gen_jmp_rel_csize(DisasContext *s, int diff, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
 static void gen_exception_gpf(DisasContext *s);
 
@@ -1185,7 +1185,7 @@ static TCGLabel *gen_jz_ecx_string(DisasContext *s)
     TCGLabel *l2 = gen_new_label();
     gen_op_jnz_ecx(s, s->aflag, l1);
     gen_set_label(l2);
-    gen_jmp_tb(s, s->pc - s->cs_base, 1);
+    gen_jmp_rel_csize(s, 0, 1);
     gen_set_label(l1);
     return l2;
 }
@@ -1288,7 +1288,7 @@ static void gen_repz(DisasContext *s, MemOp ot,
     if (s->repz_opt) {
         gen_op_jz_ecx(s, s->aflag, l2);
     }
-    gen_jmp(s, s->base.pc_next - s->cs_base);
+    gen_jmp_rel_csize(s, -cur_insn_len(s), 0);
 }
 
 #define GEN_REPZ(op) \
@@ -1308,7 +1308,7 @@ static void gen_repz2(DisasContext *s, MemOp ot, int nz,
     if (s->repz_opt) {
         gen_op_jz_ecx(s, s->aflag, l2);
     }
-    gen_jmp(s, s->base.pc_next - s->cs_base);
+    gen_jmp_rel_csize(s, -cur_insn_len(s), 0);
 }
 
 #define GEN_REPZ2(op) \
@@ -2793,6 +2793,7 @@ static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num)
     }
 }
 
+/* Jump to eip+diff, truncating the result to OT. */
 static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
 {
     target_ulong dest = s->pc - s->cs_base + diff;
@@ -2808,9 +2809,11 @@ static void gen_jmp_rel(DisasContext *s, MemOp ot, int diff, int tb_num)
     gen_jmp_tb(s, dest, tb_num);
 }
 
-static void gen_jmp(DisasContext *s, target_ulong eip)
+/* Jump to eip+diff, truncating to the current code size. */
+static void gen_jmp_rel_csize(DisasContext *s, int diff, int tb_num)
 {
-    gen_jmp_tb(s, eip, 0);
+    /* CODE64 ignores the OT argument, so we need not consider it. */
+    gen_jmp_rel(s, CODE32(s) ? MO_32 : MO_16, diff, tb_num);
 }
 
 static inline void gen_ldq_env_A0(DisasContext *s, int offset)
@@ -7404,24 +7407,18 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
     case 0xe2: /* loop */
     case 0xe3: /* jecxz */
         {
-            TCGLabel *l1, *l2, *l3;
-
-            tval = (int8_t)insn_get(env, s, MO_8);
-            tval += s->pc - s->cs_base;
-            if (dflag == MO_16) {
-                tval &= 0xffff;
-            }
+            TCGLabel *l1, *l2;
+            int diff = (int8_t)insn_get(env, s, MO_8);
 
             l1 = gen_new_label();
             l2 = gen_new_label();
-            l3 = gen_new_label();
             gen_update_cc_op(s);
             b &= 3;
             switch(b) {
             case 0: /* loopnz */
             case 1: /* loopz */
                 gen_op_add_reg_im(s, s->aflag, R_ECX, -1);
-                gen_op_jz_ecx(s, s->aflag, l3);
+                gen_op_jz_ecx(s, s->aflag, l2);
                 gen_jcc1(s, (JCC_Z << 1) | (b ^ 1), l1);
                 break;
             case 2: /* loop */
@@ -7434,14 +7431,11 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
                 break;
             }
 
-            gen_set_label(l3);
-            gen_update_eip_next(s);
-            tcg_gen_br(l2);
+            gen_set_label(l2);
+            gen_jmp_rel_csize(s, 0, 1);
 
             gen_set_label(l1);
-            gen_jmp_im(s, tval);
-            gen_set_label(l2);
-            s->base.is_jmp = DISAS_EOB_ONLY;
+            gen_jmp_rel(s, dflag, diff, 0);
         }
         break;
     case 0x130: /* wrmsr */
-- 
2.34.1


