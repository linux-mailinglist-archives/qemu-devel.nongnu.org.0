Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B70A7364924
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 19:41:40 +0200 (CEST)
Received: from localhost ([::1]:53656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYXtz-0000f5-Al
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 13:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55170)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYXrv-0008JA-5t
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:39:31 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:33343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lYXrt-0006Gh-LF
 for qemu-devel@nongnu.org; Mon, 19 Apr 2021 13:39:30 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t22so24796649pgu.0
 for <qemu-devel@nongnu.org>; Mon, 19 Apr 2021 10:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YLvn9Nt2e6/wyC0+bTf0onzCVTduNJel2budRDmQOyc=;
 b=p9gpDJioTiPzAEma0fNWdzEHuVPh7T4z6sy5+p0CRChnVVX6qM8Pe1/rpBFkVpBFji
 Tp3ZWO+jGbdEH5vid+k4CqfIAEk0urZPlAUC3Tio7bxgWKmtnpIBp+XNQVfthBsBJqnI
 mzWbIZEM+SbdEKGsVsU6ylBywcCno5rMpG4DhTyWv5zL7s9S+MlhGbz493QisHVWc3eh
 d9v51G2dd0xeRraW2ByIzLNn53l8zVMAl0uqCYCrbTsip+tK/JfaAscUr9vbEfKH3uVs
 gfcj6FU/NNNIrkv1fVyeJbxLRgBpOH15fLbwkppmh+y4t8TkoDC0zidlSEodYNVAcl12
 IRPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YLvn9Nt2e6/wyC0+bTf0onzCVTduNJel2budRDmQOyc=;
 b=mcwDZjDXVfBdusUigIodnW3EnaxE9WWaJK7jA7v5Y+enzolq4nhADLotZ2EBeiAA1T
 9Fon3y3M+AVm6eHLigPcFyqtXAegiK2oHAIsbiLuqUiptNjySnSQwHCxO50+skH4lKSf
 ySmu6W8ashWRJeSyDcC/UTHhvYftsKWkI12ZtsiLxuaEdOD6FC5IjaTbXJVVCBppL5vY
 ZhEu7zzoCwCaGdn5mP0FYQfERjEn0yBfl/t2aHnYR3pR+ipEZ4SxVgC3AmPUMzgeCC4a
 x2u6bVejejbe2I9ZVvMY9JbXxS8JdliiiKo12G0mDAQVs+quyzCDxCzRCuB9TSu6malQ
 TaFw==
X-Gm-Message-State: AOAM533Jvhccvu5RyvuGPp2N7FszlUASP/XEqPO1LZ/tAYvyO8FKDnBO
 NeYNvqhK7b0cYnwTC2WKw+W1JA==
X-Google-Smtp-Source: ABdhPJyuCYPX1plvyg1NbU2eTc1A/MA3rIHm9Y2GtbN7qvl+fcWRq4S6vao1xfiQxhkHc8vEMWXbrA==
X-Received: by 2002:aa7:8d4c:0:b029:21c:104b:f6cb with SMTP id
 s12-20020aa78d4c0000b029021c104bf6cbmr20155659pfe.26.1618853967954; 
 Mon, 19 Apr 2021 10:39:27 -0700 (PDT)
Received: from [192.168.64.62] (50-78-183-178-static.hfc.comcastbusiness.net.
 [50.78.183.178])
 by smtp.gmail.com with ESMTPSA id c23sm5393955pgj.50.2021.04.19.10.39.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 19 Apr 2021 10:39:27 -0700 (PDT)
Subject: Re: [PATCH v5 1/9] target/arm: Fix mte_checkN
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210416183106.1516563-1-richard.henderson@linaro.org>
 <20210416183106.1516563-2-richard.henderson@linaro.org>
 <CAFEAcA_XdxxuDSi7nwwB2JPMYFDxJYWv7fv1f-ySuwWnTmVaLg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <30e8ad67-2d14-cd1e-af8f-a4286d4571ce@linaro.org>
Date: Mon, 19 Apr 2021 10:39:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_XdxxuDSi7nwwB2JPMYFDxJYWv7fv1f-ySuwWnTmVaLg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
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

On 4/19/21 9:26 AM, Peter Maydell wrote:
>> @@ -779,29 +779,27 @@ uint64_t mte_checkN(CPUARMState *env, uint32_t desc,
>>
>>       mmu_idx = FIELD_EX32(desc, MTEDESC, MIDX);
>>       type = FIELD_EX32(desc, MTEDESC, WRITE) ? MMU_DATA_STORE : MMU_DATA_LOAD;
>> -    esize = FIELD_EX32(desc, MTEDESC, ESIZE);
>>       total = FIELD_EX32(desc, MTEDESC, TSIZE);
>>
>>       /* Find the addr of the end of the access, and of the last element. */
>> -    ptr_end = ptr + total;
>> -    ptr_last = ptr_end - esize;
>> +    ptr_last = ptr + total - 1;
> 
> Code change means the comment needs updating, since we're no longer
> finding two things. Change to just
>   /* Find the addr of the end of the access */
> 
> ?

Yep, good catch.


r~

