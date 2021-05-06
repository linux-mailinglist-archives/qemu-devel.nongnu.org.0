Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E723A375BA2
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 21:20:34 +0200 (CEST)
Received: from localhost ([::1]:41898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lejY1-0007Bo-VE
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 15:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBl-0005im-Sw
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lejBc-0005hY-Jy
 for qemu-devel@nongnu.org; Thu, 06 May 2021 14:57:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620327442;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhCPmU82AN1xmN8DoqLWWjVSbLSl0fuMooXTx+FsK9Q=;
 b=WE0VbGfP7Epq94kcr9u/wL0K3QEVdjjsZDl9AaDWFxuZuwRGcQTjNvujp9bq3IC5UBG1Va
 prRZ8xjWVXOHV555jT6nUS2WJuwk52MM22hlRKrRGhPF9KQL30iqwWEhN7KI7vV2cd7APH
 jbwvywN9bp2KxudXtJE9uxIRM4ogEMc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-fgup0tT0O92SB_fqpCq76w-1; Thu, 06 May 2021 14:57:20 -0400
X-MC-Unique: fgup0tT0O92SB_fqpCq76w-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 37657801817;
 Thu,  6 May 2021 18:57:19 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-37.ams2.redhat.com
 [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9FD4419C46;
 Thu,  6 May 2021 18:57:17 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, jose.carlos.venegas.munoz@intel.com,
 ma.mandourr@gmail.com
Subject: [PULL 10/12] virtiofsd: Changed allocations of fv_VuDev & its
 internals to GLib functions
Date: Thu,  6 May 2021 19:56:39 +0100
Message-Id: <20210506185641.284821-11-dgilbert@redhat.com>
In-Reply-To: <20210506185641.284821-1-dgilbert@redhat.com>
References: <20210506185641.284821-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, vgoyal@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Changed the allocations of fv_VuDev structs, VuDev structs, and
fv_QueueInfo strcuts from using calloc()/realloc() & free() to using
the equivalent functions from GLib.

In instances, removed the pair of allocation and assertion for
non-NULL checking with a GLib function that aborts on error.

Removed NULL-checking for fv_VuDev struct allocation and used
a GLib function that crashes on error; namely, g_new0(). This
is because allocating one struct should not be a problem on an
healthy system. Also following the pattern of aborting-on-null
behaviour that is taken with allocating VuDev structs and
fv_QueueInfo structs.

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210420154643.58439-6-ma.mandourr@gmail.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 19 ++++++-------------
 1 file changed, 6 insertions(+), 13 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index a3d37ab696..828f0fa590 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -782,7 +782,7 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
     pthread_mutex_destroy(&ourqi->vq_lock);
     close(ourqi->kill_fd);
     ourqi->kick_fd = -1;
-    free(vud->qi[qidx]);
+    g_free(vud->qi[qidx]);
     vud->qi[qidx] = NULL;
 }
 
@@ -813,15 +813,13 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
     if (started) {
         /* Fire up a thread to watch this queue */
         if (qidx >= vud->nqueues) {
-            vud->qi = realloc(vud->qi, (qidx + 1) * sizeof(vud->qi[0]));
-            assert(vud->qi);
+            vud->qi = g_realloc_n(vud->qi, qidx + 1, sizeof(vud->qi[0]));
             memset(vud->qi + vud->nqueues, 0,
                    sizeof(vud->qi[0]) * (1 + (qidx - vud->nqueues)));
             vud->nqueues = qidx + 1;
         }
         if (!vud->qi[qidx]) {
-            vud->qi[qidx] = calloc(sizeof(struct fv_QueueInfo), 1);
-            assert(vud->qi[qidx]);
+            vud->qi[qidx] = g_new0(struct fv_QueueInfo, 1);
             vud->qi[qidx]->virtio_dev = vud;
             vud->qi[qidx]->qidx = qidx;
         } else {
@@ -1087,12 +1085,7 @@ int virtio_session_mount(struct fuse_session *se)
              __func__);
 
     /* TODO: Some cleanup/deallocation! */
-    se->virtio_dev = calloc(sizeof(struct fv_VuDev), 1);
-    if (!se->virtio_dev) {
-        fuse_log(FUSE_LOG_ERR, "%s: virtio_dev calloc failed\n", __func__);
-        close(data_sock);
-        return -1;
-    }
+    se->virtio_dev = g_new0(struct fv_VuDev, 1);
 
     se->vu_socketfd = data_sock;
     se->virtio_dev->se = se;
@@ -1114,8 +1107,8 @@ void virtio_session_close(struct fuse_session *se)
         return;
     }
 
-    free(se->virtio_dev->qi);
+    g_free(se->virtio_dev->qi);
     pthread_rwlock_destroy(&se->virtio_dev->vu_dispatch_rwlock);
-    free(se->virtio_dev);
+    g_free(se->virtio_dev);
     se->virtio_dev = NULL;
 }
-- 
2.31.1


