Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2166FE216
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:04:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmII-0003WS-En; Wed, 10 May 2023 12:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmIG-0003WC-Bi
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:03:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmIE-0006rG-Kr
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:03:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683734633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0i0pyo1eojjJCUnANfMoxPgp4XIF4q+7+aKWreDoslg=;
 b=fsYdydSyrIoYKTQ3KN9UCsKkPzzZ0AkZJdixuJ2WEX3wdCDmJ8OyQKrzpdQPBQOfu1Vd1w
 shTzjIG6c9GDoAPADx8B4tHxi+6vlrN9xP4lDJucWqom6zzPLqNLi97aliNzhi9/mKs9d6
 Fv6Pcy5wNxSDo937ROROBkBQzi+rSeE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-9bIcsiQ6OVyKWnvL5hksxQ-1; Wed, 10 May 2023 12:03:52 -0400
X-MC-Unique: 9bIcsiQ6OVyKWnvL5hksxQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-50d89279d95so14427248a12.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:03:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683734630; x=1686326630;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0i0pyo1eojjJCUnANfMoxPgp4XIF4q+7+aKWreDoslg=;
 b=YMmCmFcvVYnWuTOrdmPrzGvBYA8509j+PMa4K4zlAZGjrufdUPVGn/2aDEGxLm4VaV
 I1lnUT94nVP0SKMMVu9TAHq4U2U3HqciNNuuxDpDdw/1Y3p0fh1i8q1e1JdAqWgFJ329
 4n54q+jrsnfUNIxsNKVw2R0uNCJf2N0yCuqiU9TSyrVhVCMm6FJvUI9Gqw73mN4SLPym
 tldJFUj5dByjCFryI+3FbdPGZqjo9hHUFwxohZdYyFCVZ63G0DENhiBq/YrB51pNgtUl
 uu2o9sui/w+djvWTyOppadoF3TlZJzHPrG0hEBmLtUj5spTGmJB27CZxuTTvyg+Ndpow
 zwEg==
X-Gm-Message-State: AC+VfDyTKzO1a8ZgwFajLoC0TB7N8/ekhIoJY8jVxdPlaOTVe+Fjdx32
 +qPw2Zdq4Y6CZ1LWZ69WbgT4vyqR4mLSDrVdbLntujPzsOuOQVbq8QaO3mdkBu9XDxFS/+hiNSP
 +qi4grNHmLMv8+pnq4Nn/OLEg0Z6Crr7ykj007PSAvj/Onvq19TCt32HPc/B7mbPAeNgZpOA0fM
 c=
X-Received: by 2002:a17:906:da8c:b0:94a:653b:ba41 with SMTP id
 xh12-20020a170906da8c00b0094a653bba41mr1751327ejb.15.1683734630307; 
 Wed, 10 May 2023 09:03:50 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6JbaOhTNtGWiLE/pTxq9UfU4bUL1/mD0FYhDBBN9m7DY3ZnF4qoxZeD1OHkPeMUKHGXPGrXg==
X-Received: by 2002:a17:906:da8c:b0:94a:653b:ba41 with SMTP id
 xh12-20020a170906da8c00b0094a653bba41mr1751284ejb.15.1683734629838; 
 Wed, 10 May 2023 09:03:49 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a170906380900b0094e1344ddfdsm2802724ejc.34.2023.05.10.09.03.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:03:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PATCH] coroutine-asm: add x86 CET shadow stack support
Date: Wed, 10 May 2023 18:03:46 +0200
Message-Id: <20230510160346.1248626-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510160346.1248626-1-pbonzini@redhat.com>
References: <20230510160346.1248626-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build          | 16 +++++++--
 util/coroutine-asm.c | 82 ++++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 93 insertions(+), 5 deletions(-)

diff --git a/meson.build b/meson.build
index 0121ccab78dd..17e4a3bc582e 100644
--- a/meson.build
+++ b/meson.build
@@ -328,6 +328,10 @@ elif coroutine_backend not in supported_backends
         .format(coroutine_backend, ', '.join(supported_backends)))
 endif
 
