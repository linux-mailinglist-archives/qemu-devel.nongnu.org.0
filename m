Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FA321471D3
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 20:35:19 +0100 (CET)
Received: from localhost ([::1]:60164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuiG6-0002Ln-A3
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 14:35:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41109)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1iufdg-0004hr-1w
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:29 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1iufde-0006Oh-9Y
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:27 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:43019
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1iufde-0006O9-6M
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 11:47:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579798045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1yNZ903nBsp45b/CUHR2twKT/7zvjV6NUQqNyOO4Jko=;
 b=Lboa/ALcJlQ68pFjNGS62XwPMqtFuoiDbtV3vP1z640sYdtroOyeYMPIglLSGvYuIp3OHG
 6MNDtR0nhgCP9bxHrRw27ZhvOimCvB/zChP8ptLX0LZ9vPKDRYgwYdg/zI4kQH28ChNMhs
 vPu7fcJAipLmZu/29+3+giVeScI0CYg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-180-d1L4HzFwM6SvrEDWFU2kig-1; Thu, 23 Jan 2020 11:47:21 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16BD3802A26
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 16:47:21 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-116-110.ams2.redhat.com
 [10.36.116.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6496228991;
 Thu, 23 Jan 2020 16:47:20 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	stefanha@redhat.com
Subject: [PULL 026/108] virtiofsd: Keep track of replies
Date: Thu, 23 Jan 2020 16:45:08 +0000
Message-Id: <20200123164630.91498-27-dgilbert@redhat.com>
In-Reply-To: <20200123164630.91498-1-dgilbert@redhat.com>
References: <20200123164630.91498-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: d1L4HzFwM6SvrEDWFU2kig-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Keep track of whether we sent a reply to a request; this is a bit
paranoid but it means:
  a) We should always recycle an element even if there was an error
     in the request
  b) Never try and send two replies on one queue element

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 05d0e29f12..f1adeb6345 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -44,6 +44,7 @@ struct fv_QueueInfo {
=20
     /* The element for the command currently being processed */
     VuVirtqElement *qe;
+    bool reply_sent;
 };
=20
 /*
@@ -178,6 +179,7 @@ int virtio_send_msg(struct fuse_session *se, struct fus=
e_chan *ch,
 {
     VuVirtqElement *elem;
     VuVirtq *q;
+    int ret =3D 0;
=20
     assert(count >=3D 1);
     assert(iov[0].iov_len >=3D sizeof(struct fuse_out_header));
@@ -191,6 +193,7 @@ int virtio_send_msg(struct fuse_session *se, struct fus=
e_chan *ch,
     assert(out->unique);
     /* For virtio we always have ch */
     assert(ch);
+    assert(!ch->qi->reply_sent);
     elem =3D ch->qi->qe;
     q =3D &ch->qi->virtio_dev->dev.vq[ch->qi->qidx];
=20
@@ -208,19 +211,23 @@ int virtio_send_msg(struct fuse_session *se, struct f=
use_chan *ch,
     if (in_len < sizeof(struct fuse_out_header)) {
         fuse_log(FUSE_LOG_ERR, "%s: elem %d too short for out_header\n",
                  __func__, elem->index);
-        return -E2BIG;
+        ret =3D -E2BIG;
+        goto err;
     }
     if (in_len < tosend_len) {
         fuse_log(FUSE_LOG_ERR, "%s: elem %d too small for data len %zd\n",
                  __func__, elem->index, tosend_len);
-        return -E2BIG;
+        ret =3D -E2BIG;
+        goto err;
     }
=20
     copy_iov(iov, count, in_sg, in_num, tosend_len);
     vu_queue_push(&se->virtio_dev->dev, q, elem, tosend_len);
     vu_queue_notify(&se->virtio_dev->dev, q);
+    ch->qi->reply_sent =3D true;
=20
-    return 0;
+err:
+    return ret;
 }
=20
 /* Thread function for individual queues, created when a queue is 'started=
' */
@@ -296,6 +303,9 @@ static void *fv_queue_thread(void *opaque)
                 break;
             }
=20
+            qi->qe =3D elem;
+            qi->reply_sent =3D false;
+
             if (!fbuf.mem) {
                 fbuf.mem =3D malloc(se->bufsize);
                 assert(fbuf.mem);
@@ -331,6 +341,13 @@ static void *fv_queue_thread(void *opaque)
             /* TODO: Add checks for fuse_session_exited */
             fuse_session_process_buf_int(se, &fbuf, &ch);
=20
+            if (!qi->reply_sent) {
+                fuse_log(FUSE_LOG_DEBUG, "%s: elem %d no reply sent\n",
+                         __func__, elem->index);
+                /* I think we've still got to recycle the element */
+                vu_queue_push(dev, q, elem, 0);
+                vu_queue_notify(dev, q);
+            }
             qi->qe =3D NULL;
             free(elem);
             elem =3D NULL;
--=20
2.24.1


