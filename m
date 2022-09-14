Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BAF5B7F3E
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 05:18:03 +0200 (CEST)
Received: from localhost ([::1]:47430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYIuY-0008L8-47
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 23:18:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIrg-0005g4-5C
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 23:15:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60428)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYIre-0002OX-6j
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 23:15:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663125301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2BkSHtD1l0Sw84IFNXyFD37guTxUvOoBk6Y28dnKL2c=;
 b=DnkmB8t41JhYnwm3QDAcMglrzaf/wJMt3NwB16/ok3OjZxiCefdb4nUBIcjLoLftklEoJw
 OuYXR/o7HSNyOopxBAwcpF1D2W4/aZ3+TcDkskeF+8HvrRAJkOiCOvWLjCt2Lus3KHm8mE
 FZ+poBkfmIONzrBTYLo8iO8OuWil9O0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-494-WgYq6gGGNNGNMUHViYusAQ-1; Tue, 13 Sep 2022 23:15:00 -0400
X-MC-Unique: WgYq6gGGNNGNMUHViYusAQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 j11-20020a17090a738b00b001faeb619f6eso6477780pjg.5
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 20:14:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=2BkSHtD1l0Sw84IFNXyFD37guTxUvOoBk6Y28dnKL2c=;
 b=c7hVMXRnSy58luJPjkZtcaVsntWEvUM76k5xGZBSKx91ubXTLV1wTNeEydiIu81s4e
 q8izYM2u1NUS6d/SWrYpl67umNYP/wWWMg2SJwoPN99egXBza0kfjCQF2Dcg7FgrFZsR
 VrWPByCfsXdOQ98k67G5ssy+Xr1NIA3HgmPFxICeeN0UH1orsBonqHsWaA4gVERooOQT
 M9RWZ40P/ITK/k1SbqBbUiqEpsugp6NEoIHGbKBxBoUpX57z8Nq5tw6Y9XG4jKrOtUhm
 NKZgLJ/L8CWDIwDO3yONqcfCMKakrNapoeMtHDRDu63G3iiCUaD53LaiQJaHnigHZc96
 0qoA==
X-Gm-Message-State: ACrzQf1D4vHVlavaSjqVvx01438JHeW6u5fPcxx6ans5mMBF4ueGv0Mj
 3qrAhsbXrWUUVxpET5awf8t05hVw1iY0rp4BWLk2lp+VKUIhgf659zsXQ7S+9IykQXjYUpJ0cl6
 Vjs3QJ0pctx+/nQU=
X-Received: by 2002:a17:90b:3016:b0:200:3444:c6c7 with SMTP id
 hg22-20020a17090b301600b002003444c6c7mr2548454pjb.72.1663125298978; 
 Tue, 13 Sep 2022 20:14:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4iTKtUMLZP99MImbFtQqvSPtb3HFrgjMJ9lQb3U6AkkjxOtdn7keaRr7LmkEWdLI/B8eX+sA==
X-Received: by 2002:a17:90b:3016:b0:200:3444:c6c7 with SMTP id
 hg22-20020a17090b301600b002003444c6c7mr2548436pjb.72.1663125298766; 
 Tue, 13 Sep 2022 20:14:58 -0700 (PDT)
Received: from [10.72.13.65] ([43.228.180.230])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a1709027e8e00b0017834a6966csm5464041pla.176.2022.09.13.20.14.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 20:14:58 -0700 (PDT)
Message-ID: <12f89fc0-871e-c29a-89b9-cfe4ae2486ef@redhat.com>
Date: Wed, 14 Sep 2022 11:14:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v2 5/6] virtio-net: vhost-user: update queue_reset and
 queue_enable
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, arei.gonglei@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1662949366.git.kangjie.xu@linux.alibaba.com>
 <407c17b9a62bb7be06423b00a77b0fe301dc46de.1662949366.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <407c17b9a62bb7be06423b00a77b0fe301dc46de.1662949366.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.628, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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


在 2022/9/12 11:10, Kangjie Xu 写道:
> Update virtio_net_queue_reset() and virtio_net_queue_enable()
> for vhost-user scenario.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/net/virtio-net.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 6ab796b399..19a2132180 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -550,7 +550,8 @@ static void virtio_net_queue_reset(VirtIODevice *vdev, uint32_t queue_index)
>       }
>   
>       if (get_vhost_net(nc->peer) &&
> -        nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
> +        (nc->peer->info->type == NET_CLIENT_DRIVER_TAP ||
> +         nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER)) {
>           vhost_net_virtqueue_reset(vdev, nc, queue_index);
>       }
>   
> @@ -568,7 +569,8 @@ static void virtio_net_queue_enable(VirtIODevice *vdev, uint32_t queue_index)
>       }
>   
>       if (get_vhost_net(nc->peer) &&
> -        nc->peer->info->type == NET_CLIENT_DRIVER_TAP) {
> +        (nc->peer->info->type == NET_CLIENT_DRIVER_TAP ||
> +         nc->peer->info->type == NET_CLIENT_DRIVER_VHOST_USER)) {
>           r = vhost_net_virtqueue_restart(vdev, nc, queue_index);
>           if (r < 0) {
>               error_report("unable to restart vhost net virtqueue: %d, "


