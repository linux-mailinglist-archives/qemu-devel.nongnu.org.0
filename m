Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6A1F5ADEF8
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 07:42:51 +0200 (CEST)
Received: from localhost ([::1]:59526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVRMD-00005v-5t
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 01:42:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oVRGv-0006ef-Nx
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 01:37:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oVRGs-00018p-Du
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 01:37:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662442633;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QQJdeYVsEo9LTGGC/Rb1F52ZxP3aybky0+jiWdvMklI=;
 b=Nx7pRdiqqznqK4OlDzzwPKfCr20Gjup+9fzoglmzo+9DFVgvGPW4rz183OjeQ9aKv5QxEl
 U+02VsIk89X778SgQMAXtlNAKpnzsQ642ZAK8jnp0LQIf92c8bgIN01cPDmxaXqTP22/jk
 2HMzJexdJiyIunF3oXILBze88GHftDk=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-160-EsKB_3UlNE6tKA2XTQsp6w-1; Tue, 06 Sep 2022 01:37:12 -0400
X-MC-Unique: EsKB_3UlNE6tKA2XTQsp6w-1
Received: by mail-vk1-f200.google.com with SMTP id
 q129-20020a1fa787000000b00377b033e1abso1688392vke.0
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 22:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=QQJdeYVsEo9LTGGC/Rb1F52ZxP3aybky0+jiWdvMklI=;
 b=jLZZScM7MPDVBr92lZB72zJvB1x1wSb4oM4DVlm95eE6vJSAXPrFCQY85sgQGfZp3x
 kFye6Q0cfkYpEIa4lRfRx5lxNsd+l+Vu/DX8JhD8ZDBx88/jPRw1rqO7bMttkXJx9WLV
 T3e4tDrtJ0OxDqHHyk5MpQkBERwkllnZUhMSd3qARooZ4sX1T4jnWxYjj9zzrXRqYSFd
 6gQ83KrGoP6+Rg06sDOCRphO0N2XgEdODbzPob+G5O5GuZGSk6oiiAgeQM0uZ8U0HVha
 tnSCGZkxR/fwsxfQEI1SoY9yTjr2V6n1S3Urili7l+gy/XpNBylVftaYSFOw9MNJ/LK0
 snrQ==
X-Gm-Message-State: ACgBeo2jlrW/+Gln3ETon58nKCKRnKiMdUTKN92y/0/+psYBS5QAZHoF
 0BEA2pBDv+8uOcwIZrnDsiiwMu95qF7k6a+sRloj48nbv8mK1WiySH/yTA55cMHF+8wrsISnuNH
 fwVYsEPLxI0FPQKqueJiqW96f/LTHP+Y=
X-Received: by 2002:ab0:2c11:0:b0:38c:f6d4:6435 with SMTP id
 l17-20020ab02c11000000b0038cf6d46435mr15644659uar.66.1662442632025; 
 Mon, 05 Sep 2022 22:37:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6bX6/c5yzVVbAi6mylt2udE04Strp33V3nmlOfigkmnMMrx3RNa00trO84wSIapsD547ZXtno30GiT6YrrxTk=
X-Received: by 2002:ab0:2c11:0:b0:38c:f6d4:6435 with SMTP id
 l17-20020ab02c11000000b0038cf6d46435mr15644656uar.66.1662442631788; Mon, 05
 Sep 2022 22:37:11 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <8577963f4b72f30c5dd1adfe661b08e57d26c453.1661414345.git.kangjie.xu@linux.alibaba.com>
 <8e7c93bc-2430-f0fb-d425-5e43fde23c14@redhat.com>
 <7d0b6e52-c6c7-bd6d-3669-659a2573e133@linux.alibaba.com>
In-Reply-To: <7d0b6e52-c6c7-bd6d-3669-659a2573e133@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 6 Sep 2022 13:37:01 +0800
Message-ID: <CACGkMEu7ORcFUBmE3KKA9L_Ry5kDkF7APfmi8g5jyFhvv0m8CA@mail.gmail.com>
Subject: Re: [PATCH v3 13/15] virtio-net: support queue reset
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

On Tue, Sep 6, 2022 at 12:25 AM Kangjie Xu <kangjie.xu@linux.alibaba.com> w=
rote:
>
>
> =E5=9C=A8 2022/9/5 16:30, Jason Wang =E5=86=99=E9=81=93:
> >
> > =E5=9C=A8 2022/8/25 16:08, Kangjie Xu =E5=86=99=E9=81=93:
> >> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >>
> >> virtio-net and vhost-kernel implement queue reset.
> >> Queued packets in the corresponding queue pair are flushed
> >> or purged.
> >>
> >> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> >> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> >> ---
> >>   hw/net/virtio-net.c | 18 ++++++++++++++++++
> >>   1 file changed, 18 insertions(+)
> >>
> >> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> >> index 27b59c0ad6..d774a3e652 100644
> >> --- a/hw/net/virtio-net.c
> >> +++ b/hw/net/virtio-net.c
> >> @@ -540,6 +540,23 @@ static RxFilterInfo
> >> *virtio_net_query_rxfilter(NetClientState *nc)
> >>       return info;
> >>   }
> >>   +static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t
> >> queue_index)
> >> +{
> >> +    VirtIONet *n =3D VIRTIO_NET(vdev);
> >> +    NetClientState *nc =3D qemu_get_subqueue(n->nic, vq2q(queue_index=
));
> >> +
> >> +    if (!nc->peer) {
> >> +        return;
> >> +    }
> >> +
> >> +    if (get_vhost_net(nc->peer) &&
> >> +        nc->peer->info->type =3D=3D NET_CLIENT_DRIVER_TAP) {
> >> +        vhost_net_virtqueue_reset(vdev, nc, queue_index);
> >> +    }
> >> +
> >> +    flush_or_purge_queued_packets(nc);
> >
> >
> > But the codes doesn't prevent the usersapce datapath from being used?
> > (e.g vhost=3Doff)
> >
> > E.g vhost_net_start_one() had:
> >
> >     if (net->nc->info->poll) {
> >         net->nc->info->poll(net->nc, false);
> >     }
> I review this part in vhost_net_start/stop_one().
>
> I didn't take the usersapce datapath into consideration.

Because it's used for vhost-net. So I think maybe we should first
implement the rest in the userspace datapath first then try to
implement them in the vhost?

> If we don't
> prevent it, the userspace datapath may access it and causes some
> problems. From this point, we should disable it.
>
> But if we add net->nc->info->poll in vq reset, it can only operate at
> queue-pair level, which obeys "per-virtqueue".
>
> What's your opinion on this point? I think it's ok to add it in vq reset.

See above, I'd suggest to implement the vq reset in qemu usersapce
datapath first. Then we can do vhost part on top.

>
> >
> > And I will wonder if it's better to consider to:
> >
> > 1) factor out the per virtqueue start/stop from
> > vhost_net_start/stop_one()
> >
> > 2) simply use the helper factored out via step 1)
> >
> > Thanks
> >
> I have a different idea about it, vhost_virtqueue_start/stop()(in
> hw/virtio/vhost.c) are already good abstractions of per virtqueue
> start/stop.
>
> These two functions are used in vhost_dev_start. It's just because
> vhost-net needs some configuration, so we add net->nc->info->poll and
> set_backend for it. But for other devices using vhost_dev_start,
> set_backend and net->nc->info->poll may be not necessary.
>
> I think your apporach to abstract per virtqueue start/stop from
> vhost_net_start/stop_one() will break the generality of
> vhost_dev_start(), which is a common interface for different devices.
>
> To conclude my opinions
>
> 1. I think we need to add net->nc->info->poll in our
> vhost_net_virtqueue_reset() and vhost_net_virtqueue_restart()
>
> 2. We still need vhost_net_virtqueue_reset() and
> vhost_net_virtqueue_restart().
>
>      a. vhost_net_virtqueue_reset() is a wrapper for vhost_virtqueue_stop=
().
>
>      b. vhost_net_virtqueue_restart() is a wrapper for
> vhost_virtqueue_start().

Sounds good, let's do and see.

Thanks

>
> Thanks
>
> >
> >> +}
> >> +
> >>   static void virtio_net_reset(VirtIODevice *vdev)
> >>   {
> >>       VirtIONet *n =3D VIRTIO_NET(vdev);
> >> @@ -3784,6 +3801,7 @@ static void virtio_net_class_init(ObjectClass
> >> *klass, void *data)
> >>       vdc->set_features =3D virtio_net_set_features;
> >>       vdc->bad_features =3D virtio_net_bad_features;
> >>       vdc->reset =3D virtio_net_reset;
> >> +    vdc->queue_reset =3D virtio_net_queue_reset;
> >>       vdc->set_status =3D virtio_net_set_status;
> >>       vdc->guest_notifier_mask =3D virtio_net_guest_notifier_mask;
> >>       vdc->guest_notifier_pending =3D virtio_net_guest_notifier_pendin=
g;
>


