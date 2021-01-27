Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D9BB3054D7
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jan 2021 08:41:19 +0100 (CET)
Received: from localhost ([::1]:47320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4fS1-0002zn-Il
	for lists+qemu-devel@lfdr.de; Wed, 27 Jan 2021 02:41:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4fR5-0002YU-Rq
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:40:19 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1l4fR2-0003pJ-GM
 for qemu-devel@nongnu.org; Wed, 27 Jan 2021 02:40:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611733214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pTwG0l0MrrrycUWlZHvEF67IOx/ppwLX4iR6u6IKBp8=;
 b=WOCrTakDxrPT/+1cVbRYbY2CZ+mnF4izK+BxG2YsyoC2lEoa3qoQcKnpjNGJzImjrJpedm
 MOh8bHxQE/+KpQA0+dXq1WiOQU/I+iarG6PHlvN67xB2PV7KVYiY5cOKPeNGkho2JFzKi9
 XzKgp4DPCaHrknJmSI3Xx/rydd+jIMk=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-591-I9Iwmf6MO4ShB8yF7VmVMg-1; Wed, 27 Jan 2021 02:40:12 -0500
X-MC-Unique: I9Iwmf6MO4ShB8yF7VmVMg-1
Received: by mail-pg1-f197.google.com with SMTP id 8so989912pgn.8
 for <qemu-devel@nongnu.org>; Tue, 26 Jan 2021 23:40:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=pTwG0l0MrrrycUWlZHvEF67IOx/ppwLX4iR6u6IKBp8=;
 b=ScFP6oQFqvlfoqe3wUN2BZp5Gc15KSiT6paO+wSA7kLZb5Ho0p14FGB1uXctLM3C70
 WQyITSVN0vhv7miOsfw9Ei/J2Lt5LKNHx6grNB5ZpfJzXVNvFvTpOAQ8W3hY5Wz9iDM3
 fQC/zUIco2+fCbXQWxI+0521V5nqcOa6fWt2sTGwcClcetO3tt5s0+0ai12XNMrM4POY
 LzDr1pBPPMjt+37wS4CegUkCPgzpkNXJpUKmqjInXt7RdophKgGviweXKalRVipPMUKh
 NkLHR8EcNZaGPuESrfrkffhelSZeNlS6o8cwzCHurHJ31AIWaN8O2KQAjIt1+bewiA+l
 Is7A==
X-Gm-Message-State: AOAM533aeXsXR5RClffs/eZTcX/tFUMShlOMtFR6x6NjS8KJubiI1DpS
 tOkBWCKXgQsoCW4ZUAa40/Am2SJnP4BLabJ2QUL4YPLrnOlFvj6oSfvh4ND0R2oMtm1iuNbwFlw
 LWRgYIoIZxSDMf9taIRmFrJr6u8K826M=
X-Received: by 2002:a17:902:b7c5:b029:de:a7f0:14c1 with SMTP id
 v5-20020a170902b7c5b02900dea7f014c1mr10214259plz.29.1611733210757; 
 Tue, 26 Jan 2021 23:40:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwIdRJVjv79GD/s7cmeEQnZd5u9LnE1TWWL7Awx1so3iIXaJjByKpKbLcleNf9HIkRik//xC7iv3q6KHuSM7MU=
X-Received: by 2002:a17:902:b7c5:b029:de:a7f0:14c1 with SMTP id
 v5-20020a170902b7c5b02900dea7f014c1mr10214238plz.29.1611733210339; Tue, 26
 Jan 2021 23:40:10 -0800 (PST)
MIME-Version: 1.0
References: <20210126074254.3225-1-lulu@redhat.com>
 <20210126074254.3225-4-lulu@redhat.com>
 <26f38bc0-6461-b268-6dca-1cfd9bfa58f6@redhat.com>
In-Reply-To: <26f38bc0-6461-b268-6dca-1cfd9bfa58f6@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Wed, 27 Jan 2021 15:39:34 +0800
Message-ID: <CACLfguVDgAFJi-t-f1=eo_JMic4TN6Tj-fBjGbT5o4uXR1FW3Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] virtio-pci: add support for configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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

