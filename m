Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C015D6FE21C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 18:05:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwmJT-0004lF-Ts; Wed, 10 May 2023 12:05:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmJF-0004bo-33
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:05:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pwmJ9-0006zf-LO
 for qemu-devel@nongnu.org; Wed, 10 May 2023 12:04:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683734689;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0i0pyo1eojjJCUnANfMoxPgp4XIF4q+7+aKWreDoslg=;
 b=Z8xknmunONDXsTlqjvM3iw7Db3a0pM3nL7cxALX8FihWA4MTZSn77tCQuL9bvpSFDtzq52
 qB0YoT6dI1o68xVTfPzKd/twTkzkb7ViuQWdStcV+IOElPRTu6av6F1IiACGEY7+mi36mi
 cObF4u5hsFPYIgtR36YZO57sRT9DOQw=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-HcJsd4kDN3iOkwbX-bplEw-1; Wed, 10 May 2023 12:04:47 -0400
X-MC-Unique: HcJsd4kDN3iOkwbX-bplEw-1
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-50bd7555c6eso6895131a12.1
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 09:04:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683734685; x=1686326685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0i0pyo1eojjJCUnANfMoxPgp4XIF4q+7+aKWreDoslg=;
 b=eHLyvK5eieKTgpzt8uwJyvjrP04MJOmOeZKfvg9bVeVlz/O60/UoBC5qv8pCTwoU+V
 0MAwdv5vN2Ha5X7EGSz645Af1QxMEzn8XytXRUVK8GenioLg/xMrDKtkl6sNSKajheo4
 +Z2B0FljaEXGy+XIiYfUo4YNRtUpowL5gSZYYsRdbqTYM1nI+Lakra97BlkhZQy/vVni
 zB8hAJLe7D0hTKXnwqTJLZYo3w3qQviY+qaA/VQ1KhXq/qDVHNkjmuUD7T7pCX4k+LkQ
 ORsU7NoJoSacxC+LHEAT57KtG7iR1E8KTjlmaDDGTA9Mkff7cWVRHam+0fTVwo4/rY2H
 k5qw==
X-Gm-Message-State: AC+VfDzAYpysZeEOnLWhVIM8IvgmRwagvQV766x87zDca+M97fDRw8s3
 jZSveLpuEIfMkIAdubB29iX6WnnX0PVG/OxWCwqCIqC2pMMBvB1WWK711a7Xdm/a16f2x6+O5bY
 ZKdZMZserK5A3V5su9KaRx0XnOM0YpHqeL5XayKxnapj0JC796H4indXwWqiNH9nrP5hjcpv0D3
 M=
X-Received: by 2002:a17:906:4fc3:b0:965:c42d:ac59 with SMTP id
 i3-20020a1709064fc300b00965c42dac59mr15392008ejw.14.1683734685249; 
 Wed, 10 May 2023 09:04:45 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6yPzlCUY2fXgOHDsEuVRjt/HPRnijS3HSqyC5D6+E2ECmcE4xygCLiuwE+DgxoLB2nx3Gdsg==
X-Received: by 2002:a17:906:4fc3:b0:965:c42d:ac59 with SMTP id
 i3-20020a1709064fc300b00965c42dac59mr15391990ejw.14.1683734684845; 
 Wed, 10 May 2023 09:04:44 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 hf27-20020a1709072c5b00b0096557203071sm2823287ejc.217.2023.05.10.09.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 09:04:44 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [PATCH] coroutine-asm: add x86 CET shadow stack support
Date: Wed, 10 May 2023 18:04:41 +0200
Message-Id: <20230510160441.1249170-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230510160441.1249170-1-pbonzini@redhat.com>
References: <20230510160441.1249170-1-pbonzini@redhat.com>
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


