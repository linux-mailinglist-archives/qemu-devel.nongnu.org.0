Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2EEE696EB3
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 21:54:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pS2IU-0004Cw-Kk; Tue, 14 Feb 2023 15:53:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2IP-0004Cf-Sk
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 15:53:01 -0500
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pS2IN-0006GN-Nz
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 15:53:01 -0500
Received: by mail-pg1-x535.google.com with SMTP id e1so6289514pgg.9
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 12:52:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vQ58P/JEMaCT8Ubk65n4rx33xJyTlAK6x7bmJlEHpEI=;
 b=L9NPG9UbTzM0C/P3uQTctNpemdD2lYUHqesgrkErZBMHD2NF7y4WMKdukqLwKcK1B7
 DNOhha3DOV0OdW8mklHW2wdwtmCfJ9tHcEa3WfffelEhj+8swm9NVO3+fkwZPdhNuLah
 3pXq4Db5DaTIOGKutuurvpwrPT4dX0WqeKsrXO7i7Y3GKgG9MSK4GxOosna6dR4SvlTx
 FOWbe4ZBa8GlUFdQFfJe68IQJa07PD+Uwdu9hu7sMLotHKMq+6vpx45fFEX2l1F6C35N
 taHHIpMUREGRk6mm/ommsJo+C6wB+UBw874zlHsVIG3M1E3102S0wMcG/2LVbd3bbKg7
 D4gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vQ58P/JEMaCT8Ubk65n4rx33xJyTlAK6x7bmJlEHpEI=;
 b=vrK+7+4p7OLlCrRrSz7KUoB66Ak/VV6CiOuw4/9RWUgj7+YM43fH93rw5VwxOWaqjt
 yxkP/GvmLTWHnnyfPHIUhRSyAoU3SYX1Rx51ZT6NldsFtnVW0E3BzQ/9B+8OsMxI6NvC
 hAclBeyantTtjYaeCdBgk27Zo+X4mf6KY27HutQJiyrCatljZ9MyXiQIZK2/negzGUak
 viUVyk5kA5V7H0348Dtum0rCYKSDuBfPy6FOZALsGTvDCNnKhB4A87kRe8T19gsi+UD/
 uciigAlv2TEM7tyeKypjDkYzBnT8C39y4jO1WF5sNUbL4tnw41S+xgsFq49OE0s1O3Oj
 te8w==
X-Gm-Message-State: AO0yUKXbwE+qqGIkeN32ZDwQvUdlE6TzECQxGTpHuOBOf0T0Vm1nKjzw
 ob2Q8/1XNPqkZT3HzpxqnYYc4w==
X-Google-Smtp-Source: AK7set+VDCBsC7jWMJI+vv20LVysTWTiRX0kFCXcQ6FjZsRp40Br75bI3m7TP/2qzPAlUpbhtprR6w==
X-Received: by 2002:a62:1d57:0:b0:5a8:bbde:a074 with SMTP id
 d84-20020a621d57000000b005a8bbdea074mr3021133pfd.12.1676407977532; 
 Tue, 14 Feb 2023 12:52:57 -0800 (PST)
Received: from [192.168.192.227] (rrcs-74-87-59-234.west.biz.rr.com.
 [74.87.59.234]) by smtp.gmail.com with ESMTPSA id
 e24-20020a62aa18000000b0058bc60dd98dsm1068599pff.23.2023.02.14.12.52.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Feb 2023 12:52:56 -0800 (PST)
Message-ID: <a36ae3a6-50fa-d969-e9b2-6fe1ff9db9e1@linaro.org>
Date: Tue, 14 Feb 2023 10:52:49 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 04/12] bsd-user: various helper routines for sysctl
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, kevans@freebsd.org, f4bug@amsat.org,
 Thomas Huth <thuth@redhat.com>
References: <20230214002757.99240-1-imp@bsdimp.com>
 <20230214002757.99240-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230214002757.99240-5-imp@bsdimp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x535.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.35,
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

On 2/13/23 14:27, Warner Losh wrote:
> +#ifdef TARGET_ABI32
> +/*
> + * Limit the amount of available memory to be most of the 32-bit address
> + * space. 0x100c000 was arrived at through trial and error as a good
> + * definition of 'most'.
> + */
> +static const abi_ulong target_max_mem = UINT32_MAX - 0x100c000 + 1;
> +
> +static abi_ulong G_GNUC_UNUSED cap_memory(uint64_t mem)
> +{
> +    if (((unsigned long)target_max_mem) < mem) {
> +        mem = target_max_mem;
> +    }
> +
> +    return mem;
> +}
> +#endif

Identity function for ABI64?

> +static unsigned long host_page_size;
> +
> +static abi_ulong G_GNUC_UNUSED scale_to_target_pages(uint64_t pages)
> +{
> +    if (host_page_size == 0) {
> +        host_page_size = getpagesize();
> +    }

qemu_real_host_page_size()


> +
> +    pages = muldiv64(pages, host_page_size, TARGET_PAGE_SIZE);
> +#ifdef TARGET_ABI32
> +    abi_ulong maxpages = target_max_mem / (abi_ulong)TARGET_PAGE_SIZE;
> +
> +    if (((unsigned long)maxpages) < pages) {
> +        pages = maxpages;
> +    }
> +#endif

No need for either cast.  Just use MIN().

> +#ifdef TARGET_ABI32
> +static abi_long G_GNUC_UNUSED h2t_long_sat(long l)

h2g.

> +{
> +    if (l > INT32_MAX) {
> +        l = INT32_MAX;
> +    } else if (l < INT32_MIN) {
> +        l = INT32_MIN;
> +    }
> +    return l;
> +}
> +
> +static abi_ulong G_GNUC_UNUSED h2t_ulong_sat(u_long ul)
> +{
> +    if (ul > UINT32_MAX) {
> +        ul = UINT32_MAX;
> +    }
> +    return ul;
> +}
> +#endif

Anyway, identity functions for ABI64?


r~

