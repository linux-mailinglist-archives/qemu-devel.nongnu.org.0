Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F665F8987
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Oct 2022 07:51:44 +0200 (CEST)
Received: from localhost ([::1]:56546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohPDz-0005Dg-4c
	for lists+qemu-devel@lfdr.de; Sun, 09 Oct 2022 01:51:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ohPBD-0002XI-11
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 01:48:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26268)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ohPBA-0005OI-0P
 for qemu-devel@nongnu.org; Sun, 09 Oct 2022 01:48:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665294527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y0kEhgZDguK3v7p4Flt+5UVKYqJBthc2TpgaY1XlOnw=;
 b=FLaZepdgoqxeYvqisL9iKmc7DxkdPw08998bBfdFnAQrVhtOnCCp3LTp4PKd1Kuhnxii33
 B+8LGjE2vBbozlu9ORvFkG7yI+w/zBUTSe/2oA2cpWrFsle10muUVTGt3JxrLuHtV58WUB
 7tFbzauIc3yDs1tR5wlPJg0eZ8tbHkA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-8C770wehNd2HWSsJlm0gxw-1; Sun, 09 Oct 2022 01:48:45 -0400
X-MC-Unique: 8C770wehNd2HWSsJlm0gxw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7F328862EE1;
 Sun,  9 Oct 2022 05:48:45 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-61.pek2.redhat.com [10.72.12.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A187D2166B4D;
 Sun,  9 Oct 2022 05:48:42 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Cc: qemu-devel@nongnu.org, yi.l.liu@intel.com, yi.y.sun@linux.intel.com,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH V3 0/4] PASID support for Intel IOMMU
Date: Sun,  9 Oct 2022 13:48:31 +0800
Message-Id: <20221009054835.1540-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
- adding support for cacthing the translation to interrupt range when
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


