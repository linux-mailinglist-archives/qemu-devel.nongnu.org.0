Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88ABF643C36
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Dec 2022 05:23:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2POs-0003TC-Kx; Mon, 05 Dec 2022 23:17:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POr-0003Sm-0A
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:45 -0500
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p2POp-0006vR-B1
 for qemu-devel@nongnu.org; Mon, 05 Dec 2022 23:17:44 -0500
Received: by mail-oi1-x235.google.com with SMTP id m204so15582340oib.6
 for <qemu-devel@nongnu.org>; Mon, 05 Dec 2022 20:17:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LtPujVcPKsyMDklXnZcNahng/PTvSULlrispS/3dEi4=;
 b=Fv852m95R/RPyh4rktyqL4Brke3qboQBdEYluHpmjley2Ge+UQgQODGGbo7s4KSSs0
 dPfirMTzlo/3Ur+GbNaqylamf0CGfld3Vn3ILWPXZRvX/Z7APAF7b7Vbuvr2yHvx4twu
 93+V9P8F3StA+djHI+glVe8rsdMEckAzuRH/VwPfeckGpaz/N8aEnUTkaR2CIoWPESPz
 IiaaNFEehBx7qWHCsBpEsl1LgYuBxVyzwByRcUzMQDxY2Q/M6Zcdr94iTR4HCgxknaCe
 gKwfUuETsQ05ETnJNx2ysZSGhfunm2JE+qjUpeMop2qC/qrroLHypgTWajCgwiLlMPTp
 jrZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LtPujVcPKsyMDklXnZcNahng/PTvSULlrispS/3dEi4=;
 b=gW9EqJLBk9UktRUrQY35YJD+s6oGb/XNHJ6wLX8FWcMhNKS1u+WGQt2t3k9BzdVueF
 afbeZotYVfUwUUJkAj59bbD7mFC3LtHCe8uaMFuPdr9j8IL432CB2J25oB7+UJI//N/T
 7ZHs68tTrAdh/Bs/DShTnRdq4eWxSDzJ/I9DvnfsQel1hCZ9Cu7+aaWPE41dh5M/QG1r
 yMZhgm56Sp/I7hkmptx38PGFrZrAebG1aIdu8tsoDUl9MHVZs9a8DnKdOHblWo91OBHQ
 x0xgLtnGUU1+64CTFSE0JQYyIefFJg81wvdYv0/jCnuTX7qTeEDxwFRWNwiQbSQTnHXJ
 vW0A==
X-Gm-Message-State: ANoB5pkyfck+ml02dIPVCePeMVi+Vk7XQgjORx0cZTwTXmtCiv0fG4hA
 hHvG6LSS0+YLEjdMwGGUx/SVx4BFb5C8Ck1g/qc=
X-Google-Smtp-Source: AA0mqf7PI8vFAuRcS1NwVBkfk42i6wjDhyrz7n6G5E7okzQRq+t17S8hHsGn6D9BKkpdCGBwTsDwCA==
X-Received: by 2002:a05:6808:2012:b0:35b:bcb3:46f with SMTP id
 q18-20020a056808201200b0035bbcb3046fmr18108268oiw.86.1670300262555; 
 Mon, 05 Dec 2022 20:17:42 -0800 (PST)
Received: from stoup.. ([2806:102e:18:70b5:d104:21c2:8c7e:77e6])
 by smtp.gmail.com with ESMTPSA id
 o35-20020a056870912300b0014185b2b3d5sm10162018oae.18.2022.12.05.20.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 20:17:41 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: r@hev.cc
Subject: [PATCH 19/22] tcg/sparc64: Reorg goto_tb implementation
Date: Mon,  5 Dec 2022 22:17:12 -0600
Message-Id: <20221206041715.314209-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221206041715.314209-1-richard.henderson@linaro.org>
References: <20221206041715.314209-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x235.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The old sparc64 implementation may replace two insns, which leaves
a race condition in which a thread could be stopped at a PC in the
middle of the sequence, and when restarted does not see the complete
address computation and branches to nowhere.

The new implemetation replaces only one insn, swapping between a
direct branch and a direct call.  The TCG_REG_TB register is loaded
from tb->jmp_target_addr[] in the delay slot.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/sparc64/tcg-target.c.inc | 93 ++++++++++++++----------------------
 1 file changed, 37 insertions(+), 56 deletions(-)

diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
index 1ae9615ef0..07ebea7a6e 100644
--- a/tcg/sparc64/tcg-target.c.inc
+++ b/tcg/sparc64/tcg-target.c.inc
@@ -1435,33 +1435,56 @@ static void tcg_out_exit_tb(TCGContext *s, uintptr_t a0)
 
 static void tcg_out_goto_tb(TCGContext *s, int which)
 {
-    int c;
+    ptrdiff_t off = tcg_tbrel_diff(s, (void *)get_jmp_target_addr(s, which));
 
-    /* Direct jump. */
-    /* make sure the patch is 8-byte aligned.  */
-    if ((intptr_t)s->code_ptr & 4) {
-        tcg_out_nop(s);
-    }
+    /* Direct branch will be patched by tb_target_set_jmp_target. */
     set_jmp_insn_offset(s, which);
-    tcg_out_sethi(s, TCG_REG_T1, 0);
-    tcg_out_arithi(s, TCG_REG_T1, TCG_REG_T1, 0, ARITH_OR);
-    tcg_out_arith(s, TCG_REG_G0, TCG_REG_TB, TCG_REG_T1, JMPL);
-    tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
+    tcg_out32(s, CALL);
+    /* delay slot */
+    tcg_debug_assert(check_fit_ptr(off, 13));
+    tcg_out_ld(s, TCG_TYPE_PTR, TCG_REG_TB, TCG_REG_TB, off);
     set_jmp_reset_offset(s, which);
 
     /*
      * For the unlinked path of goto_tb, we need to reset TCG_REG_TB
      * to the beginning of this TB.
      */
-    c = -tcg_current_code_size(s);
-    if (check_fit_i32(c, 13)) {
-        tcg_out_arithi(s, TCG_REG_TB, TCG_REG_TB, c, ARITH_ADD);
+    off = -tcg_current_code_size(s);
+    if (check_fit_i32(off, 13)) {
+        tcg_out_arithi(s, TCG_REG_TB, TCG_REG_TB, off, ARITH_ADD);
     } else {
-        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T1, c);
+        tcg_out_movi(s, TCG_TYPE_PTR, TCG_REG_T1, off);
         tcg_out_arith(s, TCG_REG_TB, TCG_REG_TB, TCG_REG_T1, ARITH_ADD);
     }
 }
 
+void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
+                              uintptr_t jmp_rx, uintptr_t jmp_rw)
+{
+    uintptr_t addr = tb->jmp_target_addr[n];
+    intptr_t br_disp = (intptr_t)(addr - jmp_rx) >> 2;
+    tcg_insn_unit insn;
+
+    br_disp >>= 2;
+    if (check_fit_ptr(br_disp, 19)) {
+        /* ba,pt %icc, addr */
+        insn = deposit32(INSN_OP(0) | INSN_OP2(1) | INSN_COND(COND_A)
+                         | BPCC_ICC | BPCC_PT, 0, 19, br_disp);
+    } else if (check_fit_ptr(br_disp, 22)) {
+        /* ba addr */
+        insn = deposit32(INSN_OP(0) | INSN_OP2(2) | INSN_COND(COND_A),
+                         0, 22, br_disp);
+    } else {
+        /* The code_gen_buffer can't be larger than 2GB.  */
+        tcg_debug_assert(check_fit_ptr(br_disp, 30));
+        /* call addr */
+        insn = deposit32(CALL, 0, 30, br_disp);
+    }
+
+    qatomic_set((uint32_t *)jmp_rw, insn);
+    flush_idcache_range(jmp_rx, jmp_rw, 4);
+}
+
 static void tcg_out_op(TCGContext *s, TCGOpcode opc,
                        const TCGArg args[TCG_MAX_OP_ARGS],
                        const int const_args[TCG_MAX_OP_ARGS])
@@ -1871,45 +1894,3 @@ void tcg_register_jit(const void *buf, size_t buf_size)
     tcg_register_jit_int(buf, buf_size, &debug_frame, sizeof(debug_frame));
 }
 
-void tb_target_set_jmp_target(const TranslationBlock *tb, int n,
-                              uintptr_t jmp_rx, uintptr_t jmp_rw)
-{
-    uintptr_t addr = tb->jmp_target_addr[n];
-    intptr_t tb_disp = addr - (uintptr_t)tb->tc.ptr;
-    intptr_t br_disp = addr - jmp_rx;
-    tcg_insn_unit i1, i2;
-
-    /* We can reach the entire address space for ILP32.
-       For LP64, the code_gen_buffer can't be larger than 2GB.  */
-    tcg_debug_assert(tb_disp == (int32_t)tb_disp);
-    tcg_debug_assert(br_disp == (int32_t)br_disp);
-
-    if (0) {
-        qatomic_set((uint32_t *)jmp_rw,
-		    deposit32(CALL, 0, 30, br_disp >> 2));
-        flush_idcache_range(jmp_rx, jmp_rw, 4);
-        return;
-    }
-
-    /* This does not exercise the range of the branch, but we do
-       still need to be able to load the new value of TCG_REG_TB.
-       But this does still happen quite often.  */
-    if (check_fit_ptr(tb_disp, 13)) {
-        /* ba,pt %icc, addr */
-        i1 = (INSN_OP(0) | INSN_OP2(1) | INSN_COND(COND_A)
-              | BPCC_ICC | BPCC_PT | INSN_OFF19(br_disp));
-        i2 = (ARITH_ADD | INSN_RD(TCG_REG_TB) | INSN_RS1(TCG_REG_TB)
-              | INSN_IMM13(tb_disp));
-    } else if (tb_disp >= 0) {
-        i1 = SETHI | INSN_RD(TCG_REG_T1) | ((tb_disp & 0xfffffc00) >> 10);
-        i2 = (ARITH_OR | INSN_RD(TCG_REG_T1) | INSN_RS1(TCG_REG_T1)
-              | INSN_IMM13(tb_disp & 0x3ff));
-    } else {
-        i1 = SETHI | INSN_RD(TCG_REG_T1) | ((~tb_disp & 0xfffffc00) >> 10);
-        i2 = (ARITH_XOR | INSN_RD(TCG_REG_T1) | INSN_RS1(TCG_REG_T1)
-              | INSN_IMM13((tb_disp & 0x3ff) | -0x400));
-    }
-
-    qatomic_set((uint64_t *)jmp_rw, deposit64(i2, 32, 32, i1));
-    flush_idcache_range(jmp_rx, jmp_rw, 8);
-}
-- 
2.34.1


