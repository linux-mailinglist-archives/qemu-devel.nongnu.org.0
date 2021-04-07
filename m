Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36090356EEC
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 16:40:05 +0200 (CEST)
Received: from localhost ([::1]:38426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU9Lg-0004cs-7z
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 10:40:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lU9H7-0008WM-Sp
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 10:35:21 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:40134)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lU9H5-0006Uu-S0
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 10:35:21 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-293-7zb2v2gHOm2YabSQRoHijg-1; Wed, 07 Apr 2021 10:35:15 -0400
X-MC-Unique: 7zb2v2gHOm2YabSQRoHijg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58C6C84B9A3;
 Wed,  7 Apr 2021 14:35:14 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-100.ams2.redhat.com [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1135D9CA;
 Wed,  7 Apr 2021 14:35:12 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [for-6.1 4/4] virtio-scsi: Configure all host notifiers in a single
 MR transaction
Date: Wed,  7 Apr 2021 16:35:01 +0200
Message-Id: <20210407143501.244343-5-groug@kaod.org>
In-Reply-To: <20210407143501.244343-1-groug@kaod.org>
References: <20210407143501.244343-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Greg Kurz <groug@kaod.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows the virtio-scsi-pci device to batch the setup of all its
host notifiers. This significantly improves boot time of VMs with a
high number of vCPUs, e.g. from 6m5.563s down to 1m2.884s for a
pseries machine with 384 vCPUs.

Note that memory_region_transaction_commit() must be called before
virtio_bus_cleanup_host_notifier() because the latter might close
ioeventfds that the transaction still assumes to be around when it
commits.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/scsi/virtio-scsi-dataplane.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplan=
e.c
index b2cb3d9dcc64..28e003250a11 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -152,6 +152,8 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
=20
+    memory_region_transaction_begin();
+
     rc =3D virtio_scsi_set_host_notifier(s, vs->ctrl_vq, 0);
     if (rc !=3D 0) {
         goto fail_host_notifiers;
@@ -173,6 +175,8 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
         vq_init_count++;
     }
=20
+    memory_region_transaction_commit();
+
     aio_context_acquire(s->ctx);
     virtio_queue_aio_set_host_notifier_handler(vs->ctrl_vq, s->ctx,
                                             virtio_scsi_data_plane_handle_=
ctrl);
@@ -192,6 +196,11 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 fail_host_notifiers:
     for (i =3D 0; i < vq_init_count; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+    }
+
+    memory_region_transaction_commit();
+
+    for (i =3D 0; i < vq_init_count; i++) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
     k->set_guest_notifiers(qbus->parent, vs->conf.num_queues + 2, false);
@@ -229,8 +238,15 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
=20
     blk_drain_all(); /* ensure there are no in-flight requests */
=20
+    memory_region_transaction_begin();
+
     for (i =3D 0; i < vs->conf.num_queues + 2; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+    }
+
+    memory_region_transaction_commit();
+
+    for (i =3D 0; i < vs->conf.num_queues + 2; i++) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
=20
--=20
2.26.3


