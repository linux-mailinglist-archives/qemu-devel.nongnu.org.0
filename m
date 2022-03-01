Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9321A4C9493
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:42:24 +0100 (CET)
Received: from localhost ([::1]:53418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8O4-0007vT-Ez
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:42:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nP81Z-000220-Or
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:19:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47915)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nP81W-0002u4-4B
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646162340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=krknxkoOXHRBTpDf5OhGx/3+pORL0q8mFvuIS9LpG9s=;
 b=h7iasWifJDveJegbgFpkt9qH/OaEkrk99Q487vVxCyTCn2HvcY9SWkyh6j8ZjeL5JtqGvn
 jssFwtYt1vd71yws4+AUyQ8ypLXLqtEwL3lazIg1tOUewG564ZBYCWiDljCqg4DMmuAFi/
 NakWRxjc8kXozLBYRUdQKJVMlmpvKVI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-52-i6BcGrEUMtanzTtj_Wp4mA-1; Tue, 01 Mar 2022 14:18:59 -0500
X-MC-Unique: i6BcGrEUMtanzTtj_Wp4mA-1
Received: by mail-qk1-f198.google.com with SMTP id
 199-20020a3703d0000000b005f17c5b0356so14629443qkd.16
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 11:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=krknxkoOXHRBTpDf5OhGx/3+pORL0q8mFvuIS9LpG9s=;
 b=NghakgJBUfTwwc6PeZVI0HqB/g1+xRslfobg5iF3XvZYhAUPAWWa8EhSTMFaFqwiwH
 udAVQIU6gehz4wFLC54RzRoB/ZtkAi5RZfTnGztXYP1DibO8iZA2Z+wzOhvtxpBeXJCR
 IyOrikS0EKl3PGMQbFKykie5kg+zwmSbnL5lQkFRWQW4xaSg+0edFClp616EnqnG1EhN
 hqNNVxVIsxYylAR9CHdonDPCux58mBa/9yWG0UuexTfmG/VLcmCsFLWV1fHWazliuRsc
 jVT6+0QFktgq3gH5A+14IdUEdBIqPfjMypAkE2+GsbGXSLU7+E3rfdkxljrDg1BDrSMz
 6oww==
X-Gm-Message-State: AOAM5319/x5ssig7F3jCcbRGnc3Ev4PSCw7ZAkrrAE8Cu05wZ0mR3ruQ
 AOnPtub4MOhuIANVQpIY2XZqgjKNrc93YoLSQlcS3qwW9TNw5kynXySZpcbGKPDEv6HtAEc1S9+
 s2mYdvTF0Oi0NQ8qc/nPtHl5MHQ24MIE=
X-Received: by 2002:ac8:7dc6:0:b0:2de:708:3e3a with SMTP id
 c6-20020ac87dc6000000b002de07083e3amr21444336qte.459.1646162339340; 
 Tue, 01 Mar 2022 11:18:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJynK5ucDOHj25eWoFL5TFT346DzWpkXX4CprFmBSJATF9RcW4hrLo2/B9CXlmhBvHAOadkuZF2vsrcPZ7T6tTo=
X-Received: by 2002:ac8:7dc6:0:b0:2de:708:3e3a with SMTP id
 c6-20020ac87dc6000000b002de07083e3amr21444307qte.459.1646162339035; Tue, 01
 Mar 2022 11:18:59 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-5-eperezma@redhat.com>
 <562b97bc-860e-b2e6-0f45-945a75c25da5@redhat.com>
In-Reply-To: <562b97bc-860e-b2e6-0f45-945a75c25da5@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Mar 2022 20:18:23 +0100
Message-ID: <CAJaqyWc2uX2PH=s_2Gre+Ffq_EcbQLbacnbsG47Cim8=hPa85w@mail.gmail.com>
Subject: Re: [PATCH v2 04/14] vhost: Add vhost_svq_valid_features to shadow vq
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-level <qemu-devel@nongnu.org>,
 Peter Xu <peterx@redhat.com>,
 virtualization <virtualization@lists.linux-foundation.org>,
 Eli Cohen <eli@mellanox.com>, Eric Blake <eblake@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Cindy Lu <lulu@redhat.com>,
 "Fangyi \(Eric\)" <eric.fangyi@huawei.com>,
 Markus Armbruster <armbru@redhat.com>, yebiaoxiang@huawei.com,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gautam Dawar <gdawar@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 28, 2022 at 4:25 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:41, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > This allows SVQ to negotiate features with the guest and the device. Fo=
