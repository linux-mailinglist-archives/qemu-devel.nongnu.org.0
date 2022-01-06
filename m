Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A56F486632
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Jan 2022 15:40:45 +0100 (CET)
Received: from localhost ([::1]:53456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5TwY-0003wK-OE
	for lists+qemu-devel@lfdr.de; Thu, 06 Jan 2022 09:40:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5TSQ-0000Ra-Ju
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:09:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27355)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1n5TSM-0000aJ-F5
 for qemu-devel@nongnu.org; Thu, 06 Jan 2022 09:09:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641478168;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hL+s3HOlALFxOmkmC3Gcq2viD8TCBnvFlSwR7YA3N3k=;
 b=gD6IYHh1MctGV79DBEPe8m8WxGmy+PyDMc8tImz3gpJRy8iHvdrvynx01SP5Kd7IZkW67z
 TXXcM+vD5mXQkg8tjUjZfdEVsBa+SJSsGD3BimRvbGcS70qt0rJq+2dGid5wuQbc+MCOfO
 JUKwBww7qdAv87V09DCxZrJ18o8rLUA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-553-R1Ofj6gkOnyI8Nn8rOCxIw-1; Thu, 06 Jan 2022 09:09:27 -0500
X-MC-Unique: R1Ofj6gkOnyI8Nn8rOCxIw-1
Received: by mail-wr1-f69.google.com with SMTP id
 h24-20020adfaa98000000b001a4dbe0c51fso980254wrc.0
 for <qemu-devel@nongnu.org>; Thu, 06 Jan 2022 06:09:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hL+s3HOlALFxOmkmC3Gcq2viD8TCBnvFlSwR7YA3N3k=;
 b=dM4MRQnJzqIxr+hJVeaFLOMwud80g7LzsLP2H28hUw+V+IFMIFoGfXCxrS1DJ+yq6L
 fAMpj6YTut0uFOGip53lOjorjghEL1YmkE+7VKTS+AnzScyuVza47moFOYD82+ESTm91
 /f1ZPuf++aHsEkWCr8DzVl7hmXPYiMSKOuf4yt8oWo/eP2u4zuO/kTSnhuFvsJ6igMt5
 f5fzudrje5xaSl/VvQJHb2MSEvQkQiGE2sXt/L9FN7NsMXhSiiHO82ewPPBAMaU38B+W
 zLxceesAfHisedR4KgmMgvjgzlxPY69SMtZ6NxQmeRY9ACXJiQQmQvyLBLGRuzXV1xM1
 Fngg==
X-Gm-Message-State: AOAM532fjxJe+piKfHlFgNsr6bdmH3k2GvOv8sM3Cmou6Hj2jX9HJluC
 gLH/l4YjfHtEIKyennXFkYvWK35H950YN/pg3KD6Qp/vdFld8O9iY+i/AsLUXwFJ4do8HCF39q+
 05oMlq2K8Wq24sQ8=
X-Received: by 2002:a5d:424c:: with SMTP id s12mr50035169wrr.465.1641478166519; 
 Thu, 06 Jan 2022 06:09:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzmNJfPX04e7WTceUS/MD5aeBv/8RglLJVnJ0PT/096/xhbFeyrlA3irICd16OmB+x/n4XUGA==
X-Received: by 2002:a5d:424c:: with SMTP id s12mr50035141wrr.465.1641478166281; 
 Thu, 06 Jan 2022 06:09:26 -0800 (PST)
Received: from redhat.com ([2a03:c5c0:207e:991b:6857:5652:b903:a63b])
 by smtp.gmail.com with ESMTPSA id t12sm2586505wrs.72.2022.01.06.06.09.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 06:09:25 -0800 (PST)
