Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 324C2637168
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 05:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy3bQ-00009q-KY; Wed, 23 Nov 2022 23:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oy3bO-00009h-Kt
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 23:12:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oy3bL-0005U6-V5
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 23:12:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669263159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8pmAgxkJUs2kQMExO8hNGqANCSJqZFXUZ1CXAEgmq5Q=;
 b=WtlMOMv/RbvDG220Kh9ZfGHyucxs/XeOOVJUNnl3ysKC+ZAL4s1U71gcaLIIkDphsb/tUc
 WDWtFE+djMdCI9NkdI4EeHoehdiRpTESe9Iihsvd8eCf71Q0Hh5qY0oTatVO4JviiKfCOR
 jeVy2IkKQc18torHZjwuw3/30P22q7I=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-605-_5QwYi0fPaOiiHscvgIG2g-1; Wed, 23 Nov 2022 23:12:27 -0500
X-MC-Unique: _5QwYi0fPaOiiHscvgIG2g-1
Received: by mail-ot1-f69.google.com with SMTP id
 64-20020a9d0846000000b0066cba79be7aso185397oty.6
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 20:12:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8pmAgxkJUs2kQMExO8hNGqANCSJqZFXUZ1CXAEgmq5Q=;
 b=VZo09fs58IVC/75oVCO3xfRESisipvpVvaKNSSC0C7/QHnK8LAm26TOL3Wuq3AhV1O
 TydRX9lsbYpCPCvByOvIro7wHS7m4UfBeJHPxesoWMCORIauCvGOvOXd+MUKdgubel9p
 zxDhRniQUygTXV1EhEf/i+Z3hZnDPwjIhhd6aUGV3ZHjMIOa57D8lmPw9futQjkvgWY6
 8ER+YrH/JQqZir2gmGDEQ9didvuuLAMTZzfL50sHxUUQQemlQDZmxRbPXmJbLoJvSXq6
 EOxtK1mqaYJlT8q03WGtp0nsrq2qRliqsLxKVzQuUQYTgNEK9Z4hXZOjXwNVNHACm1pA
 I3vA==
X-Gm-Message-State: ANoB5pnZ6gCpT3zS+vkNGof4zt6sXvi+9z3U1tFC2aNFfaEc/Msprluz
 gQq7f6Ht70fPqWKQiwZAwYGdR2XWNarWuX9QLv/ew37BEL3wTMB8vuq36SQcjk7XSO66glzois+
 ksLiNMiiOWjeyS5BX3K6mSwA8rSSAQc4=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr7616439oab.35.1669263147091; 
 Wed, 23 Nov 2022 20:12:27 -0800 (PST)
X-Google-Smtp-Source: AA0mqf77XiRRZuDKuCJBVGZ6/F6yItDaMC33OzHYcVTUJZI4+AVMfnRlF8JKmj5SDnYY04SKxDDqPMgZPrlpHuHH9SA=
X-Received: by 2002:a05:6870:1e83:b0:132:7b3:29ac with SMTP id
 pb3-20020a0568701e8300b0013207b329acmr7616430oab.35.1669263146838; Wed, 23
 Nov 2022 20:12:26 -0800 (PST)
MIME-Version: 1.0
References: <20221122030111.4230-1-jasowang@redhat.com>
 <20221122035846-mutt-send-email-mst@kernel.org>
 <f139faff-a9fd-2d3a-842b-2efc371e586e@redhat.com>
 <CACGkMEt+amD5S-NVxv8iPrs+xj74mdrnSjKOLX9TfgbdObHcfA@mail.gmail.com>
 <CACGkMEuOMw5VVUG7=D-iSfv69TaMhFc+_e_BcQPi53xPVPhpow@mail.gmail.com>
 <20221123011406-mutt-send-email-mst@kernel.org>
 <CACGkMEseKR3RpKOzwSB3Rsss=4v1O0_E+yuNDgLjbAuvuhK7pw@mail.gmail.com>
 <20221123021926-mutt-send-email-mst@kernel.org>
In-Reply-To: <20221123021926-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Thu, 24 Nov 2022 12:12:15 +0800
Message-ID: <CACGkMEsA=gLX8PZSQr91J=-nKr5OL=a4h5NSnJVRdRhvU9V+Ww@mail.gmail.com>
Subject: Re: [PATCH for 7.2?] vhost: fix vq dirt bitmap syncing when vIOMMU is
 enabled
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: eric.auger@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org, 
 Yalan Zhang <yalzhang@redhat.com>, Lei Yang <leiyang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Wed, Nov 23, 2022 at 3:21 PM Michael S. Tsirkin <mst@redhat.com> wrote:
