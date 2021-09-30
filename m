Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B9C41DE6D
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 18:08:49 +0200 (CEST)
Received: from localhost ([::1]:40694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVyc4-0004j8-LC
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 12:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36926)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1m-0005QK-G5
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1mVy1k-0002fB-Lh
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633015876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=h9+5hCXy0/62bhhp5Pl6oTCnE7oMj6W0sRf7WYmZiy8=;
 b=Ii9DsZRGP/FaOnokOjhprN1tmx15CVe9dg9lD8Vq2BxsrZjt9bpkZdnFDtgxK+8hmb/mFn
 x+oNqk1H/64rYv/cx6BChXAZ7jeBeRrn7pNG2xoQjFgmaLcL1NhVzoSK69YXmi48L6goD2
 ZcSVvlyxFjz3OwmZSefOoXavPKtQjug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-enADIkeaP2ewSrMLG3VDuw-1; Thu, 30 Sep 2021 11:31:14 -0400
X-MC-Unique: enADIkeaP2ewSrMLG3VDuw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 64CB9802947;
 Thu, 30 Sep 2021 15:31:13 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.22.16.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4985660877;
 Thu, 30 Sep 2021 15:30:48 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id D7059228283; Thu, 30 Sep 2021 11:30:47 -0400 (EDT)
From: Vivek Goyal <vgoyal@redhat.com>
To: qemu-devel@nongnu.org,
	virtio-fs@redhat.com,
	stefanha@redhat.com
Subject: [PATCH 04/13] virtiofsd: Add a helper to send element on virtqueue
Date: Thu, 30 Sep 2021 11:30:28 -0400
Message-Id: <20210930153037.1194279-5-vgoyal@redhat.com>
In-Reply-To: <20210930153037.1194279-1-vgoyal@redhat.com>
References: <20210930153037.1194279-1-vgoyal@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
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
Cc: jaggel@bu.edu, iangelak@redhat.com, dgilbert@redhat.com, vgoyal@redhat.com,
 miklos@szeredi.hu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We have open coded logic to take locks and push element on virtqueue at
three places. Add a helper and use it everywhere. Code is easier to read and
less number of lines of code.

Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 45 ++++++++++++++---------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index da7b6a76bf..fcf12db9cd 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -243,6 +243,21 @@ static void vu_dispatch_unlock(struct fv_VuDev *vud)
     assert(ret == 0);
 }
 
+static void vq_send_element(struct fv_QueueInfo *qi, VuVirtqElement *elem,
+                            ssize_t len)
+{
+    struct fuse_session *se = qi->virtio_dev->se;
+    VuDev *dev = &se->virtio_dev->dev;
+    VuVirtq *q = vu_get_queue(dev, qi->qidx);
+
+    vu_dispatch_rdlock(qi->virtio_dev);
+    pthread_mutex_lock(&qi->vq_lock);
+    vu_queue_push(dev, q, elem, len);
+    vu_queue_notify(dev, q);
+    pthread_mutex_unlock(&qi->vq_lock);
+    vu_dispatch_unlock(qi->virtio_dev);
+}
+
 /*
  * Called back by ll whenever it wants to send a reply/message back
  * The 1st element of the iov starts with the fuse_out_header
@@ -253,8 +268,6 @@ int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
 {
     FVRequest *req = container_of(ch, FVRequest, ch);
     struct fv_QueueInfo *qi = ch->qi;
-    VuDev *dev = &se->virtio_dev->dev;
-    VuVirtq *q = vu_get_queue(dev, qi->qidx);
     VuVirtqElement *elem = &req->elem;
     int ret = 0;
 
@@ -296,13 +309,7 @@ int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
 
     copy_iov(iov, count, in_sg, in_num, tosend_len);
 
-    vu_dispatch_rdlock(qi->virtio_dev);
-    pthread_mutex_lock(&qi->vq_lock);
-    vu_queue_push(dev, q, elem, tosend_len);
-    vu_queue_notify(dev, q);
-    pthread_mutex_unlock(&qi->vq_lock);
-    vu_dispatch_unlock(qi->virtio_dev);
-
+    vq_send_element(qi, elem, tosend_len);
     req->reply_sent = true;
 
 err:
@@ -321,8 +328,6 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
 {
     FVRequest *req = container_of(ch, FVRequest, ch);
     struct fv_QueueInfo *qi = ch->qi;
-    VuDev *dev = &se->virtio_dev->dev;
-    VuVirtq *q = vu_get_queue(dev, qi->qidx);
     VuVirtqElement *elem = &req->elem;
     int ret = 0;
     g_autofree struct iovec *in_sg_cpy = NULL;
@@ -430,12 +435,7 @@ int virtio_send_data_iov(struct fuse_session *se, struct fuse_chan *ch,
         out_sg->len = tosend_len;
     }
 
-    vu_dispatch_rdlock(qi->virtio_dev);
-    pthread_mutex_lock(&qi->vq_lock);
-    vu_queue_push(dev, q, elem, tosend_len);
-    vu_queue_notify(dev, q);
-    pthread_mutex_unlock(&qi->vq_lock);
-    vu_dispatch_unlock(qi->virtio_dev);
+    vq_send_element(qi, elem, tosend_len);
     req->reply_sent = true;
     return 0;
 }
@@ -447,7 +447,6 @@ static void fv_queue_worker(gpointer data, gpointer user_data)
 {
     struct fv_QueueInfo *qi = user_data;
     struct fuse_session *se = qi->virtio_dev->se;
-    struct VuDev *dev = &qi->virtio_dev->dev;
     FVRequest *req = data;
     VuVirtqElement *elem = &req->elem;
     struct fuse_buf fbuf = {};
@@ -589,17 +588,9 @@ out:
 
     /* If the request has no reply, still recycle the virtqueue element */
     if (!req->reply_sent) {
-        struct VuVirtq *q = vu_get_queue(dev, qi->qidx);
-
         fuse_log(FUSE_LOG_DEBUG, "%s: elem %d no reply sent\n", __func__,
                  elem->index);
-
-        vu_dispatch_rdlock(qi->virtio_dev);
-        pthread_mutex_lock(&qi->vq_lock);
-        vu_queue_push(dev, q, elem, 0);
-        vu_queue_notify(dev, q);
-        pthread_mutex_unlock(&qi->vq_lock);
-        vu_dispatch_unlock(qi->virtio_dev);
+        vq_send_element(qi, elem, 0);
     }
 
     pthread_mutex_destroy(&req->ch.lock);
-- 
2.31.1