Date: Thu, 6 Jan 2022 09:09:22 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
Message-ID: <20220106090804-mutt-send-email-mst@kernel.org>
References: <20220105005900.860-1-longpeng2@huawei.com>
 <20220105005900.860-3-longpeng2@huawei.com>
 <CACGkMEtL7Qkb65Wj4vw-W9h7Lu1Mh7fWGMEkw+0e=Ce=LfD=FA@mail.gmail.com>
 <20220105020008-mutt-send-email-mst@kernel.org>
 <CACGkMEsPqADAR1LhjP=Y4ShhSogdrf2T8O2Km22G7FwGCe+hrQ@mail.gmail.com>
 <1d157f74fdac49ff8ae734808bd3c518@huawei.com>
 <CACGkMEukEBFYrmJjj-jXR_UdamFbjrFkj7PbdfQJOGMzekAvSg@mail.gmail.com>
 <20220105072321-mutt-send-email-mst@kernel.org>
 <CACGkMEt+A5-rSq20qTbideO39q-rZ5RKoK8H77OihFQ8VDgUfw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEt+A5-rSq20qTbideO39q-rZ5RKoK8H77OihFQ8VDgUfw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Cornelia Huck <cohuck@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Yechuan <yechuan@huawei.com>, "Gonglei \(Arei\)" <arei.gonglei@huawei.com>,
 Huangzhichao <huangzhichao@huawei.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 pbonzini <pbonzini@redhat.com>, "Longpeng \(Mike,
 Cloud Infrastructure Service Product Dept.\)" <longpeng2@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 06, 2022 at 10:34:20AM +0800, Jason Wang wrote:
> On Wed, Jan 5, 2022 at 8:26 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Wed, Jan 05, 2022 at 05:09:07PM +0800, Jason Wang wrote:
> > > On Wed, Jan 5, 2022 at 4:37 PM Longpeng (Mike, Cloud Infrastructure
> > > Service Product Dept.) <longpeng2@huawei.com> wrote:
> > > >
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Jason Wang [mailto:jasowang@redhat.com]
> > > > > Sent: Wednesday, January 5, 2022 3:54 PM
> > > > > To: Michael S. Tsirkin <mst@redhat.com>
> > > > > Cc: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > > > > <longpeng2@huawei.com>; Stefan Hajnoczi <stefanha@redhat.com>; Stefano
> > > > > Garzarella <sgarzare@redhat.com>; Cornelia Huck <cohuck@redhat.com>; pbonzini
> > > > > <pbonzini@redhat.com>; Gonglei (Arei) <arei.gonglei@huawei.com>; Yechuan
> > > > > <yechuan@huawei.com>; Huangzhichao <huangzhichao@huawei.com>; qemu-devel
> > > > > <qemu-devel@nongnu.org>
> > > > > Subject: Re: [RFC 02/10] vhost: add 3 commands for vhost-vdpa
> > > > >
> > > > > On Wed, Jan 5, 2022 at 3:02 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> > > > > >
> > > > > > On Wed, Jan 05, 2022 at 12:35:53PM +0800, Jason Wang wrote:
> > > > > > > On Wed, Jan 5, 2022 at 8:59 AM Longpeng(Mike) <longpeng2@huawei.com> wrote:
> > > > > > > >
> > > > > > > > From: Longpeng <longpeng2@huawei.com>
> > > > > > > >
> > > > > > > > To support generic vdpa deivce, we need add the following ioctls:
> > > > > > > > - GET_VECTORS_NUM: the count of vectors that supported
> > > > > > >
> > > > > > > Does this mean MSI vectors? If yes, it looks like a layer violation:
> > > > > > > vhost is transport independent.
> > > > > >
> > > > > > Well *guest* needs to know how many vectors device supports.
> > > > > > I don't think there's a way around that. Do you?
> > > > >
> > > > > We have VHOST_SET_VRING/CONFIG_CALL which is per vq. I think we can
> > > > > simply assume #vqs + 1?
> > > > >
> > > > > > Otherwise guests will at best be suboptimal.
> > > > > >
> > > > > > >  And it reveals device implementation
> > > > > > > details which block (cross vendor) migration.
> > > > > > >
> > > > > > > Thanks
> > > > > >
> > > > > > Not necessarily, userspace can hide this from guest if it
> > > > > > wants to, just validate.
> > > > >
> > > > > If we can hide it at vhost/uAPI level, it would be even better?
> > > > >
> > > >
> > > > Not only MSI vectors, but also queue-size, #vqs, etc.
> > >
> > > MSI is PCI specific, we have non PCI vDPA parent e.g VDUSE/simulator/mlx5
> > >
> > > And it's something that is not guaranteed to be not changed. E.g some
> > > drivers may choose to allocate MSI during set_status() which can fail
> > > for various reasons.
> > >
> > > >
> > > > Maybe the vhost level could expose the hardware's real capabilities
> > > > and let the userspace (QEMU) do the hiding? The userspace know how
> > > > to process them.
> > >
> > > #MSI vectors is much more easier to be mediated than queue-size and #vqs.
> > >
> > > For interrupts, we've already had VHOST_SET_X_KICK, we can keep
> > > allocating eventfd based on #MSI vectors to make it work with any
> > > number of MSI vectors that the virtual device had.
> >
> > Right but if hardware does not support so many then what?
> > Just fail?
> 
> Or just trigger the callback of vqs that shares the vector.