>
> On Wed, Nov 23, 2022 at 03:08:25PM +0800, Jason Wang wrote:
> > On Wed, Nov 23, 2022 at 2:15 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > >
> > > On Wed, Nov 23, 2022 at 01:47:04PM +0800, Jason Wang wrote:
> > > > On Wed, Nov 23, 2022 at 1:26 PM Jason Wang <jasowang@redhat.com> wrote:
> > > > >
> > > > > On Wed, Nov 23, 2022 at 12:28 AM Eric Auger <eric.auger@redhat.com> wrote:
> > > > > >
> > > > > > Hi,
> > > > > >
> > > > > > On 11/22/22 10:43, Michael S. Tsirkin wrote:
> > > > > > > On Tue, Nov 22, 2022 at 11:01:11AM +0800, Jason Wang wrote:
> > > > > > >> When vIOMMU is enabled, the vq->used_phys is actually the IOVA not
> > > > > > >> GPA. So we need to translate it to GPA before the syncing otherwise we
> > > > > > >> may hit the following crash since IOVA could be out of the scope of
> > > > > > >> the GPA log size. This could be noted when using virtio-IOMMU with
> > > > > > >> vhost using 1G memory.
> > > > > > > Noted how exactly? What does "using 1G memory" mean?
> > > > > >
> > > > > > We hit the following assertion:
> > > > > >
> > > > > > qemu-system-x86_64: ../hw/virtio/vhost.c:85: vhost_dev_sync_region: Assertion `end / VHOST_LOG_CHUNK < dev->log_size' failed.
> > > > > >
> > > > > > On the last time vhost_get_log_size() is called it takes into account 2 regions when computing the log_size:
> > > > > > qemu-system-x86_64: vhost_get_log_size region 0 last=0x9ffff updated log_size=0x3
> > > > > > qemu-system-x86_64: vhost_get_log_size region 1 last=0x3fffffff updated log_size=0x1000
> > > > > > so in vhost_migration_log() vhost_get_log_size(dev) returns 0x1000
> > > > > >
> > > > > > In the test case, memory_region_sync_dirty_bitmap() gets called for mem-machine_mem, vga.vram (several times) and eventually on pc.bios. This latter is reponsible for the assertion:
> > > > > >
> > > > > > qemu-system-x86_64: vhost_log_sync calls sync_dirty_map on pc.bios for the full range
> > > > > > qemu-system-x86_64: vhost_sync_dirty_bitmap calls vhost_dev_sync_region on region 0
> > > > > > qemu-system-x86_64: vhost_dev_sync_region end=0x9ffff < start=0xfffc0000
> > > > > > qemu-system-x86_64: vhost_sync_dirty_bitmap calls vhost_dev_sync_region on region 1
> > > > > > qemu-system-x86_64: vhost_dev_sync_region end=0x3fffffff < start=0xfffc0000
> > > > > > qemu-system-x86_64: vhost_sync_dirty_bitmap calls vhost_dev_sync_region on vq 0 <-----
> > > > > > qemu-system-x86_64: vhost_dev_sync_region pc.bios mfirst=0xfffc0000 mlast=0xffffffff rfirst=0xfffff240 rlast=0xfffffa45
> > > > > > qemu-system-x86_64: vhost_dev_sync_region pc.bios end=0xfffffa45 VHOST_LOG_CHUNK=0x40000 end/VHOST_LOG_CHUNK=0x3fff dev->log_size=0x1000
> > > > > > qemu-system-x86_64: ../hw/virtio/vhost.c:85: vhost_dev_sync_region: Assertion `end / VHOST_LOG_CHUNK < dev->log_size' failed.
> > > > > >
> > > > > >
> > > > > >
> > > > > > "using 1G memory": We hit the issue with a guest started with 1GB initial RAM.
> > > > >
> > > > > Yes, so in the case the guest iova allocator may try to use an IOVA
> > > > > that is beyond 1G.
> > > > >
> > > > > >
> > > > > >
> > > > > > >
> > > > > > >> Fixes: c471ad0e9bd46 ("vhost_net: device IOTLB support")
> > > > > > >> Cc: qemu-stable@nongnu.org
> > > > > > >> Reported-by: Yalan Zhang <yalzhang@redhat.com>
> > > > > > >> Tested-by: Eric Auger <eric.auger@redhat.com>
> > > > > > >> Tested-by: Lei Yang <leiyang@redhat.com>
> > > > > > >> Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > > >> ---
> > > > > > >>  hw/virtio/vhost.c | 65 ++++++++++++++++++++++++++++++++---------------
> > > > > > >>  1 file changed, 45 insertions(+), 20 deletions(-)
> > > > > > >>
> > > > > > >> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > > > > > >> index d1c4c20b8c..26b319f34e 100644
> > > > > > >> --- a/hw/virtio/vhost.c
> > > > > > >> +++ b/hw/virtio/vhost.c
> > > > > > >> @@ -106,11 +106,30 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
> > > > > > >>      }
> > > > > > >>  }
> > > > > > >>
> > > > > > >> +static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> > > > > > >> +{
> > > > > > >> +    VirtIODevice *vdev = dev->vdev;
> > > > > > >> +
> > > > > > >> +    /*
> > > > > > >> +     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> > > > > > >> +     * incremental memory mapping API via IOTLB API. For platform that
> > > > > > >> +     * does not have IOMMU, there's no need to enable this feature
> > > > > > >> +     * which may cause unnecessary IOTLB miss/update transactions.
> > > > > > >> +     */
> > > > > > >> +    if (vdev) {
> > > > > > >> +        return virtio_bus_device_iommu_enabled(vdev) &&
> > > > > > >> +            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > > > > > >> +    } else {
> > > > > > >> +        return false;
> > > > > > >> +    }
> > > > > > >> +}
> > > > > > >> +
> > > > > > >>  static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
> > > > > > >>                                     MemoryRegionSection *section,
> > > > > > >>                                     hwaddr first,
> > > > > > >>                                     hwaddr last)
> > > > > > >>  {
> > > > > > >> +    IOMMUTLBEntry iotlb;
> > > > > > > why don't we move this inside the scope where it's used?
> > > > >
> > > > > That's fine.
> > > > >
> > > > > > >
> > > > > > >>      int i;
> > > > > > >>      hwaddr start_addr;
> > > > > > >>      hwaddr end_addr;
> > > > > > >> @@ -132,13 +151,37 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
> > > > > > >>      }
> > > > > > >>      for (i = 0; i < dev->nvqs; ++i) {
> > > > > > >>          struct vhost_virtqueue *vq = dev->vqs + i;
> > > > > > >> +        hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
> > > > > > >> +        hwaddr phys, s;
> > > > > > > these two, too.
> > > > >
> > > > > Right.
> > > > >
> > > > > > >
> > > > > > >>
> > > > > > >>          if (!vq->used_phys && !vq->used_size) {
> > > > > > >>              continue;
> > > > > > >>          }
> > > > > > >>
> > > > > > >> -        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
> > > > > > >> -                              range_get_last(vq->used_phys, vq->used_size));
> > > > > > >> +        if (vhost_dev_has_iommu(dev)) {
> > > > > > >> +            while (used_size) {
> > > > > > >> +                rcu_read_lock();
> > > > > > >> +                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
> > > > > > >> +                                                      used_phys,
> > > > > > >> +                                                      true, MEMTXATTRS_UNSPECIFIED);
> > > > > > >> +                rcu_read_unlock();
> > > > > > >> +
> > > > > > >> +                if (iotlb.target_as == NULL) {
> > > > > > >> +                    return -EINVAL;
> > > > > > > I am not sure how this can trigger. I don't like == NULL:
> > > > > > > !iotlb.target_as is more succint. But a bigger question is how to
> > > > > > > handle this. callers ignore the return value so maybe
> > > > > > > log guest error? iommu seems misconfigured ...
> > > > >
> > > > > Ok.
> > > > >
> > > > > > >
> > > > > > >
> > > > > > >> +                }
> > > > > > >> +
> > > > > > >> +                phys = iotlb.translated_addr;
> > > > > > >> +                s = MIN(iotlb.addr_mask + 1, used_size);
> > > > > > > Note, that iotlb.translated_addr here is an aligned address and
> > > > > > > iotlb.addr_mask + 1 is size from there.
> > > > > > >
> > > > > > > So I think phys that you want is actually
> > > > > > >       phys = iotlb.translated_addr + (used_phys & iotlb.addr_mask);
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > accordingly, the size would be from there until end of mask:
> > > > > > >       s = MIN(iotlb.addr_mask + 1 - (used_phys & iotlb.addr_mask), used_size);
> > > > > > >
> > > > > > >
> > > > > > > Also, it bothers me that the math here will give you 0 if addr_mask is
> > > > > > > all ones.
> > > >
> > > > So even if addr_mask is all ones, we end up with s = MIN(1, used_size)
> > > > which should be fine.
> > >
> > > How do you figure? addr_mask is all ones, addr_mask + 1 is 0, we get MIN(0, used_size).
> >
> > But we have a substration after that.
>
>
> I don't get it. This is your code:
>                s = MIN(iotlb.addr_mask + 1, used_size);
>
> if addr_mask is all ones s becomes 0. Then while loop will loop forever.

Ok, I think there's some misunderstanding here. I meant using:

s = MIN(iotlb.addr_mask + 1 - (used_phys & iotlb.addr_mask), used_size);

Won't result in a zero for s. So there's no need to move the plus one
outside the MIN.

Thanks

>
> > In order to get a zero result,
> > used_phys must be zero then used_phys & iotlb.addr_mask can be zero,
> > or anything I missed here?
> >
> > The 1 is calculated via assuming used_phys are all ones.
> >
> > Thanks
>
> Not used_phys, I'm talking about addr_mask being all ones.
>
>
> >
> > >
> > > > The used_size has been validated before to be
> > > > non-zero.
> > > >
> > > > Thanks
> > > >
> > > > > Then MIN will give 0 too and we loop forever.  I think this
> > > > > > > can not trigger, but I'd rather we play it safe and add outside of MIN
> > > > > > > after it's capped to a reasonable value. So we end up with:
> > > > > > >
> > > > > > >       /* Distance from start of used ring until last byte of IOMMU page */
> > > > > > >       s = iotlb.addr_mask - (used_phys & iotlb.addr_mask);
> > > > > > >       /* size of used ring, or of the part of it until end of IOMMU page */
> > > > > > >       s = MIN(s, used_size - 1) + 1;
> > > > > > >
> > > > > > >
> > > > >
> > > > > Right.
> > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >> +
> > > > > > >> +                vhost_dev_sync_region(dev, section, start_addr, end_addr, phys,
> > > > > > >> +                                      range_get_last(phys, used_size));
> > > > > > > why are you syncing used_size here? Shouldn't it be s?
> > > > >
> > > > > Let me fix this.
> > > > >
> > > > > Thanks
> > > > >
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > >> +                used_size -= s;
> > > > > > >> +                used_phys += s;
> > > > > > >> +            }
> > > > > > >> +        } else {
> > > > > > >> +            vhost_dev_sync_region(dev, section, start_addr, end_addr, used_phys,
> > > > > > >> +                                  range_get_last(used_phys, used_size));
> > > > > > >> +        }
> > > > > > >>      }
> > > > > > >>      return 0;
> > > > > > >>  }
> > > > > > >> @@ -306,24 +349,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
> > > > > > >>      dev->log_size = size;
> > > > > > >>  }
> > > > > > >>
> > > > > > >> -static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> > > > > > >> -{
> > > > > > >> -    VirtIODevice *vdev = dev->vdev;
> > > > > > >> -
> > > > > > >> -    /*
> > > > > > >> -     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> > > > > > >> -     * incremental memory mapping API via IOTLB API. For platform that
> > > > > > >> -     * does not have IOMMU, there's no need to enable this feature
> > > > > > >> -     * which may cause unnecessary IOTLB miss/update transactions.
> > > > > > >> -     */
> > > > > > >> -    if (vdev) {
> > > > > > >> -        return virtio_bus_device_iommu_enabled(vdev) &&
> > > > > > >> -            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > > > > > >> -    } else {
> > > > > > >> -        return false;
> > > > > > >> -    }
> > > > > > >> -}
> > > > > > >> -
> > > > > > >>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
> > > > > > >>                                hwaddr *plen, bool is_write)
> > > > > > >>  {
> > > > > > >> --
> > > > > > >> 2.25.1
> > > > > >
> > > > > > Thanks
> > > > > >
> > > > > > Eric
> > > > > >
> > >
>


