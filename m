Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4A7674D97
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 08:03:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIlPG-0000A5-By; Fri, 20 Jan 2023 02:01:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlOz-0008UF-OL
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1pIlOw-0005Fy-Rr
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 02:01:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674198085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d9ORpZB/nS35WM2wJV7axvWxJFHw5VO3WMZewxjuvtc=;
 b=XFdhx+68deEg9pQm7PUtYV6TUqgzbWUN+e+gpMpurVdwQrNqWXwM97i28nBxL27rwonhih
 9wJQEmzLTqIOzGPqZYYjLT/9hvg/TdW7BvhKXOimwyhvnyAACZweFRhZBIeMoFlYV05wx0
 p8HNKMzZG1BJACA1JjZxWVm48kmy4QM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-nqHD2E9DMLqmluMzC9JsWQ-1; Fri, 20 Jan 2023 02:01:24 -0500
X-MC-Unique: nqHD2E9DMLqmluMzC9JsWQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CF72185C06B;
 Fri, 20 Jan 2023 07:01:23 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.70])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 89F66492B02;
 Fri, 20 Jan 2023 07:01:23 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 85B7B21E66CD; Fri, 20 Jan 2023 08:01:22 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PULL 02/12] coroutine: Move coroutine_fn to qemu/osdep.h,
 trim includes
Date: Fri, 20 Jan 2023 08:01:12 +0100
Message-Id: <20230120070122.3982588-3-armbru@redhat.com>
In-Reply-To: <20230120070122.3982588-1-armbru@redhat.com>
References: <20230120070122.3982588-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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

block/block-hmp-cmds.h and qemu/co-shared-resource.h use coroutine_fn
without including qemu/coroutine.h.  They compile only if it's already
included from elsewhere.

I could fix that, but pulling in qemu/coroutine.h and everything it
includes just for a macro that expands into nothing feels silly.
Instead, move the macro to qemu/osdep.h.

Inclusions of qemu/coroutine.h just for coroutine_fn become
superfluous.  Drop them.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20221221131435.3851212-3-armbru@redhat.com>
---
 include/block/aio_task.h     |  2 --
 include/block/block-common.h |  1 -
 include/block/graph-lock.h   |  2 --
 include/monitor/hmp.h        |  1 -
 include/qemu/coroutine.h     | 18 +++++++-----------
 include/qemu/osdep.h         | 16 ++++++++++++++++
 6 files changed, 23 insertions(+), 17 deletions(-)

diff --git a/include/block/aio_task.h b/include/block/aio_task.h
index 50bc1e1817..18a9c41f4e 100644
--- a/include/block/aio_task.h
+++ b/include/block/aio_task.h
@@ -25,8 +25,6 @@
 #ifndef BLOCK_AIO_TASK_H
 #define BLOCK_AIO_TASK_H
 
-#include "qemu/coroutine.h"
-
 typedef struct AioTaskPool AioTaskPool;
 typedef struct AioTask AioTask;
 typedef int coroutine_fn (*AioTaskFunc)(AioTask *task);
diff --git a/include/block/block-common.h b/include/block/block-common.h
index 4749c46a5e..434ffc5d34 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -27,7 +27,6 @@
 #include "block/aio.h"
 #include "block/aio-wait.h"
 #include "qemu/iov.h"
-#include "qemu/coroutine.h"
 #include "block/accounting.h"
 #include "qemu/hbitmap.h"
 #include "qemu/transactions.h"
diff --git a/include/block/graph-lock.h b/include/block/graph-lock.h
index 4c92cd8edf..3ab924d5e2 100644
--- a/include/block/graph-lock.h
+++ b/include/block/graph-lock.h
@@ -23,8 +23,6 @@
 #include "qemu/osdep.h"
 #include "qemu/clang-tsa.h"
 
-#include "qemu/coroutine.h"
-
 /**
  * Graph Lock API
  * This API provides a rwlock used to protect block layer
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index 27f86399f7..c9e3887737 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -15,7 +15,6 @@
 #define HMP_H
 
 #include "qemu/readline.h"
-#include "qemu/coroutine.h"
 #include "qapi/qapi-types-common.h"
 
 bool hmp_handle_error(Monitor *mon, Error *err);
diff --git a/include/qemu/coroutine.h b/include/qemu/coroutine.h
index 89650a2d7f..2496a4f4ef 100644
--- a/include/qemu/coroutine.h
+++ b/include/qemu/coroutine.h
@@ -26,23 +26,19 @@
  * waiting for events to complete.
  *
  * These functions are re-entrant and may be used outside the global mutex.
- */
-
-/**
- * Mark a function that executes in coroutine context
  *
- * Functions that execute in coroutine context cannot be called directly from
- * normal functions.  In the future it would be nice to enable compiler or
- * static checker support for catching such errors.  This annotation might make
- * it possible and in the meantime it serves as documentation.
- *
- * For example:
+ * Functions that execute in coroutine context cannot be called
+ * directly from normal functions.  Use @coroutine_fn to mark such
+ * functions.  For example:
  *
  *   static void coroutine_fn foo(void) {
  *       ....
  *   }
+ *
+ * In the future it would be nice to have the compiler or a static
+ * checker catch misuse of such functions.  This annotation might make
+ * it possible and in the meantime it serves as documentation.
  */
-#define coroutine_fn
 
 typedef struct Coroutine Coroutine;
 
diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
index bd23a08595..c850001408 100644
--- a/include/qemu/osdep.h
+++ b/include/qemu/osdep.h
@@ -157,6 +157,22 @@ extern "C" {
 
 #include "qemu/typedefs.h"
 
+/**
+ * Mark a function that executes in coroutine context
+ *
+ * Functions that execute in coroutine context cannot be called directly from
+ * normal functions.  In the future it would be nice to enable compiler or
+ * static checker support for catching such errors.  This annotation might make
+ * it possible and in the meantime it serves as documentation.
+ *
+ * For example:
+ *
+ *   static void coroutine_fn foo(void) {
+ *       ....
+ *   }
+ */
+#define coroutine_fn
+
 /*
  * For mingw, as of v6.0.0, the function implementing the assert macro is
  * not marked as noreturn, so the compiler cannot delete code following an
-- 
2.39.0


