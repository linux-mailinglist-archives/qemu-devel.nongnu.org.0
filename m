Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F9F44A832
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 09:12:39 +0100 (CET)
Received: from localhost ([::1]:50564 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkMFD-0008NE-3r
	for lists+qemu-devel@lfdr.de; Tue, 09 Nov 2021 03:12:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkMEG-0007cy-Fe
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:11:40 -0500
Received: from [2a00:1450:4864:20::42b] (port=36529
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mkMEE-0003ft-Tc
 for qemu-devel@nongnu.org; Tue, 09 Nov 2021 03:11:40 -0500
Received: by mail-wr1-x42b.google.com with SMTP id s13so31498580wrb.3
 for <qemu-devel@nongnu.org>; Tue, 09 Nov 2021 00:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=0FubAA+wOrZ0I6zl4fQ4prSrIci6ZL5dQ4a6nuto7dI=;
 b=XJ/uN4StSepnhHc7l3Ine0yT5SjKRL1yOLQ2FVtAGl9FGrVKYm9QvG4sHSy+md3cEE
 2m+W2YwIb9E5uEVxRLU5A3HjrZLe9co4lckCdqRe6eqH9HhkRPk//5PsrB2zl4cEJXS7
 tRkubxsve7kB4hs+Agc0hlVYvphKsCU9IG7p2mhjPLLEFM9zX0vegU+SwWAhb7yR4JH9
 ayI2yISu85PWZgN9Uo8Eg0bQnfY0dsrk3hsFHMmJchMCnZ2hFGoXOHFqUMZLWOdwrs5f
 3Alc/ZQJcPl9Xq01ba401rctOR6owjeS0U87v9EoC1XD9yWlBqOWSqyjZCjjAwAHxEaD
 KRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0FubAA+wOrZ0I6zl4fQ4prSrIci6ZL5dQ4a6nuto7dI=;
 b=3IUFFlLXgPR+qFUK6GXU07R6OpRikxcqTv/Ze7/EwlfmiH+x4nIQgfCQZ5iK9tx8md
 5b/Wr3cEK1oAeiUGM5UuSE83Ku5Zw65f7aEBlBNAgTxlL+8RLJAhhTYBrhbNzMCzC63b
 SpQpnjsy4T8XyHNdm2EBrEiURcuCq6C7+eUHpGd7EF4cPQ+tnMN1QXtHvijCek1JPJqI
 yhSbZnvjJmEKejRKgrdvnpd/1R6+NjLfnQjVViThd+4FGgOciNVC8ApKcJovuZmXJfWb
 qLSS5UrljBIF1iuVUIRduJg0pyrmzMJGVtv27zqOtDTK0yCuOUJWWG69z7rZqYKajqju
 cLng==
X-Gm-Message-State: AOAM531jazaBdnuPY4GAGRFJ1SgJgUIZDfeVTpawDCfPNOqyQonxwzUk
 6nreWRiaioLoAttLcN3Bco03hg==
X-Google-Smtp-Source: ABdhPJwJqC9sR20rllm2919IHW6y9QP93CC3/G5lakY5DX0vPU/49ZZsh0xvLID7LaPcZxfnANzBPA==
X-Received: by 2002:adf:fe8b:: with SMTP id l11mr6793320wrr.228.1636445497351; 
 Tue, 09 Nov 2021 00:11:37 -0800 (PST)
Received: from [192.168.8.106] (169.red-37-158-143.dynamicip.rima-tde.net.
 [37.158.143.169])
 by smtp.gmail.com with ESMTPSA id o63sm1879625wme.2.2021.11.09.00.11.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 00:11:36 -0800 (PST)
Subject: Re: [RFC 4/4] common-user: Allow return codes to be adjusted after
 sytsem call
To: Warner Losh <imp@bsdimp.com>
References: <20211108023738.42125-1-imp@bsdimp.com>
 <20211108023738.42125-5-imp@bsdimp.com>
 <0511aedf-1ecd-666d-034f-55d50306e115@linaro.org>
 <CANCZdfohHLKjstby1t3vA3u=MU2qdt_FXNTSpWyUPbbyd2p5aw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <22fa61a3-c8ba-e0fe-36b8-86ba1c90ca84@linaro.org>
Date: Tue, 9 Nov 2021 09:11:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CANCZdfohHLKjstby1t3vA3u=MU2qdt_FXNTSpWyUPbbyd2p5aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.364,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Philippe Mathieu-Daude <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/8/21 7:49 PM, Warner Losh wrote:
>      >       /* code path for having successfully executed the syscall */
>      > +     ADJUST_SYSCALL_RETCODE
>      >       ret
>      >
>      >   0:
> 
>     Not sure about this, really.  Is it really that much cleaner to insert this than create
>     separate 10-line files, with the adjustment included?
...
> The adjustments have all been 3 lines (gmail seems to hate my formatting):
> 
> +#define        ADJUST_SYSCALL_RETCODE \
> +    jnb 2f;                    \
> +    neg %rax;                  \
> +    2:
> 
> which is significantly easier to maintain than having to monitor these files for changes 
> and copying over the changes that happen.
...
> The other alternative I considered was having a #ifdef __FreeBSD__ .. #endif in all those 
> files, but I thought that even more intrusive.

Actually, the ifdef sounds surprisingly attractive to me.  Is it ENOCOFFEE?

What I find awkward about ADJUST_SYSCALL_RETCODE is that when you're looking at the 
definition, you have no reference to the context, and vice versa.  Not that it can't be 
worked out, but it seems like the same amount of code either way, and clearer when it's 
together.

We've already split the host cpu apart, which is the major point of ifdeffery, so it 
doesn't seem like we'll wind up with a large amount of ifdefs here; we're not likely to 
see mynewos-user wanting to share this code any time soon.

I feel sufficiently fuzzy on this to solicit other opinions though.


r~

