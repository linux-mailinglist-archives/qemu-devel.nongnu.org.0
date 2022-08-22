Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD80459CC90
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 01:55:57 +0200 (CEST)
Received: from localhost ([::1]:53610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQHGu-0007Dx-St
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 19:55:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvW-00069b-Ge
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:51 -0400
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f]:35415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQGvF-0007FB-FH
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 19:33:35 -0400
Received: by mail-pg1-x52f.google.com with SMTP id r69so10781228pgr.2
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 16:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc;
 bh=+OJB/KgYLATLASrlEThWGbrHHghDFAhGZdOzeh5O3nA=;
 b=xLtk26nh/DujLrPeyWNtLD4Nd3B5S7lGt8a2bX8GLDqctGEfJRW2+3hvlpLNj4UFh4
 gq7Lqp1x9P+Sk8s5iGwFmzDltytaUklPL9t4HM1WHr56Tn4ODYkrgGleZ1aCDuYovZK3
 6Sg5hnBUMtvlgUBxGjqIc+NXQ5kJPJXiuo2VGg28K8bJ+pN6wHNIJQVT4iEDgMoWUhNu
 k2YHKR1jDR9gSTJAHWn+2XdtUci6hlHYcxErpJlAz/EW7oGj4qDw6N+ToxNMxGyeeMpG
 1ybBFjoIOQER61nR4q2EQLrwsN6EUEw0zVqhF6HFqgBz4JaOFkESHQiRZ3opjDSl6oJ0
 DIig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
 bh=+OJB/KgYLATLASrlEThWGbrHHghDFAhGZdOzeh5O3nA=;
 b=pEXf1iSvqaMGuXRiYTR+0Q1CLkaI15wFUyarm7G23676jBMNOXKC7ySwYEmEPy43hK
 mhAKRwMtgRkU0JfctLuwTLK8H4rFBz1h4sp691i3rfznMfdsWtJeOrq6gi+uUYnP3U6I
 kXUwJMgpSE0pL/dnVAdm7sxq9pAOqN8lHEByCNnE7Huv+rnPxJQi9sOwkdg9u8Vbkd/x
 NbbcLGYBWzA4bXJO2ZcimSMVOtmflC3dbdzHy7Z6Hm6dxT6jhul5JdacoByt5SVTSUHk
 b2Vb1l2ulvnFGt4JlTOy3Lv3I4nRTas1iqER9LNif5oUMtrLtw0ypJK/l5fWdrD9nmMk
 Lw9Q==
X-Gm-Message-State: ACgBeo10PDWzirgyE8Wxzpv5p4OIWygm16oj8pMitzvJnPVNtzjpVQfr
 9k8tsDNWXWeddSEUoKHOAz/XqgOk/Wp2yQ==
X-Google-Smtp-Source: AA6agR4Jx5gdywYpBcakG3AzkBZuSgkl/yA7h6uGFdaPoRY+/1EM2s7cXuvPymZ3HJi+E8LeXKwywg==
X-Received: by 2002:a65:6048:0:b0:412:73c7:cca9 with SMTP id
 a8-20020a656048000000b0041273c7cca9mr19112568pgp.257.1661211212591; 
 Mon, 22 Aug 2022 16:33:32 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:c3f1:b74f:5edd:63af])
 by smtp.gmail.com with ESMTPSA id
 82-20020a621555000000b0053655af14easm5133124pfv.45.2022.08.22.16.33.31
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Aug 2022 16:33:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/22] target/i386: Create cur_insn_len, cur_insn_len_i32
Date: Mon, 22 Aug 2022 16:33:06 -0700
Message-Id: <20220822233318.1728621-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220822233318.1728621-1-richard.henderson@linaro.org>
References: <20220822233318.1728621-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52f.google.com
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

Create common routines for computing the length of the insn.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 1dc3ff67ae..ee8e87a617 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -530,6 +530,16 @@ static void gen_update_eip_next(DisasContext *s)
     gen_jmp_im(s, s->pc - s->cs_base);
 }
 
+static int cur_insn_len(DisasContext *s)
+{
+    return s->pc - s->base.pc_next;
+}
+
+static TCGv_i32 cur_insn_len_i32(DisasContext *s)
+{
+    return tcg_constant_i32(cur_insn_len(s));
+}
+
 /* Compute SEG:REG into A0.  SEG is selected from the override segment
    (OVR_SEG) and the default segment (DEF_SEG).  OVR_SEG may be -1 to
    indicate no override.  */
@@ -712,9 +722,6 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
         gen_helper_check_io(cpu_env, port, tcg_constant_i32(1 << ot));
     }
     if (GUEST(s)) {
-        target_ulong cur_eip = s->base.pc_next - s->cs_base;
-        target_ulong next_eip = s->pc - s->cs_base;
-
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
         if (s->prefix & (PREFIX_REPZ | PREFIX_REPNZ)) {
@@ -723,7 +730,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
         svm_flags |= 1 << (SVM_IOIO_SIZE_SHIFT + ot);
         gen_helper_svm_check_io(cpu_env, port,
                                 tcg_constant_i32(svm_flags),
-                                tcg_constant_i32(next_eip - cur_eip));
+                                cur_insn_len_i32(s));
     }
     return true;
 #endif
@@ -2028,7 +2035,7 @@ static uint64_t advance_pc(CPUX86State *env, DisasContext *s, int num_bytes)
     }
 
     s->pc += num_bytes;
-    if (unlikely(s->pc - s->base.pc_next > X86_MAX_INSN_LENGTH)) {
+    if (unlikely(cur_insn_len(s) > X86_MAX_INSN_LENGTH)) {
         /* If the instruction's 16th byte is on a different page than the 1st, a
          * page fault on the second page wins over the general protection fault
          * caused by the instruction being too long.
@@ -2622,7 +2629,7 @@ static void gen_interrupt(DisasContext *s, int intno)
     gen_update_cc_op(s);
     gen_update_eip_cur(s);
     gen_helper_raise_interrupt(cpu_env, tcg_constant_i32(intno),
-                               tcg_constant_i32(s->pc - s->base.pc_next));
+                               cur_insn_len_i32(s));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -7166,7 +7173,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (prefixes & PREFIX_REPZ) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_pause(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7192,7 +7199,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
-        gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+        gen_helper_into(cpu_env, cur_insn_len_i32(s));
         break;
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
@@ -7351,7 +7358,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* XXX: is it usable in real mode ? */
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
-        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+        gen_helper_syscall(cpu_env, cur_insn_len_i32(s));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
            generated after one has entered CPL0 if TF is set in FMASK.  */
@@ -7383,7 +7390,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_hlt(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7492,7 +7499,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_mwait(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
             break;
 
@@ -7568,7 +7575,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
             gen_helper_vmrun(cpu_env, tcg_const_i32(s->aflag - 1),
-                             tcg_const_i32(s->pc - s->base.pc_next));
+                             cur_insn_len_i32(s));
             tcg_gen_exit_tb(NULL, 0);
             s->base.is_jmp = DISAS_NORETURN;
             break;
-- 
2.34.1


