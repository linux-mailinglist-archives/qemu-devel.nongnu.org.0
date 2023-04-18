Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C4A66E6670
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 15:57:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1polou-0003Xe-Tq; Tue, 18 Apr 2023 09:56:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1polot-0003Vx-5a
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:56:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1polor-0006LW-77
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 09:56:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681826187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Menwzf6faERAImrdgFPlClcIfIee86LpEAUgYDco4AU=;
 b=bY6evv8TYAX9c6YNXrg7+zlpC8AryGYRxU2p4Qv8AJjvpp7bH3dDRVF7lhbZB+35ZQdXrE
 mQxQZ2KIbDhsi8TgCRdp/cZ88TOLNIKQvVu6KTsss3011MYjcH3lZf7UdOious2FyY2QZc
 3ETUS12zKxK7sJtkR7uFRxap66LXdbg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-558--y1QnTvTOLeFx5YUmkq2zA-1; Tue, 18 Apr 2023 09:56:26 -0400
X-MC-Unique: -y1QnTvTOLeFx5YUmkq2zA-1
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-5ef5fbe2cfaso7193316d6.0
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 06:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681826184; x=1684418184;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Menwzf6faERAImrdgFPlClcIfIee86LpEAUgYDco4AU=;
 b=aoKPFmykk/iR2Yu7fZyNltXsKFVqmjwnpIwq2uvEk0vBT9jjHSLJ5NmJEDfzlcVlzN
 aW+6hu+otD7+P1MFbJzuO+5QZ3zAQY3FwbKYk1w7KRNmZPwq/w4ZmaubdAEAMkL131LW
 7FxzunhwGEWSkO1uzBMC6lC485VAnuI4Vnk/ePy8Sx70wPkuUTUIxuyeCo2Dr4f9cPk2
 qDSCE1hc8406FYsROuxpExuiXcwPKpUg0cO3olKaRGq3j8+WADkDkAfxiOd3NOnnLmpe
 36DSMRbeL4WRaYrqrEP9j+sunIeoz76c3WU9lDh6Lu8NIL+RTQjcxIOCr9BKG5fYrdto
 FxHg==
X-Gm-Message-State: AAQBX9cExgwdx5tJsWilY9BWzDrMI9DgcU6M+vsQdq3anxK4El4N/K7h
 3UoSblMcwqAtskYFqrUCOIQcZiggeSb6Xw1urrNQ0lj4lzFE0RFV5BdC7IWWPaZVGmT3TMlU7Eb
 VDsMf8rEGqAwnVng=
X-Received: by 2002:a05:6214:4114:b0:5a9:ab44:5fdf with SMTP id
 kc20-20020a056214411400b005a9ab445fdfmr20852842qvb.0.1681826184291; 
 Tue, 18 Apr 2023 06:56:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350Yy2vD22M8k/J6sTMXP/+o49VjWFmAUmldRNOGTDr8xMzFa7s6uranfJWel9jTemcXSIJ+rJA==
X-Received: by 2002:a05:6214:4114:b0:5a9:ab44:5fdf with SMTP id
 kc20-20020a056214411400b005a9ab445fdfmr20852811qvb.0.1681826183973; 
 Tue, 18 Apr 2023 06:56:23 -0700 (PDT)
Received: from x1n (bras-base-aurron9127w-grc-40-70-52-229-124.dsl.bell.ca.
 [70.52.229.124]) by smtp.gmail.com with ESMTPSA id
 m1-20020ad44a01000000b005ef61084fddsm2507647qvz.131.2023.04.18.06.56.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 06:56:23 -0700 (PDT)
Date: Tue, 18 Apr 2023 09:56:22 -0400
From: Peter Xu <peterx@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Zhenzhong Duan <zhenzhong.duan@intel.com>, qemu-devel@nongnu.org,
 mst@redhat.com, jasowang@redhat.com, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, david@redhat.com, philmd@linaro.org
