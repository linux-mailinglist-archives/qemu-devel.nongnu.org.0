Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE77694DA9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:05:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcGP-0001Wg-Ko; Mon, 13 Feb 2023 12:05:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcGM-0001L2-9Z
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:05:10 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcGJ-0008G1-Ev
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:05:09 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m20-20020a05600c3b1400b003e1e754657aso3325742wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:05:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PJET6pjusHqiQU9ALyypIr23BPwUN97tb0P4FR3Q0B8=;
 b=OLaHZRtUOi4/c6YaonYFSXRfKIRf/LZJu1LwNBDcfP0jj089KfuSfc0fAsi9OEAh4k
 mZUu+TinDhMAXyytApClApt87o+ZFz4vl/0beo2QglReDyGkralUIAITFyFwm3uFhQKK
 LJTrfZGtg2+p0MwTTyBAF0zDW024LylBeckg3OBnqAmdzzQg5cyxgnZdQGq+B3hPH2/H
 kSEvBsqFZVSMsOi/qet8wQjFl7cLClIWctpnP/nk7v8LKfEI1TzmW6eOovZg3e8rYKtX
 cU608IOSylXI+cNz8o/3QmZ52KWx1YIXkVMtLBHMjYgmeCRy21itwrEd+1/li4QLRcRq
 SPGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PJET6pjusHqiQU9ALyypIr23BPwUN97tb0P4FR3Q0B8=;
 b=BxWiciAZiAnE0XVQAMPpiubVXXX6jZzM+m4VKQrTt1M4wzjDNN1rw1DXC18JKm+hYn
 Q4uj8GcTdm+S/oj9BCa7Sdl5QF0cXAsjcaYpC7cdvKfBYiLzVnpcjiNLEnuUNpg4e/i6
 vaDC6ebS98ZFvdHGKkQJAfkaqq9TKosiK/H+lbbFSE7Y7lq0qTHkYaNR60OzN7XwjJe+
 DXFN7hKIXy34KwHL6vOZpljWXZu6mywpFtOCsY8AB60hOeKQOkF+4QP5l+Vy7GPQArSw
 gLj0qyLwlaHhBVZbcQHHlgdxt81Kzyq7AiQ5no/0/21fFYTsdsQ60Bt7JNDDqdMV6fXH
 7Z6g==
X-Gm-Message-State: AO0yUKV01GtwocXIRQ9muz6CXIMdczw3wLLC3URlMRXlGHWn3OF0NxwR
 fITDc7IzQyJ/q6K75OXV6/QhEQ==
X-Google-Smtp-Source: AK7set8zyZqQB+CdqKYvaYufTf17923lpZU0JdHErKllX2vR4jVsPb13O40FkdOGI3s9YZ5qkJMvQQ==
X-Received: by 2002:a05:600c:44d5:b0:3df:30c9:4865 with SMTP id
 f21-20020a05600c44d500b003df30c94865mr19217800wmo.26.1676307905335; 
 Mon, 13 Feb 2023 09:05:05 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h28-20020a05600c2cbc00b003dc3f3d77e3sm15158902wmc.7.2023.02.13.09.05.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 09:05:04 -0800 (PST)
Message-ID: <5e6c7a7f-7af5-272e-21ff-f8ec39dc63cc@linaro.org>
Date: Mon, 13 Feb 2023 18:05:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.7.2
Subject: Re: [PATCH v3 4/6] hw/vfio/ccw: Replace DO_UPCAST(S390CCWDevice) by
 S390_CCW_DEVICE()
Content-Language: en-US
To: Eduardo Habkost <eduardo@habkost.net>, Eric Farman
 <farman@linux.ibm.com>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20230213170145.45666-1-philmd@linaro.org>
 <20230213170145.45666-5-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230213170145.45666-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.345,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 13/2/23 18:01, Philippe Mathieu-Daudé wrote:
> Use the S390_CCW_DEVICE() QOM type-checking macro to avoid DO_UPCAST().
> 

I forgot Eric R-b here:
Reviewed-by: Eric Farman <farman@linux.ibm.com>

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


