Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4DDF48EBE6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:43:26 +0100 (CET)
Received: from localhost ([::1]:58460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NnZ-00075s-UH
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:43:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8NH3-0001TY-Ne
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:09:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8NH0-00036r-UY
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 09:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642169384;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5Cvy8GTgOrWDojBMBCAG7Q+3dTH9T78oDMOlL8feTf4=;
 b=YH+HXdqaPETGl3akna5hhioW/1k8B6aKfFXDxK38cNAKWOADsMcMWbSc4VTn6YCL28VEzA
 s4s3P6+8g7doodNlIpIQYZNwNcBab9L224c1le+i6Nx5xQ7R2IpHDZeUR3/VRWgFy+AtDr
 H3cb7CHuXpxVw0GVuddDIT6iAl+/vxY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-60-aRuP44paP6e8lq_VeqstmQ-1; Fri, 14 Jan 2022 09:09:43 -0500
X-MC-Unique: aRuP44paP6e8lq_VeqstmQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 ay11-20020a05600c1e0b00b0034afc66f1fbso1275246wmb.9
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 06:09:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=5Cvy8GTgOrWDojBMBCAG7Q+3dTH9T78oDMOlL8feTf4=;
 b=5uM0pR7SGLiTnyFFp3SXCXJfPBloQY6wE/6lwJe1rasrgJRFPMfNYe4SnZ/Uf9A6Cc
 e+Xha9idL5SlPa7mPB+ttQGmpoTR9vzhyIAi7JenNQq5eG4luLw3oq+NZQroYohjPR4M
 e3aTINJSkaLjo9ixAEPXwW50w/pO1ut24fP7CgSmmfrIry9KrtENNbCXALSTSFydPv8e
 8pH+UJ1cuWAbw7dUmCw+cx9Vt3r3h2jBvzlVEukCa28NSB5USujyx8wuubuvZe37sjX3
 Z4F0F0ujev9aNv/WLhQUxhvrLvb2veTjy6RbMb25F80ov/zM7fhq7AVh96bavJ+1NRpW
 11EQ==
X-Gm-Message-State: AOAM5328QnHouvrAFoQh/XEjObWeHlnuoUsmL0QqUHGSHAPIQNnkDtxO
 GLsJ2AgD46QaXV+bZrrWeg538AQuT/9S6ye66Abj+r0nzPD1xH5eLQ89AT73YOxa6RHOs1qzUSY
 Z0IbLNC6S00rO+nQ=
X-Received: by 2002:adf:8b57:: with SMTP id v23mr8555463wra.481.1642169382206; 
 Fri, 14 Jan 2022 06:09:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxdX641jYm0uB4o02KpbCNCt+MsoJVy7AP4Sc84rJQSsSns3Yo2lTG+xe+okmBUOoOTAs2n5Q==
X-Received: by 2002:adf:8b57:: with SMTP id v23mr8555454wra.481.1642169382025; 
 Fri, 14 Jan 2022 06:09:42 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id p1sm6353584wrr.75.2022.01.14.06.09.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 06:09:41 -0800 (PST)
Message-ID: <54a82da6-3546-ddf1-692e-105174ddcaec@redhat.com>
Date: Fri, 14 Jan 2022 15:09:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC PATCH] block/file-posix: Remove a deprecation warning on
 macOS 12
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220105235607.212848-1-f4bug@amsat.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220105235607.212848-1-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, John Arbuckle <programmingkidx@gmail.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.01.22 00:56, Philippe Mathieu-Daudé wrote:
> When building on macOS 12 we get:
>
>    ../block/file-posix.c:3335:18: warning: 'IOMasterPort' is deprecated: first deprecated in macOS 12.0 [-Wdeprecated-declarations]
>        kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
>                     ^~~~~~~~~~~~
>                     IOMainPort
>
> Use IOMainPort (define it to IOMasterPort on macOS < 12),
> and replace 'master' by 'main' in a variable name.
>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   block/file-posix.c | 13 +++++++++----
>   1 file changed, 9 insertions(+), 4 deletions(-)

I hope the [RFC] tag isn’t directed at me.

Still, I can give my comment, of course.

> diff --git a/block/file-posix.c b/block/file-posix.c
> index b283093e5b..0dcfce1856 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -3324,17 +3324,22 @@ BlockDriver bdrv_file = {
>   #if defined(__APPLE__) && defined(__MACH__)
>   static kern_return_t GetBSDPath(io_iterator_t mediaIterator, char *bsdPath,
>                                   CFIndex maxPathSize, int flags);
> +
> +#if !defined(MAC_OS_VERSION_12_0)

So AFAIU from my quick rather fruit-less googling, this macro is defined 
(to some version-defining integer) on every macOS version starting from 
12.0?  (Just confirming because the name could also mean it’d be defined 
only on 12.0.)

> +#define IOMainPort IOMasterPort
> +#endif
> +
>   static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
>   {
>       kern_return_t kernResult = KERN_FAILURE;
> -    mach_port_t     masterPort;
> +    mach_port_t mainPort;
>       CFMutableDictionaryRef  classesToMatch;
>       const char *matching_array[] = {kIODVDMediaClass, kIOCDMediaClass};
>       char *mediaType = NULL;
>   
> -    kernResult = IOMasterPort( MACH_PORT_NULL, &masterPort );
> +    kernResult = IOMainPort(MACH_PORT_NULL, &mainPort);
>       if ( KERN_SUCCESS != kernResult ) {
> -        printf( "IOMasterPort returned %d\n", kernResult );
> +        printf("IOMainPort returned %d\n", kernResult);
>       }
>   
>       int index;
> @@ -3347,7 +3352,7 @@ static char *FindEjectableOpticalMedia(io_iterator_t *mediaIterator)
>           }
>           CFDictionarySetValue(classesToMatch, CFSTR(kIOMediaEjectableKey),
>                                kCFBooleanTrue);
> -        kernResult = IOServiceGetMatchingServices(masterPort, classesToMatch,
> +        kernResult = IOServiceGetMatchingServices(mainPort, classesToMatch,
>                                                     mediaIterator);
>           if (kernResult != KERN_SUCCESS) {
>               error_report("Note: IOServiceGetMatchingServices returned %d",

“Looks good to me” ← here’s the comment you requested O:)

Hanna


