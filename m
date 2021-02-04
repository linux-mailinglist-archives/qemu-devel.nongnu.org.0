Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A730FCFD
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 20:37:44 +0100 (CET)
Received: from localhost ([::1]:43982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7kRj-0007Tt-7c
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 14:37:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l7k3a-0006oG-JO
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:12:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1l7k3P-0003IZ-6b
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 14:12:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612465953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wq1oNNb6es5putCafMaMjx/H+TYOyFtHTNVfvZIqlXQ=;
 b=GpAyHUu39Zz9oxv7gpzUZnmZJje4j+F3n8QzmhAT0gEtg3r6RrzmtqHl3ksXzvlxKOY7Cg
 xfiy0ih7szvGd3KARzt/3Bx2iWQDZawf34WqUz9MU+jvla+X0/KdCo2g2ac/zOfmEXcFzW
 WkbqhzKwurpcX++ETWpNnu53a8BURt8=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-mc9JYkYRPjqYmF6iwxl69g-1; Thu, 04 Feb 2021 14:12:31 -0500
X-MC-Unique: mc9JYkYRPjqYmF6iwxl69g-1
Received: by mail-qt1-f198.google.com with SMTP id v13so3365448qtq.18
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 11:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wq1oNNb6es5putCafMaMjx/H+TYOyFtHTNVfvZIqlXQ=;
 b=OS4JYJYYofx6D86Nr7N/x9HmAUgtinQO3xbo1CJIcRbjwjWkCrpUKrZM4fMxJFw9kz
 +4qEiJKyWlzzWwQPodRX9iqdi0FpwtU+JfudUVlpTLaNB/wtUrBQzFwAB7z1VNG/xlX3
 WGWJJ+4csx+9OJnq1XTNcPgEHWCLjTN2Mxe8UBx7bAZZAn1qnuOTWTRUoREa3MLYSn4b
 RUr3r+2LhJ/Us7OO7KGyZs1yq1xlazDOBTtCFO/VoF8m2otBOBPozUPOuGJFxQQKsse5
 Sa9rZPSFBk6eTYINPc753BWSydOSkNCCVUfgX9Gyquff4cmA+RSjcNFSRWr6SIswewvf
 q/6A==
X-Gm-Message-State: AOAM533BsXe1FTRfzMsJnv0qxAafOnMpuOrMOM2Rbpp9kPuEvyc2ggLI
 2xCjsJU36xI9zEHVkKHErFjH6jrviChjDai7NsbPfnNCSA0y1OohCenrQmyxj7hiA/VVQVmHcf7
 zmiUCTAytk1zdZdTvQaNFrrvWB8TCdprwhHyDV3kMmgSXgAhcDpGZ5TbnO17TYF2D
X-Received: by 2002:ac8:5189:: with SMTP id c9mr1016147qtn.241.1612465950922; 
 Thu, 04 Feb 2021 11:12:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwIptZK7bql5eMTeTTrmSHEQHwypTIdWETmGMAkytwTmSMLM3O7P6oEHLbdK7ADTJyPpHlvA==
X-Received: by 2002:ac8:5189:: with SMTP id c9mr1016117qtn.241.1612465950629; 
 Thu, 04 Feb 2021 11:12:30 -0800 (PST)
Received: from xz-x1.redhat.com
 (bras-vprn-toroon474qw-lp130-20-174-93-89-182.dsl.bell.ca. [174.93.89.182])
 by smtp.gmail.com with ESMTPSA id k8sm6220122qkk.79.2021.02.04.11.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Feb 2021 11:12:29 -0800 (PST)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost: Unbreak SMMU and virtio-iommu on dev-iotlb support
Date: Thu,  4 Feb 2021 14:12:28 -0500
Message-Id: <20210204191228.187550-1-peterx@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
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
Cc: Eric Auger <eric.auger@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, peterx@redhat.com,
 Eugenio Perez Martin <eperezma@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previous work on dev-iotlb message broke vhost on either SMMU or virtio-iommu
since dev-iotlb (or PCIe ATS) is not yet supported for those archs.

An initial idea is that we can let IOMMU to export this information to vhost so
that vhost would know whether the vIOMMU would support dev-iotlb, then vhost
can conditionally register to dev-iotlb or the old iotlb way.  We can work
based on some previous patch to introduce PCIIOMMUOps as Yi Liu proposed [1].

However it's not as easy as I thought since vhost_iommu_region_add() does not
have a PCIDevice context at all since it's completely a backend.  It seems
non-trivial to pass over a PCI device to the backend during init.  E.g. when
the IOMMU notifier registered hdev->vdev is still NULL.

To make the fix smaller and easier, this patch goes the other way to leverage
the flag_changed() hook of vIOMMUs so that SMMU and virtio-iommu can trap the
dev-iotlb registration and fail it.  Then vhost could try the fallback solution
as using UNMAP invalidation for it's translations.

[1] https://lore.kernel.org/qemu-devel/1599735398-6829-4-git-send-email-yi.l.liu@intel.com/

Reported-by: Eric Auger <eric.auger@redhat.com>
Fixes: b68ba1ca57677acf870d5ab10579e6105c1f5338
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Eric Auger <eric.auger@redhat.com>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/arm/smmuv3.c          |  5 +++++
 hw/virtio/vhost.c        | 13 +++++++++++--
 hw/virtio/virtio-iommu.c |  5 +++++
 3 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 98b99d4fe8e..bd1f97000d9 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -1497,6 +1497,11 @@ static int smmuv3_notify_flag_changed(IOMMUMemoryRegion *iommu,
     SMMUv3State *s3 = sdev->smmu;
     SMMUState *s = &(s3->smmu_state);
 
+    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
+        error_setg(errp, "SMMUv3 does not support dev-iotlb yet");
+        return -EINVAL;
+    }
+
     if (new & IOMMU_NOTIFIER_MAP) {
         error_setg(errp,
                    "device %02x.%02x.%x requires iommu MAP notifier which is "
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 28c7d781721..6e17d631f77 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -704,6 +704,7 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     Int128 end;
     int iommu_idx;
     IOMMUMemoryRegion *iommu_mr;
+    int ret;
 
     if (!memory_region_is_iommu(section->mr)) {
         return;
@@ -726,8 +727,16 @@ static void vhost_iommu_region_add(MemoryListener *listener,
     iommu->iommu_offset = section->offset_within_address_space -
                           section->offset_within_region;
     iommu->hdev = dev;
-    memory_region_register_iommu_notifier(section->mr, &iommu->n,
-                                          &error_fatal);
+    ret = memory_region_register_iommu_notifier(section->mr, &iommu->n, NULL);
+    if (ret) {
+        /*
+         * Some vIOMMUs do not support dev-iotlb yet.  If so, try to use the
+         * UNMAP legacy message
+         */
+        iommu->n.notifier_flags = IOMMU_NOTIFIER_UNMAP;
+        memory_region_register_iommu_notifier(section->mr, &iommu->n,
+                                              &error_fatal);
+    }
     QLIST_INSERT_HEAD(&dev->iommu_list, iommu, iommu_next);
     /* TODO: can replay help performance here? */
 }
diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
index 6b9ef7f6b2b..c2883a2f6c8 100644
--- a/hw/virtio/virtio-iommu.c
+++ b/hw/virtio/virtio-iommu.c
@@ -893,6 +893,11 @@ static int virtio_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu_mr,
                                             IOMMUNotifierFlag new,
                                             Error **errp)
 {
+    if (new & IOMMU_NOTIFIER_DEVIOTLB_UNMAP) {
+        error_setg(errp, "Virtio-iommu does not support dev-iotlb yet");
+        return -EINVAL;
+    }
+
     if (old == IOMMU_NOTIFIER_NONE) {
         trace_virtio_iommu_notify_flag_add(iommu_mr->parent_obj.name);
     } else if (new == IOMMU_NOTIFIER_NONE) {
-- 
2.26.2


