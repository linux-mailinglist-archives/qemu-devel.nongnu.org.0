Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 529B6484D13
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 05:25:12 +0100 (CET)
Received: from localhost ([::1]:41990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4xrL-0001cK-57
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 23:25:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4xmU-00041u-Gy
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:20:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1n4xmQ-0002Ze-Hj
 for qemu-devel@nongnu.org; Tue, 04 Jan 2022 23:20:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641356404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=gMMRd4YzQ+CU/1OwLNXuwREmFmbHztKwVKJfbzMNPwM=;
 b=OISufoVYEp1LViSPZNmuYz9bBFFT4Gwp2Vv5rvf3mjATMXU83aQGpLQmm2ka+RsXRYye7z
 aqudDzVP9yINbQgrmYtw1Uy3ZRp0LnqSerzuvb3Omt4f/NZILhMopiYXiSkHumXM4HBcOR
 GBTieK7OACHdhCBMDCpRn0uz6Bqgims=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-x4yrF0-jM8-9g2gI6JzLrQ-1; Tue, 04 Jan 2022 23:19:59 -0500
X-MC-Unique: x4yrF0-jM8-9g2gI6JzLrQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 489D118009E9;
 Wed,  5 Jan 2022 04:19:58 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-255.pek2.redhat.com
 [10.72.13.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 228F16ABAA;
 Wed,  5 Jan 2022 04:19:48 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Subject: [PATCH 0/3] PASID support for Intel IOMMU
Date: Wed,  5 Jan 2022 12:19:41 +0800
Message-Id: <20220105041945.13459-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.37,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This will be used for prototying PASID based device like virito or
future vPASID support for Intel IOMMU.

Test has been done with the Linux guest with scalalbe mode enabled and
disabled. A virtio prototype[1][2] that can issue PAISD based DMA
request were also tested.

This series depends on the fix of passthrough mode:

https://lore.kernel.org/all/20211222063956.2871-1-jasowang@redhat.com/T/

Please review.

[1] https://github.com/jasowang/qemu.git virtio-pasid
[2] https://github.com/jasowang/linux.git virtio-pasid

Jason Wang (3):
  intel-iommu: don't warn guest errors when getting rid2pasid entry
  intel-iommu: drop VTDBus
  intel-iommu: PASID support

 hw/i386/intel_iommu.c          | 538 +++++++++++++++++++++------------
 hw/i386/intel_iommu_internal.h |  14 +-
 hw/i386/trace-events           |   2 +
 include/hw/i386/intel_iommu.h  |  16 +-
 include/hw/pci/pci_bus.h       |   2 +
 5 files changed, 359 insertions(+), 213 deletions(-)

-- 
2.25.1


