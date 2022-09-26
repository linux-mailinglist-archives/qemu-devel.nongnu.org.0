Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0750A5EAD7A
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 19:03:27 +0200 (CEST)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocrVu-0002P1-1t
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 13:03:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrGA-0000OO-07
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:47:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48587)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ocrG3-0001gs-UJ
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 12:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664210821;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GGDtSSz2z8l9/HlNEmfX0BpW9xJ4Msp1jFdAzIDWRuQ=;
 b=EsKand2CsWCJvk9RGV//EDed7z0xWfJ9pJFG+4t+yAUQqP+sHCit76WC3XGFWYR804SWQp
 kSwHxONi9xdtFGCD1506i8vsjHACSxyCv5D4pV/Nm7DVAl02mh806TLEr6Fx77SE0PozGt
 Vp/zYJ6In61Q8qZIlhJ6vrP0fKOpef4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-80-5OmblGSeMSCTBJi146eQwg-1; Mon, 26 Sep 2022 12:47:00 -0400
X-MC-Unique: 5OmblGSeMSCTBJi146eQwg-1
Received: by mail-wm1-f69.google.com with SMTP id
 b5-20020a05600c4e0500b003b499f99aceso7312366wmq.1
 for <qemu-devel@nongnu.org>; Mon, 26 Sep 2022 09:47:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=GGDtSSz2z8l9/HlNEmfX0BpW9xJ4Msp1jFdAzIDWRuQ=;
 b=5DE3G9Yo8xro631hCmV6V5GhWTkIEaA197iNmQ6SY1hUf/fIC8/EEg+3nFOovLddTu
 al5uL0Hw6gHE+lHaafTUOaYVviRQ8u/L7aPVx5XElw39h5wrDkxMWF8/Pq5N/glX0tNc
 3ExborEg8WBTFSYagaMlysiHSNfrGzTWP4zeHJxZtxmEx3II4jq1wajb6P/B+wi9oZWn
 uAHlMNZs0UQdsYru7nU95GlbteEeLZSYVWMjQUAzHAw7FpYiBH+HZmHDt7PpUKDZWoyt
 HUxvIIumUi2k9jukSMPgC5SJPuTA95HU2pQh8hHvn1qaVkwMfGR8fp9UqUl06u418OLu
 kN6A==
X-Gm-Message-State: ACrzQf0o3fBGM1gYQTJKkyjA8Elz5r5Fcbeo2lnFekN45nDf9u2wXZQG
 QaSpQ7tC/jm7jpXjot0OJXddXwSwu98rzdHpnrL0Pczc9myNUg2Jf9IFe0cOSURotFdHJtDDQ+Q
 cgZhZxAt/wEk1O6E=
X-Received: by 2002:a05:600c:2c47:b0:3b4:fcdf:d783 with SMTP id
 r7-20020a05600c2c4700b003b4fcdfd783mr15563259wmg.157.1664210819161; 
 Mon, 26 Sep 2022 09:46:59 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7rXiFwLlxD4Bj9yfemioAdUsAJwSi69UuudhaXj8UaQpB/+PPHz5cK+vOCePxOqQGpAn0WAw==
X-Received: by 2002:a05:600c:2c47:b0:3b4:fcdf:d783 with SMTP id
 r7-20020a05600c2c4700b003b4fcdfd783mr15563245wmg.157.1664210818915; 
 Mon, 26 Sep 2022 09:46:58 -0700 (PDT)
Received: from [192.168.8.103] (tmo-064-141.customers.d1-online.com.
 [80.187.64.141]) by smtp.gmail.com with ESMTPSA id
 u7-20020a056000038700b002258235bda3sm15557291wrf.61.2022.09.26.09.46.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Sep 2022 09:46:58 -0700 (PDT)
Message-ID: <c2b99e1f-7204-a556-d177-039365878453@redhat.com>
Date: Mon, 26 Sep 2022 18:46:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v3 52/54] .gitlab-ci.d/windows.yml: Display meson test logs
Content-Language: en-US
To: Bin Meng <bmeng.cn@gmail.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
References: <20220925113032.1949844-1-bmeng.cn@gmail.com>
 <20220925113032.1949844-53-bmeng.cn@gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220925113032.1949844-53-bmeng.cn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 25/09/2022 13.30, Bin Meng wrote:
> From: Bin Meng <bin.meng@windriver.com>
> 
> When CI fails we don't know what causes the failure. Displaying the
> meson test logs can be helpful.
> 
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
> 
> (no changes since v2)
> 
> Changes in v2:
> - new patch: Display meson test logs in the Windows CI
> 
>   .gitlab-ci.d/windows.yml | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 9ef4667317..29a3ba04a4 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -61,7 +61,7 @@ msys2-64bit:
>     - .\msys64\usr\bin\bash -lc './configure --target-list=x86_64-softmmu
>         --enable-capstone'
>     - .\msys64\usr\bin\bash -lc 'make'
> -  - .\msys64\usr\bin\bash -lc 'make check'
> +  - .\msys64\usr\bin\bash -lc 'make check || { cat build/meson-logs/testlog.txt; exit 1; } ;'
>   
>   msys2-32bit:
>     extends: .shared_msys2_builder
> @@ -94,4 +94,4 @@ msys2-32bit:
>     - cd output
>     - ..\msys64\usr\bin\bash -lc "../configure --target-list=ppc64-softmmu"
>     - ..\msys64\usr\bin\bash -lc 'make'
> -  - ..\msys64\usr\bin\bash -lc 'make check'
> +  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'

Reviewed-by: Thomas Huth <thuth@redhat.com>


