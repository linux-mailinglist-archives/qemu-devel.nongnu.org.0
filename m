Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D9D33230C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 11:30:54 +0100 (CET)
Received: from localhost ([::1]:58598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJZdd-0006zB-3Z
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 05:30:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZaw-0005Ep-O4
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:28:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1lJZat-0005Uu-Lr
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 05:28:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615285683;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wslI4Xo7nHMdlfZXfKQve2gre/KvtQaKiXc/xoOFKJo=;
 b=GxUmSGPVVJWvqFRK92CvrRXc3o/dE2aNDGY+BZm/XFJ+2xzwkLhGMpbyGm3luQTTMeFRol
 ezD6zh4jVlCY/jtswTEljcIhrefRHpKos4Oqya/4NZzGCWXG4/EE4lvAjt2EdzajW7hjH1
 Ek0MH782PtvbbRb7bH1UJwaPLLmQHns=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-0bK9lX4ZPNqBdxkK7gu32Q-1; Tue, 09 Mar 2021 05:28:00 -0500
X-MC-Unique: 0bK9lX4ZPNqBdxkK7gu32Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C768026867;
 Tue,  9 Mar 2021 10:27:58 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-254.ams2.redhat.com [10.36.112.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4C5519709;
 Tue,  9 Mar 2021 10:27:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 jean-philippe@linaro.org, peterx@redhat.com, jasowang@redhat.com,
 pbonzini@redhat.com
Subject: [PATCH v3 0/7] Some vIOMMU fixes
Date: Tue,  9 Mar 2021 11:27:35 +0100
Message-Id: <20210309102742.30442-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: vivek.gautam@arm.com, shameerali.kolothum.thodi@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Here is a set of vIOMMU fixes:

SMMUv3:
- top SID computation overflow when handling SMMU_CMD_CFGI_ALL
- internal IOTLB handling (changes related to range invalidation)
  - smmu_iotlb_inv_iova with asid = -1
  - non power of 2 invalidation range handling.

VIRTIO-IOMMU:
  - non power of 2 invalidation range handling.

Best Regards

Eric

v3: https://github.com/eauger/qemu/tree/viommu_fixes_for_6-v3
v2: https://github.com/eauger/qemu/tree/viommu_fixes_for_6-v2

History:
v2 -> v3:
- Collected R-b's
- Added doc-comment for dma_aligned_pow2_mask()
- Up to now I have kept a single TTL check to avoid the
  remove-by-key path in smmu_iotlb_inv_iova (not checking TG)

v1 -> v2:
- new:
  - dma: Introduce dma_aligned_pow2_mask()
  - intel_iommu: Fix mask may be uninitialized in vtd_context_device_invalidate
  - hw/arm/smmuv3: Uniformize sid traces

Eric Auger (7):
  intel_iommu: Fix mask may be uninitialized in
    vtd_context_device_invalidate
  dma: Introduce dma_aligned_pow2_mask()
  virtio-iommu: Handle non power of 2 range invalidations
  hw/arm/smmu-common: Fix smmu_iotlb_inv_iova when asid is not set
  hw/arm/smmuv3: Enforce invalidation on a power of two range
  hw/arm/smmuv3: Fix SMMU_CMD_CFGI_STE_RANGE handling
  hw/arm/smmuv3: Uniformize sid traces

 hw/arm/smmu-common.c     | 32 +++++++++++++---------
 hw/arm/smmu-internal.h   |  5 ++++
 hw/arm/smmuv3.c          | 58 +++++++++++++++++++++++++++-------------
 hw/arm/trace-events      | 24 ++++++++---------
 hw/i386/intel_iommu.c    | 32 +++++++---------------
 hw/virtio/virtio-iommu.c | 19 ++++++++++---
 include/sysemu/dma.h     | 12 +++++++++
 softmmu/dma-helpers.c    | 26 ++++++++++++++++++
 8 files changed, 139 insertions(+), 69 deletions(-)

-- 
2.26.2


