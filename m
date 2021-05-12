Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56E1C37C76C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 18:19:32 +0200 (CEST)
Received: from localhost ([::1]:40748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgra6-0004q4-R0
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 12:19:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgrYG-0003eq-Pz
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:17:40 -0400
Received: from mail-qk1-x735.google.com ([2607:f8b0:4864:20::735]:33412)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lgrYA-0003fh-T3
 for qemu-devel@nongnu.org; Wed, 12 May 2021 12:17:36 -0400
Received: by mail-qk1-x735.google.com with SMTP id f29so10483195qka.0
 for <qemu-devel@nongnu.org>; Wed, 12 May 2021 09:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NYPSOK3bAWOTjjKwcZO5WYqRW3mN9ClMaw5o3tUdjDU=;
 b=rLPVh5nOBNHgxPoAaxaf/Gp1nsbFKKvmgsAmdKR5j/7JWNxP2sHrqlYObbt92eDskN
 8fAB5GEEe44TJmu1kUgFZrbG0cSKsc+IQiDD9af1ZyDQqfm4cW0TX+5fih1EojLOpKSc
 snZ4fgjCNP6AUgGJ6GMz1otR+TrIoe8RkUTCLlODZuDEvcNoHddMHUs6nVL1L8Of8ZlH
 XE1+CiMMp7671ocOu57BOaLlJLsC2BKL89GA3N+UJxgKIKfI8sVQ3QqvVt9slJRLI9Qw
 mEEl9E7rUz+vG84GUc+s8pTCNKzwwaypNaY5YWexcOLbJ2CHvshn6s3vW2uFpXQzo0CG
 YW5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NYPSOK3bAWOTjjKwcZO5WYqRW3mN9ClMaw5o3tUdjDU=;
 b=tWn9/mrACJmC7sDQo5Zjyes17TVmOMVQRxId6KxU1v6nBoIXYyjRhuQmH1eE03FBYf
 SXSQ2inev3+Mn0bEiF60h1d/XCaRyKLsM/SCud10P0ytfHohrJJB8TNpGZ4SvRrJowsL
 kcYx4HMRdKsAvyDatop2HKzBuR9NOtyOjBZSaKMuiibT5PcfrzVVi+Q55sdqCn0rxie7
 Bj65bw2gRsHyTa2TcsNr+OUJ2IlktvTALjdVWVBh8k4gDycY0gMdtxTD3OmegfGpNrph
 ZjS0ZAAlIoj4t7ZksC0lLI9jYkpvaJnRMsXsDTD/1Pp6PAgGeP9FsnHEqJENmRaJrblS
 CeRg==
X-Gm-Message-State: AOAM532RVPfcwz33nw79wTnyXeW90I3VWJ33jVn8WdAMga48x/QTxfp5
 VxYXP1pCNmHipfKaARmFH2VE4w==
X-Google-Smtp-Source: ABdhPJzGI7/q8ld6d4yn+uXqi6MUwnqW676cK0ri5gT4PfTher+GzuLhLOznYgvVUSCLWDyfVMP+Kw==
X-Received: by 2002:a05:620a:2081:: with SMTP id
 e1mr33205426qka.44.1620836249679; 
 Wed, 12 May 2021 09:17:29 -0700 (PDT)
Received: from [192.168.180.118] (163.189-204-200.bestelclientes.com.mx.
 [189.204.200.163])
 by smtp.gmail.com with ESMTPSA id j196sm356278qke.25.2021.05.12.09.17.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 May 2021 09:17:29 -0700 (PDT)
Subject: Re: [PATCH v6 38/82] target/arm: Implement SVE2 ADDHNB, ADDHNT
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-39-richard.henderson@linaro.org>
 <CAFEAcA9fwtJsQJcQQMF2VBVBWJDJgLCU1Eaq13-8PVSsTy4tUg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3be38343-23e5-ff64-1dae-ddcaa963732c@linaro.org>
Date: Wed, 12 May 2021 11:17:25 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9fwtJsQJcQQMF2VBVBWJDJgLCU1Eaq13-8PVSsTy4tUg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::735;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x735.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Stephen Long <steplong@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/12/21 10:23 AM, Peter Maydell wrote:
> On Fri, 30 Apr 2021 at 22:00, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> From: Stephen Long <steplong@quicinc.com>
>>
>> Signed-off-by: Stephen Long <steplong@quicinc.com>
>> Message-Id: <20200417162231.10374-2-steplong@quicinc.com>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
> 
>> diff --git a/target/arm/sve_helper.c b/target/arm/sve_helper.c
>> index 572d41a26c..2dead1f056 100644
>> --- a/target/arm/sve_helper.c
>> +++ b/target/arm/sve_helper.c
>> @@ -2112,6 +2112,42 @@ DO_SHRNT(sve2_uqrshrnt_d, uint64_t, uint32_t,     , H1_4, DO_UQRSHRN_D)
>>   #undef DO_SHRNB
>>   #undef DO_SHRNT
>>
>> +#define DO_BINOPNB(NAME, TYPEW, TYPEN, SHIFT, OP)                           \
>> +void HELPER(NAME)(void *vd, void *vn, void *vm, uint32_t desc)              \
>> +{                                                                           \
>> +    intptr_t i, opr_sz = simd_oprsz(desc);                                  \
>> +    for (i = 0; i < opr_sz; i += sizeof(TYPEW)) {                           \
>> +        TYPEW nn = *(TYPEW *)(vn + i);                                      \
>> +        TYPEW mm = *(TYPEW *)(vm + i);                                      \
>> +        *(TYPEW *)(vd + i) = (TYPEN)OP(nn, mm, SHIFT);                      \
>> +    }                                                                       \
>> +}
> 
> Doesn't this need H macros like the 'T' version ?

No, all memory ops are the same TYPEW column.


r~

