Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53ABA41DE44
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:58:12 +0200 (CEST)
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyRn-0005H2-Bn
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1a-00054I-MV
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41616)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1U-0002RW-I5
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633015859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXqnxPuS2B0pFLnq3FoVQDfZckLmo3zdQMJyndqZ/TM=;
 b=QbUS8Q3aqi+2I8bg/I0JMfqB7QZ4gs3YEz9uv6tUKgpsnZdT2JSA9EAkAlmc4K9SgMuRuk
 Ol1JLQe6RugH/R75srmvgsheS4PPDSM65+aRtdLJg80TftVGybzwFsQ6srrBNgFRpGjimj
 hf8YD7jPQxrbaTHyrxaP/JY9INm03Y8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-339-c3KLzaCBOGe05gKjMxboPQ-1; Thu, 30 Sep 2021 11:30:58 -0400
X-MC-Unique: c3KLzaCBOGe05gKjMxboPQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0997DDF8A9;
 Thu, 30 Sep 2021 15:30:57 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D98001009962;
 Thu, 30 Sep 2021 15:30:56 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 139DA22828A; Thu, 30 Sep 2021 11:30:48 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	stefanha@redhat.com
Subject: [PATCH 11/13] virtiofsd: Shutdown notification queue in the end
Date: Thu, 30 Sep 2021 11:30:35 -0400
Message-Id: <20210930153037.1194279-12-vgoyal@redhat.com>
In-Reply-To: <20210930153037.1194279-1-vgoyal@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: jaggel@bu.edu, iangelak@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

So far we did not have the notion of cross queue traffic. That is, we
get request on a queue and send back response on same queue. So if a
request be being processed and at the same time a stop queue request
comes in, we wait for all pending requests to finish and then queue
is stopped and associated data structure cleaned.

But with notification queue, now it is possible that we get a locking
request on request queue and send the notification back on a different
queue (notificaiton queue). This means, we need to make sure that
notifiation queue has not already been shutdown or is not being
shutdown in parallel while we are trying to send a notification back.
Otherwise bad things are bound to happen.

One way to solve this problem is that stop notification queue in the
end. First stop hiprio and all request queues. That means by the
time we are trying to stop notification queue, we know no other
request can be in progress which can try to send something on
notification queue.

But problem is that currently we don't have any control on in what
order queues should be stopped. If there was a notion of whole device
being stopped, then we could decide in what order queues should be
stopped.

Stefan mentioned that there is a command to stop whole device
VHOST_USER_SET_STATUS but it is not implemented in libvhost-user
yet. Also we probably could not move away from per queue stop
logic we have as of now.

As an alternative, he said if we stop all queue when qidx 0 is
being stopped, it should be fine and we can solve the issue of
notification queue shutdown order.

So in this patch I am shutting down all queues when queue 0
is being shutdown. And also changed shutdown order in such a
way that notification queue is shutdown last.

Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index c67c2e0e7a..a87e88e286 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -826,6 +826,11 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
     assert(qidx < vud->nqueues);
     ourqi = vud->qi[qidx];
 
+    /* Queue is already stopped */
+    if (!ourqi) {
+        return;
+    }
+
     /* qidx == 1 is the notification queue if notifications are enabled */
     if (!se->notify_enabled || qidx != 1) {
         /* Kill the thread */
@@ -847,14 +852,25 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
 
 static void stop_all_queues(struct fv_VuDev *vud)
 {
+    struct fuse_session *se = vud->se;
+
     for (int i = 0; i < vud->nqueues; i++) {
         if (!vud->qi[i]) {
             continue;
         }
 
+        /* Shutdown notification queue in the end */
+        if (se->notify_enabled && i == 1) {
+            continue;
+        }
         fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func__, i);
         fv_queue_cleanup_thread(vud, i);
     }
+
+    if (se->notify_enabled) {
+        fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func__, 1);
+        fv_queue_cleanup_thread(vud, 1);
+    }
 }
 
 /* Callback from libvhost-user on start or stop of a queue */
@@ -934,7 +950,16 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
          * the queue thread doesn't block in virtio_send_msg().
          */
         vu_dispatch_unlock(vud);
-        fv_queue_cleanup_thread(vud, qidx);
+
+        /*
+         * If queue 0 is being shutdown, treat it as if device is being
+         * shutdown and stop all queues.
+         */
+        if (qidx == 0) {
+            stop_all_queues(vud);
+        } else {
+            fv_queue_cleanup_thread(vud, qidx);
+        }
         vu_dispatch_wrlock(vud);
     }
 }
-- 
2.31.1


