Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D66A64719F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 15:24:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3HoD-0003eJ-Uj; Thu, 08 Dec 2022 09:23:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3Hnw-0003c5-33
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:23:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p3Hns-0000dq-I3
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 09:23:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670509391;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=11mJbKf5IfuVCVdGNxPkc+W9o1A2eLBy/HgkZ+OUY/A=;
 b=P4ty0V856GqAV+UchbQ8aaoqzjU+NW/d3eG8BvxZeJMHh7nOFbdyspdOQ7+MnGXyNXQ9xB
 z86o15ILkhhq0WeTWArS6X6bJFfrc4oOVsbYjB3YozmWUD2BJDSNfutf5ynWl028xAo+se
 oyEaMes7EjkHSRNHKej+rKIlgu/jbB8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-bLHLN1MtOnGxjpsew2Z20w-1; Thu, 08 Dec 2022 09:23:09 -0500
X-MC-Unique: bLHLN1MtOnGxjpsew2Z20w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 87A438032E3
 for <qemu-devel@nongnu.org>; Thu,  8 Dec 2022 14:23:09 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.144])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5564A17582;
 Thu,  8 Dec 2022 14:23:09 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 4537621E6936; Thu,  8 Dec 2022 15:23:06 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
	kwolf@redhat.com
Subject: [PATCH 2/4] coroutine: Move coroutine_fn to qemu/osdep.h,
 trim includes
Date: Thu,  8 Dec 2022 15:23:04 +0100
Message-Id: <20221208142306.2642640-3-armbru@redhat.com>
In-Reply-To: <20221208142306.2642640-1-armbru@redhat.com>
References: <20221208142306.2642640-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
---
 include/block/aio_task.h     |  2 --
 include/block/block-common.h |  1 -
 include/monitor/hmp.h        |  1 -
 include/qemu/coroutine.h     | 18 +++++++-----------
 include/qemu/osdep.h         | 16 ++++++++++++++++
 5 files changed, 23 insertions(+), 15 deletions(-)

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
index 297704c1e9..0f6b8422bd 100644
--- a/include/block/block-common.h
+++ b/include/block/block-common.h
@@ -27,7 +27,6 @@
 #include "block/aio.h"
 #include "block/aio-wait.h"
 #include "qemu/iov.h"
-#include "qemu/coroutine.h"
 #include "block/accounting.h"
 #include "block/dirty-bitmap.h"
 #include "block/blockjob.h"
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index dfbc0c9a2f..c92f69da8b 100644
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
index b9c4307779..8e97e5d79a 100644
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
2.37.3


