Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4E5690EE1
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 18:09:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQAPL-0003A7-2r; Thu, 09 Feb 2023 12:08:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pQAPJ-00039r-J6
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 12:08:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1pQAPH-0005e5-Mn
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 12:08:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675962501;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lA+SL3w8vdX8sHTquHU0588M+cLpP+SDZbS3ho1a8VQ=;
 b=RG5B9kDBSJjVIgaRIaXTVi+PtLiw3/u0JL2A6A4Q2NTXK9f5MWNC+LZ/7AG3e+S3U7erOF
 ie9M3peYoh5WyKirV+pX7PeyFpTeyZDj4smbL9RQZZHrTl2IHnjx4Hpe0b+mGfsxSiDLqs
 O8gWC8KW6UCBuGMv2urzH8p4gTQ8KSI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-455-raSKH6gRP1WsyMmZ3EK91g-1; Thu, 09 Feb 2023 12:08:12 -0500
X-MC-Unique: raSKH6gRP1WsyMmZ3EK91g-1
Received: by mail-qv1-f69.google.com with SMTP id
 jo26-20020a056214501a00b0053aa15f61d4so1584174qvb.7
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 09:08:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lA+SL3w8vdX8sHTquHU0588M+cLpP+SDZbS3ho1a8VQ=;
 b=3ZQW2eEdP6DOI8Unq1gF4SY83YEap8uK/xF8dZYmMHatHZfqY7T2YcVjy77GifvNMQ
 lX3cw68+14QyU3pJjbb9k1sNRAAeviM64xfZq4qHQDf6VYQ7rZbLVvtGZqn47PDfDRdU
 QP5wDxOLjfbA1pd+h6AMONWLW2Na4Cd7YxMk4rvIjwLztCSKIsyqw0MYpwT5fElJndeZ
 8fc7SeUMkTvvWXnqlbhDBmHxLc2gAZHUHVzjKxl34mcPe/e/NQo1AdmWsqheFWnwCQis
 yPf586EjYb4dlO910qJlcOpG15MtG3wVdj7hGsWZxAq0vrFoWZm9XtY6f5HZW9klozsM
 Yu+g==
X-Gm-Message-State: AO0yUKVSlxXrsEvloHziC6h/XeFQINqN1fOPiB0mgjA+bLVWbaEj/Yet
 Mz11aoY4ghU97Fj4bH4q3wiGXQIkviXK6fVHiuZj4qyu5BEVLLEmIbsi7r8pc38ZQ/Q2sSPOreE
 UnQWNpzr1Gyfh/kQqaiRR
X-Received: by 2002:a05:622a:146:b0:3b9:b43e:5733 with SMTP id
 v6-20020a05622a014600b003b9b43e5733mr20419779qtw.61.1675962491695; 
 Thu, 09 Feb 2023 09:08:11 -0800 (PST)
X-Google-Smtp-Source: AK7set9IgFP6NU/hSVy82ETDNHxH/3urdsp04sHB+A39uTP0ePia/jOdS30PfrSf15W9Y9yiM5NUkQ==
X-Received: by 2002:a05:622a:146:b0:3b9:b43e:5733 with SMTP id
 v6-20020a05622a014600b003b9b43e5733mr20419745qtw.61.1675962491382; 
 Thu, 09 Feb 2023 09:08:11 -0800 (PST)
Received: from [192.168.100.30] ([82.142.8.70])
 by smtp.gmail.com with ESMTPSA id
 c20-20020ae9ed14000000b00720ae160601sm1727652qkg.22.2023.02.09.09.08.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Feb 2023 09:08:10 -0800 (PST)
Message-ID: <ddfe2d63-36e7-b402-1a59-3eae9e1d9753@redhat.com>
Date: Thu, 9 Feb 2023 18:08:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH] vdpa: stop all svq on device deletion
Content-Language: en-US
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Lei Yang <leiyang@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20230209170004.899472-1-eperezma@redhat.com>
From: Laurent Vivier <lvivier@redhat.com>
In-Reply-To: <20230209170004.899472-1-eperezma@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/9/23 18:00, Eugenio Pérez wrote:
> Not stopping them leave the device in a bad state when virtio-net
> fronted device is unplugged with device_del monitor command.
> 
> This is not triggable in regular poweroff or qemu forces shutdown
> because cleanup is called right after vhost_vdpa_dev_start(false).  But
> devices hot unplug does not call vdpa device cleanups.  This lead to all
> the vhost_vdpa devices without stop the SVQ but the last.
> 
> Fix it and clean the code, making it symmetric with
> vhost_vdpa_svqs_start.
> 
> Fixes: dff4426fa656 ("vhost: Add Shadow VirtQueue kick forwarding capabilities")
> Reported-by: Lei Yang <leiyang@redhat.com>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   hw/virtio/vhost-vdpa.c | 17 ++---------------
>   1 file changed, 2 insertions(+), 15 deletions(-)
> 
> diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
> index 542e003101..df3a1e92ac 100644
> --- a/hw/virtio/vhost-vdpa.c
> +++ b/hw/virtio/vhost-vdpa.c
> @@ -689,26 +689,11 @@ static int vhost_vdpa_get_device_id(struct vhost_dev *dev,
>       return ret;
>   }
>   
> -static void vhost_vdpa_reset_svq(struct vhost_vdpa *v)
> -{
> -    if (!v->shadow_vqs_enabled) {
> -        return;
> -    }
> -
> -    for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
> -        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
> -        vhost_svq_stop(svq);
> -    }
> -}
> -
>   static int vhost_vdpa_reset_device(struct vhost_dev *dev)
>   {
> -    struct vhost_vdpa *v = dev->opaque;
>       int ret;
>       uint8_t status = 0;
>   
> -    vhost_vdpa_reset_svq(v);
> -
>       ret = vhost_vdpa_call(dev, VHOST_VDPA_SET_STATUS, &status);
>       trace_vhost_vdpa_reset_device(dev, status);
>       return ret;
> @@ -1100,6 +1085,8 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
>   
>       for (unsigned i = 0; i < v->shadow_vqs->len; ++i) {
>           VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, i);
> +
> +        vhost_svq_stop(svq);
>           vhost_vdpa_svq_unmap_rings(dev, svq);
>   
>           event_notifier_cleanup(&svq->hdev_kick);

Tested-by: Laurent Vivier <lvivier@redhat.com>


