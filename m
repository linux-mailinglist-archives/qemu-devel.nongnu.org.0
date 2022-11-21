Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DBDB631917
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 05:03:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1owy0g-0001lI-As; Sun, 20 Nov 2022 23:02:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1owy0d-0001kv-S1
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 23:02:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1owy0c-0002f8-18
 for qemu-devel@nongnu.org; Sun, 20 Nov 2022 23:02:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669003333;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UuOfjhOh/oOjQp5N0ciEwQ5Pi4wI9tCfBEksnMeRvNE=;
 b=E6z4NUb0sjIhDVsyTIOgIBlx/F8SI1dkTb6oZb7Bje5E8VWXE9pUJHABRn4PQCkGga1Wdo
 UZlY5mmilcckJAIpi7khEhtXKjV7MBDMXQV2JIJtjfXx3fp7Vw+ztQnJlcvq8/Y8nDcv8i
 pfSJdg0ogldRYT7XUk7zzPxbwmCjO9E=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-344-QpkZwlFpMsuyGuNzKO7A2w-1; Sun, 20 Nov 2022 23:02:11 -0500
X-MC-Unique: QpkZwlFpMsuyGuNzKO7A2w-1
Received: by mail-ot1-f72.google.com with SMTP id
 r17-20020a056830135100b0066c3ca9c6d8so4706293otq.15
 for <qemu-devel@nongnu.org>; Sun, 20 Nov 2022 20:02:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UuOfjhOh/oOjQp5N0ciEwQ5Pi4wI9tCfBEksnMeRvNE=;
 b=qqJgiR1Z6qqa/IbPeKwF1V7+pX+AxIloljt44XvY7ps1lPusRbRw7NrStfE3ryq8ef
 FEzSSi91kKnngU+lttT8jYlO2ZM/45TZwpcpQYAl8U4qSxGN2p6A1mFUsvqqlyxOCzjh
 n9ZENFjhDIb4gIDQEy7qanZmPZ9UtsC5QugY1rQ5ngW/Req2J2u9aaTGs2ire4eY9T6M
 FZBm1/iC/zopOCVEh9ZkZFOVhfYjY283Nt2bqD08n3D4IAZhqiQKJQge6d/JYnJs8q43
 DvTZfdf/OZqzy6q0JIailBxIKJdrA2gxecBouMpG+mftdJojW6f5tX6fPHgqKA/u7ILx
 2ajQ==
X-Gm-Message-State: ANoB5pk6z87cZPoExFasL1waFcFnWUsmuoRuSNfhzSjT6elO3WjrB+Qn
 r4tgM6FYKjxLas8aWRZoZlyj6eGV/JGQUinyBvDckow15Jg8lIZ2YRusDqTolgSJIR3d+S96mIJ
 vWluJCmVe6u0KaXvZCdD4rNrqY+R/Ib0=
X-Received: by 2002:aca:906:0:b0:354:68aa:9c59 with SMTP id
 6-20020aca0906000000b0035468aa9c59mr10699619oij.35.1669003330760; 
 Sun, 20 Nov 2022 20:02:10 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6dQew7VGEBqXqX0PiLgzBOKPYe0cbj948pFgGRJTNBSPnuwexxZi3eRHOJLTTNhWTd8qq00O8lI4AxcPHwFW8=
X-Received: by 2002:aca:906:0:b0:354:68aa:9c59 with SMTP id
 6-20020aca0906000000b0035468aa9c59mr10699611oij.35.1669003330491; Sun, 20 Nov
 2022 20:02:10 -0800 (PST)
MIME-Version: 1.0
References: <20221118144915.2009-1-longpeng2@huawei.com>
In-Reply-To: <20221118144915.2009-1-longpeng2@huawei.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 21 Nov 2022 12:01:59 +0800
Message-ID: <CACGkMEu4R92uX_J43ZKetg3Q1FCTQR1Z7u4Ua3Jx2y7cjxX1Og@mail.gmail.com>
Subject: Re: [PATCH] vhost: configure all host notifiers in a single MR
 transaction
To: "Longpeng(Mike)" <longpeng2@huawei.com>
Cc: stefanha@redhat.com, mst@redhat.com, sgarzare@redhat.com, 
 cohuck@redhat.com, pbonzini@redhat.com, arei.gonglei@huawei.com, 
 yechuan@huawei.com, huangzhichao@huawei.com, qemu-devel@nongnu.org
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

