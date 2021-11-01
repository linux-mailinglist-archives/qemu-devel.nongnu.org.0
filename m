Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B82442212
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:54:57 +0100 (CET)
Received: from localhost ([::1]:35048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mheKW-0000wy-Jl
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:54:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mheEc-0002hi-MJ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:48:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mheEY-0001K4-As
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 16:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635799720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mfnCH1Yv8ONG1dYNOq8GGWpZcVm2IeQhFxzS+ihGJiM=;
 b=ZU1IEfdLsUlVMSenOzyW4jq7ZO2cPEsHPpd7CYQ8vY0hJFOH/R27pPibaYG/WiiqE74UST
 bFGHNst8HgzbpRltELhfVF/6aaXtqAUvCTWgqbntyCDv9ZDDC+8kv+8MUkrB0p7jUxGmMM
 kGbSStwYwjRq9jywgh9YEsLEUzz/mZc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-T0oC4Q7QNDKeLKDSMhictw-1; Mon, 01 Nov 2021 16:48:38 -0400
X-MC-Unique: T0oC4Q7QNDKeLKDSMhictw-1
Received: by mail-ed1-f70.google.com with SMTP id
 v9-20020a50d849000000b003dcb31eabaaso16799502edj.13
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 13:48:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=mfnCH1Yv8ONG1dYNOq8GGWpZcVm2IeQhFxzS+ihGJiM=;
 b=BZAcByrSnc5bO87yRVE7Yvtp/uorxFY8+E1QNk150LFybBQZWYGOJX2V/mntaObhKn
 bGqJITz0qXO+qt5i5Bo3n6CUsgYMyzj7+xiBVvLA+fK4DyWdGn4QiTFHrC6Z3oIl8YsX
 G/DD+UOlHUlyPSxj9cCU8qYKtpxsW1KKs3fbkRd6rkJ0+Vzy1SV1aYsPt1l9W0Sdm+X/
 kv4ebW+Dixaw7bdxDJWRxR/Km5uDecGhqL4YfCa36bTf62DyIxyBMUc+mBv/Abt0zhLa
 Pv3oabmWtN/GZ55HLEMiyRQ1IM0MdKJIuDwmAGNGp32X5+TREK71O2mbPo42TgW51/vj
 TKIA==
X-Gm-Message-State: AOAM532tg9LE7Yhx4Twz0NgL63VoRVPMwyA5NeN9NZiW7YcHVO8oWctB
 n2PoK0BcDz6O1EnvCRB1zmQhe/4sSpcVJZb+0z34VbEI2tZkP9OrDCswCGQkAIqmCrSVh9WxMfu
 yXBrj5lBBdJZNTSw=
X-Received: by 2002:a50:bf07:: with SMTP id f7mr44639237edk.288.1635799717679; 
 Mon, 01 Nov 2021 13:48:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyVlDUPCJrauSFTKKetKSz+t38qymmw99jmnRBWDP2N9Idx98n9PTgs/34cpQqigDd8Z14UGg==
X-Received: by 2002:a50:bf07:: with SMTP id f7mr44639224edk.288.1635799717472; 
 Mon, 01 Nov 2021 13:48:37 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id h10sm9761664edk.41.2021.11.01.13.48.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 13:48:36 -0700 (PDT)
Date: Mon, 1 Nov 2021 16:48:32 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eugenio Perez Martin <eperezma@redhat.com>
Subject: Re: [PATCH] vhost: Fix last queue index of devices with no cvq
Message-ID: <20211101164749-mutt-send-email-mst@kernel.org>
References: <20211029141608.1728855-1-eperezma@redhat.com>
 <CACGkMEss8Xq8WYUkDkLaYx-XBW6GADDAjH1mwmpBdxKc2wsRAQ@mail.gmail.com>
 <CAJaqyWcsbtOoLGkCW6J_9M8qR1-yvbQmWq1rU0y+8Y=BhPeRWw@mail.gmail.com>
 <CAJaqyWdBMCeFZ4yARpezqmZSSoiLKBStNDm_CLJPrZRDx7X4wg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJaqyWdBMCeFZ4yARpezqmZSSoiLKBStNDm_CLJPrZRDx7X4wg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Nov 01, 2021 at 04:42:01PM +0100, Eugenio Perez Martin wrote:
> On Mon, Nov 1, 2021 at 9:58 AM Eugenio Perez Martin <eperezma@redhat.com> wrote:
> >
> > On Mon, Nov 1, 2021 at 4:34 AM Jason Wang <jasowang@redhat.com> wrote:
> > >
> > > On Fri, Oct 29, 2021 at 10:16 PM Eugenio Pérez <eperezma@redhat.com> wrote:
> > > >
> > > > The -1 assumes that all devices with no cvq have an spare vq allocated
> > > > for them, but with no offer of VIRTIO_NET_F_CTRL_VQ. This may not be the
> > > > case, and the device may have a pair number of queues.
> > > >
> > > > To fix this, just resort to the lower even number of queues.
> > > >
> > > > Fixes: 049eb15b5fc9 ("vhost: record the last virtqueue index for the virtio device")
> > > > Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> > > > ---
> > > >  hw/net/vhost_net.c | 2 +-
> > > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > >
> > > > diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> > > > index 0d888f29a6..edf56a597f 100644
> > > > --- a/hw/net/vhost_net.c
> > > > +++ b/hw/net/vhost_net.c
> > > > @@ -330,7 +330,7 @@ int vhost_net_start(VirtIODevice *dev, NetClientState *ncs,
> > > >      NetClientState *peer;
> > > >
> > > >      if (!cvq) {
> > > > -        last_index -= 1;
> > > > +        last_index &= ~1ULL;
> > > >      }
> > >
> > > The math here looks correct but we need to fix vhost_vdpa_dev_start() instead?
> > >
> > > if (dev->vq_index + dev->nvqs - 1 != dev->last_index) {
> > > ...
> > > }
> > >
> >
> > If we just do that, devices that offer an odd number of queues but do
> > not offer ctrl vq would never enable the last vq pair, isn't it?
> >
> 
> To expand the issue,
> 
> With that condition it is not possible to make vp_vdpa work on devices
> with no cvq. If I set the L0 guest's device with no cvq (with -device
> virtio-net-pci,...,ctrl_vq=off,mq=off). The nested VM will enter that
> conditional in vhost_net_start, and will mark last_index=1, making it
> impossible to start a vhost_vdpa device.
> 
> However, re-reading the standard:
> 
> controlq only exists if VIRTIO_NET_F_CTRL_VQ set.
> 
> So the code is actually handling an invalid device: The device set
> VIRTIO_NET_F_CTRL_VQ but offered an odd number of VQs.
> 
> Do we have an example of such a device? It's not the case on qemu
> virtio-net, with or without vhost-net in L0 device. The operation &=
> ~1ULL is an intended noop in case the queues are already even. I'm
> fine to keep making last_index even, so we have that safety net, with
> further clarifications as MST said, just in case the device is not
> behaving well. But maybe it's even better just to delete that
> conditional entirely?
> 
> Thanks!
> 

For sure, no need to handle an invalid configuration.
Do you have a patch in mind? It'd be easier to discuss
things with a specific patch rather than theoretically.

> 
> 
> > Also, I would say that the right place for the solution of this
> > problem should not be virtio/vhost-vdpa: This is highly dependent on
> > having cvq, and this implies a knowledge about the use of each
> > virtqueue. Another kind of device could have an odd number of
> > virtqueues naturally, and that (-1) would not work for them, isn't it?
> >
> > Thanks!
> >
> > > Thanks
> > >
> > > >
> > > >      if (!k->set_guest_notifiers) {
> > > > --
> > > > 2.27.0
> > > >
> > >


