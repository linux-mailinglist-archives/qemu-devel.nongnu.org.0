Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF48D618996
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 21:32:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqgrH-0006CL-5J; Thu, 03 Nov 2022 16:30:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqgrD-0006AZ-JH
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 16:30:35 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oqgrA-0006Hi-0C
 for qemu-devel@nongnu.org; Thu, 03 Nov 2022 16:30:35 -0400
Received: by mail-pg1-x529.google.com with SMTP id g129so2656056pgc.7
 for <qemu-devel@nongnu.org>; Thu, 03 Nov 2022 13:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UReJkJBVE8LD0OMyFNkePe9lhdkteLLGtyK8WAPes3I=;
 b=QvAPK9UbY/bNPKWbkfoI7cNGv2tpn4dDm88pdrJpxp5Oo0M2Nhou+WNZueugkeQ1qr
 bgzJL34DCkpZI57uFQjler3Xa9PNa+AYl96gUNmzcs41pp3bTPjCbtO5wCT0WhSlZt2q
 7LNVlFYLMYGQYcUU1SHe2x7/6dysS6+9vo4A0fuGVAhQUMa9GeCBaXjOdqIRSdr7Du60
 UuW1iln2lctTY1ULnWIbDoWSRi3b0ocWazM+tH4rGY0halBZykTMrMR/ihwsy8qy6lVc
 qggAyKwh5mhoSPBKIjn/576qBFnhuU80FrmTVxXdgK03PyPHexOrE+7Z5wTGecUODCga
 VL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=UReJkJBVE8LD0OMyFNkePe9lhdkteLLGtyK8WAPes3I=;
 b=NVrEwnf6/EugR2fuJoiliQ99xdFjQpNLwUWnk4MIoT+xnxhU0liH4G3taxUuAcrUHM
 QFjwW4B2dQG6tvkZmt2BlbrpjsT2PAdBgQ71YmNHjp7YssxB2oR8PDnxsNs/PvB/j7+A
 /Nr1oqTzMiswAp2d0KRLhg8kN9CMPEoq/LMrekm4OUB1ZD5RuLP8v52B748pELgSj+yF
 UEgrc2y5hoFMXg6XqTU3N9OGwA/4Icl7jCKhP5puxt3Q5Wzn7H7syC79KjoRJrdleQcq
 Z5EpCVSDaVjwGXxgxkIXAAse74JYu6wel0yLUY00le71+ewfDZL5T58OLsTKsk07qqlz
 K8zA==
X-Gm-Message-State: ACrzQf3ixecGuqizWeMTJljz9OFw2hFKgqOjMf1vxbldOBgMGs02mlPo
 R4sCR9Uvupe8Izp526UVB2phKQ==
X-Google-Smtp-Source: AMsMyM7bjO0ga0IqaaLXsX5OOBh/ENFl5FcwNv2B4qb3E3iC+mMkD/KwH1t96oY1rSLzJJa98I6wKQ==
X-Received: by 2002:a65:6a0f:0:b0:46e:f67c:bcee with SMTP id
 m15-20020a656a0f000000b0046ef67cbceemr27841162pgu.38.1667507420986; 
 Thu, 03 Nov 2022 13:30:20 -0700 (PDT)
Received: from [192.168.229.227] ([206.83.113.103])
 by smtp.gmail.com with ESMTPSA id
 79-20020a621452000000b005632f6490aasm1168064pfu.77.2022.11.03.13.30.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Nov 2022 13:30:20 -0700 (PDT)
Message-ID: <2d9a7f5e-0ec0-89da-53f0-b5624f540ae8@linaro.org>
Date: Fri, 4 Nov 2022 07:30:13 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] target/arm: Two fixes for secure ptw
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
References: <20221102054706.1015830-1-richard.henderson@linaro.org>
 <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/4/22 00:19, Peter Maydell wrote:
>> @@ -2671,6 +2671,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>>       bool is_secure = ptw->in_secure;
>>       ARMMMUIdx s1_mmu_idx;
>>
>> +    /*
>> +     * The page table entries may downgrade secure to non-secure, but
>> +     * cannot upgrade an non-secure translation regime's attributes
>> +     * to secure.
>> +     */
>> +    result->f.attrs.secure = is_secure;
>> +
>>       switch (mmu_idx) {
>>       case ARMMMUIdx_Phys_S:
>>       case ARMMMUIdx_Phys_NS:
>> @@ -2712,12 +2719,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
>>           break;
>>       }
>>
>> -    /*
>> -     * The page table entries may downgrade secure to non-secure, but
>> -     * cannot upgrade an non-secure translation regime's attributes
>> -     * to secure.
>> -     */
>> -    result->f.attrs.secure = is_secure;
>>       result->f.attrs.user = regime_is_user(env, mmu_idx);
> 
> Do we also need to move this setting of attrs.user ?
> get_phys_addr_disabled() doesn't set that either.

I don't think so.  The only cases which don't pass through the setting of attrs.user are 
the two Phys mmu_idx.  Which was by design per the comment up there about artificially 
deciding which EL regime they belong to.


r~

