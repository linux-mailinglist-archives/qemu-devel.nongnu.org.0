Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAAEE20CCE6
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jun 2020 09:06:57 +0200 (CEST)
Received: from localhost ([::1]:51002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpnsW-0007yh-QF
	for lists+qemu-devel@lfdr.de; Mon, 29 Jun 2020 03:06:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jpnqt-0006An-3P
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 03:05:16 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:30986
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1jpnqr-0007wi-A8
 for qemu-devel@nongnu.org; Mon, 29 Jun 2020 03:05:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593414312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f3TxhLnES2KVR0DCecxxlgTvsbPXBqpSxnCcuXffTK8=;
 b=TkjxWR+xqCZlAZL0IuncDK7UlIy93S8C54jDf8j8t49UzOrRz/uEis+VqbYzdoMkCfUowo
 VzZA4N3Zuu0s8Y7h014J38d3z9YCabNSpq8V0JRgqyxZiz92eD/3hOnuzXfHfvXZnBb92i
 TAxcBr8ocvRkuyLbKIy9aPPh2jQ5RD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-169-fS69NwPUMPqzQySYdqlFAQ-1; Mon, 29 Jun 2020 03:05:07 -0400
X-MC-Unique: fS69NwPUMPqzQySYdqlFAQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0B709809E9C;
 Mon, 29 Jun 2020 07:04:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79CCA90341;
 Mon, 29 Jun 2020 07:04:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 armbru@redhat.com, pbonzini@redhat.com, jean-philippe@linaro.org,
 bbhushan2@marvell.com, peterx@redhat.com
Subject: [PATCH v7 4/5] virtio-iommu-pci: Add array of Interval properties
Date: Mon, 29 Jun 2020 09:04:03 +0200
Message-Id: <20200629070404.10969-5-eric.auger@redhat.com>
In-Reply-To: <20200629070404.10969-1-eric.auger@redhat.com>
References: <20200629070404.10969-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eric.auger@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/29 01:03:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The machine may need to pass reserved regions to the
virtio-iommu-pci device (such as the MSI window on x86
or the MSI doorbells on ARM).

So let's add an array of Interval properties.

Note: if some reserved regions are already set by the
machine code - which should be the case in general -,
the length of the property array is already set and
prevents the end-user from modifying them. For example,
attempting to use:

-device virtio-iommu-pci,\
 len-reserved-regions=1,reserved-regions[0]=0xfee00000:0xfeefffff:1

would result in the following error message:

qemu-system-aarch64: -device virtio-iommu-pci,addr=0xa,
len-reserved-regions=1,reserved-regions[0]=0xfee00000:0xfeefffff:1:
array size property len-reserved-regions may not be set more than once

Otherwise, for example, adding two reserved regions is achieved
using the following options:

-device virtio-iommu-pci,addr=0xa,len-reserved-regions=2,\
 reserved-regions[0]=0xfee00000:0xfeefffff:1,\
 reserved-regions[1]=0x1000000:100ffff:1

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Reviewed-by: Markus Armbruster <armbru@redhat.com>

---
v6 -> v7:
- fix hint message with correct valid values, ie. 0 and 1
- added Markus' R-b

v5 -> v6:
- check the type value
- removed Jean's R-b

v3 -> v4:
- added examples in the commit message as suggested by Markus
- added Jean's R-b
---
 hw/virtio/virtio-iommu-pci.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/hw/virtio/virtio-iommu-pci.c b/hw/virtio/virtio-iommu-pci.c
index 632533abaf..33f3f5b03e 100644
--- a/hw/virtio/virtio-iommu-pci.c
+++ b/hw/virtio/virtio-iommu-pci.c
@@ -33,6 +33,9 @@ struct VirtIOIOMMUPCI {
 
 static Property virtio_iommu_pci_properties[] = {
     DEFINE_PROP_UINT32("class", VirtIOPCIProxy, class_code, 0),
+    DEFINE_PROP_ARRAY("reserved-regions", VirtIOIOMMUPCI,
+                      vdev.nb_reserved_regions, vdev.reserved_regions,
+                      qdev_prop_reserved_region, ReservedRegion),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -40,6 +43,7 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
 {
     VirtIOIOMMUPCI *dev = VIRTIO_IOMMU_PCI(vpci_dev);
     DeviceState *vdev = DEVICE(&dev->vdev);
+    VirtIOIOMMU *s = VIRTIO_IOMMU(vdev);
 
     if (!qdev_get_machine_hotplug_handler(DEVICE(vpci_dev))) {
         MachineClass *mc = MACHINE_GET_CLASS(qdev_get_machine());
@@ -54,6 +58,13 @@ static void virtio_iommu_pci_realize(VirtIOPCIProxy *vpci_dev, Error **errp)
                           "-no-acpi\n");
         return;
     }
+    for (int i = 0; i < s->nb_reserved_regions; i++) {
+        if (s->reserved_regions[i].type != VIRTIO_IOMMU_RESV_MEM_T_RESERVED &&
+            s->reserved_regions[i].type != VIRTIO_IOMMU_RESV_MEM_T_MSI) {
+            error_setg(errp, "reserved region %d has an invalid type", i);
+            error_append_hint(errp, "Valid values are 0 and 1\n");
+        }
+    }
     object_property_set_link(OBJECT(dev),
                              OBJECT(pci_get_bus(&vpci_dev->pci_dev)),
                              "primary-bus", errp);
-- 
2.20.1


