Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 283E25ACD77
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 10:12:38 +0200 (CEST)
Received: from localhost ([::1]:57862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oV7Dg-0007An-AX
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 04:12:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV75W-00046k-WD
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:04:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33854)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oV75U-0000zn-6D
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 04:04:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662365047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tDUacGUZQoiv1lpQXN/6+sIJHpKv1TlOqACd4LuKOMo=;
 b=dBDI5jmepc/qzgGE5vIYJNbvDBRjuKW5OpvaX6ZAPRBnLWlNLTsFhErMVxfPYTZjTZJQVD
 o8qC7XxT4EHqNNegOVK/EhnH2xpW5+ciNxMXp5ygK8QZ/85yJQkIG7SLdK4QyW9RdDpFBu
 G2pJAOzS9hTi4KKhuUndBEVZdN44C1o=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-68s17GxJO12ko9i1PPHH0g-1; Mon, 05 Sep 2022 04:04:06 -0400
X-MC-Unique: 68s17GxJO12ko9i1PPHH0g-1
Received: by mail-pg1-f200.google.com with SMTP id
 q128-20020a632a86000000b0042fadb61e4aso4082184pgq.3
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 01:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=tDUacGUZQoiv1lpQXN/6+sIJHpKv1TlOqACd4LuKOMo=;
 b=lvB+0AyCs0H6gez9PxZcGi3HbQbcLVmQ4f/lc2t2QpWaEDHUaAtaiuhp8t9KTSOxYQ
 WQ96dcy1mtuDVvVbaGpjSaQfFQjEwScYzw8MxU3WzuCy38sTVYge40YqA/oXd4ajEvLA
 gnj5xQ/x2t2WzWQJaTs/UNmafV+NQ1eYRV6X312RlHSqVV9nARYCaXH062K4ncg1fn+J
 GAllz/jieSO5RtZgb7s+zy0/1GGeY0UFLuWBSHb25hKyc1ncOejnL+bTV40U6wRiCf0G
 fqxzi6etSHk7Gtt4BW0PnxICiA7IWuGrDD4caCs15FyXN6v/D/pQDLY1KF6+ZPauui0g
 kj0w==
X-Gm-Message-State: ACgBeo1h0ur8rSDRLjfsuPhROOAL71kCwa9PWTjSFtG62NU296EC2BhI
 a1433W+Cd5l/LinOjZeOXAoAY3zyt2wiNib+VvmStDKxSjle26pfHCsk+bSKXvEPihE2rIpXdzs
 BarhFD9JtHOzNMfc=
X-Received: by 2002:a63:eb0e:0:b0:429:aefa:9fa9 with SMTP id
 t14-20020a63eb0e000000b00429aefa9fa9mr39586653pgh.122.1662365045206; 
 Mon, 05 Sep 2022 01:04:05 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7fJPsy5fyMZD+g90g/+AGMA7pvtGJszJyMRQG5SsLAbnqcO8QtNu4VGWMhl4gxTxUvbDVBLg==
X-Received: by 2002:a63:eb0e:0:b0:429:aefa:9fa9 with SMTP id
 t14-20020a63eb0e000000b00429aefa9fa9mr39586640pgh.122.1662365044948; 
 Mon, 05 Sep 2022 01:04:04 -0700 (PDT)
Received: from [10.72.13.239] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 pg16-20020a17090b1e1000b001f559e00473sm9915413pjb.43.2022.09.05.01.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 01:04:04 -0700 (PDT)
Message-ID: <e6ce97bd-a121-04c5-8984-95906f34a15c@redhat.com>
Date: Mon, 5 Sep 2022 16:03:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v3 10/15] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_reset()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1661414345.git.kangjie.xu@linux.alibaba.com>
 <b6286db2a6ce2389f44cc44da06c9fd2b8eaaec8.1661414345.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <b6286db2a6ce2389f44cc44da06c9fd2b8eaaec8.1661414345.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.978, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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


在 2022/8/25 16:08, Kangjie Xu 写道:
> Introduce vhost_virtqueue_reset(), which can reset the specific
> virtqueue in the device. Then it will unmap vrings and the desc
> of the virtqueue.
>
> Here we do not reuse the vhost_net_stop_one() or vhost_dev_stop(),
> because they work at queue pair level. We do not use
> vhost_virtqueue_stop() because it may stop the device in the
> backend.


So I think this is not true at least for vhost-net kernel baceknd.


>
> This patch only considers the case of vhost-kernel, when
> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/net/vhost_net.c      | 22 ++++++++++++++++++++++
>   include/net/vhost_net.h |  2 ++
>   2 files changed, 24 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index ccac5b7a64..be51be98b3 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -514,3 +514,25 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
>   
>       return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>   }
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


Do we need to reset e.g last_avail_idx here?

Thanks


> +
> +    vhost_virtqueue_unmap(&net->dev, vdev, net->dev.vqs + idx, idx);
> +}
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 387e913e4e..85d85a4957 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -48,4 +48,6 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net);
>   
>   int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>   
> +void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
> +                               int vq_index);
>   #endif


