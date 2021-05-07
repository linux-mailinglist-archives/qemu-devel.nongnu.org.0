Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81231376949
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:08:19 +0200 (CEST)
Received: from localhost ([::1]:33852 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3xa-000452-GY
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:08:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lf3pD-0007Bi-4i
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:59:39 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:49194)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lf3pB-0005Kl-Gj
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:59:38 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-y0gJLegsNpi5dYRPoaGWKw-1; Fri, 07 May 2021 12:59:33 -0400
X-MC-Unique: y0gJLegsNpi5dYRPoaGWKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 67298801817;
 Fri,  7 May 2021 16:59:32 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-195.ams2.redhat.com [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0FE31037F21;
 Fri,  7 May 2021 16:59:26 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/4] virtio-scsi: Configure all host notifiers in a single
 MR transaction
Date: Fri,  7 May 2021 18:59:05 +0200
Message-Id: <20210507165905.748196-5-groug@kaod.org>
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

This allows the virtio-scsi-pci device to batch the setup of all its
host notifiers. This significantly improves boot time of VMs with a
high number of vCPUs, e.g. from 6m5.563s down to 1m2.884s for a
pseries machine with 384 vCPUs.

Note that memory_region_transaction_commit() must be called before
virtio_bus_cleanup_host_notifier() because the latter might close
ioeventfds that the transaction still assumes to be around when it
commits.

Signed-off-by: Greg Kurz <groug@kaod.org>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 hw/scsi/virtio-scsi-dataplane.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplan=
e.c
index b2cb3d9dcc64..18eb824c97f5 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -152,6 +152,12 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
=20
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
+    memory_region_transaction_begin();
+
     rc =3D virtio_scsi_set_host_notifier(s, vs->ctrl_vq, 0);
     if (rc !=3D 0) {
         goto fail_host_notifiers;
@@ -173,6 +179,8 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
         vq_init_count++;
     }
=20
+    memory_region_transaction_commit();
+
     aio_context_acquire(s->ctx);
     virtio_queue_aio_set_host_notifier_handler(vs->ctrl_vq, s->ctx,
                                             virtio_scsi_data_plane_handle_=
ctrl);
@@ -192,6 +200,15 @@ int virtio_scsi_dataplane_start(VirtIODevice *vdev)
 fail_host_notifiers:
     for (i =3D 0; i < vq_init_count; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+    }
+
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
+    memory_region_transaction_commit();
+
+    for (i =3D 0; i < vq_init_count; i++) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
     k->set_guest_notifiers(qbus->parent, vs->conf.num_queues + 2, false);
@@ -229,8 +246,23 @@ void virtio_scsi_dataplane_stop(VirtIODevice *vdev)
=20
     blk_drain_all(); /* ensure there are no in-flight requests */
=20
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
+    memory_region_transaction_begin();
+
     for (i =3D 0; i < vs->conf.num_queues + 2; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+    }
+
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
+    memory_region_transaction_commit();
+
+    for (i =3D 0; i < vs->conf.num_queues + 2; i++) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
=20
--=20
2.26.3


