Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A25C76D6E29
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 22:38:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjnPW-0007P5-Fa; Tue, 04 Apr 2023 16:37:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjnPT-0007Os-BK
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:37:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pjnPR-0006sv-OY
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:37:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680640659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=ZvINh2lTlsVDYlNcpGVFYZYIKuIcNzr8nmm2/+dwIpc=;
 b=RMYKhwaEjQybbU4s/FA3DE9Wh12zZji36IDDdQ/oDeh4bPWNzxG02qtLd98SI/jUV/Dt3V
 zFovxfeUTrlCjPD8llLn1PfYCK9b7tGqmlShAYJSVendlLKo3uMRKcVmQmrA1uBUpi0vN1
 OtbYTAG4zVUd0SlXeDDV8BAufLUWHjs=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-q6Jq1ZthMsWD4YK-Q6dWPA-1; Tue, 04 Apr 2023 16:37:38 -0400
X-MC-Unique: q6Jq1ZthMsWD4YK-Q6dWPA-1
Received: by mail-ed1-f69.google.com with SMTP id
 s30-20020a508d1e000000b005005cf48a93so47345055eds.8
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 13:37:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680640655;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZvINh2lTlsVDYlNcpGVFYZYIKuIcNzr8nmm2/+dwIpc=;
 b=yM+9FqmLyVKwpZUGSKimAm8qmOK01hcEhvPI0BSRUrq9xYR0fkCP3dgZivNbDwnuQZ
 2GPZjFAOm1bVYxjHoZV0ENmtdX19SSV8GJDlXCmi6VPNANDnSa4bu09gLbJCu7r/gMgT
 proKS2cl4uBz+jk6W2ZU8zxLAnZl2teViqi5mLm2Wut1dGbYr6DispDZ92tmtQ+lzZ/O
 D4KhAA9VAmxZV1QZ9C21Vo4nNfRstWrJarzvbfRr6K3iNoiKJrk9LBj0DQTwl/8dzI+2
 mTzwaYtK6C2Mdm9K5lDZL4qrkvS0TVngGt+x3o5zWHBZeOGJbXoM//Bv9B174zE9HB1U
 FU+w==
X-Gm-Message-State: AAQBX9czABtY1k/vIDvXyzS9oe0CV6Cg10eTXc+4JigPeWWoVLY9jsgv
 4X9139etcNUX9y+OAu0Sd+mQxb9tStMRdPsp0mNVeMMjOi946toJPSBxlHYs4yrQlfOkFmKzIO/
 gFJPhGod8pYZ6XZHjxaSXGtu1UMi/NksLk1fVZds1WTHYXL1qHLWdCEkUTxX9uevVA03/Hec=
X-Received: by 2002:a17:906:1252:b0:86a:316:d107 with SMTP id
 u18-20020a170906125200b0086a0316d107mr677168eja.72.1680640655758; 
 Tue, 04 Apr 2023 13:37:35 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z/FuaVSnRnch8tuDLZtmd9Oqfg2gUQP1zsXVf+nUGchjBMOLZpCDQ5Cs1Nd3hUHvMNQJKeNw==
X-Received: by 2002:a17:906:1252:b0:86a:316:d107 with SMTP id
 u18-20020a170906125200b0086a0316d107mr677149eja.72.1680640655435; 
 Tue, 04 Apr 2023 13:37:35 -0700 (PDT)
Received: from redhat.com ([2.52.139.22]) by smtp.gmail.com with ESMTPSA id
 y13-20020a170906524d00b00932ed432475sm6370955ejm.124.2023.04.04.13.37.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 13:37:34 -0700 (PDT)
Date: Tue, 4 Apr 2023 16:37:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Peter Xu <peterx@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH] Revert "memory: Optimize replay of guest mapping"
Message-ID: <917c1c552b2d1b732f9a86c6a90684c3a5e4cada.1680640587.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

From: Peter Maydell <peter.maydell@linaro.org>

This reverts commit 6da24341866fa940fd7d575788a2319514941c77
("memory: Optimize replay of guest mapping").

This change breaks the mps3-an547 board under TCG (and
probably other TCG boards using an IOMMU), which now
assert:

$ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
-kernel /tmp/an547-mwe/build/test.elf
qemu-system-arm: ../../softmmu/memory.c:1903:
memory_region_register_iommu_notifier: Assertion `n->end <=
memory_region_size(mr)' failed.

This is because tcg_register_iommu_notifier() registers
an IOMMU notifier which covers the entire address space,
so the assertion added in this commit is not correct.

For the 8.0 release, just revert this commit as it is
only an optimization.

Fixes: 6da24341866f ("memory: Optimize replay of guest mapping")
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

completely untested but Pater asked help in sending this.

 hw/i386/intel_iommu.c | 2 +-
 softmmu/memory.c      | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index faade7def8..a62896759c 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3850,7 +3850,7 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
                 .domain_id = vtd_get_domain_id(s, &ce, vtd_as->pasid),
             };
 
-            vtd_page_walk(s, &ce, n->start, n->end, &info, vtd_as->pasid);
+            vtd_page_walk(s, &ce, 0, ~0ULL, &info, vtd_as->pasid);
         }
     } else {
         trace_vtd_replay_ce_invalid(bus_n, PCI_SLOT(vtd_as->devfn),
diff --git a/softmmu/memory.c b/softmmu/memory.c
index 5305aca7ca..b1a6cae6f5 100644
--- a/softmmu/memory.c
+++ b/softmmu/memory.c
@@ -1900,7 +1900,6 @@ int memory_region_register_iommu_notifier(MemoryRegion *mr,
     iommu_mr = IOMMU_MEMORY_REGION(mr);
     assert(n->notifier_flags != IOMMU_NOTIFIER_NONE);
     assert(n->start <= n->end);
-    assert(n->end <= memory_region_size(mr));
     assert(n->iommu_idx >= 0 &&
            n->iommu_idx < memory_region_iommu_num_indexes(iommu_mr));
 
@@ -1924,6 +1923,7 @@ uint64_t memory_region_iommu_get_min_page_size(IOMMUMemoryRegion *iommu_mr)
 
 void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
 {
+    MemoryRegion *mr = MEMORY_REGION(iommu_mr);
     IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
     hwaddr addr, granularity;
     IOMMUTLBEntry iotlb;
@@ -1936,7 +1936,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
 
     granularity = memory_region_iommu_get_min_page_size(iommu_mr);
 
-    for (addr = n->start; addr < n->end; addr += granularity) {
+    for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
         iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
         if (iotlb.perm != IOMMU_NONE) {
             n->notify(n, &iotlb);
-- 
MST


