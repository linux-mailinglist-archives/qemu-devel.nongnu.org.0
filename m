Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B989D5F7B3F
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 18:15:16 +0200 (CEST)
Received: from localhost ([::1]:37006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogq0J-0000Me-Go
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 12:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpN6-0003Fm-19
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:34:48 -0400
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b]:35734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogpN4-0008Av-BN
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 11:34:43 -0400
Received: by mail-pl1-x62b.google.com with SMTP id h10so4874422plb.2
 for <qemu-devel@nongnu.org>; Fri, 07 Oct 2022 08:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=cIpYn62MZIj8fgFaAPw8auniKcMKk3voUG1A52oDgM8=;
 b=ewworl1yfo9RqkCa/dSiELLJ0sVNriyF+TLV8PrT1t5zh9uQ6vJ7IExeQZSyho/JzN
 F5/kU2lp33kkSSb33ijSRypk7dg86XQp9aQlvM6taBBzS7BhSd5uhxD6suBbEMOYtQq3
 GU8EehTDtfGiSKcXu653q4djoJSLt0KvNFOIAm4DkzSAVcKsKEC2hMILmFn4JnUhL9fB
 NTBdCNfGb9p1IwVubonQmqfd9ln1qzFceeqO492aoYNJnJLe2NRUNG9GIG4deV+zS9NF
 KIHcIvLzLXgFEAoIi5dOLZAJb7l9WFppZQqX7DXjxwQiuGmPvfVPggFO098A++lbxlka
 Dogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=cIpYn62MZIj8fgFaAPw8auniKcMKk3voUG1A52oDgM8=;
 b=4CMEnE9BN6UjJEpuA9J3J7VirkLsXG2r57f2pMpzw604B23zbltM88UHjLzg1h/HQQ
 Nx20KCrztLxzKfVLmhPGUGYsupmD5T+Do/v1SPnAiYLJET93ICyrknF1RIrU/yyZIqhN
 t20iTgrBTAQEX13a7LGML/HHNobnnIEo/VZesFYmOko3OyUGVNLmO3LHssJN/4Me3V2+
 u2ouoFr570M3+QP9ezo812mKLJSXWHeoUqcyfwApFHnt4q7CHVDAh5xNovh4CkoDyIT2
 dgdwZp2n2wtp0W4llcTZN5Wg59x5YpyaiB8O6igWURPKG66JzwQBQOUkJijqkW+B2Af6
 Eusw==
X-Gm-Message-State: ACrzQf3LrQlzvFPs8vwIC2q3kHQxZJGtEbvhe5mPjXONcIDp7wTdDB4U
 CE59g9yJM8RJsw5D8ugFZyOWvA==
X-Google-Smtp-Source: AMsMyM4+MS98bxoKRltTkrvcM96d/oYM14wZGvJ+GqbbOmqocQQIQA9G5YY4+DXk/kJ93D78/vuuIg==
X-Received: by 2002:a17:90a:1690:b0:20a:8f70:14bb with SMTP id
 o16-20020a17090a169000b0020a8f7014bbmr6040426pja.115.1665156880892; 
 Fri, 07 Oct 2022 08:34:40 -0700 (PDT)
Received: from ?IPV6:2602:47:d49d:ec01:3b6c:3864:9643:140a?
 ([2602:47:d49d:ec01:3b6c:3864:9643:140a])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a170902d54600b00178af82a08dsm1658843plf.91.2022.10.07.08.34.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 07 Oct 2022 08:34:40 -0700 (PDT)
Message-ID: <3747eb1b-1b7e-87c9-02d5-950e5fb9a6b9@linaro.org>
Date: Fri, 7 Oct 2022 08:34:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 30/42] target/arm: Add ptw_idx argument to
 S1_ptw_translate
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-31-richard.henderson@linaro.org>
 <CAFEAcA9QrOyx8V+=5F-UhtVo=LaE_uHRkAmaSx0kqB_MGbO=YQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA9QrOyx8V+=5F-UhtVo=LaE_uHRkAmaSx0kqB_MGbO=YQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62b.google.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.699,
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

On 10/7/22 02:19, Peter Maydell wrote:
> I don't think this works, because the s2_mmu_idx is not necessarily
> the same through the whole of a page table walk. See the comment in
> get_phys_addr_lpae():
>      /*
>       * Secure accesses start with the page table in secure memory and
>       * can be downgraded to non-secure at any step. Non-secure accesses
>       * remain non-secure. We implement this by just ORing in the NSTable/NS
>       * bits at each step.
>       */
> 
> Currently get_phys_addr_lpae() updates the nstable bit in tableattrs and
> passes that to arm_ldq_ptw() for each level of the page tables, which in
> turn causes S1_ptw_translate() to select ARMMMUIdx_Stage2_S or ARMMMUIdx_Stage2.

Ouch.  I had missed this subtlety.

We could play lsb games with the mmu_idx itself, knowing that we have either 
ARMMMUIdx_{Stage2,Phys}_S and generate ARMMMUIdx_{Stage2,Phys}.  I'll have another good 
long look at this.


>>       if (regime_translation_disabled(env, mmu_idx, is_secure)) {
>> -        return get_phys_addr_disabled(env, address, access_type, mmu_idx,
>> -                                      is_secure, result, fi);
>> +        goto do_disabled;
>>       }
> 
> I'd prefer to avoid this goto back up into the middle of an unrelated
> switch statement.

Oops, I guess I missed this one when I went back through to eliminate the gotos.


r~

