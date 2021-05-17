Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C225382D6E
	for <lists+qemu-devel@lfdr.de>; Mon, 17 May 2021 15:28:39 +0200 (CEST)
Received: from localhost ([::1]:55670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lidIU-0003hZ-Dq
	for lists+qemu-devel@lfdr.de; Mon, 17 May 2021 09:28:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lidGp-0002wN-Pw
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:26:55 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:37699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lidGn-0000Ek-T4
 for qemu-devel@nongnu.org; Mon, 17 May 2021 09:26:55 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-4IhvlwhWNUK-MTA1FxNkgA-1; Mon, 17 May 2021 09:26:49 -0400
X-MC-Unique: 4IhvlwhWNUK-MTA1FxNkgA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 204DD801B19;
 Mon, 17 May 2021 13:26:48 +0000 (UTC)
Received: from bahia.lan (ovpn-112-167.ams2.redhat.com [10.36.112.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 095A419C46;
 Mon, 17 May 2021 13:26:37 +0000 (UTC)
Subject: [PATCH] virtio: Clarify MR transaction optimization
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Date: Mon, 17 May 2021 15:26:37 +0200
Message-ID: <162125799728.1394228.339855768563326832.stgit@bahia.lan>
User-Agent: StGit/0.21
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
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
Cc: Greg Kurz <groug@kaod.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The device model batching its ioeventfds in a single MR transaction is
an optimization. Clarify this in virtio-scsi, virtio-blk and generic
virtio code. Also clarify that the transaction must commit before
closing ioeventfds so that no one is tempted to merge the loops
in the start functions error path and in the stop functions.

Signed-off-by: Greg Kurz <groug@kaod.org>
---

I'm posting this because the wrong version of my "virtio: Improve boot
time of virtio-scsi-pci and virtio-blk-pci" series as explained here:

https://lists.nongnu.org/archive/html/qemu-devel/2021-05/msg04744.html

While here, I'm also adding the comments to the core virtio code, which
also does batching since commit 710fccf80d78 ("virtio: improve virtio
devices initialization time").
---
 hw/block/dataplane/virtio-blk.c |   16 ++++++++++++++++
 hw/scsi/virtio-scsi-dataplane.c |   16 ++++++++++++++++
 hw/virtio/virtio.c              |   16 ++++++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-bl=
k.c
index cd81893d1d01..252c3a7a230c 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -198,6 +198,10 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
=20
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
=20
     /* Set up virtqueue notify */
@@ -211,6 +215,10 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
                 virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
             }
=20
+            /*
+             * The transaction expects the ioeventfds to be open when it
+             * commits. Do it now, before the cleanup loop.
+             */
             memory_region_transaction_commit();
=20
             while (j--) {
@@ -330,12 +338,20 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
=20
     aio_context_release(s->ctx);
=20
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
=20
     for (i =3D 0; i < nvqs; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
     }
=20
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
     memory_region_transaction_commit();
=20
     for (i =3D 0; i < nvqs; i++) {
diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplan=
e.c
index 28e003250a11..18eb824c97f5 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -152,6 +152,10 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
=20
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
=20
     rc =3D virtio_scsi_set_host_notifier(s, vs->ctrl_vq, 0);
@@ -198,6 +202,10 @@ fail_host_notifiers:
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
     }
=20
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
     memory_region_transaction_commit();
=20
     for (i =3D 0; i < vq_init_count; i++) {
@@ -238,12 +246,20 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
=20
     blk_drain_all(); /* ensure there are no in-flight requests */
=20
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
=20
     for (i =3D 0; i < vs->conf.num_queues + 2; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
     }
=20
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
     memory_region_transaction_commit();
=20
     for (i =3D 0; i < vs->conf.num_queues + 2; i++) {
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index e02544b2df76..260ad9226667 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -3730,6 +3730,10 @@ static int virtio_device_start_ioeventfd_impl(VirtIO=
Device *vdev)
     VirtioBusState *qbus =3D VIRTIO_BUS(qdev_get_parent_bus(DEVICE(vdev)))=
;
     int i, n, r, err;
=20
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
     for (n =3D 0; n < VIRTIO_QUEUE_MAX; n++) {
         VirtQueue *vq =3D &vdev->vq[n];
@@ -3768,6 +3772,10 @@ assign_error:
         r =3D virtio_bus_set_host_notifier(qbus, n, false);
         assert(r >=3D 0);
     }
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
     memory_region_transaction_commit();
=20
     while (--i >=3D 0) {
@@ -3792,6 +3800,10 @@ static void virtio_device_stop_ioeventfd_impl(VirtIO=
Device *vdev)
     VirtioBusState *qbus =3D VIRTIO_BUS(qdev_get_parent_bus(DEVICE(vdev)))=
;
     int n, r;
=20
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
     memory_region_transaction_begin();
     for (n =3D 0; n < VIRTIO_QUEUE_MAX; n++) {
         VirtQueue *vq =3D &vdev->vq[n];
@@ -3803,6 +3815,10 @@ static void virtio_device_stop_ioeventfd_impl(VirtIO=
Device *vdev)
         r =3D virtio_bus_set_host_notifier(qbus, n, false);
         assert(r >=3D 0);
     }
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
     memory_region_transaction_commit();
=20
     for (n =3D 0; n < VIRTIO_QUEUE_MAX; n++) {



