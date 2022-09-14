Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 637455B805B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 06:41:56 +0200 (CEST)
Received: from localhost ([::1]:50348 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYKDj-0003kX-FB
	for lists+qemu-devel@lfdr.de; Wed, 14 Sep 2022 00:41:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYK8N-0006ti-OZ
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:36:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47887)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYK8K-00058i-9l
 for qemu-devel@nongnu.org; Wed, 14 Sep 2022 00:36:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663130179;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ldhW1keQ3+vblbo7CbwaskdS20cxDvBSFVeyKmyCJTQ=;
 b=GIGCksHAo7BxyuqB9KTdjiq1RO92nBlEKhow5AeNfZ+BuuYjIskTzooGRr8LhhD9vxvg09
 O0coch+5dldS2FJBgq4Co67NvHZP0sBE2C1ZuMPirSzxqWDNeG8R/Ff02NFY9fzRtk9wrn
 5nMxfE1u+OOV/5nFR5ujgMa7zaM+YcI=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-467-LpynzmG9NQu3B2xPfcpkbA-1; Wed, 14 Sep 2022 00:36:17 -0400
X-MC-Unique: LpynzmG9NQu3B2xPfcpkbA-1
Received: by mail-vk1-f199.google.com with SMTP id
 y135-20020a1f7d8d000000b003a2943d3c6dso1084643vkc.20
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 21:36:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=ldhW1keQ3+vblbo7CbwaskdS20cxDvBSFVeyKmyCJTQ=;
 b=4QAmYtJkfyFyTJ5XnPTpv/PgZRWWg9MB+uIyXiCYUFWL9Xi5yODI5cfW6uGCVRrGkH
 Vvxj84ZlyixGRoXbE7kxm6QvqlKwo4ALIRz0m0RDVTlI2dlXxOeMfAWQjy9L/hEbNJMw
 unZxCeRRDaXGszajDCZB8bTaPM1Jex/qC3Z8Iye7sXeDZfghVQjr//hsD8PIawLG9iha
 S6UCTYz1DBazEw8LyDDs43Cm46BYk4ILOj3jetoDqty/THuOA0vsx68kjhFZZJgqurRP
 jhnUk2vakoICu5F4ubaxR5FOIg2ylWvXV2Us/ANndTeHJeh2RZVNTMMquZcvBxsSHbTf
 hsIw==
X-Gm-Message-State: ACgBeo1M/pSbEmVmxtbqGYfKf+AAyteuTwXjaweELtABRBLhlVL+wi+9
 k3eSAqTVWrnzxkYPcPGbgVsKqeCJ9oklmmEO6XxUWUuQGRDPquFspnmHit1w09wcfMVXsRIgyPc
 eeIpI8Sct5GyZEBWOfC/f2KuxNVUpSWU=
X-Received: by 2002:a67:e218:0:b0:398:4d8c:8037 with SMTP id
 g24-20020a67e218000000b003984d8c8037mr8926325vsa.4.1663130177006; 
 Tue, 13 Sep 2022 21:36:17 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5aon927JPz0kqYakGepYWzsZhfaG7QyAWk9iqbXVuSQ3j27tkoKWayOHFF7xyAsTS0+tfOp42bW8nzJMBFoGA=
X-Received: by 2002:a67:e218:0:b0:398:4d8c:8037 with SMTP id
 g24-20020a67e218000000b003984d8c8037mr8926319vsa.4.1663130176828; Tue, 13 Sep
 2022 21:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220914042055.61939-1-xuanzhuo@linux.alibaba.com>
 <20220914042055.61939-12-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20220914042055.61939-12-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 14 Sep 2022 12:36:05 +0800
Message-ID: <CACGkMEsXYAuTBFCZ5QTnQ+eY1vjy_CVsoRaBpA6+SwXo_akTZQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/15] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_restart()
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <eduardo@habkost.net>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>, 
 Yanan Wang <wangyanan55@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Kangjie Xu <kangjie.xu@linux.alibaba.com>
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

On Wed, Sep 14, 2022 at 12:21 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> From: Kangjie Xu <kangjie.xu@linux.alibaba.com>
>
> Introduce vhost_net_virtqueue_restart(), which can restart the
> specific virtqueue when the vhost net started running before.
> If it fails to restart the virtqueue, the device will be stopped.
>
> Here we do not reuse vhost_net_start_one() or vhost_dev_start()
> because they work at queue pair level. The mem table and features
> do not change, so we can call the vhost_virtqueue_start() to
> restart a specific queue.
>
> This patch only considers the case of vhost-kernel, when
> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  hw/net/vhost_net.c      | 53 +++++++++++++++++++++++++++++++++++++++++
>  include/net/vhost_net.h |  2 ++
>  2 files changed, 55 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 8beecb4d22..d2926e2ed6 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -34,6 +34,7 @@
>  #include "standard-headers/linux/virtio_ring.h"
>  #include "hw/virtio/vhost.h"
>  #include "hw/virtio/virtio-bus.h"
> +#include "linux-headers/linux/vhost.h"
>
>
>  /* Features supported by host kernel. */
> @@ -556,3 +557,55 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
>                           net->dev.vqs + idx,
>                           net->dev.vq_index + idx);
>  }
> +
> +int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
> +                                int vq_index)
> +{
> +    VHostNetState *net = get_vhost_net(nc->peer);
> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
> +    struct vhost_vring_file file = { };
> +    int idx, r;
> +
> +    if (!net->dev.started) {
> +        return -EBUSY;
> +    }
> +
> +    /* should only be called after backend is connected */
> +    assert(vhost_ops);
> +
> +    idx = vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
> +
> +    r = vhost_virtqueue_start(&net->dev,
> +                              vdev,
> +                              net->dev.vqs + idx,
> +                              net->dev.vq_index + idx);
> +    if (r < 0) {
> +        goto err_start;
> +    }
> +
> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
> +        file.index = idx;
> +        file.fd = net->backend;
> +        r = vhost_net_set_backend(&net->dev, &file);
> +        if (r < 0) {
> +            r = -errno;
> +            goto err_start;
> +        }
> +    }
> +
> +    return 0;
> +
> +err_start:
> +    error_report("Error when restarting the queue.");
> +
> +    if (net->nc->info->type == NET_CLIENT_DRIVER_TAP) {
> +        file.fd = VHOST_FILE_UNBIND;
> +        file.index = idx;
> +        int r = vhost_net_set_backend(&net->dev, &file);
> +        assert(r >= 0);
> +    }
> +
> +    vhost_dev_stop(&net->dev, vdev);
> +
> +    return r;
> +}
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 85d85a4957..40b9a40074 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -50,4 +50,6 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>
>  void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
>                                 int vq_index);
> +int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
> +                                int vq_index);
>  #endif
> --
> 2.32.0.3.g01195cf9f
>


