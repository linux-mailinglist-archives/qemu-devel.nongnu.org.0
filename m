Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 266CD33DB1C
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:41:30 +0100 (CET)
Received: from localhost ([::1]:60828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDhB-00040C-71
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:41:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMD9g-0003dd-Ii
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMD9e-0005XV-2J
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:06:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615914409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XHrEx7Uk22MXdZ5eQtdOFU4Y3Fhd/atIrzTCWuydpDU=;
 b=R+zhPz1H9fwacoDSQa9nwaEdctOZQ1RwLSP3wSmA3XrIlhmI0yqnYVBe8MJaOzysR0YtcV
 6yIpXNXB8o49VINVOQB4qWSkCCDT+6AqsHPQQ1kUtEk+tMssAxWjYdaegPWyBafGXOyLQ0
 Oe/G7MRaviZDaMb/5kQwMoXmAOnRso4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-ORsxud9jOw-WJkmbdYVksQ-1; Tue, 16 Mar 2021 13:06:47 -0400
X-MC-Unique: ORsxud9jOw-WJkmbdYVksQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4543F1934103
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 17:06:46 +0000 (UTC)
Received: from rhel8vm.home.shazbot.org (ovpn-115-65.phx2.redhat.com
 [10.3.115.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D769919D61;
 Tue, 16 Mar 2021 17:06:45 +0000 (UTC)
Subject: [PULL 04/10] vfio: Do not register any IOMMU_NOTIFIER_DEVIOTLB_UNMAP
 notifier
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Mar 2021 11:06:46 -0600
Message-ID: <161591440654.135549.253333162470895031.stgit@rhel8vm.home.shazbot.org>
In-Reply-To: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
References: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=alex.williamson@redhat.com;
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
Cc: Eric Auger <eric.auger@redhat.com>, Jason Wang <jasowang@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

In an attempt to fix smmu/virtio-iommu - vhost regression, commit
958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support")
broke virtio-iommu integration. This is due to the fact VFIO registers
IOMMU_NOTIFIER_ALL notifiers, which includes IOMMU_NOTIFIER_DEVIOTLB_UNMAP
and this latter now is rejected by the virtio-iommu. As a consequence,
the registration fails. VHOST behaves like a device with an ATC cache. The
VFIO device does not support this scheme yet.

Let's register only legacy MAP and UNMAP notifiers.

Fixes: 958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210209213233.40985-2-eric.auger@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Acked-by: Alex Williamson <alex.williamson@redhat.com>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/vfio/common.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index d360d6f2da14..35a41fd05251 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -787,7 +787,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
         iommu_idx = memory_region_iommu_attrs_to_index(iommu_mr,
                                                        MEMTXATTRS_UNSPECIFIED);
         iommu_notifier_init(&giommu->n, vfio_iommu_map_notify,
-                            IOMMU_NOTIFIER_ALL,
+                            IOMMU_NOTIFIER_IOTLB_EVENTS,
                             section->offset_within_region,
                             int128_get64(llend),
                             iommu_idx);



