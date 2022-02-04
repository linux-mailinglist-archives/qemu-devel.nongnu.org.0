Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CFE04A9BC3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 16:19:09 +0100 (CET)
Received: from localhost ([::1]:57900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG0Md-0005MS-Ub
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 10:19:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0KP-0003ai-0W
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:16:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nG0KK-0002K4-Qg
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 10:16:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643987804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s07zfb/uBJBeUlib6JwmNqko9j8oKZdJB714Y6P5vfQ=;
 b=K/hp61EjOJH2xGbBGLtS8vb8u0xssPyeMQZM3fWQo+aTqXAucVOhQiLYhkimj4DnQkrcFR
 OB7Nj2qC5GqY+hgIl7NzCC+OJJi/rfwm7IJ+p3VCP+l1rFlFlt8fDKZOv67Cp3UNYhFOif
 dGsCKqWjWSy0e9PA51KhmakPysFv3Ls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-Liejwu6lP1Ga9F-9CYduLQ-1; Fri, 04 Feb 2022 10:16:43 -0500
X-MC-Unique: Liejwu6lP1Ga9F-9CYduLQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 n7-20020a1c7207000000b0034ec3d8ce0aso2508056wmc.8
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 07:16:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=s07zfb/uBJBeUlib6JwmNqko9j8oKZdJB714Y6P5vfQ=;
 b=T534siiwonlTiPuMwa4THnh2L+MiIPiZERZzrz9AWAAdGzVwwrxtyBqhpSfhAGwr/k
 WChCHn1Glq+kklR3M2Yr3EcPcNo/IJ4mPF9sE9SvorD8fqABKqTIJHDSiPnvRXiZIH48
 0Tid9UeWgfio5mjelj4OBdAdkkx17mKTNm6AUFTXgssoA5SaqWYRSgBIuFmxZziwihgM
 uQW0ryV2XTQZnWkXij12FvL6AnTpLlc7x1UKxc5E9RZqYvuSrbH8a0GwzlwbInnFu/D9
 nODTwwC1ACG77nb71+GvgtBLH55jIEEpwYQVnP9Si7E6NRHux1i1PZGF/EfX/RG6dDBo
 04qA==
X-Gm-Message-State: AOAM533Tj2latTqmxi4+Enszj+agEFpd1WBIBF0zQ6N0z6cEtIVfc0eg
 JfRhbXTF4JSQUC2rIG9uVDlj2664l7ylTYhoAkVQI6ma5/oZCwbHF8HO9dLHl5+SZZ9GUf6wG2J
 Ndd249artqiwOmN0=
X-Received: by 2002:a1c:f702:: with SMTP id v2mr2611831wmh.155.1643987801812; 
 Fri, 04 Feb 2022 07:16:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJygOHytzevP0bNJOuuNaF32Unw4M12GWfmn7Wyf/L8Zt2MJSuFC2Yd6UqlcdY6XNyZBPG7PFg==
X-Received: by 2002:a1c:f702:: with SMTP id v2mr2611807wmh.155.1643987801533; 
 Fri, 04 Feb 2022 07:16:41 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id z6sm9786131wmf.37.2022.02.04.07.16.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Feb 2022 07:16:41 -0800 (PST)
Message-ID: <215ee4ad-b2ff-cd6f-1584-b850a9ea4bf1@redhat.com>
Date: Fri, 4 Feb 2022 16:16:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 02/10] hw/remote: Add missing include
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-3-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220203193803.45671-3-f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.092,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
 Jagannathan Raman <jag.raman@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/02/2022 20.37, Philippe Mathieu-Daudé wrote:
> Currently "qemu/error-report.h" is implicitly included, however
> if headers in include/ get refactored, we get:
> 
>    hw/remote/proxy-memory-listener.c: In function ‘proxy_memory_listener_commit’:
>    hw/remote/proxy-memory-listener.c:183:9: error: implicit declaration of function ‘error_report’; did you mean ‘error_report_err’? [-Werror=implicit-function-declaration]
>      183 |         error_report("Number of fds is more than %d", REMOTE_MAX_FDS);
>          |         ^~~~~~~~~~~~
>          |         error_report_err
> 
> Add the missing "qemu/error-report.h" header to avoid that.
> 
> Reviewed-by: Jagannathan Raman <jag.raman@oracle.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/remote/proxy-memory-listener.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/remote/proxy-memory-listener.c b/hw/remote/proxy-memory-listener.c
> index 882c9b4854..0e893f3189 100644
> --- a/hw/remote/proxy-memory-listener.c
> +++ b/hw/remote/proxy-memory-listener.c
> @@ -16,6 +16,7 @@
>   #include "exec/cpu-common.h"
>   #include "exec/ram_addr.h"
>   #include "qapi/error.h"
> +#include "qemu/error-report.h"
>   #include "hw/remote/mpqemu-link.h"
>   #include "hw/remote/proxy-memory-listener.h"
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


