Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 869C94E2064
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 07:03:10 +0100 (CET)
Received: from localhost ([::1]:45656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWB8H-0002mo-Kd
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 02:03:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:42210)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nWB0K-0005Zf-TC
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:54:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nWB06-0005Az-K7
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 01:54:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647842078;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mHE57/WjeYrR7piiL+i08kaQ4AmHuaais6RoT2X/xPw=;
 b=W5aVMY5Lgx/zmWrVCfm2jlsPK9hzu6aKViHUQMIwiw2rMSNvLcG5B9IXoD86udGnEHhpby
 nfca6R3e5il/opXgRkXypJX2+0tgA/i5McX6PkAwHZPksaxxkZYU9jW/pH3KVcpU7209wV
 OWEMMEET2BMm3jcm9lbYalSMRt827R8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249--ruaMG6cMY-9zaHHoSz9gg-1; Mon, 21 Mar 2022 01:54:35 -0400
X-MC-Unique: -ruaMG6cMY-9zaHHoSz9gg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8F632A59550;
 Mon, 21 Mar 2022 05:54:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-14-31.pek2.redhat.com [10.72.14.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 41CC843248C;
 Mon, 21 Mar 2022 05:54:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH V2 0/4] PASID support for Intel IOMMU
Date: Mon, 21 Mar 2022 13:54:25 +0800
Message-Id: <20220321055429.10260-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, yi.l.liu@intel.com,
 yi.y.sun@linux.intel.com, qemu-devel@nongnu.org
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

This series depends on the fixes[3][4] of intel-iommu:

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
[3] https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg02173.html
[4] https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg04441.html

Jason Wang (4):
  intel-iommu: don't warn guest errors when getting rid2pasid entry
  intel-iommu: drop VTDBus
  intel-iommu: convert VTD_PE_GET_FPD_ERR() to be a function
  intel-iommu: PASID support

 hw/i386/intel_iommu.c          | 641 ++++++++++++++++++++++-----------
 hw/i386/intel_iommu_internal.h |  14 +-
 hw/i386/trace-events           |   2 +
 include/hw/i386/intel_iommu.h  |  18 +-
 include/hw/pci/pci_bus.h       |   2 +
 5 files changed, 450 insertions(+), 227 deletions(-)

-- 
2.25.1


