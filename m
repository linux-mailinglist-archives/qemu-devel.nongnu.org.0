Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 442B36A430D
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 14:41:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWdkD-0001s8-JA; Mon, 27 Feb 2023 08:40:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWdk8-0001fC-Qe
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:40:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1pWdk7-0002Fz-7A
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 08:40:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677505238;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SJibdRGjNWPb4yoZuOIXoozndFxi91p1e66GNYe/PDk=;
 b=NIazSNVnnijBd/+m/azgSv6eHO+e38WV7Xi/Jj2nj44p80XGYm/379hAKd+xM8IBosT8Nu
 SG7J4LGFWfwg/6t6OpmPufMWfzmOyDL8EONDelrX/lfHjXqdUZ3p3+/ypGfii+MGIXGtUo
 hsla6ipNGMzzcpS8ccj+jLBozmLLpqA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-o1dlNCBQMe6aiZhSEAl9Jg-1; Mon, 27 Feb 2023 08:40:36 -0500
X-MC-Unique: o1dlNCBQMe6aiZhSEAl9Jg-1
Received: by mail-qv1-f71.google.com with SMTP id
 pz4-20020ad45504000000b0056f060452adso3310061qvb.6
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 05:40:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SJibdRGjNWPb4yoZuOIXoozndFxi91p1e66GNYe/PDk=;
 b=IitAgldozuXEtX5Bp967aI+SA9pcde794tXGs+l92aMLK8sSU0SSacxg9IvAPWmdIQ
 g3b+hjvTmMD+16m5Qp/JKJx94d/pLK8awXLAqwEMYDkeoN2BPtVHL4jaTVh2mIaMLFAK
 NvQY80HhtxoC8KH1fvNh4AMWdI1Y161jA+SqSFB1xFuh0pvf8UEnaFicvAqFastc2Z+L
 dZWa0d01555OEo6XswOAI8jTF3azgpDhR+vGfapjJFbtl4PGyiuFTX430VWR7G1hHLA4
 6tukYU4AnI6bJFgpNecjM1zUdJVzRSbi+EYnYym7doJ7Z9Mrx4BXuzbyBC26UCXHak/7
 FoeA==
X-Gm-Message-State: AO0yUKVWWkpMHqY4a1zgYEVyeJ1pixqN3zA2QTRge4q05t+eoAZcX3MX
 7QjzfQDhad/cDnWkW0hzgi8bwTCa7fZpKQCaO3xT0OuYtGCS0+jxmeeKKwZ/S9THAr2AAEMd3O4
 kB1o67FQFQoXxPDc=
X-Received: by 2002:a05:622a:60e:b0:3b8:5199:f84a with SMTP id
 z14-20020a05622a060e00b003b85199f84amr26434565qta.3.1677505236469; 
 Mon, 27 Feb 2023 05:40:36 -0800 (PST)
X-Google-Smtp-Source: AK7set/aSXShYsCUhXPxfFgeUIFan5sU9pqkQZRfBGYFg+OilJr2j3EgB7ok+xFZ30G4NEsuGKNhNQ==
X-Received: by 2002:a05:622a:60e:b0:3b8:5199:f84a with SMTP id
 z14-20020a05622a060e00b003b85199f84amr26434536qta.3.1677505236226; 
 Mon, 27 Feb 2023 05:40:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:576b:abc6:6396:ed4a?
 ([2a01:e0a:280:24f0:576b:abc6:6396:ed4a])
 by smtp.gmail.com with ESMTPSA id
 j13-20020ac8664d000000b003b82489d8acsm4622659qtp.21.2023.02.27.05.40.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Feb 2023 05:40:35 -0800 (PST)
Message-ID: <01e5c200-a343-6def-1d52-74141c1b86ce@redhat.com>
Date: Mon, 27 Feb 2023 14:40:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH 1/2] hw/vfio/migration: Remove unused 'exec/ram_addr.h'
 header
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20230227103258.13295-1-philmd@linaro.org>
 <20230227103258.13295-2-philmd@linaro.org>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <20230227103258.13295-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.089, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 2/27/23 11:32, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>


Reviewed-by: Cédric Le Goater <clg@redhat.com>

Thanks,

C.


> ---
>   hw/vfio/migration.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
> index a2c3d9bade..f9ac074c63 100644
> --- a/hw/vfio/migration.c
> +++ b/hw/vfio/migration.c
> @@ -24,7 +24,6 @@
>   #include "migration/misc.h"
>   #include "qapi/error.h"
>   #include "exec/ramlist.h"
> -#include "exec/ram_addr.h"
>   #include "pci.h"
>   #include "trace.h"
>   #include "hw/hw.h"


