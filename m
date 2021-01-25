Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DDB530298F
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:07:31 +0100 (CET)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46Gw-0005Ns-IA
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:07:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46Be-0001Qt-Ug
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:02:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:32885)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1l46BZ-0006lG-Vu
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:02:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611597717;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JdE/mjhcHwPCn5Y64DNoT5FJDKEiUtgq25W1YQzZvl0=;
 b=gwZWEi+B6wmnOFjHPvH34hMaNnzSo6sa8CPvQk6RjHMZYKZzunMA6gaNKcF+tkl9hAPb27
 iTpyn6IvCTJl0G/zpndLXKiypPRTjIsO/wDzMnxB3fztesXgiWbQfF0kNgV1UtA/SeGw32
 ptqGhPSLlLLR+otB1b0NtjKtrHIQ5AI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-520-o-Vo9qbIMG-50QFFs_HfQg-1; Mon, 25 Jan 2021 13:01:55 -0500
X-MC-Unique: o-Vo9qbIMG-50QFFs_HfQg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 93CA1107ACE3
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 18:01:54 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-119.rdu2.redhat.com [10.10.116.119])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A12341002D43;
 Mon, 25 Jan 2021 18:01:38 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 3662E223D98; Mon, 25 Jan 2021 13:01:38 -0500 (EST)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com
Subject: [PATCH 1/6] virtiofsd: Drop ->vu_dispatch_rwlock while waiting for
 thread to exit
Date: Mon, 25 Jan 2021 13:01:10 -0500
Message-Id: <20210125180115.22936-2-vgoyal@redhat.com>
In-Reply-To: <20210125180115.22936-1-vgoyal@redhat.com>
References: <20210125180115.22936-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: marcandre.lureau@redhat.com, stefanha@redhat.com, dgilbert@redhat.com,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When we are shutting down virtqueues, virtio_loop() receives a message
VHOST_USER_GET_VRING_BASE from master. We acquire ->vu_dispatch_rwlock
and get into the process of shutting down virtqueue. In one of the
final steps, we are waiting for fv_queue_thread() to exit/finish and
wait with ->vu_dispatch_rwlock held.

But it is possible that fv_queue_thread() itself is waiting to get
->vu_dispatch_rwlock (With --thread-pool=0 option). If requests
are being processed by fv_queue_worker(), then fv_queue_worker()
can wait for the ->vu_dispatch_rwlock, and fv_queue_thread() will
wait for fv_queue_worker() before thread pool can be stopped.

IOW, if guest is shutdown uncleanly (some sort of emergency reboot),
it is possible that virtiofsd is processing a fs request and
qemu initiates device shutdown sequence. In that case there seem
to be two options. Either abort the existing request completely or
let existing request finish.

This patch is taking second approach. That is drop the ->vu_dispatch_rwlock
temporarily so that fv_queue_thread() can finish and deadlock does not
happen.

->vu_dispatch_rwlock provides mutual exclusion between virtio_loop()
(handling vhost-user protocol messages) and fv_queue_thread() (handling
fuse filesystem requests). Rational seems to be that protocol message
might change queue memory mappings, so we don't want both to proceed
at the same time.

In this case queue is shutting down, so I hope it is fine for fv_queue_thread() to send response back while virtio_loop() is still waiting (and not handling
any further vho-user protocol messages).

IOW, assumption here is that while virto_loop is blocked processing
VHOST_USER_GET_VRING_BASE message, it is still ok to send back the
response on vq by fv_queue_thread().

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 9577eaa68d..6805d8ba01 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -813,11 +813,20 @@ static void fv_queue_cleanup_thread(struct fv_VuDev *vud, int qidx)
         fuse_log(FUSE_LOG_ERR, "Eventfd_write for queue %d: %s\n",
                  qidx, strerror(errno));
     }
+
+    /*
+     * Drop ->vu_dispath_rwlock and reacquire. We are about to wait for
+     * for fv_queue_thread() and that might require ->vu_dispatch_rwlock
+     * to finish.
+     */
+    pthread_rwlock_unlock(&vud->vu_dispatch_rwlock);
     ret = pthread_join(ourqi->thread, NULL);
     if (ret) {
         fuse_log(FUSE_LOG_ERR, "%s: Failed to join thread idx %d err %d\n",
                  __func__, qidx, ret);
     }
+    pthread_rwlock_wrlock(&vud->vu_dispatch_rwlock);
+
     pthread_mutex_destroy(&ourqi->vq_lock);
     close(ourqi->kill_fd);
     ourqi->kick_fd = -1;
@@ -952,7 +961,11 @@ int virtio_loop(struct fuse_session *se)
     /*
      * Make sure all fv_queue_thread()s quit on exit, as we're about to
      * free virtio dev and fuse session, no one should access them anymore.
+     * Hold ->vu_dispatch_rwlock in write mode as fv_queue_cleanup_thread()
+     * assumes mutex is locked and unlocks/re-locks it.
      */
+
+    pthread_rwlock_wrlock(&se->virtio_dev->vu_dispatch_rwlock);
     for (int i = 0; i < se->virtio_dev->nqueues; i++) {
         if (!se->virtio_dev->qi[i]) {
             continue;
@@ -961,6 +974,7 @@ int virtio_loop(struct fuse_session *se)
         fuse_log(FUSE_LOG_INFO, "%s: Stopping queue %d thread\n", __func__, i);
         fv_queue_cleanup_thread(se->virtio_dev, i);
     }
+    pthread_rwlock_unlock(&se->virtio_dev->vu_dispatch_rwlock);
 
     fuse_log(FUSE_LOG_INFO, "%s: Exit\n", __func__);
 
-- 
2.25.4


