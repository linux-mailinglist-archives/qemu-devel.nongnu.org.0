Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE7F390DC6
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 03:09:06 +0200 (CEST)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lli2j-0003E3-Ba
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 21:09:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lli0z-0001nC-LR
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lli0p-0005j5-51
 for qemu-devel@nongnu.org; Tue, 25 May 2021 21:07:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621991225;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wodWiuTTjVvJeppQlgse+2mrtiAeVgbTGPL1iJuG7Qg=;
 b=P5x38fHiq4k0PnF2uTd1FV7bgngFrv+B8X97UO6n7jZwA1kI3OVwKVnnQOuLvDPol1wkzx
 hROw2DUescTCA60yaqnIdC/nibxDGXb3HqKXCPOeQY82Yw53PVYCiZLeTq8Sy4g7+dsWB6
 y2NZZCW+7tquY5eWpP3EfS/sco72mzc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-_h084oGVMD2i52izDAVggQ-1; Tue, 25 May 2021 21:07:01 -0400
X-MC-Unique: _h084oGVMD2i52izDAVggQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 pf14-20020a17090b1d8eb029015c31e36747so11366134pjb.2
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 18:07:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wodWiuTTjVvJeppQlgse+2mrtiAeVgbTGPL1iJuG7Qg=;
 b=EurUdgkYbfGVZtwVIjf7QA8oD6ORTDHAtwIM+Fkm75SU4k6riweA7G+aDFuh8QSLbS
 a34qbYM2efDC+lHVerWgti51MauUX9Jrspudqiqbf5j6emtd26zVHB13NfKFZaNSvZpu
 /X+APumdlqGq6zk/WLBUrqnZcnbCQkqpMMvzr4NU9WiRhG7h50Xm6F2K7omAUzD4/HNM
 IIIGRXR24JGgkYXGBJ6J8pZQxRCNmftncUwV2KJuNtf3aEXq5AVQjHRcDfKpWqEIoqHx
 qMC6yQQkKYWLVQgqqHhtFhnzFeTtceWUEm+5TJaCV7qtxGPnPvD80qIJcQ0Bf6ufxY2C
 HTFw==
X-Gm-Message-State: AOAM531Vsgxi9agXoyDfNDUeMivjMJG0xPb1N/Lob8dL35/BL+WUFCe9
 mjy3cZoRpkrOkfkTdPmPE8CHtg29hJPgpENKU3ts4lKTVaxd3gXVToKAG25glL78GEReBnkmXxp
 Ea+yZfNlL97Eib74=
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr21474321pgb.110.1621991220309; 
 Tue, 25 May 2021 18:07:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxszp4dUhckfW0D05y+B1LtbLTL3QorVVEutcyW3Q/n7dk4XHLAd0g42hztIA6zUI66bKdX0g==
X-Received: by 2002:a63:5b0e:: with SMTP id p14mr21474297pgb.110.1621991219950; 
 Tue, 25 May 2021 18:06:59 -0700 (PDT)
Received: from wangxiaodeMacBook-Air.local ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id i8sm15604421pgt.58.2021.05.25.18.06.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 May 2021 18:06:59 -0700 (PDT)
Subject: Re: [RFC v3 06/29] virtio-net: Honor VIRTIO_CONFIG_S_DEVICE_STOPPED
To: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>, qemu-devel@nongnu.org
References: <20210519162903.1172366-1-eperezma@redhat.com>
 <20210519162903.1172366-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e64b9813-66e5-2417-3feb-65f0376db7e0@redhat.com>
Date: Wed, 26 May 2021 09:06:49 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <20210519162903.1172366-7-eperezma@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Michael Lilja <ml@napatech.com>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2021/5/20 上午12:28, Eugenio Pérez 写道:
> So the guest can stop and start net device. It implements the RFC
> https://lists.oasis-open.org/archives/virtio-comment/202012/msg00027.html
>
> To stop (as "pause") the device is required to migrate status and vring
> addresses between device and SVQ.
>
> This is a WIP commit: as with VIRTIO_F_QUEUE_STATE, is introduced in
> virtio_config.h before of even proposing for the kernel, with no feature
> flag, and, with no checking in the device. It also needs a modified
> vp_vdpa driver that supports to set and retrieve status.
>
> Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
> ---
>   include/standard-headers/linux/virtio_config.h | 2 ++
>   hw/net/virtio-net.c                            | 4 +++-
>   2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/include/standard-headers/linux/virtio_config.h b/include/standard-headers/linux/virtio_config.h
> index 59fad3eb45..b3f6b1365d 100644
> --- a/include/standard-headers/linux/virtio_config.h
> +++ b/include/standard-headers/linux/virtio_config.h
> @@ -40,6 +40,8 @@
>   #define VIRTIO_CONFIG_S_DRIVER_OK	4
>   /* Driver has finished configuring features */
>   #define VIRTIO_CONFIG_S_FEATURES_OK	8
> +/* Device is stopped */
> +#define VIRTIO_CONFIG_S_DEVICE_STOPPED 32
>   /* Device entered invalid state, driver must reset it */
>   #define VIRTIO_CONFIG_S_NEEDS_RESET	0x40
>   /* We've given up on this device. */
> diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
> index 96a3cc8357..2d3caea289 100644
> --- a/hw/net/virtio-net.c
> +++ b/hw/net/virtio-net.c
> @@ -198,7 +198,9 @@ static bool virtio_net_started(VirtIONet *n, uint8_t status)
>   {
>       VirtIODevice *vdev = VIRTIO_DEVICE(n);
>       return (status & VIRTIO_CONFIG_S_DRIVER_OK) &&
> -        (n->status & VIRTIO_NET_S_LINK_UP) && vdev->vm_running;
> +        (!(n->status & VIRTIO_CONFIG_S_DEVICE_STOPPED)) &&
> +        (n->status & VIRTIO_NET_S_LINK_UP) &&
> +        vdev->vm_running;
>   }
>   
>   static void virtio_net_announce_notify(VirtIONet *net)


It looks to me this is only the part of pause. We still need the resume?

Thanks



