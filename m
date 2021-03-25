Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A8E34950C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 16:12:46 +0100 (CET)
Received: from localhost ([::1]:42160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPRfB-0001vX-2A
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 11:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRab-0004tB-9O
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:08:01 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:49931)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lPRaY-0007k2-Sa
 for qemu-devel@nongnu.org; Thu, 25 Mar 2021 11:08:01 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-188-KZbR3eolNtCh706kudKXGw-1; Thu, 25 Mar 2021 11:07:56 -0400
X-MC-Unique: KZbR3eolNtCh706kudKXGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 873D51005D58;
 Thu, 25 Mar 2021 15:07:55 +0000 (UTC)
Received: from bahia.redhat.com (ovpn-113-20.ams2.redhat.com [10.36.113.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 889645C5E1;
 Thu, 25 Mar 2021 15:07:53 +0000 (UTC)
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: [RFC 4/8] virtio-pci: Batch add/del ioeventfds in a single MR
 transaction
Date: Thu, 25 Mar 2021 16:07:31 +0100
Message-Id: <20210325150735.1098387-5-groug@kaod.org>
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

Implement the ioeventfd_assign_begin() and ioeventfd_assign_commit()
handlers of VirtioBusClass. Basically track that a transaction was
already requested by the device and use this information to prevent
the memory code to generate a transaction for each individual eventfd.

Devices that want to benefit of this batching feature must be converted
to use the virtio_bus_set_host_notifiers() API.

Signed-off-by: Greg Kurz <groug@kaod.org>
---
 hw/virtio/virtio-pci.h |  1 +
 hw/virtio/virtio-pci.c | 53 +++++++++++++++++++++++++++++-------------
 softmmu/memory.c       |  4 ++--
 3 files changed, 40 insertions(+), 18 deletions(-)

diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index d7d5d403a948..a1b3f1bc45c9 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -141,6 +141,7 @@ struct VirtIOPCIProxy {
     bool disable_modern;
     bool ignore_backend_features;
     OnOffAuto disable_legacy;
+    bool ioeventfd_assign_started;
     uint32_t class_code;
     uint32_t nvectors;
     uint32_t dfselect;
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index 883045a22354..0a8738c69541 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -243,47 +243,66 @@ static int virtio_pci_ioeventfd_assign(DeviceState *d=
, EventNotifier *notifier,
     hwaddr modern_addr =3D virtio_pci_queue_mem_mult(proxy) *
                          virtio_get_queue_index(vq);
     hwaddr legacy_addr =3D VIRTIO_PCI_QUEUE_NOTIFY;
+    bool transaction =3D !proxy->ioeventfd_assign_started;
=20
     if (assign) {
         if (modern) {
             if (fast_mmio) {
-                memory_region_add_eventfd(modern_mr, modern_addr, 0,
-                                          false, n, notifier);
+                memory_region_add_eventfd_full(modern_mr, modern_addr, 0,
+                                               false, n, notifier, transac=
tion);
             } else {
-                memory_region_add_eventfd(modern_mr, modern_addr, 2,
-                                          false, n, notifier);
+                memory_region_add_eventfd_full(modern_mr, modern_addr, 2,
+                                               false, n, notifier, transac=
tion);
             }
             if (modern_pio) {
-                memory_region_add_eventfd(modern_notify_mr, 0, 2,
-                                              true, n, notifier);
+                memory_region_add_eventfd_full(modern_notify_mr, 0, 2,
+                                               true, n, notifier, transact=
ion);
             }
         }
         if (legacy) {
-            memory_region_add_eventfd(legacy_mr, legacy_addr, 2,
-                                      true, n, notifier);
+            memory_region_add_eventfd_full(legacy_mr, legacy_addr, 2,
+                                           true, n, notifier, transaction)=
;
         }
     } else {
         if (modern) {
             if (fast_mmio) {
-                memory_region_del_eventfd(modern_mr, modern_addr, 0,
-                                          false, n, notifier);
+                memory_region_del_eventfd_full(modern_mr, modern_addr, 0,
+                                               false, n, notifier, transac=
tion);
             } else {
-                memory_region_del_eventfd(modern_mr, modern_addr, 2,
-                                          false, n, notifier);
+                memory_region_del_eventfd_full(modern_mr, modern_addr, 2,
+                                               false, n, notifier, transac=
tion);
             }
             if (modern_pio) {
-                memory_region_del_eventfd(modern_notify_mr, 0, 2,
-                                          true, n, notifier);
+                memory_region_del_eventfd_full(modern_notify_mr, 0, 2,
+                                               true, n, notifier, transact=
ion);
             }
         }
         if (legacy) {
-            memory_region_del_eventfd(legacy_mr, legacy_addr, 2,
-                                      true, n, notifier);
+            memory_region_del_eventfd_full(legacy_mr, legacy_addr, 2,
+                                           true, n, notifier, transaction)=
;
         }
     }
     return 0;
 }
=20
+static void virtio_pci_ioeventfd_assign_begin(DeviceState *d)
+{
+    VirtIOPCIProxy *proxy =3D to_virtio_pci_proxy(d);
+
+    assert(!proxy->ioeventfd_assign_started);
+    proxy->ioeventfd_assign_started =3D true;
+    memory_region_transaction_begin();
+}
+
+static void virtio_pci_ioeventfd_assign_commit(DeviceState *d)
+{
+    VirtIOPCIProxy *proxy =3D to_virtio_pci_proxy(d);
+
+    assert(proxy->ioeventfd_assign_started);
+    memory_region_transaction_commit();
+    proxy->ioeventfd_assign_started =3D false;
+}
+
 static void virtio_pci_start_ioeventfd(VirtIOPCIProxy *proxy)
 {
     virtio_bus_start_ioeventfd(&proxy->bus);
@@ -2161,6 +2180,8 @@ static void virtio_pci_bus_class_init(ObjectClass *kl=
ass, void *data)
     k->query_nvectors =3D virtio_pci_query_nvectors;
     k->ioeventfd_enabled =3D virtio_pci_ioeventfd_enabled;
     k->ioeventfd_assign =3D virtio_pci_ioeventfd_assign;
+    k->ioeventfd_assign_begin =3D virtio_pci_ioeventfd_assign_begin;
+    k->ioeventfd_assign_commit =3D virtio_pci_ioeventfd_assign_commit;
     k->get_dma_as =3D virtio_pci_get_dma_as;
     k->queue_enabled =3D virtio_pci_queue_enabled;
 }
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 1b1942d521cc..0279e5671bcb 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -2368,7 +2368,7 @@ void memory_region_add_eventfd_full(MemoryRegion *mr,
     if (size) {
         adjust_endianness(mr, &mrfd.data, size_memop(size) | MO_TE);
     }
-    if (transaction) {
+    if (!transaction) {
         memory_region_transaction_begin();
     }
     for (i =3D 0; i < mr->ioeventfd_nb; ++i) {
@@ -2383,7 +2383,7 @@ void memory_region_add_eventfd_full(MemoryRegion *mr,
             sizeof(*mr->ioeventfds) * (mr->ioeventfd_nb-1 - i));
     mr->ioeventfds[i] =3D mrfd;
     ioeventfd_update_pending |=3D mr->enabled;
-    if (transaction) {
+    if (!transaction) {
         memory_region_transaction_commit();
     }
 }
--=20
2.26.3


