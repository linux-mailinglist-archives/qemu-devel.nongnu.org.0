Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E549065EA27
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 12:47:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDOi6-0002R4-I7; Thu, 05 Jan 2023 06:47:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDOhf-0002IM-BV
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:46:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pDOhd-0000bk-So
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672919193;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bSaI1iLlCK0bDNreFcUOew/ti4ag/jlmwiAdvN/zRGE=;
 b=g9NOZJQbRpD1ve8l8e7ss28R39r+4KnkV1mLVKhdCOOpJ78OyyywzppQuboh7JDcoBDx76
 /AG1KtpruGxRiMn4Jqpa10dAVGNaDxFQFgvrvxnocfNRkzdM3PikLV96ypfju/dFqDVn4H
 6EqPGAAhVc+7oy17KhtJ/zbEHtqHkwc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-519-sI2MpUX2NhWQ2VuGE9UbzA-1; Thu, 05 Jan 2023 06:46:31 -0500
X-MC-Unique: sI2MpUX2NhWQ2VuGE9UbzA-1
Received: by mail-wm1-f71.google.com with SMTP id
 l31-20020a05600c1d1f00b003d9720d2a0eso881214wms.7
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 03:46:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bSaI1iLlCK0bDNreFcUOew/ti4ag/jlmwiAdvN/zRGE=;
 b=beMBGo0H39k6EBpRgl8BWj0geGhhGza+B7j8IscBINIfpmfOM9+MDFFUm2G3TZXoEU
 ed4T8ZZPjD7SrrvinBWh4jlyfh7xqeIYpBUhq9wEf94nf5sEEl33cJcueGUC+31Lu/O7
 3rF+FnSM/fhTUuRPsCZZICioXYGWcvV4KdZ9tP1mNkdmI7pg/JwftdnT2+IbUtF7+D0z
 vYklmRSMEpT5J8X3kuiNeDddKxavdRm7kPE0wYmpZCkljTHDFfd2lPo+tGGSJ5v5Xf0y
 aJQqLkE/1QLW+5yihTD56y1BkgwQfNVjo+dbTr4CHgRXgR4IxZny1wHtGEqhx85bL/Vx
 Ax0A==
X-Gm-Message-State: AFqh2kp5CInQ4NXmls1Sto1Q0Um0qbFqSS5joJ9rM78WmU49bUvWxhjf
 b2S3+1kNrEmEwNHPFLgnfiahp4Cb61Wjn3Bfv71u6fkinxKSbgU34Zpjk4dnNtYNnN3ed2kOgpD
 9b6ywEIex9kwDX0c=
X-Received: by 2002:a05:600c:4e4f:b0:3cf:9d32:db67 with SMTP id
 e15-20020a05600c4e4f00b003cf9d32db67mr35599680wmq.3.1672919190584; 
 Thu, 05 Jan 2023 03:46:30 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvNM+qhKJSE1rKYsnut4NEr3ZiF97VAYNkbN5n5xO5wuSimxcIXVdZM6fRpHPfRCALzGfdl0A==
X-Received: by 2002:a05:600c:4e4f:b0:3cf:9d32:db67 with SMTP id
 e15-20020a05600c4e4f00b003cf9d32db67mr35599668wmq.3.1672919190401; 
 Thu, 05 Jan 2023 03:46:30 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-239.web.vodafone.de.
 [109.43.176.239]) by smtp.gmail.com with ESMTPSA id
 n9-20020a05600c4f8900b003d96b8e9bcasm2392977wmq.32.2023.01.05.03.46.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 03:46:29 -0800 (PST)
Message-ID: <39483f01-54bc-d850-778c-f24745cce549@redhat.com>
Date: Thu, 5 Jan 2023 12:46:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/5] s390x/pv: Check for support on the host
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@redhat.com>
References: <20230104115111.3240594-1-clg@kaod.org>
 <20230104115111.3240594-4-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230104115111.3240594-4-clg@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
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
> Support for protected VMs should have been enabled on the host with
> the kernel parameter 'prot_virt=1'. If the hardware supports the
> feature, it is reflected under sysfs.
> 
> Signed-off-by: Cédric Le Goater <clg@redhat.com>
> ---
>   hw/s390x/pv.c | 23 ++++++++++++++++++++++-
>   1 file changed, 22 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/pv.c b/hw/s390x/pv.c
> index 3a7ec70634..8d0d3f4adc 100644
> --- a/hw/s390x/pv.c
> +++ b/hw/s390x/pv.c
> @@ -14,6 +14,7 @@
>   #include <linux/kvm.h>
>   
>   #include "qapi/error.h"
> +#include "qemu/cutils.h"
>   #include "qemu/error-report.h"
>   #include "sysemu/kvm.h"
>   #include "qom/object_interfaces.h"
> @@ -281,9 +282,29 @@ static bool s390_pv_check_cpus(Error **errp)
>       return true;
>   }
>   
> +#define S390_PV_HOST "/sys/firmware/uv/prot_virt_host"
> +
> +static bool s390_pv_check_host(Error **errp)
> +{
> +    gchar *s = NULL;
> +    uint64_t pv_host = 0;
> +
> +    if (g_file_get_contents(S390_PV_HOST, &s, NULL, NULL)) {
> +        pv_host = g_ascii_strtoull(s, NULL, 10);
> +    }
> +    g_free(s);
> +
> +    if (pv_host != 1) {
> +        error_setg(errp, "Host does not support protected VMs");
> +        return false;
> +    }
> +
> +    return true;
> +}
> +
>   static bool s390_pv_guest_check(const Object *obj, Error **errp)
>   {
> -    return s390_pv_check_cpus(errp);
> +    return s390_pv_check_cpus(errp) && s390_pv_check_host(errp);
>   }
>   
>   OBJECT_DEFINE_TYPE_WITH_INTERFACES(S390PVGuest,

Reviewed-by: Thomas Huth <thuth@redhat.com>


