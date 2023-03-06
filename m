Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E12A6AC9B0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 18:21:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZEWA-0005C3-1w; Mon, 06 Mar 2023 12:20:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZEW7-0005AR-JD
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:20:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pZEW6-0007Gv-3H
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 12:20:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678123253;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UO7I4IIkxq8nJBBTOuRr6vYwTUNbSpuyzumQJnh2gCw=;
 b=ZjUzaa4aQVTXUZ1Qzk+WfxtHSHYe1G/B04DbPrZMsiJsvIG02H8h2h1yuT7OyuST4/Vexr
 MSZ/pEAUiIp2+dD4uxcm6DWNy9+SoR5/0m4OVO5SosByw8foB0U+NqwsqvEdrPfAFvTdC+
 GI6P75Gj01tPWsSTMa+5VlHlj18bsZ4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-HlaBwqoVNWenGT1ZjHItwg-1; Mon, 06 Mar 2023 12:20:51 -0500
X-MC-Unique: HlaBwqoVNWenGT1ZjHItwg-1
Received: by mail-wm1-f72.google.com with SMTP id
 j32-20020a05600c1c2000b003e9bdf02c9fso7020015wms.6
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 09:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678123250;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UO7I4IIkxq8nJBBTOuRr6vYwTUNbSpuyzumQJnh2gCw=;
 b=Ddq2IqUh1ViI5cwu740CU42fo7sH3hScfZCdGAQj//SltEFileKqwY0TJjAr11jygp
 zfzuOilgP7/6cbzGgsSAqrcwVTEfIJCBsIlyGrCORG4pejiTo7CbZgYEj11ZKR2CNAiA
 3ElvcM5p7J1LFCh+UEvutEv6T2Qv6h+2holA1pXMu4o8qeuxlD6UNGDPNzcEGXPEDVab
 JxPKWmBZkZgWBUd/IQwX80gby8pyJ95CXyAcRqGb0MpORscKJNxfS3+BFUe2CSTNv0ev
 mryBAwwWRWPinIqyKBsRmOODcB3kuoGLeiX609MY0s4txWtff+MT5rSk5El298zz/til
 PWSw==
X-Gm-Message-State: AO0yUKXaqYklUP/8Z8wNWblffpoZyGROUk7jUU9WfFDTfZGMvYH6Oe11
 +EIkpy1BG+d0jx08vg0qFr+6Cfbcp6uD3ikwQNlQy6fN5F9kFz95wC/KdzaIkRgxaGV2ubeqgUv
 Ksq00gF3kh4KKDF0=
X-Received: by 2002:adf:f44a:0:b0:2c9:ee50:b295 with SMTP id
 f10-20020adff44a000000b002c9ee50b295mr7449399wrp.28.1678123250763; 
 Mon, 06 Mar 2023 09:20:50 -0800 (PST)
X-Google-Smtp-Source: AK7set+0Bql0ml60kya6sQYAvMzjPPH7356AXaa2F0eMArf6Fwv6MBgRKHhYNEy988OR3HDOQrawaw==
X-Received: by 2002:adf:f44a:0:b0:2c9:ee50:b295 with SMTP id
 f10-20020adff44a000000b002c9ee50b295mr7449392wrp.28.1678123250512; 
 Mon, 06 Mar 2023 09:20:50 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 f2-20020a5d58e2000000b002c56af32e8csm10437415wrd.35.2023.03.06.09.20.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:20:50 -0800 (PST)
Message-ID: <73f505a9-dfca-0bfe-d58c-ae2efdf2de9d@redhat.com>
Date: Mon, 6 Mar 2023 18:20:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 12/13] vfio/migration: Query device dirty page tracking
 support
Content-Language: en-US
To: Joao Martins <joao.m.martins@oracle.com>, qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Maor Gottlieb <maorg@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
 <20230304014343.33646-13-joao.m.martins@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230304014343.33646-13-joao.m.martins@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=clg@redhat.com;
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

On 3/4/23 02:43, Joao Martins wrote:
> Now that everything has been set up for device dirty page tracking,
> query the device for device dirty page tracking support.
> 
> Signed-off-by: Avihai Horon <avihaih@nvidia.com>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.

> ---
>   hw/vfio/migration.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index 3e75868ae7a9..da3aa596b3ec 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -555,6 +555,19 @@ static int vfio_migration_query_flags(VFIODevice *vbasedev, uint64_t *mig_flags)
>       return 0;
>   }
>   
> +static bool vfio_dma_logging_supported(VFIODevice *vbasedev)
> +{
> +    uint64_t buf[DIV_ROUND_UP(sizeof(struct vfio_device_feature),
> +                              sizeof(uint64_t))] = {};
> +    struct vfio_device_feature *feature = (struct vfio_device_feature *)buf;
> +
> +    feature->argsz = sizeof(buf);
> +    feature->flags =
> +        VFIO_DEVICE_FEATURE_PROBE | VFIO_DEVICE_FEATURE_DMA_LOGGING_START;
> +
> +    return !ioctl(vbasedev->fd, VFIO_DEVICE_FEATURE, feature);
> +}
> +
>   static int vfio_migration_init(VFIODevice *vbasedev)
>   {
>       int ret;
> @@ -589,6 +602,8 @@ static int vfio_migration_init(VFIODevice *vbasedev)
>       migration->device_state = VFIO_DEVICE_STATE_RUNNING;
>       migration->data_fd = -1;
>   
> +    vbasedev->dirty_pages_supported = vfio_dma_logging_supported(vbasedev);
> +
>       oid = vmstate_if_get_id(VMSTATE_IF(DEVICE(obj)));
>       if (oid) {
>           path = g_strdup_printf("%s/vfio", oid);


