Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D86C833C77B
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 21:14:17 +0100 (CET)
Received: from localhost ([::1]:40272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLtbU-0001bw-IU
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 16:14:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtZt-0000Ck-GU
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lLtZr-0006JY-QR
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 16:12:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615839154;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bk5vf4GpkrARV7gpZKPjSgDF2lLGaYx2vyfbigUAyew=;
 b=DJIIN/NaOR/Ub8R/lmmxkJbufzDRq+XJE39kmguO0YiMEB51KAQxAmca+q3c+eYgLVvkus
 8f5jA8hROAQGejsxPKXzOPwmqdFD74BXxd8BPxgGpkukvO9Kw8hbuKmiwJECHjj0+U77pl
 EgKhukuSqJRf3L7qCbRWvxsFGAh1KuU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-40-WP2pSUEyOVip1sCRq4HdRA-1; Mon, 15 Mar 2021 16:12:29 -0400
X-MC-Unique: WP2pSUEyOVip1sCRq4HdRA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 88920107ACCA;
 Mon, 15 Mar 2021 20:12:28 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-235.ams2.redhat.com
 [10.36.114.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DA32B5D751;
 Mon, 15 Mar 2021 20:12:26 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, groug@kaod.org, vgoyal@redhat.com,
 wanghao232@huawei.com, ma.mandourr@gmail.com
Subject: [PULL 1/9] virtiofsd: Release vu_dispatch_lock when stopping queue
Date: Mon, 15 Mar 2021 20:12:07 +0000
Message-Id: <20210315201215.222539-2-dgilbert@redhat.com>
In-Reply-To: <20210315201215.222539-1-dgilbert@redhat.com>
References: <20210315201215.222539-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: stefanha@redhat.com, peterx@redhat.com, quintela@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

QEMU can stop a virtqueue by sending a VHOST_USER_GET_VRING_BASE request
to virtiofsd. As with all other vhost-user protocol messages, the thread
that runs the main event loop in virtiofsd takes the vu_dispatch lock in
write mode. This ensures that no other thread can access virtqueues or
memory tables at the same time.

In the case of VHOST_USER_GET_VRING_BASE, the main thread basically
notifies the queue thread that it should terminate and waits for its
termination:

main()
 virtio_loop()
  vu_dispatch_wrlock()
  vu_dispatch()
   vu_process_message()
    vu_get_vring_base_exec()
     fv_queue_cleanup_thread()
      pthread_join()

Unfortunately, the queue thread ends up calling virtio_send_msg()
at some point, which itself needs to grab the lock:

fv_queue_thread()
 g_list_foreach()
  fv_queue_worker()
   fuse_session_process_buf_int()
    do_release()
     lo_release()
      fuse_reply_err()
       send_reply()
        send_reply_iov()
         fuse_send_reply_iov_nofree()
          fuse_send_msg()
           virtio_send_msg()
            vu_dispatch_rdlock() <-- Deadlock !

Simply have the main thread to release the lock before going to
sleep and take it back afterwards. A very similar patch was already
sent by Vivek Goyal sometime back:

https://listman.redhat.com/archives/virtio-fs/2021-January/msg00073.html

The only difference here is that this done in fv_queue_set_started()
because fv_queue_cleanup_thread() can also be called from virtio_loop()
without the lock being held.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Vivek Goyal <vgoyal@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20210312092212.782255-8-groug@kaod.org>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 523ee64fb7..3e13997406 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -792,7 +792,13 @@ static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
             assert(0);
         }
     } else {
+        /*
+         * Temporarily drop write-lock taken in virtio_loop() so that
+         * the queue thread doesn't block in virtio_send_msg().
+         */
+        vu_dispatch_unlock(vud);
         fv_queue_cleanup_thread(vud, qidx);
+        vu_dispatch_wrlock(vud);
     }
 }
 
-- 
2.30.2


