Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 961E13BEA3F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:03:01 +0200 (CEST)
Received: from localhost ([::1]:45376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m194m-0006T5-MJ
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:03:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m192c-0003xq-CP
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:00:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m192Z-0006FB-9L
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:00:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HHTqHtDAYGO8HY1kxDyuIi+mr/c2wOexrvV9Jc95EEA=;
 b=U6AALbTmIGIFz2V1grPlla+nOwSAownmkNvVWH2UDv6oDvxluydht9SH6AjGcbSCmB3KP1
 vvL3kTGvwMQOP2N7qgfu5uNYfU7rXSDdtEbHgUQd6E+vr7JwcXDzqXXahESiNAcB7Jx0Ve
 QSuWrdc039yB5SW7R7VDchgAS7fA6PY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-479-fgNZvsAVOAS1MMrpLq0f7A-1; Wed, 07 Jul 2021 11:00:41 -0400
X-MC-Unique: fgNZvsAVOAS1MMrpLq0f7A-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E01F100C664;
 Wed,  7 Jul 2021 15:00:40 +0000 (UTC)
Received: from steredhat.tendawifi.com (ovpn-112-132.ams2.redhat.com
 [10.36.112.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 26AB45C1D5;
 Wed,  7 Jul 2021 15:00:33 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] iothread: add aio-max-batch parameter
Date: Wed,  7 Jul 2021 17:00:18 +0200
Message-Id: <20210707150019.201442-3-sgarzare@redhat.com>
In-Reply-To: <20210707150019.201442-1-sgarzare@redhat.com>
References: <20210707150019.201442-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The `aio-max-batch` parameter will be propagated to AIO engines
and it will be used to control the maximum number of queued requests.

When there are in queue a number of requests equal to `aio-max-batch`,
the engine invokes the system call to forward the requests to the kernel.

This parameter allows us to control the maximum batch size to reduce
the latency that requests might accumulate while queued in the AIO
engine queue.

If `aio-max-batch` is equal to 0 (default value), the AIO engine will
use its default maximum batch size value.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 qapi/misc.json            |  6 ++++-
 qapi/qom.json             |  7 ++++-
 include/block/aio.h       | 12 +++++++++
 include/sysemu/iothread.h |  3 +++
 iothread.c                | 55 +++++++++++++++++++++++++++++++++++----
 monitor/hmp-cmds.c        |  2 ++
 util/aio-posix.c          | 12 +++++++++
 util/aio-win32.c          |  5 ++++
 util/async.c              |  2 ++
 qemu-options.hx           |  8 ++++--
 10 files changed, 103 insertions(+), 9 deletions(-)

diff --git a/qapi/misc.json b/qapi/misc.json
index 156f98203e..f64bb69f74 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -86,6 +86,9 @@
 # @poll-shrink: how many ns will be removed from polling time, 0 means that
 #               it's not configured (since 2.9)
 #
+# @aio-max-batch: maximum number of requests in a bacth for the AIO engine,
+#                 0 means that the engine will use its default (since 6.1)
+#
 # Since: 2.0
 ##
 { 'struct': 'IOThreadInfo',
@@ -93,7 +96,8 @@
            'thread-id': 'int',
            'poll-max-ns': 'int',
            'poll-grow': 'int',
-           'poll-shrink': 'int' } }
+           'poll-shrink': 'int',
+           'aio-max-batch': 'int' } }
 
 ##
 # @query-iothreads:
diff --git a/qapi/qom.json b/qapi/qom.json
index 652be317b8..23fd586614 100644
--- a/qapi/qom.json
+++ b/qapi/qom.json
@@ -516,12 +516,17 @@
 #               algorithm detects it is spending too long polling without
 #               encountering events. 0 selects a default behaviour (default: 0)
 #
+# @aio-max-batch: maximum number of requests in a bacth for the AIO engine,
+#                 0 means that the engine will use its default
+#                 (default:0, since 6.1)
+#
 # Since: 2.0
 ##
 { 'struct': 'IothreadProperties',
   'data': { '*poll-max-ns': 'int',
             '*poll-grow': 'int',
-            '*poll-shrink': 'int' } }
+            '*poll-shrink': 'int',
+            '*aio-max-batch': 'int' } }
 
 ##
 # @MemoryBackendProperties:
