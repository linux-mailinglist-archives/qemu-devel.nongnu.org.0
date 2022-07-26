Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0155580A7E
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 06:27:29 +0200 (CEST)
Received: from localhost ([::1]:50554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGCAK-000144-Cj
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 00:27:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGC8M-0007Tw-3a
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:25:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33914)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGC8K-0006Xc-2S
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:25:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658809523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=88fvXVzN4W2uUuZhq45cp9xtGjX9p81kZ0mwUXx6Kyk=;
 b=JgKF0UuW9fr8EnQ3EvP2tCW/LgujecTW+MbFLelOuyKacu+UKWWcP/uey2upErlHO4/VCf
 4OJy+WKG/UdGdITtG1IVKu4CP8HEqIR8BZAf/T08WHnurKYQR0gXhudouDm1J7b7a43NUb
 dtX4fQQc3UVPvJQcC2A+89634bLsytY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-diK-dv3POaK8C-vDaqXuUg-1; Tue, 26 Jul 2022 00:25:21 -0400
X-MC-Unique: diK-dv3POaK8C-vDaqXuUg-1
Received: by mail-pl1-f197.google.com with SMTP id
 c15-20020a170902d48f00b0016c01db365cso7777514plg.20
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:25:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=88fvXVzN4W2uUuZhq45cp9xtGjX9p81kZ0mwUXx6Kyk=;
 b=b8AeC6q9aRzy2ZUsKW52M33VUDinvsIrIMEeIjKVESio3zuO2J0qjcxsdRArlIn/sC
 ySkwQNa1YHnSZGQUu2KdBry/xOWFQrguq6pzsa7fQQuJomRAABecSMOtukKImHF9qDoR
 N7vRsuF7fEb7IDt1bhx+g/LeYnQi2Zq3ba6pQqIO0EPa2skU8HAOimMSohPnVMJQtIqy
 0UMErLQg7tkor/dfJTIHDMXULBtBK5TLtL+JzwJshce0dyKCsQcaIkbHK33KNBfR1xyU
 FWNEPQqbrEVwX3h/gOR7jrV62CJlq+X+kK0aGc1amfHpOSYGaGrqF7fUN4t0WGap5CWE
 eMvw==
X-Gm-Message-State: AJIora/RUgYm7vp4MwEh1JWOMX+r4wr2ralwvpKg763VJJHd3N+2UfOS
 dN51e3nnUjM+PwO/tHjXkN+oFM6+0gTkM9vos/BO+dtuWo4YJyUoQ2GYyZbJsXBE7lLRDVJl8lt
 H+Sl8S/t50s9a6Ro=
X-Received: by 2002:a65:6543:0:b0:41a:dbc1:efc7 with SMTP id
 a3-20020a656543000000b0041adbc1efc7mr10107546pgw.442.1658809520272; 
 Mon, 25 Jul 2022 21:25:20 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vqPh2TsQGJAMu0UWDtcG2xfIGT1a4p2QqNxYl4Kz0uYFQzlY4QH/lGO65ej1bqiqG6oKJnFA==
X-Received: by 2002:a65:6543:0:b0:41a:dbc1:efc7 with SMTP id
 a3-20020a656543000000b0041adbc1efc7mr10107533pgw.442.1658809520005; 
 Mon, 25 Jul 2022 21:25:20 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 j17-20020a170902da9100b0016b81679c31sm10239995plx.213.2022.07.25.21.25.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 21:25:19 -0700 (PDT)
Message-ID: <1c676f4c-5618-e944-cf2a-c0e3e5b8b0e9@redhat.com>
Date: Tue, 26 Jul 2022 12:25:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 14/16] virtio-net: support queue_enable for vhost-user
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <591635c6dfa81b8310ae38e56916aa6f3842fc58.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <591635c6dfa81b8310ae38e56916aa6f3842fc58.1658141552.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


在 2022/7/18 19:17, Kangjie Xu 写道:
> Support queue enable in vhost-user scenario. It will be called when
> a vq reset operation is performed and the vq will be restared.
>
> It should be noted that we can restart the vq when the vhost has
> already started. When launching a new vhost-user device, the vhost
> is not started and all vqs are not initalized until
> VIRTIO_PCI_COMMON_STATUS is written. Thus, we should use vhost_started
> to differentiate the two cases: vq reset and device start.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/net/virtio-net.c | 20 ++++++++++++++++++++
>   1 file changed, 20 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 8396e21a67..2c26e2ef73 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -544,6 +544,25 @@ static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
>       assert(!virtio_net_get_subqueue(nc)->async_tx.elem);
>   }
>   
> +static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
> +{
> +    VirtIONet *n = VIRTIO_NET(vdev);
> +    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
> +    int r;
> +
> +    if (!nc->peer || !vdev->vhost_started) {
> +        return;
> +    }
> +
> +    if (nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER) {
> +        r = vhost_virtqueue_restart(vdev, nc, queue_index);
> +        if (r < 0) {
> +            error_report("unable to restart vhost net virtqueue: %d, "
> +                            "when resetting the queue", queue_index);
> +        }
> +    }
> +}


So we don't check queue_enable in vhost_dev_start(), does this mean the 
queue_enable is actually meaningless (since the virtqueue is already 
started there)?

And another issue is

peet_attach/peer_detach() "abuse" vhost_set_vring_enable(). This 
probably means we need to invent new type of request instead of re-using 
VHOST_USER_SET_VRING_ENABLE.

Thanks


> +
>   static void virtio_net_reset(VirtIODevice *vdev)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
> @@ -3781,6 +3800,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
>       vdc->bad_features = virtio_net_bad_features;
>       vdc->reset = virtio_net_reset;
>       vdc->queue_reset = virtio_net_queue_reset;
> +    vdc->queue_enable = virtio_net_queue_enable;
>       vdc->set_status = virtio_net_set_status;
>       vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
>       vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;


