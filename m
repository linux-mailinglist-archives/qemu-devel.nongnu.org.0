Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 542CC439833
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:11:27 +0200 (CEST)
Received: from localhost ([::1]:36548 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0hC-0001YD-Ew
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:11:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mf0du-0005Qn-F8
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:08:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mf0dr-0006qC-V9
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:08:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635170879;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZxL5vHfR45EwUHIvdSwccHh74kKBhMZzDkyhDc4Si5w=;
 b=AmtUNVE3fCliP/w5nOJ6BcG+uzYNlKaXqLmuftGi+BN+VxYc32OZkYC1RrHeea3n7KDCgl
 uGIOhhDOBhY+G4/r/wtfeoPBoq2kO+wtvesfuVTsPEUzjqDFhtJNGL/zif5rK5BpDjZxOA
 IgcPdSOoFDbrBpQ0qMy0NabqJBDrMJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-18-yX0e1oTfO62WPf1jp7RD_A-1; Mon, 25 Oct 2021 10:07:57 -0400
X-MC-Unique: yX0e1oTfO62WPf1jp7RD_A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E675A10A8E09;
 Mon, 25 Oct 2021 14:07:56 +0000 (UTC)
Received: from localhost (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2310B61064;
 Mon, 25 Oct 2021 14:07:40 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/2] tls: add macros for coroutine-safe TLS variables
Date: Mon, 25 Oct 2021 15:07:15 +0100
Message-Id: <20211025140716.166971-2-stefanha@redhat.com>
In-Reply-To: <20211025140716.166971-1-stefanha@redhat.com>
References: <20211025140716.166971-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Compiler optimizations can cache TLS values across coroutine yield
points, resulting in stale values from the previous thread when a
coroutine is re-entered by a new thread.

Serge Guelton developed an __attribute__((noinline)) wrapper and tested
it with clang and gcc. I formatted his idea according to QEMU's coding
style and wrote documentation.

These macros must be used instead of __thread from now on to prevent
coroutine TLS bugs.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1952483
Suggested-by: Serge Guelton <sguelton@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 MAINTAINERS        |   1 +
 include/qemu/tls.h | 142 +++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)
 create mode 100644 include/qemu/tls.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 894dc43105..cf225b7029 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2869,6 +2869,7 @@ M: Kevin Wolf <kwolf@redhat.com>
 S: Maintained
 F: util/*coroutine*
 F: include/qemu/coroutine*
+F: include/qemu/tls.h
 F: tests/unit/test-coroutine.c
 
 Buffers
diff --git a/include/qemu/tls.h b/include/qemu/tls.h
new file mode 100644
index 0000000000..9a5ccc6c52
--- /dev/null
+++ b/include/qemu/tls.h
@@ -0,0 +1,142 @@
+/*
+ * QEMU Thread Local Storage
+ *
+ * Copyright Red Hat
+ *
+ * SPDX-License-Identifier: LGPL-2.1-or-later
+ *
+ * This work is licensed under the terms of the GNU LGPL, version 2.1 or later.
+ * See the COPYING.LIB file in the top-level directory.
+ *
+ * It is forbidden to use __thread in QEMU because compiler optimizations may
+ * cause Thread Local Storage variables to be cached across coroutine re-entry.
+ * Coroutines can run in more than one thread through the course of their life,
+ * leading bugs when stale TLS values from the wrong thread are used as a
+ * result of compiler optimization.
+ *
+ * Although avoiding __thread is strictly only necessary when coroutines access
+ * the variable this is hard to audit or enforce in practice. Therefore
+ * __thread is forbidden everywhere. This prevents subtle bugs from creeping in
+ * if a variable that was previously not accessed from coroutines is now
+ * accessed from coroutines.
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
+ *   QEMU_DECLARE_STATIC_TLS(AioContext *, current_aio_context)
+ *   ...
+ *   static void coroutine_fn foo(void)
+ *   {
+ *       aio_notify(get_current_aio_context());
+ *       qemu_coroutine_yield();
+ *       aio_notify(get_current_aio_context()); // <-- safe
+ *   }
+ */
+
+#ifndef QEMU_TLS_H
+#define QEMU_TLS_H
+
+/**
+ * QEMU_DECLARE_TLS:
+ * @type: the variable's C type
+ * @var: the variable name
+ *
+ * Declare an extern variable in Thread Local Storage from a header file:
+ *
+ * .. code-block:: c
+ *   :caption: Declaring an extern variable in Thread Local Storage
+ *
+ *   QEMU_DECLARE_TLS(int, my_count)
+ *   ...
+ *   int c = get_my_count();
+ *   set_my_count(c + 1);
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
+ */
+#define QEMU_DECLARE_TLS(type, var) \
+    __attribute__((noinline)) type get_##var(void); \
+    __attribute__((noinline)) void set_##var(type v); \
+
+/**
+ * QEMU_DEFINE_TLS:
+ * @type: the variable's C type
+ * @var: the variable name
+ *
+ * Define an variable in Thread Local Storage that was previously declared from
+ * a header file with QEMU_DECLARE_TLS():
+ *
+ * .. code-block:: c
+ *   :caption: Defining a variable in Thread Local Storage
+ *
+ *   QEMU_DEFINE_TLS(int, my_count)
+ *
+ * Use this instead of:
+ *
+ * .. code-block:: c
+ *   :caption: Defining a TLS variable using __thread
+ *
+ *   __thread int my_count;
+ */
+#define QEMU_DEFINE_TLS(type, var) \
+    __thread type qemu_tls_##var; \
+    type get_##var(void) { return qemu_tls_##var; } \
+    void set_##var(type v) { qemu_tls_##var = v; }
+
+/**
+ * QEMU_DEFINE_STATIC_TLS:
+ * @type: the variable's C type
+ * @var: the variable name
+ *
+ * Define a static variable in Thread Local Storage:
+ *
+ * .. code-block:: c
+ *   :caption: Defining a static variable in Thread Local Storage
+ *
+ *   QEMU_DEFINE_STATIC_TLS(int, my_count)
+ *   ...
+ *   int c = get_my_count();
+ *   set_my_count(c + 1);
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
+ */
+#define QEMU_DEFINE_STATIC_TLS(type, var) \
+    static __thread type qemu_tls_##var; \
+    static __attribute__((noinline)) type get_##var(void); \
+    static type get_##var(void) { return qemu_tls_##var; } \
+    static __attribute__((noinline)) void set_##var(type v); \
+    static void set_##var(type v) { qemu_tls_##var = v; }
+
+#endif /* QEMU_TLS_H */
-- 
2.31.1


