Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593936372FE
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 08:44:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oy6sS-00066e-4Y; Thu, 24 Nov 2022 02:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oy6s1-0005yy-NK
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:42:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oy6rq-0002Sv-TI
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 02:42:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669275709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ll0SiOr84AbedIhHptZjLr4zbrf+Zow/pqU+atlnmvE=;
 b=af9AWY7DoMcHQ8tw3mG9Bz6lAezjWhQTzdKQ7fEnNfXtpyGyHKOUI0d0eaR+TrQS5qWAJz
 Jesphi/QSdxhOJeyVQa9YeXAcEzAntruG/rx4sXyu+ch+OT3Pe6+kowH89RkC4D1ShJ4MY
 sqlJjIE2ZJcbtzHlPMUfrIIdMKUPATs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-20-er28nRAvOu2pzd69W7vYsg-1; Thu, 24 Nov 2022 02:41:45 -0500
X-MC-Unique: er28nRAvOu2pzd69W7vYsg-1
Received: by mail-wm1-f71.google.com with SMTP id
 e8-20020a05600c218800b003cf634f5280so316897wme.8
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 23:41:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ll0SiOr84AbedIhHptZjLr4zbrf+Zow/pqU+atlnmvE=;
 b=PKW0V5HNASNJgSSlaJ38BELslLn1uihGZcyOtL2k5xJI8N89mJLHkiNy6WqQL68AAE
 hFBgNwqIFm3rzbKIResa7AYgHgCfIW1yEA8e40RP4croZFq3oPyskwBmFLOjSLh0Ajnt
 JSGY2zCU+s6pzOg2Dd2iE1BHcp2aIV/BDWtR2BsvVERfrVGaeoL22nTrsndMeHRL0XFE
 1+6RQ10Taj+6chxETjxdTpVpn0EaeIHUqcGcz+E78LX/2Ak41CVof/kl4uMyBm23ryzE
 FflPzn/LgG8eonMsQulAIPugGmQ+y30O92slOPFmxvF2D1+kw4JFaLNmOWLOaT0MFSTn
 CE+Q==
X-Gm-Message-State: ANoB5pngRSbIppJVLUzzDzn3gk5xf+XShwGk5sPUm1qgFA/0Ibd0aUJ1
 ZWW5XNEn+2oj5pgLhu9PORglGYwRrbt09sTlZdyHfXCzRG151tV7E52AQyemKfwc2S+lMc7N1Uj
 j0HhUTlR/0RluzPQ=
X-Received: by 2002:a05:600c:1f1b:b0:3cf:35c8:289f with SMTP id
 bd27-20020a05600c1f1b00b003cf35c8289fmr13938152wmb.153.1669275704135; 
 Wed, 23 Nov 2022 23:41:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7gRQXEm3sdDHBkcK8odKqdHCLWgXsf3UaoF7ch2s/C9cQ+GF+s/rb0AbjzaZ3T0+dNJwwUFg==
X-Received: by 2002:a05:600c:1f1b:b0:3cf:35c8:289f with SMTP id
 bd27-20020a05600c1f1b00b003cf35c8289fmr13938128wmb.153.1669275703677; 
 Wed, 23 Nov 2022 23:41:43 -0800 (PST)
Received: from redhat.com ([2.52.16.74]) by smtp.gmail.com with ESMTPSA id
 b10-20020adfee8a000000b00241dec4ad16sm540277wro.96.2022.11.23.23.41.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Nov 2022 23:41:43 -0800 (PST)
Date: Thu, 24 Nov 2022 02:41:40 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: eric.auger@redhat.com, qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Yalan Zhang <yalzhang@redhat.com>, Lei Yang <leiyang@redhat.com>
Subject: Re: [PATCH for 7.2?] vhost: fix vq dirt bitmap syncing when vIOMMU
 is enabled
