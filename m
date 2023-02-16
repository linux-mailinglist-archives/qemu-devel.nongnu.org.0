Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50588699708
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:19:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSf5v-0001zJ-GG; Thu, 16 Feb 2023 09:18:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSf5t-0001yu-Ja
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:18:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pSf5r-0002i8-QX
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:18:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676557119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zS5NZUIZUDUkh1/IVZDXvUyeZ0ynjF81iswHJAuxQBc=;
 b=Gs1zZWv+mCr/6udDWIHK4sbXxloK3pCYl4Uq/8lG8DGIteMLF1SNkqcR9OY6GOhz8+XEXq
 LLXl/C0FY9bKagMUTllw8s2DuOaYzx3o8o8E/qtliB/l16pu4OIzmEqZ2fIkZ+FmqQyLWT
 aWdMPJc8lqLl9d6/tnwcN5Xf9ILu3L4=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-427-x5RhNyWGPOy1HZXfkr49UQ-1; Thu, 16 Feb 2023 09:18:37 -0500
X-MC-Unique: x5RhNyWGPOy1HZXfkr49UQ-1
Received: by mail-qv1-f71.google.com with SMTP id
 gu10-20020a056214260a00b0056c2005684aso1130028qvb.23
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 06:18:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zS5NZUIZUDUkh1/IVZDXvUyeZ0ynjF81iswHJAuxQBc=;
 b=O9YBT1d5/ZHoy1jYmwA3f4OALnBRnILK/gamfa1C91azAJTolOjf7wq+w8lTSfdU+P
 dmBY/p57H1eKQswPRhlDA4HXUytzR9wos/fx/NBIzgKdkIHqOd8qjf4c7dK7FbKFZf6o
 Psb8xKg8ozmH054UJuy6zrCov64MQE2W0w6t7kCQHpnvTFdt04zBod57YJx5C/U/kVHM
 47YTCvo+gycVRyiaDyXudtD4bEtDRyyyAXNo99vBSUgLJx3ZN+MBz7GvemMB+AyuH/OB
 Vh1xfy8hL873kauvmH1a0AOZHYIijgswSxfc28miLyrkYEAbGS919x0CgGjkQ/6UF85W
 W1cw==
X-Gm-Message-State: AO0yUKX0WilCAKh7gdPAoq4TwLl3iqltvX5p0tiSwZcE4FVanw4X0XiZ
 zvwK31nKvH+01EPFfyjX36gcu4qkSx+1zRwwS/ltER86XvNBqtiVK1FMc8naOC+nn+bBU5PiDih
 7nO2Ik40PjfDgJfE=
X-Received: by 2002:a05:622a:311:b0:3b9:a441:37ed with SMTP id
 q17-20020a05622a031100b003b9a44137edmr9834028qtw.32.1676557116894; 
 Thu, 16 Feb 2023 06:18:36 -0800 (PST)
X-Google-Smtp-Source: AK7set+myTD6VUnfo6c32pAIoyitWX0BatNuM7UhzbjOECAsAEnPHoc38OlF18DMf4EPFhxGFeQ81g==
X-Received: by 2002:a05:622a:311:b0:3b9:a441:37ed with SMTP id
 q17-20020a05622a031100b003b9a44137edmr9833995qtw.32.1676557116590; 
 Thu, 16 Feb 2023 06:18:36 -0800 (PST)
Received: from [192.168.0.2] (ip-109-43-176-144.web.vodafone.de.
 [109.43.176.144]) by smtp.gmail.com with ESMTPSA id
 s64-20020a372c43000000b00719165e9e72sm1233393qkh.91.2023.02.16.06.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Feb 2023 06:18:36 -0800 (PST)
Message-ID: <18f52a74-64f4-8af6-6d51-21e2ff469adf@redhat.com>
Date: Thu, 16 Feb 2023 15:18:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 4/6] hw/vfio/ccw: Replace DO_UPCAST(S390CCWDevice) by
 S390_CCW_DEVICE()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org, Cedric Le Goater <clegoate@redhat.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Hildenbrand <david@redhat.com>, Matthew Rosato
 <mjrosato@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230213170145.45666-1-philmd@linaro.org>
 <20230213170145.45666-5-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230213170145.45666-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.351, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 13/02/2023 18.01, Philippe Mathieu-Daudé wrote:
> Use the S390_CCW_DEVICE() QOM type-checking macro to avoid DO_UPCAST().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/vfio/ccw.c | 9 +++------
>   1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
> index 2c20e3c202..2ea7b4a63c 100644
> --- a/hw/vfio/ccw.c
> +++ b/hw/vfio/ccw.c
> @@ -251,8 +251,7 @@ again:
>   
>   static void vfio_ccw_reset(DeviceState *dev)
>   {
> -    CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
> -    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
> +    S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
>       VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
>   
>       ioctl(vcdev->vdev.fd, VFIO_DEVICE_RESET);
> @@ -657,8 +656,7 @@ static VFIOGroup *vfio_ccw_get_group(S390CCWDevice *cdev, Error **errp)
>   static void vfio_ccw_realize(DeviceState *dev, Error **errp)
>   {
>       VFIOGroup *group;
> -    CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
> -    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
> +    S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
>       VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
>       S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
>       Error *err = NULL;
> @@ -729,8 +727,7 @@ out_err_propagate:
>   
>   static void vfio_ccw_unrealize(DeviceState *dev)
>   {
> -    CcwDevice *ccw_dev = DO_UPCAST(CcwDevice, parent_obj, dev);
> -    S390CCWDevice *cdev = DO_UPCAST(S390CCWDevice, parent_obj, ccw_dev);
> +    S390CCWDevice *cdev = S390_CCW_DEVICE(dev);
>       VFIOCCWDevice *vcdev = DO_UPCAST(VFIOCCWDevice, cdev, cdev);
>       S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
>       VFIOGroup *group = vcdev->vdev.group;

Reviewed-by: Thomas Huth <thuth@redhat.com>


