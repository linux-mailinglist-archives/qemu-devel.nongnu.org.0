Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 065103494F9
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:10:50 +0100 (CET)
Received: from localhost ([::1]:36338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRdJ-0007nF-0Y
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:10:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRau-0005hJ-0D
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:08:20 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:27207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRar-0007ux-GN
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:08:19 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-441-twC2JRh6MFiUCzDZ8D6sJA-1; Thu, 25 Mar 2021 11:08:12 -0400
X-MC-Unique: twC2JRh6MFiUCzDZ8D6sJA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 909C1107ACCD;
 Thu, 25 Mar 2021 15:08:11 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-20.ams2.redhat.com [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8673A5C3DF;
 Thu, 25 Mar 2021 15:08:09 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [RFC 8/8] virtio-scsi: Use virtio_bus_set_host_notifiers()
Date: Thu, 25 Mar 2021 16:07:35 +0100
Message-Id: <20210325150735.1098387-9-groug@kaod.org>
In-Reply-To: <20210325150735.1098387-1-groug@kaod.org>
References: <20210325150735.1098387-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=WINDOWS-1252
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Greg Kurz <groug@kaod.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows the virtio-scsi-pci device to batch additions and deletions
of host notifiers. This significantly improves boot time of VMs with a
high number of vCPUs, e.g. from 6m13.969s down to 1m4.268s for a pseries
machine with 384 vCPUs.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/scsi/virtio-scsi-dataplane.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplan=
e.c
index 11b53ab767be..eec2b6e19a5b 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -141,6 +141,7 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
     VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
     VirtIOSCSICommon *vs =3D VIRTIO_SCSI_COMMON(vdev);
     VirtIOSCSI *s =3D VIRTIO_SCSI(vdev);
+    VirtioBusState *bus =3D VIRTIO_BUS(qbus);
=20
     if (s->dataplane_started ||
         s->dataplane_starting ||
@@ -171,12 +172,9 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
=20
     vq_init_count++;
=20
-    for (i =3D 0; i < vs->conf.num_queues; i++) {
-        rc =3D virtio_scsi_set_host_notifier(s, vs->cmd_vqs[i], i + 2);
-        if (rc) {
-            goto fail_host_notifiers;
-        }
-        vq_init_count++;
+    rc =3D virtio_bus_set_host_notifiers(bus, vs->conf.num_queues, 2, true=
);
+    if (rc) {
+        goto fail_host_notifiers;
     }
=20
     aio_context_acquire(s->ctx);
@@ -196,10 +194,13 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
     return 0;
=20
 fail_host_notifiers:
-    for (i =3D 0; i < vq_init_count; i++) {
-        virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
-        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
-    }
+    /*
+     * Only host notifiers for ctrl_vq and event_vq can be set at
+     * this point. Notifiers for cmd_vqs[] have been reverted by
+     * virtio_bus_set_host_notifiers() already.
+     */
+    assert(vq_init_count <=3D 2);
+    virtio_bus_set_host_notifiers(bus, vq_init_count, 0, false);
     k->set_guest_notifiers(qbus->parent, vs->conf.num_queues + 2, false);
 fail_guest_notifiers:
     s->dataplane_fenced =3D true;
@@ -215,7 +216,6 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
     VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(qbus);
     VirtIOSCSICommon *vs =3D VIRTIO_SCSI_COMMON(vdev);
     VirtIOSCSI *s =3D VIRTIO_SCSI(vdev);
-    int i;
=20
     if (!s->dataplane_started || s->dataplane_stopping) {
         return;
@@ -235,10 +235,8 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
=20
     blk_drain_all(); /* ensure there are no in-flight requests */
=20
-    for (i =3D 0; i < vs->conf.num_queues + 2; i++) {
-        virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
-        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
-    }
+    virtio_bus_set_host_notifiers(VIRTIO_BUS(qbus), vs->conf.num_queues + =
2, 0,
+                                  false);
=20
     /* Clean up guest notifier (irq) */
     k->set_guest_notifiers(qbus->parent, vs->conf.num_queues + 2, false);
--=20
2.26.3


