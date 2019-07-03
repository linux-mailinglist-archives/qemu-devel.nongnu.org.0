Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 787345D362
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 17:48:56 +0200 (CEST)
Received: from localhost ([::1]:54638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiL1b-0004Si-Ld
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 11:48:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58436)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hiKNO-0006NN-5u
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:07:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hiKNN-0000Da-6Q
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:07:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52024)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hiKNK-00007w-NW
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 11:07:18 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2BDD888304;
 Tue,  2 Jul 2019 15:07:15 +0000 (UTC)
Received: from redhat.com (ovpn-124-209.rdu2.redhat.com [10.10.124.209])
 by smtp.corp.redhat.com (Postfix) with SMTP id 9D4295C28D;
 Tue,  2 Jul 2019 15:07:07 +0000 (UTC)
Date: Tue, 2 Jul 2019 11:07:06 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190619094907.10131-3-pagupta@redhat.com>
References: <20190702150606.24851-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190702150606.24851-1-mst@redhat.com>
X-Mutt-Fcc: =sent
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Tue, 02 Jul 2019 15:07:15 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 06/22] virtio-pci: Allow to specify additional
 interfaces for the base type
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

Let's allow to specify additional interfaces for the base type (e.g.
later TYPE_MEMORY_DEVICE), something that was possible before the
rework of virtio PCI device instantiation.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
Message-Id: <20190619094907.10131-3-pagupta@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/virtio/virtio-pci.h | 1 +
 hw/virtio/virtio-pci.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
index bfea2892a5..619d9098c1 100644
--- a/hw/virtio/virtio-pci.h
+++ b/hw/virtio/virtio-pci.h
@@ -252,6 +252,7 @@ typedef struct VirtioPCIDeviceTypeInfo {
     size_t class_size;
     void (*instance_init)(Object *obj);
     void (*class_init)(ObjectClass *klass, void *data);
+    InterfaceInfo *interfaces;
 } VirtioPCIDeviceTypeInfo;
 
 /* Register virtio-pci type(s).  @t must be static. */
diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
index e6d5467e54..62e78e98f5 100644
--- a/hw/virtio/virtio-pci.c
+++ b/hw/virtio/virtio-pci.c
@@ -1947,6 +1947,7 @@ void virtio_pci_types_register(const VirtioPCIDeviceTypeInfo *t)
         .class_init    = virtio_pci_base_class_init,
         .class_data    = (void *)t,
         .abstract      = true,
+        .interfaces    = t->interfaces,
     };
     TypeInfo generic_type_info = {
         .name = t->generic_name,
-- 
MST


