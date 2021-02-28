Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 688FF327562
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 00:54:20 +0100 (CET)
Received: from localhost ([::1]:52656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGVtD-0006kb-Am
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 18:54:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQQ-0006ih-3P
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:34 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:45410)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQO-000843-56
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:33 -0500
Received: by mail-pg1-x52d.google.com with SMTP id p21so10339647pgl.12
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Ap9UlfvhhAW45LCatzEg/juSTyb7nVXMtNN6jx1skE=;
 b=e9ZDDl0ZkpjZEo6NVkncWUtkbYF8GlX4nE+OBtviFx6SxPRzX7Pa/ma02BtbAXFz0X
 JQmhag9CyfOq3uPJ1K+alJawVmkoLfUFWddgJnCRm2JTMUGjiQodSmogQJiWHR2cqjnl
 nt6rqaXy+tZSrwveDYP9FkDoVXmdK+2ctJjWbiUlbI4plyLSh/vWvtlIEawOwYTb51ep
 pnINBPNpeWTGtscRZvT2ojFsxMBTv4/wYYz1stEFmuK+Icnyn3nTolyBDcsDQhV6lLLl
 UotZWrxtv3ru2Uf43A1atV/zvjrIp2ctkAgFCu/21/V8DuCqRCcGJ4QHy+b7KtyKNzMe
 V1Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Ap9UlfvhhAW45LCatzEg/juSTyb7nVXMtNN6jx1skE=;
 b=JX4LszIRlb/GulkUuSKptevXUTVuYdDLxlum7fxgsX+3aaD3JwpQ/Wj0HX9CnaooLd
 EPtTXs3JWI5XqW4iztwosUFzJ3dZFSfJoEZQnvzLzl+xUMhRPgFU3S/NNTV66fwbeoOv
 /o09hsd0ovnxH+qaCFMzgcvf8oUcI4yqaPmjSoLnNm/6ot7irm4sDHm66DRepPsy8F3p
 peLbFiO+JRCCUOnNv6IdVrEPxgQ2NZJuvTkynQ+csIKOMChVHkM0T4SNXe2f+b5BjmgI
 cQHRkhopT+spJwyDJCxETm5P+7/TofOQLWuRVp5my7npg6+3v330m6Uq9yZDnoR4Fmsm
 x56g==
X-Gm-Message-State: AOAM532RVYXFPpvhrl7HYeNq4rE9LUnYB51RX5rRtxNubwAc4ZL0zmbB
 XpKKYRqGYyw27ZL349+RJTbt5LJ7VA+gfg==
X-Google-Smtp-Source: ABdhPJwt2cWpVaLnn6r85xEGg71odF2dn7kVmfpAEBzwGeTdDQXL3zQvmznk2RliRlJbgBcz7qdYIw==
X-Received: by 2002:a62:7797:0:b029:1ed:7b10:84c2 with SMTP id
 s145-20020a6277970000b02901ed7b1084c2mr12304145pfc.47.1614554670639; 
 Sun, 28 Feb 2021 15:24:30 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b10sm14164049pgm.76.2021.02.28.15.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:24:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 47/50] target/i386: Pass in port to gen_check_io
Date: Sun, 28 Feb 2021 15:23:18 -0800
Message-Id: <20210228232321.322053-48-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pass in a pre-truncated TCGv_i32 value.  We were doing the
truncation of EDX in multiple places, now only once per insn.
While all callers use s->tmp2_i32, for cleanliness of the
subroutine, use a parameter anyway.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/tcg/translate.c | 55 +++++++++++++++++++------------------
 1 file changed, 29 insertions(+), 26 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 83bcf5cccc..0937c136ff 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -674,19 +674,23 @@ static void gen_helper_out_func(MemOp ot, TCGv_i32 v, TCGv_i32 n)
     }
 }
 