On Fri, Nov 18, 2022 at 10:49 PM Longpeng(Mike) <longpeng2@huawei.com> wrote:
>
> From: Longpeng <longpeng2@huawei.com>
>
> This allows the vhost device to batch the setup of all its host notifiers.
> This significantly reduces the device starting time, e.g. the vhost-vDPA
> generic device [1] start time reduce from 376ms to 9.1ms for a VM with
> 64 vCPUs and 3 vDPA device(64vq per device).

Great, I think we need to do this for host_notifiers_mr as well. This
helps for the case when the notification area could be mapped directly
to guests.

>
> [1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg921541.html
>
> Signed-off-by: Longpeng <longpeng2@huawei.com>
> ---
>  hw/virtio/vhost.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 38 insertions(+), 1 deletion(-)
>
> diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
> index d1c4c20b8c..bf82d9b176 100644
> --- a/hw/virtio/vhost.c
> +++ b/hw/virtio/vhost.c
> @@ -1507,6 +1507,7 @@ void vhost_dev_cleanup(struct vhost_dev *hdev)
>  int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>  {
>      BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
> +    int vq_init_count = 0;
>      int i, r, e;
>
>      /* We will pass the notifiers to the kernel, make sure that QEMU
> @@ -1518,6 +1519,12 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>          goto fail;
>      }
>
> +    /*
> +     * Batch all the host notifiers in a single transaction to avoid
> +     * quadratic time complexity in address_space_update_ioeventfds().
> +     */
> +    memory_region_transaction_begin();
> +
>      for (i = 0; i < hdev->nvqs; ++i) {
>          r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
>                                           true);
> @@ -1525,19 +1532,33 @@ int vhost_dev_enable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>              error_report("vhost VQ %d notifier binding failed: %d", i, -r);
>              goto fail_vq;
>          }
> +
> +        vq_init_count++;
>      }

Nit, the name needs some tweak, it's actually the number of the host
notifiers that is initialized. And we can count it out of the loop.

>
> +    memory_region_transaction_commit();
> +
>      return 0;
>  fail_vq:
> -    while (--i >= 0) {
> +    for (i = 0; i < vq_init_count; i++) {

It looks to me there's no need for this change.

Others look good.

Thanks

>          e = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
>                                           false);
>          if (e < 0) {
>              error_report("vhost VQ %d notifier cleanup error: %d", i, -r);
>          }
>          assert (e >= 0);
> +    }
> +
> +    /*
> +     * The transaction expects the ioeventfds to be open when it
> +     * commits. Do it now, before the cleanup loop.
> +     */
> +    memory_region_transaction_commit();
> +
> +    for (i = 0; i < vq_init_count; i++) {
>          virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i);
>      }
> +
>      virtio_device_release_ioeventfd(vdev);
>  fail:
>      return r;
> @@ -1553,6 +1574,12 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>      BusState *qbus = BUS(qdev_get_parent_bus(DEVICE(vdev)));
>      int i, r;
>
> +    /*
> +     * Batch all the host notifiers in a single transaction to avoid
> +     * quadratic time complexity in address_space_update_ioeventfds().
> +     */
> +    memory_region_transaction_begin();
> +
>      for (i = 0; i < hdev->nvqs; ++i) {
>          r = virtio_bus_set_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i,
>                                           false);
> @@ -1560,8 +1587,18 @@ void vhost_dev_disable_notifiers(struct vhost_dev *hdev, VirtIODevice *vdev)
>              error_report("vhost VQ %d notifier cleanup failed: %d", i, -r);
>          }
>          assert (r >= 0);
> +    }
> +
> +    /*
> +     * The transaction expects the ioeventfds to be open when it
> +     * commits. Do it now, before the cleanup loop.
> +     */
> +    memory_region_transaction_commit();
> +
> +    for (i = 0; i < hdev->nvqs; ++i) {
>          virtio_bus_cleanup_host_notifier(VIRTIO_BUS(qbus), hdev->vq_index + i);
>      }
> +
>      virtio_device_release_ioeventfd(vdev);
>  }
>
> --
> 2.23.0
>


