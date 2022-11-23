Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 917EB634F84
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 06:29:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxiIC-00055q-4C; Wed, 23 Nov 2022 00:27:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oxiI9-00055f-V3
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 00:27:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oxiHu-0001xN-JR
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 00:27:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669181229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=848GykgbtCggiJzpfcAaSGJePD6DMFq3zKVrpznx/e4=;
 b=MgKQ+8tps4MakvIWf8D+CsrGHgKZIeSIAjPzTr0cE4iNOlOIG2v/QhZaHRpwH+Wse4oCQx
 jRRedm/To0sxeenJ6vCPUR7cgc0zauVM5QkGj8LvwGJOG9gMAk8gHWJQzYKezKbETpQKF9
 ElFBhN/OQawsDMfZP3+W8e2cPFEHwDA=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-646-D8bCoUmUNc2O4vJHRM4pXw-1; Wed, 23 Nov 2022 00:27:07 -0500
X-MC-Unique: D8bCoUmUNc2O4vJHRM4pXw-1
Received: by mail-oi1-f200.google.com with SMTP id
 b22-20020aca1b16000000b0035b0971d693so6185537oib.14
 for <qemu-devel@nongnu.org>; Tue, 22 Nov 2022 21:27:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=848GykgbtCggiJzpfcAaSGJePD6DMFq3zKVrpznx/e4=;
 b=FUo2B0KcQLt9IEZNwMZ2H4mQBT9v5cHo/9XpIxspPhg8w5TsQW+jXJ4LkqkN8OH5rW
 ZoLKQD6K/v44Km0x1CwSvSBCwqApf0aFSiKWFozP8zDoKuslbn1Szsni5ua1S9awjYrN
 +YyrPQkVE8YzMkXAlRrAc1QtSGlans+Q3bzfTFPd+m5T+7qDeSxiLZPnZYNZtSA1njxx
 WNLA0lwkQlikD5nMB3xEx+Uive7jiH06VhWiNIx0WwQ/9flFvWVGks5HcgASw2lxof+w
 k5crxVVTBMXkWko0vPqvCGzmNnn33AaXeC7XYHCr7bVfXObp7q/uyk57OmKgC3esRKiv
 VVxA==
X-Gm-Message-State: ANoB5pl8IEUY7d2WRCevl/XYQRNS6D/5Z1t6wa9NDB/3IAOzUEiTkhLf
 IDbktVnx9MMK4J9Mh3H+r2IsCwTUw7TBxk54dpeACy5Y3b8KWDzv2mW+Om7XIyPRt1ysXn3HsCg
 +GwZx6gZPFIVMIDVh7UvGqu8cRwkTQhc=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr5026733oab.35.1669181227061; 
 Tue, 22 Nov 2022 21:27:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7Muw56Bg/1whcriur6KQUmrYlvLlxSNfbhOkhhleUrdZPsRpGZXQVn182McOgK6ffHwlFPSGEKPv5S6DkluMA=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr5026731oab.35.1669181226801; Tue, 22
 Nov 2022 21:27:06 -0800 (PST)
MIME-Version: 1.0
References: <20221122030111.4230-1-jasowang@redhat.com>
 <20221122035846-mutt-send-email-mst@kernel.org>
 <f139faff-a9fd-2d3a-842b-2efc371e586e@redhat.com>
In-Reply-To: <f139faff-a9fd-2d3a-842b-2efc371e586e@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 23 Nov 2022 13:26:55 +0800
Message-ID: <CACGkMEt+amD5S-NVxv8iPrs+xj74mdrnSjKOLX9TfgbdObHcfA@mail.gmail.com>
Subject: Re: [PATCH for 7.2?] vhost: fix vq dirt bitmap syncing when vIOMMU is
 enabled
To: eric.auger@redhat.com
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, 
 Yalan Zhang <yalzhang@redhat.com>, Lei Yang <leiyang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Nov 23, 2022 at 12:28 AM Eric Auger <eric.auger@redhat.com> wrote:
