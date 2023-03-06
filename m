Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FE636ACDE6
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 20:21:32 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZGNe-0008Ga-OI; Mon, 06 Mar 2023 14:20:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZGNc-0008GR-QI
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:20:16 -0500
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pZGNa-0002zd-0p
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 14:20:16 -0500
Received: by mail-pg1-x529.google.com with SMTP id s18so6248153pgq.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 11:20:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678130407;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vy2X/wDobrSSt9JIvAht3xPI15OvFeu5j/URzAiXbs8=;
 b=mRxfkJmAlNu/SLYsycUOBD/3ynpdjYJj1HTTmhUX6zPEv+5xtaJDcQrSRt98afYfkY
 rpJVmxm62cjQJblxup2fqbTDAmnqx8U53BR/a1eVFecHbWlmBFKzHupO49LmhSsi+HL0
 QJ3C5Lz1EsF1SPloiSN0ScTgymQdtG6t0lLhUyjmD4U/U7fDTnCy7xBTB3JskFkHQY3D
 bxnMLLQylAsOONjDcEUA23/vmWDpzZuYMB40JNT+OT1xXb/ODpdQgmynS4E8VY4l/cd3
 +ZYA4CNv0P/bietscYR2h1vOUgBy34O3MATR5UcWlWuAI1prkavzfxFjIESdLANUbJR4
 1RuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678130407;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vy2X/wDobrSSt9JIvAht3xPI15OvFeu5j/URzAiXbs8=;
 b=z/B57MmbnKDP0GgUvMM4FRUOwKo8oaTUjnzAhcttF6omMRtxCeQ252PN5wJpapDDIS
 NzcCulkNcIWB3/fIFOsTRZ0Ir1jzBUUBvsgwbFHlXwGq3obzxAFDIi5FiMiaFooZx3lQ
 sJiOZjKGw+2mZyc11uyNiPs4XtzHJ0M9fDISDKa8si1qOhYNezkPw4Sas3IJuFDzCQHS
 I1XlGyTlqv3DSA1SXx50A1rVym5EllZMe+axjKRtH7gcZOGf9NeOxlR1mDZi8ag86a6p
 aMKbR512Ib7w23fft2OdzW8P08ahffMXP8sWvoGxk9WM5XU8xQiVPVcbktYnwQUoDQSK
 WmPA==
X-Gm-Message-State: AO0yUKU9Kf6B+arXsdJoIG48en+WHWtm5qwQxB6Smi2w1720xNzhJ4aT
 Byv3RLciFQY76T5qrdKARyzlCA==
X-Google-Smtp-Source: AK7set99vVmv1YkdV/anLPs4TeaGxQovSOIYy6/NoeVpf8dLBgTVsLVWDdvobrnPVS8R1h9Jw9KY6w==
X-Received: by 2002:a62:1d13:0:b0:590:7330:353c with SMTP id
 d19-20020a621d13000000b005907330353cmr12353365pfd.6.1678130407607; 
 Mon, 06 Mar 2023 11:20:07 -0800 (PST)
Received: from ?IPV6:2602:ae:154a:9f01:7632:29c7:3cce:bec3?
 ([2602:ae:154a:9f01:7632:29c7:3cce:bec3])
 by smtp.gmail.com with ESMTPSA id
 n4-20020a62e504000000b005a79596c795sm6620996pff.29.2023.03.06.11.20.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 11:20:07 -0800 (PST)
Message-ID: <17eeac43-a5ac-c90a-f8ab-cbd8d65b6539@linaro.org>
Date: Mon, 6 Mar 2023 11:20:05 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 03/70] target/arm: Improve arm_rmode_to_sf
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
References: <20230227054233.390271-1-richard.henderson@linaro.org>
 <20230227054233.390271-4-richard.henderson@linaro.org>
 <7b1fa1fa-5e00-90eb-29dd-413448167456@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <7b1fa1fa-5e00-90eb-29dd-413448167456@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 3/6/23 06:00, Philippe Mathieu-Daudé wrote:
> On 27/2/23 06:41, Richard Henderson wrote:
>> Use proper enumeration types for input and output.
>> Use a const array to perform the mapping, with an
>> assert that the input is valid.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/internals.h     | 12 +++++++++---
>>   target/arm/translate-mve.c |  2 +-
>>   target/arm/vfp_helper.c    | 33 ++++++++-------------------------
>>   3 files changed, 18 insertions(+), 29 deletions(-)
...
>> +static inline FloatRoundMode arm_rmode_to_sf(ARMFPRounding rmode)
>> +{
>> +    assert((unsigned)rmode < ARRAY_SIZE(arm_rmode_to_sf_map));
>> +    return arm_rmode_to_sf_map[rmode];
>> +}
> 
> Is the inlining justified?

It's in a header file, so required.

r~



