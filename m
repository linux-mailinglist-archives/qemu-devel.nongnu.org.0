Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05A7D376937
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:03:27 +0200 (CEST)
Received: from localhost ([::1]:54942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3ss-0000zz-4M
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lf3p9-00070t-AR
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:59:35 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:31489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lf3p7-0005Iv-QO
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:59:35 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-pwpJDUKzMem_yyd8kqx73w-1; Fri, 07 May 2021 12:59:27 -0400
X-MC-Unique: pwpJDUKzMem_yyd8kqx73w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 65CC4107ACC7;
 Fri,  7 May 2021 16:59:26 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-195.ams2.redhat.com [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F6AD1037F21;
 Fri,  7 May 2021 16:59:24 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] virtio-scsi: Set host notifiers and callbacks
 separately
Date: Fri,  7 May 2021 18:59:04 +0200
Message-Id: <20210507165905.748196-4-groug@kaod.org>
In-Reply-To: <20210507165905.748196-1-groug@kaod.org>
References: <20210507165905.748196-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Greg Kurz <groug@kaod.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Host notifiers are guaranteed to be idle until the callbacks are
hooked up with virtio_queue_aio_set_host_notifier_handler(). They
thus don't need to be set or unset with the AioContext lock held.

Do this outside the critical section, like virtio-blk already
does : basically downgrading virtio_scsi_vring_init() to only
setup the host notifier and set the callback in the caller.

This will allow to batch addition/deletion of ioeventds in
a single memory transaction, which is expected to greatly
improve initialization time.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/virtio-scsi-dataplane.c | 40 ++++++++++++++++++---------------
 1 file changed, 22 insertions(+), 18 deletions(-)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplan=
e.c
index 4ad879340645..b2cb3d9dcc64 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -94,8 +94,7 @@ static bool virtio_scsi_data_plane_handle_event(VirtIODev=
ice *vdev,
     return progress;
 }
=20
-static int virtio_scsi_vring_init(VirtIOSCSI *s, VirtQueue *vq, int n,
-                                  VirtIOHandleAIOOutput fn)
+static int virtio_scsi_set_host_notifier(VirtIOSCSI *s, VirtQueue *vq, int=
 n)
 {
     BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(s)));
     int rc;
@@ -109,7 +108,6 @@ static int virtio_scsi_vring_init(VirtIOSCSI *s, VirtQu=
eue *vq, int n,
         return rc;
     }
=20
-    virtio_queue_aio_set_host_notifier_handler(vq, s->ctx, fn);
     return 0;
 }
=20
@@ -154,38 +152,44 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
=20
-    aio_context_acquire(s->ctx);
-    rc =3D virtio_scsi_vring_init(s, vs->ctrl_vq, 0,
-                                virtio_scsi_data_plane_handle_ctrl);
-    if (rc) {
-        goto fail_vrings;
+    rc =3D virtio_scsi_set_host_notifier(s, vs->ctrl_vq, 0);
+    if (rc !=3D 0) {
+        goto fail_host_notifiers;
     }
=20
     vq_init_count++;
-    rc =3D virtio_scsi_vring_init(s, vs->event_vq, 1,
-                                virtio_scsi_data_plane_handle_event);
-    if (rc) {
-        goto fail_vrings;
+    rc =3D virtio_scsi_set_host_notifier(s, vs->event_vq, 1);
+    if (rc !=3D 0) {
+        goto fail_host_notifiers;
     }
=20
     vq_init_count++;
+
     for (i =3D 0; i < vs->conf.num_queues; i++) {
-        rc =3D virtio_scsi_vring_init(s, vs->cmd_vqs[i], i + 2,
-                                    virtio_scsi_data_plane_handle_cmd);
+        rc =3D virtio_scsi_set_host_notifier(s, vs->cmd_vqs[i], i + 2);
         if (rc) {
-            goto fail_vrings;
+            goto fail_host_notifiers;
         }
         vq_init_count++;
     }
=20
+    aio_context_acquire(s->ctx);
+    virtio_queue_aio_set_host_notifier_handler(vs->ctrl_vq, s->ctx,
+                                            virtio_scsi_data_plane_handle_=
ctrl);
+    virtio_queue_aio_set_host_notifier_handler(vs->event_vq, s->ctx,
+                                           virtio_scsi_data_plane_handle_e=
vent);
+
+    for (i =3D 0; i < vs->conf.num_queues; i++) {
+        virtio_queue_aio_set_host_notifier_handler(vs->cmd_vqs[i], s->ctx,
+                                             virtio_scsi_data_plane_handle=
_cmd);
+    }
+
     s->dataplane_starting =3D false;
     s->dataplane_started =3D true;
     aio_context_release(s->ctx);
     return 0;
=20
-fail_vrings:
-    aio_wait_bh_oneshot(s->ctx, virtio_scsi_dataplane_stop_bh, s);
-    aio_context_release(s->ctx);
+fail_host_notifiers:
     for (i =3D 0; i < vq_init_count; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
--=20
2.26.3


