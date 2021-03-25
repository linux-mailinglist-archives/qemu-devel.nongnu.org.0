Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E634950B
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:12:42 +0100 (CET)
Received: from localhost ([::1]:41802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRf7-0001mK-NW
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:12:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRaq-0005YP-EL
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:08:16 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:27659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRao-0007t2-O2
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:08:16 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-cOBSHx8IPxaL5CvGhiu-8g-1; Thu, 25 Mar 2021 11:08:08 -0400
X-MC-Unique: cOBSHx8IPxaL5CvGhiu-8g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E2DFE1005D54;
 Thu, 25 Mar 2021 15:08:06 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-20.ams2.redhat.com [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4099E5C241;
 Thu, 25 Mar 2021 15:07:58 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [RFC 6/8] virtio-blk: Use virtio_bus_set_host_notifiers()
Date: Thu, 25 Mar 2021 16:07:33 +0100
Message-Id: <20210325150735.1098387-7-groug@kaod.org>
In-Reply-To: <20210325150735.1098387-1-groug@kaod.org>
References: <20210325150735.1098387-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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

This allows the virtio-blk-pci device to batch additions and deletions
of host notifiers. This significantly improves boot time of VMs with a
high number of vCPUs, e.g. from 3m26.408s down to 0m59.923s for a pseries
machine with 384 vCPUs.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/block/dataplane/virtio-blk.c | 25 ++++++-------------------
 1 file changed, 6 insertions(+), 19 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-bl=
k.c
index d7b5c95d26d9..fd2a60010285 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -172,6 +172,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     VirtIOBlockDataPlane *s =3D vblk->dataplane;
     BusState *qbus =3D BUS(qdev_get_parent_bus(DEVICE(vblk)));
     VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
+    VirtioBusState *bus =3D VIRTIO_BUS(qbus);
     AioContext *old_context;
     unsigned i;
     unsigned nvqs =3D s->conf->num_queues;
@@ -199,16 +200,9 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     }
=20
     /* Set up virtqueue notify */
-    for (i =3D 0; i < nvqs; i++) {
-        r =3D virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, true);
-        if (r !=3D 0) {
-            fprintf(stderr, "virtio-blk failed to set host notifier (%d)\n=
", r);
-            while (i--) {
-                virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
-                virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
-            }
-            goto fail_host_notifiers;
-        }
+    r =3D virtio_bus_set_host_notifiers(bus, nvqs, 0, true);
+    if (r !=3D 0) {
+        goto fail_host_notifiers;
     }
=20
     s->starting =3D false;
@@ -246,10 +240,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     return 0;
=20
   fail_aio_context:
-    for (i =3D 0; i < nvqs; i++) {
-        virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
-        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
-    }
+    virtio_bus_set_host_notifiers(bus, nvqs, 0, false);
   fail_host_notifiers:
     k->set_guest_notifiers(qbus->parent, nvqs, false);
   fail_guest_notifiers:
@@ -287,7 +278,6 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
     VirtIOBlockDataPlane *s =3D vblk->dataplane;
     BusState *qbus =3D qdev_get_parent_bus(DEVICE(vblk));
     VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
-    unsigned i;
     unsigned nvqs =3D s->conf->num_queues;
=20
     if (!vblk->dataplane_started || s->stopping) {
@@ -312,10 +302,7 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
=20
     aio_context_release(s->ctx);
=20
-    for (i =3D 0; i < nvqs; i++) {
-        virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
-        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
-    }
+    virtio_bus_set_host_notifiers(VIRTIO_BUS(qbus), nvqs, 0, false);
=20
     qemu_bh_cancel(s->bh);
     notify_guest_bh(s); /* final chance to notify guest */
--=20
2.26.3