+if cfi_mode == 'hw' and coroutine_backend != 'asm'
+  error('Hardware control-flow integrity requires the "asm" coroutine backend.')
+endif
+
 # Compiles if SafeStack *not* enabled
 safe_stack_probe = '''
   int main(void)
@@ -469,16 +473,22 @@ if cfi_mode == 'sw'
     endif
   endif
 elif cfi_mode in ['hw', 'auto']
-  if cfi_mode == 'hw'
-    error('Hardware CFI is not supported yet')
+  if cpu in ['x86', 'x86_64']
+    cfi_flags += cc.get_supported_arguments('-fcf-protection=full')
+    if cfi_mode == 'hw'
+      error('C compiler does not support -fcf-protection')
+    endif
+  elif cfi_mode == 'hw'
+    error('Hardware CFI is only supported on x86')
   endif
   if cfi_flags == [] and cfi_mode == 'auto'
     cfi_mode = 'disabled'
   endif
 endif
-if cpu in ['x86', 'x86_64']
+if cpu in ['x86', 'x86_64'] and cfi_mode != 'hw'
   cfi_flags += cc.get_supported_arguments('-fcf-protection=branch')
 endif
+
 add_global_arguments(cfi_flags, native: false, language: all_languages)
 add_global_link_arguments(cfi_flags, native: false, language: all_languages)
 
diff --git a/util/coroutine-asm.c b/util/coroutine-asm.c
index a06ecbcb0a07..771b1d4a0fc9 100644
--- a/util/coroutine-asm.c
+++ b/util/coroutine-asm.c
@@ -22,6 +22,13 @@
 #include "qemu/osdep.h"
 #include "qemu-common.h"
 #include "qemu/coroutine_int.h"
+#include "qemu/error-report.h"
+
+#ifdef CONFIG_CF_PROTECTION
+#include <asm/prctl.h>
+#include <sys/prctl.h>
+int arch_prctl(int code, unsigned long addr);
+#endif
 
 #ifdef CONFIG_VALGRIND_H
 #include <valgrind/valgrind.h>
@@ -39,10 +46,14 @@
 typedef struct {
     Coroutine base;
     void *sp;
+    void *ssp;
 
     void *stack;
     size_t stack_size;
 
+    /* x86: CET shadow stack */
+    void *sstack;
+    size_t sstack_size;
 #ifdef CONFIG_VALGRIND_H
     unsigned int valgrind_stack_id;
 #endif
@@ -77,6 +88,35 @@ static void start_switch_fiber(void **fake_stack_save,
 #endif
 }
 
+static bool have_sstack(void)
+{
+#if defined CONFIG_CF_PROTECTION && defined __x86_64__
+    uint64_t ssp;
+    asm ("xor %0, %0; rdsspq %0\n" : "=r" (ssp));
+    return !!ssp;
+#else
+    return 0;
+#endif
+}
+
+static void *alloc_sstack(size_t sz)
+{
+#if defined CONFIG_CF_PROTECTION && defined __x86_64__
+#ifndef ARCH_X86_CET_ALLOC_SHSTK
+#define ARCH_X86_CET_ALLOC_SHSTK 0x3004
+#endif
+
+    uint64_t arg = sz;
+    if (arch_prctl(ARCH_X86_CET_ALLOC_SHSTK, (unsigned long) &arg) < 0) {
+        abort();
+    }
+
+    return (void *)arg;
+#else
+    abort();
+#endif
+}
+
 #ifdef __x86_64__
 /*
  * We hardcode all operands to specific registers so that we can write down all the
@@ -88,6 +128,26 @@ static void start_switch_fiber(void **fake_stack_save,
  * Note that push and call would clobber the red zone.  Makefile.objs compiles this
  * file with -mno-red-zone.  The alternative is to subtract/add 128 bytes from rsp
  * around the switch, with slightly lower cache performance.
+ *
+ * The RSTORSSP and SAVEPREVSSP instructions are intricate.  In a nutshell they are:
+ *
+ *      RSTORSSP(mem):    oldSSP = SSP
+ *                        SSP = mem
+ *                        *SSP = oldSSP
+ *
+ *      SAVEPREVSSP:      oldSSP = shadow_stack_pop()
+ *                        *(oldSSP - 8) = oldSSP       # "push" to old shadow stack
+ *
+ * Therefore, RSTORSSP(mem) followed by SAVEPREVSSP is the same as
+ *
+ *     shadow_stack_push(SSP)
+ *     SSP = mem
+ *     shadow_stack_pop()
+ *
+ * From the simplified description you can see that co->ssp, being stored before
+ * the RSTORSSP+SAVEPREVSSP sequence, points to the top actual entry of the shadow
+ * stack, not to the restore token.  Hence we use an offset of -8 in the operand
+ * of rstorssp.
  */
 #define CO_SWITCH(from, to, action, jump) ({                                          \
     int action_ = action;                                                             \
@@ -100,7 +160,15 @@ static void start_switch_fiber(void **fake_stack_save,
         "jmp 2f\n"                          /* switch back continues at label 2 */    \
                                                                                       \
         "1: .cfi_adjust_cfa_offset 8\n"                                               \
-        "movq %%rsp, %c[SP](%[FROM])\n"     /* save source SP */                      \
+        "xor %%rbp, %%rbp\n"                /* use old frame pointer as scratch reg */ \
+        "rdsspq %%rbp\n"                                                              \
+        "test %%rbp, %%rbp\n"               /* if CET is enabled... */                \
+        "jz 9f\n"                                                                     \
+        "movq %%rbp, %c[SSP](%[FROM])\n"    /* ... save source shadow SP, */         \
+        "movq %c[SSP](%[TO]), %%rbp\n"      /* restore destination shadow stack, */  \
+        "rstorssp -8(%%rbp)\n"                                                        \
+        "saveprevssp\n"                     /* and save source shadow SP token */     \
+        "9: movq %%rsp, %c[SP](%[FROM])\n"  /* save source SP */                      \
         "movq %c[SP](%[TO]), %%rsp\n"       /* load destination SP */                 \
         jump "\n"                           /* coroutine switch */                    \
                                                                                       \
@@ -108,7 +176,8 @@ static void start_switch_fiber(void **fake_stack_save,
         "popq %%rbp\n"                                                                \
         ".cfi_adjust_cfa_offset -8\n"                                                 \
         : "+a" (action_), [FROM] "+b" (from_), [TO] "+D" (to_)                        \
-        : [SP] "i" (offsetof(CoroutineAsm, sp))                                       \
+        : [SP] "i" (offsetof(CoroutineAsm, sp)),                                      \
+          [SSP] "i" (offsetof(CoroutineAsm, ssp))                                     \
         : "rcx", "rdx", "rsi", "r8", "r9", "r10", "r11", "r12", "r13", "r14", "r15",  \
           "memory");                                                                  \
     action_;                                                                          \
@@ -141,6 +210,12 @@ Coroutine *qemu_coroutine_new(void)
     co->stack = qemu_alloc_stack(&co->stack_size);
     co->sp = co->stack + co->stack_size;
 
+    if (have_sstack()) {
+        co->sstack_size = COROUTINE_SHADOW_STACK_SIZE;
+        co->sstack = alloc_sstack(co->sstack_size);
+        co->ssp = co->sstack + co->sstack_size;
+    }
+
 #ifdef CONFIG_VALGRIND_H
     co->valgrind_stack_id =
         VALGRIND_STACK_REGISTER(co->stack, co->stack + co->stack_size);
@@ -186,6 +261,9 @@ void qemu_coroutine_delete(Coroutine *co_)
 #endif
 
     qemu_free_stack(co->stack, co->stack_size);
+    if (co->sstack) {
+        munmap(co->sstack, co->sstack_size);
+    }
     g_free(co);
 }
 
-- 
2.40.1


