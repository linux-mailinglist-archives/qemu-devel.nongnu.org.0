Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 449F959F179
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 04:47:09 +0200 (CEST)
Received: from localhost ([::1]:55572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQgQ8-0002Zx-7m
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 22:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgNg-0007xE-Fo
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:44:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oQgNe-00062Q-AF
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 22:44:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661309073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4FWrzns2ZHaolmOxxsvsxL0OWUXMZEGQ78AdS9XWCZQ=;
 b=JUFkbuOjzzqbr9axeFP8e32RpVf7jnYsakJnyI/HOHeM365N3cIavbSQhLNmSp4SxJdmFs
 EYsVHtTUn/+Tvu2Tr7DY+sQeTAZuLAEws0G2sESShnRSJ4OFBrz9Xzh3lfu6cNYZjfFOtK
 o9Wwrx1XhGA/dgnInaObFGHn6utMFv8=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-386-My5v1CzyMkyoFDFWpLApXQ-1; Tue, 23 Aug 2022 22:44:32 -0400
X-MC-Unique: My5v1CzyMkyoFDFWpLApXQ-1
Received: by mail-pj1-f71.google.com with SMTP id
 m11-20020a17090a3f8b00b001fabfce6a26so127493pjc.4
 for <qemu-devel@nongnu.org>; Tue, 23 Aug 2022 19:44:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4FWrzns2ZHaolmOxxsvsxL0OWUXMZEGQ78AdS9XWCZQ=;
 b=XEd2BCX4FJxKEQvG0mbUyCLa1Sf2o7jhoAepFb64w82nF4AHN4j5EzDEdS3DmMzjgo
 /zI1+e9M3SFUX7ep/y5CnyACJScUFhVp/W1a4vHgOgXGMX8xWNXzostLzR1ZW2XhPQF8
 GjjBgjJhjMpPAuRYChX/65Z/7A7M2siXnc2Uz+2QDp7lVbVQOXsF2H324EzXev44vP9I
 KEvTx510zi8qKDFcgwbojbX/PtrCTvLVww4sRxSTqsHYXbvbSIUMJ2azqOTWhQKiC69e
 JErTjaVgvmnBONxcMBJiGssv4FH4zmcZsED08U5Xo/190SJcE5M/weOZu9VabgdjgqOc
 IGMg==
X-Gm-Message-State: ACgBeo036Nb2Qo5np5IKMcInQ4V747XXriobjDilUPwPXitfStR9qthS
 F/av9ShE9wiuEkJGRDrmBqJSkzAcB1A5+y/OpYfKKUpJckZ2GQZmLy2BgOwAe71QG/IpTQ9vRLM
 3wYT9XAbviNZPHik=
X-Received: by 2002:a17:903:244f:b0:173:12bd:7296 with SMTP id
 l15-20020a170903244f00b0017312bd7296mr1645298pls.145.1661309071124; 
 Tue, 23 Aug 2022 19:44:31 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4+HYMp+RC0tbZ7RxtM8JtzPX8UbB5rMRA2yAyXU/NM02rXEI36NWu0aug6tlTZQcOPKfuqhQ==
X-Received: by 2002:a17:903:244f:b0:173:12bd:7296 with SMTP id
 l15-20020a170903244f00b0017312bd7296mr1645273pls.145.1661309070810; 
 Tue, 23 Aug 2022 19:44:30 -0700 (PDT)
Received: from [10.72.13.201] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 u14-20020a170903124e00b00173164792aasm89031plh.127.2022.08.23.19.44.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Aug 2022 19:44:30 -0700 (PDT)
Message-ID: <23bcc037-8b71-a4f4-9b11-7062b024d4ff@redhat.com>
Date: Wed, 24 Aug 2022 10:44:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v2 12/24] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_restart()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1660611460.git.kangjie.xu@linux.alibaba.com>
 <be4731ad4548af158396dc5005b656ceb147d3ad.1660611460.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <be4731ad4548af158396dc5005b656ceb147d3ad.1660611460.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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


在 2022/8/16 09:06, Kangjie Xu 写道:
> Introduce vhost_net_virtqueue_restart(), which can restart the
> virtqueue when the vhost net started running before. If it fails
> to restart the virtqueue, the device will be stopped.
>
> This patch only considers the case for vhost-kernel, when
> NetClientDriver is NET_CLIENT_DRIVER_TAP.
>
> Signed-off-by: Kangjie Xu <kangjie.xu@linux.alibaba.com>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>


I would explain why current vhost_net_start_one()/vhost_net_stop_one() 
can't work. Is it because it works at queue pair level? If yes can we 
restructure the code and try to reuse ?

Thanks


> ---
>   hw/net/vhost_net.c      | 48 +++++++++++++++++++++++++++++++++++++++++
>   include/net/vhost_net.h |  2 ++
>   2 files changed, 50 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index aa60dd901c..2ab67e875e 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -535,3 +535,51 @@ void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
>   
>       vhost_dev_virtqueue_stop(&net->dev, vdev, idx);
>   }
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
> +        return 0;
> +    }
> +
> +    assert(vhost_ops);
> +
> +    idx =  vhost_ops->vhost_get_vq_index(&net->dev, vq_index);
> +
> +    r = vhost_dev_virtqueue_restart(&net->dev, vdev, idx);
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
> +        file.fd = -1;
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
> index 9b3aaf3814..e11a297380 100644
> --- a/include/net/vhost_net.h
> +++ b/include/net/vhost_net.h
> @@ -50,4 +50,6 @@ int vhost_net_set_mtu(struct vhost_net *net, uint16_t mtu);
>   
>   void vhost_net_virtqueue_stop(VirtIODevice *vdev, NetClientState *nc,
>                                 int vq_index);
> +int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
> +                                int vq_index);
>   #endif


