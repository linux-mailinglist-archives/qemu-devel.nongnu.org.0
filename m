Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 934B4356EE1
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 16:37:14 +0200 (CEST)
Received: from localhost ([::1]:59762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU9Iv-0001mu-IJ
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 10:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lU9H0-0008JG-RW
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 10:35:14 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:60230)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lU9Gz-0006NS-7H
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 10:35:14 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-qTzJfcA9OsaiRgafA9kwKQ-1; Wed, 07 Apr 2021 10:35:10 -0400
X-MC-Unique: qTzJfcA9OsaiRgafA9kwKQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B2ABB801814;
 Wed,  7 Apr 2021 14:35:09 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-114-100.ams2.redhat.com [10.36.114.100])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B1F4E5D9CA;
 Wed,  7 Apr 2021 14:35:07 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [for-6.1 2/4] virtio-blk: Configure all host notifiers in a single MR
 transaction
Date: Wed,  7 Apr 2021 16:34:59 +0200
Message-Id: <20210407143501.244343-3-groug@kaod.org>
In-Reply-To: <20210407143501.244343-1-groug@kaod.org>
References: <20210407143501.244343-1-groug@kaod.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Greg Kurz <groug@kaod.org>, Max Reitz <mreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This allows the virtio-blk-pci device to batch the setup of all its
host notifiers. This significantly improves boot time of VMs with a
high number of vCPUs, e.g. from 3m26.186s down to 0m58.023s for a
pseries machine with 384 vCPUs.

Note that memory_region_transaction_commit() must be called before
virtio_bus_cleanup_host_notifier() because the latter might close
ioeventfds that the transaction still assumes to be around when it
commits.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/block/dataplane/virtio-blk.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-bl=
k.c
index d7b5c95d26d9..cd81893d1d01 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -198,19 +198,30 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
=20
+    memory_region_transaction_begin();
+
     /* Set up virtqueue notify */
     for (i =3D 0; i < nvqs; i++) {
         r =3D virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, true);
         if (r !=3D 0) {
+            int j =3D i;
+
             fprintf(stderr, "virtio-blk failed to set host notifier (%d)\n=
", r);
             while (i--) {
                 virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+            }
+
+            memory_region_transaction_commit();
+
+            while (j--) {
                 virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
             }
             goto fail_host_notifiers;
         }
     }
=20
+    memory_region_transaction_commit();
+
     s->starting =3D false;
     vblk->dataplane_started =3D true;
     trace_virtio_blk_data_plane_start(s);
@@ -246,8 +257,15 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     return 0;
=20
   fail_aio_context:
+    memory_region_transaction_begin();
+
     for (i =3D 0; i < nvqs; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+    }
+
+    memory_region_transaction_commit();
+
+    for (i =3D 0; i < nvqs; i++) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
   fail_host_notifiers:
@@ -312,8 +330,15 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
=20
     aio_context_release(s->ctx);
=20
+    memory_region_transaction_begin();
+
     for (i =3D 0; i < nvqs; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+    }
+
+    memory_region_transaction_commit();
+
+    for (i =3D 0; i < nvqs; i++) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
=20
--=20
2.26.3


