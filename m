Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23139625549
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 09:29:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otP5I-0000sE-TF; Fri, 11 Nov 2022 03:08:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1otP4M-0000ju-Tp
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:07:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1otP4I-000210-OV
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 03:07:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668154037;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQhQZEOZISlk9fKQJ7Er8qzmYInHW1XL7RMaTIOM9O0=;
 b=braTB18U47lK5fWlc4lur1b8R6TfkgoFZ0A7OqZe7vX+cjP3plMK3AcpIfQkzPP2M9HaWg
 BunZg+QRsFExar7Ui4peeGE0LUwd8QeRO56P9YvLJlMbH28YGma/rKPgfNbtxaCyoMB0Qo
 Ml77FYL3Q9y9suzJWkgTGUQhXRRzkf8=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-208-uFsfpajJO0ynFpH-33gqnA-1; Fri, 11 Nov 2022 03:07:16 -0500
X-MC-Unique: uFsfpajJO0ynFpH-33gqnA-1
Received: by mail-ed1-f72.google.com with SMTP id
 b14-20020a056402278e00b004621a2642d7so3138126ede.1
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 00:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RQhQZEOZISlk9fKQJ7Er8qzmYInHW1XL7RMaTIOM9O0=;
 b=SvQYeIvxZcZKDFqW0QlAUsY4ei9iQH8ZV5pRssSmUZjBPD2ouj/zWC0swBjklBCAGG
 Grwcui2xgC+y6c1/qDt2DGp3RbQv/ysNQwj81MysogEmFEDPUUOw7GLBTv14mOUbFso9
 GBB4SURad2QQraAWOtKSq3DaQFk1IzNHR5w3iIf5wd3MuusXHsayAqCLzlS8tRD+m3Sa
 OcSG0tmSvkisxWGn70I7/sAZAA68CJA65xGtoyewdMaljhvYsEAxcTZuUdbJvhi0T+Wt
 EgtzpmUKHS0scQHSZXam3BJmzx9H/r0sqa/4YARcCKCM/vkMY+KazbrHP6fVRyWTPwtn
 Rnxg==
X-Gm-Message-State: ANoB5pmeTUIkKJhh3SrnzlISVj9lLK+hLl1hMa68RS7D3yNwEAbWvQtA
 U4aBfYBgCUFWVJuy9Ms8P+vi/+mGQ3tombzZIjULBCNS5llMxt+Jmo78cWZBjh9pV3zv5rAK6Ju
 NEJKJC2ReGw+g4t6d75ZqHddXRhH19ro=
X-Received: by 2002:a17:906:1441:b0:7ad:b97e:283a with SMTP id
 q1-20020a170906144100b007adb97e283amr917689ejc.567.1668154035220; 
 Fri, 11 Nov 2022 00:07:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6jlYB1kbLtX8DBOQc7h3daJWakOmzPyV9ncSZ+waj/yiY9Qh36VCyaVkKNf//Hy76iSo3i+6rUBIHtBmsq+Y8=
X-Received: by 2002:a17:906:1441:b0:7ad:b97e:283a with SMTP id
 q1-20020a170906144100b007adb97e283amr917655ejc.567.1668154034930; Fri, 11 Nov
 2022 00:07:14 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-6-eperezma@redhat.com>
 <56bfad97-74d2-8570-c391-83ecf9965cfd@redhat.com>
 <CAJaqyWd47QdBoSm9RdF2yx21hKv_=YRp3uvP13Qb9PaVksss7Q@mail.gmail.com>
 <aa82783b-b1f5-a82b-5136-1f7f7725a433@redhat.com>
 <CAJaqyWfmTn1_o2z2S_o=bu2mD=r0+T=1+dh_WOwbpQaYQK0YSQ@mail.gmail.com>
In-Reply-To: <CAJaqyWfmTn1_o2z2S_o=bu2mD=r0+T=1+dh_WOwbpQaYQK0YSQ@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 11 Nov 2022 16:07:01 +0800
Message-ID: <CACGkMEvQm_0VqF5q2XtWmaHXmSj0Xjg7br3ydOQVVcHJ0yb_GA@mail.gmail.com>
Subject: Re: [PATCH v6 05/10] vdpa: move SVQ vring features check to net/
To: Eugenio Perez Martin <eperezma@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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

On Fri, Nov 11, 2022 at 3:56 PM Eugenio Perez Martin
<eperezma@redhat.com> wrote:
>
> On Fri, Nov 11, 2022 at 8:34 AM Jason Wang <jasowang@redhat.com> wrote:
> >
> >
> > =E5=9C=A8 2022/11/10 21:09, Eugenio Perez Martin =E5=86=99=E9=81=93:
> > > On Thu, Nov 10, 2022 at 6:40 AM Jason Wang <jasowang@redhat.com> wrot=
e:
> > >>
> > >> =E5=9C=A8 2022/11/9 01:07, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > >>> The next patches will start control SVQ if possible. However, we do=
n't
> > >>> know if that will be possible at qemu boot anymore.
> > >>
> > >> If I was not wrong, there's no device specific feature that is check=
ed
> > >> in the function. So it should be general enough to be used by device=
s
> > >> other than net. Then I don't see any advantage of doing this.
> > >>
> > > Because vhost_vdpa_init_svq is called at qemu boot, failing if it is
> > > not possible to shadow the Virtqueue.
> > >
> > > Now the CVQ will be shadowed if possible, so we need to check this at
> > > device start, not at initialization.
> >
> >
> > Any reason we can't check this at device start? We don't need
> > driver_features and we can do any probing to make sure cvq has an uniqu=
e
> > group during initialization time.
> >
>
> We need the CVQ index to check if it has an independent group. CVQ
> index depends on the features the guest's ack:
> * If it acks _F_MQ, it is the last one.
> * If it doesn't, CVQ idx is 2.
>
> We cannot have acked features at initialization, and they could
> change: It is valid for a guest to ack _F_MQ, then reset the device,
> then not ack it.

