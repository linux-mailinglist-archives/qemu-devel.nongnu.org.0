Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55FAB2DE1B3
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 12:02:51 +0100 (CET)
Received: from localhost ([::1]:48750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqDX8-0002Mb-D2
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 06:02:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCg-0003Cn-BJ
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kqDCe-0004ZT-IY
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 05:41:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608288100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=w0nkvQYI5RGRxsFjUD91f2WONLDlvHrVWt56hOA4xfc=;
 b=XwE5CUHpbp468wBeHxQYf7lhAaCmmK+U8Rxaw7723AzldSZMYJI7Avc5EqyYY404toTEVs
 qENMMlirsxMp9P4xXKQxLUazd3F4UXGH0fMwenIUu0+djJBtVS/X5Z/6VTmCrxYOXa5Cxo
 QfAYfCSs6RirHxwY3Marp3zGsnouubk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-315-4CA8ct6aNvaIpKt0s6r2Hw-1; Fri, 18 Dec 2020 05:41:38 -0500
X-MC-Unique: 4CA8ct6aNvaIpKt0s6r2Hw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E9025801817;
 Fri, 18 Dec 2020 10:41:36 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-200.ams2.redhat.com
 [10.36.114.200])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E408660C15;
 Fri, 18 Dec 2020 10:41:34 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, aiyutao@huawei.com, peter.maydell@linaro.org,
 vgoyal@redhat.com, lersek@redhat.com, alex.chen@huawei.com,
 armbru@redhat.com, tu.guoyi@h3c.com
Subject: [PULL 05/15] virtiofsd: Use --thread-pool-size=0 to mean no thread
 pool
Date: Fri, 18 Dec 2020 10:41:07 +0000
Message-Id: <20201218104117.199096-6-dgilbert@redhat.com>
In-Reply-To: <20201218104117.199096-1-dgilbert@redhat.com>
References: <20201218104117.199096-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: stefanha@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Goyal <vgoyal@redhat.com>

Right now we create a thread pool and main thread hands over the request
to thread in thread pool to process. Number of threads in thread pool
can be managed by option --thread-pool-size.

In tests we have noted that many of the workloads are getting better
performance if we don't use a thread pool at all and process all
the requests in the context of a thread receiving the request.

Hence give user an option to be able to run virtiofsd without using
a thread pool.

To implement this, I have used existing option --thread-pool-size. This
option defines how many maximum threads can be in the thread pool.
Thread pool size zero freezes thead pool. I can't see why will one
start virtiofsd with a frozen thread pool (hence frozen file system).
So I am redefining --thread-pool-size=0 to mean, don't use a thread pool.
Instead process the request in the context of thread receiving request
from the queue.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
Message-Id: <20201109143548.GA1479853@redhat.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 36 ++++++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 9 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index b264dcbd18..ddcefee427 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -578,13 +578,18 @@ static void *fv_queue_thread(void *opaque)
     struct VuDev *dev = &qi->virtio_dev->dev;
     struct VuVirtq *q = vu_get_queue(dev, qi->qidx);
     struct fuse_session *se = qi->virtio_dev->se;
-    GThreadPool *pool;
-
-    pool = g_thread_pool_new(fv_queue_worker, qi, se->thread_pool_size, FALSE,
-                             NULL);
-    if (!pool) {
-        fuse_log(FUSE_LOG_ERR, "%s: g_thread_pool_new failed\n", __func__);
-        return NULL;
+    GThreadPool *pool = NULL;
+    GList *req_list = NULL;
+
+    if (se->thread_pool_size) {
+        fuse_log(FUSE_LOG_DEBUG, "%s: Creating thread pool for Queue %d\n",
+                 __func__, qi->qidx);
+        pool = g_thread_pool_new(fv_queue_worker, qi, se->thread_pool_size,
+                                 FALSE, NULL);
+        if (!pool) {
+            fuse_log(FUSE_LOG_ERR, "%s: g_thread_pool_new failed\n", __func__);
+            return NULL;
+        }
     }
 
     fuse_log(FUSE_LOG_INFO, "%s: Start for queue %d kick_fd %d\n", __func__,
@@ -659,14 +664,27 @@ static void *fv_queue_thread(void *opaque)
 
             req->reply_sent = false;
 
-            g_thread_pool_push(pool, req, NULL);
+            if (!se->thread_pool_size) {
+                req_list = g_list_prepend(req_list, req);
+            } else {
+                g_thread_pool_push(pool, req, NULL);
+            }
         }
 
         pthread_mutex_unlock(&qi->vq_lock);
         pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+
+        /* Process all the requests. */
+        if (!se->thread_pool_size && req_list != NULL) {
+            g_list_foreach(req_list, fv_queue_worker, qi);
+            g_list_free(req_list);
+            req_list = NULL;
+        }
     }
 
-    g_thread_pool_free(pool, FALSE, TRUE);
+    if (pool) {
+        g_thread_pool_free(pool, FALSE, TRUE);
+    }
 
     return NULL;
 }
-- 
2.29.2


