Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D2586A3C3F
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 09:20:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWXsR-0005RI-HZ; Mon, 27 Feb 2023 02:24:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWXsP-0005R7-Oq
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:24:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1pWXsL-0006Ux-UP
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 02:24:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677482677;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BqRfkJziOVWTgz2m6u36TUb0eCx9zJz3dkGhOiSCknE=;
 b=M5Kn7TBMzZEznTZZZ8mGhnc4BZsTAVhPW3LfGNtoiuqf17H3xIdw9FcVxtlkcbsTEjnX/o
 tLlmtXNs3rxEpirws/2qMsOxnEgvi1akTC+kl3WQsuMB6mZJtDdoB0Wg9uLw7nFIgnrXky
 pxWTV1SG0vZb2JLZ8U6DQRV2hQh4EjA=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-652-pZsvB843NIqc-HjOkOcbiQ-1; Mon, 27 Feb 2023 02:24:35 -0500
X-MC-Unique: pZsvB843NIqc-HjOkOcbiQ-1
Received: by mail-pj1-f72.google.com with SMTP id
 p9-20020a17090a930900b00237a7f862dfso3749641pjo.2
 for <qemu-devel@nongnu.org>; Sun, 26 Feb 2023 23:24:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BqRfkJziOVWTgz2m6u36TUb0eCx9zJz3dkGhOiSCknE=;
 b=xibEu/gjE0V3aSfwkgQ0iCuBOoKyaem/r/G52mV/PTpsz5qCMQ1uweAVXJPq6pDOTs
 xvCV0UZlF0Cw7Wuv1nEni8N2xiSog0wnALzCBIvgxsKYHsBTg8wEELnxphdKfRNNiK+B
 zPDHfXZl1gkwrj9yTQEZGh0GEebcxlqavFRcrKAhpSzBBcXbH9GbgzSjtDgsysJgKvgX
 VEUeFNMh4WNNEmud7wvxFXY4hCffqufex6/ZyT3dOrxViyMokw60puIYYHsi0bBemdN/
 i89lujqucbnYx8RDCZOW/A0OtX9x8rl3h1jG4Ers5FAgPL3QRWvFrYxR+NwNXQc0Ad0Q
 wNog==
X-Gm-Message-State: AO0yUKWuk5jUfo3qviYSCKcnw5jto2F/01zdTieIyVpThl1MWyxIuNZ3
 5QHazO7MlM4LwNqmiU2pJQrnBJ0rK67Ww2eMilhraZLkAS423TJ+xzeGE6XRujsbwCdcIMsE9hZ
 lwznZcLmnUaCO3tQ=
X-Received: by 2002:a17:902:da8e:b0:19b:c37:25e7 with SMTP id
 j14-20020a170902da8e00b0019b0c3725e7mr29355714plx.66.1677482674515; 
 Sun, 26 Feb 2023 23:24:34 -0800 (PST)
X-Google-Smtp-Source: AK7set8vX6lFW0QlupFix5ypN1cDdCGCZxlDq6ClTJx5LCiD1ZUkF6+3to8/rhiA3HelzE8vuckhog==
X-Received: by 2002:a17:902:da8e:b0:19b:c37:25e7 with SMTP id
 j14-20020a170902da8e00b0019b0c3725e7mr29355687plx.66.1677482674249; 
 Sun, 26 Feb 2023 23:24:34 -0800 (PST)
Received: from [10.72.13.83] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a1709027c8900b00186a2274382sm3804096pll.76.2023.02.26.23.24.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 26 Feb 2023 23:24:33 -0800 (PST)
Message-ID: <f3111a92-75a0-c12e-147e-a75084e7457b@redhat.com>
Date: Mon, 27 Feb 2023 15:24:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 06/15] vdpa: add vhost_vdpa->suspended parameter
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
 <20230224155438.112797-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20230224155438.112797-7-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
> This allows vhost_vdpa to track if it is safe to get vring base from the
> device or not.  If it is not, vhost can fall back to fetch idx from the
> guest buffer again.
>
> No functional change intended in this patch, later patches will use this
> field.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>


I think we probably need to re-order the patch, e.g to let this come 
before at least patch 5.


> ---
>   include/hw/virtio/vhost-vdpa.h | 2 ++
>   hw/virtio/vhost-vdpa.c         | 8 ++++++++
>   2 files changed, 10 insertions(+)
>
> diff --git a/include/hw/virtio/vhost-vdpa.h b/include/hw/virtio/vhost-vdpa.h
> index 7997f09a8d..4a7d396674 100644
> --- a/include/hw/virtio/vhost-vdpa.h
> +++ b/include/hw/virtio/vhost-vdpa.h
> @@ -42,6 +42,8 @@ typedef struct vhost_vdpa {
>       bool shadow_vqs_enabled;
>       /* Vdpa must send shadow addresses as IOTLB key for data queues, not GPA */
>       bool shadow_data;
> +    /* Device suspended successfully */
> +    bool suspended;


Should we implement the set/clear in this patch as well?

Thanks


>       /* IOVA mapping used by the Shadow Virtqueue */
>       VhostIOVATree *iova_tree;
>       GPtrArray *shadow_vqs;
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 8cc9c98db9..228677895a 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -1227,6 +1227,14 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
>           return 0;
>       }
>   
> +    if (!v->suspended) {
> +        /*
> +         * Cannot trust in value returned by device, let vhost recover used
> +         * idx from guest.
> +         */
> +        return -1;
> +    }
> +
>       ret = vhost_vdpa_call(dev, VHOST_GET_VRING_BASE, ring);
>       trace_vhost_vdpa_get_vring_base(dev, ring->index, ring->num);
>       return ret;


