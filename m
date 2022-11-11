Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203FF62551E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:21:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otOtu-0001Ko-SH; Fri, 11 Nov 2022 02:56:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1otOtr-0001J5-2c
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:56:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1otOtp-0004Qd-DQ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 02:56:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668153388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UnTFHda/akjWgwzpX/PE2gG9WoMnoW6YdEZHH3/oXhA=;
 b=b0kFjco/D3tiDcc1NeN4LN+tj9tWIWlnItUIrlMz822T3Gm1VFEeHwmXYG/he/dS4EalP7
 xUsh6ITAwC2CMP/IkjLZ0/5w0kEOS0sWc48XicDwC6e5h1q96i4LAo1F0MFExQ+YCQ1LjY
 fTkcfvAa2fbunhe8Dw6wPqajPC0h9Bc=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-498-gEsZTQXoMZSnM9onOqYxwA-1; Fri, 11 Nov 2022 02:56:25 -0500
X-MC-Unique: gEsZTQXoMZSnM9onOqYxwA-1
Received: by mail-pg1-f197.google.com with SMTP id
 e128-20020a636986000000b0047075a1c725so2290627pgc.19
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 23:56:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UnTFHda/akjWgwzpX/PE2gG9WoMnoW6YdEZHH3/oXhA=;
 b=Xg3not0ingNgeOi8aMy4eXed1t3xYDXi3Cbo4MXoLnerSka9y6kK/fnS5/Fl8+zr0f
 1sbPt07Firq+FqSx3uCZ4jhFPCq8EogRFiNgyTsoihtawMMvFPpD6skIpy61pddNlmA2
 nYGVuZ1jAdwpiKWB0X7MOAsQ8BlfFTyUQfsHYrtJNStXCVjtTpJWBW3pK/f7IQoBoOco
 gmsilwK84a+2yWKddutLzuSsFvUw0UpnLWqhXTWwCXF/Q6D+3mn0r56dfDxSzuBYzkCw
 IJWS8cQr8yfLFAwCpRq/w9d9Eo27cHtJfDuDvDE2tZUgOp82hZWNhZkZxyeVt+BtlXOF
 If6w==
X-Gm-Message-State: ANoB5pkI12m+taNDOJCLpd3cxShjpsP/0d/w3oLYmpV7f6b8PYT6vQkM
 7gIpccPVAxUymg/Ousn7QzWEVXaBjFQOKrwYAOVOWD/c6oe7yt+L1HDjutyYD7hGwKaFRTPxDC7
 cN/MCEKDSu/g+MrGLTNWEM4YPZakChEs=
X-Received: by 2002:a63:535e:0:b0:46f:98cf:3bb6 with SMTP id
 t30-20020a63535e000000b0046f98cf3bb6mr667012pgl.332.1668153384529; 
 Thu, 10 Nov 2022 23:56:24 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6zj1smmqmQGSImMBVUk1UvMmcC8P5xYJwYwpl7RXo60Jkv/KNrmV2ZAEYOYogj39nEjkRMlN4zw6vJdgQTQH4=
X-Received: by 2002:a63:535e:0:b0:46f:98cf:3bb6 with SMTP id
 t30-20020a63535e000000b0046f98cf3bb6mr666975pgl.332.1668153384152; Thu, 10
 Nov 2022 23:56:24 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-6-eperezma@redhat.com>
 <56bfad97-74d2-8570-c391-83ecf9965cfd@redhat.com>
 <CAJaqyWd47QdBoSm9RdF2yx21hKv_=YRp3uvP13Qb9PaVksss7Q@mail.gmail.com>
 <aa82783b-b1f5-a82b-5136-1f7f7725a433@redhat.com>
In-Reply-To: <aa82783b-b1f5-a82b-5136-1f7f7725a433@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Fri, 11 Nov 2022 08:55:48 +0100
Message-ID: <CAJaqyWfmTn1_o2z2S_o=bu2mD=r0+T=1+dh_WOwbpQaYQK0YSQ@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] vdpa: move SVQ vring features check to net/
To: Jason Wang <jasowang@redhat.com>
Cc: qemu-devel@nongnu.org, Parav Pandit <parav@mellanox.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>, 
 Laurent Vivier <lvivier@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>, 
 Cindy Lu <lulu@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, 
 Zhu Lingshan <lingshan.zhu@intel.com>, kvm@vger.kernel.org, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

On Fri, Nov 11, 2022 at 8:34 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/11/10 21:09, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > On Thu, Nov 10, 2022 at 6:40 AM Jason Wang <jasowang@redhat.com> wrote:
> >>
> >> =E5=9C=A8 2022/11/9 01:07, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> >>> The next patches will start control SVQ if possible. However, we don'=
t
> >>> know if that will be possible at qemu boot anymore.
> >>
> >> If I was not wrong, there's no device specific feature that is checked
> >> in the function. So it should be general enough to be used by devices
> >> other than net. Then I don't see any advantage of doing this.
> >>
> > Because vhost_vdpa_init_svq is called at qemu boot, failing if it is
> > not possible to shadow the Virtqueue.
> >
> > Now the CVQ will be shadowed if possible, so we need to check this at
> > device start, not at initialization.
>
>
> Any reason we can't check this at device start? We don't need
> driver_features and we can do any probing to make sure cvq has an unique
> group during initialization time.
>

