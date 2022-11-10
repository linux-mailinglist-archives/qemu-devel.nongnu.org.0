Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 931CF6242F1
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Nov 2022 14:10:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ot7JX-0005vR-Dd; Thu, 10 Nov 2022 08:09:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ot7JU-0005v9-Tr
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:09:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ot7JT-0002Xo-52
 for qemu-devel@nongnu.org; Thu, 10 Nov 2022 08:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668085786;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7yzyeLEGg0cjDYwQZn2MaPQ/bepIB2IEoD4XBCdYOM=;
 b=VdPQwJTiykdNd9VxldGZwtp7pp3R6M9DYXkRHZmXZsV/cUApSZul3my/Um/PowMsLEPs8K
 pyt0ZJRbKgfKpossx7LZY+J5HngkHIIw71aN9MwBhCJdWw7/5DxlVr2oODejj/zFVpeBAm
 rPfuArpictcoD8CtsbKVk2YsznZfq3w=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-204-MDAEwRrPNASDczhskJGCsw-1; Thu, 10 Nov 2022 08:09:44 -0500
X-MC-Unique: MDAEwRrPNASDczhskJGCsw-1
Received: by mail-pg1-f200.google.com with SMTP id
 83-20020a630156000000b0046b208f6ae3so971767pgb.16
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 05:09:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g7yzyeLEGg0cjDYwQZn2MaPQ/bepIB2IEoD4XBCdYOM=;
 b=mJOgF0iIQbsIkAiQe/wyjM6EeLUs4md9olOSrlOGIjMJfUx9oRNvznx5xvAUQjkijf
 hprowF8g/OiIbjDShOsB1nuE0Dg/RC0vrEdB3xc4E1hJwxk7Sr+J9wn7wlkYirdsTKdF
 IwH9S+I1OlaRN6woRfGZKdt2TC7Uzjo9Wl9hZqja4IVFrbtRFcMeQtw9CpC831yDD3d3
 jymThyVr6ILlNmT31fs+hiQPg/+L6iHzYuKc3l6BSXY7SENagQjKEelQ1WvHFjca3vZL
 6s7EcxkegH33Ak377GKDgewaRaAl56pfraq927PEgMPCNumT+uRy0pYU9UetylTyGiY1
 p3+Q==
X-Gm-Message-State: ACrzQf0hxIJ57lwQ39F2ke7zH89cJI3C1jEE7ZOMUi7W8on8CwRpVEpl
 Lw5kaQ/oJ0OYT4/7HW7T/2rvfij0lDJiubMqMYxIZy//nVabKoHCTZ/+WRQQCtOlECMTdqXICzX
 YR/JKQGLxWBmzK10rAYKlF2vEzPAqD3U=
X-Received: by 2002:a17:902:ce82:b0:187:3591:edac with SMTP id
 f2-20020a170902ce8200b001873591edacmr48453119plg.153.1668085783856; 
 Thu, 10 Nov 2022 05:09:43 -0800 (PST)
X-Google-Smtp-Source: AMsMyM6KOEWfHhPK/2I37RD9J6zoYrru3BZj2gmnXvReWU8tS7nSkaqP/coNopRBOSYlstVFJkhfgWl9FCCsZ/0xYEE=
X-Received: by 2002:a17:902:ce82:b0:187:3591:edac with SMTP id
 f2-20020a170902ce8200b001873591edacmr48453093plg.153.1668085783523; Thu, 10
 Nov 2022 05:09:43 -0800 (PST)
MIME-Version: 1.0
References: <20221108170755.92768-1-eperezma@redhat.com>
 <20221108170755.92768-6-eperezma@redhat.com>
 <56bfad97-74d2-8570-c391-83ecf9965cfd@redhat.com>
In-Reply-To: <56bfad97-74d2-8570-c391-83ecf9965cfd@redhat.com>
From: Eugenio Perez Martin <eperezma@redhat.com>
Date: Thu, 10 Nov 2022 14:09:07 +0100
Message-ID: <CAJaqyWd47QdBoSm9RdF2yx21hKv_=YRp3uvP13Qb9PaVksss7Q@mail.gmail.com>
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

On Thu, Nov 10, 2022 at 6:40 AM Jason Wang <jasowang@redhat.com> wrote:
>
>
> =E5=9C=A8 2022/11/9 01:07, Eugenio P=C3=A9rez =E5=86=99=E9=81=93:
> > The next patches will start control SVQ if possible. However, we don't
> > know if that will be possible at qemu boot anymore.
>
>
> If I was not wrong, there's no device specific feature that is checked
> in the function. So it should be general enough to be used by devices
> other than net. Then I don't see any advantage of doing this.
>

