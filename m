Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08E203E8747
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Aug 2021 02:36:05 +0200 (CEST)
Received: from localhost ([::1]:57112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDcE0-0005Be-2Y
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 20:36:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDcD7-0003nn-B9
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:35:09 -0400
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:46863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mDcD4-0002W9-Q5
 for qemu-devel@nongnu.org; Tue, 10 Aug 2021 20:35:09 -0400
Received: by mail-pj1-x102f.google.com with SMTP id
 w13-20020a17090aea0db029017897a5f7bcso1843646pjy.5
 for <qemu-devel@nongnu.org>; Tue, 10 Aug 2021 17:35:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ebg0bqWyvqO5PySd25eXzPtEVbaGtE/qpOunKtYFSak=;
 b=HyiGTwKfqgzL8tzlfIFPzHbQSDkfD3PqyJOLomEe6EZA613TSRUtMlNhKm4I+xmFs7
 fFhHiAc3bhN+FyJQYQ8VYSP+pyHzHCdc+xYgSzl2eWkXeNMgamKmO/SGn/Smn8cNaKKw
 jTi40tzdL6bQF0LdN3L++w13YS0etcrh6dNLfjA9VA9d0kW27xANpsn7ZkgxCXWIQk+N
 tk/1ZMyY05BBaL2Ou0MK2SehNShsQarWjOupX6PxpsyRuLYavPC3vPXCb73OYyQELYGg
 j8MuHTP8ruzyYDTjQUuDp/zse/xlzDk3FqJ7iE3Iv0wzEwWBA2aRpJi4T8JmxdCO6ruP
 McEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ebg0bqWyvqO5PySd25eXzPtEVbaGtE/qpOunKtYFSak=;
 b=JZGmXCCFTmRj+79ZrldER/biFjwwW0W4axHJgRI7h4Wc8es5hmQhK6K1aygCqCYJds
 omvZyutD/tUA2gFfbpjAQYVgFR6U9r+wHqGg3M0Osqb3YYCyJpvdjDgNhRYSz4pu6IML
 WN0YNYrCqyb4zIm33NubuuzoMuXOyZHEu+S3E7TFo7ySyBvQ6wCw+MVT9Oe0fmvhYDTX
 sh9DOUvD6wwjSD0rOfTDwwpvmCQSC8795wrDOtEh21KhxLlTAcWmGcs0j9alG4fr4Epi
 HcSqEhIaSiNwXWq8LrxVDC9rJRuvbbkgmrOKot1nN6XQRZrI4xEe+AsnSt0Jom76PUK4
 44wA==
X-Gm-Message-State: AOAM533RHRsSKQHfrgkx+6gYZWSE1+ynfqzDyXCZF6+Kk11DpRIxrxCR
 wXbHJqXr+1W9yKNvl140OyYUQg==
X-Google-Smtp-Source: ABdhPJz3w5Wz+oi8RSJU5cpn4NwilGCftQJpTUJBYA0Zi6XFG7C9hzxLeWFHHI2YuNCv7rVfi4NAag==
X-Received: by 2002:a65:5c89:: with SMTP id a9mr40796pgt.433.1628642105078;
 Tue, 10 Aug 2021 17:35:05 -0700 (PDT)
Received: from [192.168.6.169] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id d14sm4478845pjc.0.2021.08.10.17.35.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Aug 2021 17:35:01 -0700 (PDT)
Subject: Re: [PATCH 08/19] target/ppc/pmu_book3s_helper.c: do an actual cycles
 calculation
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210809131057.1694145-1-danielhb413@gmail.com>
 <20210809131057.1694145-9-danielhb413@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d6f2a3d0-371f-f603-38b3-ef2c8203dba7@linaro.org>
Date: Tue, 10 Aug 2021 14:34:57 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210809131057.1694145-9-danielhb413@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: clg@kaod.org, david@gibson.dropbear.id.au, qemu-ppc@nongnu.org,
 gustavo.romero@linaro.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 3:10 AM, Daniel Henrique Barboza wrote:
> +/*
> + * Set arbitrarily based on clock-frequency values used in PNV
> + * and SPAPR code.
> + */
> +#define PPC_CPU_FREQ 1000000000
>   
>   static uint64_t get_cycles(uint64_t icount_delta)
>   {
> -    /* Placeholder value */
> -    return icount_delta * 4;
> +    return muldiv64(icount_to_ns(icount_delta), PPC_CPU_FREQ,
> +                    NANOSECONDS_PER_SECOND);

So, unless you're going to do something real, you might as well just return icount_to_ns, 
and skip all of the no-op scaling.


r~

