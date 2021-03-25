Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2667A349508
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:12:40 +0100 (CET)
Received: from localhost ([::1]:41656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRf5-0001ig-8G
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRaZ-0004p6-J5
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:07:59 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:58453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRaY-0007ij-2S
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:07:59 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-ShAsmauJOzyVu0eZblyGsg-1; Thu, 25 Mar 2021 11:07:55 -0400
X-MC-Unique: ShAsmauJOzyVu0eZblyGsg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E13380BCA6;
 Thu, 25 Mar 2021 15:07:53 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-20.ams2.redhat.com [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 42ECB5C649;
 Thu, 25 Mar 2021 15:07:51 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [RFC 3/8] virtio: Add API to batch set host notifiers
Date: Thu, 25 Mar 2021 16:07:30 +0100
Message-Id: <20210325150735.1098387-4-groug@kaod.org>
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

Introduce VirtioBusClass methods to begin and commit a transaction
of setting/unsetting host notifiers. These handlers will be implemented
by virtio-pci to batch addition and deletion of ioeventfds for multiqueue
devices like virtio-scsi-pci or virtio-blk-pci.

Convert virtio_bus_set_host_notifiers() to use these handlers. Note that
virtio_bus_cleanup_host_notifier() closes eventfds, which could still be
passed to the KVM_IOEVENTFD ioctl() when the transaction ends and fail
with EBADF. The cleanup of the host notifiers is thus pushed to a
separate loop in virtio_bus_unset_and_cleanup_host_notifiers(), after
transaction commit.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 include/hw/virtio/virtio-bus.h |  4 ++++
 hw/virtio/virtio-bus.c         | 34 ++++++++++++++++++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-bus.=
h
index 6d1e4ee3e886..99704b2c090a 100644
--- a/include/hw/virtio/virtio-bus.h
+++ b/include/hw/virtio/virtio-bus.h
@@ -82,6 +82,10 @@ struct VirtioBusClass {
      */
     int (*ioeventfd_assign)(DeviceState *d, EventNotifier *notifier,
                             int n, bool assign);
+
+    void (*ioeventfd_assign_begin)(DeviceState *d);
+    void (*ioeventfd_assign_commit)(DeviceState *d);
+
     /*
      * Whether queue number n is enabled.
      */
diff --git a/hw/virtio/virtio-bus.c b/hw/virtio/virtio-bus.c
index c9e7cdb5c161..156484c4ca14 100644
--- a/hw/virtio/virtio-bus.c
+++ b/hw/virtio/virtio-bus.c
@@ -295,6 +295,28 @@ int virtio_bus_set_host_notifier(VirtioBusState *bus, =
int n, bool assign)
     return r;
 }
=20
+static void virtio_bus_set_host_notifier_begin(VirtioBusState *bus)
+{
+    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(bus);
+    DeviceState *proxy =3D DEVICE(BUS(bus)->parent);
+
+    if (k->ioeventfd_assign_begin) {
+        assert(k->ioeventfd_assign_commit);
+        k->ioeventfd_assign_begin(proxy);
+    }
+}
+
+static void virtio_bus_set_host_notifier_commit(VirtioBusState *bus)
+{
+    VirtioBusClass *k =3D VIRTIO_BUS_GET_CLASS(bus);
+    DeviceState *proxy =3D DEVICE(BUS(bus)->parent);
+
+    if (k->ioeventfd_assign_commit) {
+        assert(k->ioeventfd_assign_begin);
+        k->ioeventfd_assign_commit(proxy);
+    }
+}
+
 void virtio_bus_cleanup_host_notifier(VirtioBusState *bus, int n)
 {
     VirtIODevice *vdev =3D virtio_bus_get_device(bus);
@@ -308,6 +330,7 @@ void virtio_bus_cleanup_host_notifier(VirtioBusState *b=
us, int n)
     event_notifier_cleanup(notifier);
 }
=20
+/* virtio_bus_set_host_notifier_begin() must have been called */
 static void virtio_bus_unset_and_cleanup_host_notifiers(VirtioBusState *bu=
s,
                                                         int nvqs, int n_of=
fset)
 {
@@ -315,6 +338,10 @@ static void virtio_bus_unset_and_cleanup_host_notifier=
s(VirtioBusState *bus,
=20
     for (i =3D 0; i < nvqs; i++) {
         virtio_bus_set_host_notifier(bus, i + n_offset, false);
+    }
+    /* Let address_space_update_ioeventfds() run before closing ioeventfds=
 */
+    virtio_bus_set_host_notifier_commit(bus);
+    for (i =3D 0; i < nvqs; i++) {
         virtio_bus_cleanup_host_notifier(bus, i + n_offset);
     }
 }
@@ -327,17 +354,24 @@ int virtio_bus_set_host_notifiers(VirtioBusState *bus=
, int nvqs, int n_offset,
     int rc;
=20
     if (assign) {
+        virtio_bus_set_host_notifier_begin(bus);
+
         for (i =3D 0; i < nvqs; i++) {
             rc =3D virtio_bus_set_host_notifier(bus, i + n_offset, true);
             if (rc !=3D 0) {
                 warn_report_once("%s: Failed to set host notifier (%s).\n"=
,
                                  vdev->name, strerror(-rc));
=20
+                /* This also calls virtio_bus_set_host_notifier_commit() *=
/
                 virtio_bus_unset_and_cleanup_host_notifiers(bus, i, n_offs=
et);
                 return rc;
             }
         }
+
+        virtio_bus_set_host_notifier_commit(bus);
     } else {
+        virtio_bus_set_host_notifier_begin(bus);
+        /* This also calls virtio_bus_set_host_notifier_commit() */
         virtio_bus_unset_and_cleanup_host_notifiers(bus, nvqs, n_offset);
     }
=20
--=20
2.26.3


