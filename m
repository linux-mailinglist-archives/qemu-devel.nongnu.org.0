Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B1033DB07
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:32:05 +0100 (CET)
Received: from localhost ([::1]:45632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDY3-0005fT-Ng
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:32:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMD9z-0004Ac-Qj
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:07:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:33601)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1lMD9y-0005ez-48
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:07:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615914429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SuTTLbr8pUx8cq/Cg0MVql4UKVXXqxEm//Ce9skXMzc=;
 b=QEbCiySF/aVRXzGnM8cwtqVRihMahcOK6MlANUz6gnKjDplny145jR1655DKOn+ySTZpvD
 9PeAFNCa/4TmdnVVqVfN5np02aRdzzGSOhLw4Pu/ck/6qFunf99AsKrmlyt2JjYaUvjbqP
 uEADLy+rtDkzDLhaNz5kVxHob0wYyWw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-ID2SG3xnMzq3p9yaiVbKNQ-1; Tue, 16 Mar 2021 13:07:06 -0400
X-MC-Unique: ID2SG3xnMzq3p9yaiVbKNQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E776910866B2;
 Tue, 16 Mar 2021 17:07:04 +0000 (UTC)
Received: from rhel8vm.home.shazbot.org (ovpn-115-65.phx2.redhat.com
 [10.3.115.65])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 83218610AF;
 Tue, 16 Mar 2021 17:06:51 +0000 (UTC)
Subject: [PULL 05/10] spapr_iommu: Fix vhost integration regression
From: Alex Williamson <alex.williamson@redhat.com>
To: qemu-devel@nongnu.org
Date: Tue, 16 Mar 2021 11:06:52 -0600
Message-ID: <161591441221.135549.3348582586850550463.stgit@rhel8vm.home.shazbot.org>
In-Reply-To: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
References: <161591414009.135549.5804863877511053803.stgit@rhel8vm.home.shazbot.org>
User-Agent: StGit/0.23
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Greg Kurz <groug@kaod.org>, Peter Xu <peterx@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Auger <eric.auger@redhat.com>

Previous work on dev-iotlb message broke spapr_iommu/vhost integration
as it did for SMMU and virtio-iommu. The spapr_iommu currently
only sends IOMMU_NOTIFIER_UNMAP notifications. Since commit
958ec334bca3 ("vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support"),
VHOST first tries to register IOMMU_NOTIFIER_DEVIOTLB_UNMAP notifier
and if it fails, falls back to legacy IOMMU_NOTIFIER_UNMAP. So
spapr_iommu must fail on the IOMMU_NOTIFIER_DEVIOTLB_UNMAP
registration.

Reported-by: Peter Xu <peterx@redhat.com>
Fixes: b68ba1ca5767 ("memory: Add IOMMU_NOTIFIER_DEVIOTLB_UNMAP IOMMUTLBNotificationType")
Signed-off-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210209213233.40985-3-eric.auger@redhat.com>
Acked-by: David Gibson <david@gibson.dropbear.id.au>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
---
 hw/ppc/spapr_iommu.c |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/ppc/spapr_iommu.c b/hw/ppc/spapr_iommu.c
index 30352df00ea3..24537ffcbd32 100644
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



