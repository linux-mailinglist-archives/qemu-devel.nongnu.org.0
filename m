Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 475792A8783
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Nov 2020 20:46:26 +0100 (CET)
Received: from localhost ([::1]:37958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kalDC-0007Iy-VX
	for lists+qemu-devel@lfdr.de; Thu, 05 Nov 2020 14:46:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kalBP-0006qy-MS
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 14:44:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1kalBL-0001uf-UH
 for qemu-devel@nongnu.org; Thu, 05 Nov 2020 14:44:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604605466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=6eNEoeXfc5ez3tr2mQ5dzlA3PIZzEWSh+pM9YsqJQCs=;
 b=IOxo0LpDCXl5KZXsZnKYBZ8FlXS/KogOgIlhRDaxHJDtHd2LTsjHj/MFgKmZgpW870CyvU
 TL2gF/MbByBX5+zivdiFh3Sgi/Rued6Yq4Ej658G12w40WNRGkIEp8YZp/xbN6KNkuu+kB
 q/4hJmRJkXVf7z/Cbbv5f/uOl1nYuDU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-guXbQ1L6NzeDBzMI5vAoAQ-1; Thu, 05 Nov 2020 14:44:24 -0500
X-MC-Unique: guXbQ1L6NzeDBzMI5vAoAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E97AB5F9F4;
 Thu,  5 Nov 2020 19:44:22 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-75.rdu2.redhat.com [10.10.115.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF07F17511;
 Thu,  5 Nov 2020 19:44:16 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 1632C2202CA; Thu,  5 Nov 2020 14:44:16 -0500 (EST)
Date: Thu, 5 Nov 2020 14:44:16 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org, virtio-fs-list <virtio-fs@redhat.com>
Subject: [PATCH] virtiofsd: Use --thread-pool-size=0 to mean no thread pool
Message-ID: <20201105194416.GA1384085@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/04 22:46:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: jose.carlos.venegas.munoz@intel.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Right now we create a thread pool and main thread hands over the request
to thread in thread pool to process. Number of threads in thread pool
can be managed by option --thread-pool-size.

There is a chance that in case of some workloads, we might get better
performance if we don't handover the request to a different thread
and process in the context of thread receiving the request.

To implement that, redefine the meaning of --thread-pool-size=0 to
mean that don't use a thread pool. Instead process the request in
the context of thread receiving request from the queue.

I can't think how --thread-pool-size=0 is useful and hence using
that. If it is already useful somehow, I could look at defining
a new option say "--no-thread-pool".

I think this patch will be used more as a debug help to do comparison
when it is more effecient to do not hand over the requests to a
thread pool.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 33 ++++++++++++++++++++++++---------
 1 file changed, 24 insertions(+), 9 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index ff86f6d1ce..60aa7cd3e5 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -695,13 +695,17 @@ static void *fv_queue_thread(void *opaque)
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
+        fuse_log(FUSE_LOG_DEBUG, "%s: Creating thread pool for Queue %d\n", __func__, qi->qidx);
+        pool = g_thread_pool_new(fv_queue_worker, qi, se->thread_pool_size,
+                                 FALSE, NULL);
+        if (!pool) {
+            fuse_log(FUSE_LOG_ERR, "%s: g_thread_pool_new failed\n", __func__);
+            return NULL;
+        }
     }
 
     fuse_log(FUSE_LOG_INFO, "%s: Start for queue %d kick_fd %d\n", __func__,
@@ -780,14 +784,25 @@ static void *fv_queue_thread(void *opaque)
             req->bad_in_num = bad_in_num;
             req->bad_out_num = bad_out_num;
 
-            g_thread_pool_push(pool, req, NULL);
+            if (!se->thread_pool_size)
+                req_list = g_list_prepend(req_list, req);
+            else
+                g_thread_pool_push(pool, req, NULL);
         }
 
         pthread_mutex_unlock(&qi->vq_lock);
         pthread_rwlock_unlock(&qi->virtio_dev->vu_dispatch_rwlock);
+
+        // Process all the requests.
+        if (!se->thread_pool_size && req_list != NULL) {
+	    g_list_foreach(req_list, fv_queue_worker, qi);
+	    g_list_free(req_list);
+            req_list = NULL;
+	}
     }
 
-    g_thread_pool_free(pool, FALSE, TRUE);
+    if (pool)
+        g_thread_pool_free(pool, FALSE, TRUE);
 
     return NULL;
 }
-- 
2.25.4


