Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEAAA143D44
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 13:50:19 +0100 (CET)
Received: from localhost ([::1]:53312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itsz3-0004Vm-TJ
	for lists+qemu-devel@lfdr.de; Tue, 21 Jan 2020 07:50:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51261)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1itsbr-0006UK-DJ
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:26:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1itsbn-000257-GS
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:26:19 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:23600
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1itsbn-000251-C2
 for qemu-devel@nongnu.org; Tue, 21 Jan 2020 07:26:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579609574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9QRGQwrD9MXJeuaF8Houp/eHbV/AEFGeYGplMHhTYM=;
 b=AquusQuuw4WHYF/FNzbNkCh6OPgbA790n6WPFeVbWg/PMTGJoBGvoXa7+gD7sduDBv8zW+
 Gv8NSjL2VMoSDxwTPBaPts32E9/W724rxcvfa9NMRCrqoMMLbtnemy9QpiU8Ryc3qtBctE
 l4O5ig6Y2upHpEN38j7neSOchVt7vdo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-416-Z7DKl93QP2OP8WN8sihX-w-1; Tue, 21 Jan 2020 07:26:13 -0500
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 880281800D78;
 Tue, 21 Jan 2020 12:26:12 +0000 (UTC)
Received: from dgilbert-t580.localhost (unknown [10.36.118.32])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7898F60BE0;
 Tue, 21 Jan 2020 12:26:10 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, stefanha@redhat.com, vgoyal@redhat.com,
 berrange@redhat.com, slp@redhat.com, philmd@redhat.com
Subject: [PATCH v2 021/109] virtiofsd: Start queue threads
Date: Tue, 21 Jan 2020 12:23:05 +0000
Message-Id: <20200121122433.50803-22-dgilbert@redhat.com>
In-Reply-To: <20200121122433.50803-1-dgilbert@redhat.com>
References: <20200121122433.50803-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-MC-Unique: Z7DKl93QP2OP8WN8sihX-w-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: m.mizuma@jp.fujitsu.com, misono.tomohiro@jp.fujitsu.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>

Start a thread for each queue when we get notified it's been started.

Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
fix by:
Signed-off-by: Jun Piao <piaojun@huawei.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
---
 tools/virtiofsd/fuse_virtio.c | 89 +++++++++++++++++++++++++++++++++++
 1 file changed, 89 insertions(+)

diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
index 4819e56568..2a94bb3cca 100644
--- a/tools/virtiofsd/fuse_virtio.c
+++ b/tools/virtiofsd/fuse_virtio.c
@@ -11,6 +11,7 @@
  * See the file COPYING.LIB
  */
=20
+#include "qemu/osdep.h"
 #include "fuse_virtio.h"
 #include "fuse_i.h"
 #include "standard-headers/linux/fuse.h"
@@ -30,6 +31,15 @@
=20
 #include "contrib/libvhost-user/libvhost-user.h"
=20
+struct fv_QueueInfo {
+    pthread_t thread;
+    struct fv_VuDev *virtio_dev;
+
+    /* Our queue index, corresponds to array position */
+    int qidx;
+    int kick_fd;
+};
+
 /*
  * We pass the dev element into libvhost-user
  * and then use it to get back to the outer
@@ -38,6 +48,13 @@
 struct fv_VuDev {
     VuDev dev;
     struct fuse_session *se;
+
+    /*
+     * The following pair of fields are only accessed in the main
+     * virtio_loop
+     */
+    size_t nqueues;
+    struct fv_QueueInfo **qi;
 };
=20
 /* From spec */
@@ -83,6 +100,75 @@ static void fv_panic(VuDev *dev, const char *err)
     exit(EXIT_FAILURE);
 }
=20
+static void *fv_queue_thread(void *opaque)
+{
+    struct fv_QueueInfo *qi =3D opaque;
+    fuse_log(FUSE_LOG_INFO, "%s: Start for queue %d kick_fd %d\n", __func_=
_,
+             qi->qidx, qi->kick_fd);
+    while (1) {
+        /* TODO */
+    }
+
+    return NULL;
+}
+
+/* Callback from libvhost-user on start or stop of a queue */
+static void fv_queue_set_started(VuDev *dev, int qidx, bool started)
+{
+    struct fv_VuDev *vud =3D container_of(dev, struct fv_VuDev, dev);
+    struct fv_QueueInfo *ourqi;
+
+    fuse_log(FUSE_LOG_INFO, "%s: qidx=3D%d started=3D%d\n", __func__, qidx=
,
+             started);
+    assert(qidx >=3D 0);
+
+    /*
+     * Ignore additional request queues for now.  passthrough_ll.c must be
+     * audited for thread-safety issues first.  It was written with a
+     * well-behaved client in mind and may not protect against all types o=
f
+     * races yet.
+     */
+    if (qidx > 1) {
+        fuse_log(FUSE_LOG_ERR,
+                 "%s: multiple request queues not yet implemented, please =
only "
+                 "configure 1 request queue\n",
+                 __func__);
+        exit(EXIT_FAILURE);
+    }
+
+    if (started) {
+        /* Fire up a thread to watch this queue */
+        if (qidx >=3D vud->nqueues) {
+            vud->qi =3D realloc(vud->qi, (qidx + 1) * sizeof(vud->qi[0]));
+            assert(vud->qi);
+            memset(vud->qi + vud->nqueues, 0,
+                   sizeof(vud->qi[0]) * (1 + (qidx - vud->nqueues)));
+            vud->nqueues =3D qidx + 1;
+        }
+        if (!vud->qi[qidx]) {
+            vud->qi[qidx] =3D calloc(sizeof(struct fv_QueueInfo), 1);
+            assert(vud->qi[qidx]);
+            vud->qi[qidx]->virtio_dev =3D vud;
+            vud->qi[qidx]->qidx =3D qidx;
+        } else {
+            /* Shouldn't have been started */
+            assert(vud->qi[qidx]->kick_fd =3D=3D -1);
+        }
+        ourqi =3D vud->qi[qidx];
+        ourqi->kick_fd =3D dev->vq[qidx].kick_fd;
+        if (pthread_create(&ourqi->thread, NULL, fv_queue_thread, ourqi)) =
{
+            fuse_log(FUSE_LOG_ERR, "%s: Failed to create thread for queue =
%d\n",
+                     __func__, qidx);
+            assert(0);
+        }
+    } else {
+        /* TODO: Kill the thread */
+        assert(qidx < vud->nqueues);
+        ourqi =3D vud->qi[qidx];
+        ourqi->kick_fd =3D -1;
+    }
+}
+
 static bool fv_queue_order(VuDev *dev, int qidx)
 {
     return false;
@@ -92,6 +178,9 @@ static const VuDevIface fv_iface =3D {
     .get_features =3D fv_get_features,
     .set_features =3D fv_set_features,
=20
+    /* Don't need process message, we've not got any at vhost-user level *=
/
+    .queue_set_started =3D fv_queue_set_started,
+
     .queue_is_processed_in_order =3D fv_queue_order,
 };
=20
--=20
2.24.1


