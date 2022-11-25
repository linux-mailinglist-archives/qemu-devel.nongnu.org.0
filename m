Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E27638B10
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Nov 2022 14:22:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyYdn-0000Ar-4T; Fri, 25 Nov 2022 08:21:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyYdl-0000Ai-MX
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:21:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oyYdk-0000hc-5I
 for qemu-devel@nongnu.org; Fri, 25 Nov 2022 08:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669382470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXvMWpaxr0F4+BbkEkek63iH/5RNWVhOtXsIucK5dII=;
 b=FZrWkw2WlZAscxRCDS91sYXR3UHOEB6Up3muIRmyNNRKi/BacYJN20msBrTfe1M6dS6VA9
 RS2m1ZqlNZHP9u4Z6N3Q7nPvcr5hh3uxfANyV/6Xi03w+7il5+8WSDRosDV7PVsKwU9qg1
 q7LdGiBwXZyRO9jwd3Ojf+PV97ZSl9s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-cuo5m0wGOYa8SXX4Ipa1zg-1; Fri, 25 Nov 2022 08:21:09 -0500
X-MC-Unique: cuo5m0wGOYa8SXX4Ipa1zg-1
Received: by mail-wm1-f72.google.com with SMTP id
 1-20020a05600c028100b003cf7833293cso4194589wmk.3
 for <qemu-devel@nongnu.org>; Fri, 25 Nov 2022 05:21:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pXvMWpaxr0F4+BbkEkek63iH/5RNWVhOtXsIucK5dII=;
 b=v6Ua8MFcUVR+YDeiuFujj3xAUCD/O9dKw1tLMHLHx8VfsBPXQ7xD90O8Tkka0VEZ94
 I0OQFTt3tDJ/KSORfMPzYK585jNJUJD7ZZhjIBq8yZ1JFiWO9QAwaOsLfUO1OOhdVmzL
 OLzc5O9zkph+OG5d1V7PUOkAbxBbaRLT0WsoLMEQls5NH97NNC3QuUsr607HnbKazh64
 mQ1QCq7500tcNr+3Tuwf2LYu4i89Mn4oCmEYzK8BEtsSuNquIALEoYtkOTXCFUaysFEv
 qSoeTi8KRQU2eHXFerH3UqlYJU+0VdJO2k85XpyXxrEFaHzCJmp7wpeR56IlqV+UAo8f
 9QHQ==
X-Gm-Message-State: ANoB5plxb3k41rOAJtUIDGyU49G1Gt+tFCBiPhsFQukeo/x/mrJeF606
 aSdYhnln+lcwBvNLR2RHaG2P4IRFSEvLx7aEseHXrmyBSnn2H6iRXH9OfHi3K9mInWRI+GbmrZ8
 s0T5pjWMV76GBLR0=
X-Received: by 2002:a05:600c:22c4:b0:3cf:71b7:7a41 with SMTP id
 4-20020a05600c22c400b003cf71b77a41mr28704018wmg.31.1669382467721; 
 Fri, 25 Nov 2022 05:21:07 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5nWLFN4HNX+t8prpaypRairSSEU5gLtjROFFnEv3hIiBqxPBgEA8uWpxA7L3tS1AErhoz0HA==
X-Received: by 2002:a05:600c:22c4:b0:3cf:71b7:7a41 with SMTP id
 4-20020a05600c22c400b003cf71b77a41mr28703990wmg.31.1669382467505; 
 Fri, 25 Nov 2022 05:21:07 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-176-41.web.vodafone.de.
 [109.43.176.41]) by smtp.gmail.com with ESMTPSA id
 x10-20020a05600c21ca00b003a6125562e1sm4745514wmj.46.2022.11.25.05.21.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 25 Nov 2022 05:21:06 -0800 (PST)
Message-ID: <a3e60b15-209f-88c8-d7e8-4a984041a642@redhat.com>
Date: Fri, 25 Nov 2022 14:21:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 3/4] .gitlab-ci.d/windows.yml: Exclude qTests from 64-bit
 CI job for now
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20221125104951.3169611-1-bmeng.cn@gmail.com>
 <20221125104951.3169611-3-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221125104951.3169611-3-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
> qTests don't run successfully with "--without-default-devices",
> so let's exclude the qtests from CI for now.
> 
> Suggested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
>   .gitlab-ci.d/windows.yml | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index c6de65c784..fce9a02387 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -73,7 +73,9 @@ msys2-64bit:
>     - ..\msys64\usr\bin\bash -lc '../configure --target-list=x86_64-softmmu
>         --enable-capstone --without-default-devices'
>     - ..\msys64\usr\bin\bash -lc 'make'
> -  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
> +  # qTests don't run successfully with "--without-default-devices",
> +  # so let's exclude the qtests from CI for now.
> +  - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=\"--no-suite qtest\" || { cat meson-logs/testlog.txt; exit 1; } ;'
>   
>   msys2-32bit:
>     extends: .shared_msys2_builder

Reviewed-by: Thomas Huth <thuth@redhat.com>


