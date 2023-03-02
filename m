Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC74B6A7CA9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:30:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHZ-000651-Ew; Thu, 02 Mar 2023 03:27:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGi-0005ac-HS
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGh-0002TP-08
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ezeTgkQPCK21u2w9yCROfexIuLJe7uFJDNbBydlsbB4=;
 b=ilWwiFJawt5xG/8da6vlqiT5QGRpCfAbXqLb3hMzDzV809E23NhSoVobPAQjhfpHvqn1lv
 65ce9vZQB/4aO0NS3YgssXS4WIfkoukl/Xln8KA88nq/8xql+7I9msuwZAmOgHl0pboAmi
 5fZ4gqyHgqlPFatWYfSVlpuTcXxLfFM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-391-m5kY3xWcOee_pNmS3tMoqw-1; Thu, 02 Mar 2023 03:26:24 -0500
X-MC-Unique: m5kY3xWcOee_pNmS3tMoqw-1
Received: by mail-wm1-f69.google.com with SMTP id
 s18-20020a7bc392000000b003deaf780ab6so746461wmj.4
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745583;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ezeTgkQPCK21u2w9yCROfexIuLJe7uFJDNbBydlsbB4=;
 b=wzWpZO6BjA3wSk/Kb38eXycSOJfqZcO/Q1oAB3DLpBBhdCJOxQ5L9tyD2AW9i1CAio
 nFtOW9tx2ucbI0AxhICQw9JGUqXE6oF9Y76GMxvYHYgcEQqUB/ntKNxSYDy2iiIhqxcH
 /Jdz24UYwPuP2AnEr5JQ1r0ifrfTaYrVJrszEmY4KXCqjVugbfp2mww+q886MlZK88jh
 YNWvK1EF3ts+hKOc4BQCloULtH1ZYbSFZfQ/d5qTKoRn9sTUK/W1/QL/b/e0/eBrDpr5
 3VS0uSPGkn6HpQqmSmcyNGm9W7SalcgkmO2jvQhcbXrwFBsazkgruZLn5X9ysRdITUMW
 Y2Rw==
X-Gm-Message-State: AO0yUKU3D2aOzycnyoLdHHsNkIusXlZZdD/YzmW0xiKAXMMLecq9MDCc
 xiSWwAJJMvQFoJcWpOIWeAxMqzjR9HY8odj+FIbBlPgi5LpeT88o9nzjydUxt27aRHX+OWQGeA0
 6CFYGg361dQZdusntJTSFtTTf0pKAblfpaG5L7VZVxaFF5fYJ6ybUKcAnMHqsnlFgaw==
X-Received: by 2002:a05:600c:458a:b0:3eb:37ce:4c38 with SMTP id
 r10-20020a05600c458a00b003eb37ce4c38mr7473692wmo.3.1677745583171; 
 Thu, 02 Mar 2023 00:26:23 -0800 (PST)
X-Google-Smtp-Source: AK7set/EgUNbybxOP2PDi34fb6LPHydbxhlpRv+9poYUrGfFkimM2enogC14W8d77D8Kgz3IZNrlRg==
X-Received: by 2002:a05:600c:458a:b0:3eb:37ce:4c38 with SMTP id
 r10-20020a05600c458a00b003eb37ce4c38mr7473675wmo.3.1677745582935; 
 Thu, 02 Mar 2023 00:26:22 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 n11-20020a05600c3b8b00b003e203681b26sm2291018wms.29.2023.03.02.00.26.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:22 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:19 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Peter Xu <peterx@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 36/53] memory: Optimize replay of guest mapping
Message-ID: <20230302082343.560446-37-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Zhenzhong Duan <zhenzhong.duan@intel.com>

On x86, there are two notifiers registered due to vtd-ir memory region
splitting the whole address space. During replay of the address space
for each notifier, the whole address space is scanned which is
unnecessory.

We only need to scan the space belong to notifier montiored space.

Assert when notifier is used to monitor beyond iommu memory region's
address space.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
Message-Id: <20230215065238.713041-1-zhenzhong.duan@intel.com>
Acked-by: Peter Xu <peterx@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu.c | 2 +-
 softmmu/memory.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 98a5c304a7..6b1de80e85 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3831,7 +3831,7 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
                 .domain_id = vtd_get_domain_id(s, &ce, vtd_as->pasid),
             };
 
-            vtd_page_walk(s, &ce, 0, ~0ULL, &info, vtd_as->pasid);
+            vtd_page_walk(s, &ce, n->start, n->end, &info, vtd_as->pasid);
         }
     } else {
         trace_vtd_replay_ce_invalid(bus_n, PCI_SLOT(vtd_as->devfn),
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 9d64efca26..da7d846619 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1900,6 +1900,7 @@ int memory_region_register_iommu_notifier(MemoryRegion *mr,
     iommu_mr = IOMMU_MEMORY_REGION(mr);
     assert(n->notifier_flags != IOMMU_NOTIFIER_NONE);
     assert(n->start <= n->end);
+    assert(n->end <= memory_region_size(mr));
     assert(n->iommu_idx >= 0 &&
            n->iommu_idx < memory_region_iommu_num_indexes(iommu_mr));
 
@@ -1923,7 +1924,6 @@ uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_mr)
 
 void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
 {
-    MemoryRegion *mr = MEMORY_REGION(iommu_mr);
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
     hwaddr addr, granularity;
     IOMMUTLBEntry iotlb;
@@ -1936,7 +1936,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
 
     granularity = memory_region_iommu_get_min_page_size(iommu_mr);
 
-    for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
+    for (addr = n->start; addr < n->end; addr += granularity) {
         iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
         if (iotlb.perm != IOMMU_NONE) {
             n->notify(n, &iotlb);
-- 
MST