We need the CVQ index to check if it has an independent group. CVQ
index depends on the features the guest's ack:
* If it acks _F_MQ, it is the last one.
* If it doesn't, CVQ idx is 2.

We cannot have acked features at initialization, and they could
change: It is valid for a guest to ack _F_MQ, then reset the device,
then not ack it.

>
> >   To store this information at boot
> > time is not valid anymore, because v->shadow_vqs_enabled is not valid
> > at this time anymore.
>
>
> Ok, but this doesn't explain why it is net specific but vhost-vdpa specif=
ic.
>

We can try to move it to a vhost op, but we have the same problem as
the svq array allocation: We don't have the right place in vhost ops
to check this. Maybe vhost_set_features is the right one here?

Thanks!

> Thanks
>
>
> >
> > Thanks!
> >
> >> Thanks
> >>
> >>
> >>> Since the moved checks will be already evaluated at net/ to know if i=
t
> >>> is ok to shadow CVQ, move them.
> >>>
> >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> >>> ---
> >>>    hw/virtio/vhost-vdpa.c | 33 ++-------------------------------
> >>>    net/vhost-vdpa.c       |  3 ++-
> >>>    2 files changed, 4 insertions(+), 32 deletions(-)
> >>>
> >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> >>> index 3df2775760..146f0dcb40 100644
> >>> --- a/hw/virtio/vhost-vdpa.c
> >>> +++ b/hw/virtio/vhost-vdpa.c
> >>> @@ -402,29 +402,9 @@ static int vhost_vdpa_get_dev_features(struct vh=
ost_dev *dev,
> >>>        return ret;
> >>>    }
> >>>
> >>> -static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_=
vdpa *v,
> >>> -                               Error **errp)
> >>> +static void vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost=
_vdpa *v)
> >>>    {
> >>>        g_autoptr(GPtrArray) shadow_vqs =3D NULL;
> >>> -    uint64_t dev_features, svq_features;
> >>> -    int r;
> >>> -    bool ok;
> >>> -
> >>> -    if (!v->shadow_vqs_enabled) {
> >>> -        return 0;
> >>> -    }
> >>> -
> >>> -    r =3D vhost_vdpa_get_dev_features(hdev, &dev_features);
> >>> -    if (r !=3D 0) {
> >>> -        error_setg_errno(errp, -r, "Can't get vdpa device features")=
;
> >>> -        return r;
> >>> -    }
> >>> -
> >>> -    svq_features =3D dev_features;
> >>> -    ok =3D vhost_svq_valid_features(svq_features, errp);
> >>> -    if (unlikely(!ok)) {
> >>> -        return -1;
> >>> -    }
> >>>
> >>>        shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free=
);
> >>>        for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> >>> @@ -436,7 +416,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *=
hdev, struct vhost_vdpa *v,
> >>>        }
> >>>
> >>>        v->shadow_vqs =3D g_steal_pointer(&shadow_vqs);
> >>> -    return 0;
> >>>    }
> >>>
> >>>    static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Er=
ror **errp)
> >>> @@ -461,11 +440,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev=
, void *opaque, Error **errp)
> >>>        dev->opaque =3D  opaque ;
> >>>        v->listener =3D vhost_vdpa_memory_listener;
> >>>        v->msg_type =3D VHOST_IOTLB_MSG_V2;
> >>> -    ret =3D vhost_vdpa_init_svq(dev, v, errp);
> >>> -    if (ret) {
> >>> -        goto err;
> >>> -    }
> >>> -
> >>> +    vhost_vdpa_init_svq(dev, v);
> >>>        vhost_vdpa_get_iova_range(v);
> >>>
> >>>        if (!vhost_vdpa_first_dev(dev)) {
> >>> @@ -476,10 +451,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev=
, void *opaque, Error **errp)
> >>>                                   VIRTIO_CONFIG_S_DRIVER);
> >>>
> >>>        return 0;
> >>> -
> >>> -err:
> >>> -    ram_block_discard_disable(false);
> >>> -    return ret;
> >>>    }
> >>>
> >>>    static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
> >>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> >>> index d3b1de481b..fb35b17ab4 100644
> >>> --- a/net/vhost-vdpa.c
> >>> +++ b/net/vhost-vdpa.c
> >>> @@ -117,9 +117,10 @@ static bool vhost_vdpa_net_valid_svq_features(ui=
nt64_t features, Error **errp)
> >>>        if (invalid_dev_features) {
> >>>            error_setg(errp, "vdpa svq does not work with features 0x%=
" PRIx64,
> >>>                       invalid_dev_features);
> >>> +        return false;
> >>>        }
> >>>
> >>> -    return !invalid_dev_features;
> >>> +    return vhost_svq_valid_features(features, errp);
> >>>    }
> >>>
> >>>    static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
>


