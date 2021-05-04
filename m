Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5DA2372D64
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 17:54:31 +0200 (CEST)
Received: from localhost ([::1]:41976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldxNV-0005MJ-V0
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 11:54:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ldxLO-0004LB-K8
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:52:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34426)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1ldxLK-0004Mm-NQ
 for qemu-devel@nongnu.org; Tue, 04 May 2021 11:52:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620143533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=+a+ZchBSphuAXQvcuIUOn9Rh82lP2Y2KDctoB7uZ/q8=;
 b=KLRIX7aLiytCRWHF9Sfw1Qw0q9QMCNghSQdT8c7vxUCHHNH40Ci4zIlhBFaX4lENtkHsrM
 cTGNke9J1JQkUs/aLo520POmVr/A7PR4xdoBJxB/qwgj0Md4n2Aj/qFDCH+mYvOcKnTGEh
 RQz1J+3bo+mB00FjRoBgOxZBWLZ5xDA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-406-NU7xVnh-M1OmVkmm_ha7eA-1; Tue, 04 May 2021 11:52:11 -0400
X-MC-Unique: NU7xVnh-M1OmVkmm_ha7eA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0CD041074640;
 Tue,  4 May 2021 15:52:10 +0000 (UTC)
Received: from [172.30.42.188] (ovpn-113-225.phx2.redhat.com [10.3.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0064C60C0F;
 Tue,  4 May 2021 15:52:02 +0000 (UTC)
Subject: [PATCH] vfio/pci: Revert nvlink removal uAPI breakage
From: Alex Williamson <alex.williamson@redhat.com>
To: kvm@vger.kernel.org, groug@kaod.org, hch@lst.de,
 gregkh@linuxfoundation.org, daniel@ffwll.ch
Date: Tue, 04 May 2021 09:52:02 -0600
Message-ID: <162014341432.3807030.11054087109120670135.stgit@omen>
User-Agent: StGit/1.0-8-g6af9-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-ppc@nongnu.org, linux-api@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Revert the uAPI changes from the below commit with notice that these
regions and capabilities are no longer provided.

Fixes: b392a1989170 ("vfio/pci: remove vfio_pci_nvlink2")
Reported-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---

Greg (Kurz), please double check this resolves the issue.  Thanks!

 include/uapi/linux/vfio.h |   46 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 42 insertions(+), 4 deletions(-)

diff --git a/include/uapi/linux/vfio.h b/include/uapi/linux/vfio.h
index 34b1f53a3901..ef33ea002b0b 100644
--- a/include/uapi/linux/vfio.h
+++ b/include/uapi/linux/vfio.h
@@ -333,10 +333,21 @@ struct vfio_region_info_cap_type {
 #define VFIO_REGION_SUBTYPE_INTEL_IGD_LPC_CFG	(3)
 
 /* 10de vendor PCI sub-types */
-/* subtype 1 was VFIO_REGION_SUBTYPE_NVIDIA_NVLINK2_RAM, don't use */
+/*
+ * NVIDIA GPU NVlink2 RAM is coherent RAM mapped onto the host address space.
+ *
+ * Deprecated, region no longer provided
+ */
+#define VFIO_REGION_SUBTYPE_NVIDIA_NVLINK2_RAM	(1)
 
 /* 1014 vendor PCI sub-types */
-/* subtype 1 was VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD, don't use */
+/*
+ * IBM NPU NVlink2 ATSD (Address Translation Shootdown) register of NPU
+ * to do TLB invalidation on a GPU.
+ *
+ * Deprecated, region no longer provided
+ */
+#define VFIO_REGION_SUBTYPE_IBM_NVLINK2_ATSD	(1)
 
 /* sub-types for VFIO_REGION_TYPE_GFX */
 #define VFIO_REGION_SUBTYPE_GFX_EDID            (1)
@@ -630,9 +641,36 @@ struct vfio_device_migration_info {
  */
 #define VFIO_REGION_INFO_CAP_MSIX_MAPPABLE	3
 
-/* subtype 4 was VFIO_REGION_INFO_CAP_NVLINK2_SSATGT, don't use */
+/*
+ * Capability with compressed real address (aka SSA - small system address)
+ * where GPU RAM is mapped on a system bus. Used by a GPU for DMA routing
+ * and by the userspace to associate a NVLink bridge with a GPU.
+ *
+ * Deprecated, capability no longer provided
+ */
+#define VFIO_REGION_INFO_CAP_NVLINK2_SSATGT	4
+
+struct vfio_region_info_cap_nvlink2_ssatgt {
+	struct vfio_info_cap_header header;
+	__u64 tgt;
+};
 
-/* subtype 5 was VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD, don't use */
+/*
+ * Capability with an NVLink link speed. The value is read by
+ * the NVlink2 bridge driver from the bridge's "ibm,nvlink-speed"
+ * property in the device tree. The value is fixed in the hardware
+ * and failing to provide the correct value results in the link
+ * not working with no indication from the driver why.
+ *
+ * Deprecated, capability no longer provided
+ */
+#define VFIO_REGION_INFO_CAP_NVLINK2_LNKSPD	5
+
+struct vfio_region_info_cap_nvlink2_lnkspd {
+	struct vfio_info_cap_header header;
+	__u32 link_speed;
+	__u32 __pad;
+};
 
 /**
  * VFIO_DEVICE_GET_IRQ_INFO - _IOWR(VFIO_TYPE, VFIO_BASE + 9,



