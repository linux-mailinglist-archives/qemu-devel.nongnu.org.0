Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E575069DBE8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 09:29:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUO0i-0006mP-E7; Tue, 21 Feb 2023 03:28:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUO0d-0006m8-SS
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:28:23 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pUO0c-0007yA-4r
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 03:28:23 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 o4-20020a05600c4fc400b003e1f5f2a29cso2895935wmq.4
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 00:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XYk5UNRL2FIv+x0Ad9kSHyfXtWx4Oe+b56EJs7qrk+0=;
 b=uMmntoRI2ITszWjR83Oe8sjZzcgezUCV7rchj0rlZc+TANFOm//w2M5RnE7NQF7R3/
 XhjyTMwOgUWBJUCKOdbFl4EPvqmFC59be7cIpTNayN7tQdafJZBqiclxd7X9tyzWyYZJ
 lCpr+SvFqpl1lM7clBByw6eqKxbLIGgL2Wo6QcevVH+uq6eCVRbc8z5J5bQENIAEEh6J
 eHi3bEgxuSWUnqOKrgoMeVPjGKjYJwZFLRoioebp8J87cq9rYA811qQjmxI+YDhILLTP
 2J0Et0905eHNZIjnsMouNd5iYHajAeFNNpqUuHRFRxrELe7cVYoZl1mBnv+2AnyxxUOM
 Db0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XYk5UNRL2FIv+x0Ad9kSHyfXtWx4Oe+b56EJs7qrk+0=;
 b=Bg6FPQNS1f39G7xJTJh5Psb2HxGTVPo0QuYGK86zviw+68MFDiCu8QNUZDhB/+jRg4
 OVJPJ1xoAGigLh87Vw7a4ztsrI9+OZeYDXgneC2HBeX3ncyXHf42CFdQmym/OnMs0PsZ
 YuoZFHMY4Umc5yShvzXCmdfHiOPmR7BYN084sKHIqggBVTL5KiRoxXa6tDfn8c/zUdPd
 O98XMVXJf3eSi4oKhPBw9eOEVvri67bZ4K/YyCRFhM0O/NkfB+Rd9bNHkAi4CCVEcw8u
 7yBKsPrcTbVjtZFy49U0+xT+ZRq5F+ttvf9/tZ3Fv/hS9/6tMEMIBWSJpEaNPoCjxpPx
 /bzw==
X-Gm-Message-State: AO0yUKWZprcBWyccbD8yRxV/J7cmACIPpWWvHCphZsxctDRu2TCGEtZ9
 5PKXz7GHF6EFgkrmfKTWf2An7w==
X-Google-Smtp-Source: AK7set/K7wGtpP+vkpNtYGMNQKkY9Ka52dbteFxqKTXl+1PXnjm5WR3yBRfftrv5UeaIStGx7Fj3vQ==
X-Received: by 2002:a05:600c:2ed2:b0:3df:b5ae:529f with SMTP id
 q18-20020a05600c2ed200b003dfb5ae529fmr3124056wmn.31.1676968099642; 
 Tue, 21 Feb 2023 00:28:19 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 r5-20020a1c2b05000000b003ddf2865aeasm3976051wmr.41.2023.02.21.00.28.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 00:28:19 -0800 (PST)
Message-ID: <c2fcece8-78a5-fd5c-891a-cdb26a503a78@linaro.org>
Date: Tue, 21 Feb 2023 09:28:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v5 06/29] e1000e: Mask registers when writing
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 "Michael S . Tsirkin" <mst@redhat.com>, Yan Vugenfirer
 <yvugenfi@redhat.com>, Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Alexander Bulekov <alxndr@bu.edu>
References: <20230201033539.30049-1-akihiko.odaki@daynix.com>
 <20230201033539.30049-7-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230201033539.30049-7-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 1/2/23 04:35, Akihiko Odaki wrote:
> When a register has effective bits fewer than their width, the old code
> inconsistently masked when writing or reading. Make the code consistent
> by always masking when writing, and remove some code duplication.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   hw/net/e1000e_core.c | 94 +++++++++++++++++++-------------------------
>   1 file changed, 40 insertions(+), 54 deletions(-)
> 
> diff --git a/hw/net/e1000e_core.c b/hw/net/e1000e_core.c
> index 181c1e0c2a..e6fc85ea51 100644
> --- a/hw/net/e1000e_core.c
> +++ b/hw/net/e1000e_core.c
> @@ -2440,17 +2440,19 @@ e1000e_set_fcrtl(E1000ECore *core, int index, uint32_t val)
>       core->mac[FCRTL] = val & 0x8000FFF8;
>   }
>   
> -static inline void
> -e1000e_set_16bit(E1000ECore *core, int index, uint32_t val)
> -{
> -    core->mac[index] = val & 0xffff;
> -}
> +#define E1000E_LOW_BITS_SET_FUNC(num)                                \
> +    static void                                                      \
> +    e1000e_set_##num##bit(E1000ECore *core, int index, uint32_t val) \
> +    {                                                                \
> +        core->mac[index] = val & (BIT(num) - 1);                     \
> +    }
>   
> -static void
> -e1000e_set_12bit(E1000ECore *core, int index, uint32_t val)
> -{
> -    core->mac[index] = val & 0xfff;
> -}
> +E1000E_LOW_BITS_SET_FUNC(4)
> +E1000E_LOW_BITS_SET_FUNC(6)
> +E1000E_LOW_BITS_SET_FUNC(11)
> +E1000E_LOW_BITS_SET_FUNC(12)
> +E1000E_LOW_BITS_SET_FUNC(13)
> +E1000E_LOW_BITS_SET_FUNC(16)

This looks correct but is hard to be sure, too many changes at once
(for my taste at least).

Split suggestions:
- move macros and 6/16-bit masks
- move 4/11 masks
- move 13-bit mask

Or:
- move macros and 13-bit masks
- move the rest

Except if Jason is OK to merge as is.