diff --git a/include/block/aio.h b/include/block/aio.h
index 10fcae1515..5b7983348f 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -232,6 +232,9 @@ struct AioContext {
     int64_t poll_grow;      /* polling time growth factor */
     int64_t poll_shrink;    /* polling time shrink factor */
 
+    /* AIO engine parameters */
+    int64_t aio_max_batch;  /* maximum number of requests in a batch */
+
     /*
      * List of handlers participating in userspace polling.  Protected by
      * ctx->list_lock.  Iterated and modified mostly by the event loop thread
@@ -730,4 +733,13 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
                                  int64_t grow, int64_t shrink,
                                  Error **errp);
 
+/**
+ * aio_context_set_aio_params:
+ * @ctx: the aio context
+ * @max_batch: maximum number of requests in a bacth, 0 means that the
+ *             engine will use its default
+ */
+void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
+                                Error **errp);
+
 #endif
diff --git a/include/sysemu/iothread.h b/include/sysemu/iothread.h
index f177142f16..7f714bd136 100644
--- a/include/sysemu/iothread.h
+++ b/include/sysemu/iothread.h
@@ -37,6 +37,9 @@ struct IOThread {
     int64_t poll_max_ns;
     int64_t poll_grow;
     int64_t poll_shrink;
+
+    /* AioContext AIO engine parameters */
+    int64_t aio_max_batch;
 };
 typedef struct IOThread IOThread;
 
diff --git a/iothread.c b/iothread.c
index 103679a16b..ddbbde61f7 100644
--- a/iothread.c
+++ b/iothread.c
@@ -152,6 +152,24 @@ static void iothread_init_gcontext(IOThread *iothread)
     iothread->main_loop = g_main_loop_new(iothread->worker_context, TRUE);
 }
 
+static void iothread_set_aio_context_params(IOThread *iothread, Error **errp)
+{
+    ERRP_GUARD();
+
+    aio_context_set_poll_params(iothread->ctx,
+                                iothread->poll_max_ns,
+                                iothread->poll_grow,
+                                iothread->poll_shrink,
+                                errp);
+    if (*errp) {
+        return;
+    }
+
+    aio_context_set_aio_params(iothread->ctx,
+                               iothread->aio_max_batch,
+                               errp);
+}
+
 static void iothread_complete(UserCreatable *obj, Error **errp)
 {
     Error *local_error = NULL;
@@ -171,11 +189,7 @@ static void iothread_complete(UserCreatable *obj, Error **errp)
      */
     iothread_init_gcontext(iothread);
 
-    aio_context_set_poll_params(iothread->ctx,
-                                iothread->poll_max_ns,
-                                iothread->poll_grow,
-                                iothread->poll_shrink,
-                                &local_error);
+    iothread_set_aio_context_params(iothread, &local_error);
     if (local_error) {
         error_propagate(errp, local_error);
         aio_context_unref(iothread->ctx);
@@ -212,6 +226,9 @@ static PollParamInfo poll_grow_info = {
 static PollParamInfo poll_shrink_info = {
     "poll-shrink", offsetof(IOThread, poll_shrink),
 };
+static PollParamInfo aio_max_batch_info = {
+    "aio-max-batch", offsetof(IOThread, aio_max_batch),
+};
 
 static void iothread_get_param(Object *obj, Visitor *v,
         const char *name, void *opaque, Error **errp)
@@ -271,6 +288,29 @@ static void iothread_set_poll_param(Object *obj, Visitor *v,
     }
 }
 
+static void iothread_get_aio_param(Object *obj, Visitor *v,
+        const char *name, void *opaque, Error **errp)
+{
+
+    iothread_get_param(obj, v, name, opaque, errp);
+}
+
+static void iothread_set_aio_param(Object *obj, Visitor *v,
+        const char *name, void *opaque, Error **errp)
+{
+    IOThread *iothread = IOTHREAD(obj);
+
+    if (!iothread_set_param(obj, v, name, opaque, errp)) {
+        return;
+    }
+
+    if (iothread->ctx) {
+        aio_context_set_aio_params(iothread->ctx,
+                                   iothread->aio_max_batch,
+                                   errp);
+    }
+}
+
 static void iothread_class_init(ObjectClass *klass, void *class_data)
 {
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(klass);
@@ -288,6 +328,10 @@ static void iothread_class_init(ObjectClass *klass, void *class_data)
                               iothread_get_poll_param,
                               iothread_set_poll_param,
                               NULL, &poll_shrink_info);
+    object_class_property_add(klass, "aio-max-batch", "int",
+                              iothread_get_aio_param,
+                              iothread_set_aio_param,
+                              NULL, &aio_max_batch_info);
 }
 
 static const TypeInfo iothread_info = {
@@ -337,6 +381,7 @@ static int query_one_iothread(Object *object, void *opaque)
     info->poll_max_ns = iothread->poll_max_ns;
     info->poll_grow = iothread->poll_grow;
     info->poll_shrink = iothread->poll_shrink;
+    info->aio_max_batch = iothread->aio_max_batch;
 
     QAPI_LIST_APPEND(*tail, info);
     return 0;
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
index 0942027208..e00255f7ee 100644
--- a/monitor/hmp-cmds.c
+++ b/monitor/hmp-cmds.c
@@ -1893,6 +1893,8 @@ void hmp_info_iothreads(Monitor *mon, const QDict *qdict)
         monitor_printf(mon, "  poll-max-ns=%" PRId64 "\n", value->poll_max_ns);
         monitor_printf(mon, "  poll-grow=%" PRId64 "\n", value->poll_grow);
         monitor_printf(mon, "  poll-shrink=%" PRId64 "\n", value->poll_shrink);
+        monitor_printf(mon, "  aio-max-batch=%" PRId64 "\n",
+                       value->aio_max_batch);
     }
 
     qapi_free_IOThreadInfoList(info_list);
diff --git a/util/aio-posix.c b/util/aio-posix.c
index 30f5354b1e..2b86777e91 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -716,3 +716,15 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
 
     aio_notify(ctx);
 }
