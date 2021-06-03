Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D11F39AAA7
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 21:07:00 +0200 (CEST)
Received: from localhost ([::1]:35396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1losgF-0004Gi-8X
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 15:06:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losdx-0001cN-Iv
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 15:04:38 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1losds-0000a9-PJ
 for qemu-devel@nongnu.org; Thu, 03 Jun 2021 15:04:37 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so6040516pjz.3
 for <qemu-devel@nongnu.org>; Thu, 03 Jun 2021 12:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RwL1rJ5KL9k+WTfJJIAW4IgTQx13D4eDeTQ78l9u0i4=;
 b=bKz2XYUw20FyBL9ZDUtQzhE8V0oef3/KruQjaDiCO8AkekkRL5BNMhRFKIGSiMNe24
 jCq0ml4omDduAIflSvsfhZ7BQ3dCd3BchLXSChVMVApybBB38LYJYjSH00+1a7u5WTOY
 JfPLK5wQBdBX1OFkaSXRjvV1S+RNjbF9MOfVUzagnXNcSYz8iqNco8w+NQRr8lBZ84aV
 xePqgwhCNrw37p9OC5bRZIQPxhnVlQqX07ooJVaMIkkLnuSNW7wMjbYWa6XY32b6HIlP
 cY7RhvpRn47jl6esJfNl56cBuPTubO5a1Ua61SZB1Ot3tZ9GWwLxjZnN0ZkOl/OfpZEK
 8VIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RwL1rJ5KL9k+WTfJJIAW4IgTQx13D4eDeTQ78l9u0i4=;
 b=FV+pRvlmFq3cu/iwsss9WGccR1eLpjE0g71Svlbu80n/AAhqEHDW1X4Ejx55g3ts6g
 u90UI3UhbQd6KIUVr6lV2rFNQyaIkFlLuARg1x6VzXoqXZZPnNnE0GP5VMMGK5uVFlFm
 AjvfQLSDy9SWGXn0r4OwgZsGEm3c9dOmZP/trDMVQdDCymRNrdUx7JTYMXZzQ+6GDU1e
 Lg1pmk0F2sFcs+iEU6ezRxKV2Cso/N2XUYhpYRIvdgySNeGIAogfnE4PlQ3r2gC6PFnY
 ueThyIJzqCKhWNT3a+DslKgiuCPBaHWazYaaQD6PX6vTuFPgaxnTDtZ+eBsyXQ3FTcfx
 43QQ==
X-Gm-Message-State: AOAM531KUWBK0eCsoA9JKR/9rdbQ9ur7iuHmd6LHgcfpzgWuYEVxF7uX
 ekex0VP6GTNhQPRW09v6bNshJg==
X-Google-Smtp-Source: ABdhPJx0BMpz1p6ercxTAeOFQHOax0zinxrDfKo9mp+5PW4VpCj95pjicoL9aVmUYfpvUIAGahiPoQ==
X-Received: by 2002:a17:90b:3593:: with SMTP id
 mm19mr12592592pjb.28.1622747071050; 
 Thu, 03 Jun 2021 12:04:31 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 q31sm3147194pgm.36.2021.06.03.12.04.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 12:04:30 -0700 (PDT)
Subject: Re: [RFC PATCH] accel/tcg: change default codegen buffer size for
 i386-softmmu
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210525164541.17985-1-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <76648788-26c3-f957-ac39-eee1600e57f7@linaro.org>
Date: Thu, 3 Jun 2021 12:04:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210525164541.17985-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.603,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 1896298@bugs.launchpad.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/25/21 9:45 AM, Alex Bennée wrote:
> There are two justifications for making this change. The first is that
> i386 emulation is typically for smaller machines where having a 1gb of
> generated code is overkill for basic emulation. The second is the
> propensity of self-modifying code (c.f. Doom/edit) utilised on i386
> systems can trigger a rapid growth in invalidated and re-translated
> buffers. This is seen in bug #283. Execution is still inefficient but
> at least the host memory isn't so aggressively used up.
> 
> That said it's still really just a sticking plaster for user
> convenience.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: 1896298@bugs.launchpad.net
> ---
>   accel/tcg/translate-all.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
> index 640ff6e3e7..f442165674 100644
> --- a/accel/tcg/translate-all.c
> +++ b/accel/tcg/translate-all.c
> @@ -951,9 +951,13 @@ static void page_lock_pair(PageDesc **ret_p1, tb_page_addr_t phys1,
>    * Users running large scale system emulation may want to tweak their
>    * runtime setup via the tb-size control on the command line.
>    */
> +#ifdef TARGET_I386
> +#define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (32 * MiB)
> +#else
>   #define DEFAULT_CODE_GEN_BUFFER_SIZE_1 (1 * GiB)
>   #endif
>   #endif
> +#endif
>   
>   #define DEFAULT_CODE_GEN_BUFFER_SIZE \
>     (DEFAULT_CODE_GEN_BUFFER_SIZE_1 < MAX_CODE_GEN_BUFFER_SIZE \
> 

I'm not thrilled, as it is ultra-hacky.

(1) I've got a re-org of this code out for review: 
https://patchew.org/QEMU/20210502231844.1977630-1-richard.henderson@linaro.org/

(2) I'm keen to reorg TCG such that it gets compiled once.  There's currently 
nothing standing in the way of that except work.  But this would introduce a 
use of a target-specific define for the first time into tcg/.  I guess I could 
leave the default sizing back in accel/tcg/ and pass in the default.

Other options?


r~

