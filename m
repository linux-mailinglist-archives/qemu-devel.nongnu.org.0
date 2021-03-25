Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9BF3494F2
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:09:18 +0100 (CET)
Received: from localhost ([::1]:33094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRbn-0006SR-Lc
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34998)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRaX-0004mB-Vy
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:07:57 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:42467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRaW-0007ht-Go
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:07:57 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-ISCFLV-BMp-_l3JNhkOYjg-1; Thu, 25 Mar 2021 11:07:52 -0400
X-MC-Unique: ISCFLV-BMp-_l3JNhkOYjg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EF0D380BCA6;
 Thu, 25 Mar 2021 15:07:50 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-20.ams2.redhat.com [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F076E5C241;
 Thu, 25 Mar 2021 15:07:48 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [RFC 2/8] virtio: Introduce virtio_bus_set_host_notifiers()
Date: Thu, 25 Mar 2021 16:07:29 +0100
Message-Id: <20210325150735.1098387-3-groug@kaod.org>
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

Multiqueue devices such as virtio-scsi or virtio-blk, all open-code the
same pattern to setup/tear down host notifiers of the request virtqueues.
Consolidate the pattern in a new virtio_bus_set_host_notifiers() API.
Since virtio-scsi and virtio-blk both fallback to userspace if host
notifiers can't be set, e.g. file descriptor exhaustion, go for a
warning rather than an error. Also make it oneshot to avoid flooding
the logs since the message would be very likely the same for all
virtqueues.

Devices will be converted to use virtio_bus_set_host_notifiers() in
separate patches.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/virtio/virtio-bus.h |  3 +++
 hw/virtio/virtio-bus.c         | 36 ++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.=
h
index ef8abe49c5a1..6d1e4ee3e886 100644
--- a/include/hw/virtio/virtio-bus.h
+++ b/include/hw/virtio/virtio-bus.h
@@ -154,5 +154,8 @@ void virtio_bus_release_ioeventfd(VirtioBusState *bus);
 int virtio_bus_set_host_notifier(VirtioBusState *bus, int n, bool assign);
 /* Tell the bus that the ioeventfd handler is no longer required. */
 void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n);
+/* Call virtio_bus_set_host_notifier() for several consecutive vqs */
+int virtio_bus_set_host_notifiers(VirtioBusState *bus, int nvqs, int n_off=
set,
+                                  bool assign);
=20
 #endif /* VIRTIO_BUS_H */
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index d6332d45c3b2..c9e7cdb5c161 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -308,6 +308,42 @@ void virtio_bus_cleanup_host_notifier(VirtioBusState *=
bus, int n)
     event_notifier_cleanup(notifier);
 }
=20
+static void virtio_bus_unset_and_cleanup_host_notifiers(VirtioBusState *bu=
s,
+                                                        int nvqs, int n_of=
fset)
+{
+    int i;
+
+    for (i =3D 0; i < nvqs; i++) {
+        virtio_bus_set_host_notifier(bus, i + n_offset, false);
+        virtio_bus_cleanup_host_notifier(bus, i + n_offset);
+    }
+}
+
+int virtio_bus_set_host_notifiers(VirtioBusState *bus, int nvqs, int n_off=
set,
+                                  bool assign)
+{
+    VirtIODevice *vdev =3D virtio_bus_get_device(bus);
+    int i;
+    int rc;
+
+    if (assign) {
+        for (i =3D 0; i < nvqs; i++) {
+            rc =3D virtio_bus_set_host_notifier(bus, i + n_offset, true);
+            if (rc !=3D 0) {
+                warn_report_once("%s: Failed to set host notifier (%s).\n"=
,
+                                 vdev->name, strerror(-rc));
+
+                virtio_bus_unset_and_cleanup_host_notifiers(bus, i, n_offs=
et);
+                return rc;
+            }
+        }
+    } else {
+        virtio_bus_unset_and_cleanup_host_notifiers(bus, nvqs, n_offset);
+    }
+
+    return 0;
+}
+
 static char *virtio_bus_get_dev_path(DeviceState *dev)
 {
     BusState *bus =3D qdev_get_parent_bus(dev);
--=20
2.26.3


