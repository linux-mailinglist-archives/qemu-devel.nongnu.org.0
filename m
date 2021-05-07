Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FA8E37693F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 19:05:05 +0200 (CEST)
Received: from localhost ([::1]:58456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lf3uS-0002QP-JU
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 13:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lf3p6-0006uU-Mo
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:59:32 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:44610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lf3p5-0005HJ-94
 for qemu-devel@nongnu.org; Fri, 07 May 2021 12:59:32 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-WqGQdNzIP8y-fyEgnZOBMg-1; Fri, 07 May 2021 12:59:25 -0400
X-MC-Unique: WqGQdNzIP8y-fyEgnZOBMg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 139F41854E21;
 Fri,  7 May 2021 16:59:24 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-112-195.ams2.redhat.com [10.36.112.195])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0C91C1037F21;
 Fri,  7 May 2021 16:59:21 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/4] virtio-blk: Configure all host notifiers in a single
 MR transaction
Date: Fri,  7 May 2021 18:59:03 +0200
Message-Id: <20210507165905.748196-3-groug@kaod.org>
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
 hw/block/dataplane/virtio-blk.c | 34 +++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-bl=
k.c
index d7b5c95d26d9..55efded716e2 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -198,19 +198,38 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
         goto fail_guest_notifiers;
     }
=20
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
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
+            /*
+             * The transaction expects the ioeventfds to be open when it
+             * commits. Do it now, before the cleanup loop.
+             */
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
@@ -312,8 +331,23 @@ void virtio_blk_data_plane_stop(VirtIODevice *vdev)
=20
     aio_context_release(s->ctx);
=20
+    /*
+     * Batch all the host notifiers in a single transaction to avoid
+     * quadratic time complexity in address_space_update_ioeventfds().
+     */
+    memory_region_transaction_begin();
+
     for (i =3D 0; i < nvqs; i++) {
         virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+    }
+
+    /*
+     * The transaction expects the ioeventfds to be open when it
+     * commits. Do it now, before the cleanup loop.
+     */
+    memory_region_transaction_commit();
+
+    for (i =3D 0; i < nvqs; i++) {
         virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
     }
=20
--=20
2.26.3


