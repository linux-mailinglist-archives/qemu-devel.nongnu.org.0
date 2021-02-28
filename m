Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0214327588
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 01:18:15 +0100 (CET)
Received: from localhost ([::1]:59202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGWGM-00055B-Ux
	for lists+qemu-devel@lfdr.de; Sun, 28 Feb 2021 19:18:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQT-0006mh-7m
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:39 -0500
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:33260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lGVQP-00084s-6t
 for qemu-devel@nongnu.org; Sun, 28 Feb 2021 18:24:36 -0500
Received: by mail-pg1-x533.google.com with SMTP id g4so10378546pgj.0
 for <qemu-devel@nongnu.org>; Sun, 28 Feb 2021 15:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8vMLy90dzRRYCLSJRNudbDx40gYZQrg07kIc1b62xNk=;
 b=memxSsDPgOE/YkCJb/3jXN5sAQ+cGbOeHSEwkjpjh448YWk74jw8UkRrKyxiLKRedl
 S7fM5bhSShaO+BU8bG8wHZPtmVwpSOcqjhgdp0EhShETGTI3h4ybrQLtb9bWl/oiO8LS
 auY/++qB+Bh80yzynE8A9WMZ0A1t/HaMLky0tieTxhka6vO5foFe+ydxUqs68ZBq2mGa
 ZgmeBh3/6A3sHvvv/vmCNVrJX9pBSL6DyjcmKdDFEa/siPNdgLJRdPJZIVMLjfBdG880
 Paq+Y6yPCQqHGJvqnmJhx1oU0/SAuo0DpwfIlvtQwwp7iUtAII4kTF+PORPJBOStM0uh
 Kblw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8vMLy90dzRRYCLSJRNudbDx40gYZQrg07kIc1b62xNk=;
 b=kvGjwPNMuwr++DNzO/FFgNldBEB0f2xwTeXVm2VKf/osNj+ffbS1hEtjhe0K1USpuj
 3AAiwAH6h/wjuhnfIMyvJIXutwa59UeBlzMPR/Pi9eWg7cQ+/1rmdQ654eP2uJhoq22u
 +trMw2whwij70bra+fI2VYRube/AX0uywHwbZepFaWh4pKa30dlZsabdgH61i1DDFukO
 ArMFS9usFEALHXSOVsiOvxYCyksAlbcuo+CKuL6vKMgZ00uZFGqlpqb1W5BsZ8feIVZM
 darL1+MYUynVFZA5rgISee+9eNzoDiE4M6MG36PvJ4gZA+d11loM5XTKKnOxsxkP1a9i
 Dlcg==
X-Gm-Message-State: AOAM533C1kh7cYItdMhXhDuLfCWUB+VcFzXm8n36iysTGUjIGE9EZ/l0
 TcqPDAlLhxpNojrZmVnLWrE+IJZ7/n+JxA==
X-Google-Smtp-Source: ABdhPJwLPJfRlqAkw+280d9zfsrx+TWkKyTJv5E8anZ9NEqObeFa7RxG5sCrMpOWqpl1+yP+uTkL4g==
X-Received: by 2002:aa7:96c6:0:b029:1ed:9913:c23b with SMTP id
 h6-20020aa796c60000b02901ed9913c23bmr12589989pfq.70.1614554671920; 
 Sun, 28 Feb 2021 15:24:31 -0800 (PST)
Received: from localhost.localdomain (174-21-84-25.tukw.qwest.net.
 [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id b10sm14164049pgm.76.2021.02.28.15.24.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Feb 2021 15:24:31 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 49/50] target/i386: Move helper_check_io to sysemu
Date: Sun, 28 Feb 2021 15:23:20 -0800
Message-Id: <20210228232321.322053-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210228232321.322053-1-richard.henderson@linaro.org>
References: <20210228232321.322053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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

The we never allow i/o from user-only, and the tss check
that helper_check_io does will always fail.  Use an ifdef
within gen_check_io and return false, indicating that an
exception is known to be raised.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/i386/helper.h                |  2 +-
 target/i386/tcg/seg_helper.c        | 28 ----------------------------
 target/i386/tcg/sysemu/seg_helper.c | 29 +++++++++++++++++++++++++++++
 target/i386/tcg/translate.c         | 11 +++++++++++
 4 files changed, 41 insertions(+), 29 deletions(-)

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
index 10076d1341..b2e3ba8195 100644
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
index d395ae090e..2276e75d92 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -193,6 +193,7 @@ typedef struct DisasContext {
     { qemu_build_not_reached(); }
 
 #ifdef CONFIG_USER_ONLY
+STUB_HELPER(check_io, TCGv_env env, TCGv_i32 port, TCGv_i32 size)
 STUB_HELPER(clgi, TCGv_env env)
 STUB_HELPER(flush_page, TCGv_env env, TCGv addr)
 STUB_HELPER(hlt, TCGv_env env, TCGv_i32 pc_ofs)
@@ -217,6 +218,7 @@ static void gen_jr(DisasContext *s, TCGv dest);
 static void gen_jmp(DisasContext *s, target_ulong eip);
 static void gen_jmp_tb(DisasContext *s, target_ulong eip, int tb_num);
 static void gen_op(DisasContext *s1, int op, MemOp ot, int d);
+static void gen_exception_gpf(DisasContext *s);
 
 /* i386 arith/logic operations */
 enum {
@@ -681,6 +683,14 @@ static void gen_helper_out_func(MemOp ot, TCGv_i32 v, TCGv_i32 n)
 static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
                          uint32_t svm_flags)
 {
+#ifdef CONFIG_USER_ONLY
+    /*
+     * We do not implement the iopriv(2) syscall, so the TSS check
+     * will always fail.
+     */
+    gen_exception_gpf(s);
+    return false;
+#else
     if (PE(s) && (CPL(s) > IOPL(s) || VM86(s))) {
         gen_helper_check_io(cpu_env, port, tcg_constant_i32(1 << ot));
     }
@@ -699,6 +709,7 @@ static bool gen_check_io(DisasContext *s, MemOp ot, TCGv_i32 port,
                                 tcg_constant_i32(next_eip - cur_eip));
     }
     return true;
+#endif
 }
 
 static inline void gen_movs(DisasContext *s, MemOp ot)
-- 
2.25.1


