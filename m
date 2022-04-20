Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C81508C5C
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:45:21 +0200 (CEST)
Received: from localhost ([::1]:41972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhCW8-0002HH-81
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:45:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhCDb-00074p-Rs
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:26:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1nhCDY-000895-Gc
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 11:26:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650468363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=KfcLUA8FCpoaUz2hsaM/Qguhc3WpFfkUxXJwYt8YlMk=;
 b=SCJOVHb7OGpJ23SGm61GweWcCqzxvJyrnZIyDNu6GxfZCOwnaH+0CLb0AyIAdbUMMY3NVG
 JSgxUUmyQBE6AUCa3yaLCWjSMWFubH9cdvdqEKW6Kzf1YLcDjePh07ris/FgTUFTglhjVK
 g4ni6pyMdiYoP0IkbsjU1xALoYNQBuY=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-536-OwD-fSD5NfeWMogYrmd5-Q-1; Wed, 20 Apr 2022 11:26:02 -0400
X-MC-Unique: OwD-fSD5NfeWMogYrmd5-Q-1
Received: by mail-io1-f72.google.com with SMTP id
 h10-20020a05660224ca00b0064c77aa4477so1427116ioe.17
 for <qemu-devel@nongnu.org>; Wed, 20 Apr 2022 08:26:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=KfcLUA8FCpoaUz2hsaM/Qguhc3WpFfkUxXJwYt8YlMk=;
 b=FmrQudVEB+aPs04L9JWMvd+tk7Ql20Mhj96tA/NdnxXSwBgeHEeEqtcq5vZJjvJYn0
 tAvwARt5bqDvkdWiQIyEKdA+VjxtQqqJvTdtREf4pKJllQW/XA23ApGl0v/DEfD/Hdcx
 JZ/iiq/heWSHSpaQUQzKM0tVXTylIgbe2xFc4KB36jGyeNnuJJt1IhgF9qd5toFBSB3y
 m9WeYPNOnA+/BsmAvjggrNUOrP23k241o2wFdYtgqhlqJ3KT7pdcxBflLlCSxCHT5le+
 Bx92Tn6PYSRi6bOdK57uMmw55PYoS+v3QY96Ou98H6pR54d8g4QXXKZaV4tR/x7+LD2a
 cNWQ==
X-Gm-Message-State: AOAM5312IWi64pxqhCommnjeqmpAtI0OKMxDmnNF5ySIMdqiQAozQ1N9
 qu+x3VJWgdbD91EGz7AYhjk4K6YqB3OGpOrdgAbli7+iVnWzGVPVeEj+SA2L9q2lSq+VfCZS++L
 T872AWcnf8LW/gmA=
X-Received: by 2002:a92:d18b:0:b0:2c6:675:807c with SMTP id
 z11-20020a92d18b000000b002c60675807cmr9088675ilz.33.1650468361585; 
 Wed, 20 Apr 2022 08:26:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzf3XUVVCHP3WhJeawz2RV0bEI6OysVTeP5nzsEtakjHxQzVnpRsoda/uCwwbhfctCKcCkb/g==
X-Received: by 2002:a92:d18b:0:b0:2c6:675:807c with SMTP id
 z11-20020a92d18b000000b002c60675807cmr9088662ilz.33.1650468361302; 
 Wed, 20 Apr 2022 08:26:01 -0700 (PDT)
Received: from xz-m1.local
 (cpec09435e3e0ee-cmc09435e3e0ec.cpe.net.cable.rogers.com. [99.241.198.116])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a056e02054900b002cc1959aa6fsm6405684ils.87.2022.04.20.08.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 08:26:00 -0700 (PDT)
Date: Wed, 20 Apr 2022 11:25:56 -0400
From: Peter Xu <peterx@redhat.com>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH] softmmu/memory: Skip translation size instead of fixed
 granularity if translate() successfully
