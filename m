Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C8B6A763E
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 22:38:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXU91-0007Va-3p; Wed, 01 Mar 2023 16:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXU8y-0007U1-7b
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:37:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXU8w-0000ub-JX
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 16:37:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677706665;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O4PBgrIFih3AyQqLpvWjYTiAD38p5mjALaVVpvh+C8k=;
 b=KuXz6kbAXMudyLQLgi566RrxWM7/Eu5xtaf63vZVa3A3Og1KiQKdQ/VjuCxSYbTGdm7hyM
 Wp5WAgvam0MMzX25tUSYtUDNwq4AsP+EDA+/gV12ZFWvdFNAceoDYuG4h0HabJxwX4aPjZ
 tN79RA0Nn2/Una8GAVfgvPmPYrtiLUQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-125-8kSxW4ZKNVGRvSUgKD10jA-1; Wed, 01 Mar 2023 16:37:44 -0500
X-MC-Unique: 8kSxW4ZKNVGRvSUgKD10jA-1
Received: by mail-wr1-f70.google.com with SMTP id
 q7-20020a05600000c700b002cd9188abe5so1565897wrx.3
 for <qemu-devel@nongnu.org>; Wed, 01 Mar 2023 13:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677706660;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=O4PBgrIFih3AyQqLpvWjYTiAD38p5mjALaVVpvh+C8k=;
 b=BVtcgdh340ZNxyqR4biUHPm+vXuc185E3z9EUUQ6AISDrNfxlJTt89qPBDNEz4pcXk
 cJFg5VTS0aiVQqhuYebwZdl5DhOSNPCcBm0DrKo0+nAuNaFT0SlIMn4aw7vX06LgMkKt
 TTHAlCguDq1muoXy+g1xSlkoPeq7axlIWDt22T5rcJqGeBJUUyfJRg565upwaWP9O2Qp
 p42vehG8Y/vZlaNNgHhkuKAGKioeq8+rmQapGwNRR89hTJTYE3ZbgjWUlfboaDahB2e1
 h13miR0gAGbqGPuCqW3HKJykh3jwj+I4TiX0mziElwpQMrCJgkCPr9X76JgmF4eGzCme
 zoUA==
X-Gm-Message-State: AO0yUKWI+uQ6O523JEVYHqXcbPmZuBKjpnR5uf5VU+ZhGjFthfCDbELN
 8pqiT7OOu5+L2pv2LtiTluesR/ZPe6yWWQh5EehvkgnehuvKkwA1FYlNQS9EN2EP1TMdQpZNSlP
 J4H+xInaIVauKtGU=
X-Received: by 2002:a5d:5407:0:b0:2c9:e585:84b0 with SMTP id
 g7-20020a5d5407000000b002c9e58584b0mr5525958wrv.1.1677706660284; 
 Wed, 01 Mar 2023 13:37:40 -0800 (PST)
X-Google-Smtp-Source: AK7set+3FTVB8FSGSQmD27Wjj7Dln/qYEyf1tlZLXVjDBVoP5atY3vMJrVSK0DOpcwYhpUdQ4et+XA==
X-Received: by 2002:a5d:5407:0:b0:2c9:e585:84b0 with SMTP id
 g7-20020a5d5407000000b002c9e58584b0mr5525942wrv.1.1677706659932; 
 Wed, 01 Mar 2023 13:37:39 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 z7-20020a05600c0a0700b003dc434b39c7sm4722959wmp.0.2023.03.01.13.37.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Mar 2023 13:37:39 -0800 (PST)
Date: Wed, 1 Mar 2023 16:37:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org,
 Gautam Dawar <gdawar@xilinx.com>, Parav Pandit <parav@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Cindy Lu <lulu@redhat.com>,
 longpeng2@huawei.com, Eli Cohen <eli@mellanox.com>,
 alvaro.karsz@solid-run.com, Lei Yang <leiyang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ
 feature
Message-ID: <20230301163325-mutt-send-email-mst@kernel.org>
References: <20230213191929.1547497-1-eperezma@redhat.com>
 <CACGkMEsQe=zcfmK=rMH=u6RgHkkBFs+tJO7gT0v_bWwJ_N+z6Q@mail.gmail.com>
 <CAJaqyWfsBLvsJNF=RvhbirwNypzjfaO7thyK22s-nCjdaNs4yQ@mail.gmail.com>
 <20230214024736-mutt-send-email-mst@kernel.org>
 <CAJaqyWc8JON+QhJbqQCFx+q+qxb5LqjgsHS2wZ7R3v37uVU_sw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJaqyWc8JON+QhJbqQCFx+q+qxb5LqjgsHS2wZ7R3v37uVU_sw@mail.gmail.com>
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