Message-ID: <20221124023701-mutt-send-email-mst@kernel.org>
References: <20221122035846-mutt-send-email-mst@kernel.org>
 <f139faff-a9fd-2d3a-842b-2efc371e586e@redhat.com>
 <CACGkMEt+amD5S-NVxv8iPrs+xj74mdrnSjKOLX9TfgbdObHcfA@mail.gmail.com>
 <CACGkMEuOMw5VVUG7=D-iSfv69TaMhFc+_e_BcQPi53xPVPhpow@mail.gmail.com>
 <20221123011406-mutt-send-email-mst@kernel.org>
 <CACGkMEseKR3RpKOzwSB3Rsss=4v1O0_E+yuNDgLjbAuvuhK7pw@mail.gmail.com>
 <20221123021926-mutt-send-email-mst@kernel.org>
 <CACGkMEsA=gLX8PZSQr91J=-nKr5OL=a4h5NSnJVRdRhvU9V+Ww@mail.gmail.com>
 <20221124020000-mutt-send-email-mst@kernel.org>
 <CACGkMEu_E9h4tLpaepWZsdxsxvK9urVzW3G3is9VZxvRicV3xw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEu_E9h4tLpaepWZsdxsxvK9urVzW3G3is9VZxvRicV3xw@mail.gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

