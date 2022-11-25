Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D226638B0F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:22:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYdz-0000FA-4E; Fri, 25 Nov 2022 08:21:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyYdw-0000EN-Ew
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:21:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyYdu-0000jN-TY
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:21:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669382482;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Kp/jEBq/Y7uePaGbHNvJ/S2VraZTQMHAuAz72fE7fmc=;
 b=QUTqXX9KmetotHIgsNlG32eJO/pRC72PVdOx4jhXHJQzC1ghUwd9b4rtDH698+jirBeXuR
 iL/NUwHU5n06T28C0nIZFzuOwrcmttayvEDTHvGwWCwOyYVroVZUF53RbyFVbLaTHh4cld
 Vuw0XdCO8K7kAijteR0uYxp6vBnD76E=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-643-ZTEaLxEwN464hb3cWDHR1A-1; Fri, 25 Nov 2022 08:21:21 -0500
X-MC-Unique: ZTEaLxEwN464hb3cWDHR1A-1
Received: by mail-wm1-f71.google.com with SMTP id
 c187-20020a1c35c4000000b003cfee3c91cdso2423714wma.6
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 05:21:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Kp/jEBq/Y7uePaGbHNvJ/S2VraZTQMHAuAz72fE7fmc=;
 b=cnQ3kifUm3/tGS3GD2bMnbuhORYvZ7lppIMk5DyfS58UiePw0wJz8nyMYk6sVnh1Nn
 EAYmb5xvTk8SZapRrlkbW9yw64bEfzz2A+dKWpgFP4KYJbbZet8L55o7sSPzMSIrKdLj
 l/+dFoD0IJsom+9EHGCKO+GR6EwQD2+bM/gRjwqE0ph5YVG1mUtSCWbsq+2zcjc25iLk
 ll5RpGxJMdjg1xTfvW8x7Iu28cZkh0LQVcO9Ka9wSgQAlONC5AZxdm6JGkjWaJdCRrPg
 dvO4SdiDBNd1x98iZVO8ZI9/g+xKrSa4+ojxFL+PaHPJTH4NggRhpITrYu1hylGB7BVo
 igtA==
X-Gm-Message-State: ANoB5pm4UOsgMg04Qrnws6HuXZK7Bwbuo8O3pgBWf/0wR7auifSuUqSy
 jQndCX0fsUtS/g9C8D/HU7nOXbVCsvitPlhg6taItY0ZR4JMkJt9+tReHEEERQLNTn7LGyMVwoA
 iSCylBApCk77hSSg=
X-Received: by 2002:a1c:4b12:0:b0:3cf:5237:c0be with SMTP id
 y18-20020a1c4b12000000b003cf5237c0bemr27046450wma.163.1669382479894; 
 Fri, 25 Nov 2022 05:21:19 -0800 (PST)
X-Google-Smtp-Source: AA0mqf59PbXLFKSqz+O7jsofSya75LALQiAocJyqNaeADik2Hqj8UE71zA2CpxqYX3FWSEGpDJomuQ==
X-Received: by 2002:a1c:4b12:0:b0:3cf:5237:c0be with SMTP id
 y18-20020a1c4b12000000b003cf5237c0bemr27046428wma.163.1669382479711; 
 Fri, 25 Nov 2022 05:21:19 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-41.web.vodafone.de.
 [109.43.176.41]) by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b00241c6729c2bsm3685001wrr.26.2022.11.25.05.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 05:21:19 -0800 (PST)
Message-ID: <77e8b29f-0bec-9c8b-0916-35f46c8a8a9c@redhat.com>
Date: Fri, 25 Nov 2022 14:21:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 3/4] .gitlab-ci.d/windows.yml: Exclude qTests from
 64-bit CI job for now
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221125114100.3184790-1-bmeng.cn@gmail.com>
 <20221125114100.3184790-3-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221125114100.3184790-3-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 25/11/2022 12.40, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> qTests don't run successfully with "--without-default-devices",
> so let's exclude the qtests from CI for now.
> 
> Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> (no changes since v1)
> 
>   .gitlab-ci.d/windows.yml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 6741c90ff1..9b5c4bcd8a 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -73,7 +73,9 @@ msys2-64bit:
>     - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
>         --without-default-devices'
>     - ..\msys64\usr\bin\bash -lc 'make'
> -  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
> +  # qTests don't run successfully with "--without-default-devices",
> +  # so let's exclude the qtests from CI for now.
> +  - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=\"--no-suite qtest\" || { cat meson-logs/testlog.txt; exit 1; } ;'
>   
>   msys2-32bit:
>     extends: .shared_msys2_builder

Reviewed-by: Thomas Huth <thuth@redhat.com>


