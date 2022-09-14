Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 581995B7EEC
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Sep 2022 04:25:49 +0200 (CEST)
Received: from localhost ([::1]:40480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oYI60-00066k-Fw
	for lists+qemu-devel@lfdr.de; Tue, 13 Sep 2022 22:25:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYI4k-00041F-IS
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:24:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37483)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oYI4h-0003fS-QR
 for qemu-devel@nongnu.org; Tue, 13 Sep 2022 22:24:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663122267;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8KV8Tdmluu2CeC93WcirGI+DrOuq3HUwPXC3vfv8GXs=;
 b=FTi0Db8sHwCoLZQtgKcIZoHc3+DXYjphXhYRPUEP0pGlsqcg8FlC+Oo29hxGMpnfVmmlM5
 4dU9sR3kR2V6IqUqD7+EWleIo7KBp4Ls54wfx5s8xKcgxAYJiwSLNiFIdeY4FaJqX7grD4
 cUQX9YHdj1+lDvhtAv3rKVWOSaghe+E=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-387-vPY6d_D8OUCtDhhGoYQDvA-1; Tue, 13 Sep 2022 22:24:25 -0400
X-MC-Unique: vPY6d_D8OUCtDhhGoYQDvA-1
Received: by mail-pl1-f197.google.com with SMTP id
 b11-20020a170902d50b00b0017828988079so6464207plg.21
 for <qemu-devel@nongnu.org>; Tue, 13 Sep 2022 19:24:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=8KV8Tdmluu2CeC93WcirGI+DrOuq3HUwPXC3vfv8GXs=;
 b=Um8646RSSKyyXZjfUFlu1K9POJejF9jpRemUceM3mFt2Jn5NHdDcRvqtVpBrxIp17e
 9chEOiTDmbwHYZrvcuxBkmqI+VIlSKzNb/mekcL4sT4B1DwkmZJp6Qfh7YgElqCBw9DW
 iNhIqkE4h68dRJbL/tIE6omQWCA6FDdY6dcVS3NaCf84WXVpJTEkPv4UcEcH3YIMv5SA
 sA//2ejag01T91+PhOI34z/gAwcYo/ECg0iandKMIjOAZtF9v3Qaxpqsfr/lOgT1cxnp
 eHSu/LuViQ4ndgcPqNctrSjhI9e4cVAV7Y+zWF4uFiA/iZXNaMLilihsAjBx15yGTJXo
 Sqaw==
X-Gm-Message-State: ACgBeo1rRq0Av4Wg8P2se4bwOX8YqAthEXQsSlyLy9XZVW8b+n3QOpnE
 OvGq+xFV3zdlW8B+JEsQit26TPfO1t+QqW2aF00p5nSHnpWMsbkU9Ln5sApxvCAT37xvZLoIJ0q
 vwBK+DFa2Ac4BVdQ=
X-Received: by 2002:a63:6cc7:0:b0:42b:7d8f:7136 with SMTP id
 h190-20020a636cc7000000b0042b7d8f7136mr29737084pgc.15.1663122264767; 
 Tue, 13 Sep 2022 19:24:24 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6jVO5jBesTkqoW6Chp8ZfzdSdUiR0PkOK94r8cy2ie/JANIwqk8l9amF9hHYd/lTEjTSAfdw==
X-Received: by 2002:a63:6cc7:0:b0:42b:7d8f:7136 with SMTP id
 h190-20020a636cc7000000b0042b7d8f7136mr29737071pgc.15.1663122264538; 
 Tue, 13 Sep 2022 19:24:24 -0700 (PDT)
Received: from [10.72.13.238] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 b6-20020a170902d50600b0016c0c82e85csm9316840plg.75.2022.09.13.19.24.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Sep 2022 19:24:24 -0700 (PDT)
Message-ID: <30d3dacf-b1ca-ea92-2ec0-e9499d67a5d3@redhat.com>
Date: Wed, 14 Sep 2022 10:24:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH v4 11/15] vhost-net: vhost-kernel: introduce
 vhost_net_virtqueue_restart()
Content-Language: en-US
To: Kangjie Xu <kangjie.xu@linux.alibaba.com>, qemu-devel@nongnu.org
Cc: mst@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 f4bug@amsat.org, wangyanan55@huawei.com, hengqi@linux.alibaba.com,
 xuanzhuo@linux.alibaba.com
References: <cover.1662916759.git.kangjie.xu@linux.alibaba.com>
 <e95212a61687ae8df7be05af09e220d90160c9a3.1662916759.git.kangjie.xu@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <e95212a61687ae8df7be05af09e220d90160c9a3.1662916759.git.kangjie.xu@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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


在 2022/9/12 01:22, Kangjie Xu 写道:
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
> ---
>   hw/net/vhost_net.c      | 52 +++++++++++++++++++++++++++++++++++++++++
>   include/net/vhost_net.h |  2 ++
>   2 files changed, 54 insertions(+)
>
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 8beecb4d22..1059aa45b4 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -556,3 +556,55 @@ void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
>                            net->dev.vqs + idx,
>                            net->dev.vq_index + idx);
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
> +        return -ENOTSUP;
> +    }


-EBUSY?


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
> +        file.fd = -1;


Let's try reuse  VHOST_FILE_UNBIND.

Other looks good.

Thanks


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
>   void vhost_net_virtqueue_reset(VirtIODevice *vdev, NetClientState *nc,
>                                  int vq_index);
> +int vhost_net_virtqueue_restart(VirtIODevice *vdev, NetClientState *nc,
> +                                int vq_index);
>   #endif


