Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA45C2F5A8B
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 07:10:39 +0100 (CET)
Received: from localhost ([::1]:43484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzvqA-00038A-7Y
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 01:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kzvp4-0002id-Q9
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 01:09:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1kzvp2-0002Oz-Hg
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 01:09:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610604567;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2ZP5XCA0wPXBbGJLjI+78IVlHdP+zgZ4smIQGNllwo=;
 b=e+1+J4BKmQhvr56UKlbDF34LxEttiMkQjMUKQrykt6OXsZvvvcpCx8MGpMLGGeQ+05JQ+l
 8ziFHDexaSDcyaDPrQEOpyytlR+dznv9k9p32V7AuaATmZ/hxeuNyRGN+ptrcGOReeqiYP
 zcagcKcArmwwB9G/rlCmzhKyq+wdNHI=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-Q2iEvyydNbas8CZsSnbJ2w-1; Thu, 14 Jan 2021 01:09:24 -0500
X-MC-Unique: Q2iEvyydNbas8CZsSnbJ2w-1
Received: by mail-pl1-f198.google.com with SMTP id 3so2649768pld.1
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 22:09:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/2ZP5XCA0wPXBbGJLjI+78IVlHdP+zgZ4smIQGNllwo=;
 b=i10CbJdWLZOm50WzX/sIKOrsKGTc8AmgKJJqNn/cVanzsNDhpJuB8nptBYLsJbyvq5
 yt9XonFhtYUq1TbrTnBCscIosDu+gV0UJK8utexSDEl6UtEd4eUj8Tn6zbT7L9gBtHN9
 x2pXVb9L59x9ZjKia9Kbzguae16q8upvGWju3BE7qBGQYCCU8OOJE8U8QTLd/uUqKudV
 L/cZNHu4SyPO4Ptei7wyJ0JCs4lz02HNvzwxrDUyNc+t/KcO+7va1efL9HUd8onCa/et
 JB4xh044pqLhv3yYLMaX6Okiwu9XePj+UA0Qldpw+KYeekG/SfRmIblCK6WrX6J9+ucF
 OQ2g==
X-Gm-Message-State: AOAM531FeC/8DVC1+hdxVMAJyKvlootRHSY7ttkNGEXCHDKVQSUlqSKt
 OrVoPCW+lRndmAM370e9PryZKyls+ORdxFFvhV1gbf64Q3lCg8and+Zh3/zyGF66he3rCmDJg8W
 qvDsm6zxEs7VuzDKw3IUMhHh4erlJQx4=
X-Received: by 2002:aa7:99c9:0:b029:1ae:7bed:df12 with SMTP id
 v9-20020aa799c90000b02901ae7beddf12mr6113387pfi.53.1610604563110; 
 Wed, 13 Jan 2021 22:09:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzNhWyYpTtTpyGH7YKfKLfIlWYyVQ3nj5P3Z8vAE7xAkVc8Ywz3qUgCsFXN6Wce95RQQAp3JwwXZys5yS+kf24=
X-Received: by 2002:aa7:99c9:0:b029:1ae:7bed:df12 with SMTP id
 v9-20020aa799c90000b02901ae7beddf12mr6113367pfi.53.1610604562860; Wed, 13 Jan
 2021 22:09:22 -0800 (PST)
MIME-Version: 1.0
References: <20210113154540.24981-1-lulu@redhat.com>
 <20210113154540.24981-3-lulu@redhat.com>
 <592aa41f-120f-9bb4-0226-2fc0799b244a@redhat.com>
In-Reply-To: <592aa41f-120f-9bb4-0226-2fc0799b244a@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Thu, 14 Jan 2021 14:08:46 +0800
Message-ID: <CACLfguVFtyA6rNpUsOwrkgR_bnAkKOqk4fhLmmvJnmtusHE-TA@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] virtio-pci:add support for configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Michael Tsirkin <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 14, 2021 at 12:43 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/13 =E4=B8=8B=E5=8D=8811:45, Cindy Lu wrote:
> > Add support for configure interrupt, use kvm_irqfd_assign and set the
> > gsi to kernel. When the configure notifier was eventfd_signal by host
> > kernel, this will finally inject an msix interrupt to guest
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/virtio-pci.c         | 93 +++++++++++++++++++++++++++++++++=
+
> >   include/hw/virtio/virtio-bus.h |  2 +
> >   2 files changed, 95 insertions(+)
> >
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 36524a5728..f8053e1fab 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -762,6 +762,98 @@ undo:
> >       return ret;
> >   }
> >
> > + static int kvm_virtio_pci_config_irqfd_use(VirtIOPCIProxy *proxy,
> > +                                 unsigned int vector)
> > +{
> > +    VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    EventNotifier *n =3D virtio_queue_get_config_notifier(vdev);
> > +    assert(irqfd);
> > +    return kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, irqf=
d->virq);
> > +}
> > +
> > +static void kvm_virtio_pci_config_irqfd_release(VirtIOPCIProxy *proxy,
> > +                                      unsigned int vector)
> > +{
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    EventNotifier *n =3D virtio_queue_get_config_notifier(vdev);
> > +    VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> > +    assert(irqfd);
> > +    kvm_irqchip_remove_irqfd_notifier_gsi(kvm_state, n, irqfd->virq);
> > +    return;
> > +}
> > +static int kvm_virtio_pci_config_vector_use(VirtIOPCIProxy *proxy,
> > +                                        unsigned int vector)
> > +{
> > +    VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> > +    int ret;
> > +
> > +    if (irqfd->users =3D=3D 0) {
> > +        ret =3D kvm_irqchip_add_msi_route(kvm_state, vector, &proxy->p=
ci_dev);
> > +        if (ret < 0) {
> > +            return ret;
> > +        }
> > +        irqfd->virq =3D ret;
> > +    }
> > +    irqfd->users++;
> > +
> > +    return 0;
> > +}
>
>
> Any reason that we can't resue kvm_virtio_pci_vq_vector_use()? Note that
> at MSIX level there's no difference if it belongs to vq or config.
>
>
> > +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> > +{
> > +
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    unsigned int vector;
> > +    int ret;
> > +    VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > +
> > +    vector =3D vdev->config_vector ;
> > +    ret =3D kvm_virtio_pci_config_vector_use(proxy, vector);
> > +    if (ret < 0) {
> > +        goto undo;
> > +    }
> > +    ret =3D kvm_virtio_pci_config_irqfd_use(proxy,  vector);
> > +    if (ret < 0) {
> > +        goto undo;
> > +    }
> > +    return 0;
> > +undo:
> > +    kvm_virtio_pci_config_irqfd_release(proxy, vector);
> > +    return ret;
> > +}
> > +static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy=
)
> > +{
> > +    PCIDevice *dev =3D &proxy->pci_dev;
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    unsigned int vector;
> > +    VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > +    vector =3D vdev->config_vector ;
> > +    if (vector >=3D msix_nr_vectors_allocated(dev)) {
> > +        return;
> > +    }
> > +    kvm_virtio_pci_config_irqfd_release(proxy, vector);
> > +    kvm_virtio_pci_vq_vector_release(proxy, vector);
> > +}
> > +
> > +static int virtio_pci_set_guest_config_notifier(DeviceState *d,  bool =
assign,
> > +                                         bool with_irqfd)
> > +{
> > +    VirtIOPCIProxy *proxy =3D to_virtio_pci_proxy(d);
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    EventNotifier *notifier =3D virtio_queue_get_config_notifier(vdev)=
;
> > +    int r =3D 0;
> > +    if (assign) {
> > +        r =3D event_notifier_init(notifier, 1);
> > +        virtio_set_config_notifier_fd_handler(vdev, true, with_irqfd);
> > +        kvm_virtio_pci_vector_config_use(proxy);
> > +    } else {
> > +        virtio_set_config_notifier_fd_handler(vdev, false, with_irqfd)=
;
> > +        kvm_virtio_pci_vector_config_release(proxy);
> > +        event_notifier_cleanup(notifier);
> > +    }
> > +    return r;
> > +}
>
>
> Any way to re-use virtio_pci_set_guest_notifier() here?
>
> Thanks
>
These  two functions you mentioned all have something needed such as
queue no/guest_notifier. so I created a new one.
but it's a good idea to re-organize it,  I will post a new version
>
> > +
> >   static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int =
nvqs)
> >   {
> >       PCIDevice *dev =3D &proxy->pci_dev;
> > @@ -2137,6 +2229,7 @@ static void virtio_pci_bus_class_init(ObjectClass=
 *klass, void *data)
> >       k->ioeventfd_assign =3D virtio_pci_ioeventfd_assign;
> >       k->get_dma_as =3D virtio_pci_get_dma_as;
> >       k->queue_enabled =3D virtio_pci_queue_enabled;
> > +    k->set_config_notifiers =3D virtio_pci_set_guest_config_notifier;
> >   }
> >
> >   static const TypeInfo virtio_pci_bus_info =3D {
> > diff --git a/include/hw/virtio/virtio-bus.h b/include/hw/virtio/virtio-=
bus.h
> > index ef8abe49c5..dae81ee414 100644
> > --- a/include/hw/virtio/virtio-bus.h
> > +++ b/include/hw/virtio/virtio-bus.h
> > @@ -93,6 +93,8 @@ struct VirtioBusClass {
> >        */
> >       bool has_variable_vring_alignment;
> >       AddressSpace *(*get_dma_as)(DeviceState *d);
> > +    int (*set_config_notifiers)(DeviceState *d, bool assign, bool with=
_irqfd);
> > +
> >   };
> >
> >   struct VirtioBusState {
>