>
> Hi,
>
> On 11/22/22 10:43, Michael S. Tsirkin wrote:
> > On Tue, Nov 22, 2022 at 11:01:11AM +0800, Jason Wang wrote:
> >> When vIOMMU is enabled, the vq->used_phys is actually the IOVA not
> >> GPA. So we need to translate it to GPA before the syncing otherwise we
> >> may hit the following crash since IOVA could be out of the scope of
> >> the GPA log size. This could be noted when using virtio-IOMMU with
> >> vhost using 1G memory.
> > Noted how exactly? What does "using 1G memory" mean?
>
> We hit the following assertion:
>
> qemu-system-x86_64: ../hw/virtio/vhost.c:85: vhost_dev_sync_region: Assertion `end / VHOST_LOG_CHUNK < dev->log_size' failed.
>
> On the last time vhost_get_log_size() is called it takes into account 2 regions when computing the log_size:
> qemu-system-x86_64: vhost_get_log_size region 0 last=0x9ffff updated log_size=0x3
> qemu-system-x86_64: vhost_get_log_size region 1 last=0x3fffffff updated log_size=0x1000
> so in vhost_migration_log() vhost_get_log_size(dev) returns 0x1000
>
> In the test case, memory_region_sync_dirty_bitmap() gets called for mem-machine_mem, vga.vram (several times) and eventually on pc.bios. This latter is reponsible for the assertion:
>
> qemu-system-x86_64: vhost_log_sync calls sync_dirty_map on pc.bios for the full range
> qemu-system-x86_64: vhost_sync_dirty_bitmap calls vhost_dev_sync_region on region 0
> qemu-system-x86_64: vhost_dev_sync_region end=0x9ffff < start=0xfffc0000
> qemu-system-x86_64: vhost_sync_dirty_bitmap calls vhost_dev_sync_region on region 1
> qemu-system-x86_64: vhost_dev_sync_region end=0x3fffffff < start=0xfffc0000
> qemu-system-x86_64: vhost_sync_dirty_bitmap calls vhost_dev_sync_region on vq 0 <-----
> qemu-system-x86_64: vhost_dev_sync_region pc.bios mfirst=0xfffc0000 mlast=0xffffffff rfirst=0xfffff240 rlast=0xfffffa45
> qemu-system-x86_64: vhost_dev_sync_region pc.bios end=0xfffffa45 VHOST_LOG_CHUNK=0x40000 end/VHOST_LOG_CHUNK=0x3fff dev->log_size=0x1000
> qemu-system-x86_64: ../hw/virtio/vhost.c:85: vhost_dev_sync_region: Assertion `end / VHOST_LOG_CHUNK < dev->log_size' failed.
>
>
>
> "using 1G memory": We hit the issue with a guest started with 1GB initial RAM.

Yes, so in the case the guest iova allocator may try to use an IOVA
that is beyond 1G.

