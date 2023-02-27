Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A8576A3C5B
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:23:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWYdD-0004yz-GT; Mon, 27 Feb 2023 03:13:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWYdA-0004xl-O7
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:13:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWYd9-00063L-5p
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 03:13:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677485586;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5DAVnTYAtQHEGqRzHa5Lwp4NgBHmokSHOFK2RDhsKbQ=;
 b=Qxbk5Hxh44gHdLZ7FxC/SgxDvWEgAaXgjum0gykc9cBVmBJRR0Gu6sNL5OqqyFqtBA/iDE
 AAVkF3t10WcRgq3PfONFB0Jb19wvYkjkFCf8QPBxU9ZGfXhYNW9TQjSDOklcWOSqD1t9Ax
 wV5HVZQJjIF5MydpvmkQp8XUOqvyoVk=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-661-jda8BLvSPQqSzDVua5LpmQ-1; Mon, 27 Feb 2023 03:12:59 -0500
X-MC-Unique: jda8BLvSPQqSzDVua5LpmQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 m1-20020a17090a668100b00237d84de790so950270pjj.0
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 00:12:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5DAVnTYAtQHEGqRzHa5Lwp4NgBHmokSHOFK2RDhsKbQ=;
 b=HohCG5Pue5cVs2RQHMU2gfr4DF67uWDGK3iudZgYLIj07wlSWbtmN4LC2XP8cBwyhK
 XueL1BeioN9qmi1+84NIPuzqMNIJedMCCgYum1O72/dqU3UZhW6Oxa9Baaxet7ZwmGmG
 ZISgno6hhvBv8nqNSYGXtZQWQfRTJyHhEUA9HPsiDHQMr2+k8IxP+0RbmWS6V6ECw/M8
 6PEqCFevhT+N/ZhxXNUL2QKPgqijbpdWvJjHr3TsW2Wb/D646jUa3FAsqj8a2Gf6r+bX
 Dh1eb3C4pNnxeXay7snb9au0x9bcOxKqO61EeaXC/u4t2zbDgzpBEzuf3VJl2yc/txnN
 q3mQ==
X-Gm-Message-State: AO0yUKVgjTpswFc+dzTKR5zF/nOMZcvlhccgkGznSPm7dyCcyKAF2cBg
 bqqFbBeTHXmf0c3LEAqgXPJQso5ODxyGNDsIkGDr2hBkMxDr9i8f3RDnRhyfWu7JO8fwje44HTg
 eXkN6MP5iX54pCKI=
X-Received: by 2002:a17:903:1390:b0:19c:b11b:ffe3 with SMTP id
 jx16-20020a170903139000b0019cb11bffe3mr13523725plb.23.1677485578162; 
 Mon, 27 Feb 2023 00:12:58 -0800 (PST)
X-Google-Smtp-Source: AK7set+FKdw5XBaDf8PETzZIIX0Ka6KUuwhVZcUzDA9yECP/l5m+7vA93exeG48Jl2elXXueKJovdg==
X-Received: by 2002:a17:903:1390:b0:19c:b11b:ffe3 with SMTP id
 jx16-20020a170903139000b0019cb11bffe3mr13523712plb.23.1677485577873; 
 Mon, 27 Feb 2023 00:12:57 -0800 (PST)
Received: from [10.72.13.83] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 jg15-20020a17090326cf00b0019adbef6a63sm3938244plb.235.2023.02.27.00.12.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 00:12:57 -0800 (PST)
Message-ID: <687e3228-2070-2842-0e30-c636c2fbda05@redhat.com>
Date: Mon, 27 Feb 2023 16:12:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 11/15] vdpa net: block migration if the device has CVQ
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Shannon Nelson <snelson@pensando.io>, Gautam Dawar <gdawar@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 longpeng2@huawei.com, virtualization@lists.linux-foundation.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Cindy Lu <lulu@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, si-wei.liu@oracle.com,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Eli Cohen <eli@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>
References: <20230224155438.112797-1-eperezma@redhat.com>
 <20230224155438.112797-12-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230224155438.112797-12-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


在 2023/2/24 23:54, Eugenio Pérez 写道:
> Devices with CVQ needs to migrate state beyond vq state.  Leaving this
> to future series.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
> v3: Migration blocker is registered in vhost_dev.
> ---
>   include/hw/virtio/vhost-vdpa.h | 1 +
>   hw/virtio/vhost-vdpa.c         | 1 +
>   net/vhost-vdpa.c               | 9 +++++++++
>   3 files changed, 11 insertions(+)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 4a7d396674..c278a2a8de 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -50,6 +50,7 @@ typedef struct vhost_vdpa {
>       const VhostShadowVirtqueueOps *shadow_vq_ops;
>       void *shadow_vq_ops_opaque;
>       struct vhost_dev *dev;
> +    Error *migration_blocker;
>       VhostVDPAHostNotifier notifier[VIRTIO_QUEUE_MAX];
>   } VhostVDPA;
>   
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 27655e7582..25b64ae854 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -438,6 +438,7 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
>       v->msg_type = VHOST_IOTLB_MSG_V2;
>       vhost_vdpa_init_svq(dev, v);
>   
> +    error_propagate(&dev->migration_blocker, v->migration_blocker);
>       if (!vhost_vdpa_first_dev(dev)) {
>           return 0;
>       }
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index c5512ddf10..4f983df000 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -828,6 +828,15 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>   
>           s->vhost_vdpa.shadow_vq_ops = &vhost_vdpa_net_svq_ops;
>           s->vhost_vdpa.shadow_vq_ops_opaque = s;
> +
> +        /*
> +         * TODO: We cannot migrate devices with CVQ as there is no way to set
> +         * the device state (MAC, MQ, etc) before starting datapath.
> +         *
> +         * Migration blocker ownership now belongs to v


The sentence is incomplete.

Other looks good.

Thanks


> +         */
> +        error_setg(&s->vhost_vdpa.migration_blocker,
> +                   "net vdpa cannot migrate with CVQ feature");
>       }
>       ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa, queue_pair_index, nvqs);
>       if (ret) {


