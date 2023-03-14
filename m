Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B12F86B9C6C
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Mar 2023 18:03:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pc82O-0000uH-C4; Tue, 14 Mar 2023 13:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc82L-0000r9-AK
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:02:09 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pc82J-00056Y-L6
 for qemu-devel@nongnu.org; Tue, 14 Mar 2023 13:02:09 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 r19-20020a05600c459300b003eb3e2a5e7bso10674763wmo.0
 for <qemu-devel@nongnu.org>; Tue, 14 Mar 2023 10:02:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678813325;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=5IRm3YZlwThVMhXnhMVS9Zy4d5EigIF+VlT2iswtqLY=;
 b=KLzX8+0acTTPLXRKoVTElw4Kv/2UwWumk8ylL7U7Ey7FoufXUsCxepGrH77A3jaaaE
 Q6wfZRSQ42vL9qzWVNMU8lig5+e8oFCfj4XpG76xqArIeSslB6tKTvZm1FvMokCPmPU6
 pbfvwD55QEkov1PsHIxYPoLoKGlENH6Z5/rxMxDxmvl80XoE6b4vS6L/3LyIQ5ipLOAU
 8+s8ICyuICschPhmOEfEQmpiOaUdk6SYT6BfykTsKmDc9CiFlY4YwjYhtHfNVVZ1zvBl
 lIcJOqHB3nT+fLo22lFQIDxCkvZD5+MdutGsVIa4ArusaNyWSESz99kSmt+lR2JrFTuQ
 UUhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678813325;
 h=content-transfer-encoding:in-reply-to:from:cc:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5IRm3YZlwThVMhXnhMVS9Zy4d5EigIF+VlT2iswtqLY=;
 b=TBV8hrZ1GlbLzom7XnBITrH/oNRhJWgkhz0diJFi+pG1GfXFz9LZvfNa7h1gK4y7YB
 LJOqqF10A0wb2y3B5p/NlTTWemxm2fOKBqCh75sXcGcnck8VSdD9XNcvY/B1G3N5pDWK
 KXVUptQqHAKdjuCgBuqkCu8ETNIwRar8UjNPaLNcGQxSsL5/wLzMGFOzNg52aT6iQKDf
 iVR44QaEQY46uijpEAeVqG8g2Rbkro6w1lnxwrmP5zpvVd82Nhrb0emTHMERJ2s5Bq2J
 QfCs5Tg+Yo+Jo4NUAfeIoe8jKkY4pB+pW4p77BdcKe8CuBIUqgHrMpwUlDsNQHuMR5hD
 Ji+g==
X-Gm-Message-State: AO0yUKU7/nFM0/rGcmBPiIWFZGdh6ETLCixi2QeJdkLyuZe30hTlh5HK
 Jx0LhGgXMStXx6Z7NxoKqaY9ile7NFX2ftJnKQHG6A==
X-Google-Smtp-Source: AK7set8D6Hsnfej4QpHxq7vxTIyDkfQCggofXEzDH2Dg0nbdLcEUrmR6RvQGBmAhaFMgaItQplVQ8Q==
X-Received: by 2002:a05:600c:5398:b0:3ed:2b49:5c77 with SMTP id
 hg24-20020a05600c539800b003ed2b495c77mr3527431wmb.6.1678813325496; 
 Tue, 14 Mar 2023 10:02:05 -0700 (PDT)
Received: from [192.168.69.115] (lfbn-mon-1-678-16.w2-4.abo.wanadoo.fr.
 [2.4.247.16]) by smtp.gmail.com with ESMTPSA id
 x8-20020a5d60c8000000b002cea8664304sm2501492wrt.91.2023.03.14.10.01.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Mar 2023 10:02:04 -0700 (PDT)
Message-ID: <f8e7d037-18d7-d245-ab6e-936ec17610cc@linaro.org>
Date: Tue, 14 Mar 2023 18:01:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH] scripts/git.orderfile: Display QAPI script changes before
 schema ones
Content-Language: en-US
To: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>
References: <20230224214114.26464-1-philmd@linaro.org>
Cc: QEMU Trivial <qemu-trivial@nongnu.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230224214114.26464-1-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

Cc'ing qemu-trivial@

On 24/2/23 22:41, Philippe Mathieu-Daudé wrote:
> When modifying QAPI scripts and modifying C files along,
> it makes sense to display QAPI changes first.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> Failed example:
> https://lore.kernel.org/qemu-devel/20230224155451.20211-3-philmd@linaro.org/
> ---
>   scripts/git.orderfile | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/scripts/git.orderfile b/scripts/git.orderfile
> index 8edac0380b..70adc1a74a 100644
> --- a/scripts/git.orderfile
> +++ b/scripts/git.orderfile
> @@ -22,6 +22,8 @@ Makefile*
>   *.mak
>   meson.build
>   
> +# qapi scripts
> +scripts/qapi*
>   # qapi schema
>   qapi/*.json
>   qga/*.json


