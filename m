Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57BDF278A21
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Sep 2020 15:57:57 +0200 (CEST)
Received: from localhost ([::1]:34960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLoEW-0005Mv-EW
	for lists+qemu-devel@lfdr.de; Fri, 25 Sep 2020 09:57:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kLo69-0002Yy-HO
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:49:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46299)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1kLo61-0000ja-RB
 for qemu-devel@nongnu.org; Fri, 25 Sep 2020 09:49:17 -0400
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601041743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lHwkygGOtFCWYYuo4bTMJ9qBoaJdLyJPLBK8kFsoDDY=;
 b=O4vuLgBYiPOJbDBfO8d4tjB1GFZceBD+fMjptp207l5lol/PB8/KhixaE7JJoVaMgBaUod
 9Lom/0FE96afJ54iYzVk9yKmJ+QuU7RtEp7UzBKXn4QrRzcIlykOGeEZRl26tYlXyVkJN5
 2fsm8FYiFwZNLwkEKOgXN3+tH8MFpwg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517-ouihUiiqPFqWfsVYlFz0rg-1; Fri, 25 Sep 2020 09:49:02 -0400
X-MC-Unique: ouihUiiqPFqWfsVYlFz0rg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D62781084C9E;
 Fri, 25 Sep 2020 13:49:00 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-113-81.ams2.redhat.com [10.36.113.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 150A45D9DC;
 Fri, 25 Sep 2020 13:48:49 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, stefanha@redhat.com, fam@euphon.net,
 philmd@redhat.com, alex.williamson@redhat.com
Subject: [RFC 0/3] NVMe passthrough: Take into account host IOVA reserved
 regions
Date: Fri, 25 Sep 2020 15:48:42 +0200
Message-Id: <20200925134845.21053-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/25 02:48:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lvivier@redhat.com, kwolf@redhat.com, cohuck@redhat.com, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current IOVA allocator allocates within the [0x10000, 1ULL << 39]
window, without paying attention to the host IOVA reserved regions.
This prevents NVMe passthtrough from working on ARM as the fixed
IOVAs rapidly grow up to the MSI reserved region [0x8000000, 0x8100000]
causing some VFIO MAP DMA failures. This series collects the usable
IOVA regions using VFIO GET_INFO (this requires the host to support
VFIO_IOMMU_TYPE1_INFO_CAP_IOVA_RANGE) and rework the fixed and
temporary IOVA allocators to avoid those latter. Also the min/max
IOVAs now can be dynamically determined.

Unfortunately the usable host IOVA ranges reported by the kernel
currently do not take into account the dma_mask of devices within
the group. This needs to be fixed, otherwise this series might try
to allocate temporary IOVAs within the range supported by the IOMMU
but beyond the allowed dma_mask. I got the case where the SMMU
supports up to 48 bits but the dma_mask only is 42bits. This kernel
dependency plus the testing limited to one peculiar ARM platform
explains the RFC state.

Best Regards

Eric

This series can be found at:
https://github.com/eauger/qemu/tree/nvme_rfc

This was tested on ARM only.


Eric Auger (3):
  util/vfio-helpers: Collect IOVA reserved regions
  util/vfio-helpers: Dynamically compute the min/max IOVA
  util/vfio-helpers: Rework the IOVA allocator to avoid IOVA reserved
    regions

 util/vfio-helpers.c | 162 ++++++++++++++++++++++++++++++++++++++------
 1 file changed, 143 insertions(+), 19 deletions(-)

-- 
2.21.3


