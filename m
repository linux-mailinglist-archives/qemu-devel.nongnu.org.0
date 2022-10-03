Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF795F31BB
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 16:06:25 +0200 (CEST)
Received: from localhost ([::1]:47786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofM5P-0002Np-RH
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 10:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofLtj-00086o-H6
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:54:20 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:43661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ofLth-0003dy-Tj
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:54:19 -0400
Received: by mail-oi1-x22a.google.com with SMTP id u68so1146020oie.10
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=428VcGZAJuQ6tq2/peNVLDO3GlmmfYHfyZaiY5YdnBo=;
 b=CbI6sivV7v0PqDYE09pcuY08NkwAN/2Ibgb3pdwfZg/R+TKA9eZCbBeJqLFVa3W0rK
 PWM9KXGxBrRTkRvGsvH60JubBjy/Y00xxSRaGTLlA8VOEbpZ/S6t7s0zGsoeQcLOs/sJ
 kPjnkmvCO/qQqrZf1T6misJ/Fc49hLGqnMixWSfVUSAVV8PmbZTw6OmVRcxXR+lyeIRs
 eVj1mfiqVkBSJqDM1qngd/xa5omxSndVVOT0epjBOCIHrIbwrh/Idovb2gOGZYqNJNkr
 AYF90cvN6W+v0O5O/TSQqfYuUOB7Tf7H+gf7TR1zjIN47RHnjHqVe2/Zzy2jWoFtiDEv
 xlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=428VcGZAJuQ6tq2/peNVLDO3GlmmfYHfyZaiY5YdnBo=;
 b=maIJnob/35R4iufHRK5gAFBNsC2VGYmJ7blKQu8D5E1htd0CZr6HpIUl6bvBKXGgiQ
 J5xrYWGQP4985zmBKdP3fsOHRhWrV74h75KmSc77sVjumDUqR7B6pRMQDJbgf27jb3e2
 x+XFotzL3vh/r1l/sHOJg4/drvIkQUm1rT8SUUlXFovV76nS/JzbupmMJynXSYCL+lry
 OeF8Gfn4j8lurUi+b+RwemEWGnSIym94pA4nQdeYn/ghiZAPHOyVW4a5cVXpeE00C9Sg
 8Bcl9gULIfqwQzBhrf8E+DppFItgGFqP7tRQ9bf13xdksQE34LYDba6EKs8CjzjSX0Ig
 fg6g==
X-Gm-Message-State: ACrzQf0KnW/d+YyT1U9J6aK7cd/oDMtTjZVFTKx8yDxfnQT9ausKmVBx
 tmSp1CdvEDcgAwkUfjT00vAqrQ==
X-Google-Smtp-Source: AMsMyM6s0JVkTX3xHE2J5ITG4kwWUSEfUbPQYc4gj4qiy77Uh9uitA4PU2hRSBGccnZqf7hypM/aQw==
X-Received: by 2002:a05:6808:1a09:b0:350:1e6a:e469 with SMTP id
 bk9-20020a0568081a0900b003501e6ae469mr3962412oib.92.1664805256536; 
 Mon, 03 Oct 2022 06:54:16 -0700 (PDT)
Received: from ?IPV6:2605:ef80:80e3:6069:e8b1:115d:14a3:4a1d?
 ([2605:ef80:80e3:6069:e8b1:115d:14a3:4a1d])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a056870249600b0012752d3212fsm2919263oaq.53.2022.10.03.06.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 06:54:15 -0700 (PDT)
Message-ID: <cab82ec5-88c4-1624-8fff-a9f45a282470@linaro.org>
Date: Mon, 3 Oct 2022 06:54:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v6 13/18] accel/tcg: Do not align tb->page_addr[0]
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: peter.maydell@linux.org, alex.bennee@linux.org, qemu-devel@nongnu.org
References: <20220930212622.108363-1-richard.henderson@linaro.org>
 <20220930212622.108363-14-richard.henderson@linaro.org>
 <87fsg5nkap.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87fsg5nkap.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.467,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/3/22 05:47, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Let tb->page_addr[0] contain the offset within the page of the
>> start of the translation block.  We need to recover this value
>> anyway at various points, and it is easier to discard the page
>> offset when it's not needed, which happens naturally via the
>> existing find_page shift.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/cpu-exec.c      | 16 ++++++++--------
>>   accel/tcg/cputlb.c        |  3 ++-
>>   accel/tcg/translate-all.c |  9 +++++----
>>   3 files changed, 15 insertions(+), 13 deletions(-)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 5f43b9769a..dd58a144a8 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -174,7 +174,7 @@ struct tb_desc {
>>       target_ulong pc;
>>       target_ulong cs_base;
>>       CPUArchState *env;
>> -    tb_page_addr_t phys_page1;
>> +    tb_page_addr_t page_addr0;
> 
> We don't actually document that this is an offset here (or indeed in
> TranslationBlock) and the definition of tb_page_addr_t:
> 
>    /* Page tracking code uses ram addresses in system mode, and virtual
>       addresses in userspace mode.  Define tb_page_addr_t to be an appropriate
>       type.  */
>    #if defined(CONFIG_USER_ONLY)
>    typedef abi_ulong tb_page_addr_t;
>    #define TB_PAGE_ADDR_FMT TARGET_ABI_FMT_lx
>    #else
>    typedef ram_addr_t tb_page_addr_t;
>    #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
>    #endif
> 
> implies these are full size pointers into the guests address space.

And that's what I've got.  What we we were storing in phys_page1 before was a full size 
pointer that was page aligned.  I'm now dropping the page alignment and having a full size 
pointer to the exact first byte of the translated code.

Is that clearer?  How would you improve the wording?


r~

> Either we need a new type (tb_page_offset_t) or to properly comment the
> structures with what they mean.
> 
> Otherwise:
> 
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> 


