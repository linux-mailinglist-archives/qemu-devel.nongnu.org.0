Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD056D6E28
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Apr 2023 22:38:35 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjnP9-0007NQ-M7; Tue, 04 Apr 2023 16:37:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjnP6-0007N7-Me
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1pjnP4-0006pr-2w
 for qemu-devel@nongnu.org; Tue, 04 Apr 2023 16:37:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680640637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7BFv9lyXiy+M0IsFxu0Wiq7XIbzoB6RsALcTj/i1CwY=;
 b=jFZaM6acCSL82zyc8w6SQgGHcz/b+nyaxUCXiyG7WevfV4Ic935VVZsxrSnHbCEks+0XZ6
 EJwn/W+gaHG8wm3aZ65p0XwYlkU9IyxWG2ncOrvfZmeioxda1UFBjhLa8kCPcmh7J9Kn7/
 ZD3BEN/Ox3owOL1tfxe8EcBkBrHCD88=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-321-mpptW2ITOeGbtzqpXlf32g-1; Tue, 04 Apr 2023 16:37:15 -0400
X-MC-Unique: mpptW2ITOeGbtzqpXlf32g-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-5df44ccedcaso9766d6.1
 for <qemu-devel@nongnu.org>; Tue, 04 Apr 2023 13:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680640633; x=1683232633;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BFv9lyXiy+M0IsFxu0Wiq7XIbzoB6RsALcTj/i1CwY=;
 b=AF7ZyvN5HaytYW6K13Bm99JmvUkemoJeded37m4SCXJ2kpXG70z66X0hyckQjqmYXI
 b0MIsl189b63f6dlGp8NgZxtFEBN0DX0nlEPYYeXlnJ+HDjqSHms/dhoZazrjFunTfn5
 YAsUYySSxzzjkNkbXr7VNxuTspM+NKnuhIKjuOCklhCCc/iBZwByArHFE6HtNnXz7Hlz
 noPJaBqm7lGMSM58DGCpsPU1PfJF8mrVq86n87dpNOwdzsN7/XFsf2ScS3L06BlvtLO4
 ssATbRzzkwVL9YO/XUkq9BjaDidgizsIKoAla1cwaZWDt4zQsUOVYGFRs3jTdY+pc+Il
 /f2w==
X-Gm-Message-State: AAQBX9fPuRQKYakoch/Ld9ioYf0k73h0ys0tqizbkwe9QVANkZ6c28vY
 zjOUKoSv0jbYIUESXWoFY69pqzmRztAQ0uVCiBtdfBpWMTYfpgd3oF9whARxGbz/N23WE7Kfk/+
 wNgdYmCIgOXde3uc=
X-Received: by 2002:a05:6214:529b:b0:5e0:3825:9adb with SMTP id
 kj27-20020a056214529b00b005e038259adbmr903qvb.2.1680640633488; 
 Tue, 04 Apr 2023 13:37:13 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZtEETwqrR3A+xsP5UEJTuGQ/JGqHgTw1r4w9U7F2TXRBDaIE6TJgVPGuVeKaM45GqdroLIFg==
X-Received: by 2002:a05:6214:529b:b0:5e0:3825:9adb with SMTP id
 kj27-20020a056214529b00b005e038259adbmr865qvb.2.1680640633128; 
 Tue, 04 Apr 2023 13:37:13 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 jh14-20020a0562141fce00b005dd8b9345b6sm3662560qvb.78.2023.04.04.13.37.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Apr 2023 13:37:12 -0700 (PDT)
Date: Tue, 4 Apr 2023 16:37:10 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Zhenzhong Duan <zhenzhong.duan@intel.com>,
 Jason Wang <jasowang@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 David Hildenbrand <david@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: Re: [PULL 36/53] memory: Optimize replay of guest mapping