>
>
> >
> >> Fixes: c471ad0e9bd46 ("vhost_net: device IOTLB support")
> >> Cc: qemu-stable@nongnu.org
> >> Reported-by: Yalan Zhang <yalzhang@redhat.com>
> >> Tested-by: Eric Auger <eric.auger@redhat.com>
> >> Tested-by: Lei Yang <leiyang@redhat.com>
> >> Signed-off-by: Jason Wang <jasowang@redhat.com>
> >> ---
> >>  hw/virtio/vhost.c | 65 ++++++++++++++++++++++++++++++++---------------
> >>  1 file changed, 45 insertions(+), 20 deletions(-)
> >>
> >> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> >> index d1c4c20b8c..26b319f34e 100644
> >> --- a/hw/virtio/vhost.c
> >> +++ b/hw/virtio/vhost.c
> >> @@ -106,11 +106,30 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
> >>      }
> >>  }
> >>
> >> +static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> >> +{
> >> +    VirtIODevice *vdev = dev->vdev;
> >> +
> >> +    /*
> >> +     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> >> +     * incremental memory mapping API via IOTLB API. For platform that
> >> +     * does not have IOMMU, there's no need to enable this feature
> >> +     * which may cause unnecessary IOTLB miss/update transactions.
> >> +     */
> >> +    if (vdev) {
> >> +        return virtio_bus_device_iommu_enabled(vdev) &&
> >> +            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >> +    } else {
> >> +        return false;
> >> +    }
> >> +}
> >> +
> >>  static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
> >>                                     MemoryRegionSection *section,
> >>                                     hwaddr first,
> >>                                     hwaddr last)
> >>  {
> >> +    IOMMUTLBEntry iotlb;
> > why don't we move this inside the scope where it's used?

That's fine.

> >
> >>      int i;
> >>      hwaddr start_addr;
> >>      hwaddr end_addr;
> >> @@ -132,13 +151,37 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
> >>      }
> >>      for (i = 0; i < dev->nvqs; ++i) {
> >>          struct vhost_virtqueue *vq = dev->vqs + i;
> >> +        hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
> >> +        hwaddr phys, s;
> > these two, too.

Right.

> >
> >>
> >>          if (!vq->used_phys && !vq->used_size) {
> >>              continue;
> >>          }
> >>
> >> -        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
> >> -                              range_get_last(vq->used_phys, vq->used_size));
> >> +        if (vhost_dev_has_iommu(dev)) {
> >> +            while (used_size) {
> >> +                rcu_read_lock();
> >> +                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
> >> +                                                      used_phys,
> >> +                                                      true, MEMTXATTRS_UNSPECIFIED);
> >> +                rcu_read_unlock();
> >> +
> >> +                if (iotlb.target_as == NULL) {
> >> +                    return -EINVAL;
> > I am not sure how this can trigger. I don't like == NULL:
> > !iotlb.target_as is more succint. But a bigger question is how to
> > handle this. callers ignore the return value so maybe
> > log guest error? iommu seems misconfigured ...

Ok.

> >
> >
> >> +                }
> >> +
> >> +                phys = iotlb.translated_addr;
> >> +                s = MIN(iotlb.addr_mask + 1, used_size);
> > Note, that iotlb.translated_addr here is an aligned address and
> > iotlb.addr_mask + 1 is size from there.
> >
> > So I think phys that you want is actually
> >       phys = iotlb.translated_addr + (used_phys & iotlb.addr_mask);
> >
> >
> >
> > accordingly, the size would be from there until end of mask:
> >       s = MIN(iotlb.addr_mask + 1 - (used_phys & iotlb.addr_mask), used_size);
> >
> >
> > Also, it bothers me that the math here will give you 0 if addr_mask is
> > all ones. Then MIN will give 0 too and we loop forever.  I think this
> > can not trigger, but I'd rather we play it safe and add outside of MIN
> > after it's capped to a reasonable value. So we end up with:
> >
> >       /* Distance from start of used ring until last byte of IOMMU page */
> >       s = iotlb.addr_mask - (used_phys & iotlb.addr_mask);
> >       /* size of used ring, or of the part of it until end of IOMMU page */
> >       s = MIN(s, used_size - 1) + 1;
> >
> >

Right.

> >
> >
> >
> >> +
> >> +                vhost_dev_sync_region(dev, section, start_addr, end_addr, phys,
> >> +                                      range_get_last(phys, used_size));
> > why are you syncing used_size here? Shouldn't it be s?

Let me fix this.

Thanks

> >
> >
> >
> >> +                used_size -= s;
> >> +                used_phys += s;
> >> +            }
> >> +        } else {
> >> +            vhost_dev_sync_region(dev, section, start_addr, end_addr, used_phys,
> >> +                                  range_get_last(used_phys, used_size));
> >> +        }
> >>      }
> >>      return 0;
> >>  }
> >> @@ -306,24 +349,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
> >>      dev->log_size = size;
> >>  }
> >>
> >> -static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> >> -{
> >> -    VirtIODevice *vdev = dev->vdev;
> >> -
> >> -    /*
> >> -     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> >> -     * incremental memory mapping API via IOTLB API. For platform that
> >> -     * does not have IOMMU, there's no need to enable this feature
> >> -     * which may cause unnecessary IOTLB miss/update transactions.
> >> -     */
> >> -    if (vdev) {
> >> -        return virtio_bus_device_iommu_enabled(vdev) &&
> >> -            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> >> -    } else {
> >> -        return false;
> >> -    }
> >> -}
> >> -
> >>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
> >>                                hwaddr *plen, bool is_write)
> >>  {
> >> --
> >> 2.25.1
>
> Thanks
>
> Eric
>


