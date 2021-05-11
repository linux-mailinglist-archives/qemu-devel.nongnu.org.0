Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D7F37AD19
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 19:27:43 +0200 (CEST)
Received: from localhost ([::1]:46326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgWAY-0006YW-Ud
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 13:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgW65-00016Y-5x
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:23:05 -0400
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330]:45575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgW5x-0001pP-OG
 for qemu-devel@nongnu.org; Tue, 11 May 2021 13:23:04 -0400
Received: by mail-ot1-x330.google.com with SMTP id
 f75-20020a9d03d10000b0290280def9ab76so18136033otf.12
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 10:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=llKTj285XJcBQES4bKAIiC4ehXI/ErwgeIhPrr4xr3Y=;
 b=f1jPUsWoWQYxZvE2ZxNuNWs3u9tUtP5QsTVR3feeZQHgaHtruC9G9ZNvvZPhdrKERj
 e8VfulfnGje9v7mKeMbDf2T5L6wToZ14ZWTJctiBu4JGarmwMzQEWT+J1wQKo/xVCGlV
 tKmRUesXL1y6Zdzh1RDZHAUsaAbuwTweA2o82iW6I8LYiTQHHad4SVgloUcW7edYzggB
 ReWrQ92AUWOYzB0E5r48i0z01Y+Ie7VEpelL4shLmAUUh26xU2aS3lnygGZ5rQFbiv4d
 kNfEA+t4N/4vLP/j5hL2Ndwp1bOGbv5al/hlzBvuc0vqVZkYjQ4ClJAbqaVQt2HgD776
 DAIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=llKTj285XJcBQES4bKAIiC4ehXI/ErwgeIhPrr4xr3Y=;
 b=YXsdzxHGPhZ2wV7PjmL6rpFgzRlY6h2Mn6XSWD5ht/Xq2spVLBB30w/zKanoAqoc2D
 CL+5RP+YMOEVw3l4Tw3K/H8HbFCpy1IZwHQ2RbCjjNZjt2gUepsiobZg3Omf8X+b6mFG
 Cid/ZaESwAuTEXPd4hL+n9ydQwYRuUs1HVRa+DFk3dD/9Ap2aML6eHaw5LVCfXgl1Q89
 IeL4gXTVITHAfu8/Bme5UL3ZoB6DhZRH07uaFac1Wdymj18z1BEP5mQvVu1y9gBrrlAq
 2Kf7/1afed2KwcjMJZYf0VHOlDI/gLwC0MPLGQHwNVwyhrnSQpccSjlGecVJXTlSJQBO
 zt0Q==
X-Gm-Message-State: AOAM532Ss0PhNeeI58tpYWYwCZhJ2ft69tWU0AdZM9AOx51ypiF0e8ZC
 RaoE+NrUBhvDz6C0Y754rnBYtWtX41ZwBpQzEJI=
X-Google-Smtp-Source: ABdhPJwZKNZWE7RjOWHPd4jyRskpU9i7Z9aprZp2nhlJupvqZK1dP9iuk1GOt/N889ys/CsKMbU6UA==
X-Received: by 2002:a9d:68c7:: with SMTP id i7mr27149229oto.272.1620753776524; 
 Tue, 11 May 2021 10:22:56 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id t3sm3425932ooa.18.2021.05.11.10.22.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 10:22:56 -0700 (PDT)
Subject: Re: [PATCH v6 04/82] target/arm: Implement SVE2 integer unary
 operations (predicated)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-5-richard.henderson@linaro.org>
 <CAFEAcA9YB1noev21vWDvW=MtTrZ8O=mpgyWLvvTQwNV8yoPYEg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8bd3bdcc-7b57-2d2d-6a88-e8259cf01275@linaro.org>
Date: Tue, 11 May 2021 12:22:54 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9YB1noev21vWDvW=MtTrZ8O=mpgyWLvvTQwNV8yoPYEg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::330;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x330.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 3:10 AM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 21:30, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>> v2: Fix sqabs, sqneg (laurent desnogues)
>> ---
>>   target/arm/helper-sve.h    | 13 +++++++++++
>>   target/arm/sve.decode      |  7 ++++++
>>   target/arm/sve_helper.c    | 29 +++++++++++++++++++----
>>   target/arm/translate-sve.c | 47 ++++++++++++++++++++++++++++++++++++++
>>   4 files changed, 92 insertions(+), 4 deletions(-)
> 
>> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
>> index 42fe315485..bbab84e81d 100644
>> --- a/target/arm/sve_helper.c
>> +++ b/target/arm/sve_helper.c
>> @@ -535,8 +535,8 @@ static inline uint64_t do_sadalp_d(uint64_t n, uint64_t m)
>>       return m + n1 + n2;
>>   }
>>
>> -DO_ZPZZ(sve2_sadalp_zpzz_h, int16_t, H1_2, do_sadalp_h)
>> -DO_ZPZZ(sve2_sadalp_zpzz_s, int32_t, H1_4, do_sadalp_s)
>> +DO_ZPZZ(sve2_sadalp_zpzz_h, uint16_t, H1_2, do_sadalp_h)
>> +DO_ZPZZ(sve2_sadalp_zpzz_s, uint32_t, H1_4, do_sadalp_s)
>>   DO_ZPZZ_D(sve2_sadalp_zpzz_d, uint64_t, do_sadalp_d)
>>
>>   static inline uint16_t do_uadalp_h(uint16_t n, uint16_t m)
>> @@ -557,8 +557,8 @@ static inline uint64_t do_uadalp_d(uint64_t n, uint64_t m)
>>       return m + n1 + n2;
>>   }
>>
>> -DO_ZPZZ(sve2_uadalp_zpzz_h, int16_t, H1_2, do_uadalp_h)
>> -DO_ZPZZ(sve2_uadalp_zpzz_s, int32_t, H1_4, do_uadalp_s)
>> +DO_ZPZZ(sve2_uadalp_zpzz_h, uint16_t, H1_2, do_uadalp_h)
>> +DO_ZPZZ(sve2_uadalp_zpzz_s, uint32_t, H1_4, do_uadalp_s)
>>   DO_ZPZZ_D(sve2_uadalp_zpzz_d, uint64_t, do_uadalp_d)
>>
>>   #undef DO_ZPZZ
> 
> These two hunks seem like they should have been in the previous patch.
> 
> (Why do we want to use uint* for the sadalp version?)

We shouldn't.  Looks like a rebase error?


r~