Subject: Re: [PATCH v3] memory: Optimize replay of guest mapping
Message-ID: <ZD6hhnUNVoHhIdgi@x1n>
References: <20230413110019.48922-1-zhenzhong.duan@intel.com>
 <CAFEAcA9VsB7+yXG6XiyRAJ4TaUJVFAu4h-rT9ZN=+o5fu0S2cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFEAcA9VsB7+yXG6XiyRAJ4TaUJVFAu4h-rT9ZN=+o5fu0S2cw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Tue, Apr 18, 2023 at 11:13:57AM +0100, Peter Maydell wrote:
> On Thu, 13 Apr 2023 at 12:12, Zhenzhong Duan <zhenzhong.duan@intel.com> wrote:
> >
> > On x86, there are two notifiers registered due to vtd-ir memory
> > region splitting the entire address space. During replay of the
> > address space for each notifier, the whole address space is
> > scanned which is unnecessary. We only need to scan the space
> > belong to notifier monitored space.
> >
> > While on x86 IOMMU memory region spans over entire address space,
> > but on some other platforms(e.g. arm mps3-an547), IOMMU memory
> > region is only a window in the whole address space. user could
> > register a notifier with arbitrary scope beyond IOMMU memory
> > region. Though in current implementation replay is only triggered
> > by VFIO and dirty page sync with notifiers derived from memory
> > region section, but this isn't guaranteed in the future.
> >
> > So, we replay the intersection part of IOMMU memory region and
> > IOMMU notifier in memory_region_iommu_replay().
> >
> > Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
> > ---
> > v3: Fix assert failure on mps3-an547
> > v2: Add an assert per Peter
> > Tested on x86 with a net card passed to guest(kvm/tcg), ping/ssh pass.
> > Also did simple bootup test with mps3-an547
> >
> >  hw/i386/intel_iommu.c | 2 +-
> >  softmmu/memory.c      | 5 +++--
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index a62896759c78..faade7def867 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -3850,7 +3850,7 @@ static void vtd_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
> >                  .domain_id = vtd_get_domain_id(s, &ce, vtd_as->pasid),
> >              };
> >
> > -            vtd_page_walk(s, &ce, 0, ~0ULL, &info, vtd_as->pasid);
> > +            vtd_page_walk(s, &ce, n->start, n->end, &info, vtd_as->pasid);
> >          }
> >      } else {
> >          trace_vtd_replay_ce_invalid(bus_n, PCI_SLOT(vtd_as->devfn),
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index b1a6cae6f583..f7af691991de 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -1925,7 +1925,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
> >  {
> >      MemoryRegion *mr = MEMORY_REGION(iommu_mr);
> >      IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
> > -    hwaddr addr, granularity;
> > +    hwaddr addr, end, granularity;
> >      IOMMUTLBEntry iotlb;
> >
> >      /* If the IOMMU has its own replay callback, override */
> > @@ -1935,8 +1935,9 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
> >      }
> >
> >      granularity = memory_region_iommu_get_min_page_size(iommu_mr);
> > +    end = MIN(n->end, memory_region_size(mr));
> >
> > -    for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
> > +    for (addr = n->start; addr < end; addr += granularity) {
> >          iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
> >          if (iotlb.perm != IOMMU_NONE) {
> >              n->notify(n, &iotlb);
> 
> 
> The documentation for the replay method of IOMMUMemoryRegionClass
> says:
>      * The default implementation of memory_region_iommu_replay() is to
>      * call the IOMMU translate method for every page in the address space
>      * with flag == IOMMU_NONE and then call the notifier if translate
>      * returns a valid mapping. If this method is implemented then it
>      * overrides the default behaviour, and must provide the full semantics
>      * of memory_region_iommu_replay(), by calling @notifier for every
>      * translation present in the IOMMU.
> 
> This commit changes the default implementation so it's no longer
> doing this for every page in the address space. If the change is
> correct, we should update the doc comment too.
> 
> Oddly, the doc comment for memory_region_iommu_replay() itself
> doesn't very clearly state what its semantics are; it could
> probably be improved.
> 
> Anyway, this change is OK for the TCG use of iommu notifiers,
> because that doesn't care about replay.

Since the notifier contains the range information I'd say the change
shouldn't affect any caller but only a pure performance difference.  Indeed
it'll be nicer the documentation can be updated too.  Thanks,

-- 
Peter Xu


