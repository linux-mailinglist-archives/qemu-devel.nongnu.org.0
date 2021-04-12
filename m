Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA59535BC3E
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 10:33:39 +0200 (CEST)
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVs0o-0004r0-VA
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 04:33:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60938)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lVrv6-000754-E9
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:27:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1lVrv3-0002MG-93
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 04:27:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618216059;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/F6U9aDnaryN8IDSgqu6Yd6GDsy7N4pJFGS7Yl27yc=;
 b=X706MjgD/ZYu0Oof59RbP7pEa7gCzCwHNAVGxejtHIK+QWWhNjqaVJ1x4S7iYAAp3A36qV
 773ix+FF9uhr+RaYo3/zJZMEaQ/2Koujk4FEHEabFwcI7+AvUZ2N12NKFYZNEkVEx/X6GS
 ++vmaCNM1IStr/c1xLGknlpNA7UcIgk=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-GlJpeetyN6yEAYrIOPlPLg-1; Mon, 12 Apr 2021 04:27:38 -0400
X-MC-Unique: GlJpeetyN6yEAYrIOPlPLg-1
Received: by mail-pg1-f199.google.com with SMTP id m5so5850212pgm.11
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 01:27:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8/F6U9aDnaryN8IDSgqu6Yd6GDsy7N4pJFGS7Yl27yc=;
 b=e51OqogZ1D2sk2qAu3BCTFQwFG0LA9YvKFbI4Kj9087eJ2Plu5+/gjW9PPaPeC7+SU
 LO1c/vS4891dVaYTvpsfhe8kDlloLwA46tbwV/ij4EsYo7K75zTpn3uaYD7B2cvY6u/+
 d1jWnLVlooCpWJbBtqmBGQadMGAL6vM1VULTMaJ8s8p/26mY82gM3U5LKml8ypBxV2Kj
 o/5lEYI3Hr77n7x5uizWDuNg+UVTlkNf3JfipTtN8lJJ+OYN7WzttUnEbFcHkMK7mvBH
 St9RUM9k7efxWxAjRc2qAQ06wvZfbnpeCq93YDQY/lRMgXBDaODw8zKNqbj3cs6PtlWJ
 mQRQ==
X-Gm-Message-State: AOAM5339cWGthATc/bo64SF+1WuLrIKFZv6vfUvXFg978XiSyRfPqX4e
 h6BxHDRwXg0hToeskeZcevaKTLSaPkL3DX+cMx6iMA05yLBni8oRWPiv9r9mmPw4Gtsa0zD7Yff
 4k7XEPTpvMVckt26GLrI22tcl0ChT3LQ=
X-Received: by 2002:a65:5bca:: with SMTP id o10mr26228624pgr.248.1618216057312; 
 Mon, 12 Apr 2021 01:27:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzIGm+FRKbviWc3z2oN31iLDPKwdCmUoIr/Q22RxuFHJsrsC77fapyxcC95DTI38txtqzFhb61E9MPqZGQ9dpE=
X-Received: by 2002:a65:5bca:: with SMTP id o10mr26228603pgr.248.1618216056999; 
 Mon, 12 Apr 2021 01:27:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210408093824.14985-1-lulu@redhat.com>
 <20210408093824.14985-7-lulu@redhat.com>
 <24719d4b-824b-3f0c-2322-71b53a6e8c3d@redhat.com>
In-Reply-To: <24719d4b-824b-3f0c-2322-71b53a6e8c3d@redhat.com>
From: Cindy Lu <lulu@redhat.com>
Date: Mon, 12 Apr 2021 16:27:00 +0800
Message-ID: <CACLfguX_swvzuHDihYMAhOh5vALcMZ_g7XdzgpSxp8FF10z+Wg@mail.gmail.com>
Subject: Re: [PATCH v5 6/6] virtio-pci: add support for configure interrupt
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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

On Fri, Apr 9, 2021 at 3:39 PM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2021/4/8 =E4=B8=8B=E5=8D=885:38, Cindy Lu =E5=86=99=E9=81=93:
> > Add support for configure interrupt, use kvm_irqfd_assign and set the
> > gsi to kernel. When the configure notifier was eventfd_signal by host
> > kernel, this will finally inject an msix interrupt to guest
> >
> > Signed-off-by: Cindy Lu <lulu@redhat.com>
> > ---
> >   hw/virtio/virtio-pci.c | 91 ++++++++++++++++++++++++++++++++++++++++-=
-
> >   1 file changed, 88 insertions(+), 3 deletions(-)
> >
> > diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> > index 481f6e7505..7b02f42c06 100644
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
> > @@ -726,7 +725,7 @@ static int kvm_virtio_pci_vector_use(VirtIOPCIProxy=
 *proxy, int nvqs)
