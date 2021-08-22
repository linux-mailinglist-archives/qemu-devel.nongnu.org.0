Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 443293F40A1
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 19:11:11 +0200 (CEST)
Received: from localhost ([::1]:36106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHqzr-00006B-K2
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 13:10:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHqyH-00075z-PM
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 13:09:21 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:45762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mHqyF-0005UI-FL
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 13:09:21 -0400
Received: by mail-pf1-x433.google.com with SMTP id t42so10722570pfg.12
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 10:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R6NNm/QbqPkXF00Eekly10yU+HErgPSOPYrvygRlwM4=;
 b=yI3dUKQXJkk0xOT8KjaGWa8sV7I67YYYCfgo5UD3r9OmUIPAIIvc7r5q/USzxrq+ue
 PIghs9LAybUAHMluDg97rTXzWwDk4BycRdoiTosbtDnYaX7AZaMbe1495QsGwCCp5JPg
 Q/h4xKEb8oRb2d+XJ0o4M0El5ITxPN2dzUWvYUdmbOf9S22CJpfBh/iVXzAlnWYtADrH
 Rq3W5DvSgvXwjfT8R0rXNBV3gUKQBVp5hqx7z3zDKGDqOTzNQ5Mar+X21fJUIXPmgiO3
 cQAtxXBxq7acSzhRM3DXWIMwAi94rFsq2D1Ao+tgasBvWK1W0fjRp02/SdrtpF7Q2ZWg
 AEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R6NNm/QbqPkXF00Eekly10yU+HErgPSOPYrvygRlwM4=;
 b=No04vB5BEItJjFjForsU5qtm/YetUejkqCLPenHNRqe79tbbmhwa6eosxTrL3snQWR
 wZz9iUoBR7Nu+fxX9j2NPVEUQcLKVF3N4GBonaJ1sjOTgzsVYsQtpvRZMtCiLNozbj8t
 odRUXMrbJAgj7IX7FB8hCo925si/QOwT/d8K98FjjCrZRH0ozqZlWMhE0pp/bled46k+
 /tT1LFkgyX8aPykbh/bhrME+MEcPa8uwGg/czqf4fFMdlgeJydmJBlG7a3nRWarixvrS
 6lv8u/sZIF5hpxqDqNb8o0f4OQqliWJK1fR+NFh6Kd3KxRJ7BrcLEOAZWk+kxgeAcRGp
 pphQ==
X-Gm-Message-State: AOAM533kSJ8f5hTelQAJQRh8ylvdtgP0yhz0P+MbMSSxGVeG2210isQc
 YBmzDNumc44a6GRMfPre9oVV09EdYPLTYg==
X-Google-Smtp-Source: ABdhPJyeUjwnz3x/61Dp+uZpiwrgtMpJHYUSgD5lqZKcwjVgalGBoauKgx8akJ7cQGvV8pSWzb+Emw==
X-Received: by 2002:a63:ec06:: with SMTP id j6mr25213640pgh.259.1629652157522; 
 Sun, 22 Aug 2021 10:09:17 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id v15sm13173900pff.105.2021.08.22.10.09.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 10:09:17 -0700 (PDT)
Subject: Re: [PATCH v3 63/66] tcg/tci: Support raising sigbus for user-only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-64-richard.henderson@linaro.org>
 <CAFEAcA9Ze3zzQ_O1rRJKaP-681RDJf288uQJx83GEduHetAegQ@mail.gmail.com>
 <490decb4-1cb1-b1b4-8d4b-a72de60d51b7@linaro.org>
 <CAFEAcA8x5XpNVgcPQ9rEhAvZz+7h34tmt32aM8MYC_oRRNVA6g@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2a583e90-5dd5-d450-f51f-6a42e8de9896@linaro.org>
Date: Sun, 22 Aug 2021 10:09:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8x5XpNVgcPQ9rEhAvZz+7h34tmt32aM8MYC_oRRNVA6g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x433.google.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.959,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/22/21 5:32 AM, Peter Maydell wrote:
> On Sun, 22 Aug 2021 at 08:59, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> On 8/20/21 3:14 AM, Peter Maydell wrote:
>>>> @@ -377,11 +381,11 @@ static uint64_t tci_qemu_ld(CPUArchState *env, target_ulong taddr,
>>>>    static void tci_qemu_st(CPUArchState *env, target_ulong taddr, uint64_t val,
>>>>                            MemOpIdx oi, const void *tb_ptr)
>>>>    {
>>>> -    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
>>>> +    MemOp mop = get_memop(oi);
>>>>        uintptr_t ra = (uintptr_t)tb_ptr;
>>>
>>> Don't you need this bit in tci_qemu_st() as well ?
>>
>> Which bit isn't present in st as well?
>> There's missing hunks in your reply, but afaics they're the same.
> 
> https://patchew.org/QEMU/20210818191920.390759-1-richard.henderson@linaro.org/20210818191920.390759-64-richard.henderson@linaro.org/
> 
> I had the function name wrong, but only the tci_qemu_st() change
> has this bit:
> 
> -    MemOp mop = get_memop(oi) & (MO_BSWAP | MO_SSIZE);
> +    MemOp mop = get_memop(oi);

Ah yes, thanks.

r~


