Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9C36A16F0
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 08:09:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVSCH-0000MD-AL; Fri, 24 Feb 2023 02:08:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVSCF-0000M3-Ae
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:08:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pVSCD-0005Yp-Pc
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 02:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677222525;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E52bm4oP9toze4Har/77NYE2vJQHhgkgNDqMQd9Mi8Y=;
 b=MVrJJcv194FsI0rYxNg47LnWw2b6Jo6pbm4Ga6zw8cSAzFj2cbrSEhZOv8qleqCwNbgWHg
 hVYpPkpI/TzFsceQJK/GQhZcOEZ2uG/SXL5Sr991esWMyHL7mmoHT+VQT7b0GfyICOoKG6
 KLv7TSt2WXU96KnuMa6Jq+eg58gVlh4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-618-cL-Q46PyPWGaus0gj3mprQ-1; Fri, 24 Feb 2023 02:08:43 -0500
X-MC-Unique: cL-Q46PyPWGaus0gj3mprQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 u19-20020a05600c00d300b003eb24ce58ceso101614wmm.9
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 23:08:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E52bm4oP9toze4Har/77NYE2vJQHhgkgNDqMQd9Mi8Y=;
 b=kz0GupUL4I1r4Pkrasf4+8OznwTKZLf5pxhUahftWo9SwwWstXGTp+IU5G4sEoJLR9
 8XnvESHFJj88eWtxvjnGdzuSVSa4gh8VTOYc7aA1yLOOzG3eYNsXLUPsRA5U3Xr+Uy83
 ZA106mLaK/rsrKpHngicjJyU4gsk94SFP9RnTl7NSNAURsZ05KyM2+4D3hq2b5UAk0yh
 WNlF/aEXu5B5DfDBL8jcqYj8oqOCg8rxyLsT5y70+u8Wb383RW0LWpHNQJb6NGFh2BrR
 9phE1hxnVJ9pqjc5b2ujibakxzXZkyJgCY6+fdczIUnE+N3XcFv7il2TCOThfW3O3cix
 cRxw==
X-Gm-Message-State: AO0yUKWiGC0vYw8nX91QYrgSOZuC4aQWg5Tvk/Btz9xSpYAdC2/yDLND
 q2CKqLTTKfCBfIONlZj77SBLIQJoDI+aDw7/YWwOcs+5cOWefJipvwwgJQQ39S6EvfnulWABJv+
 kI1E2c0goVnsa+mI=
X-Received: by 2002:a05:600c:a29d:b0:3e2:665:4e48 with SMTP id
 hu29-20020a05600ca29d00b003e206654e48mr10934871wmb.0.1677222522360; 
 Thu, 23 Feb 2023 23:08:42 -0800 (PST)
X-Google-Smtp-Source: AK7set+Zo0y9igqaeQX31viOqul6l5Y6Eq02aNM+wM0B9YH1nm6HsqD5k8dy9ELaNg7MkjKYw0GXbA==
X-Received: by 2002:a05:600c:a29d:b0:3e2:665:4e48 with SMTP id
 hu29-20020a05600ca29d00b003e206654e48mr10934854wmb.0.1677222522102; 
 Thu, 23 Feb 2023 23:08:42 -0800 (PST)
Received: from [192.168.8.100] (tmo-115-119.customers.d1-online.com.
 [80.187.115.119]) by smtp.gmail.com with ESMTPSA id
 m4-20020a05600c4f4400b003e209b45f6bsm1836806wmq.29.2023.02.23.23.08.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 23:08:41 -0800 (PST)
Message-ID: <5a22777b-25ee-a479-77a7-4364b0ecfe10@redhat.com>
Date: Fri, 24 Feb 2023 08:08:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 4/7] dump: Introduce win_dump_available()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Janosch Frank <frankja@linux.ibm.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
References: <20230223231755.81633-1-philmd@linaro.org>
 <20230223231755.81633-5-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230223231755.81633-5-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.09, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 24/02/2023 00.17, Philippe Mathieu-Daudé wrote:
> Remove a pair of TARGET_X86_64 #ifdef'ry by introducing
> the win_dump_available() method. We'll soon extract it
> to a stub file for non-x86 targets.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   dump/dump.c     | 23 +++++++++++++----------
>   dump/win_dump.c |  5 +++++
>   dump/win_dump.h |  3 +++
>   3 files changed, 21 insertions(+), 10 deletions(-)
> 
> diff --git a/dump/dump.c b/dump/dump.c
> index 3784a9054d..c356a88be1 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -30,9 +30,15 @@
>   #include "qemu/main-loop.h"
>   #include "hw/misc/vmcoreinfo.h"
>   #include "migration/blocker.h"
> -
> -#ifdef TARGET_X86_64
>   #include "win_dump.h"
> +
> +#ifndef TARGET_X86_64
> +bool win_dump_available(Error **errp)
> +{
> +    error_setg(errp, "Windows dump is only available for x86-64");
> +
> +    return false;
> +}
>   #endif

I think I'd prefer to introduce the stub file immediately here already, but 
it's just a matter of taste.

So with the indentation fixed (that Richard mentioned):

Reviewed-by: Thomas Huth <thuth@redhat.com>