On Tue, Feb 14, 2023 at 09:36:01AM +0100, Eugenio Perez Martin wrote:
> On Tue, Feb 14, 2023 at 8:51 AM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Tue, Feb 14, 2023 at 08:02:08AM +0100, Eugenio Perez Martin wrote:
> > > On Tue, Feb 14, 2023 at 7:31 AM Jason Wang <jasowang@redhat.com> wrote:
> > > >
> > > > On Tue, Feb 14, 2023 at 3:19 AM Eugenio Pérez <eperezma@redhat.com> wrote:
> > > > >
> > > > > VIRTIO_F_ORDER_PLATFORM indicates that memory accesses by the driver and
> > > > > the device are ordered in a way described by the platform.  Since vDPA
> > > > > devices may be backed by a hardware devices, let's allow
> > > > > VIRTIO_F_ORDER_PLATFORM.
> > > > >
> > > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > > > ---
> > > > >  hw/virtio/vhost-shadow-virtqueue.c | 1 +
> > > > >  1 file changed, 1 insertion(+)
> > > > >
> > > > > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > index 4307296358..6bb1998f12 100644
> > > > > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > > > > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > > > > @@ -34,6 +34,7 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp)
> > > > >          switch (b) {
> > > > >          case VIRTIO_F_ANY_LAYOUT:
> > > > >          case VIRTIO_RING_F_EVENT_IDX:
> > > > > +        case VIRTIO_F_ORDER_PLATFORM:
> > > >
> > > > Do we need to add this bit to vdpa_feature_bits[] as well?
> > > >
> > >
> > > If we want to pass it to the guest, yes we should. I'll send another
> > > patch for it.
> > >
> > > But I think that should be done on top / in parallel actually.
> > >
> > > Open question: Should all vdpa hardware devices offer it? Or this is
> > > only needed on specific archs?
> > >
> > > Thanks!
> >
> > I don't get what this is doing at all frankly. vdpa has to
> > pass VIRTIO_F_ORDER_PLATFORM to guest at all times - unless
> > - it's a x86 host where it kind of works anyway
> > - it's vduse which frankly is so slow we can do VIRTIO_F_ORDER_PLATFORM anyway.
> 
> That was my understanding, adding vdpasim to the list of exceptions
> (please correct me if I'm wrong).
> 
> > In short VIRTIO_F_ORDER_PLATFORM has nothing to do with the device
> > and everything with qemu itself.
> >
> 
> I have little experience outside of x86 so I may be wrong here. My
> understanding is that this feature allows the guest to optimize
> barriers around memory ops:
> * If VIRTIO_F_ORDER_PLATFORM is not negotiated, the driver can use
> softer memory barriers that protects ordering between different
> processors.
> * If VIRTIO_F_ORDER_PLATFORM is negotiated, stronger ordering is
> needed that also protects transport (PCI) accesses
> 
> This is backed up by comments in the standard:
> This implies that the driver needs to use memory barriers suitable for
> devices described by the platform; e.g. for the PCI transport in the
> case of hardware PCI devices.
> 
> And in virtio drivers:
> For virtio_pci on SMP, we don't need to order with respect to MMIO
> accesses through relaxed memory I/O windows, so virt_mb() et al are
> sufficient.
> For using virtio to talk to real devices (eg. other heterogeneous
> CPUs) we do need real barriers.
> 
> So the sentence "VIRTIO_F_ORDER_PLATFORM has nothing to do with the
> device and everything with qemu itself." is actually the reverse, and
> has everything to do with devices?

Point is this is not device's decision.


> > Yea we can allow VIRTIO_F_ORDER_PLATFORM from kernel but given
> > we never did at this point it will need a protocol feature bit.
> > I don't think it's worth it ..
> >
> 
> With "from kernel" do you mean in vhost-kernel or in virtio ring
> driver? The virtio ring driver already supports them.

vhost-kernel

> I'm ok with leaving this for the future but that means hw devices in
> non-x86 platforms may not work correctly, isn't it?
> 
> Thanks!

You need to pass this to guest. My point is that there is no reason to
get it from the kernel driver. QEMU can figure out whether the flag is
needed itself.

-- 
MST


