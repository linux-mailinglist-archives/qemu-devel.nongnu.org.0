Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DEFC3158B3
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 22:39:57 +0100 (CET)
Received: from localhost ([::1]:32818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9ajk-0003hY-1j
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 16:39:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l9adf-0007x4-Hc
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:33:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28543)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1l9adY-0003Y3-Co
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 16:33:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612906409;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iZT9xJ1+fp0hP5g8lqCrvWBZJVludifeiDJJ/OAH16U=;
 b=W5Cr7AxcTEiB+b5tT+QfR+Eo7JKIcaj0CfRKukP2KyX+Xu0iN56K8yRqdHSvQLZCTB1+P9
 Twb7nl+QmiWSD2mc7YLC+WMcvEiywqJPHrWj9RuabuulE3K4eEoIhtu/ErxYrMmYp1Y32d
 okgv59cCWuC2vokgBHYMQaA7bGm8820=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-NC0IAKWvNTiwtD3Ccv6rmA-1; Tue, 09 Feb 2021 16:33:28 -0500
X-MC-Unique: NC0IAKWvNTiwtD3Ccv6rmA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 12E8D192D786;
 Tue,  9 Feb 2021 21:33:27 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-112-10.ams2.redhat.com [10.36.112.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C3BE5D745;
 Tue,  9 Feb 2021 21:33:08 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, peter.maydell@linaro.org, mst@redhat.com,
 alex.williamson@redhat.com, jasowang@redhat.com, eperezma@redhat.com,
 jean-philippe@linaro.org, david@gibson.dropbear.id.au, groug@kaod.org
Subject: [PATCH 2/2] spapr_iommu: Fix vhost integration regression
Date: Tue,  9 Feb 2021 22:32:33 +0100
Message-Id: <20210209213233.40985-3-eric.auger@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Previous work on dev-iotlb message broke spapr_iommu/vhost integration
as it did for SMMU and virtio-iommu. The spapr_iommu currently
only sends IOMMU_NOTIFIER_UNMAP notifications. Since commit
958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support"),
VHOST first tries to register IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
and if it fails, falls back to legacy IOMMU_NOTIFIER_UNMAP. So
spapr_iommu must fail on the IOMMU_NOTIFIER_DEVIOTLB_UNMAP
registration.

Reported-by: Peter Xu <peterx@redhat.com>
Fixes: b68ba1ca57677acf870d5ab10579e6105c1f5338
Signed-off-by: Eric Auger <eric.auger@redhat.com>
---
 hw/ppc/spapr_iommu.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 30352df00e..24537ffcbd 100644
--- a/hw/ppc/spapr_iommu.c
+++ b/hw/ppc/spapr_iommu.c
@@ -212,6 +212,11 @@ static int spapr_tce_notify_flag_changed(IOMMUMemoryRegion *iommu,
 {
     struct SpaprTceTable *tbl = container_of(iommu, SpaprTceTable, iommu);
 
+    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
+        error_setg(errp, "spart_tce does not support dev-iotlb yet");
+        return -EINVAL;
+    }
+
     if (old == IOMMU_NOTIFIER_NONE && new != IOMMU_NOTIFIER_NONE) {
         spapr_tce_set_need_vfio(tbl, true);
     } else if (old != IOMMU_NOTIFIER_NONE && new == IOMMU_NOTIFIER_NONE) {
-- 
2.26.2