On Thu, Nov 24, 2022 at 03:31:59PM +0800, Jason Wang wrote:
> On Thu, Nov 24, 2022 at 3:06 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Thu, Nov 24, 2022 at 12:12:15PM +0800, Jason Wang wrote:
> > > On Wed, Nov 23, 2022 at 3:21 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > >
> > > > On Wed, Nov 23, 2022 at 03:08:25PM +0800, Jason Wang wrote:
> > > > > On Wed, Nov 23, 2022 at 2:15 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Wed, Nov 23, 2022 at 01:47:04PM +0800, Jason Wang wrote:
> > > > > > > On Wed, Nov 23, 2022 at 1:26 PM Jason Wang <jasowang@redhat.com> wrote:
> > > > > > > >
> > > > > > > > On Wed, Nov 23, 2022 at 12:28 AM Eric Auger <eric.auger@redhat.com> wrote:
> > > > > > > > >
> > > > > > > > > Hi,
> > > > > > > > >
> > > > > > > > > On 11/22/22 10:43, Michael S. Tsirkin wrote:
> > > > > > > > > > On Tue, Nov 22, 2022 at 11:01:11AM +0800, Jason Wang wrote:
> > > > > > > > > >> When vIOMMU is enabled, the vq->used_phys is actually the IOVA not
> > > > > > > > > >> GPA. So we need to translate it to GPA before the syncing otherwise we
> > > > > > > > > >> may hit the following crash since IOVA could be out of the scope of
> > > > > > > > > >> the GPA log size. This could be noted when using virtio-IOMMU with
> > > > > > > > > >> vhost using 1G memory.
> > > > > > > > > > Noted how exactly? What does "using 1G memory" mean?
> > > > > > > > >
> > > > > > > > > We hit the following assertion:
> > > > > > > > >
> > > > > > > > > qemu-system-x86_64: ../hw/virtio/vhost.c:85: vhost_dev_sync_region: Assertion `end / VHOST_LOG_CHUNK < dev->log_size' failed.
> > > > > > > > >
> > > > > > > > > On the last time vhost_get_log_size() is called it takes into account 2 regions when computing the log_size:
> > > > > > > > > qemu-system-x86_64: vhost_get_log_size region 0 last=0x9ffff updated log_size=0x3
> > > > > > > > > qemu-system-x86_64: vhost_get_log_size region 1 last=0x3fffffff updated log_size=0x1000
> > > > > > > > > so in vhost_migration_log() vhost_get_log_size(dev) returns 0x1000
> > > > > > > > >
> > > > > > > > > In the test case, memory_region_sync_dirty_bitmap() gets called for mem-machine_mem, vga.vram (several times) and eventually on pc.bios. This latter is reponsible for the assertion:
> > > > > > > > >
> > > > > > > > > qemu-system-x86_64: vhost_log_sync calls sync_dirty_map on pc.bios for the full range
> > > > > > > > > qemu-system-x86_64: vhost_sync_dirty_bitmap calls vhost_dev_sync_region on region 0
> > > > > > > > > qemu-system-x86_64: vhost_dev_sync_region end=0x9ffff < start=0xfffc0000
> > > > > > > > > qemu-system-x86_64: vhost_sync_dirty_bitmap calls vhost_dev_sync_region on region 1
> > > > > > > > > qemu-system-x86_64: vhost_dev_sync_region end=0x3fffffff < start=0xfffc0000
> > > > > > > > > qemu-system-x86_64: vhost_sync_dirty_bitmap calls vhost_dev_sync_region on vq 0 <-----
> > > > > > > > > qemu-system-x86_64: vhost_dev_sync_region pc.bios mfirst=0xfffc0000 mlast=0xffffffff rfirst=0xfffff240 rlast=0xfffffa45
> > > > > > > > > qemu-system-x86_64: vhost_dev_sync_region pc.bios end=0xfffffa45 VHOST_LOG_CHUNK=0x40000 end/VHOST_LOG_CHUNK=0x3fff dev->log_size=0x1000
> > > > > > > > > qemu-system-x86_64: ../hw/virtio/vhost.c:85: vhost_dev_sync_region: Assertion `end / VHOST_LOG_CHUNK < dev->log_size' failed.
> > > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > "using 1G memory": We hit the issue with a guest started with 1GB initial RAM.
> > > > > > > >
> > > > > > > > Yes, so in the case the guest iova allocator may try to use an IOVA
> > > > > > > > that is beyond 1G.
> > > > > > > >
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >> Fixes: c471ad0e9bd46 ("vhost_net: device IOTLB support")
> > > > > > > > > >> Cc: qemu-stable@nongnu.org
> > > > > > > > > >> Reported-by: Yalan Zhang <yalzhang@redhat.com>
> > > > > > > > > >> Tested-by: Eric Auger <eric.auger@redhat.com>
> > > > > > > > > >> Tested-by: Lei Yang <leiyang@redhat.com>
> > > > > > > > > >> Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > > > > > > > >> ---
> > > > > > > > > >>  hw/virtio/vhost.c | 65 ++++++++++++++++++++++++++++++++---------------
> > > > > > > > > >>  1 file changed, 45 insertions(+), 20 deletions(-)
> > > > > > > > > >>
> > > > > > > > > >> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> > > > > > > > > >> index d1c4c20b8c..26b319f34e 100644
> > > > > > > > > >> --- a/hw/virtio/vhost.c
> > > > > > > > > >> +++ b/hw/virtio/vhost.c
> > > > > > > > > >> @@ -106,11 +106,30 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
> > > > > > > > > >>      }
> > > > > > > > > >>  }
> > > > > > > > > >>
> > > > > > > > > >> +static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> > > > > > > > > >> +{
> > > > > > > > > >> +    VirtIODevice *vdev = dev->vdev;
> > > > > > > > > >> +
> > > > > > > > > >> +    /*
> > > > > > > > > >> +     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> > > > > > > > > >> +     * incremental memory mapping API via IOTLB API. For platform that
> > > > > > > > > >> +     * does not have IOMMU, there's no need to enable this feature
> > > > > > > > > >> +     * which may cause unnecessary IOTLB miss/update transactions.
> > > > > > > > > >> +     */
> > > > > > > > > >> +    if (vdev) {
> > > > > > > > > >> +        return virtio_bus_device_iommu_enabled(vdev) &&
> > > > > > > > > >> +            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > > > > > > > > >> +    } else {
> > > > > > > > > >> +        return false;
> > > > > > > > > >> +    }
> > > > > > > > > >> +}
> > > > > > > > > >> +
> > > > > > > > > >>  static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
> > > > > > > > > >>                                     MemoryRegionSection *section,
> > > > > > > > > >>                                     hwaddr first,
> > > > > > > > > >>                                     hwaddr last)
> > > > > > > > > >>  {
> > > > > > > > > >> +    IOMMUTLBEntry iotlb;
> > > > > > > > > > why don't we move this inside the scope where it's used?
> > > > > > > >
> > > > > > > > That's fine.
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > >>      int i;
> > > > > > > > > >>      hwaddr start_addr;
> > > > > > > > > >>      hwaddr end_addr;
> > > > > > > > > >> @@ -132,13 +151,37 @@ static int vhost_sync_dirty_bitmap(struct vhost_dev *dev,
> > > > > > > > > >>      }
> > > > > > > > > >>      for (i = 0; i < dev->nvqs; ++i) {
> > > > > > > > > >>          struct vhost_virtqueue *vq = dev->vqs + i;
> > > > > > > > > >> +        hwaddr used_phys = vq->used_phys, used_size = vq->used_size;
> > > > > > > > > >> +        hwaddr phys, s;
> > > > > > > > > > these two, too.
> > > > > > > >
> > > > > > > > Right.
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > >>
> > > > > > > > > >>          if (!vq->used_phys && !vq->used_size) {
> > > > > > > > > >>              continue;
> > > > > > > > > >>          }
> > > > > > > > > >>
> > > > > > > > > >> -        vhost_dev_sync_region(dev, section, start_addr, end_addr, vq->used_phys,
> > > > > > > > > >> -                              range_get_last(vq->used_phys, vq->used_size));
> > > > > > > > > >> +        if (vhost_dev_has_iommu(dev)) {
> > > > > > > > > >> +            while (used_size) {
> > > > > > > > > >> +                rcu_read_lock();
> > > > > > > > > >> +                iotlb = address_space_get_iotlb_entry(dev->vdev->dma_as,
> > > > > > > > > >> +                                                      used_phys,
> > > > > > > > > >> +                                                      true, MEMTXATTRS_UNSPECIFIED);
> > > > > > > > > >> +                rcu_read_unlock();
> > > > > > > > > >> +
> > > > > > > > > >> +                if (iotlb.target_as == NULL) {
> > > > > > > > > >> +                    return -EINVAL;
> > > > > > > > > > I am not sure how this can trigger. I don't like == NULL:
> > > > > > > > > > !iotlb.target_as is more succint. But a bigger question is how to
> > > > > > > > > > handle this. callers ignore the return value so maybe
> > > > > > > > > > log guest error? iommu seems misconfigured ...
> > > > > > > >
> > > > > > > > Ok.
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >> +                }
> > > > > > > > > >> +
> > > > > > > > > >> +                phys = iotlb.translated_addr;
> > > > > > > > > >> +                s = MIN(iotlb.addr_mask + 1, used_size);
> > > > > > > > > > Note, that iotlb.translated_addr here is an aligned address and
> > > > > > > > > > iotlb.addr_mask + 1 is size from there.
> > > > > > > > > >
> > > > > > > > > > So I think phys that you want is actually
> > > > > > > > > >       phys = iotlb.translated_addr + (used_phys & iotlb.addr_mask);
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > accordingly, the size would be from there until end of mask:
> > > > > > > > > >       s = MIN(iotlb.addr_mask + 1 - (used_phys & iotlb.addr_mask), used_size);
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > Also, it bothers me that the math here will give you 0 if addr_mask is
> > > > > > > > > > all ones.
> > > > > > >
> > > > > > > So even if addr_mask is all ones, we end up with s = MIN(1, used_size)
> > > > > > > which should be fine.
> > > > > >
> > > > > > How do you figure? addr_mask is all ones, addr_mask + 1 is 0, we get MIN(0, used_size).
> > > > >
> > > > > But we have a substration after that.
> > > >
> > > >
> > > > I don't get it. This is your code:
> > > >                s = MIN(iotlb.addr_mask + 1, used_size);
> > > >
> > > > if addr_mask is all ones s becomes 0. Then while loop will loop forever.
> > >
> > > Ok, I think there's some misunderstanding here. I meant using:
> > >
> > > s = MIN(iotlb.addr_mask + 1 - (used_phys & iotlb.addr_mask), used_size);
> > >
> > > Won't result in a zero for s.
> >
> > If used_phys is page aligned then I think it will.
> 
> So iotlb.addr_mask + 1 is zero, used_phys & iotlb.addr_mask is used_phys:
> 
> # cat t.c
> #include <stdio.h>
> 
> int main(void)
> {
> unsigned int mask = 0xFFFFFFFF;
> unsigned long long used_phys = 0x1000;
> unsigned long long s = mask + 1 - (used_phys & mask);
> 
> fprintf(stderr, "result is %llx\n", s);
> 
> return 0;
> }
> # gcc t.c
> # ./a.out
> result is fffffffffffff000

Oh I see. So it will only trigger if used_phys is 0.
Unlikely, but I'd prefer we don't rely on this, seems fragile.


> >
> > > So there's no need to move the plus one
> > > outside the MIN.
> > >
> > > Thanks
> >
> > I mean why don't you try?
> 
> There should be some misunderstanding. I fully understand the
> MIN(mask+1, used_size) case. My comments were for
> 
> MIN(iotlb.addr_mask + 1 - (used_phys & iotlb.addr_mask), used_size);
> 
> And used_phys can't be zero here.
> 
> Thanks

Right. IMHO + 1 outside is more robust.

> >
> > [mst@tuck ~]$ cat > a.c
> > #include <stdio.h>
> > #define  MIN(a,b) (a<b ? a : b)
> >
> > int main(int argc, char **argv)
> > {
> >    unsigned mask = 0xffffffff;
> >    unsigned s = MIN(mask + 1, 100);
> >    printf("s=0x%x\n",s);
> > }
> > [mst@tuck ~]$ gcc a.c
> > [mst@tuck ~]$ ./a.out
> > s=0x0
> > [mst@tuck ~]$
> >
> >
> >
> >
> >
> >
> > > >
> > > > > In order to get a zero result,
> > > > > used_phys must be zero then used_phys & iotlb.addr_mask can be zero,
> > > > > or anything I missed here?
> > > > >
> > > > > The 1 is calculated via assuming used_phys are all ones.
> > > > >
> > > > > Thanks
> > > >
> > > > Not used_phys, I'm talking about addr_mask being all ones.
> > > >
> > > >
> > > > >
> > > > > >
> > > > > > > The used_size has been validated before to be
> > > > > > > non-zero.
> > > > > > >
> > > > > > > Thanks
> > > > > > >
> > > > > > > > Then MIN will give 0 too and we loop forever.  I think this
> > > > > > > > > > can not trigger, but I'd rather we play it safe and add outside of MIN
> > > > > > > > > > after it's capped to a reasonable value. So we end up with:
> > > > > > > > > >
> > > > > > > > > >       /* Distance from start of used ring until last byte of IOMMU page */
> > > > > > > > > >       s = iotlb.addr_mask - (used_phys & iotlb.addr_mask);
> > > > > > > > > >       /* size of used ring, or of the part of it until end of IOMMU page */
> > > > > > > > > >       s = MIN(s, used_size - 1) + 1;
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > >
> > > > > > > > Right.
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >> +
> > > > > > > > > >> +                vhost_dev_sync_region(dev, section, start_addr, end_addr, phys,
> > > > > > > > > >> +                                      range_get_last(phys, used_size));
> > > > > > > > > > why are you syncing used_size here? Shouldn't it be s?
> > > > > > > >
> > > > > > > > Let me fix this.
> > > > > > > >
> > > > > > > > Thanks
> > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >
> > > > > > > > > >> +                used_size -= s;
> > > > > > > > > >> +                used_phys += s;
> > > > > > > > > >> +            }
> > > > > > > > > >> +        } else {
> > > > > > > > > >> +            vhost_dev_sync_region(dev, section, start_addr, end_addr, used_phys,
> > > > > > > > > >> +                                  range_get_last(used_phys, used_size));
> > > > > > > > > >> +        }
> > > > > > > > > >>      }
> > > > > > > > > >>      return 0;
> > > > > > > > > >>  }
> > > > > > > > > >> @@ -306,24 +349,6 @@ static inline void vhost_dev_log_resize(struct vhost_dev *dev, uint64_t size)
> > > > > > > > > >>      dev->log_size = size;
> > > > > > > > > >>  }
> > > > > > > > > >>
> > > > > > > > > >> -static bool vhost_dev_has_iommu(struct vhost_dev *dev)
> > > > > > > > > >> -{
> > > > > > > > > >> -    VirtIODevice *vdev = dev->vdev;
> > > > > > > > > >> -
> > > > > > > > > >> -    /*
> > > > > > > > > >> -     * For vhost, VIRTIO_F_IOMMU_PLATFORM means the backend support
> > > > > > > > > >> -     * incremental memory mapping API via IOTLB API. For platform that
> > > > > > > > > >> -     * does not have IOMMU, there's no need to enable this feature
> > > > > > > > > >> -     * which may cause unnecessary IOTLB miss/update transactions.
> > > > > > > > > >> -     */
> > > > > > > > > >> -    if (vdev) {
> > > > > > > > > >> -        return virtio_bus_device_iommu_enabled(vdev) &&
> > > > > > > > > >> -            virtio_host_has_feature(vdev, VIRTIO_F_IOMMU_PLATFORM);
> > > > > > > > > >> -    } else {
> > > > > > > > > >> -        return false;
> > > > > > > > > >> -    }
> > > > > > > > > >> -}
> > > > > > > > > >> -
> > > > > > > > > >>  static void *vhost_memory_map(struct vhost_dev *dev, hwaddr addr,
> > > > > > > > > >>                                hwaddr *plen, bool is_write)
> > > > > > > > > >>  {
> > > > > > > > > >> --
> > > > > > > > > >> 2.25.1
> > > > > > > > >
> > > > > > > > > Thanks
> > > > > > > > >
> > > > > > > > > Eric
> > > > > > > > >
> > > > > >
> > > >
> >


