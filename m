Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 712D56F38C8
	for <lists+qemu-devel@lfdr.de>; Mon,  1 May 2023 21:58:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptZdE-0007kX-EY; Mon, 01 May 2023 15:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptZd6-0007k6-2f
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:56:12 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ptZd4-00080F-Gr
 for qemu-devel@nongnu.org; Mon, 01 May 2023 15:56:11 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-3f178da219bso27842295e9.1
 for <qemu-devel@nongnu.org>; Mon, 01 May 2023 12:56:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682970968; x=1685562968;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oCmDelAvzu1+Vnd99VHxz3y8P4JPL4FfVA1xysdMRwM=;
 b=X6Yp71ysWsN+j7pW3heuqFHvslSV11e81qTf0H7/9eEs0hGQj3opvaoWoLAkZnmpFj
 BShdtqbRnUsiVbVOnnpBJmpwDGnDyYBrW2mhW8Qzfywe9F4nQkrUYBaSO8FfAMhAr+Fm
 rv9RjFpTqoErVDBm+ler8Bx4sgUQ47WLzztwKSVkY6VFx0n+bbyt3hbruLR/U+/+AQx2
 CJhBMULRawlurynW1n3bwe2TIOt+qeod3oRB+LKvR+i+UcEA7+5cJQ8gyrWXXo+TKO/b
 sM1lByf2g1eZJBmiGwAvDWAvDF+XifFFAYgFR7VdchN/kyw12bHEYVbnJUJ7FDjlGNcm
 x9Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682970968; x=1685562968;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oCmDelAvzu1+Vnd99VHxz3y8P4JPL4FfVA1xysdMRwM=;
 b=CoFKmSfNHcD6kXwFJib1f+JYFdZ17Xv4U2PNL6ZifiJhyXvgaKfkK1/KzyQY24Pabz
 0UH92JuefGzYu+nkHU3z+KWDkHGac9sJ1sPdqIZtsqGeIuXTdX2FEkTNg4e4ABdJjjQT
 JSVFtsL66CXSW1KI9ALzii8Q7c87kEhBTe0mTTVR1xjO2m1mRdrv87J3g5tX4bQ1dK3i
 /MiZ+s72CVOwfObnW2d63JHGPmuSKjn0VsyfXYnAOUJcY4xX7pZLrpfARuHXpY2ehTew
 Yq6CV4LJZdDi3JOBSJk3BjRm0ajQlb/ZfZ+schfLEq/COJZxsp8UIGZNWRLO7h1X53UL
 smJg==
X-Gm-Message-State: AC+VfDwCVEN2mL2HVCHC5T1KabxcdMZcPIHKIu0GhQoBI1u9uoZEtVSd
 /CDqpezqoZCGVB4lwRGJZgoSBA==
X-Google-Smtp-Source: ACHHUZ7PzWFmCCm6NKahCtGO48djunTzYbc6ldKoH+9nW3//Z1SzOfyg/XFN/df2X/OC5AbR0nfyKw==
X-Received: by 2002:a05:600c:378e:b0:3f0:a9b1:81e0 with SMTP id
 o14-20020a05600c378e00b003f0a9b181e0mr11383602wmr.19.1682970968562; 
 Mon, 01 May 2023 12:56:08 -0700 (PDT)
Received: from ?IPV6:2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940?
 ([2a02:c7c:74db:8d00:eca5:8bcb:58d9:c940])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a05600c0ad000b003f198dfbbfcsm27447015wmr.19.2023.05.01.12.56.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 May 2023 12:56:08 -0700 (PDT)
Message-ID: <0b9a1b74-a4a3-5268-0200-60e9b8343a79@linaro.org>
Date: Mon, 1 May 2023 20:56:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 08/19] qemu/bitops.h: Limit rotate amounts
Content-Language: en-US
To: Lawrence Hunter <lawrence.hunter@codethink.co.uk>, qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, pbonzini@redhat.com,
 philipp.tomsich@vrull.eu, kvm@vger.kernel.org, qemu-riscv@nongnu.org
References: <20230428144757.57530-1-lawrence.hunter@codethink.co.uk>
 <20230428144757.57530-9-lawrence.hunter@codethink.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230428144757.57530-9-lawrence.hunter@codethink.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.422,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 4/28/23 15:47, Lawrence Hunter wrote:
> From: Dickon Hood<dickon.hood@codethink.co.uk>
> 
> Rotates have been fixed up to only allow for reasonable rotate amounts
> (ie, no rotates >7 on an 8b value etc.)  This fixes a problem with riscv
> vector rotate instructions.
> 
> Signed-off-by: Dickon Hood<dickon.hood@codethink.co.uk>
> Reviewed-by: Richard Henderson<richard.henderson@linaro.org>
> ---
>   include/qemu/bitops.h | 24 ++++++++++++++++--------
>   1 file changed, 16 insertions(+), 8 deletions(-)

Queued to tcg-next.


r~

