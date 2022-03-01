Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5542C4C9492
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:41:56 +0100 (CET)
Received: from localhost ([::1]:52318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8Nf-0007AJ-8L
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:41:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nP8E0-00070z-1j
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:31:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nP8Dw-00088a-0N
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:31:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646163110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0w1MKgyQADZvPM9P0G01vh/f710FSyCtgIuJ1RSjlG4=;
 b=SGfEdOEVPqn9cPHiKsCQAFRLa840MKaCMIUv2lPAcxhUYExEChdx10ruSY01EJabXzPifl
 hjlNSRMyU9XWgTn58vufWxuTuVWiHFNQ+sRUY4rbd97s94O38QzbbRyHyNTX9Cx11Qs9ti
 74xK7xnZnSq3Zb7E31/beDGDGi7HUZw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-CcWmEF-yMm6P3sDy9TV-uQ-1; Tue, 01 Mar 2022 14:31:49 -0500
X-MC-Unique: CcWmEF-yMm6P3sDy9TV-uQ-1
Received: by mail-qv1-f72.google.com with SMTP id
 t18-20020a0cb712000000b004350812c194so2136463qvd.9
 for <qemu-devel@nongnu.org>; Tue, 01 Mar 2022 11:31:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0w1MKgyQADZvPM9P0G01vh/f710FSyCtgIuJ1RSjlG4=;
 b=xENicsLP07pYlgaBras8RfpEB7zhfdadVCK9vzTOtil/PXMt4CowUcOuMYOhuKToCa
 Z261+4eyBj2XISEimL0SoBbovBmK/wRNc5aVgA/TpT+vS8JYPrgfHTJFB76e3fQ5vFK8
 Ymxu/+fzolhOx+1rlnd1WO8hXLyLiiCvnldgZpk5CwFciTGkmwTe4DNLAh9oSyQwKnIe
 iIOMwaLgNjUk6YqXDrptuALqba49hEoIXIXunDxw/WNXPel9M/yg3Jd4sJ7IV+2bmOZ8
 +cLXbqtFlvSuuOHPrNgj291pn9Lv3xGPIC/Wt/0aErzkorYZ+rsa5hQxwRpv5ih+0T7E
 lY5Q==
X-Gm-Message-State: AOAM530xaunGPfuIkhWGW1UcB8q1kdVgeoOuSGi/L7QLw3cESWoz8Pvg
 LD+A5Oa6KInlJj/q4qhgWfeWvKcuJnm8wJWxb8X/eHXbTF22FE2AY9Pwfzy8SSbSQhSGGBkXXYM
 7Uz3+uDHCzTHMtHsWIaGKAFNZ5rO5voI=
X-Received: by 2002:a05:6214:19cd:b0:433:2eca:f77a with SMTP id
 j13-20020a05621419cd00b004332ecaf77amr5930603qvc.26.1646163109220; 
 Tue, 01 Mar 2022 11:31:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyHh8bO2MFNSBRzPcLfGoJteHKDJshPypowKoVDBoilBdltPghd2cwZculCPWJV3P+ryqHodC58PxxzdRLfgS8=
X-Received: by 2002:a05:6214:19cd:b0:433:2eca:f77a with SMTP id
 j13-20020a05621419cd00b004332ecaf77amr5930580qvc.26.1646163108878; Tue, 01
 Mar 2022 11:31:48 -0800 (PST)
MIME-Version: 1.0
References: <20220227134111.3254066-1-eperezma@redhat.com>
 <20220227134111.3254066-7-eperezma@redhat.com>
 <2457e208-0898-0dee-39c5-551fe2acb0fd@redhat.com>
In-Reply-To: <2457e208-0898-0dee-39c5-551fe2acb0fd@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Tue, 1 Mar 2022 20:31:12 +0100
Message-ID: <CAJaqyWcwEUu2bUEuVK2+R-FMg_TOhgYOwxDEoEzpnQtLdPptng@mail.gmail.com>
Subject: Re: [PATCH v2 06/14] vdpa: adapt vhost_ops callbacks to svq
To: Jason Wang <jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

On Mon, Feb 28, 2022 at 4:59 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/2/27 =E4=B8=8B=E5=8D=889:41, Eugenio P=C3=A9rez =E5=86=99=
=E9=81=93:
> > First half of the buffers forwarding part, preparing vhost-vdpa
> > callbacks to SVQ to offer it. QEMU cannot enable it at this moment, so
> > this is effectively dead code at the moment, but it helps to reduce
> > patch size.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 84 ++++++++++++++++++++++++++++++++++++-----=
-
> >   1 file changed, 73 insertions(+), 11 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index d614c435f3..b2c4e92fcf 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -344,6 +344,16 @@ static bool vhost_vdpa_one_time_request(struct vho=
st_dev *dev)
> >       return v->index !=3D 0;
> >   }
> >
> > +static int vhost_vdpa_get_dev_features(struct vhost_dev *dev,
> > +                                       uint64_t *features)
> > +{
> > +    int ret;
> > +
> > +    ret =3D vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
> > +    trace_vhost_vdpa_get_features(dev, *features);
> > +    return ret;
> > +}
> > +
> >   static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_v=
dpa *v,
> >                                  Error **errp)
> >   {
> > @@ -356,7 +366,7 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hd=
ev, struct vhost_vdpa *v,
> >           return 0;
> >       }
> >
> > -    r =3D hdev->vhost_ops->vhost_get_features(hdev, &dev_features);
> > +    r =3D vhost_vdpa_get_dev_features(hdev, &dev_features);
> >       if (r !=3D 0) {
> >           error_setg_errno(errp, -r, "Can't get vdpa device features");
> >           return r;
> > @@ -583,12 +593,26 @@ static int vhost_vdpa_set_mem_table(struct vhost_=
dev *dev,
> >   static int vhost_vdpa_set_features(struct vhost_dev *dev,
> >                                      uint64_t features)
> >   {
> > +    struct vhost_vdpa *v =3D dev->opaque;
> >       int ret;
> >
> >       if (vhost_vdpa_one_time_request(dev)) {
> >           return 0;
> >       }
> >
> > +    if (v->shadow_vqs_enabled) {
> > +        uint64_t features_ok =3D features;
> > +        bool ok;
> > +
> > +        ok =3D vhost_svq_valid_features(&features_ok);
> > +        if (unlikely(!ok)) {
> > +            error_report(
> > +                "Invalid guest acked feature flag, acked: 0x%"
> > +                PRIx64", ok: 0x%"PRIx64, features, features_ok);
> > +            return -EINVAL;
> > +        }
> > +    }
> > +
> >       trace_vhost_vdpa_set_features(dev, features);
> >       ret =3D vhost_vdpa_call(dev, VHOST_SET_FEATURES, &features);
> >       if (ret) {
> > @@ -735,6 +759,13 @@ static int vhost_vdpa_get_config(struct vhost_dev =
*dev, uint8_t *config,
> >       return ret;
> >    }
> >
> > +static int vhost_vdpa_set_dev_vring_base(struct vhost_dev *dev,
> > +                                         struct vhost_vring_state *rin=
g)
> > +{
> > +    trace_vhost_vdpa_set_vring_base(dev, ring->index, ring->num);
> > +    return vhost_vdpa_call(dev, VHOST_SET_VRING_BASE, ring);
> > +}
> > +
> >   static int vhost_vdpa_set_vring_dev_kick(struct vhost_dev *dev,
> >                                            struct vhost_vring_file *fil=
e)
> >   {
> > @@ -749,6 +780,18 @@ static int vhost_vdpa_set_vring_dev_call(struct vh=
ost_dev *dev,
> >       return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
> >   }
> >
> > +static int vhost_vdpa_set_vring_dev_addr(struct vhost_dev *dev,
> > +                                         struct vhost_vring_addr *addr=
)
> > +{
> > +    trace_vhost_vdpa_set_vring_addr(dev, addr->index, addr->flags,
> > +                                addr->desc_user_addr, addr->used_user_=
addr,
> > +                                addr->avail_user_addr,
> > +                                addr->log_guest_addr);
> > +
> > +    return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
> > +
> > +}
> > +
> >   /**
> >    * Set the shadow virtqueue descriptors to the device
> >    *
> > @@ -859,11 +902,17 @@ static int vhost_vdpa_set_log_base(struct vhost_d=
ev *dev, uint64_t base,
> >   static int vhost_vdpa_set_vring_addr(struct vhost_dev *dev,
> >                                          struct vhost_vring_addr *addr)
> >   {
> > -    trace_vhost_vdpa_set_vring_addr(dev, addr->index, addr->flags,
> > -                                    addr->desc_user_addr, addr->used_u=
ser_addr,
> > -                                    addr->avail_user_addr,
> > -                                    addr->log_guest_addr);
> > -    return vhost_vdpa_call(dev, VHOST_SET_VRING_ADDR, addr);
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +
> > +    if (v->shadow_vqs_enabled) {
> > +        /*
> > +         * Device vring addr was set at device start. SVQ base is hand=
led by
> > +         * VirtQueue code.
> > +         */
> > +        return 0;
> > +    }
> > +
> > +    return vhost_vdpa_set_vring_dev_addr(dev, addr);
> >   }
> >
> >   static int vhost_vdpa_set_vring_num(struct vhost_dev *dev,
> > @@ -876,8 +925,17 @@ static int vhost_vdpa_set_vring_num(struct vhost_d=
ev *dev,
> >   static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
> >                                          struct vhost_vring_state *ring=
)
> >   {
> > -    trace_vhost_vdpa_set_vring_base(dev, ring->index, ring->num);
> > -    return vhost_vdpa_call(dev, VHOST_SET_VRING_BASE, ring);
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +
> > +    if (v->shadow_vqs_enabled) {
> > +        /*
> > +         * Device vring base was set at device start. SVQ base is hand=
led by
> > +         * VirtQueue code.
> > +         */
> > +        return 0;
> > +    }
> > +
> > +    return vhost_vdpa_set_dev_vring_base(dev, ring);
> >   }
> >
> >   static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
> > @@ -924,10 +982,14 @@ static int vhost_vdpa_set_vring_call(struct vhost=
_dev *dev,
> >   static int vhost_vdpa_get_features(struct vhost_dev *dev,
> >                                        uint64_t *features)
> >   {
> > -    int ret;
> > +    struct vhost_vdpa *v =3D dev->opaque;
> > +    int ret =3D vhost_vdpa_get_dev_features(dev, features);
> > +
> > +    if (ret =3D=3D 0 && v->shadow_vqs_enabled) {
> > +        /* Filter only features that SVQ can offer to guest */
> > +        vhost_svq_valid_features(features);
>
>
> I think it's better not silently clear features here (e.g the feature
> could be explicitly enabled via cli). This may give more troubles in the
> future cross vendor/backend live migration.
>
> We can simple during vhost_vdpa init.
>

Do you mean to fail the initialization as long as the emulated device
feature set contains any other feature set than mandatory
VIRTIO_F_ACCESS_PLATFORM and VIRTIO_F_VERSION_1?

I think that it makes sense at this moment, I'll move to that for the
next version.

Thanks!

> Thanks
>
>
> > +    }
> >
> > -    ret =3D vhost_vdpa_call(dev, VHOST_GET_FEATURES, features);
> > -    trace_vhost_vdpa_get_features(dev, *features);
> >       return ret;
> >   }
> >
>