+
+void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
+                                Error **errp)
+{
+    /*
+     * No thread synchronization here, it doesn't matter if an incorrect value
+     * is used once.
+     */
+    ctx->aio_max_batch = max_batch;
+
+    aio_notify(ctx);
+}
diff --git a/util/aio-win32.c b/util/aio-win32.c
index 168717b51b..d5b09a1193 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -440,3 +440,8 @@ void aio_context_set_poll_params(AioContext *ctx, int64_t max_ns,
         error_setg(errp, "AioContext polling is not implemented on Windows");
     }
 }
+
+void aio_context_set_aio_params(AioContext *ctx, int64_t max_batch,
+                                Error **errp)
+{
+}
diff --git a/util/async.c b/util/async.c
index 5d9b7cc1eb..f3510ea4f9 100644
--- a/util/async.c
+++ b/util/async.c
@@ -537,6 +537,8 @@ AioContext *aio_context_new(Error **errp)
     ctx->poll_grow = 0;
     ctx->poll_shrink = 0;
 
+    ctx->aio_max_batch = 0;
+
     return ctx;
 fail:
     g_source_destroy(&ctx->source);
diff --git a/qemu-options.hx b/qemu-options.hx
index 8965dabc83..43c03a8e3c 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -5255,7 +5255,7 @@ SRST
 
             CN=laptop.example.com,O=Example Home,L=London,ST=London,C=GB
 
-    ``-object iothread,id=id,poll-max-ns=poll-max-ns,poll-grow=poll-grow,poll-shrink=poll-shrink``
+    ``-object iothread,id=id,poll-max-ns=poll-max-ns,poll-grow=poll-grow,poll-shrink=poll-shrink,aio-max-batch=aio-max-batch``
         Creates a dedicated event loop thread that devices can be
         assigned to. This is known as an IOThread. By default device
         emulation happens in vCPU threads or the main event loop thread.
@@ -5291,7 +5291,11 @@ SRST
         the polling time when the algorithm detects it is spending too
         long polling without encountering events.
 
-        The polling parameters can be modified at run-time using the
+        The ``aio-max-batch`` parameter is the maximum number of requests
+        in a batch for the AIO engine, 0 means that the engine will use
+        its default.
+
+        The IOThread parameters can be modified at run-time using the
         ``qom-set`` command (where ``iothread1`` is the IOThread's
         ``id``):
 
-- 
2.31.1