-static bool gen_check_io(DisasContext *s, MemOp ot, uint32_t svm_flags)
+/*
+ * Validate that access to [port, port + 1<<ot) is allowed.
+ * Raise #GP, or VMM exit if not.
+ */
+static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
+                         uint32_t svm_flags)
 {
-    tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
     if (PE(s) && (CPL(s) > IOPL(s) || VM86(s))) {
         switch (ot) {
         case MO_8:
-            gen_helper_check_iob(cpu_env, s->tmp2_i32);
+            gen_helper_check_iob(cpu_env, port);
             break;
         case MO_16:
-            gen_helper_check_iow(cpu_env, s->tmp2_i32);
+            gen_helper_check_iow(cpu_env, port);
             break;
         case MO_32:
-            gen_helper_check_iol(cpu_env, s->tmp2_i32);
+            gen_helper_check_iol(cpu_env, port);
             break;
         default:
             tcg_abort();
@@ -702,7 +706,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, uint32_t svm_flags)
             svm_flags |= SVM_IOIO_REP_MASK;
         }
         svm_flags |= 1 << (SVM_IOIO_SIZE_SHIFT + ot);
-        gen_helper_svm_check_io(cpu_env, s->tmp2_i32,
+        gen_helper_svm_check_io(cpu_env, port,
                                 tcg_constant_i32(svm_flags),
                                 tcg_constant_i32(next_eip - cur_eip));
     }
@@ -6473,8 +6477,10 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x6c: /* insS */
     case 0x6d:
         ot = mo_b_d32(b, dflag);
-        tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        if (!gen_check_io(s, ot, SVM_IOIO_TYPE_MASK | SVM_IOIO_STR_MASK)) {
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32,
+                          SVM_IOIO_TYPE_MASK | SVM_IOIO_STR_MASK)) {
             break;
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
@@ -6493,8 +6499,9 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0x6e: /* outsS */
     case 0x6f:
         ot = mo_b_d32(b, dflag);
-        tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        if (!gen_check_io(s, ot, SVM_IOIO_STR_MASK)) {
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_STR_MASK)) {
             break;
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
@@ -6518,14 +6525,13 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xe5:
         ot = mo_b_d32(b, dflag);
         val = x86_ldub_code(env, s);
-        tcg_gen_movi_tl(s->T0, val);
-        if (!gen_check_io(s, ot, SVM_IOIO_TYPE_MASK)) {
+        tcg_gen_movi_i32(s->tmp2_i32, val);
+        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_TYPE_MASK)) {
             break;
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
-        tcg_gen_movi_i32(s->tmp2_i32, val);
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
@@ -6537,16 +6543,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xe7:
         ot = mo_b_d32(b, dflag);
         val = x86_ldub_code(env, s);
-        tcg_gen_movi_tl(s->T0, val);
-        if (!gen_check_io(s, ot, 0)) {
+        tcg_gen_movi_i32(s->tmp2_i32, val);
+        if (!gen_check_io(s, ot, s->tmp2_i32, 0)) {
             break;
         }
-        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
-
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
-        tcg_gen_movi_i32(s->tmp2_i32, val);
+        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
@@ -6557,14 +6561,14 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xec:
     case 0xed:
         ot = mo_b_d32(b, dflag);
-        tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        if (!gen_check_io(s, ot, SVM_IOIO_TYPE_MASK)) {
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32, SVM_IOIO_TYPE_MASK)) {
             break;
         }
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
-        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
         gen_helper_in_func(ot, s->T1, s->tmp2_i32);
         gen_op_mov_reg_v(s, ot, R_EAX, s->T1);
         gen_bpt_io(s, s->tmp2_i32, ot);
@@ -6575,16 +6579,15 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
     case 0xee:
     case 0xef:
         ot = mo_b_d32(b, dflag);
-        tcg_gen_ext16u_tl(s->T0, cpu_regs[R_EDX]);
-        if (!gen_check_io(s, ot, 0)) {
+        tcg_gen_trunc_tl_i32(s->tmp2_i32, cpu_regs[R_EDX]);
+        tcg_gen_ext16u_i32(s->tmp2_i32, s->tmp2_i32);
+        if (!gen_check_io(s, ot, s->tmp2_i32, 0)) {
             break;
         }
-        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
-
         if (tb_cflags(s->base.tb) & CF_USE_ICOUNT) {
             gen_io_start();
         }
-        tcg_gen_trunc_tl_i32(s->tmp2_i32, s->T0);
+        gen_op_mov_v_reg(s, ot, s->T1, R_EAX);
         tcg_gen_trunc_tl_i32(s->tmp3_i32, s->T1);
         gen_helper_out_func(ot, s->tmp2_i32, s->tmp3_i32);
         gen_bpt_io(s, s->tmp2_i32, ot);
-- 
2.25.1