> >           if (vector >=3D msix_nr_vectors_allocated(dev)) {
> >               continue;
> >           }
> > -        ret =3D kvm_virtio_pci_vq_vector_use(proxy, queue_no, vector);
> > +        ret =3D kvm_virtio_pci_vq_vector_use(proxy,  vector);
> >           if (ret < 0) {
> >               goto undo;
> >           }
> > @@ -760,6 +759,56 @@ undo:
> >       }
> >       return ret;
> >   }
> > +static int kvm_virtio_pci_vector_config_use(VirtIOPCIProxy *proxy)
> > +{
> > +    VirtIODevice *vdev =3D virtio_bus_get_device(&proxy->bus);
> > +    unsigned int vector;
> > +    int ret;
> > +    EventNotifier *n =3D virtio_get_config_notifier(vdev);
> > +    vector =3D vdev->config_vector ;
> > +    ret =3D kvm_virtio_pci_vq_vector_use(proxy, vector);
> > +    if (ret < 0) {
> > +        goto undo;
> > +    }
> > +    ret =3D kvm_virtio_pci_irqfd_use(proxy,  n, vector);
>
>
> So the kvm_virtio_pci_vector_use() has the following codes:
>
>          /* If guest supports masking, set up irqfd now.
>           * Otherwise, delay until unmasked in the frontend.
>           */
>          if (vdev->use_guest_notifier_mask && k->guest_notifier_mask) {
>              vq =3D virtio_get_queue(vdev, queue_no);
>              n =3D virtio_queue_get_guest_notifier(vq);
>              ret =3D kvm_virtio_pci_irqfd_use(proxy, n, vector);
>              if (ret < 0) {
>                  kvm_virtio_pci_vq_vector_release(proxy, vector);
>                  goto undo;
>              }
>          }
>
> Do we need to check the masking support here as well?
>
> Btw, I think we can factor out the core logic (decouple the queue_no) of
> kvm_virtio_pci_vector_user() and let it be reused by config interrupt.
>
sure , I will rewrite this part
>
> > +    if (ret < 0) {
> > +        goto undo;
> > +    }
> > +    return 0;
> > +undo:
> > +    kvm_virtio_pci_irqfd_release(proxy, n, vector);
> > +    return ret;
> > +}
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
>
>
> So let's try to unify the codes between this and
> virtio_queue_set_guest_notifier_fd_handler(). Bascailly it's just
> decouple virtqueue *.
>
sure will fix this
>
> > +        kvm_virtio_pci_vector_config_release(proxy);
> > +        event_notifier_cleanup(notifier);
> > +    }
> > +    return r;
> > +}
> >
> >   static void kvm_virtio_pci_vector_release(VirtIOPCIProxy *proxy, int =
nvqs)
> >   {
> > @@ -858,6 +907,14 @@ static int virtio_pci_vector_unmask(PCIDevice *dev=
, unsigned vector,
> >       EventNotifier *n;
> >       int ret, index, unmasked =3D 0;
> >
> > +   if (vdev->use_config_notifier =3D=3D true) {
> > +        n =3D virtio_get_config_notifier(vdev);
> > +        ret =3D virtio_pci_vq_vector_unmask(proxy, 0, vector, msg,
> > +                    VIRTIO_CONFIG_VECTOR, n);
> > +        if (ret < 0) {
> > +            goto config_undo;
> > +       }
> > +    }
> >       while (vq) {
> >           index =3D virtio_get_queue_index(vq);
> >           if (!virtio_queue_get_num(vdev, index)) {
> > @@ -889,6 +946,10 @@ undo:
> >           }
> >           vq =3D virtio_vector_next_queue(vq);
> >       }
> > + config_undo:
> > +            n =3D virtio_get_config_notifier(vdev);
> > +            virtio_pci_vq_vector_mask(proxy, 0, vector,
> > +                VIRTIO_CONFIG_VECTOR, n);
> >       return ret;
> >   }
> >
> > @@ -900,6 +961,10 @@ static void virtio_pci_vector_mask(PCIDevice *dev,=
 unsigned vector)
> >       EventNotifier *n;
> >       int index;
> >
> > +   if (vdev->use_config_notifier =3D=3D true) {
>
>
> Is this sufficient to know the vector is used by config interrupt?
>
>
> > +        n =3D virtio_get_config_notifier(vdev);
> > +        virtio_pci_vq_vector_mask(proxy, 0, vector, VIRTIO_CONFIG_VECT=
OR, n);
> > +   }
> >       while (vq) {
> >           index =3D virtio_get_queue_index(vq);
> >            n =3D virtio_queue_get_guest_notifier(vq);
> > @@ -945,6 +1010,21 @@ static void virtio_pci_vector_poll(PCIDevice *dev=
,
> >               msix_set_pending(dev, vector);
> >           }
> >       }
> > +   if (vdev->use_config_notifier =3D=3D true) {
> > +        vector =3D vdev->config_vector;
> > +        notifier =3D virtio_get_config_notifier(vdev);
> > +        if (vector < vector_start || vector >=3D vector_end ||
> > +            !msix_is_masked(dev, vector)) {
> > +            return;
> > +        }
> > +        if (k->guest_notifier_pending) {
> > +            if (k->guest_notifier_pending(vdev, 0,  VIRTIO_CONFIG_VECT=
OR)) {
> > +                msix_set_pending(dev, vector);
> > +            }
> > +        } else if (event_notifier_test_and_clear(notifier)) {
> > +            msix_set_pending(dev, vector);
> > +        }
> > +    }
>
>
> Let's unify the code here with the code that deal with vq vectors in the
> loop above.
>
> Thanks
>
>
> >   }
> >
> >   static int virtio_pci_set_guest_notifier(DeviceState *d, int n, bool =
assign,
> > @@ -1032,6 +1112,10 @@ static int virtio_pci_set_guest_notifiers(Device=
State *d, int nvqs, bool assign)
> >                   goto assign_error;
> >               }
> >           }
> > +            r =3D virtio_pci_set_config_notifier(d, assign);
> > +            if (r < 0) {
> > +                goto config_error;
> > +         }
> >           r =3D msix_set_vector_notifiers(&proxy->pci_dev,
> >                                         virtio_pci_vector_unmask,
> >                                         virtio_pci_vector_mask,
> > @@ -1048,7 +1132,8 @@ notifiers_error:
> >           assert(assign);
> >           kvm_virtio_pci_vector_release(proxy, nvqs);
> >       }
> > -
> > + config_error:
> > +        kvm_virtio_pci_vector_config_release(proxy);
> >   assign_error:
> >       /* We get here on assignment failure. Recover by undoing for VQs =
0 .. n. */
> >       assert(assign);
>


