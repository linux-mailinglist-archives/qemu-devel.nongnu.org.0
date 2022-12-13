Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315C264B6D0
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Dec 2022 15:07:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p55vz-00020H-M4; Tue, 13 Dec 2022 09:07:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p55vj-0001xa-Q1
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:06:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p55vi-0006VY-7F
 for qemu-devel@nongnu.org; Tue, 13 Dec 2022 09:06:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670940404;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yflbXprPav5LePv1sfr7eUhwKL35oUiK+qy8NJcnxU8=;
 b=gZOf9MtwvgoQplrxm166569Y1jg7hiUKm46386hYQwXOw7CvVUeubWQQVoBtUKicsyNxD4
 pJjeEtK+b9uFY2FtY1AnMrg7lDMJZT8cOxp7hsKrjhNjOwt6iVtDNzeYuI0RiYZrKmH0fP
 wI4yJ/4ctMRQxVTuNo22Zh0tE1lE77E=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-173-rzsWo6kSMMSyAkoCMAfbYA-1; Tue, 13 Dec 2022 09:06:12 -0500
X-MC-Unique: rzsWo6kSMMSyAkoCMAfbYA-1
Received: by mail-wr1-f69.google.com with SMTP id
 c21-20020adfa315000000b002425bf67a87so2895298wrb.19
 for <qemu-devel@nongnu.org>; Tue, 13 Dec 2022 06:06:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yflbXprPav5LePv1sfr7eUhwKL35oUiK+qy8NJcnxU8=;
 b=y/WbLpgjrpOsqLDeU6ZSvYxeNE2t/a6ag98lucpYzYlXwW6CCsg5uN1RZtiGwYUVuq
 wp+gEO8pHxG/H4kviUdsTwB5PQR8x9V3nmWmi2/tPopSsJ440Z+nr4hVQgoiGmkeb8EQ
 +VfpZ/pAkCaRNBWdHZ31R7OXwamT1L/NJsw2tszTVdho1tFJ83B4XquLpjqvw2XDy5FT
 pRuL+WJMENLyIOoN3rXMtQ+KYySE/7DH4td1HfxTGdrVxRmeTtUDBdM2fbC1lKGYr3vL
 VyqAybwGEUtiUjNirOPf7W64XlZyEO+iGFh/3IJ0qY4vZOblhSTJ3synDeQmIL5Ks/n4
 aQMg==
X-Gm-Message-State: ANoB5plPjxipCwOYrV5gZt2WA+bZshAozq1mYssEZ8PSUj10C6+P49Rf
 rQ1VuXjYx6A3ITCqLCe2lAnOVdUux4DyBbLPsB0Lq3kZQAEB5L5hhLLOqDRqOwrAkxgF7SDdr50
 r55GdU3P5Mhk2WHM=
X-Received: by 2002:a05:600c:4f85:b0:3cf:93de:14e8 with SMTP id
 n5-20020a05600c4f8500b003cf93de14e8mr15519865wmq.39.1670940371218; 
 Tue, 13 Dec 2022 06:06:11 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6mv2mCP+QiSyHoP/37T6W5Nou5ICpPLYJl8LjNwQQxn5s4UxXM2OEI1/pJ1FfIa23jDLBi6w==
X-Received: by 2002:a05:600c:4f85:b0:3cf:93de:14e8 with SMTP id
 n5-20020a05600c4f8500b003cf93de14e8mr15519841wmq.39.1670940370881; 
 Tue, 13 Dec 2022 06:06:10 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 o25-20020a05600c511900b003c6f8d30e40sm14313639wms.31.2022.12.13.06.06.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Dec 2022 06:06:10 -0800 (PST)
Message-ID: <871a3c4b-a4a1-5736-8593-8cbaef28bad9@redhat.com>
Date: Tue, 13 Dec 2022 15:06:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 10/24] vfio-user: get device info
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <d0fcc3415ab22bf66bbd86c1d69d4dade8c023bb.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <d0fcc3415ab22bf66bbd86c1d69d4dade8c023bb.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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

