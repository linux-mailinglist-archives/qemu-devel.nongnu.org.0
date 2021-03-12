Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0CF3338894
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 10:26:17 +0100 (CET)
Received: from localhost ([::1]:38926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKe3k-0006Hb-T2
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 04:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0V-0000UP-L9
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:55 -0500
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:20910)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lKe0T-0004G6-8A
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 04:22:54 -0500
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-lu1Uh1H5OcClUxCYhVKjAQ-1; Fri, 12 Mar 2021 04:22:47 -0500
X-MC-Unique: lu1Uh1H5OcClUxCYhVKjAQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4F82100D69B;
 Fri, 12 Mar 2021 09:22:46 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-236.ams2.redhat.com [10.36.113.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 350116A046;
 Fri, 12 Mar 2021 09:22:45 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 7/7] virtiofsd: Release vu_dispatch_lock when stopping queue
Date: Fri, 12 Mar 2021 10:22:12 +0100
Message-Id: <20210312092212.782255-8-groug@kaod.org>
In-Reply-To: <20210312092212.782255-1-groug@kaod.org>
References: <20210312092212.782255-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 virtio-fs@redhat.com, Stefan Hajnoczi <stefanha@redhat.com>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 tools/virtiofsd/fuse_virtio.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 523ee64fb7ae..3e13997406bf 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -792,7 +792,13 @@ static void fv_queue_set_started(VuDev *dev, int qidx,=
 bool started)
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
=20
--=20
2.26.2