r
> > the device, SVQ is a driver. While this function bypasses all
> > non-transport features, it needs to disable the features that SVQ does
> > not support when forwarding buffers. This includes packed vq layout,
> > indirect descriptors or event idx.
> >
> > Future changes can add support to offer more features to the guest,
> > since the use of VirtQueue gives this for free. This is left out at the
> > moment for simplicity.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-shadow-virtqueue.h |  2 ++
> >   hw/virtio/vhost-shadow-virtqueue.c | 39 +++++++++++++++++++++++++++++=
+
> >   hw/virtio/vhost-vdpa.c             | 18 ++++++++++++++
> >   3 files changed, 59 insertions(+)
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shado=
w-virtqueue.h
> > index 1d4c160d0a..84747655ad 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.h
> > +++ b/hw/virtio/vhost-shadow-virtqueue.h
> > @@ -33,6 +33,8 @@ typedef struct VhostShadowVirtqueue {
> >       EventNotifier svq_call;
> >   } VhostShadowVirtqueue;
> >
> > +bool vhost_svq_valid_features(uint64_t *features);
> > +
> >   void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kic=
k_fd);
> >   void vhost_svq_set_guest_call_notifier(VhostShadowVirtqueue *svq, int=
 call_fd);
> >
> > diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shado=
w-virtqueue.c
> > index 54c701a196..34354aea2c 100644
> > --- a/hw/virtio/vhost-shadow-virtqueue.c
> > +++ b/hw/virtio/vhost-shadow-virtqueue.c
> > @@ -14,6 +14,45 @@
> >   #include "qemu/main-loop.h"
> >   #include "linux-headers/linux/vhost.h"
> >
> > +/**
> > + * Validate the transport device features that both guests can use wit=
h the SVQ
> > + * and SVQs can use with the device.
> > + *
> > + * @dev_features  The features. If success, the acknowledged features.=
 If
> > + *                failure, the minimal set from it.
> > + *
> > + * Returns true if SVQ can go with a subset of these, false otherwise.
> > + */
> > +bool vhost_svq_valid_features(uint64_t *features)
> > +{
> > +    bool r =3D true;
> > +
> > +    for (uint64_t b =3D VIRTIO_TRANSPORT_F_START; b <=3D VIRTIO_TRANSP=
ORT_F_END;
> > +         ++b) {
> > +        switch (b) {
> > +        case VIRTIO_F_ANY_LAYOUT:
> > +            continue;
> > +
> > +        case VIRTIO_F_ACCESS_PLATFORM:
> > +            /* SVQ trust in the host's IOMMU to translate addresses */
> > +        case VIRTIO_F_VERSION_1:
> > +            /* SVQ trust that the guest vring is little endian */
> > +            if (!(*features & BIT_ULL(b))) {
> > +                set_bit(b, features);
> > +                r =3D false;
> > +            }
> > +            continue;
>
>
> It looks to me the *features is only used for logging errors, if this is
> the truth. I suggest to do error_setg in this function instead of
> letting the caller to pass a pointer.
>

I'm fine with passing the Error pointer, but it's not only used for
logging: if SVQ is enabled, the feature set of the device and the
guest is also checked against this.

For example if the vdpa device supports event_idx, this is the
function that the caller uses to filter out that feature bit. Same
with indirect, packed, and all unknown transport ones. It's different
from device's features like CVQ, where this function does not apply.

Now that this is stated, I think the cover letter should reflect that
better, and that this function should include a verb in its name.
Maybe vhost_svq_filter_valid_transport_features is more appropriate.
Let me know if you see that way too.

>
> > +
> > +        default:
> > +            if (*features & BIT_ULL(b)) {
> > +                clear_bit(b, features);
> > +            }
>
>
> Do we need to check indirect and event idx here?
>

These are simply cleared at this moment.

Thanks!

> Thanks
>
>
> > +        }
> > +    }
> > +
> > +    return r;
> > +}
> > +
> >   /** Forward guest notifications */
> >   static void vhost_handle_guest_kick(EventNotifier *n)
> >   {
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index c73215751d..d614c435f3 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -348,11 +348,29 @@ static int vhost_vdpa_init_svq(struct vhost_dev *=
hdev, struct vhost_vdpa *v,
> >                                  Error **errp)
> >   {
> >       g_autoptr(GPtrArray) shadow_vqs =3D NULL;
> > +    uint64_t dev_features, svq_features;
> > +    int r;
> > +    bool ok;
> >
> >       if (!v->shadow_vqs_enabled) {
> >           return 0;
> >       }
> >
> > +    r =3D hdev->vhost_ops->vhost_get_features(hdev, &dev_features);
> > +    if (r !=3D 0) {
> > +        error_setg_errno(errp, -r, "Can't get vdpa device features");
> > +        return r;
> > +    }
> > +
> > +    svq_features =3D dev_features;
> > +    ok =3D vhost_svq_valid_features(&svq_features);
> > +    if (unlikely(!ok)) {
> > +        error_setg(errp,
> > +            "SVQ Invalid device feature flags, offer: 0x%"PRIx64", ok:=
 0x%"PRIx64,
> > +            dev_features, svq_features);
> > +        return -1;
> > +    }
> > +
> >       shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
> >       for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> >           g_autoptr(VhostShadowVirtqueue) svq =3D vhost_svq_new();
>