On 11/9/22 00:13, John Johnson wrote:
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   hw/vfio/pci.c           | 15 ++++++++++++++
>   hw/vfio/user-protocol.h | 13 ++++++++++++
>   hw/vfio/user.c          | 55 +++++++++++++++++++++++++++++++++++++++++++++++++
>   hw/vfio/user.h          |  2 ++
>   4 files changed, 85 insertions(+)
> 
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index b2534b3..2e0e41d 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3465,6 +3465,8 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>       VFIODevice *vbasedev = &vdev->vbasedev;
>       SocketAddress addr;
>       VFIOProxy *proxy;
> +    struct vfio_device_info info;
> +    int ret;
>       Error *err = NULL;
>   
>       /*
> @@ -3503,6 +3505,19 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>       vbasedev->ops = &vfio_user_pci_ops;
>       vbasedev->type = VFIO_DEVICE_TYPE_PCI;
>       vbasedev->dev = DEVICE(vdev);
> +    vbasedev->io_ops = &vfio_dev_io_sock;
> +
> +    ret = VDEV_GET_INFO(vbasedev, &info);

We are dealing with a "vfio-user-pci" device since this is being
called from the realize handler.

Is it really useful to go through the ops abstraction layer here ?
Can't we simply call vfio_user_get_info() ?  and propagate the
underlying Error while we're at it.
  
> +    if (ret) {
> +        error_setg_errno(errp, -ret, "get info failure");
> +        goto error;
> +    }
> +
> +    vfio_populate_device(vdev, &err);
> +    if (err) {
> +        error_propagate(errp, err);
> +        goto error;
> +    }
>   
>       return;
>   
> diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
> index 5de5b20..43912a5 100644
> --- a/hw/vfio/user-protocol.h
> +++ b/hw/vfio/user-protocol.h
> @@ -113,4 +113,17 @@ typedef struct {
>    */
>   #define VFIO_USER_DEF_MAX_BITMAP (256 * 1024 * 1024)
>   
> +/*
> + * VFIO_USER_DEVICE_GET_INFO
> + * imported from struct_device_info

from struct vfio_device_info

Thanks,

C.

> + */
> +typedef struct {
> +    VFIOUserHdr hdr;
> +    uint32_t argsz;
> +    uint32_t flags;
> +    uint32_t num_regions;
> +    uint32_t num_irqs;
> +    uint32_t cap_offset;
> +} VFIOUserDeviceInfo;
> +
>   #endif /* VFIO_USER_PROTOCOL_H */
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index 31bcc93..7873534 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -31,6 +31,14 @@
>   #include "qapi/qmp/qbool.h"
>   #include "user.h"
>   
> +
> +/*
> + * These are to defend against a malign server trying
> + * to force us to run out of memory.
> + */
> +#define VFIO_USER_MAX_REGIONS   100
> +#define VFIO_USER_MAX_IRQS      50
> +
>   static int wait_time = 5000;   /* wait up to 5 sec for busy servers */
>   static IOThread *vfio_user_iothread;
>   
> @@ -1075,3 +1083,50 @@ int vfio_user_validate_version(VFIOProxy *proxy, Error **errp)
>   
>       return 0;
>   }
> +
> +static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
> +{
> +    VFIOUserDeviceInfo msg;
> +
> +    memset(&msg, 0, sizeof(msg));
> +    vfio_user_request_msg(&msg.hdr, VFIO_USER_DEVICE_GET_INFO, sizeof(msg), 0);
> +    msg.argsz = sizeof(struct vfio_device_info);
> +
> +    vfio_user_send_wait(proxy, &msg.hdr, NULL, 0, false);
> +    if (msg.hdr.flags & VFIO_USER_ERROR) {
> +        return -msg.hdr.error_reply;
> +    }
> +
> +    memcpy(info, &msg.argsz, sizeof(*info));
> +    return 0;
> +}
> +
> +
> +/*
> + * Socket-based io_ops
> + */
> +
> +static int vfio_user_io_get_info(VFIODevice *vbasedev,
> +                                 struct vfio_device_info *info)
> +{
> +    int ret;
> +
> +    ret = vfio_user_get_info(vbasedev->proxy, info);
> +    if (ret) {
> +        return ret;
> +    }
> +
> +    /* defend against a malicious server */
> +    if (info->num_regions > VFIO_USER_MAX_REGIONS ||
> +        info->num_irqs > VFIO_USER_MAX_IRQS) {
> +        error_printf("vfio_user_get_info: invalid reply\n");
> +        return -EINVAL;
> +    }
> +
> +    return 0;
> +}
> +
> +VFIODevIO vfio_dev_io_sock = {
> +    .get_info = vfio_user_io_get_info,
> +};
> +
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> index 8ce3cd9..2547cf6 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -92,4 +92,6 @@ void vfio_user_set_handler(VFIODevice *vbasedev,
>                              void *reqarg);
>   int vfio_user_validate_version(VFIOProxy *proxy, Error **errp);
>   
> +extern VFIODevIO vfio_dev_io_sock;
> +
>   #endif /* VFIO_USER_H */


