Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF7334951D
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:15:16 +0100 (CET)
Received: from localhost ([::1]:50922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRhb-0005Y7-Ip
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRaf-00055A-VK
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:08:05 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:56710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRae-0007nD-Dg
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:08:05 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-L-114PxVOZqapotyjeMfYQ-1; Thu, 25 Mar 2021 11:07:59 -0400
X-MC-Unique: L-114PxVOZqapotyjeMfYQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E7A618189C7;
 Thu, 25 Mar 2021 15:07:57 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-20.ams2.redhat.com [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC16A5C241;
 Thu, 25 Mar 2021 15:07:55 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [RFC 5/8] virtio-blk: Fix rollback path in
 virtio_blk_data_plane_start()
Date: Thu, 25 Mar 2021 16:07:32 +0100
Message-Id: <20210325150735.1098387-6-groug@kaod.org>
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

When dataplane multiqueue support was added in QEMU 2.7, the path
that would rollback guest notifiers assignment in case of error
simply got dropped.

Later on, when Error was added to blk_set_aio_context() in QEMU 4.1,
another error path was introduced, but it ommits to rollback both
host and guest notifiers.

It seems cleaner to fix the rollback path in one go. The patch is
simple enough that it can be adjusted if backported to a pre-4.1
QEMU.

Fixes: 51b04ac5c6a6 ("virtio-blk: dataplane multiqueue support")
Cc: stefanha@redhat.com
Fixes: 97896a4887a0 ("block: Add Error to blk_set_aio_context()")
Cc: kwolf@redhat.com
Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/block/dataplane/virtio-blk.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/hw/block/dataplane/virtio-blk.c b/hw/block/dataplane/virtio-bl=
k.c
index e9050c8987e7..d7b5c95d26d9 100644
--- a/hw/block/dataplane/virtio-blk.c
+++ b/hw/block/dataplane/virtio-blk.c
@@ -207,7 +207,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
                 virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
                 virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
             }
-            goto fail_guest_notifiers;
+            goto fail_host_notifiers;
         }
     }
=20
@@ -221,7 +221,7 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     aio_context_release(old_context);
     if (r < 0) {
         error_report_err(local_err);
-        goto fail_guest_notifiers;
+        goto fail_aio_context;
     }
=20
     /* Process queued requests before the ones in vring */
@@ -245,6 +245,13 @@ int virtio_blk_data_plane_start(VirtIODevice *vdev)
     aio_context_release(s->ctx);
     return 0;
=20
+  fail_aio_context:
+    for (i =3D 0; i < nvqs; i++) {
+        virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), i, false);
+        virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), i);
+    }
+  fail_host_notifiers:
+    k->set_guest_notifiers(qbus->parent, nvqs, false);
   fail_guest_notifiers:
     /*
      * If we failed to set up the guest notifiers queued requests will be
--=20
2.26.3


