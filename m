Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B914A9BF7
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:29:02 +0100 (CET)
Received: from localhost ([::1]:37126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0WD-0002SZ-Li
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:29:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0Rs-0007dq-MR
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:24:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0Rk-0003A6-5a
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:24:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643988123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UmNX+D2kMFhrzgsEiswIhfajqUVkthzFx6Z0/eN2xnI=;
 b=QWd5wsvDZtWcdbmBTcpbr98ZyqYeNava1MfMKb5uCM4iEh6RBKD/f49FYOYqirLrWXAdIG
 7joavGFPbe/HDh5tSojMOzYky6LKNXmDfNBQd+YcjcbEVKT3o+0SYVzeWojwM6mwXshejo
 yXFHAxDf/YseBcbl+UATHUX4pJamvCc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-510-Nv-Ue88tPzO_lTsFmp8XeA-1; Fri, 04 Feb 2022 10:22:02 -0500
X-MC-Unique: Nv-Ue88tPzO_lTsFmp8XeA-1
Received: by mail-wm1-f70.google.com with SMTP id
 m18-20020a7bca52000000b003552c4e2550so2379996wml.0
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:22:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UmNX+D2kMFhrzgsEiswIhfajqUVkthzFx6Z0/eN2xnI=;
 b=shefdBppRlEPVdtG1Mcx5T/5RiM3TJnvA35ClnJt535fWGB7BYxdXgeTB9Kc1dniBF
 5X1K+yCM+1gt2YzAff/RqFHgIEmyvacx/KMN2dwizgHIL7XSaW9onttwFiQ/0NVQrV97
 oQP9E4rMFwbMdGJ/QFzLzGmuuH3Rf6pRPq3arS7LkRGUN3tEaLPNnDp4812KLzUw5MMI
 s6eSKIzMD5LciBxd0yCCnT2MSwNXTvCH8krP2BjL/zs29kKLBt1V7nCDL/V3XNrUPfhg
 2n6p3Y9gBVDRJE8R2h/UsrKmH55qQk/BabNdgD/zQbKV3vulU+588IuRSsSd4MKSYNG5
 xCOQ==
X-Gm-Message-State: AOAM5332WvkHd72Nsz3/pmES13F6VzXwwg+fM/Cydi6nTbjoGyS/x6Au
 63adfT4gp8JUab8aRVJhmL+hIjorV7YKlT05Wg8hLlJewVe06yNvt+lfU5gCNdPvnOsWBXEAlEM
 3GiWLOulJGzZlXEU=
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr2821912wrz.391.1643988121050; 
 Fri, 04 Feb 2022 07:22:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyItSwfOUxBJy/86EmnqtODgW4DMGmJkjulNI9KVDmChFk7OmuWe7ThDD/LjSkWvNb05cUqPA==
X-Received: by 2002:a5d:6c67:: with SMTP id r7mr2821894wrz.391.1643988120851; 
 Fri, 04 Feb 2022 07:22:00 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id l40sm1766985wms.0.2022.02.04.07.21.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:22:00 -0800 (PST)
Message-ID: <0eadaccf-dfb2-66e8-3ba3-7593af2e0ce3@redhat.com>
Date: Fri, 4 Feb 2022 16:21:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 07/10] core/ptimers: Remove unnecessary 'sysemu/cpus.h'
 include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-8-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203193803.45671-8-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2022 20.38, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/core/ptimer.c | 1 -
>   1 file changed, 1 deletion(-)
> 
> diff --git a/hw/core/ptimer.c b/hw/core/ptimer.c
> index 6ba19fd965..eb5ba1aff7 100644
> --- a/hw/core/ptimer.c
> +++ b/hw/core/ptimer.c
> @@ -14,7 +14,6 @@
>   #include "sysemu/cpu-timers.h"
>   #include "sysemu/qtest.h"
>   #include "block/aio.h"
> -#include "sysemu/cpus.h"
>   #include "hw/clock.h"
>   
>   #define DELTA_ADJUST     1

Reviewed-by: Thomas Huth <thuth@redhat.com>


