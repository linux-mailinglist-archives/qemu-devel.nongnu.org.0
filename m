Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6CA5A0BAA
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Aug 2022 10:38:50 +0200 (CEST)
Received: from localhost ([::1]:33396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oR8Ny-0006Kp-Ig
	for lists+qemu-devel@lfdr.de; Thu, 25 Aug 2022 04:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oR86e-0006Vz-7d
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:21:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29394)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oR86b-0006RM-94
 for qemu-devel@nongnu.org; Thu, 25 Aug 2022 04:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661415645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NXeb5198obPZJiodrHJFuzqmFMyrZiA4V/P9kvOKFMI=;
 b=a00Bb/61zbpV2OY4Xx5+q5G1j28YOS/iDAjeFBNF1jI34tRaIEcHNr4714x4AOkov/o5Tp
 QyAMjd0eO8SzauUjiF1xKauG1SNrBOVwngqmm1meFJ+u4wikHLh0tGMPU9TkY3emvfIRPO
 FMW0yBjXeHWluE/lT4xeyN4R/FpA5F8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-588-8yGDPAOiPlqgINZauyHmpA-1; Thu, 25 Aug 2022 04:20:44 -0400
X-MC-Unique: 8yGDPAOiPlqgINZauyHmpA-1
Received: by mail-wm1-f69.google.com with SMTP id
 j36-20020a05600c1c2400b003a540d88677so10627922wms.1
 for <qemu-devel@nongnu.org>; Thu, 25 Aug 2022 01:20:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=NXeb5198obPZJiodrHJFuzqmFMyrZiA4V/P9kvOKFMI=;
 b=gZn9TWobX5qDEgSJg086laZaYqkLq/aYqAUAOB/MhRIq0V6wN6SXVb4bQI2VPOpRzs
 r7yGOtQFc30pWjgivIIWNP9EVJ7SX1l3nT6rzNBep1iCwymciH/vK6lIzmwaf3et+6XO
 RPtiS2PcB33/rp78O1zCZIrBct/6Wpe8sxA1ykDjVNkr7GZ/wFybHg7RPDz/F7/HbLkG
 z9MunZCFDBApU6JzUzVc0InE/2beSfdYabKTU7jEFDEuuIqhM7AOvjqr9iLXN0Q8A3yH
 GirABBPY0j7zRRhrCOAitXyU3fUHG1gdmsqgMt8isUb4B02HwU8IUDLQ07eMRaGUY7zG
 0aZQ==
X-Gm-Message-State: ACgBeo1hzPSgwcVypl30hrK6SyHu3YCt7WjU7nfGXTL3AnOdNtQ5TyKL
 6G/EZU0LIP1/ZXFnKNCCgQwU0HJ+Xcci3cRcedhJyAGAh5kNLZnoeFURuENj4Q7yzChgZXiQk6D
 /U9TCEArKMTQZjG8=
X-Received: by 2002:a05:600c:ad4:b0:3a5:50b2:f991 with SMTP id
 c20-20020a05600c0ad400b003a550b2f991mr7105130wmr.146.1661415643115; 
 Thu, 25 Aug 2022 01:20:43 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5o+sK1l6ztbPAOkEivvWca9v++d+AEicrf9gImhHPC/Wpixzce+tccodxa7BCZDiJKgKODTw==
X-Received: by 2002:a05:600c:ad4:b0:3a5:50b2:f991 with SMTP id
 c20-20020a05600c0ad400b003a550b2f991mr7105118wmr.146.1661415642903; 
 Thu, 25 Aug 2022 01:20:42 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-177-177.web.vodafone.de.
 [109.43.177.177]) by smtp.gmail.com with ESMTPSA id
 l16-20020a05600c1d1000b003a61306d79dsm6095367wms.41.2022.08.25.01.20.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Aug 2022 01:20:42 -0700 (PDT)
Message-ID: <92a10a3e-9b82-204d-60ac-5bf21e0d00cb@redhat.com>
Date: Thu, 25 Aug 2022 10:20:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 15/51] tests/qtest: Adapt {m48t59,rtc}-test cases for win32
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
 <20220824094029.1634519-16-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220824094029.1634519-16-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/08/2022 11.39, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> There is no tm_gmtoff member in 'struct tm' on Windows.
> Update rtc-test.c and m48t59-test.c accordingly.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   tests/qtest/m48t59-test.c | 2 +-
>   tests/qtest/rtc-test.c    | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/qtest/m48t59-test.c b/tests/qtest/m48t59-test.c
> index b94a1230f7..843d2ced8e 100644
> --- a/tests/qtest/m48t59-test.c
> +++ b/tests/qtest/m48t59-test.c
> @@ -137,7 +137,7 @@ static void cmos_get_date_time(QTestState *s, struct tm *date)
>       date->tm_mday = mday;
>       date->tm_mon = mon - 1;
>       date->tm_year = base_year + year - 1900;
> -#ifndef __sun__
> +#if !defined(__sun__) && !defined(_WIN32)
>       date->tm_gmtoff = 0;
>   #endif
>   
> diff --git a/tests/qtest/rtc-test.c b/tests/qtest/rtc-test.c
> index 8126ab1bdb..02ed4e1238 100644
> --- a/tests/qtest/rtc-test.c
> +++ b/tests/qtest/rtc-test.c
> @@ -111,7 +111,7 @@ static void cmos_get_date_time(struct tm *date)
>       date->tm_mday = mday;
>       date->tm_mon = mon - 1;
>       date->tm_year = base_year + year - 1900;
> -#ifndef __sun__
> +#if !defined(__sun__) && !defined(_WIN32)
>       date->tm_gmtoff = 0;
>   #endif
>   

Reviewed-by: Thomas Huth <thuth@redhat.com>


