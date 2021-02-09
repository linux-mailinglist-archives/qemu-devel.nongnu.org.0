Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4C3158AF
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 22:35:52 +0100 (CET)
Received: from localhost ([::1]:53924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9afn-0000UY-Qc
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 16:35:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l9adF-0007k4-WC
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:33:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l9adD-0003QV-Ue
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:33:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612906390;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=92NG+f3sSvz04Akz1ljC0pjPIcuzVJBz3zyXRsquL04=;
 b=Acm0pclbYOtfh2vImznO4LrkihnfcyvJP8tSdnyzRdZF2jejrb6JpIVi8fWTSDOniu6uds
 ThbHP4VM6EWbLb5kqSNdm1Q2yuVylTJa932lgnmilKgbgDigIudqS8kpwMkNbgAR6T6LqR
 FkOTtrMCmyeLaUBLUhu9Uw3rMlFimnU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-201-QlqR1zwROpWbBxbJR1cUKA-1; Tue, 09 Feb 2021 16:33:09 -0500
X-MC-Unique: QlqR1zwROpWbBxbJR1cUKA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05E9B107ACE3;
 Tue,  9 Feb 2021 21:33:08 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-10.ams2.redhat.com [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A6F95B694;
 Tue,  9 Feb 2021 21:33:04 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jasowang@redhat.com, eperezma@redhat.com,
 jean-philippe@linaro.org, david@gibson.dropbear.id.au, groug@kaod.org
Subject: [PATCH 1/2] vfio: Do not register any IOMMU_NOTIFIER_DEVIOTLB_UNMAP
 notifier
Date: Tue,  9 Feb 2021 22:32:32 +0100
Message-Id: <20210209213233.40985-2-eric.auger@redhat.com>
In-Reply-To: <20210209213233.40985-1-eric.auger@redhat.com>
References: <20210209213233.40985-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

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
---
 hw/vfio/common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6ff1daa763..a50b10c801 100644
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
-- 
2.26.2


