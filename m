Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C3634698FF
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:30:24 +0100 (CET)
Received: from localhost ([::1]:58954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muF0X-0004i0-6t
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:30:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muExI-0007G4-Dz
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:27:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muExD-0002wm-LT
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:27:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638800814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rcoxwflSXZ/dyMPNlUZOxGw6nhLPM34cv40Y69y/bsc=;
 b=EJOVN6vIUfoWdUifmpCxRggjxBB5IsGrU/Q7gGLMJQ2uKMNqpq/pK2TqXzLRForxGlRLAO
 1h6vJ5+C3sfLoN8Q6qs9jUjPr+nOMhSqYR/7sOpv0PaVcWVRAJ9uowRp3iCR5thzcLYmEp
 YE7KuYLZ/2v7kkVbfxOc7zUX5ksmx4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-157-aFyl6o4bMleQEIldKMWmow-1; Mon, 06 Dec 2021 09:26:51 -0500
X-MC-Unique: aFyl6o4bMleQEIldKMWmow-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 66D5893920;
 Mon,  6 Dec 2021 14:26:50 +0000 (UTC)
Received: from localhost (unknown [10.39.193.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 020B760BF1;
 Mon,  6 Dec 2021 14:26:49 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 1/4] tls: add macros for coroutine-safe TLS variables
Date: Mon,  6 Dec 2021 14:26:29 +0000
Message-Id: <20211206142632.116925-2-stefanha@redhat.com>
In-Reply-To: <20211206142632.116925-1-stefanha@redhat.com>
References: <20211206142632.116925-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Warner Losh <imp@bsdimp.com>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compiler optimizations can cache TLS values across coroutine yield
points, resulting in stale values from the previous thread when a
coroutine is re-entered by a new thread.

Serge Guelton developed an __attribute__((noinline)) wrapper and tested
it with clang and gcc. I formatted his idea according to QEMU's coding
style and wrote documentation.

Richard Henderson developed an alternative approach that can be inlined
by the compiler. This is included for architectures where we have inline
assembly that determines the address of a TLS variable.

These macros must be used instead of __thread from now on to prevent
coroutine TLS bugs. Here is an x86_64 TLS variable access before this patch:

  mov    %fs:-0x19c,%edx

And here is the same access using Richard's approach:

  rdfsbase %rax             # %fs contains the base address
  lea    -0x1a8(%rax),%rax  # -0x1a8 is the offset of our variable
  mov    0xc(%rax),%edx     # here we access the TLS variable via %rax

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1952483
Suggested-by: Serge Guelton <sguelton@redhat.com>
Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
Richard's suggested code used a MOV instruction on x86_64 but we need
LEA semantics. LEA doesn't support %fs so I switched to RDFSBASE+LEA.
Otherwise Richard's approach is unchanged.
---
 include/qemu/coroutine-tls.h | 205 +++++++++++++++++++++++++++++++++++
 1 file changed, 205 insertions(+)
 create mode 100644 include/qemu/coroutine-tls.h

diff --git a/include/qemu/coroutine-tls.h b/include/qemu/coroutine-tls.h
new file mode 100644
index 0000000000..b87c057243
--- /dev/null
+++ b/include/qemu/coroutine-tls.h
@@ -0,0 +1,205 @@
+/*
+ * QEMU Thread Local Storage for coroutines
+ *
+ * Copyright Red Hat
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ * It is forbidden to access Thread Local Storage in coroutines because
+ * compiler optimizations may cause values to be cached across coroutine
+ * re-entry. Coroutines can run in more than one thread through the course of
+ * their life, leading bugs when stale TLS values from the wrong thread are
+ * used as a result of compiler optimization.
+ *
+ * An example is:
+ *
+ * ..code-block:: c
+ *   :caption: A coroutine that may see the wrong TLS value
+ *
+ *   static __thread AioContext *current_aio_context;
+ *   ...
+ *   static void coroutine_fn foo(void)
+ *   {
+ *       aio_notify(current_aio_context);
+ *       qemu_coroutine_yield();
+ *       aio_notify(current_aio_context); // <-- may be stale after yielding!
+ *   }
+ *
+ * This header provides macros for safely defining variables in Thread Local
+ * Storage:
+ *
+ * ..code-block:: c
+ *   :caption: A coroutine that safely uses TLS
+ *
+ *   QEMU_DEFINE_STATIC_CO_TLS(AioContext *, current_aio_context)
+ *   ...
+ *   static void coroutine_fn foo(void)
+ *   {
+ *       aio_notify(get_current_aio_context());
+ *       qemu_coroutine_yield();
+ *       aio_notify(get_current_aio_context()); // <-- safe
+ *   }
+ */
+
+#ifndef QEMU_COROUTINE_TLS_H
+#define QEMU_COROUTINE_TLS_H
+
+/*
+ * Two techniques are available to stop the compiler from caching TLS values:
+ * 1. Accessor functions with __attribute__((noinline)). This is
+ *    architecture-independent but prevents inlining optimizations.
+ * 2. TLS address-of implemented as asm volatile so it can be inlined safely.
+ *    This enables inlining optimizations but requires architecture-specific
+ *    inline assembly.
+ */
+#if defined(__aarch64__)
+#define QEMU_CO_TLS_ADDR(ret, var)                                           \
+    asm volatile("mrs %0, tpidr_el0\n\t"                                     \
+                 "add %0, %0, #:tprel_hi12:"#var", lsl #12\n\t"              \
+                 "add %0, %0, #:tprel_lo12_nc:"#var                          \
+                 : "=r"(ret))
+#elif defined(__powerpc64__)
+#define QEMU_CO_TLS_ADDR(ret, var)                                           \
+    asm volatile("addis %0,13,"#var"@tprel@ha\n\t"                           \
+                 "add   %0,%0,"#var"@tprel@l"                                \
+                 : "=r"(ret))
+#elif defined(__riscv)
+#define QEMU_CO_TLS_ADDR(ret, var)                                           \
+    asm volatile("lui  %0,%%tprel_hi("#var")\n\t"                            \
+                 "add  %0,%0,%%tprel_add("#var")\n\t"                        \
+                 "addi %0,%0,%%tprel_lo("#var")"                             \
+                 : "=r"(ret))
+#elif defined(__x86_64__)
+#define QEMU_CO_TLS_ADDR(ret, var)                                           \
+    asm volatile("movq %%fs:0, %0\n\t"                                       \
+                 "lea "#var"@tpoff(%0), %0" : "=r"(ret))
+#endif
+
+/**
+ * QEMU_DECLARE_CO_TLS:
+ * @type: the variable's C type
+ * @var: the variable name
+ *
+ * Declare an extern variable in Thread Local Storage from a header file:
+ *
+ * .. code-block:: c
+ *   :caption: Declaring an extern variable in Thread Local Storage
+ *
+ *   QEMU_DECLARE_CO_TLS(int, my_count)
+ *   ...
+ *   int c = get_my_count();
+ *   set_my_count(c + 1);
+ *   *get_ptr_my_count() = 0;
+ *
+ * Use this instead of:
+ *
+ * .. code-block:: c
+ *   :caption: Declaring a TLS variable using __thread
+ *
+ *   extern __thread int my_count;
+ *   ...
+ *   int c = my_count;
+ *   my_count = c + 1;
+ *   *(&my_count) = 0;
+ */
+#ifdef QEMU_CO_TLS_ADDR
+#define QEMU_DECLARE_CO_TLS(type, var)                                       \
+    extern __thread type co_tls_##var;                                       \
+    static inline type get_##var(void)                                       \
+    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); return *p; }               \
+    static inline void set_##var(type v)                                     \
+    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); *p = v; }                  \
+    static inline type *get_ptr_##var(void)                                  \
+    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); return p; }
+#else
+#define QEMU_DECLARE_CO_TLS(type, var)                                       \
+    __attribute__((noinline)) type get_##var(void);                          \
+    __attribute__((noinline)) void set_##var(type v);                        \
+    __attribute__((noinline, weak)) type *get_ptr_##var(void);
+#endif
+
+/**
+ * QEMU_DEFINE_CO_TLS:
+ * @type: the variable's C type
+ * @var: the variable name
+ *
+ * Define an variable in Thread Local Storage that was previously declared from
+ * a header file with QEMU_DECLARE_CO_TLS():
+ *
+ * .. code-block:: c
+ *   :caption: Defining a variable in Thread Local Storage
+ *
+ *   QEMU_DEFINE_CO_TLS(int, my_count)
+ *
+ * Use this instead of:
+ *
+ * .. code-block:: c
+ *   :caption: Defining a TLS variable using __thread
+ *
+ *   __thread int my_count;
+ */
+#ifdef QEMU_CO_TLS_ADDR
+#define QEMU_DEFINE_CO_TLS(type, var)                                        \
+    __thread type co_tls_##var;
+#else
+#define QEMU_DEFINE_CO_TLS(type, var)                                        \
+    static __thread type co_tls_##var;                                       \
+    type get_##var(void) { return co_tls_##var; }                            \
+    void set_##var(type v) { co_tls_##var = v; }                             \
+    type *get_ptr_##var(void) { return &co_tls_##var; }
+#endif
+
+/**
+ * QEMU_DEFINE_STATIC_CO_TLS:
+ * @type: the variable's C type
+ * @var: the variable name
+ *
+ * Define a static variable in Thread Local Storage:
+ *
+ * .. code-block:: c
+ *   :caption: Defining a static variable in Thread Local Storage
+ *
+ *   QEMU_DEFINE_STATIC_CO_TLS(int, my_count)
+ *   ...
+ *   int c = get_my_count();
+ *   set_my_count(c + 1);
+ *   *get_ptr_my_count() = 0;
+ *
+ * Use this instead of:
+ *
+ * .. code-block:: c
+ *   :caption: Defining a static TLS variable using __thread
+ *
+ *   static __thread int my_count;
+ *   ...
+ *   int c = my_count;
+ *   my_count = c + 1;
+ *   *(&my_count) = 0;
+ */
+#ifdef QEMU_CO_TLS_ADDR
+#define QEMU_DEFINE_STATIC_CO_TLS(type, var)                                 \
+    __thread type co_tls_##var;                                              \
+    static __attribute__((unused)) inline type get_##var(void)               \
+    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); return *p; }               \
+    static __attribute__((unused)) inline void set_##var(type v)             \
+    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); *p = v; }                  \
+    static __attribute__((unused)) inline type *get_ptr_##var(void)          \
+    { type *p; QEMU_CO_TLS_ADDR(p, co_tls_##var); return p; }
+#else
+#define QEMU_DEFINE_STATIC_CO_TLS(type, var)                                 \
+    static __thread type co_tls_##var;                                       \
+    static __attribute__((noinline, unused))                                 \
+    type get_##var(void)                                                     \
+    { return co_tls_##var; }                                                 \
+    static __attribute__((noinline, unused))                                 \
+    void set_##var(type v)                                                   \
+    { co_tls_##var = v; }                                                    \
+    static __attribute__((noinline, weak, unused))                           \
+    type *get_ptr_##var(void)                                                \
+    { return &co_tls_##var; }
+#endif
+
+#endif /* QEMU_COROUTINE_TLS_H */
-- 
2.33.1


