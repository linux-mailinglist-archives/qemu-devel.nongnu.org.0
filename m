Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1F869D643
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 23:17:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUERq-0003OA-Fn; Mon, 20 Feb 2023 17:15:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUERY-0003Ig-BT
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 17:15:39 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUERW-0004kp-9k
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 17:15:32 -0500
Received: by mail-pl1-x630.google.com with SMTP id ko13so3612086plb.13
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 14:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oGYK1kEwDOGBP0QTQgXqiJT/6f3zfaM5MoyEKoSQgpE=;
 b=WMIehveHFbOsyYv3HOlMy44chuCYQC/TmnoQZa7w8g9CLchxn94Iw5WI3j5m8ETHC8
 VGV890bHGn/dsIXZGbKmQC+36xXQHt+0TxA+TWlPXcktH8KB7buUKuM9Sgovyze5RDgy
 6DPyl6VQbgUcPS8R+i1ky06H/hwexcolrcNt/JeiU8E9misoQT8BkjIkVwq9vDI9C/tA
 FNyougrbDcEJ9uDIDlRJnY1lvm8OXT/y1BAJLlT8nR6oEJzIYoOBkGlznRb6bjqaE46i
 Rf5UcsogePpcyOLKulIc0qsdjhGChAT2AjLPqAulCBR0tejZ1Mz2B/NijFzi4d+Fj/N6
 emsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oGYK1kEwDOGBP0QTQgXqiJT/6f3zfaM5MoyEKoSQgpE=;
 b=FFqci4HbTXTzFs6KMF+IPrDxU4uKyMBjhO15621M4dGP1qQAOhd0l9nwXF8hDAjBi0
 7HszJwbYCWJxqCOes84cmG/IXVStxew8VBvQ0EeCEMmoTaxviN7FyZC/mr1cqbQVGb2f
 PBqgKMioxJqiwENghgOndShx4d7HVtHB8wFp1pbJQfDlCYWDwRKmUPe08MbfMrdcKYXS
 emBZXhmgHdmx4ogFY8tnf9fXLgpH3tlmZ6JFxUg7J8+epB0P/rCBaO+keFv2igURh3Gq
 i7BwXqVgw1Kq2zYSbu5pJ3pdtEVjuVa9xtUy9TbK9GAZpmtSY69LEAiURiOqnb3YRppp
 TGwg==
X-Gm-Message-State: AO0yUKUMh+Ikojkst+KjcwrHCnCUsg8ePnMJ/HwjVULpcpmhJmD+a8nH
 uPKg8e3xGa66jpC6ri7audXqWQ==
X-Google-Smtp-Source: AK7set9TbFnuBUTj0c9N/u88kup+SOQ3JoLaqtmkcyq/DXNs3uzGUaohAPQ3K7pNaUeqA9sTtWyYLw==
X-Received: by 2002:a05:6a20:1587:b0:be:9478:55ba with SMTP id
 h7-20020a056a20158700b000be947855bamr3919606pzj.60.1676931328359; 
 Mon, 20 Feb 2023 14:15:28 -0800 (PST)
Received: from [192.168.6.128] (rrcs-173-198-77-218.west.biz.rr.com.
 [173.198.77.218]) by smtp.gmail.com with ESMTPSA id
 bk3-20020a17090b080300b00230b572e90csm666359pjb.35.2023.02.20.14.15.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Feb 2023 14:15:27 -0800 (PST)
Message-ID: <38422576-703c-7955-2f55-b9c8de922902@linaro.org>
Date: Mon, 20 Feb 2023 12:15:20 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 17/22] target/arm: Use get_phys_addr_with_struct for stage2
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, yier.jin@huawei.com,
 jonathan.cameron@huawei.com, leonardo.garcia@linaro.org
References: <20230124000027.3565716-1-richard.henderson@linaro.org>
 <20230124000027.3565716-18-richard.henderson@linaro.org>
 <CAFEAcA9-ufibbm_Fp0spGK+iQKLgGcJfED=+c__q37mQFwAWxw@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9-ufibbm_Fp0spGK+iQKLgGcJfED=+c__q37mQFwAWxw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 2/10/23 03:28, Peter Maydell wrote:
> On Tue, 24 Jan 2023 at 00:01, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This fixes a bug in which we failed to initialize
>> the result attributes properly after the memset.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/arm/ptw.c | 13 +------------
>>   1 file changed, 1 insertion(+), 12 deletions(-)
>>
>> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
>> index eaa47f6b62..3205339957 100644
>> --- a/target/arm/ptw.c
>> +++ b/target/arm/ptw.c
>> @@ -32,12 +32,6 @@ typedef struct S1Translate {
>>       void *out_host;
>>   } S1Translate;
>>
>> -static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
>> -                               uint64_t address,
>> -                               MMUAccessType access_type,
>> -                               GetPhysAddrResult *result, ARMMMUFaultInfo *fi)
>> -    __attribute__((nonnull));
> 
> The definition of the function doesn't have the __attribute__,
> so if we drop this forward declaration we need to move the attribute.

Eh.  It was useful as an intermediary during one of the ptw reorgs, but now that we've 
eliminated the use case in which NULL had been passed, it can go away.  I assume you'd 
prefer that as a separate patch?

>> @@ -2854,12 +2848,7 @@ static bool get_phys_addr_twostage(CPUARMState *env, S1Translate *ptw,
>>       cacheattrs1 = result->cacheattrs;
>>       memset(result, 0, sizeof(*result));
>>
>> -    if (arm_feature(env, ARM_FEATURE_PMSA)) {
>> -        ret = get_phys_addr_pmsav8(env, ipa, access_type,
>> -                                   ptw->in_mmu_idx, s2walk_secure, result, fi);
>> -    } else {
>> -        ret = get_phys_addr_lpae(env, ptw, ipa, access_type, result, fi);
>> -    }
>> +    ret = get_phys_addr_with_struct(env, ptw, ipa, access_type, result, fi);
>>       fi->s2addr = ipa;
>>
>>       /* Combine the S1 and S2 perms.  */
> 
> Does this do the right thing for PMSAv8 ? The code in get_phys_addr_twostage
> sets up various things in ptw based on s2walk_secure, which (per previous
> patch) is not really well defined for PMSA.

As far as I can tell, yes, since as you say current PMSAv8 is all NonSecure.


r~


