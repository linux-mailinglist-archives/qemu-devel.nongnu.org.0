Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BDB638801
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 11:57:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyWNl-0008F2-Nj; Fri, 25 Nov 2022 05:56:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyWNj-0008Em-HO
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:56:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyWNh-0007tW-K0
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 05:56:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669373788;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KJnf7mQAM+xeDLiLG99bFWPKMW3pHOFW91iL4x8zxXQ=;
 b=Wepo9b6vk0NS03FYPafwpB6iaDo0DsNnRPfMvCoExxlZ0+Ip7FOQ7WRXZzFWS/x/YYyZNF
 rOXvwLctYh2EBRBjh0WpLKSMwRaaIU7icHuV8Hv/mlUoxI9kj+YM+hpSYYBaf5JG3HUggy
 xrKWn9nKAfCWTsMsf+cUwZ9wJGDcLZk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-362-mGqfJ21xNU6e7uJjqBAhoA-1; Fri, 25 Nov 2022 05:56:26 -0500
X-MC-Unique: mGqfJ21xNU6e7uJjqBAhoA-1
Received: by mail-wm1-f71.google.com with SMTP id
 m34-20020a05600c3b2200b003cf549cb32bso4042629wms.1
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 02:56:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KJnf7mQAM+xeDLiLG99bFWPKMW3pHOFW91iL4x8zxXQ=;
 b=eRiw8uI2mFAd4ONMM93Kq9ha8dl8FjXlST/8FIvTVnNjP8uLtggjf565TUMMpMXIOu
 d2gQs++y0DwNkGg8OPScYVDoGB36UCE7PDPoB42B/a6j8hffDVvZRA0YIhtU4sr5TrxD
 j0nWHOFB8uUP5T6WCOoDtpNVUG+WAtZGYQcPJ4Nno11epzNx9vc5STX25yYiTOMg+Afo
 iDKsvWCI8tazOmuEvtGLXCnv0X/HIdrxS2iKNa7yWfP6kEYuWrd8VlmzAr09flM5VBHm
 3nQHz3YNlzpqAl4LghxnEMsaD6WpmR87wzip1t3LJX4HvvZEF3lRuWvFQr0zlqvnsv7i
 Pbhw==
X-Gm-Message-State: ANoB5pnZ+Roc5GL1EPzMLVTBnyoBns49D9FdUjki4E5O+SDy4wDQZsY6
 SLp2OJCm+vJqkOvTyFWlkoOhB5en9tuY8XR+UV4ikzF/WrLcj9L0mo0NXZ/oeWQCBNLD9cP5OTr
 f6nlloVXLgWVzS+o=
X-Received: by 2002:adf:f64b:0:b0:241:cdf2:fe53 with SMTP id
 x11-20020adff64b000000b00241cdf2fe53mr16599720wrp.85.1669373785286; 
 Fri, 25 Nov 2022 02:56:25 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6Op3o4gyLG0FxwKFtFRzuDzmZQAQE8q1qBkg1HCbvy5fG0E1QBBonz2+aL+zws4ihGtT+lSw==
X-Received: by 2002:adf:f64b:0:b0:241:cdf2:fe53 with SMTP id
 x11-20020adff64b000000b00241cdf2fe53mr16599703wrp.85.1669373785067; 
 Fri, 25 Nov 2022 02:56:25 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-41.web.vodafone.de.
 [109.43.176.41]) by smtp.gmail.com with ESMTPSA id
 m6-20020adfc586000000b002366fb99cdasm3481725wrg.50.2022.11.25.02.56.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 02:56:24 -0800 (PST)
Message-ID: <3a193197-5991-ef9c-55b3-d9e56cac90e1@redhat.com>
Date: Fri, 25 Nov 2022 11:56:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] .gitlab-ci.d/windows.yml: Keep 64-bit and 32-bit
 build scripts consistent
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221125104951.3169611-1-bmeng.cn@gmail.com>
 <20221125104951.3169611-2-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221125104951.3169611-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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

On 25/11/2022 11.49, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> At present the build scripts of 32-bit and 64-bit are inconsistent.
> Let's keep them consistent for easier maintenance.
> 
> While we are here, add some comments to explain that for the 64-bit
> job, "--without-default-devices" is a must have, at least for now.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   .gitlab-ci.d/windows.yml | 20 ++++++++++++++------
>   1 file changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 99d78c2213..c6de65c784 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -61,12 +61,19 @@ msys2-64bit:
>         mingw-w64-x86_64-usbredir
>         mingw-w64-x86_64-zstd "
>     - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
> -  - $env:MSYSTEM = 'MINGW64'     # Start a 64 bit Mingw environment
> +  - $env:MSYSTEM = 'MINGW64'     # Start a 64-bit MinGW environment
>     - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
> -  - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
> +  - mkdir output
> +  - cd output
> +  # Note: do not remove "--without-default-devices"!
> +  # commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
> +  # changed to compile QEMU with the --without-default-devices switch
> +  # for the msys2 64-bit job, due to the build could not complete within
> +  # the project timeout.
> +  - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
>         --enable-capstone --without-default-devices'
> -  - .\msys64\usr\bin\bash -lc 'make'
> -  - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
> +  - ..\msys64\usr\bin\bash -lc 'make'
> +  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
>   
>   msys2-32bit:
>     extends: .shared_msys2_builder
> @@ -100,10 +107,11 @@ msys2-32bit:
>         mingw-w64-i686-usbredir
>         mingw-w64-i686-zstd "
>     - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
> -  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
> +  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinGW environment
>     - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
>     - mkdir output
>     - cd output
> -  - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
> +  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu
> +      --enable-capstone'

Capstone should automatically be detected if it is installed, so the 
--enable-capstone seems redundant here ... does it not work without it?

  Thomas


