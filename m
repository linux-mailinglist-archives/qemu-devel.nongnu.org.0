Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D041663CF3E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 07:35:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Gfd-0005LZ-DP; Wed, 30 Nov 2022 01:34:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0Gfb-0005LR-O8
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:34:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p0GfZ-00066v-ON
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 01:34:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669790048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+Hw2IEQx9K/iF4Uz9AYZJVM7MO1s5cgLR2Vxhe2CclQ=;
 b=LV3Z72aWMotcQyWgQn/8S8/6fmJz+fsewUXy6R61XT5taY4DwvxBe82Va+QkZ0K09F5VGc
 AOX+kLlNuYdRN5rtXCkaeC16A2G+TIUcEWJe19UbMfLmFVQNTp2sQ8T/aohheYQtz2KPZO
 5SrIvD7qwl2L3CZA4ipkRUayUHn9lqQ=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-516-grcOnm9RP3-lvY1LePAEDg-1; Wed, 30 Nov 2022 01:34:03 -0500
X-MC-Unique: grcOnm9RP3-lvY1LePAEDg-1
Received: by mail-ot1-f69.google.com with SMTP id
 cp19-20020a056830661300b0066e6c22eb3cso96937otb.0
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 22:34:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+Hw2IEQx9K/iF4Uz9AYZJVM7MO1s5cgLR2Vxhe2CclQ=;
 b=aTI204CUCdWMf5vOBytLrZ25NPwaU9q1CvPAFeuxurZPi8z/kmZ9uu0Jw+gw/BZgBn
 s15N2amIUF9ScCiLo8PPWRnA0PXRcQcbQLSqsFUiMNd2VUs0ENvab0g+4zNWmOMUQ3uK
 uWjUnHr2ZMeryJmWjgp+wOKyjVEt6F1mhpc0qIhWZgq4vZD1fBjKv4rWu57YpRIDdZur
 hgqoXP01OBrCFVmN/grViTlozLkGlHzVEGFH37HXEWKxllUj2Jj6vaxcAe67il6ImfA7
 II5Nn/KCz6IOyT2Nuu2tcOAaY/OJmU42F0XPfzOfWt2y+axU5oIb7d/9r2tdMzNdpj1b
 HkZA==
X-Gm-Message-State: ANoB5pmkorXvS3FZVss13YHzxWOOLZ2raasAR9oiOKVW+SSZUFFNnC9U
 f+Prw/VmZMzwXuWKRA0MBvsrfSOcHXX3qhCAnihDDEXXkwKk6qSCmuXMiCDd99P5ZykeIxJhCz2
 z+OyCvhYNnPnv+tTPfcXMYCPxwylp4gs=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr22903676oab.35.1669790042927; 
 Tue, 29 Nov 2022 22:34:02 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7R/086HJx2QI2HyK0WSBSn0utIvZ5VK6ZMJICiPyUzFk2avDy/hcFGGqLXLYhV9FqMmuzdH3XD6j84irFbMTo=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr22903666oab.35.1669790042706; Tue, 29
 Nov 2022 22:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20221129081037.12099-1-jasowang@redhat.com>
 <20221129081037.12099-4-jasowang@redhat.com> <Y4Yr5WvfioOJWOEX@x1n>
In-Reply-To: <Y4Yr5WvfioOJWOEX@x1n>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Nov 2022 14:33:51 +0800
Message-ID: <CACGkMEuC41jFin3XAVSs3ra0tmxZD7L5NeDLn5OD6ziq7z1huA@mail.gmail.com>
Subject: Re: [PATCH 3/3] intel-iommu: build iova tree during IOMMU translation
To: Peter Xu <peterx@redhat.com>
Cc: mst@redhat.com, qemu-devel@nongnu.org, eric.auger@redhat.com, 
 viktor@daynix.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Tue, Nov 29, 2022 at 11:57 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Tue, Nov 29, 2022 at 04:10:37PM +0800, Jason Wang wrote:
