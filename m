Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF447338C5D
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 13:06:20 +0100 (CET)
Received: from localhost ([::1]:43168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKgYd-0001Op-Qn
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 07:06:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lKgVq-0008Vp-6v
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:03:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43052)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1lKgVg-0003zQ-BZ
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 07:03:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615550593;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=5Dxd9jL3320Hf0LGI2OTGoGcNCm49MRnexQ8seuB0Ng=;
 b=AzDd+wWu32biY3Y98GRLhsVt9e2mUh8sHV0xAVcsEqpMLwYEBQsaO4FYLO7O+rx/8qxaqP
 YU7BT6lN7DUc2zkHB00r0QF/N/ArpRHVwDLtUkLVKIXo8cX1ShxjPbV69qduXCSpSgPQ7w
 nGZw2NLjI6HFM1RFFG9AaPSRZNn6CkY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-mai7fW78M4WXgKBBS4a4RQ-1; Fri, 12 Mar 2021 07:03:12 -0500
X-MC-Unique: mai7fW78M4WXgKBBS4a4RQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CCD4E5761
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 12:03:11 +0000 (UTC)
Received: from workimage2020.rezanina.moe.rezanina.moe (unknown [10.40.193.51])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CF1D60864
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 12:03:10 +0000 (UTC)
From: mrezanin@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] Add missing initialization for g_autofree variables
Date: Fri, 12 Mar 2021 13:03:09 +0100
Message-Id: <20210312120309.138913-1-mrezanin@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mrezanin@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Miroslav Rezanina <mrezanin@redhat.com>

When declaring g_autofree variable without inicialization, compiler
will raise "may be used uninitialized in this function" warning due
to automatic free handling. This usage can cause gfree using unknown.
Such behavior can be dangerous and exploitable.

Add inicialization to NULL for these declaration to ensure uninitialized
value is not used.

Signed-off-by: Miroslav Rezanina <mrezanin@redhat.com>
---
 hw/remote/memory.c       | 2 +-
 hw/remote/proxy.c        | 2 +-
 hw/s390x/s390-pci-vfio.c | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/hw/remote/memory.c b/hw/remote/memory.c
index 32085b1e05..bf0047a81b 100644
--- a/hw/remote/memory.c
+++ b/hw/remote/memory.c
@@ -43,7 +43,7 @@ void remote_sysmem_reconfig(MPQemuMsg *msg, Error **errp)
     remote_sysmem_reset();
 
     for (region = 0; region < msg->num_fds; region++) {
-        g_autofree char *name;
+        g_autofree char *name = NULL;
         subregion = g_new(MemoryRegion, 1);
         name = g_strdup_printf("remote-mem-%u", suffix++);
         memory_region_init_ram_from_fd(subregion, NULL,
diff --git a/hw/remote/proxy.c b/hw/remote/proxy.c
index 4fa4be079d..253c1aa7ec 100644
--- a/hw/remote/proxy.c
+++ b/hw/remote/proxy.c
@@ -347,7 +347,7 @@ static void probe_pci_info(PCIDevice *dev, Error **errp)
                    PCI_BASE_ADDRESS_SPACE_IO : PCI_BASE_ADDRESS_SPACE_MEMORY;
 
         if (size) {
-            g_autofree char *name;
+            g_autofree char *name = NULL;
             pdev->region[i].dev = pdev;
             pdev->region[i].present = true;
             if (type == PCI_BASE_ADDRESS_SPACE_MEMORY) {
diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index ead4f222d5..0ee7dc21f2 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -29,7 +29,7 @@
  */
 bool s390_pci_update_dma_avail(int fd, unsigned int *avail)
 {
-    g_autofree struct vfio_iommu_type1_info *info;
+    g_autofree struct vfio_iommu_type1_info *info = NULL;
     uint32_t argsz;
 
     assert(avail);
@@ -230,7 +230,7 @@ static void s390_pci_read_pfip(S390PCIBusDevice *pbdev,
  */
 void s390_pci_get_clp_info(S390PCIBusDevice *pbdev)
 {
-    g_autofree struct vfio_device_info *info;
+    g_autofree struct vfio_device_info *info = NULL;
     VFIOPCIDevice *vfio_pci;
     uint32_t argsz;
     int fd;
-- 
2.27.0


