Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21C0D5AE613
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 12:58:44 +0200 (CEST)
Received: from localhost ([::1]:54768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVWHu-0003wu-6t
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 06:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWe-0000Bo-I1
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:49 -0400
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:35648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oVVWc-0003aN-PY
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:09:48 -0400
Received: by mail-wr1-x42d.google.com with SMTP id bz13so11245625wrb.2
 for <qemu-devel@nongnu.org>; Tue, 06 Sep 2022 03:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=uhX1Xco1uYXotp7Ii6JdWoo4PEBreN+vBGI94DPHWfc=;
 b=yT5Wpoam/bhQMYx3tzAF/F0Av+TnbXQBpJ54fJ7KeK8EdLkpwwmRvBNayWUk6uJdbf
 iizfIzZhVmkzA0oR6XJnAlhlIm5kNn88V1MY3NW0ZiYBI4I3fZr3eHJQfNKsXMLHEblf
 /WnW4yEdry+eWlSGbUT32KnAgc+YgXRzSIkgG8y3T4UtkRijlJDIn2yT5OxTTVYi3ZC+
 +U6Fi/S5YtKNoqOsSxr1dRG0kU1sObmCAPgLWIldectQyZinFDKjpE75zjPDXLE6EThO
 8CnWZFXfLlL89/twsB/gfeCQlBz1pCB/rGRNYLVoW3QgDvHeKsMTme95weK6P1Roa5ex
 NGoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=uhX1Xco1uYXotp7Ii6JdWoo4PEBreN+vBGI94DPHWfc=;
 b=lPINH14dxEaogQFaMTJ0BNq5L2UAmMnRtWvbUwY6w2CrXTw8HevImbVAhELZiFEi0T
 lJVki1wZ/jskAgHw1LmfUMtltq11sE0ZrH8WZKgWXYVmi5bUe1CwHqryg9oz0rqdZdb6
 2rymX/4D1ElKr0qbwWg9oxQRg+t6fkpB2MjMkDx2PE4xBPFobylDCIWyVDl92Ot+m9Tc
 n2JXiwUzhOOw2dDM2K/TEENvE4J85mPpa4t7w5IFPhVoPYbuaWIjsbu/53FqXEZ0Hamr
 M69herIvb2sDpi/M4AbkrVL6vkLDM82iCtBNqf7K6duIRqRS+kx5VjbQqgG2jq586RhO
 asHQ==
X-Gm-Message-State: ACgBeo3WUJSShzZOKd1iyTUyP5Dbj/7yaBPLo7pzcKF6hrOFDGaUaqeE
 n0G/FxzSEEoJTjYGvmjwll+Js3pr11qVf/+k
X-Google-Smtp-Source: AA6agR6MwZdJSI9emx/lA7wwkafk5IXpDNSM+GJYnd3tQRwz+82OmGTg87iJUqIM3Yv4D9wEQgmBlw==
X-Received: by 2002:a5d:59a6:0:b0:228:ac72:3c27 with SMTP id
 p6-20020a5d59a6000000b00228ac723c27mr4337499wrr.73.1662458984672; 
 Tue, 06 Sep 2022 03:09:44 -0700 (PDT)
Received: from localhost.localdomain
 ([2a02:8084:a5c0:5a80:ba98:3a71:8524:e0b1])
 by smtp.gmail.com with ESMTPSA id
 f25-20020a1c6a19000000b003a840690609sm23125014wmc.36.2022.09.06.03.09.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:09:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com
Subject: [PATCH v2 11/23] target/i386: Create cur_insn_len, cur_insn_len_i32
Date: Tue,  6 Sep 2022 11:09:20 +0100
Message-Id: <20220906100932.343523-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220906100932.343523-1-richard.henderson@linaro.org>
References: <20220906100932.343523-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42d.google.com
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
index 5b77414a0a..393a1c1075 100644
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
 
@@ -7279,7 +7286,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (prefixes & PREFIX_REPZ) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_pause(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_pause(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7305,7 +7312,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             goto illegal_op;
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
-        gen_helper_into(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+        gen_helper_into(cpu_env, cur_insn_len_i32(s));
         break;
 #ifdef WANT_ICEBP
     case 0xf1: /* icebp (undocumented, exits to external debugger) */
@@ -7464,7 +7471,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         /* XXX: is it usable in real mode ? */
         gen_update_cc_op(s);
         gen_update_eip_cur(s);
-        gen_helper_syscall(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+        gen_helper_syscall(cpu_env, cur_insn_len_i32(s));
         /* TF handling for the syscall insn is different. The TF bit is  checked
            after the syscall insn completes. This allows #DB to not be
            generated after one has entered CPL0 if TF is set in FMASK.  */
@@ -7496,7 +7503,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
         if (check_cpl0(s)) {
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_hlt(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_hlt(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
         }
         break;
@@ -7605,7 +7612,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
             }
             gen_update_cc_op(s);
             gen_update_eip_cur(s);
-            gen_helper_mwait(cpu_env, tcg_const_i32(s->pc - s->base.pc_next));
+            gen_helper_mwait(cpu_env, cur_insn_len_i32(s));
             s->base.is_jmp = DISAS_NORETURN;
             break;
 
@@ -7681,7 +7688,7 @@ static bool disas_insn(DisasContext *s, CPUState *cpu)
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


