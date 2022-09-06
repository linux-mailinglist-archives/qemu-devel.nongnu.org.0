Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBEB25ADEDE
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 07:27:00 +0200 (CEST)
Received: from localhost ([::1]:56584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVR6x-0005lH-JQ
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 01:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oVR5H-0004MV-9w
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 01:25:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oVR5E-0007vH-3X
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 01:25:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662441910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6prPvHPHNr8UmKQ2IlPDC8FumGk7UjG2nsYNAplsHGw=;
 b=X14IZDmrseYp1Lvnj1KNMc621FLE8QMFpCXXdbjCTOXswwZKDLOxLrzD8ckfhXue/ki10m
 GjqvtwiMlyltsiMLCIMMzE8RA7EGUXC7+c2mJT9SSufumt3IsT3ye20sw0GtcJhv+JgR4d
 m/iC/ala3VE5DwaHENfwDjR2fzvDGyo=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-488-NCi17Y44PDiEpm3FsggQkA-1; Tue, 06 Sep 2022 01:25:01 -0400
X-MC-Unique: NCi17Y44PDiEpm3FsggQkA-1
Received: by mail-vk1-f198.google.com with SMTP id
 w187-20020a1fadc4000000b0037ceefea1c7so1678669vke.7
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 22:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6prPvHPHNr8UmKQ2IlPDC8FumGk7UjG2nsYNAplsHGw=;
 b=O4DrrpbjZeYZR/H38X/9oLgTwU8kMPSP6RNqp6j5v9DKlkJ8iJf5tN4NrWXn7L/RUX
 CcJkC+1YHYNBj6RFGEYdGkqI8nZc2TuQqM2RHL6LyrusOOp9A67EC+ILt6rJLdMSuYTT
 bHAw6XPVX0ZIq12/4+FcN8zPyh101t+Rmn5AfDVQYYCRCl0WAxwO8Io2XECX9wy5ncoE
 e9K1NiqhtOMEsLWhc+EQAAOuS78MFbK3Hz+mgfm7hCmvSv7YCI7guN4gNFHtekKUu1h8
 yWiPxq6vlQfUa7r/SEOZTobcAEv9Q5liGIsexGMFkpAYV3PZeG/IuW7LTYp1gSi2fdsB
 jqYw==
X-Gm-Message-State: ACgBeo2lQYxY4qCQ3CB4+p8z/B0d3QaufxweBXwK8lKoj7gyzDD0lWTP
 PR3OxmOG/vxu3u7vlbab6ZJp+qdGd+td2vx+SiL6T2JOzDhWHZ5R3BjVo536kMkarz+etW1FxUK
 sDiBnXqsABPryJOCAHh1MUEhZBMMZAfg=
X-Received: by 2002:ab0:1473:0:b0:396:d89d:3a87 with SMTP id
 c48-20020ab01473000000b00396d89d3a87mr15388725uae.73.1662441901226; 
 Mon, 05 Sep 2022 22:25:01 -0700 (PDT)
X-Google-Smtp-Source: AA6agR74v/NDZ6SS+JSH/do3dT+JBOJqmOsLbDDZqIE8vBlZL9KcXHrR1WzHgS2iDUUOe3hVd3dhnXc90d26AVe30ss=
X-Received: by 2002:ab0:1473:0:b0:396:d89d:3a87 with SMTP id
 c48-20020ab01473000000b00396d89d3a87mr15388723uae.73.1662441900978; Mon, 05
 Sep 2022 22:25:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <b6286db2a6ce2389f44cc44da06c9fd2b8eaaec8.1661414345.git.kangjie.xu@linux.alibaba.com>
 <e6ce97bd-a121-04c5-8984-95906f34a15c@redhat.com>
 <4b733015-fed4-f22a-a693-c83cd74938aa@linux.alibaba.com>
In-Reply-To: <4b733015-fed4-f22a-a693-c83cd74938aa@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 6 Sep 2022 13:24:50 +0800
Message-ID: <CACGkMEs=08FJ+DmXgFPMQwSPHeLs1HHV_BhcNjS937FQ+Cy+xg@mail.gmail.com>
Subject: Re: [PATCH v3 10/15] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_reset()
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 wangyanan55@huawei.com, Heng Qi <hengqi@linux.alibaba.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Sep 5, 2022 at 6:15 PM Kangjie Xu <kangjie.xu@linux.alibaba.com> wr=
ote:
>
>
> =E5=9C=A8 2022/9/5 16:03, Jason Wang =E5=86=99=E9=81=93:
> >
> > =E5=9C=A8 2022/8/25 16:08, Kangjie Xu =E5=86=99=E9=81=93:
> >> Introduce vhost_virtqueue_reset(), which can reset the specific
> >> virtqueue in the device. Then it will unmap vrings and the desc
> >> of the virtqueue.
> >>
> >> Here we do not reuse the vhost_net_stop_one() or vhost_dev_stop(),
> >> because they work at queue pair level. We do not use
> >> vhost_virtqueue_stop() because it may stop the device in the
> >> backend.
> >
> >
> > So I think this is not true at least for vhost-net kernel baceknd.
> >
> >
> But vhost-user(OVS-DPDK) will stop the device.

Yes, what I meant is that, considering this series only deal with
vhost-net. We can leave any "fix" or "workaround" until e.g the
vhost-user support is posted?

>
> When DPDK vhost received VHOST_USER_GET_VRING_BASE message, it will call
> vhost_destroy_device_notify() to destroy the device.

Right, actually this trick is used even in some hardware.

>
> It seems like it is a inconsistency error in DPDK. Maybe I should submit
> a patch to DPDK. We can stop the device only when all the virtqueues in
> one device are destroyed.

That would be fine.

>
> >>
> >> This patch only considers the case of vhost-kernel, when
> >> NetClientDriver is NET_CLIENT_DRIVER_TAP.
> >>
> >> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> >> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >> ---
> >>   hw/net/vhost_net.c      | 22 ++++++++++++++++++++++
> >>   include/net/vhost_net.h |  2 ++
> >>   2 files changed, 24 insertions(+)
> >>
> >> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> >> index ccac5b7a64..be51be98b3 100644
> >> --- a/hw/net/vhost_net.c
> >> +++ b/hw/net/vhost_net.c
> >> @@ -514,3 +514,25 @@ int vhost_net_set_mtu(struct vhost_net *net,
> >> uint16_t mtu)
> >>         return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
> >>   }
> >> +
> >> +void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc=
,
> >> +                               int vq_index)
> >> +{
> >> +    VHostNetState *net =3D get_vhost_net(nc->peer);
> >> +    const VhostOps *vhost_ops =3D net->dev.vhost_ops;
> >> +    struct vhost_vring_file file =3D { .fd =3D -1 };
> >> +    int idx;
> >> +
> >> +    /* should only be called after backend is connected */
> >> +    assert(vhost_ops);
> >> +
> >> +    idx =3D vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
> >> +
> >> +    if (net->nc->info->type =3D=3D NET_CLIENT_DRIVER_TAP) {
> >> +        file.index =3D idx;
> >> +        int r =3D vhost_net_set_backend(&net->dev, &file);
> >> +        assert(r >=3D 0);
> >> +    }
> >
> >
> > Do we need to reset e.g last_avail_idx here?
> >
> > Thanks
> >
> I did not reset it because we will re-configure them when we restart
> virtqueue.

Is last_avail_idx reset to 0 in this case?

Thanks

>
> Thanks
>
> >
> >> +
> >> +    vhost_virtqueue_unmap(&net->dev, vdev, net->dev.vqs + idx, idx);
> >> +}
> >> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> >> index 387e913e4e..85d85a4957 100644
> >> --- a/include/net/vhost_net.h
> >> +++ b/include/net/vhost_net.h
> >> @@ -48,4 +48,6 @@ uint64_t vhost_net_get_acked_features(VHostNetState
> >> *net);
> >>     int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
> >>   +void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState
> >> *nc,
> >> +                               int vq_index);
> >>   #endif
>