Message-ID: <YmAmBE1nKx9ecnzd@xz-m1.local>
References: <1650098041-127062-1-git-send-email-chenxiang66@hisilicon.com>
 <5c10cfb8-6312-316a-3226-11a8a92b91be@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5c10cfb8-6312-316a-3226-11a8a92b91be@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: chenxiang <chenxiang66@hisilicon.com>, qemu-devel@nongnu.org,
 linuxarm@huawei.com, eric.auger@redhat.com, pbonzini@redhat.com,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 19, 2022 at 12:14:53PM +0200, David Hildenbrand wrote:
> On 16.04.22 10:34, chenxiang via wrote:
> > From: Xiang Chen <chenxiang66@hisilicon.com>
> > 
> > Currently memory_region_iommu_replay() does full page table walk with
> > fixed granularity (page size) no matter translate() succeeds or not.
> > Actually if translate() successfully, we can skip translation size
> > (iotlb.addr_mask + 1) instead of fixed granularity.
> > 
> >  Signed-off-by: Xiang Chen <chenxiang66@hisilicon.com>
> > ---
> >  softmmu/memory.c | 7 +++++--
> >  1 file changed, 5 insertions(+), 2 deletions(-)
> > 
> > diff --git a/softmmu/memory.c b/softmmu/memory.c
> > index bfa5d5178c..ccfa19cf71 100644
> > --- a/softmmu/memory.c
> > +++ b/softmmu/memory.c
> > @@ -1924,7 +1924,7 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
> >  {
> >      MemoryRegion *mr = MEMORY_REGION(iommu_mr);
> >      IOMMUMemoryRegionClass *imrc = IOMMU_MEMORY_REGION_GET_CLASS(iommu_mr);
> > -    hwaddr addr, granularity;
> > +    hwaddr addr, granularity, def_granu;
> >      IOMMUTLBEntry iotlb;
> >  
> >      /* If the IOMMU has its own replay callback, override */
> > @@ -1933,12 +1933,15 @@ void memory_region_iommu_replay(IOMMUMemoryRegion *iommu_mr, IOMMUNotifier *n)
> >          return;
> >      }
> >  
> > -    granularity = memory_region_iommu_get_min_page_size(iommu_mr);
> > +    def_granu = memory_region_iommu_get_min_page_size(iommu_mr);
> 
> "granu" sounds weird. I'd suggest calling this "min_granularity".
> 
> >  
> >      for (addr = 0; addr < memory_region_size(mr); addr += granularity) {
> >          iotlb = imrc->translate(iommu_mr, addr, IOMMU_NONE, n->iommu_idx);
> >          if (iotlb.perm != IOMMU_NONE) {
> >              n->notify(n, &iotlb);
> > +            granularity = iotlb.addr_mask + 1;
> > +        } else {
> > +            granularity = def_granu;
> >          }
> 
> I do wonder if there are cases where we would actually have to round up
> the addr instead of simply adding the granularity if we suddenly use
> bigger steps then the min granularity.
> 
> i.e., there would be a difference between
> 
> addr += granularity
> 
> and
> 
> addr = QEMU_ALIGN_UP(addr + min_granularity, granularity);
> 
> I wonder if there are corner cases where translate() could fail on the
> first part of a granularity increment but succeed on the second part. My
> gut feeling is that it should be fine,

I'd make it a harder requirement, since afaik the translation should always
happen with one or multiple of min page size, so logically that's:

  granularity = iotlb.addr_mask + 1;
  assert(QEMU_IS_ALIGNED(granularity, def_granu));

Chenxiang, could you introduce more context of this change?  In what case
you found it slow and how this speeds things up?

Obviously this is not for x86 because x86 doesn't even run this code path.

Then I'm curious in what scenario would this be helpful, and whether it
would always help.  Say, the IOMMU_NONE cases are not being covered by this
speedup, and if there're a bunch of IOMMU_NONE mappings under this region,
it'll still be low, isn't it?

Thanks,

-- 
Peter Xu


