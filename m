Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ECC6645B16
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:38:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uc7-0002MK-QY; Wed, 07 Dec 2022 08:37:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2uc5-0002Lh-Nf
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:37:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1p2ubo-0006Sp-0i
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:37:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670420226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7tnKkh2H991EuhWAO/Xp+JQeGePEbB2PoZpX19x2WTg=;
 b=S3TIU+14QXSMXluTc+iiZgncNFBU25LrD3M/HBCok+4U5/quePm/8lFf/aRUfj4XfWNr8m
 qQGjVdCzPWletQSa5efJsViRxqbXh3fn9Uc7f3VL4IYTYW0hm6amVzRgd6sCW1WNI0tkaI
 bEPlvs1OFkeL/16X3UL954q2Gl4uLog=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-561-fbEJDFEqOMWbpRtmD3ehzQ-1; Wed, 07 Dec 2022 08:37:01 -0500
X-MC-Unique: fbEJDFEqOMWbpRtmD3ehzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81CE886F130;
 Wed,  7 Dec 2022 13:37:00 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4B969E70;
 Wed,  7 Dec 2022 13:36:58 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, mst@redhat.com,
 peterx@redhat.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 jean-philippe@linaro.org, bharat.bhushan@nxp.com,
 alex.williamson@redhat.com
Subject: [PATCH for 8.0 1/2] virtio-iommu: Add unmap on virtio_iommu_remap()
Date: Wed,  7 Dec 2022 14:36:45 +0100
Message-Id: <20221207133646.635760-2-eric.auger@redhat.com>
In-Reply-To: <20221207133646.635760-1-eric.auger@redhat.com>
References: <20221207133646.635760-1-eric.auger@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

following replay() callback documentation in memory.h we
shall first invalidate (notify with flag == IOMMU_NONE) and
then map for existing mappings. The code currently skips the
unmap and just do map. This may lead to duplicate mapping
attempts on VFIO side (leading to spurious -EEXIST DMA_MAP
failures). Add the unmap.

Signed-off-by: Eric Auger <eric.auger@redhat.com>
Fixes 308e5e1b5f8 ("virtio-iommu: Add replay() memory region callback")
---
 hw/virtio/virtio-iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 62e07ec2e4..30334c85aa 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -1034,6 +1034,7 @@ static gboolean virtio_iommu_remap(gpointer key, gpointer value, gpointer data)
 
     trace_virtio_iommu_remap(mr->parent_obj.name, interval->low, interval->high,
                              mapping->phys_addr);
+    virtio_iommu_notify_unmap(mr, interval->low, interval->high);
     virtio_iommu_notify_map(mr, interval->low, interval->high,
                             mapping->phys_addr, mapping->flags);
     return false;
-- 
2.37.3