Right but we want userspace to be able to report this to guest accurately
if it wants to. Guest can then configure itself correctly.


> > Having a query API would make things somewhat cleaner imho.
> 
> I may miss something,  even if we know #vectors, we still don't know
> the associated virtqueues for a dedicated vector?

This is up to the guest.

> >
> > > For queue-size, it's Ok to have a new uAPI but it's not a must, Qemu
> > > can simply fail if SET_VRING_NUM fail.
> > >
> > > For #vqs, it's OK to have a new uAPI since the emulated virtio-pci
> > > device requires knowledge the #vqs in the config space. (still not a
> > > must, we can enumerate #vqs per device type)
> > >
> > > For the config size, it's OK but not a must, technically we can simply
> > > relay what guest write to vhost-vdpa. It's just because current Qemu
> > > require to have it during virtio device initialization.
> > >
> > > Thanks
> >
> >
> > I agree but these ok things make for a cleaner API I think.
> 
> Right.
> 
> Thanks
> 
> >
> > > >
> > > > > Thanks
> > > > >
> > > > > >
> > > > > >
> > > > > > > > - GET_CONFIG_SIZE: the size of the virtio config space
> > > > > > > > - GET_VQS_NUM: the count of virtqueues that exported
> > > > > > > >
> > > > > > > > Signed-off-by: Longpeng <longpeng2@huawei.com>
> > > > > > > > ---
> > > > > > > >  linux-headers/linux/vhost.h | 10 ++++++++++
> > > > > > > >  1 file changed, 10 insertions(+)
> > > > > > > >
> > > > > > > > diff --git a/linux-headers/linux/vhost.h b/linux-headers/linux/vhost.h
> > > > > > > > index c998860d7b..c5edd75d15 100644
> > > > > > > > --- a/linux-headers/linux/vhost.h
> > > > > > > > +++ b/linux-headers/linux/vhost.h
> > > > > > > > @@ -150,4 +150,14 @@
> > > > > > > >  /* Get the valid iova range */
> > > > > > > >  #define VHOST_VDPA_GET_IOVA_RANGE      _IOR(VHOST_VIRTIO, 0x78, \
> > > > > > > >                                              struct vhost_vdpa_iova_range)
> > > > > > > > +
> > > > > > > > +/* Get the number of vectors */
> > > > > > > > +#define VHOST_VDPA_GET_VECTORS_NUM     _IOR(VHOST_VIRTIO, 0x79, int)
> > > > > > > > +
> > > > > > > > +/* Get the virtio config size */
> > > > > > > > +#define VHOST_VDPA_GET_CONFIG_SIZE     _IOR(VHOST_VIRTIO, 0x80, int)
> > > > > > > > +
> > > > > > > > +/* Get the number of virtqueues */
> > > > > > > > +#define VHOST_VDPA_GET_VQS_NUM         _IOR(VHOST_VIRTIO, 0x81, int)
> > > > > > > > +
> > > > > > > >  #endif
> > > > > > > > --
> > > > > > > > 2.23.0
> > > > > > > >
> > > > > >
> > > >
> >


