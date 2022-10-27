Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8B160F18A
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 09:52:09 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onxfx-0004e2-1K; Thu, 27 Oct 2022 03:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onxfU-00047O-Vh
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1onxfM-00077x-6A
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 03:51:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666857062;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=2Tdyq6dPkBFp21N85TgqcoXncfyeJD9Xr7nXRxNxsuw=;
 b=VUivE20Wi34N5+gdaJErkBuXwNS73Elgo1R0H9tXnNXTVCv59PiVQtLCCYSBi9aMgyHTdd
 94cKngzgvxRvJbFIV4xby1KX2OrO2wOglloZfvrbwIY7/TmMLXpVeHNOKn986r0wWB4Mpj
 HdhK3fH+cO8vBkXL/Nj55Y4Iqg801s8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-iwfOyrVGMA-S1M-AAZRqjA-1; Thu, 27 Oct 2022 03:51:00 -0400
X-MC-Unique: iwfOyrVGMA-S1M-AAZRqjA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D974C858F17;
 Thu, 27 Oct 2022 07:50:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-102.pek2.redhat.com
 [10.72.12.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9AD2A401D49;
 Thu, 27 Oct 2022 07:50:55 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	qemu-devel@nongnu.org
Cc: peterx@redhat.com, yi.l.liu@intel.com, yi.y.sun@linux.intel.com,
 eperezma@redhat.com, lulu@redhat.com, Jason Wang <jasowang@redhat.com>
Subject: [PATCH V4 0/4] PASID support for Intel IOMMU
Date: Thu, 27 Oct 2022 15:50:38 +0800
Message-Id: <20221027075042.16894-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi All:

This series tries to introduce PASID support for Intel IOMMU. The work
is based on the previous scalabe mode support by implement the
ECAP_PASID. A new "x-pasid-mode" is introduced to enable this
mode. All internal vIOMMU codes were extended to support PASID instead
of the current RID2PASID method. The code is also capable of
provisiong address space with PASID. Note that no devices can issue
PASID DMA right now, this needs future work.

This will be used for prototying PASID based device like virtio or
future vPASID support for Intel IOMMU.

Test has been done with the Linux guest with scalalbe mode enabled and
disabled. A virtio prototype[1][2] that can issue PAISD based DMA
request were also tested, different PASID were used in TX and RX in
those testing drivers.

Changes since V3:

- rearrange the member for vtd_iotlb_key structure
- reorder the pasid parameter ahead of addr for vtd_lookup_iotlb()
- allow access size from 1 to 8 for vtd_mem_ir_fault_ops

Changes since V2:

- use PCI_BUILD_BDF() instead of vtd_make_source_id()
- Tweak the comments above vtd_as_hash()
- use PCI_BUS_NUM() instead of open coding
- rename vtd_as to vtd_address_spaces
- rename vtd_qualify_report_fault() to vtd_report_qualify_fault()
- forbid device-iotlb with PASID
- report PASID based qualified fault
- log PASID during errors

Changes since V1:

- speed up IOMMU translation when RID2PASID is not used
- remove the unnecessary L1 PASID invalidation descriptor support
- adding support for catching the translation to interrupt range when
  in the case of PT and scalable mode
- refine the comments to explain the hash algorithm used in IOTLB
  lookups

Please review.

[1] https://github.com/jasowang/qemu.git virtio-pasid
[2] https://github.com/jasowang/linux.git virtio-pasid

Jason Wang (4):
  intel-iommu: don't warn guest errors when getting rid2pasid entry
  intel-iommu: drop VTDBus
  intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a function
  intel-iommu: PASID support

 hw/i386/intel_iommu.c          | 685 ++++++++++++++++++++++-----------
 hw/i386/intel_iommu_internal.h |  16 +-
 hw/i386/trace-events           |   2 +
 include/hw/i386/intel_iommu.h  |  18 +-
 include/hw/pci/pci_bus.h       |   2 +
 5 files changed, 482 insertions(+), 241 deletions(-)

-- 
2.25.1


