Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DAC5ACDA3
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 10:33:40 +0200 (CEST)
Received: from localhost ([::1]:52240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV7Y3-0002aL-0l
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 04:33:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV7VZ-00017z-QX
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:31:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV7VI-00059A-JG
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:31:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662366647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Vs8IZthtudCo+dGn4jIxYGBFuyqKn/I3IibxLtUED1U=;
 b=KW9X70uX1/26NUFccdSIJPw3/b6TRnN+C8zpjzzyhXa30+kBVSYR/w4KyK7Rkx8+mDFMsC
 DQnkB4t3mxtWKf/qJqYgFGnlP5x9LHFn09gAed12AMWJsJ91EJqClY8JDlaou8M4zZBqan
 Q9c5Y1dzunncmajOFkzL2kyHiGtDsQI=
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-374-cLmxcuVGOeKWkVTtTZ3U9A-1; Mon, 05 Sep 2022 04:30:46 -0400
X-MC-Unique: cLmxcuVGOeKWkVTtTZ3U9A-1
Received: by mail-pl1-f200.google.com with SMTP id
 a8-20020a170902ecc800b00176ad01ab44so1421713plh.12
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 01:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=Vs8IZthtudCo+dGn4jIxYGBFuyqKn/I3IibxLtUED1U=;
 b=QTgEumTz7oVdvEkMqQSX+iAMMDsQ7DTCgcaGnlemu9dGyRHO29U/VWQEssohx1iAJC
 lQh7uM/CLH4C/gWeZQTqLXIhBmhGQodMvBpJ0vam6kWxE4kJuiLRMi00XQ6qENmxuQmz
 KaxsOu/FXiOqtuUKVD8b7xFYdRgNIhCVJtRSfIcUPAYtK768eM4o0q31UMUklIr4ftHT
 2lR+UQONs0n6DtvxzVVHvF+wbCH0yeo/lue7XN3SombMaAgSZnK1Zef+I2CYDpr/+BGS
 zTcIXQeJAf+q2F2PKeOCMPoQb2UzULwDdY1ARJDP1hNTccM8hToE7Zuof2ockK8hoE3l
 FzxA==
X-Gm-Message-State: ACgBeo15r5Jw781k8rSB7wkgPi8TRMvVH1zkNmLlZc7d7CXwStR/8F7f
 2p9mHCk7aM+McWHfXEn8uI13IEMtWUxpjVrSQXUtzkNOKCLzUAJc9a8YQPoR7mgjqu0jwRm/vi5
 rt/g/j0FUF+FxMFU=
X-Received: by 2002:a63:1862:0:b0:42a:1653:863b with SMTP id
 34-20020a631862000000b0042a1653863bmr41743188pgy.574.1662366645289; 
 Mon, 05 Sep 2022 01:30:45 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6dLnsgam1qgzqPN+LUR/Rx0EmnTl3AOQD6/Atq0ac70x95wTBil/pM4y1uTwIV39Ap5v0a5Q==
X-Received: by 2002:a63:1862:0:b0:42a:1653:863b with SMTP id
 34-20020a631862000000b0042a1653863bmr41743160pgy.574.1662366644982; 
 Mon, 05 Sep 2022 01:30:44 -0700 (PDT)
Received: from [10.72.13.239] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 q4-20020a17090311c400b00172b87d9770sm6845114plh.81.2022.09.05.01.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 01:30:44 -0700 (PDT)
Message-ID: <8e7c93bc-2430-f0fb-d425-5e43fde23c14@redhat.com>
Date: Mon, 5 Sep 2022 16:30:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 13/15] virtio-net: support queue reset
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <8577963f4b72f30c5dd1adfe661b08e57d26c453.1661414345.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <8577963f4b72f30c5dd1adfe661b08e57d26c453.1661414345.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.978, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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


在 2022/8/25 16:08, Kangjie Xu 写道:
> From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
>
> virtio-net and vhost-kernel implement queue reset.
> Queued packets in the corresponding queue pair are flushed
> or purged.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> ---
>   hw/net/virtio-net.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 27b59c0ad6..d774a3e652 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -540,6 +540,23 @@ static RxFilterInfo *virtio_net_query_rxfilter(NetClientState *nc)
>       return info;
>   }
>   
> +static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
> +{
> +    VirtIONet *n = VIRTIO_NET(vdev);
> +    NetClientState *nc = qemu_get_subqueue(n->nic, vq2q(queue_index));
> +
> +    if (!nc->peer) {
> +        return;
> +    }
> +
> +    if (get_vhost_net(nc->peer) &&
> +        nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
> +        vhost_net_virtqueue_reset(vdev, nc, queue_index);
> +    }
> +
> +    flush_or_purge_queued_packets(nc);


But the codes doesn't prevent the usersapce datapath from being used? 
(e.g vhost=off)

E.g vhost_net_start_one() had:

     if (net->nc->info->poll) {
         net->nc->info->poll(net->nc, false);
     }

And I will wonder if it's better to consider to:

1) factor out the per virtqueue start/stop from vhost_net_start/stop_one()

2) simply use the helper factored out via step 1)

Thanks


> +}
> +
>   static void virtio_net_reset(VirtIODevice *vdev)
>   {
>       VirtIONet *n = VIRTIO_NET(vdev);
> @@ -3784,6 +3801,7 @@ static void virtio_net_class_init(ObjectClass *klass, void *data)
>       vdc->set_features = virtio_net_set_features;
>       vdc->bad_features = virtio_net_bad_features;
>       vdc->reset = virtio_net_reset;
> +    vdc->queue_reset = virtio_net_queue_reset;
>       vdc->set_status = virtio_net_set_status;
>       vdc->guest_notifier_mask = virtio_net_guest_notifier_mask;
>       vdc->guest_notifier_pending = virtio_net_guest_notifier_pending;


