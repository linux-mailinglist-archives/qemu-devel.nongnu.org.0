Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC2DC4BDA45
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:35:41 +0100 (CET)
Received: from localhost ([::1]:46042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9mu-0007hB-J1
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:35:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nM9gy-0004fw-Ul
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:29:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nM9gt-0003QQ-8B
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:29:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645453757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UsXd6i3tDdrBdN2zFs7f1fO4YGsC7zELuTtcVvdruHk=;
 b=H1lPmqk6tEIDfExQeck3UPTcM021/fUNkKSXuMwdhqbqCWqajUISDqk8JeLgyFNGrYhbAb
 umTImPVaLkQ5Sc1xDEFEubNwy6m46Dja9/QV6TfMGJA5RUtEaOvsFWQoPJvxGRmfw1Sx5m
 hpfiUmRU1sI2bJvoRP2cMeX9/xDqcbw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-38-zQRqno1XOXSIfz7f5glIKw-1; Mon, 21 Feb 2022 09:29:14 -0500
X-MC-Unique: zQRqno1XOXSIfz7f5glIKw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A637A814245;
 Mon, 21 Feb 2022 14:29:12 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 432A174EB7;
 Mon, 21 Feb 2022 14:29:12 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/4] tls: add macros for coroutine-safe TLS variables
Date: Mon, 21 Feb 2022 14:29:04 +0000
Message-Id: <20220221142907.346035-2-stefanha@redhat.com>
In-Reply-To: <20220221142907.346035-1-stefanha@redhat.com>
References: <20220221142907.346035-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compiler optimizations can cache TLS values across coroutine yield
points, resulting in stale values from the previous thread when a
coroutine is re-entered by a new thread.

Serge Guelton developed an __attribute__((noinline)) wrapper and tested
it with clang and gcc. I formatted his idea according to QEMU's coding
style and wrote documentation.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1952483
Suggested-by: Serge Guelton <sguelton@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 include/qemu/coroutine-tls.h | 159 +++++++++++++++++++++++++++++++++++
 1 file changed, 159 insertions(+)
 create mode 100644 include/qemu/coroutine-tls.h

diff --git a/include/qemu/coroutine-tls.h b/include/qemu/coroutine-tls.h
new file mode 100644
index 0000000000..e1f8e78d25
--- /dev/null
+++ b/include/qemu/coroutine-tls.h
@@ -0,0 +1,159 @@
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
+ * To stop the compiler from caching TLS values we define accessor functions
+ * with __attribute__((noinline)) plus asm volatile("") to prevent
+ * optimizations that override noinline. This is fragile and ultimately needs
+ * to be solved by a mechanism that is guaranteed to work by the compiler (e.g.
+ * stackless coroutines), but for now we use this approach to prevent issues.
+ */
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
+ * This is a coroutine-safe replacement for the __thread keyword and is
+ * equivalent to the following code:
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
+#define QEMU_DECLARE_CO_TLS(type, var)                                       \
+    __attribute__((noinline)) type get_##var(void);                          \
+    __attribute__((noinline)) void set_##var(type v);                        \
+    __attribute__((noinline)) type *get_ptr_##var(void);
+
+/**
+ * QEMU_DEFINE_CO_TLS:
+ * @type: the variable's C type
+ * @var: the variable name
+ *
+ * Define a variable in Thread Local Storage that was previously declared from
+ * a header file with QEMU_DECLARE_CO_TLS():
+ *
+ * .. code-block:: c
+ *   :caption: Defining a variable in Thread Local Storage
+ *
+ *   QEMU_DEFINE_CO_TLS(int, my_count)
+ *
+ * This is a coroutine-safe replacement for the __thread keyword and is
+ * equivalent to the following code:
+ *
+ * .. code-block:: c
+ *   :caption: Defining a TLS variable using __thread
+ *
+ *   __thread int my_count;
+ */
+#define QEMU_DEFINE_CO_TLS(type, var)                                        \
+    static __thread type co_tls_##var;                                       \
+    type get_##var(void) { asm volatile(""); return co_tls_##var; }          \
+    void set_##var(type v) { asm volatile(""); co_tls_##var = v; }           \
+    type *get_ptr_##var(void)                                                \
+    { type *ptr = &co_tls_##var; asm volatile("" : "+rm" (ptr)); return ptr; }
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
+ * This is a coroutine-safe replacement for the __thread keyword and is
+ * equivalent to the following code:
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
+#define QEMU_DEFINE_STATIC_CO_TLS(type, var)                                 \
+    static __thread type co_tls_##var;                                       \
+    static __attribute__((noinline, unused))                                 \
+    type get_##var(void)                                                     \
+    { asm volatile(""); return co_tls_##var; }                               \
+    static __attribute__((noinline, unused))                                 \
+    void set_##var(type v)                                                   \
+    { asm volatile(""); co_tls_##var = v; }                                  \
+    static __attribute__((noinline, unused))                                 \
+    type *get_ptr_##var(void)                                                \
+    { type *ptr = &co_tls_##var; asm volatile("" : "+rm" (ptr)); return ptr; }
+
+#endif /* QEMU_COROUTINE_TLS_H */
-- 
2.34.1


