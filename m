Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B1765F5FE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 22:44:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDY0Y-0001QG-DI; Thu, 05 Jan 2023 16:42:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDY0U-0001Q0-Tv
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:42:39 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDY0T-0001P1-9z
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 16:42:38 -0500
Received: by mail-wm1-x336.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso2323670wms.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 13:42:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YrHE8zqcZye9tUIoOoe8sOeR31VRwGN+ZvcZgxMmVsY=;
 b=iFibkqxrIyKCZ4z0q0/aMZxzahEKjMiLmca8voFMAHJcRyocwoNfXmJ1lXHSaDTIgC
 73OYhtCTmhYlmgPhx7wZiC11QP/ASjXiuP2evS5KLZLKIkB7X0AgFE93qZralFqYo3my
 4iU+mDiBgiTmP33gb1A+K4RYREXgm9qqdA5lmQe+d6s3Or4Uf2IiszbZBB51CKIcnM9u
 lKpSV6F6gh1BXCDj+kQvSRHveQxeJp/hl4nzlMG+3xRLN0tpBGVjtin87Og7HGt+wnT1
 CjRbxfpAIUMUREBOdSj2ogQPv+s5e+cFzpSH2TBAXTh1zWAHuqTahOdYq1Tgpfg4F792
 B9cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YrHE8zqcZye9tUIoOoe8sOeR31VRwGN+ZvcZgxMmVsY=;
 b=v8OrIX8PmQvp+/pTGru73t5WQgiTffVR+TKx/YViPnEvs1Wgw2VPFKBUVOPLmN0z7i
 fuQo/RZDnSgolWE00O2EFRISLaGWSxjSGd3L4iEK2aUDXVB6SKjw59dN8H1tUKfRo7Ry
 l82fktCgn3WaSQRwoo5Wzi+tGR2fILrSuESwZnH+dmz/1e3hHEayTANRJKjYcAu/WF9g
 tsInuds39Hd83NJa7EoGuagNbdi08lIsqMkPX21Fjw3pC5DX+C9mL+QEM9Tx1WVmRVpt
 Kv7YOZgi6dGTUGEs0v/LVH5kJmBUeoFjjnS6NrnQuUc+TDILa87WV0IqYbdzuUbgW/zL
 B8hA==
X-Gm-Message-State: AFqh2kp1uPe4ogAZof8zTYBvyGIdeKihq1TS3YIBcllViPs9vVUGUrTj
 3sTTClHs7bHRF2W1RgOsnxNnNg==
X-Google-Smtp-Source: AMrXdXuNZoOMgoniuaMzBOrfk8qLZZVL+YItJ43SdYhDOF4kBWKKBBRNQz6NqPxXiNhhDUGJkSJaoA==
X-Received: by 2002:a05:600c:4da0:b0:3d3:5027:4cce with SMTP id
 v32-20020a05600c4da000b003d350274ccemr39667961wmp.10.1672954953599; 
 Thu, 05 Jan 2023 13:42:33 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a05600c510500b003b4ff30e566sm8802361wms.3.2023.01.05.13.42.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 13:42:33 -0800 (PST)
Message-ID: <4ff2d01a-e6bb-5a99-356b-6b2ade61b667@linaro.org>
Date: Thu, 5 Jan 2023 22:42:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] .gitlab-ci.d/windows: Do not run the qtests in the
 msys2-32bit job
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Bin Meng <bin.meng@windriver.com>, Stefan Weil <sw@weilnetz.de>
References: <20230105204819.26992-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230105204819.26992-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 5/1/23 21:48, Thomas Huth wrote:
> The qtests are not stable in the msys2-32bit job yet - especially
> the test-hmp and the qom-test are failing randomly. Until this is
> fixed,

Who is gonna look after this?

I'm not against this patch, but I'm afraid this config starts to
bitrot more. That said, maybe it is time to deprecate the 32-bit
hosts?

> let's better disable the qtests here again to avoid failing
> CI tests.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   .gitlab-ci.d/windows.yml | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/.gitlab-ci.d/windows.yml b/.gitlab-ci.d/windows.yml
> index 22f794e537..a1d5790580 100644
> --- a/.gitlab-ci.d/windows.yml
> +++ b/.gitlab-ci.d/windows.yml
> @@ -116,4 +116,5 @@ msys2-32bit:
>     - ..\msys64\usr\bin\bash -lc '../configure --target-list=ppc64-softmmu
>           --disable-opengl'
>     - ..\msys64\usr\bin\bash -lc 'make'
> -  - ..\msys64\usr\bin\bash -lc 'make check || { cat meson-logs/testlog.txt; exit 1; } ;'
> +  - ..\msys64\usr\bin\bash -lc 'make check MTESTARGS=\"--no-suite qtest\" ||
> +                                { cat meson-logs/testlog.txt; exit 1; }'


