Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F5E657359
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Dec 2022 07:48:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAQDW-0004Hg-Ty; Wed, 28 Dec 2022 01:47:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pAQDL-0004HG-Hb
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 01:47:00 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pAQDJ-00018e-Js
 for qemu-devel@nongnu.org; Wed, 28 Dec 2022 01:46:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672210014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/PTElHf71KsRrMTL4vC/Ag+c/NTHC4AXWoPaLqmImWE=;
 b=gFr2ZHLGhIySJycyanZDdhFhA5yTvLttPQbwLKQNncMRiPQggp44NicLo7fxdBFSXX1cvd
 2MT0gH9iS3fY61wZEXuB1pTlvk3zCakrehdZZOn5TuK5XJJsLdqF8ERgMiQpynwBSAOkAd
 Aytd9bCzkOeDQ6aXFVkz5L3bAUM1iTk=
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com
 [209.85.161.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-326-S2LRU4b_MUazECb8Jj4LsQ-1; Wed, 28 Dec 2022 01:46:52 -0500
X-MC-Unique: S2LRU4b_MUazECb8Jj4LsQ-1
Received: by mail-oo1-f69.google.com with SMTP id
 g26-20020a4a755a000000b004dd8e8ace8bso813752oof.9
 for <qemu-devel@nongnu.org>; Tue, 27 Dec 2022 22:46:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/PTElHf71KsRrMTL4vC/Ag+c/NTHC4AXWoPaLqmImWE=;
 b=bUthH4TGVzt6MtEg7KdVzTLq23SJ/nc/9NlKhXGaOZ/7By73BMccPc+8yZ4F7j2ikE
 k0rLa/sOLOmyARo8B5Jcwn+pJ09fkKW20/VvKBzs/ZdZ9Zj9FYaLHuscfrnVqHN8IOH0
 HWNvv4rswbl5sC9qRyxtJgNEXtNY3QwIJ23mx05+0mpUMcwsi+ra+wq1anJNOlPxTkUD
 i1saSdFlJIctb2ainubmo3XAMo59x4EZQciI4VJU7hAPzX29cilEMOopd1PqjYBX+M5/
 wHX0ZxI/3gWmEVprTnqdlBx2ienk+zjRoHL+ssdwJk2X9UWbs2s/Z4Wxndg0An+LsjRq
 v0PQ==
X-Gm-Message-State: AFqh2kpqh4Bu0XMBrBjnVkwMBGJl+syJKZS7UABshXvVuDzl6c7HGqiN
 2bcvxUT6SlrG85usyLQOoH84eUP16X8xXKJgS6lWooEDYqitJzRB3Dl/jqWcW0IklhaubgSb7kp
 MEvt9YNMrw00XvWsugqFUMmleh6BIBvQ=
X-Received: by 2002:a9d:7843:0:b0:678:1eb4:3406 with SMTP id
 c3-20020a9d7843000000b006781eb43406mr1528679otm.237.1672210011370; 
 Tue, 27 Dec 2022 22:46:51 -0800 (PST)
X-Google-Smtp-Source: AMrXdXv7k7QN3pcrZbiWaqJ3SS8aLa8bprCGcEzazd7zbjqKcAMt+XAwvFmOqgP4FuKkofbffaFTdgYpaZrBTmoa6q0=
X-Received: by 2002:a9d:7843:0:b0:678:1eb4:3406 with SMTP id
 c3-20020a9d7843000000b006781eb43406mr1528668otm.237.1672210011102; Tue, 27
 Dec 2022 22:46:51 -0800 (PST)
MIME-Version: 1.0
References: <20221224114848.3062-1-longpeng2@huawei.com>
 <20221224114848.3062-2-longpeng2@huawei.com>
In-Reply-To: <20221224114848.3062-2-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 28 Dec 2022 14:46:40 +0800
Message-ID: <CACGkMEvdO0qMTKWL18h05j=pyC+CYY5B-_dpa_d5-qhjC3k2Dg@mail.gmail.com>
Subject: Re: [PATCH 1/2] vdpa-dev: get iova range explicitly
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com, 
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org, 
 eperezma@redhat.com
Content-Type: text/plain; charset="UTF-8"
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

On Sat, Dec 24, 2022 at 7:49 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> In commit a585fad26b ("vdpa: request iova_range only once") we remove
> GET_IOVA_RANGE form vhost_vdpa_init, the generic vdpa device will start
> without iova_range populated, so the device won't work. Let's call
> GET_IOVA_RANGE ioctl explicitly.

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

>
> Fixes: a585fad26b2e6ccc ("vdpa: request iova_range only once")
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  hw/virtio/vdpa-dev.c           | 9 +++++++++
>  hw/virtio/vhost-vdpa.c         | 7 +++++++
>  include/hw/virtio/vhost-vdpa.h | 2 ++
>  net/vhost-vdpa.c               | 8 --------
>  4 files changed, 18 insertions(+), 8 deletions(-)
>
> diff --git a/hw/virtio/vdpa-dev.c b/hw/virtio/vdpa-dev.c
> index db6ba61152..01b41eb0f1 100644
> --- a/hw/virtio/vdpa-dev.c
> +++ b/hw/virtio/vdpa-dev.c
> @@ -53,6 +53,7 @@ static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
>  {
>      VirtIODevice *vdev = VIRTIO_DEVICE(dev);
>      VhostVdpaDevice *v = VHOST_VDPA_DEVICE(vdev);
> +    struct vhost_vdpa_iova_range iova_range;
>      uint16_t max_queue_size;
>      struct vhost_virtqueue *vqs;
>      int i, ret;
> @@ -108,6 +109,14 @@ static void vhost_vdpa_device_realize(DeviceState *dev, Error **errp)
>      v->dev.backend_features = 0;
>      v->started = false;
>
> +    ret = vhost_vdpa_get_iova_range(v->vhostfd, &iova_range);
> +    if (ret < 0) {
> +        error_setg(errp, "vhost-vdpa-device: get iova range failed: %s",
> +                   strerror(-ret));
> +        goto free_vqs;
> +    }
> +    v->vdpa.iova_range = iova_range;
> +
>      ret = vhost_dev_init(&v->dev, &v->vdpa, VHOST_BACKEND_TYPE_VDPA, 0, NULL);
>      if (ret < 0) {
>          error_setg(errp, "vhost-vdpa-device: vhost initialization failed: %s",
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 870265188a..109a2ee3bf 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -378,6 +378,13 @@ static int vhost_vdpa_add_status(struct vhost_dev *dev, uint8_t status)
>      return 0;
>  }
>
> +int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range)
> +{
> +    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> +
> +    return ret < 0 ? -errno : 0;
> +}
> +
>  /*
>   * The use of this function is for requests that only need to be
>   * applied once. Typically such request occurs at the beginning
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 45b969a311..7997f09a8d 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -51,6 +51,8 @@ typedef struct vhost_vdpa {
>      VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>  } VhostVDPA;
>
> +int vhost_vdpa_get_iova_range(int fd, struct vhost_vdpa_iova_range *iova_range);
> +
>  int vhost_vdpa_dma_map(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
>                         hwaddr size, void *vaddr, bool readonly);
>  int vhost_vdpa_dma_unmap(struct vhost_vdpa *v, uint32_t asid, hwaddr iova,
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index d36664f33a..ffdc435d19 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -702,14 +702,6 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>      return nc;
>  }
>
> -static int vhost_vdpa_get_iova_range(int fd,
> -                                     struct vhost_vdpa_iova_range *iova_range)
> -{
> -    int ret = ioctl(fd, VHOST_VDPA_GET_IOVA_RANGE, iova_range);
> -
> -    return ret < 0 ? -errno : 0;
> -}
> -
>  static int vhost_vdpa_get_features(int fd, uint64_t *features, Error **errp)
>  {
>      int ret = ioctl(fd, VHOST_GET_FEATURES, features);
> --
> 2.23.0
>


