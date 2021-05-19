Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 372C73895DA
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 20:54:35 +0200 (CEST)
Received: from localhost ([::1]:48910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljRL0-00021p-80
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 14:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53366)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1r-0003DX-5q
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:47 -0400
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b]:46803)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ljR1m-0007W1-HA
 for qemu-devel@nongnu.org; Wed, 19 May 2021 14:34:46 -0400
Received: by mail-oi1-x22b.google.com with SMTP id x15so13968184oic.13
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 11:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xGkZKZlGCLChYg0dV/p2rUqpj5XLQrJ/JmdPF5hhyvY=;
 b=Wdjyj2XL/w+RwnSN/M47iLTY4ijeV6ECZpKlHCmaSPJ/ptNlr+2f47bOdCmT+nDPN4
 YNazk+NxGPRx/HGveRJ1gipNnLUmBVMMs7dPVXPLhW+zlAqb+v+hiCgOkeo6CzKdS84b
 fohxmGIh1VpeE3TBR91R0N+EfIovhuu6lTMgLlaURbuRwf7yecHFKfhykddgUPV+I3vy
 6ayuQazAVT7O7cvA3pXV/ZzDVTQKYkB4FDyJtw8jOi2nYNg8z6kDv0ANPi5wxNAx5Oy5
 XFJhpCPxY7c/e5hMC/jEf1SKYHjS1Kw+wwZn5LKGrWrvW0WUzu/tW/8qeQQWc3pkSsSH
 SRuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xGkZKZlGCLChYg0dV/p2rUqpj5XLQrJ/JmdPF5hhyvY=;
 b=drFfjxCzG7Er2To3w0gL5vlISGvpcyqSir34gUsQFbUfBZigwdTh4P/lieUCUcnJL6
 raai0wbMkEHcmTC7MTFw0glE/IbDJe4qcU9Fg6ptIevB8yvs5nH8AFF3McveGfZfqUQN
 GbXThyUiGbJ6N3Fa1VG7QHm1O+b30I+FWLbhTRZc8VbZ8byz0H7dOBz4LVf2H0A/PfqS
 JEp0jz5Z8huBPR8GwxtVRbonDppLKL7kyOj51WuGnfrfoPoTOZwIs95LAoABHNYuePoE
 8rukX2c1bjYGBjSC2ar+JxwzQ6AyR8NIGKyCpjCJYAvgP3lswr+QEB34V6E4hEu54EfF
 L6fA==
X-Gm-Message-State: AOAM530cHtRVEuWugA/MiyF7sKK+eK3u8Yj6+tbWtJIqY5el6fF9Yf0b
 O543CG08E1Kc7Qxq3tp+fY/GiTfaw0RByz9A
X-Google-Smtp-Source: ABdhPJx7+j/4qnhevh4gWrXxN7l2zKH6ww98kNX/n0gxXNPN88mrrjjXdjIRYI8YdYuSQUlfkqktQg==
X-Received: by 2002:aca:a98a:: with SMTP id s132mr419486oie.164.1621449281385; 
 Wed, 19 May 2021 11:34:41 -0700 (PDT)
Received: from localhost.localdomain ([45.235.253.15])
 by smtp.gmail.com with ESMTPSA id i9sm38642oog.17.2021.05.19.11.34.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:34:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 49/50] target/i386: Move helper_check_io to sysemu
Date: Wed, 19 May 2021 13:30:49 -0500
Message-Id: <20210519183050.875453-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519183050.875453-1-richard.henderson@linaro.org>
References: <20210519183050.875453-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22b.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The we never allow i/o from user-only, and the tss check
that helper_check_io does will always fail.  Use an ifdef
within gen_check_io and return false, indicating that an
exception is known to be raised.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210514151342.384376-50-richard.henderson@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h                |  2 +-
 target/i386/tcg/seg_helper.c        | 28 ----------------------------
 target/i386/tcg/sysemu/seg_helper.c | 29 +++++++++++++++++++++++++++++
 target/i386/tcg/translate.c         | 11 ++++++++++-
 4 files changed, 40 insertions(+), 30 deletions(-)

diff --git a/target/i386/helper.h b/target/i386/helper.h
index 47d0d67699..3fd0253298 100644
--- a/target/i386/helper.h
+++ b/target/i386/helper.h
@@ -86,7 +86,6 @@ DEF_HELPER_1(rdtsc, void, env)
 DEF_HELPER_1(rdtscp, void, env)
 DEF_HELPER_FLAGS_1(rdpmc, TCG_CALL_NO_WG, noreturn, env)
 
-DEF_HELPER_FLAGS_3(check_io, TCG_CALL_NO_WG, void, env, i32, i32)
 DEF_HELPER_3(outb, void, env, i32, i32)
 DEF_HELPER_2(inb, tl, env, i32)
 DEF_HELPER_3(outw, void, env, i32, i32)
@@ -95,6 +94,7 @@ DEF_HELPER_3(outl, void, env, i32, i32)
 DEF_HELPER_2(inl, tl, env, i32)
 
 #ifndef CONFIG_USER_ONLY
+DEF_HELPER_FLAGS_3(check_io, TCG_CALL_NO_WG, void, env, i32, i32)
 DEF_HELPER_FLAGS_4(bpt_io, TCG_CALL_NO_WG, void, env, i32, i32, tl)
 DEF_HELPER_2(svm_check_intercept, void, env, i32)
 DEF_HELPER_4(svm_check_io, void, env, i32, i32, i32)