On Wed, Jan 27, 2021 at 1:44 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> On 2021/1/26 =E4=B8=8B=E5=8D=883:42, Cindy Lu wrote:
> > Add support for configure interrupt, use kvm_irqfd_assign and set the
> > gsi to kernel. When the configure notifier was eventfd_signal by host
> > kernel, this will finally inject an msix interrupt to guest
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/virtio-pci.c | 92 ++++++++++++++++++++++++++++++++++-------=
-
> >   1 file changed, 75 insertions(+), 17 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 36524a5728..8e192600b8 100644
> > --- a/hw/virtio/virtio-pci.c
> > +++ b/hw/virtio/virtio-pci.c
> > @@ -664,7 +664,6 @@ static uint32_t virtio_read_config(PCIDevice *pci_d=
ev,
> >   }
> >
> >   static int kvm_virtio_pci_vq_vector_use(VirtIOPCIProxy *proxy,
> > -                                        unsigned int queue_no,
> >                                           unsigned int vector)
> >   {
> >       VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> > @@ -691,23 +690,17 @@ static void kvm_virtio_pci_vq_vector_release(Virt=
IOPCIProxy *proxy,
> >   }
> >
> >   static int kvm_virtio_pci_irqfd_use(VirtIOPCIProxy *proxy,
> > -                                 unsigned int queue_no,
> > +                                 EventNotifier *n,
> >                                    unsigned int vector)
> >   {
> >       VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> > -    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > -    VirtQueue *vq =3D virtio_get_queue(vdev, queue_no);
> > -    EventNotifier *n =3D virtio_queue_get_guest_notifier(vq);
> >       return kvm_irqchip_add_irqfd_notifier_gsi(kvm_state, n, NULL, irq=
fd->virq);
> >   }
> >
> >   static void kvm_virtio_pci_irqfd_release(VirtIOPCIProxy *proxy,
> > -                                      unsigned int queue_no,
> > +                                      EventNotifier *n ,
> >                                         unsigned int vector)
> >   {
> > -    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > -    VirtQueue *vq =3D virtio_get_queue(vdev, queue_no);
> > -    EventNotifier *n =3D virtio_queue_get_guest_notifier(vq);
> >       VirtIOIRQFD *irqfd =3D &proxy->vector_irqfd[vector];
> >       int ret;
> >
> > @@ -722,7 +715,8 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy=
 *proxy, int nvqs)
> >       VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> >       unsigned int vector;
> >       int ret, queue_no;
> > -
> > +    VirtQueue *vq;
> > +    EventNotifier *n;
>
>
> new line is needed.
>
will fix this
>
> >       for (queue_no =3D 0; queue_no < nvqs; queue_no++) {
> >           if (!virtio_queue_get_num(vdev, queue_no)) {
> >               break;
> > @@ -731,7 +725,7 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy=
 *proxy, int nvqs)
> >           if (vector >=3D msix_nr_vectors_allocated(dev)) {
> >               continue;
> >           }
> > -        ret =3D kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
> > +        ret =3D kvm_virtio_pci_vq_vector_use(proxy,  vector);
> >           if (ret < 0) {
> >               goto undo;
> >           }
> > @@ -739,7 +733,9 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy=
 *proxy, int nvqs)
> >            * Otherwise, delay until unmasked in the frontend.
> >            */
> >           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) =
{
> > -            ret =3D kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> > +            vq =3D virtio_get_queue(vdev, queue_no);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            ret =3D kvm_virtio_pci_irqfd_use(proxy, n, vector);
> >               if (ret < 0) {
> >                   kvm_virtio_pci_vq_vector_release(proxy, vector);
> >                   goto undo;
> > @@ -755,13 +751,69 @@ undo:
> >               continue;
> >           }
> >           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) =
{
> > -            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> > +            vq =3D virtio_get_queue(vdev, queue_no);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> >           }
> >           kvm_virtio_pci_vq_vector_release(proxy, vector);
> >       }
> >       return ret;
> >   }
> >
> > +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> > +{
> > +
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    unsigned int vector;
> > +    int ret;
> > +    EventNotifier *n =3D virtio_get_config_notifier(vdev);
> > +
> > +    vector =3D vdev->config_vector ;
> > +    ret =3D kvm_virtio_pci_vq_vector_use(proxy, vector);
> > +    if (ret < 0) {
> > +        goto undo;
> > +    }
> > +    ret =3D kvm_virtio_pci_irqfd_use(proxy,  n, vector);
> > +    if (ret < 0) {
> > +        goto undo;
> > +    }
> > +    return 0;
> > +undo:
> > +    kvm_virtio_pci_irqfd_release(proxy, n, vector);
> > +    return ret;
> > +}
>
>
> newline is needed.
>
will fix this
>
> > +static void kvm_virtio_pci_vector_config_release(VirtIOPCIProxy *proxy=
)
> > +{
> > +    PCIDevice *dev =3D &proxy->pci_dev;
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    unsigned int vector;
> > +    EventNotifier *n =3D virtio_get_config_notifier(vdev);
> > +    vector =3D vdev->config_vector ;
> > +    if (vector >=3D msix_nr_vectors_allocated(dev)) {
> > +        return;
> > +    }
> > +    kvm_virtio_pci_irqfd_release(proxy, n, vector);
> > +    kvm_virtio_pci_vq_vector_release(proxy, vector);
> > +}
> > +
> > +static int virtio_pci_set_config_notifier(DeviceState *d,  bool assign=
)
> > +{
> > +    VirtIOPCIProxy *proxy =3D to_virtio_pci_proxy(d);
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    EventNotifier *notifier =3D virtio_get_config_notifier(vdev);
> > +    int r =3D 0;
> > +    if (assign) {
> > +        r =3D event_notifier_init(notifier, 0);
> > +        virtio_set_config_notifier_fd_handler(vdev, true, true);
> > +        kvm_virtio_pci_vector_config_use(proxy);
> > +    } else {
> > +        virtio_set_config_notifier_fd_handler(vdev, false, true);
> > +        kvm_virtio_pci_vector_config_release(proxy);
> > +        event_notifier_cleanup(notifier);
> > +    }
> > +    return r;
> > +}
>
>
> Two questions, don't we need to check whether or not MSIX is enalbed in
> this case? Instead of introducing new helpers that is easy to be buggy I
> still prefer to re-use virtio_pci_set_guest_notifier:
>
> We can switch to use accepts EventNotifier instead of virtqueue index.
> And we need also convert virtqueue_set_guest_notifier_fd_handler() to
> accept EventNotifier.
>
sure, I will fix this
>
> > +
> >   static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int =
nvqs)
> >   {
> >       PCIDevice *dev =3D &proxy->pci_dev;
> > @@ -769,7 +821,8 @@ static void kvm_virtio_pci_vector_release(VirtIOPCI=
Proxy *proxy, int nvqs)
> >       unsigned int vector;
> >       int queue_no;
> >       VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> > -
> > +    VirtQueue *vq;
> > +    EventNotifier *n;
>
>
> newline is needed.
>
> Thanks
>
>
> >       for (queue_no =3D 0; queue_no < nvqs; queue_no++) {
> >           if (!virtio_queue_get_num(vdev, queue_no)) {
> >               break;
> > @@ -782,7 +835,9 @@ static void kvm_virtio_pci_vector_release(VirtIOPCI=
Proxy *proxy, int nvqs)
> >            * Otherwise, it was cleaned when masked in the frontend.
> >            */
> >           if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) =
{
> > -            kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> > +            vq =3D virtio_get_queue(vdev, queue_no);
> > +            n =3D virtio_queue_get_guest_notifier(vq);
> > +            kvm_virtio_pci_irqfd_release(proxy, n, vector);
> >           }
> >           kvm_virtio_pci_vq_vector_release(proxy, vector);
> >       }
> > @@ -823,7 +878,7 @@ static int virtio_pci_vq_vector_unmask(VirtIOPCIPro=
xy *proxy,
> >               event_notifier_set(n);
> >           }
> >       } else {
> > -        ret =3D kvm_virtio_pci_irqfd_use(proxy, queue_no, vector);
> > +        ret =3D kvm_virtio_pci_irqfd_use(proxy, n, vector);
> >       }
> >       return ret;
> >   }
> > @@ -835,13 +890,15 @@ static void virtio_pci_vq_vector_mask(VirtIOPCIPr=
oxy *proxy,
> >       VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> >       VirtioDeviceClass *k =3D VIRTIO_DEVICE_GET_CLASS(vdev);
> >
> > +    VirtQueue *vq =3D virtio_get_queue(vdev, queue_no);
> > +    EventNotifier *n =3D virtio_queue_get_guest_notifier(vq);
> >       /* If guest supports masking, keep irqfd but mask it.
> >        * Otherwise, clean it up now.
> >        */
> >       if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
> >           k->guest_notifier_mask(vdev, queue_no, true);
> >       } else {
> > -        kvm_virtio_pci_irqfd_release(proxy, queue_no, vector);
> > +        kvm_virtio_pci_irqfd_release(proxy, n, vector);
> >       }
> >   }
> >
> > @@ -2137,6 +2194,7 @@ static void virtio_pci_bus_class_init(ObjectClass=
 *klass, void *data)
> >       k->ioeventfd_assign =3D virtio_pci_ioeventfd_assign;
> >       k->get_dma_as =3D virtio_pci_get_dma_as;
> >       k->queue_enabled =3D virtio_pci_queue_enabled;
> > +    k->set_config_notifiers =3D virtio_pci_set_config_notifier;
> >   }
> >
> >   static const TypeInfo virtio_pci_bus_info =3D {
>


