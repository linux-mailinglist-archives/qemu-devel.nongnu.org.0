Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21D5035754A
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 21:57:42 +0200 (CEST)
Received: from localhost ([::1]:38806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUEJ3-0005xa-7u
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 15:57:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUEHn-0005Wq-Dn
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 15:56:23 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:43987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lUEHl-0005vm-00
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 15:56:22 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 x21-20020a17090a5315b029012c4a622e4aso75875pjh.2
 for <qemu-devel@nongnu.org>; Wed, 07 Apr 2021 12:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=JuNeZjPrq3Xh3zpIYXdRVP983710tDIvvKzIgNNMesM=;
 b=ciCjsiF6hAlGcdzuAHZeGCES/3Wh+RQJqyDCB4sUUpaB0IczQmK1E736ywIwPymGd0
 mP16XoLgrIGrviwKop3gn/E/Pner86tMr79bN4g2g9QQnwWcxqY073+YJrpzth6renhz
 o9YZhLczfRzV3z+oCaJ81zoWHC3E4NPN8xO9XLbNSrbdjWIYY1Fqp6jX8+zlkkSNsx5m
 wzmJaeiM4FCrQVd2zWEzccNzE7HiojxIvhHgc4zq50D7BxkKL+eqbHUO+EIfpXvQq0CH
 Iprm9mHK+oqo+V0+gRPnPrrfQU3YP7N+/eU3OsYtJL4lFasfuktWEWjaW6GChgvuXSJS
 3tGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JuNeZjPrq3Xh3zpIYXdRVP983710tDIvvKzIgNNMesM=;
 b=Uq8OSBd/9vc+CWGYGPDE/S2CjmuE0dadqXVqU6tANodwtdnWJQNcLsCxu/hPQg9LwT
 5kUu2JuZKLkBw5QtkhzcMlAjcjG/hgedVTd2ahITaYrAWglRkucLMs399PwKAyVFTm/8
 i11xBw71GKRRa6Llry42yJvBMqWhwbMo8+Fv4qiPpSrjvbbSXOOh/nB9OdeYZwuFrleo
 IehZPbewR4/Yf/knhu/eSWQItiQ9kqZyglli9pOV8Y11GeyAw8cGubmVrykivSVCcmVQ
 0u53QgIo4iq0kEOkBk3Ew30mnAjmuE2DPo+NJa8gtjxI0M9xFTfNpq8b0ViQYsDRP7Du
 o7tA==
X-Gm-Message-State: AOAM530eLfF36Eoua4kmUBBi6sJIdbvrPXNObIvScO+TUUgP1VdPFabw
 qNkHwwPEfP8nxR80hkHBTqFWJQ==
X-Google-Smtp-Source: ABdhPJxqxE0Ej/11FHaf+F4rFGwlRpSDOg1vRUm0bJOIfYcvl2WTbg+yyOqRwnnWQMJ4IYsN1MyKUw==
X-Received: by 2002:a17:902:6b02:b029:e9:8e2:d107 with SMTP id
 o2-20020a1709026b02b02900e908e2d107mr4408126plk.61.1617825379496; 
 Wed, 07 Apr 2021 12:56:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.131.83])
 by smtp.gmail.com with ESMTPSA id c9sm20725420pfl.169.2021.04.07.12.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 07 Apr 2021 12:56:18 -0700 (PDT)
Subject: Re: [PATCH v4 03/12] target/arm: Fix mte_checkN
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210406174031.64299-1-richard.henderson@linaro.org>
 <20210406174031.64299-4-richard.henderson@linaro.org>
 <877dleuds3.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ade8e2d3-e1a6-3b84-7850-ceb4bcd59758@linaro.org>
Date: Wed, 7 Apr 2021 12:56:17 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <877dleuds3.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
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
Cc: 1921948@bugs.launchpad.net, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/7/21 11:39 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> We were incorrectly assuming that only the first byte of an MTE access
>> is checked against the tags.  But per the ARM, unaligned accesses are
>> pre-decomposed into single-byte accesses.  So by the time we reach the
>> actual MTE check in the ARM pseudocode, all accesses are aligned.
>>
>> Therefore, the first failure is always either the first byte of the
>> access, or the first byte of the granule.
>>
>> In addition, some of the arithmetic is off for last-first -> count.
>> This does not become directly visible until a later patch that passes
>> single bytes into this function, so ptr == ptr_last.
>>
>> Buglink: https://bugs.launchpad.net/bugs/1921948
> 
> Minor note: you can Cc: Bug 1921948 <1921948@bugs.launchpad.net> to
> automatically copy patches to the appropriate bugs which is useful if
> you don't have the Cc for the reporter.
> 
> Anyway I'm trying to get the kasas unit tests running as a way of
> testing this (and maybe expanding with a version of Andrey's test). I
> suspect this may be a PEBCAC issue but I built an MTE enabled kernel
> with:
> 
>    CONFIG_HAVE_ARCH_KASAN=y
>    CONFIG_HAVE_ARCH_KASAN_SW_TAGS=y
>    CONFIG_HAVE_ARCH_KASAN_HW_TAGS=y
>    CONFIG_CC_HAS_KASAN_GENERIC=y
>    CONFIG_KASAN=y
>    # CONFIG_KASAN_GENERIC is not set
>    CONFIG_KASAN_HW_TAGS=y
>    CONFIG_KASAN_STACK=1
>    CONFIG_KASAN_KUNIT_TEST=m
>    CONFIG_TEST_KASAN_MODULE=m

I built it all in:

CONFIG_HAVE_ARCH_KASAN=y
CONFIG_HAVE_ARCH_KASAN_SW_TAGS=y
CONFIG_HAVE_ARCH_KASAN_HW_TAGS=y
CONFIG_CC_HAS_KASAN_GENERIC=y
CONFIG_KASAN=y
# CONFIG_KASAN_GENERIC is not set
CONFIG_KASAN_HW_TAGS=y
CONFIG_KASAN_KUNIT_TEST=y

Then I just boot the raw kernel (no filesystem or anything):

./qemu-system-aarch64 -M virt,mte=on -cpu max -nographic \
   -kernel ~/linux/bld-aa/arch/arm64/boot/Image

There's a ton of output, but at the end I see

[   11.901185]     ok 48 - match_all_mem_tag
[   11.901422] ok 1 - kasan

just before the "VFS: Cannot open root device" panic.
Which has done all we wanted, so, yay.


r~