> > The IOVA tree is only built during page walk this breaks the device
> > that tries to use UNMAP notifier only. One example is vhost-net, it
> > tries to use UNMAP notifier when vIOMMU doesn't support DEVIOTLB_UNMAP
> > notifier (e.g when dt mode is not enabled). The interesting part is
> > that it doesn't use MAP since it can query the IOMMU translation by
> > itself upon a IOTLB miss.
> >
> > This doesn't work since Qemu doesn't build IOVA tree in IOMMU
> > translation which means the UNMAP notifier won't be triggered during
> > the page walk since Qemu think it is never mapped. This could be
> > noticed when vIOMMU is used with vhost_net but dt is disabled.
> >
> > Fixing this by build the iova tree during IOMMU translation, this
> > makes sure the UNMAP notifier event could be identified during page
> > walk. And we need to walk page table not only for UNMAP notifier but
> > for MAP notifier during PSI.
> >
> > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > ---
> >  hw/i386/intel_iommu.c | 43 ++++++++++++++++++-------------------------
> >  1 file changed, 18 insertions(+), 25 deletions(-)
> >
> > diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
> > index d025ef2873..edeb62f4b2 100644
> > --- a/hw/i386/intel_iommu.c
> > +++ b/hw/i386/intel_iommu.c
> > @@ -1834,6 +1834,8 @@ static bool vtd_do_iommu_translate(VTDAddressSpace *vtd_as, PCIBus *bus,
> >      uint8_t access_flags;
> >      bool rid2pasid = (pasid == PCI_NO_PASID) && s->root_scalable;
> >      VTDIOTLBEntry *iotlb_entry;
> > +    const DMAMap *mapped;
> > +    DMAMap target;
> >
> >      /*
> >       * We have standalone memory region for interrupt addresses, we
> > @@ -1954,6 +1956,21 @@ out:
> >      entry->translated_addr = vtd_get_slpte_addr(slpte, s->aw_bits) & page_mask;
> >      entry->addr_mask = ~page_mask;
> >      entry->perm = access_flags;
> > +
> > +    target.iova = entry->iova;
> > +    target.size = entry->addr_mask;
> > +    target.translated_addr = entry->translated_addr;
> > +    target.perm = entry->perm;
> > +
> > +    mapped = iova_tree_find(vtd_as->iova_tree, &target);
> > +    if (!mapped) {
> > +        /* To make UNMAP notifier work, we need build iova tree here
> > +         * in order to have the UNMAP iommu notifier to be triggered
> > +         * during the page walk.
> > +         */
> > +        iova_tree_insert(vtd_as->iova_tree, &target);
> > +    }
> > +
> >      return true;
> >
> >  error:
> > @@ -2161,31 +2178,7 @@ static void vtd_iotlb_page_invalidate_notify(IntelIOMMUState *s,
> >          ret = vtd_dev_to_context_entry(s, pci_bus_num(vtd_as->bus),
> >                                         vtd_as->devfn, &ce);
> >          if (!ret && domain_id == vtd_get_domain_id(s, &ce, vtd_as->pasid)) {
> > -            if (vtd_as_has_map_notifier(vtd_as)) {
> > -                /*
> > -                 * As long as we have MAP notifications registered in
> > -                 * any of our IOMMU notifiers, we need to sync the
> > -                 * shadow page table.
> > -                 */
> > -                vtd_sync_shadow_page_table_range(vtd_as, &ce, addr, size);
> > -            } else {
> > -                /*
> > -                 * For UNMAP-only notifiers, we don't need to walk the
> > -                 * page tables.  We just deliver the PSI down to
> > -                 * invalidate caches.
> > -                 */
> > -                IOMMUTLBEvent event = {
> > -                    .type = IOMMU_NOTIFIER_UNMAP,
> > -                    .entry = {
> > -                        .target_as = &address_space_memory,
> > -                        .iova = addr,
> > -                        .translated_addr = 0,
> > -                        .addr_mask = size - 1,
> > -                        .perm = IOMMU_NONE,
> > -                    },
> > -                };
> > -                memory_region_notify_iommu(&vtd_as->iommu, 0, event);
>
> Isn't this path the one that will be responsible for pass-through the UNMAP
> events from guest to vhost when there's no MAP notifier requested?

Yes, but it doesn't do the iova tree removing. More below.

>
> At least that's what I expected when introducing the iova tree, because for
> unmap-only device hierachy I thought we didn't need the tree at all.

Then the problem is the UNMAP notifier won't be trigger at all during
DSI page walk in vtd_page_walk_one() because there's no DMAMap stored
in the iova tree.:

        if (!mapped) {
            /* Skip since we didn't map this range at all */
            trace_vtd_page_walk_one_skip_unmap(entry->iova, entry->addr_mask);
            return 0;
        }

So I choose to build the iova tree in translate then we won't go
within the above condition.

Thanks

>
> Jason, do you know where I miss?
>
> Thanks,
>
> > -            }
> > +            vtd_sync_shadow_page_table_range(vtd_as, &ce, addr, size);
> >          }
> >      }
> >  }
> > --
> > 2.25.1
> >
>
> --
> Peter Xu
>


