Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C157365E705
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 09:47:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDLtZ-0000ZX-Q3; Thu, 05 Jan 2023 03:46:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDLtX-0000Z1-C6
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 03:46:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDLtV-0007gD-TQ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 03:46:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672908397;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BqBLlWAWrPAszwq2jfk9ycLVgKlEuNc3qghWsvJ0V54=;
 b=LXDx6kfcW01zkgNEp/lWju1Aa9wzac03sG9G6O0Sa1f1ml+t2DUDO4jo1u9wabQmMmoZyt
 /dnQOrpVpIMROKuuO8G0/hiukfO4b8H1BxNaWcX/4cafieaVZbbnoEDaTOQNR6fx884jp0
 tYmBEqJ7aXivJNHr6uroKm1HWePkgw0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-404-iwvpCqEWOUiCNAJYV0b1zw-1; Thu, 05 Jan 2023 03:46:35 -0500
X-MC-Unique: iwvpCqEWOUiCNAJYV0b1zw-1
Received: by mail-wm1-f71.google.com with SMTP id
 w8-20020a1cf608000000b003d9bb726833so244192wmc.6
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 00:46:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BqBLlWAWrPAszwq2jfk9ycLVgKlEuNc3qghWsvJ0V54=;
 b=qw0UJudf5Zvt1hfTjF2yTa6YYWq0XvupM5YPiCNOfkZcsT7YVtMVarb+53iZpjT5dj
 HRO9ERH6mFMZAVGv6X5MGOxCH3yjzR5bcv9NBS0idkYf7UYGiEoc0W76Mpvfc9z+QVd1
 YJuRlJH95zeSK2qoxrmxQmT4+J77d1wS45ODP/yGhojRSsxjn2K+NN2imaPurKLMzxWM
 jFlJpkkItn4wbqkBE7OMmkamCNQQsJ5uJkEGvFbZIp+beCvj116gaCMpbPlATZWINCEQ
 upQGanjV5+8xKF3ImZPE2BJ8Nt3ZrKhy5v2HFDRbVXU5UMwaukeu1CSxf4BwRHfOUGT3
 r0mw==
X-Gm-Message-State: AFqh2kr3pEGa6yYeERG8xuMFch1PLhlEBlzrEOWBmp3Iw8rX7V+2Nkx1
 3ZzczR73OF8a6vmvzeauVgOUcw1lPSwltuwYelexaAJFl2e5bCT5LqOVsISbVUKuS3D/dQS37io
 0Slig4fnZpVlKyi4=
X-Received: by 2002:a05:600c:1e8c:b0:3d6:2952:679b with SMTP id
 be12-20020a05600c1e8c00b003d62952679bmr35657268wmb.34.1672908394655; 
 Thu, 05 Jan 2023 00:46:34 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvB/vbgj6T4WGbfeK6/qIoVLxCO7j2VrprHneC8ftB3H1ylVif0J449sRgtLMCiarVWoe2DpQ==
X-Received: by 2002:a05:600c:1e8c:b0:3d6:2952:679b with SMTP id
 be12-20020a05600c1e8c00b003d62952679bmr35657251wmb.34.1672908394415; 
 Thu, 05 Jan 2023 00:46:34 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 k41-20020a05600c1ca900b003d974076f13sm1858753wms.3.2023.01.05.00.46.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 00:46:33 -0800 (PST)
Message-ID: <fa7b4a10-0fd5-7435-53e0-89779f0f526f@redhat.com>
Date: Thu, 5 Jan 2023 09:46:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 1/5] confidential guest support: Introduce a 'check' class
 handler
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-2-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230104115111.3240594-2-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.708, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 04/01/2023 12.51, Cédric Le Goater wrote:
> From: Cédric Le Goater <clg@redhat.com>
> 
> Some machines have specific requirements to activate confidential
> guest support. Add a class handler to the confidential guest support
> interface to let the arch implementation perform extra checks.
> 
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
> Cc: "Philippe Mathieu-Daudé" <philmd@linaro.org>
> Cc: Yanan Wang <wangyanan55@huawei.com>
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   include/exec/confidential-guest-support.h |  4 +++-
>   hw/core/machine.c                         | 11 ++++++-----
>   2 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/include/exec/confidential-guest-support.h b/include/exec/confidential-guest-support.h
> index ba2dd4b5df..9e6d362b26 100644
> --- a/include/exec/confidential-guest-support.h
> +++ b/include/exec/confidential-guest-support.h
> @@ -23,7 +23,8 @@
>   #include "qom/object.h"
>   
>   #define TYPE_CONFIDENTIAL_GUEST_SUPPORT "confidential-guest-support"
> -OBJECT_DECLARE_SIMPLE_TYPE(ConfidentialGuestSupport, CONFIDENTIAL_GUEST_SUPPORT)
> +OBJECT_DECLARE_TYPE(ConfidentialGuestSupport, ConfidentialGuestSupportClass,
> +                    CONFIDENTIAL_GUEST_SUPPORT)
>   
>   struct ConfidentialGuestSupport {
>       Object parent;
> @@ -55,6 +56,7 @@ struct ConfidentialGuestSupport {
>   
>   typedef struct ConfidentialGuestSupportClass {
>       ObjectClass parent;
> +    bool (*check)(const Object *obj, Error **errp);
>   } ConfidentialGuestSupportClass;
>   
>   #endif /* !CONFIG_USER_ONLY */
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index f589b92909..bab43cd675 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -502,11 +502,12 @@ static void machine_check_confidential_guest_support(const Object *obj,
>                                                        Object *new_target,
>                                                        Error **errp)
>   {
> -    /*
> -     * So far the only constraint is that the target has the
> -     * TYPE_CONFIDENTIAL_GUEST_SUPPORT interface, and that's checked
> -     * by the QOM core
> -     */
> +    ConfidentialGuestSupportClass *cgsc =
> +        CONFIDENTIAL_GUEST_SUPPORT_GET_CLASS(new_target);
> +
> +    if (cgsc->check) {
> +        cgsc->check(obj, errp);

I assume the caller is checking *errp, so it's ok to ignore the return value 
of the check function here?

> +    }
>   }
>   
>   static bool machine_get_nvdimm(Object *obj, Error **errp)

Reviewed-by: Thomas Huth <thuth@redhat.com>


