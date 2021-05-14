Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE81A380D99
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 17:52:26 +0200 (CEST)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lha70-0000He-1Z
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 11:52:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZF-0003ml-9O
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:33 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:47023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lhZZD-0000Gl-AV
 for qemu-devel@nongnu.org; Fri, 14 May 2021 11:17:33 -0400
Received: by mail-qk1-x72f.google.com with SMTP id 76so29001915qkn.13
 for <qemu-devel@nongnu.org>; Fri, 14 May 2021 08:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=04x3BrPjLg3sEB7w0wyfRPgMFujmH7gaNCenIStnsOI=;
 b=WweQJz8lzk2BBUJLI86WZAWoW4BtD/ROmOBpfmW1D6zuIHtzNvQRh1XGb7vSditFSG
 2fhm8dwJVXzl1uy2ETSIzKAgdzKxDpL/0ufu002GokME6nYcLSJxN2CqmiOLdTek+pA4
 wIk4ZJl4mYJbS3HM0yDD2LC6yN4ltkPuy4Pjj6nzGECT3osM1htMWq/dPTb/atwW16jt
 jB/W2PpxRLgYKC79Wk6s1EGvQliSYg/NO4uublWLEnB6hfK9OZAwb+3tAYU3e1rBo2l6
 3ehFhwfPMjIHstb3oaIrWA6OKv0nx84ezPp+4TdnmRrUUAN0BCmReoYwLYeJ4eha3mlS
 YM1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=04x3BrPjLg3sEB7w0wyfRPgMFujmH7gaNCenIStnsOI=;
 b=mTnpvhk/3ch1YLm2SEeFS0kh3BT+NrPbkZ3D2VzMG2ZK27cJX5a5R1lBk8/+7i7CWL
 EtNf9bd/iHOuFtVKykbM8N11WF9WsNFWGrMiYn//E39PAynw/C+qVULRIxOI25uKPUUl
 UjqC816tpDHaH8XA6T9/1SpFJhDEy9BeHxZbt3nYZmydQzy+R7y32cRb7H9Mxn+E1mcv
 Pkal+RMV0qpOjBFU+jumiw3mTW+1BT2IiFCqDSY/NAUaC0OWV4uz7BSJyJWoMtK0KnEE
 /ecgPPKgSHYiS3kzFuGQEmBuBFMG1YUkNI5LXsyn1NmKo2LC7U5wZMVTf3bzO+GLUzdW
 AHSA==
X-Gm-Message-State: AOAM531jJaMNY3A/5umgiofLopff8m6CffX42L/kkIxXpBNwANtdjtoS
 1MWTZCIh/WIP/9sawfXfHMymMLrb9xpD8WnvmWw=
X-Google-Smtp-Source: ABdhPJxeAOhLCylZlUl0EgaIJDWuWmfLrVXl28ci4/0Gmw3uBZ6DAR2qWK8uwffgYH4Ti9Yw2yVNJQ==
X-Received: by 2002:a37:b107:: with SMTP id a7mr16916587qkf.366.1621005450345; 
 Fri, 14 May 2021 08:17:30 -0700 (PDT)
Received: from localhost.localdomain (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id p190sm5181972qke.13.2021.05.14.08.17.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 08:17:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 49/50] target/i386: Move helper_check_io to sysemu
Date: Fri, 14 May 2021 10:13:41 -0500
Message-Id: <20210514151342.384376-50-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210514151342.384376-1-richard.henderson@linaro.org>
References: <20210514151342.384376-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72f.google.com
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
Cc: pbonzini@redhat.com, f4bug@amsat.org, ehabkost@redhat.com, cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The we never allow i/o from user-only, and the tss check
that helper_check_io does will always fail.  Use an ifdef
within gen_check_io and return false, indicating that an
exception is known to be raised.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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
index 860c75c2b1..bcc642bf6e 100644
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