Can we do some probing by negotiating _F_MQ if the device offers it,
then we can know if cvq has a unique group?

>
> >
> > >   To store this information at boot
> > > time is not valid anymore, because v->shadow_vqs_enabled is not valid
> > > at this time anymore.
> >
> >
> > Ok, but this doesn't explain why it is net specific but vhost-vdpa spec=
ific.
> >
>
> We can try to move it to a vhost op, but we have the same problem as
> the svq array allocation: We don't have the right place in vhost ops
> to check this. Maybe vhost_set_features is the right one here?

If we can do all the probing at the initialization phase, we can do
everything there.

Thanks

>
> Thanks!
>
> > Thanks
> >
> >
> > >
> > > Thanks!
> > >
> > >> Thanks
> > >>
> > >>
> > >>> Since the moved checks will be already evaluated at net/ to know if=
 it
> > >>> is ok to shadow CVQ, move them.
> > >>>
> > >>> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > >>> ---
> > >>>    hw/virtio/vhost-vdpa.c | 33 ++-------------------------------
> > >>>    net/vhost-vdpa.c       |  3 ++-
> > >>>    2 files changed, 4 insertions(+), 32 deletions(-)
> > >>>
> > >>> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > >>> index 3df2775760..146f0dcb40 100644
> > >>> --- a/hw/virtio/vhost-vdpa.c
> > >>> +++ b/hw/virtio/vhost-vdpa.c
> > >>> @@ -402,29 +402,9 @@ static int vhost_vdpa_get_dev_features(struct =
vhost_dev *dev,
> > >>>        return ret;
> > >>>    }
> > >>>
> > >>> -static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhos=
t_vdpa *v,
> > >>> -                               Error **errp)
> > >>> +static void vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vho=
st_vdpa *v)
> > >>>    {
> > >>>        g_autoptr(GPtrArray) shadow_vqs =3D NULL;
> > >>> -    uint64_t dev_features, svq_features;
> > >>> -    int r;
> > >>> -    bool ok;
> > >>> -
> > >>> -    if (!v->shadow_vqs_enabled) {
> > >>> -        return 0;
> > >>> -    }
> > >>> -
> > >>> -    r =3D vhost_vdpa_get_dev_features(hdev, &dev_features);
> > >>> -    if (r !=3D 0) {
> > >>> -        error_setg_errno(errp, -r, "Can't get vdpa device features=
");
> > >>> -        return r;
> > >>> -    }
> > >>> -
> > >>> -    svq_features =3D dev_features;
> > >>> -    ok =3D vhost_svq_valid_features(svq_features, errp);
> > >>> -    if (unlikely(!ok)) {
> > >>> -        return -1;
> > >>> -    }
> > >>>
> > >>>        shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_fr=
ee);
> > >>>        for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > >>> @@ -436,7 +416,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev=
 *hdev, struct vhost_vdpa *v,
> > >>>        }
> > >>>
> > >>>        v->shadow_vqs =3D g_steal_pointer(&shadow_vqs);
> > >>> -    return 0;
> > >>>    }
> > >>>
> > >>>    static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, =
Error **errp)
> > >>> @@ -461,11 +440,7 @@ static int vhost_vdpa_init(struct vhost_dev *d=
ev, void *opaque, Error **errp)
> > >>>        dev->opaque =3D  opaque ;
> > >>>        v->listener =3D vhost_vdpa_memory_listener;
> > >>>        v->msg_type =3D VHOST_IOTLB_MSG_V2;
> > >>> -    ret =3D vhost_vdpa_init_svq(dev, v, errp);
> > >>> -    if (ret) {
> > >>> -        goto err;
> > >>> -    }
> > >>> -
> > >>> +    vhost_vdpa_init_svq(dev, v);
> > >>>        vhost_vdpa_get_iova_range(v);
> > >>>
> > >>>        if (!vhost_vdpa_first_dev(dev)) {
> > >>> @@ -476,10 +451,6 @@ static int vhost_vdpa_init(struct vhost_dev *d=
ev, void *opaque, Error **errp)
> > >>>                                   VIRTIO_CONFIG_S_DRIVER);
> > >>>
> > >>>        return 0;
> > >>> -
> > >>> -err:
> > >>> -    ram_block_discard_disable(false);
> > >>> -    return ret;
> > >>>    }
> > >>>
> > >>>    static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *de=
v,
> > >>> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > >>> index d3b1de481b..fb35b17ab4 100644
> > >>> --- a/net/vhost-vdpa.c
> > >>> +++ b/net/vhost-vdpa.c
> > >>> @@ -117,9 +117,10 @@ static bool vhost_vdpa_net_valid_svq_features(=
uint64_t features, Error **errp)
> > >>>        if (invalid_dev_features) {
> > >>>            error_setg(errp, "vdpa svq does not work with features 0=
x%" PRIx64,
> > >>>                       invalid_dev_features);
> > >>> +        return false;
> > >>>        }
> > >>>
> > >>> -    return !invalid_dev_features;
> > >>> +    return vhost_svq_valid_features(features, errp);
> > >>>    }
> > >>>
> > >>>    static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
> >
>


