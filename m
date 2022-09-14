Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53585B7EDE
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 04:19:09 +0200 (CEST)
Received: from localhost ([::1]:56044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYHzY-00079a-F3
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 22:19:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYHxb-0005aA-97
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:17:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25659)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYHxX-0002tZ-7z
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663121822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lJj+t88Vi0r7cL3XMPkBCt9Wsvcgtsgg/wufm7rq0o0=;
 b=XRyWXBK08ruvNUydrERv1EkhaT1SYUI5yj+9T82oxswl5qSj8aiuF5rEBerWaFqJv0QKOR
 /UQSy7vrQisfYEeBaqHvmTTFs2MSlxkUT1oDjI1GkfUv58j24XF8GuRsDP0qVUr/N1O2jd
 YJbnPbeXeZmwMLYj44VJsnfPn2ll5As=
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-137-ddX4MudRM4igKP0ML27jUA-1; Tue, 13 Sep 2022 22:17:01 -0400
X-MC-Unique: ddX4MudRM4igKP0ML27jUA-1
Received: by mail-vk1-f200.google.com with SMTP id
 y13-20020a1f320d000000b003a27b2acf97so1597066vky.23
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 19:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=lJj+t88Vi0r7cL3XMPkBCt9Wsvcgtsgg/wufm7rq0o0=;
 b=lJ7OIeEf/K/jg7pQGdfErllDO/PSKSdVz3TO2B+PxoaK79xkOPBPjebq/CMg3enf09
 tNS0wgwIxlZjLcl77sDU7UyhnFXq5g4E0rkZJr3WUdAxuNOuqkASJgPlcfFa9A5CICuE
 eXAaKOqbyWDUW27+DHU4Uy0BEQLeM5OVVE0CcjY/nLPb9SHkPR49x8za7T6PS5GhCKah
 abnlDri0ko+HQI4mIh+IgC4nhED3J0q3JbXDsMZVaq/2VpOA4ogsZPh+7QbJhFwvmCiR
 /oXoqR3l4R9RVZRYVbzluLv6aAY7AGCZ1Ijq/JgcAguduPqDgHsWLziLtfA3582DD3SW
 c1Vg==
X-Gm-Message-State: ACgBeo2tqGuvsyFOrYaWV4G7breBMGLRqs4eOcq5yTRGZojpHWyXkFTa
 bDvhwQXwTiG5rpuE4WMSB2ttCwKBdcVrwdnx7ayAf6xeifAV1grceK5s6N1wsMW2zpCjNAkIdQ6
 FL82PIHkCyqYFKRQ5zR53xWBByPiDRHc=
X-Received: by 2002:a67:a407:0:b0:390:e5b5:159f with SMTP id
 n7-20020a67a407000000b00390e5b5159fmr11717410vse.72.1663121820418; 
 Tue, 13 Sep 2022 19:17:00 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4gw5B1mCI1Z1ciE8S5CSZ6ZWCIH2bZjq7J2z5UUJJNZWx3vUBqB2gxZI3wT9g/GGB5EaBh674fzWzjyi+n5l0=
X-Received: by 2002:a67:a407:0:b0:390:e5b5:159f with SMTP id
 n7-20020a67a407000000b00390e5b5159fmr11717404vse.72.1663121820202; Tue, 13
 Sep 2022 19:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662916759.git.kangjie.xu@linux.alibaba.com>
 <2e171b825516e4367794ca00532a58e8e448fabd.1662916759.git.kangjie.xu@linux.alibaba.com>
In-Reply-To: <2e171b825516e4367794ca00532a58e8e448fabd.1662916759.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 14 Sep 2022 10:16:49 +0800
Message-ID: <CACGkMEsnnBAjR7T-5fxKMmuVOSn2qO11F83DswtZs4q2tcN8yg@mail.gmail.com>
Subject: Re: [PATCH v4 10/15] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_reset()
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 wangyanan55@huawei.com, Heng Qi <hengqi@linux.alibaba.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Sep 12, 2022 at 1:22 AM Kangjie Xu <kangjie.xu@linux.alibaba.com> wrote:
>
> Introduce vhost_virtqueue_reset(), which can reset the specific
> virtqueue in the device. Then it will unmap vrings and the desc
> of the virtqueue.
>
> Here we do not reuse the vhost_net_stop_one() or vhost_dev_stop(),
> because they work at queue pair level. We do not use
> vhost_virtqueue_stop() because it may stop the device in the
> backend.
>
> This patch only considers the case of vhost-kernel, when
> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>
> Furthermore, we do not need net->nc->info->poll() because
> it enables userspace datapath and we want to stop all
> datapaths for this reset virtqueue here.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/net/vhost_net.c      | 25 +++++++++++++++++++++++++
>  include/net/vhost_net.h |  2 ++
>  2 files changed, 27 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index d28f8b974b..8beecb4d22 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -531,3 +531,28 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
>
>      return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>  }
> +
> +void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
> +                               int vq_index)
> +{
> +    VHostNetState *net = get_vhost_net(nc->peer);
> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
> +    struct vhost_vring_file file = { .fd = -1 };
> +    int idx;
> +
> +    /* should only be called after backend is connected */
> +    assert(vhost_ops);
> +
> +    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
> +
> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
> +        file.index = idx;
> +        int r = vhost_net_set_backend(&net->dev, &file);
> +        assert(r >= 0);
> +    }
> +
> +    vhost_virtqueue_stop(&net->dev,
> +                         vdev,
> +                         net->dev.vqs + idx,
> +                         net->dev.vq_index + idx);
> +}
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 387e913e4e..85d85a4957 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -48,4 +48,6 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net);
>
>  int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>
> +void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
> +                               int vq_index);
>  #endif
> --
> 2.32.0
>