Because vhost_vdpa_init_svq is called at qemu boot, failing if it is
not possible to shadow the Virtqueue.

Now the CVQ will be shadowed if possible, so we need to check this at
device start, not at initialization. To store this information at boot
time is not valid anymore, because v->shadow_vqs_enabled is not valid
at this time anymore.

Thanks!

> Thanks
>
>
> >
> > Since the moved checks will be already evaluated at net/ to know if it
> > is ok to shadow CVQ, move them.
> >
> > Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> > ---
> >   hw/virtio/vhost-vdpa.c | 33 ++-------------------------------
> >   net/vhost-vdpa.c       |  3 ++-
> >   2 files changed, 4 insertions(+), 32 deletions(-)
> >
> > diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> > index 3df2775760..146f0dcb40 100644
> > --- a/hw/virtio/vhost-vdpa.c
> > +++ b/hw/virtio/vhost-vdpa.c
> > @@ -402,29 +402,9 @@ static int vhost_vdpa_get_dev_features(struct vhos=
t_dev *dev,
> >       return ret;
> >   }
> >
> > -static int vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_vd=
pa *v,
> > -                               Error **errp)
> > +static void vhost_vdpa_init_svq(struct vhost_dev *hdev, struct vhost_v=
dpa *v)
> >   {
> >       g_autoptr(GPtrArray) shadow_vqs =3D NULL;
> > -    uint64_t dev_features, svq_features;
> > -    int r;
> > -    bool ok;
> > -
> > -    if (!v->shadow_vqs_enabled) {
> > -        return 0;
> > -    }
> > -
> > -    r =3D vhost_vdpa_get_dev_features(hdev, &dev_features);
> > -    if (r !=3D 0) {
> > -        error_setg_errno(errp, -r, "Can't get vdpa device features");
> > -        return r;
> > -    }
> > -
> > -    svq_features =3D dev_features;
> > -    ok =3D vhost_svq_valid_features(svq_features, errp);
> > -    if (unlikely(!ok)) {
> > -        return -1;
> > -    }
> >
> >       shadow_vqs =3D g_ptr_array_new_full(hdev->nvqs, vhost_svq_free);
> >       for (unsigned n =3D 0; n < hdev->nvqs; ++n) {
> > @@ -436,7 +416,6 @@ static int vhost_vdpa_init_svq(struct vhost_dev *hd=
ev, struct vhost_vdpa *v,
> >       }
> >
> >       v->shadow_vqs =3D g_steal_pointer(&shadow_vqs);
> > -    return 0;
> >   }
> >
> >   static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error=
 **errp)
> > @@ -461,11 +440,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, =
void *opaque, Error **errp)
> >       dev->opaque =3D  opaque ;
> >       v->listener =3D vhost_vdpa_memory_listener;
> >       v->msg_type =3D VHOST_IOTLB_MSG_V2;
> > -    ret =3D vhost_vdpa_init_svq(dev, v, errp);
> > -    if (ret) {
> > -        goto err;
> > -    }
> > -
> > +    vhost_vdpa_init_svq(dev, v);
> >       vhost_vdpa_get_iova_range(v);
> >
> >       if (!vhost_vdpa_first_dev(dev)) {
> > @@ -476,10 +451,6 @@ static int vhost_vdpa_init(struct vhost_dev *dev, =
void *opaque, Error **errp)
> >                                  VIRTIO_CONFIG_S_DRIVER);
> >
> >       return 0;
> > -
> > -err:
> > -    ram_block_discard_disable(false);
> > -    return ret;
> >   }
> >
> >   static void vhost_vdpa_host_notifier_uninit(struct vhost_dev *dev,
> > diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> > index d3b1de481b..fb35b17ab4 100644
> > --- a/net/vhost-vdpa.c
> > +++ b/net/vhost-vdpa.c
> > @@ -117,9 +117,10 @@ static bool vhost_vdpa_net_valid_svq_features(uint=
64_t features, Error **errp)
> >       if (invalid_dev_features) {
> >           error_setg(errp, "vdpa svq does not work with features 0x%" P=
RIx64,
> >                      invalid_dev_features);
> > +        return false;
> >       }
> >
> > -    return !invalid_dev_features;
> > +    return vhost_svq_valid_features(features, errp);
> >   }
> >
> >   static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
>


