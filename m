Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676A95F1CA9
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 16:22:58 +0200 (CEST)
Received: from localhost ([::1]:56386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oedOL-0007Xv-E6
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 10:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBx-0002kL-DJ
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:09 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:40665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oedBv-0004CP-Bh
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 10:10:09 -0400
Received: by mail-qt1-x82d.google.com with SMTP id cj27so4214564qtb.7
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 07:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=DTJJ71t7R1eHc1HKaFy+ccZJ8BDGeOHfxDTw9ANJp2I=;
 b=G35ehc9sfpLzSry3OR0MsQteGdRRXq50T2euKRm+XGO5kZE6rd2CWenf6kg69uV/0C
 p6hf/sRvW4eIaxNzziZopqgB+j5l1pbHreYNhnkaVXleMVbhbVJJOEFkRwMsZXb9P6PZ
 LEeUYecsXHbbJamLjnTBPEgq9xc7+yz77wv4DIZSMNuccy3IuJb6+BnSi0hI6GvZU3al
 YVzJaq8A1sROEhhnNgvZriNNK8uvL4znQVeGaSgMa6Odb4s1T69ZYe2k1u4HfCl5cQzX
 RTC+GlwRtSGN7yUpoqrhFe2WPchdvN2sX4cAvJwy7ObcFVl6FkV0wIcdFEKBDaL5gCFz
 YC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=DTJJ71t7R1eHc1HKaFy+ccZJ8BDGeOHfxDTw9ANJp2I=;
 b=XYftrFqu88B5AtufPrXcH97GaJI+lY3vYq+Rmy0OavgpTmquW2kRI3ZITAPIyNmhyT
 4AjwV5+tttPJ6xEps1lUdXKVRJIxlOrrxPI0Txh7wERazD/XHcCnEEp+Arq8dhKf/EHv
 OB9sic3Fk6LOeTtqGTNxvhv7XsuKuBn0bHXQnu7ogJ/H6QofLADsOJII4roAhICFQprz
 UGJ2huugZ1WE+WB18YBesz4hfHLeHii3TTzoSpvib0HkkYMgm4OJL3AtK44/r+U5HX2j
 oPKpDql0vUyt80qqQ7Rrl5+SAYa0BztoorFm555PpQ0hRBJahN56skjZ9FzQa+jGcW/s
 ppsQ==
X-Gm-Message-State: ACrzQf3/BBBVARAzuu6V6Rzkg7ykDBW83a9zu5l5V/K++Cp/AOP3QW6y
 m0+bIvvE8FNU8RbJ09rKP2poiqZbpx/enxxO
X-Google-Smtp-Source: AMsMyM7sFyeolkI8qFrDGct5cTAYp/7wJiLLFHTe3uY8yJTYUfdyQmYgJ8yERC68AoxdziZHP3fT0w==
X-Received: by 2002:a05:622a:14cc:b0:35d:1214:99e8 with SMTP id
 u12-20020a05622a14cc00b0035d121499e8mr10543201qtx.205.1664633406361; 
 Sat, 01 Oct 2022 07:10:06 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8080:8162:afc7:8362:2616:ac15])
 by smtp.gmail.com with ESMTPSA id
 j16-20020a05620a289000b006b615cd8c13sm6075914qkp.106.2022.10.01.07.10.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 07:10:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v3 11/26] target/i386: Create cur_insn_len, cur_insn_len_i32
Date: Sat,  1 Oct 2022 07:09:20 -0700
Message-Id: <20221001140935.465607-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001140935.465607-1-richard.henderson@linaro.org>
References: <20221001140935.465607-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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

Create common routines for computing the length of the insn.
Use tcg_constant_i32 in the new function, while we're at it.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 6b16c0b62c..fe99c4361c 100644
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
@@ -2647,7 +2654,7 @@ static void gen_interrupt(DisasContext *s, int intno)
     gen_update_cc_op(s);
     gen_update_eip_cur(s);
     gen_helper_raise_interrupt(cpu_env, tcg_constant_i32(intno),
-                               tcg_constant_i32(s->pc - s->base.pc_next));
+                               cur_insn_len_i32(s));
     s->base.is_jmp = DISAS_NORETURN;
 }
 
@@ -7314,7 +7321,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (prefixes & PREFIX_REPZ) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_pause(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7340,7 +7347,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
-        gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+        gen_helper_into(cpu_env, cur_insn_len_i32(s));
         break;
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
@@ -7499,7 +7506,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* XXX: is it usable in real mode ? */
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
-        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+        gen_helper_syscall(cpu_env, cur_insn_len_i32(s));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
            generated after one has entered CPL0 if TF is set in FMASK.  */
@@ -7531,7 +7538,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_hlt(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7640,7 +7647,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_mwait(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
             break;
 
@@ -7716,7 +7723,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


