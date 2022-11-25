Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01953638B12
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:23:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYf0-0001BG-9Q; Fri, 25 Nov 2022 08:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyYex-000174-H4
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:22:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyYev-0000vE-So
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669382544;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=f1linwNxZqQSpoVkdqPv5UeQuHuIRIf5tIGS2S0X0t4=;
 b=VyGmF1/zcGNesFoAZZbydWa30vriNjTCqpEmjKfLyY0uuguIyaj+7edDKgf7OghSqgioGe
 2KHIb7PNkR78VOhX5iOfAEF2nglZWYUpSoxpG0+pM4nrUnXflkgSK0BxuGlncDihFdWVOs
 cWQGmzVHheanul7EnWrCngbjYNsrB5c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-539-6ZV1VrTnNgqCwboWtYF7EA-1; Fri, 25 Nov 2022 08:22:23 -0500
X-MC-Unique: 6ZV1VrTnNgqCwboWtYF7EA-1
Received: by mail-wm1-f70.google.com with SMTP id
 ay19-20020a05600c1e1300b003cf758f1617so4186778wmb.5
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 05:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=f1linwNxZqQSpoVkdqPv5UeQuHuIRIf5tIGS2S0X0t4=;
 b=nuyxWwmY7ilaZlMpOIOug+KDBfaDprWZH7C+xXYM/IqoNNNbtfOK7xM+/eJnzgfppl
 ZS+wIxH87so62PYkE4wUhxTsaRjKIDP1Gy4qKPk2yZNwZDtO5yH7GuMOcGHPUT1KTMUB
 u7yvsmPluBJHIIqaJeUemzpkAaleXDbvDGV6aZJGgE42iSJ6u5hROYPOWx6ULE5cgeIF
 5d1D3B42UGLJcApB4rXRskyrRd+hTPlnOWWx2Dg/Cri3uZKYbGkfPr4SfAkXy7BzuDOf
 DGeL/wcedM1hfAJvpGKJ8YzEtZzHx4328V2qH+iBR5vrlylwUxTv3NHkZHxusU4yZLhk
 2e2A==
X-Gm-Message-State: ANoB5pkqwdS+QXegXs62RrbpppfImm6hVcl2BDLCHE0zUxf5hNFKoxkv
 JF+jKMQ7ifACTlXI9EhTV2RZ/XkOlds8YW9PlwyoO0mqAUHZcWIkOIlg1iy6gpHWjMg1pkTGA/Z
 vzF46L/VpKiZrzX0=
X-Received: by 2002:adf:fd05:0:b0:241:f0e0:cc24 with SMTP id
 e5-20020adffd05000000b00241f0e0cc24mr7679838wrr.198.1669382542017; 
 Fri, 25 Nov 2022 05:22:22 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6mwphb1js0nk66iNNbDdQsQoTDEvOCI5FAyezaJDuMMuTKYZZWwfbZqHXQUySkfpVBEzVMnw==
X-Received: by 2002:adf:fd05:0:b0:241:f0e0:cc24 with SMTP id
 e5-20020adffd05000000b00241f0e0cc24mr7679805wrr.198.1669382541578; 
 Fri, 25 Nov 2022 05:22:21 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-41.web.vodafone.de.
 [109.43.176.41]) by smtp.gmail.com with ESMTPSA id
 z4-20020a05600c0a0400b003c70191f267sm10377308wmp.39.2022.11.25.05.22.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 05:22:21 -0800 (PST)
Message-ID: <0c13727c-0e1a-333a-2397-d3f983520f0b@redhat.com>
Date: Fri, 25 Nov 2022 14:22:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 2/4] .gitlab-ci.d/windows.yml: Keep 64-bit and 32-bit
 build scripts consistent
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221125114100.3184790-1-bmeng.cn@gmail.com>
 <20221125114100.3184790-2-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221125114100.3184790-2-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
> At present the build scripts of 32-bit and 64-bit are inconsistent.
> Let's keep them consistent for easier maintenance.
> 
> While we are here, add some comments to explain that for the 64-bit
> job, "--without-default-devices" is a must have, at least for now.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> Changes in v2:
> - remove "--enable-capstone"
> 
>   .gitlab-ci.d/windows.yml | 21 ++++++++++++++-------
>   1 file changed, 14 insertions(+), 7 deletions(-)
> 
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 99d78c2213..6741c90ff1 100644
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
> -      --enable-capstone --without-default-devices'
> -  - .\msys64\usr\bin\bash -lc 'make'
> -  - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
> +  - mkdir output
> +  - cd output
> +  # Note: do not remove "--without-default-devices"!
> +  # commit 9f8e6cad65a6 ("gitlab-ci: Speed up the msys2-64bit job by using --without-default-devices"
> +  # changed to compile QEMU with the --without-default-devices switch
> +  # for the msys2 64-bit job, due to the build could not complete within
> +  # the project timeout.
> +  - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
> +      --without-default-devices'
> +  - ..\msys64\usr\bin\bash -lc 'make'
> +  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
>   
>   msys2-32bit:
>     extends: .shared_msys2_builder
> @@ -100,10 +107,10 @@ msys2-32bit:
>         mingw-w64-i686-usbredir
>         mingw-w64-i686-zstd "
>     - $env:CHERE_INVOKING = 'yes'  # Preserve the current working directory
> -  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinG environment
> +  - $env:MSYSTEM = 'MINGW32'     # Start a 32-bit MinGW environment
>     - $env:MSYS = 'winsymlinks:native' # Enable native Windows symlink
>     - mkdir output
>     - cd output
> -  - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
> +  - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu'
>     - ..\msys64\usr\bin\bash -lc 'make'
>     - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'

Reviewed-by: Thomas Huth <thuth@redhat.com>


