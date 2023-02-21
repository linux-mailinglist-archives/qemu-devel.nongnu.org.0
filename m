Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAAAD69EB61
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 00:44:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUcIj-0000KX-8I; Tue, 21 Feb 2023 18:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcId-0000Ji-BP
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:43:55 -0500
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUcIb-0005oj-Gf
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 18:43:54 -0500
Received: by mail-pl1-x642.google.com with SMTP id u14so2952000ple.7
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 15:43:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=IuN12f9/mLvuLN7FQOktMN7t1KRqgP86Ss2bCjRX4PA=;
 b=MSVrqBN4F4KviW2X+dMeimEhS+yrYUZ9ijJF1R+6ThVWODHYYIH7VhVujVHGaqqp8x
 2q8ijrIU0x4qnhz4iQX68qcM7fr0GZjk508q5YVS8YdRqBY7Xq/u1vga92C4Dp4g4DYu
 g5di9bKP8oa2+XOZIFkeGl8fUgXN+yJme2tWciB2prQ6AEie48F/TNH163OrW9Ht3lFc
 XrEAcFkWnEigmGfWh6uW49LkNBE9OrnzOZx5weaNj2sSnII6NSSylqvdLSbBNaBlDrd2
 i7K0W/hK0NYMxNfMTpultGWhUauxW7Dk7RSJ95SkIb24voqQ5rvbnITrg3p9h0GD1Ndg
 XzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IuN12f9/mLvuLN7FQOktMN7t1KRqgP86Ss2bCjRX4PA=;
 b=UEJ2KXQ2uK6WyojXcTirYqrJJAAAr6b67S6RivjWcekDIFPbvZ5WWbrrToSFc0yOpW
 WZcm5CSMMJjhwfdK6EZVPhPT0TBQ50uIJVl1jF/bW56EV0C4fOB7cthSFwQB9fjXVr0a
 o7Sc/fk6W5UGsm5si9TbCpWRx/ebquUWzlR/79HlBdvBjRbZ4UIZEwceqY32v8idDLQ7
 Kf6oHMjZshBducdhoS0dzLLQPNYz5DZSOWWNHehZoLQMZuTq0Xh+eVjlENJ4igQNGmek
 kw47FFOG06Mviikta2HlLgtGzObeUSulN03m6KCAB6SGMFKfvfRAErEhKvYIQ+LEouks
 QoQA==
X-Gm-Message-State: AO0yUKWWwXvs4/PDM0xW9XAhM6xv6uITvayw5V3EJDqfLmmuoMhh+2Ql
 GDSTVqhp9eaSxeiU844tcsl79w==
X-Google-Smtp-Source: AK7set97ZQC0i/BdcL6AJSC13wXPk1JKpm4JKhWO/uftCL5oYuU0P8m4ITI1sdiU+DvLZuFri3Yy4A==
X-Received: by 2002:a17:902:da8e:b0:19a:f02c:a058 with SMTP id
 j14-20020a170902da8e00b0019af02ca058mr8002818plx.19.1677023031775; 
 Tue, 21 Feb 2023 15:43:51 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 x17-20020a170902ea9100b0019a83f2c99bsm10473241plb.28.2023.02.21.15.43.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Feb 2023 15:43:51 -0800 (PST)
Message-ID: <88715435-b0b9-c75c-327c-7441a1fba3fb@linaro.org>
Date: Tue, 21 Feb 2023 13:43:47 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v4 4/4] target/ppc: fix warning with clang-15
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: sw@weilnetz.de, kkostiuk@redhat.com, clg@kaod.org,
 alex.bennee@linaro.org, peter.maydell@linaro.org
References: <20230221153006.20300-1-pierrick.bouvier@linaro.org>
 <20230221153006.20300-5-pierrick.bouvier@linaro.org>
 <7ddd5f42-8536-47a5-5e4b-096221460f2f@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7ddd5f42-8536-47a5-5e4b-096221460f2f@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::642;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x642.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.095,
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

On 2/21/23 12:30, Philippe Mathieu-Daudé wrote:
> On 21/2/23 16:30, Pierrick Bouvier wrote:
>> When compiling for windows-arm64 using clang-15, it reports a sometimes
>> uninitialized variable. This seems to be a false positive, as a default
>> case guards switch expressions, preventing to return an uninitialized
>> value, but clang seems unhappy with assert(0) definition.
> 
> $ git grep 'assert(0)' | wc -l
>        96
> 
> Should we mass-update and forbid 'assert(0)' adding a check in
> scripts/checkpatch.pl? Otherwise we'll keep getting similar clang
> warnings...

I just think assert(0) produces a less clean error message, so on that basis yes, we 
should replace them all.  Perhaps abort() as well, unless there's an error_report 
immediately preceding.

The fact that assert(0) was seen to fall through is a system header bug.  I see we have a 
workaround in include/qemu/osdep.h for __MINGW32__, but I guess this doesn't trigger for 
arm64?  Pierrick, would you mind testing a change there?


r~

