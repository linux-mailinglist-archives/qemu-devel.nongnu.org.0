Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 143E5580A49
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 06:19:26 +0200 (CEST)
Received: from localhost ([::1]:46846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGC2X-0006eq-4q
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 00:19:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44656)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGC0F-0004Kh-Ax
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGC0B-0005Pm-Og
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 00:17:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658809018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XXiAFDNnbTIpc4uWZSbuZh2akwcPeKibzrmB+slmtrw=;
 b=QyXAhp5ucTrAiM/WgajE9uzwuWSX+J+pqhbqnbj7FEeGtq3rInXQvoVq6ymDIhoEJncFTe
 /wa+fuylOnM2G4UIx7Y6rHhLcyLZHhkaLGPFTIZCHCO2wP4bh/7IPvoR6N1w9oajC1LNLN
 pl/yvJhqD3rVCQLzUadV/8w+c6ME3Dw=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-P4wXdIPiNpWk-UX76qmxhw-1; Tue, 26 Jul 2022 00:16:54 -0400
X-MC-Unique: P4wXdIPiNpWk-UX76qmxhw-1
Received: by mail-pg1-f199.google.com with SMTP id
 66-20020a630645000000b0041a63d6c638so5861790pgg.2
 for <qemu-devel@nongnu.org>; Mon, 25 Jul 2022 21:16:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=XXiAFDNnbTIpc4uWZSbuZh2akwcPeKibzrmB+slmtrw=;
 b=yVCnowZzNADyzjUDVJlCaaMQzJzhQlmftlhYY3lhIyAYUpKvjF9eEGdlFz1i9zzEpt
 JDFEGtQsK1ifNGPRSAXREvJw5og4jaFh9sBHxnjrZqx1a32kzTYxjs/G6j/tQLN5fuKH
 HnDTpV/HagsCDNEX4fYYYUzduvgcpaqRHGpNBnj9w5yoiHe/N3srfq9j/+lcfXN+Po2D
 cOqtlH4btJjvnB1G4cAND297nmS8Ld4/OhCj30ybqRT6ZUdDd8NrPI3NzTjWeRd8uDkk
 geavo7MlcSge4BiCKwLdgbBKXlIm7vYyemquYD7XdXn28z5tKz67hK3ypJH1LJ2K7SX9
 6MeA==
X-Gm-Message-State: AJIora8mhwCjosj+3FSWQaKefp9FSvQcheMRybjXEj1rlLY0PiBNfAuX
 zyX7AaMPD88jU7r2WWgMayIiERyDYmQ2+fNnUbnjwMvbiftmznkl7zX3rDS+Syzy+WoUl2P+rtg
 4SNLgUyRSsq4F8p4=
X-Received: by 2002:a63:8943:0:b0:41a:b002:664c with SMTP id
 v64-20020a638943000000b0041ab002664cmr13861561pgd.290.1658809013348; 
 Mon, 25 Jul 2022 21:16:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s+aSqOguA3LWINWVlQSWWX1D8onad9U2TLbONuB1Yyt5JNe3JVhqK3dRhUUZbNMiUe+ZMQJw==
X-Received: by 2002:a63:8943:0:b0:41a:b002:664c with SMTP id
 v64-20020a638943000000b0041ab002664cmr13861550pgd.290.1658809013002; 
 Mon, 25 Jul 2022 21:16:53 -0700 (PDT)
Received: from [10.72.12.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 z124-20020a623382000000b00528c34f514dsm10453535pfz.121.2022.07.25.21.16.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Jul 2022 21:16:52 -0700 (PDT)
Message-ID: <df5a8738-212e-c0f0-8085-288805e4b779@redhat.com>
Date: Tue, 26 Jul 2022 12:16:48 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH 12/16] vhost-net: introduce restart and stop for
 vhost_net's vqs
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, hengqi@linux.alibaba.com, xuanzhuo@linux.alibaba.com
References: <cover.1658141552.git.kangjie.xu@linux.alibaba.com>
 <67cdafe53cfd096060957426c307d1580f3fd2e4.1658141552.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <67cdafe53cfd096060957426c307d1580f3fd2e4.1658141552.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
> Introduce vhost_virtqueue_restart(), which can restart the
> virtqueue when the vhost net started running before.
>
> Introduce vhost_virtqueue_stop(), which can disable the vq
> and unmap vrings and the desc of the vq. When disabling the
> vq, the function is blocked and waits for a reply.
>
> Combining the two functions, we can reset a virtqueue with a
> started vhost net.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   hw/net/vhost_net.c      | 55 +++++++++++++++++++++++++++++++++++++++++
>   include/net/vhost_net.h |  5 ++++
>   2 files changed, 60 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index ccac5b7a64..4f5f034c11 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -514,3 +514,58 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu)
>   
>       return vhost_ops->vhost_net_set_mtu(&net->dev, mtu);
>   }
> +
> +void vhost_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
> +                          int vq_index)


Let's rename this as vhost_net_virtqueue_stop()


> +{
> +    VHostNetState *net = get_vhost_net(nc->peer);
> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
> +    int r;
> +
> +    assert(vhost_ops);
> +
> +    r = vhost_ops->vhost_set_single_vring_enable(&net->dev, vq_index, 0, true);
> +    if (r < 0) {
> +        goto err_queue_disable;
> +    }
> +
> +    vhost_dev_virtqueue_release(&net->dev, vdev, vq_index);
> +
> +    return;
> +
> +err_queue_disable:
> +    error_report("Error when releasing the qeuue.");
> +}
> +
> +int vhost_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
> +                            int vq_index)
> +{
> +    VHostNetState *net = get_vhost_net(nc->peer);
> +    const VhostOps *vhost_ops = net->dev.vhost_ops;
> +    int r;
> +
> +    if (!net->dev.started) {
> +        return 0;
> +    }
> +
> +    assert(vhost_ops);
> +
> +    r = vhost_dev_virtqueue_restart(&net->dev, vdev, vq_index);
> +    if (r < 0) {
> +        goto err_start;
> +    }
> +
> +    r = vhost_ops->vhost_set_single_vring_enable(&net->dev, vq_index, 1,
> +                                                 false);


So it looks nothing vhost_net specific but vhost. And why not do 
set_single_vring_enable in vhost_dev_virtqueue_restart() (btw, the name 
of this function looks confusing).

Thanks


> +    if (r < 0) {
> +        goto err_start;
> +    }
> +
> +    return 0;
> +
> +err_start:
> +    error_report("Error when restarting the queue.");
> +    vhost_dev_stop(&net->dev, vdev);
> +
> +    return r;
> +}
> diff --git a/include/net/vhost_net.h b/include/net/vhost_net.h
> index 387e913e4e..fcb09e36ef 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -48,4 +48,9 @@ uint64_t vhost_net_get_acked_features(VHostNetState *net);
>   
>   int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>   
> +void vhost_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
> +                          int vq_index);
> +int vhost_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
> +                            int vq_index);
> +
>   #endif


