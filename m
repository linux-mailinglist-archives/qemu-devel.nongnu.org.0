Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D358F6A0308
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 08:00:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV5Zu-0007Eh-5D; Thu, 23 Feb 2023 01:59:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV5Zr-0007Ac-Ac
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:59:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pV5Zp-0007wy-QG
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 01:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677135572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=8+TUlLoslvw2Ez1pqcjJnpbUiJc/EEsPYdP9gR80CnQ=;
 b=ND7uml7u/3Kzu8aOnde1j7yT/cLH94vFfcZoZKBjw/jPn/eTQwckHTABMIhqnu931WiM7H
 mNivwKhHX6kEag5nfE0olChKabny2CD40yNVjSqofBYwfmvUAWM9PeTZdnYhpAZRqbxP7s
 UFKHmhbpPGb9orPGkkRgMg9zPumCp/Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-467-L4PUtYftPn2hNKsbg8QgKA-1; Thu, 23 Feb 2023 01:59:30 -0500
X-MC-Unique: L4PUtYftPn2hNKsbg8QgKA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D9B8F3C0E456;
 Thu, 23 Feb 2023 06:59:29 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-177.pek2.redhat.com
 [10.72.13.177])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39C65492C14;
 Thu, 23 Feb 2023 06:59:26 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	peterx@redhat.com
Cc: qemu-devel@nongnu.org, eric.auger@redhat.com, viktor@daynix.com,
 lvivier@redhat.com, Jason Wang <jasowang@redhat.com>
Subject: [PATCH V2 0/5] Fix UNMAP notifier for intel-iommu
Date: Thu, 23 Feb 2023 14:59:19 +0800
Message-Id: <20230223065924.42503-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi All:

According to ATS, device should work if ATS is disabled. This is not
correctly implemented in the current intel-iommu since it doesn't
handle the UNMAP notifier correctly. This breaks the vhost-net +
vIOMMU without dt.

The root casue is that the when there's a device IOTLB miss (note that
it's not specific to PCI so it can work without ATS), Qemu doesn't
build the IOVA tree, so when guest start an IOTLB invalidation, Qemu
won't trigger the UNMAP notifier.

Fixing this by triggering UNMAP notifier in those cases.

Thanks

Changes since V1:

- Do not depend on the iova tree for such kind of invalidation but
  simply tries to do UNMAP for all attached IOMMU notifiers

Jason Wang (4):
  intel-iommu: fail MAP notifier without caching mode
  intel-iommu: fail DEVIOTLB_UNMAP without dt mode
  memory: introduce memory_region_unmap_iommu_notifier_range()
  smmu: switch to use memory_region_unmap_iommu_notifier_range()

Peter Xu (1):
  intel-iommu: send UNMAP notifications for domain or global inv desc

 hw/arm/smmu-common.c  | 16 +---------------
 hw/i386/intel_iommu.c | 29 ++++++++++++++++++++++++-----
 include/exec/memory.h | 10 ++++++++++
 softmmu/memory.c      | 13 +++++++++++++
 4 files changed, 48 insertions(+), 20 deletions(-)

-- 
2.25.1


