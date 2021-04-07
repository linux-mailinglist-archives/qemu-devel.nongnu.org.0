Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8798D35673B
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 10:53:38 +0200 (CEST)
Received: from localhost ([::1]:35324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lU3wP-0003xp-K8
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 04:53:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lU3u0-000381-Kk
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 04:51:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lU3ty-0008VG-26
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 04:51:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617785464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I903UQZcC6mzYgGobXbRugjFXHq29ZXls1L9jyuwmPc=;
 b=VbDmZD3/oM10W8GRlW57gX34TWCe/5gM9ceKbO3YO+8dPZanDexQXPQKGDuzS6bMvItP6y
 3Pz6rxNnz5yhGRxBeq7oMVdr2Fyg2HIKyqYfZCctLhSSPfoZ7WrsPSjJzeRn3+JN4ZLc72
 EVU8pgPIxN1P0sItsv1+CUD4z9EyL90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-475-TXSkLaD6P-uhPMhgL8O0mw-1; Wed, 07 Apr 2021 04:51:02 -0400
X-MC-Unique: TXSkLaD6P-uhPMhgL8O0mw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97B3D8189DE;
 Wed,  7 Apr 2021 08:51:01 +0000 (UTC)
Received: from work-vm (ovpn-115-14.ams2.redhat.com [10.36.115.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4690B60854;
 Wed,  7 Apr 2021 08:50:53 +0000 (UTC)
Date: Wed, 7 Apr 2021 09:50:50 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH V2] virtio-pci: compat page aligned ATS
Message-ID: <YG1yam6UlqWosWvv@work-vm>
References: <20210406040330.11306-1-jasowang@redhat.com>
 <YGwsQXOiBZOG1S44@work-vm>
 <3537aa98-f6fc-bf99-cbc6-3c90f1387dc5@redhat.com>
MIME-Version: 1.0
In-Reply-To: <3537aa98-f6fc-bf99-cbc6-3c90f1387dc5@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org, ehabkost@redhat.com,
 peterx@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Jason Wang (jasowang@redhat.com) wrote:
> 
> 在 2021/4/6 下午5:39, Dr. David Alan Gilbert 写道:
> > * Jason Wang (jasowang@redhat.com) wrote:
> > > Commit 4c70875372b8 ("pci: advertise a page aligned ATS") advertises
> > > the page aligned via ATS capability (RO) to unbrek recent Linux IOMMU
> > > drivers since 5.2. But it forgot the compat the capability which
> > > breaks the migration from old machine type:
> > > 
> > > (qemu) qemu-kvm: get_pci_config_device: Bad config data: i=0x104 read:
> > > 0 device: 20 cmask: ff wmask: 0 w1cmask:0
> > > 
> > > This patch introduces a new parameter "x-ats-page-aligned" for
> > > virtio-pci device and turns it on for machine type which is newer than
> > > 5.1.
> > I don't know the IOMMU code, but from the property/hw_compat I think
> > this is OK.
> > It's a bit tricky; since this was broken in 5.2, changing the
> > hw_compat_5_1 means that there are exisitng 5.2 users who will be broken
> > - howeer, the original 4c70875372b8 patch was sent to qemu-stable
> > which I think means there are other versions that are inconsistent as
> > well.
> 
> 
> Good point. It's not an easy task, we need to choose to break migration or
> virtio with vIOMMU.
> 
> This patch chooes to do the latter, or is there any other better way to
> solve this?

Not that I can think of.

Dave

> Thanks
> 
> 
> > 
> > Dave
> > 
> > > Cc: Michael S. Tsirkin <mst@redhat.com>
> > > Cc: Peter Xu <peterx@redhat.com>
> > > Cc: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > > Cc: qemu-stable@nongnu.org
> > > Fixes: 4c70875372b8 ("pci: advertise a page aligned ATS")
> > > Signed-off-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > > Changes since V1:
> > > - switch to use "x-ats-page-aligned" instead
> > > ---
> > >   hw/core/machine.c      |  1 +
> > >   hw/pci/pcie.c          | 10 ++++++----
> > >   hw/virtio/virtio-pci.c |  5 ++++-
> > >   hw/virtio/virtio-pci.h |  5 +++++
> > >   include/hw/pci/pcie.h  |  2 +-
> > >   5 files changed, 17 insertions(+), 6 deletions(-)
> > > 
> > > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > > index 9935c6ddd5..a50f2d5f0a 100644
> > > --- a/hw/core/machine.c
> > > +++ b/hw/core/machine.c
> > > @@ -53,6 +53,7 @@ GlobalProperty hw_compat_5_1[] = {
> > >       { "nvme", "use-intel-id", "on"},
> > >       { "pvpanic", "events", "1"}, /* PVPANIC_PANICKED */
> > >       { "pl011", "migrate-clk", "off" },
> > > +    { "virtio-pci", "x-ats-page-aligned", "off"},
> > >   };
> > >   const size_t hw_compat_5_1_len = G_N_ELEMENTS(hw_compat_5_1);
> > > diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
> > > index a733e2fb87..fd0fa157e8 100644
> > > --- a/hw/pci/pcie.c
> > > +++ b/hw/pci/pcie.c
> > > @@ -963,16 +963,18 @@ void pcie_dev_ser_num_init(PCIDevice *dev, uint16_t offset, uint64_t ser_num)
> > >       pci_set_quad(dev->config + offset + pci_dsn_cap, ser_num);
> > >   }
> > > -void pcie_ats_init(PCIDevice *dev, uint16_t offset)
> > > +void pcie_ats_init(PCIDevice *dev, uint16_t offset, bool aligned)
> > >   {
> > >       pcie_add_capability(dev, PCI_EXT_CAP_ID_ATS, 0x1,
> > >                           offset, PCI_EXT_CAP_ATS_SIZEOF);
> > >       dev->exp.ats_cap = offset;
> > > -    /* Invalidate Queue Depth 0, Page Aligned Request 1 */
> > > -    pci_set_word(dev->config + offset + PCI_ATS_CAP,
> > > -                 PCI_ATS_CAP_PAGE_ALIGNED);
> > > +    /* Invalidate Queue Depth 0 */
> > > +    if (aligned) {
> > > +        pci_set_word(dev->config + offset + PCI_ATS_CAP,
> > > +                     PCI_ATS_CAP_PAGE_ALIGNED);
> > > +    }
> > >       /* STU 0, Disabled by default */
> > >       pci_set_word(dev->config + offset + PCI_ATS_CTRL, 0);
> > > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > > index 883045a223..2b7142a21e 100644
> > > --- a/hw/virtio/virtio-pci.c
> > > +++ b/hw/virtio/virtio-pci.c
> > > @@ -1848,7 +1848,8 @@ static void virtio_pci_realize(PCIDevice *pci_dev, Error **errp)
> > >           }
> > >           if (proxy->flags & VIRTIO_PCI_FLAG_ATS) {
> > > -            pcie_ats_init(pci_dev, last_pcie_cap_offset);
> > > +            pcie_ats_init(pci_dev, last_pcie_cap_offset,
> > > +                          proxy->flags & VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED);
> > >               last_pcie_cap_offset += PCI_EXT_CAP_ATS_SIZEOF;
> > >           }
> > > @@ -1925,6 +1926,8 @@ static Property virtio_pci_properties[] = {
> > >                        ignore_backend_features, false),
> > >       DEFINE_PROP_BIT("ats", VirtIOPCIProxy, flags,
> > >                       VIRTIO_PCI_FLAG_ATS_BIT, false),
> > > +    DEFINE_PROP_BIT("x-ats-page-aligned", VirtIOPCIProxy, flags,
> > > +                    VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED_BIT, true),
> > >       DEFINE_PROP_BIT("x-pcie-deverr-init", VirtIOPCIProxy, flags,
> > >                       VIRTIO_PCI_FLAG_INIT_DEVERR_BIT, true),
> > >       DEFINE_PROP_BIT("x-pcie-lnkctl-init", VirtIOPCIProxy, flags,
> > > diff --git a/hw/virtio/virtio-pci.h b/hw/virtio/virtio-pci.h
> > > index d7d5d403a9..2446dcd9ae 100644
> > > --- a/hw/virtio/virtio-pci.h
> > > +++ b/hw/virtio/virtio-pci.h
> > > @@ -42,6 +42,7 @@ enum {
> > >       VIRTIO_PCI_FLAG_INIT_PM_BIT,
> > >       VIRTIO_PCI_FLAG_INIT_FLR_BIT,
> > >       VIRTIO_PCI_FLAG_AER_BIT,
> > > +    VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED_BIT,
> > >   };
> > >   /* Need to activate work-arounds for buggy guests at vmstate load. */
> > > @@ -84,6 +85,10 @@ enum {
> > >   /* Advanced Error Reporting capability */
> > >   #define VIRTIO_PCI_FLAG_AER (1 << VIRTIO_PCI_FLAG_AER_BIT)
> > > +/* Page Aligned Address space Translation Service */
> > > +#define VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED \
> > > +  (1 << VIRTIO_PCI_FLAG_ATS_PAGE_ALIGNED_BIT)
> > > +
> > >   typedef struct {
> > >       MSIMessage msg;
> > >       int virq;
> > > diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
> > > index 14c58ebdb6..6063bee0ec 100644
> > > --- a/include/hw/pci/pcie.h
> > > +++ b/include/hw/pci/pcie.h
> > > @@ -137,7 +137,7 @@ void pcie_acs_reset(PCIDevice *dev);
> > >   void pcie_ari_init(PCIDevice *dev, uint16_t offset, uint16_t nextfn);
> > >   void pcie_dev_ser_num_init(PCIDevice *dev, uint16_t offset, uint64_t ser_num);
> > > -void pcie_ats_init(PCIDevice *dev, uint16_t offset);
> > > +void pcie_ats_init(PCIDevice *dev, uint16_t offset, bool aligned);
> > >   void pcie_cap_slot_pre_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
> > >                                  Error **errp);
> > > -- 
> > > 2.24.3 (Apple Git-128)
> > > 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