Message-ID: <ZCyKdktyAMiH/eKQ@x1n>
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-37-mst@redhat.com>
 <CAFEAcA8D+Yy-G1WUY-aPLvk2b1Bh46sheF8msUMQa2Cgt+mfdQ@mail.gmail.com>
 <20230404150929-mutt-send-email-mst@kernel.org>
 <CAFEAcA_SN91x3W+QG-_wFAK4GgQkEW1CPYktK_JoELTG8uvo1g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="24TxGHK/at1WSI5r"
Content-Disposition: inline
In-Reply-To: <CAFEAcA_SN91x3W+QG-_wFAK4GgQkEW1CPYktK_JoELTG8uvo1g@mail.gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
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


--24TxGHK/at1WSI5r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, Apr 04, 2023 at 09:23:21PM +0100, Peter Maydell wrote:
> On Tue, 4 Apr 2023 at 20:13, Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Apr 04, 2023 at 07:00:04PM +0100, Peter Maydell wrote:
> > > On Thu, 2 Mar 2023 at 08:26, Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > From: Zhenzhong Duan <zhenzhong.duan@intel.com>
> > > >
> > > > On x86, there are two notifiers registered due to vtd-ir memory region
> > > > splitting the whole address space. During replay of the address space
> > > > for each notifier, the whole address space is scanned which is
> > > > unnecessory.
> > > >
> > > > We only need to scan the space belong to notifier montiored space.
> > > >
> > > > Assert when notifier is used to monitor beyond iommu memory region's
> > > > address space.
> > >
> > > Hi. This patch seems to have regressed the mps3-an547 board,
> > > which now asserts on startup:
> > >
> > > $ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
> > > -kernel /tmp/an547-mwe/build/test.elf
> > > qemu-system-arm: ../../softmmu/memory.c:1903:
> > > memory_region_register_iommu_notifier: Assertion `n->end <=
> > > memory_region_size(mr)' failed.
> > > Aborted (core dumped)
> > >
> > > (reported under https://gitlab.com/qemu-project/qemu/-/issues/1488)
> > >
> > > Since this commit says it's just an optimization, for the 8.0
> > > release can we simply revert it without breaking anything?
> 
> > Fine to revert by me.  Zhenzhong Duan  can you pls fix up
> > this regression and repost? Maybe fix typos in commit log
> > when reposting. Thanks!
> 
> Would somebody also like to send the 'revert' patch, please?
> I had that all ready to go, but my git send-email setup
> seems to have mysteriously broken and I don't have time to
> fix it this evening :-(

Attached.

> 
> This is the commit message I wrote:
> 
> 
> Revert "memory: Optimize replay of guest mapping"
> 
> This reverts commit 6da24341866fa940fd7d575788a2319514941c77
> ("memory: Optimize replay of guest mapping").
> 
> This change breaks the mps3-an547 board under TCG (and
> probably other TCG boards using an IOMMU), which now
> assert:
> 
> $ ./build/x86/qemu-system-arm --machine mps3-an547 -serial stdio
> -kernel /tmp/an547-mwe/build/test.elf
> qemu-system-arm: ../../softmmu/memory.c:1903:
> memory_region_register_iommu_notifier: Assertion `n->end <=
> memory_region_size(mr)' failed.
> 
> This is because tcg_register_iommu_notifier() registers
> an IOMMU notifier which covers the entire address space,
> so the assertion added in this commit is not correct.
> 
> For the 8.0 release, just revert this commit as it is
> only an optimization.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> 
> 
> thanks
> -- PMM
> 

-- 
Peter Xu

--24TxGHK/at1WSI5r
Content-Type: text/plain; charset=utf-8
Content-Disposition: attachment;
	filename="0001-Revert-memory-Optimize-replay-of-guest-mapping.patch"

From 8fd48876a6910341dfcbe1b8bf1185d2cea851cd Mon Sep 17 00:00:00 2001
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 4 Apr 2023 16:34:22 -0400
Subject: [PATCH] Revert "memory: Optimize replay of guest mapping"

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

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Xu <peterx@redhat.com>
---
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
2.39.1


--24TxGHK/at1WSI5r--