diff --git a/target/i386/tcg/seg_helper.c b/target/i386/tcg/seg_helper.c
index 69d6e8f602..2f6cdc8239 100644
--- a/target/i386/tcg/seg_helper.c
+++ b/target/i386/tcg/seg_helper.c
@@ -2416,31 +2416,3 @@ void helper_verw(CPUX86State *env, target_ulong selector1)
     }
     CC_SRC = eflags | CC_Z;
 }
-
-/* check if Port I/O is allowed in TSS */
-void helper_check_io(CPUX86State *env, uint32_t addr, uint32_t size)
-{
-    uintptr_t retaddr = GETPC();
-    uint32_t io_offset, val, mask;
-
-    /* TSS must be a valid 32 bit one */
-    if (!(env->tr.flags & DESC_P_MASK) ||
-        ((env->tr.flags >> DESC_TYPE_SHIFT) & 0xf) != 9 ||
-        env->tr.limit < 103) {
-        goto fail;
-    }
-    io_offset = cpu_lduw_kernel_ra(env, env->tr.base + 0x66, retaddr);
-    io_offset += (addr >> 3);
-    /* Note: the check needs two bytes */
-    if ((io_offset + 1) > env->tr.limit) {
-        goto fail;
-    }
-    val = cpu_lduw_kernel_ra(env, env->tr.base + io_offset, retaddr);
-    val >>= (addr & 7);
-    mask = (1 << size) - 1;
-    /* all bits must be zero to allow the I/O */
-    if ((val & mask) != 0) {
-    fail:
-        raise_exception_err_ra(env, EXCP0D_GPF, 0, retaddr);
-    }
-}
diff --git a/target/i386/tcg/sysemu/seg_helper.c b/target/i386/tcg/sysemu/seg_helper.c
index e0d7b32b82..82c0856c41 100644
--- a/target/i386/tcg/sysemu/seg_helper.c
+++ b/target/i386/tcg/sysemu/seg_helper.c
@@ -23,6 +23,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "tcg/helper-tcg.h"
+#include "../seg_helper.h"
 
 #ifdef TARGET_X86_64
 void helper_syscall(CPUX86State *env, int next_eip_addend)
@@ -123,3 +124,31 @@ void x86_cpu_do_interrupt(CPUState *cs)
         env->old_exception = -1;
     }
 }
+
+/* check if Port I/O is allowed in TSS */
+void helper_check_io(CPUX86State *env, uint32_t addr, uint32_t size)
+{
+    uintptr_t retaddr = GETPC();
+    uint32_t io_offset, val, mask;
+
+    /* TSS must be a valid 32 bit one */
+    if (!(env->tr.flags & DESC_P_MASK) ||
+        ((env->tr.flags >> DESC_TYPE_SHIFT) & 0xf) != 9 ||
+        env->tr.limit < 103) {
+        goto fail;
+    }
+    io_offset = cpu_lduw_kernel_ra(env, env->tr.base + 0x66, retaddr);
+    io_offset += (addr >> 3);
+    /* Note: the check needs two bytes */
+    if ((io_offset + 1) > env->tr.limit) {
+        goto fail;
+    }
+    val = cpu_lduw_kernel_ra(env, env->tr.base + io_offset, retaddr);
+    val >>= (addr & 7);
+    mask = (1 << size) - 1;
+    /* all bits must be zero to allow the I/O */
+    if ((val & mask) != 0) {
+    fail:
+        raise_exception_err_ra(env, EXCP0D_GPF, 0, retaddr);
+    }
+}
diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 68ae9b0798..86b93a010d 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -203,7 +203,6 @@ STUB_HELPER(read_crN, TCGv ret, TCGv_env env, TCGv_i32 reg)
 STUB_HELPER(set_dr, TCGv_env env, TCGv_i32 reg, TCGv val)
 STUB_HELPER(stgi, TCGv_env env)
 STUB_HELPER(svm_check_intercept, TCGv_env env, TCGv_i32 type)
-STUB_HELPER(svm_check_io, TCGv_env env, TCGv_i32 port, TCGv_i32 p, TCGv_i32 a)
 STUB_HELPER(vmload, TCGv_env env, TCGv_i32 aflag)
 STUB_HELPER(vmmcall, TCGv_env env)
 STUB_HELPER(vmrun, TCGv_env env, TCGv_i32 aflag, TCGv_i32 pc_ofs)
@@ -217,6 +216,7 @@ static void gen_jr(DisasContext *s, TCGv dest);
 static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
+static void gen_exception_gpf(DisasContext *s);
 
 /* i386 arith/logic operations */
 enum {
@@ -681,6 +681,14 @@ static void gen_helper_out_func(MemOp ot, TCGv_i32 v, TCGv_i32 n)
 static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
                          uint32_t svm_flags)
 {
+#ifdef CONFIG_USER_ONLY
+    /*
+     * We do not implement the ioperm(2) syscall, so the TSS check
+     * will always fail.
+     */
+    gen_exception_gpf(s);
+    return false;
+#else
     if (PE(s) && (CPL(s) > IOPL(s) || VM86(s))) {
         gen_helper_check_io(cpu_env, port, tcg_constant_i32(1 << ot));
     }
@@ -699,6 +707,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
                                 tcg_constant_i32(next_eip - cur_eip));
     }
     return true;
+#endif
 }
 
 static inline void gen_movs(DisasContext *s, MemOp ot)
-- 
2.25.1


