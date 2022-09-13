Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E33135B67A0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Sep 2022 08:11:05 +0200 (CEST)
Received: from localhost ([::1]:49220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oXz8S-0005M5-I9
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 02:11:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oXz3r-000360-38
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:06:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32271)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oXz3n-0005Uj-QK
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 02:06:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663049174;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Qv78+5tmczIN9e8IMR5pPraeCmO5MZuxovaYm8jFjM8=;
 b=dFc0La1qR54vWmpflCCCZcc6aEJeMQ430qe/b7YqhakcTOsPbePbix7Y5I0gp+aFAyuoJq
 AGVz3ukw3MPfWHdYEqbe+jn1wQOWktzhpg3Y0nOKfQrY8uYUC8REka1kI5H+rmvwaHp1JR
 Z91ppJz3ybSbSlD4teIdrcXeFn/IKoU=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-602-NBcL6EOjORuHgyOYkAEnoA-1; Tue, 13 Sep 2022 02:06:12 -0400
X-MC-Unique: NBcL6EOjORuHgyOYkAEnoA-1
Received: by mail-ua1-f71.google.com with SMTP id
 h19-20020ab01353000000b00392f0767f64so3340048uae.17
 for <qemu-devel@nongnu.org>; Mon, 12 Sep 2022 23:06:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=Qv78+5tmczIN9e8IMR5pPraeCmO5MZuxovaYm8jFjM8=;
 b=U4ZeeHRmnsvEZhq8yiL25GiRI5F//6FmTvOF49WaB/PEDzRaM26skElIbNaGj30krY
 tGDb9r76Bh/cMhchxP/NOKWLQQQE7OqWv7u/2Yb0h75JEKGTjIQgQisXE3CepEh4J1C2
 5Qm2+nqhdk9c1RP/o/sLf1WtrjZ+4bQkbPlhuNyawVIyv7iHmP3j/xoNPFr8dIUCTiKN
 Ib/OUne01NkvFsIgOX1Azj6w/t4oxQKTOjP2z0Bjb97IvCpKInB9620s6adkzUy76ywv
 AI2lBGkGo6zFqbienJrdI8jExpFevEGj0R99N6KLN02Ch1Bp3JT2CRk/l/j6psNm2UGA
 ga6Q==
X-Gm-Message-State: ACgBeo1rmIzuUlsUZRVjd6WwqorbEXZopQzgVWEXYpVAcbrrQ6MWA7KW
 xGT2lxVK6ax4HgfAr9y0E/pCO9j8JA7ZDXocR5UlI491U0zIE74OwqecYf+Jt0R3k8DQ2VMAyT/
 DOXvoXPg3pHLvQ8aJIvVFAowv84v2tk4=
X-Received: by 2002:a05:6102:a84:b0:357:c234:8041 with SMTP id
 n4-20020a0561020a8400b00357c2348041mr9134848vsg.25.1663049172506; 
 Mon, 12 Sep 2022 23:06:12 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4prvI0xqNXfEVWWhiOYZcbCUQQ45AOXL4dB5GoQO5DLZubXF9/brn5RKEXuIfDfnjgQAHWN1aP0EJrawadUwo=
X-Received: by 2002:a05:6102:a84:b0:357:c234:8041 with SMTP id
 n4-20020a0561020a8400b00357c2348041mr9134845vsg.25.1663049172255; Mon, 12 Sep
 2022 23:06:12 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662916759.git.kangjie.xu@linux.alibaba.com>
 <a1f10987280e3d69c3e86cdfb444e5b4e3e4028d.1662916759.git.kangjie.xu@linux.alibaba.com>
In-Reply-To: <a1f10987280e3d69c3e86cdfb444e5b4e3e4028d.1662916759.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 13 Sep 2022 14:06:00 +0800
Message-ID: <CACGkMEtALshdrozSft+sA=thJiiNv23Csiy51JMY7vsz0Kteog@mail.gmail.com>
Subject: Re: [PATCH v4 08/15] vhost: expose vhost_virtqueue_start()
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>, 
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 wangyanan55@huawei.com, Heng Qi <hengqi@linux.alibaba.com>, 
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
> Expose vhost_virtqueue_start(), we need to use it when restarting a
> virtqueue.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/virtio/vhost.c         | 8 ++++----
>  include/hw/virtio/vhost.h | 3 +++
>  2 files changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index f758f177bb..7900bc81ab 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1081,10 +1081,10 @@ out:
>      return ret;
>  }
>
> -static int vhost_virtqueue_start(struct vhost_dev *dev,
> -                                struct VirtIODevice *vdev,
> -                                struct vhost_virtqueue *vq,
> -                                unsigned idx)
> +int vhost_virtqueue_start(struct vhost_dev *dev,
> +                          struct VirtIODevice *vdev,
> +                          struct vhost_virtqueue *vq,
> +                          unsigned idx)
>  {
>      BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>      VirtioBusState *vbus = VIRTIO_BUS(qbus);
> diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
> index a346f23d13..b092f57d98 100644
> --- a/include/hw/virtio/vhost.h
> +++ b/include/hw/virtio/vhost.h
> @@ -279,6 +279,9 @@ int vhost_net_set_backend(struct vhost_dev *hdev,
>
>  int vhost_device_iotlb_miss(struct vhost_dev *dev, uint64_t iova, int write);
>
> +int vhost_virtqueue_start(struct vhost_dev *dev, struct VirtIODevice *vdev,
> +                          struct vhost_virtqueue *vq, unsigned idx);
> +
>  void vhost_dev_reset_inflight(struct vhost_inflight *inflight);
>  void vhost_dev_free_inflight(struct vhost_inflight *inflight);
>  void vhost_dev_save_inflight(struct vhost_inflight *inflight, QEMUFile *f);
> --
> 2.32.0
>


