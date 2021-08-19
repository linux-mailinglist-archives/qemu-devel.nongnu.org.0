Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A9E43F20A5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 21:32:26 +0200 (CEST)
Received: from localhost ([::1]:41376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGnm5-0006IB-Fq
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 15:32:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGnko-0005ae-5s
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:31:06 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:42960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGnkm-0003WA-CX
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:31:05 -0400
Received: by mail-pl1-x630.google.com with SMTP id w6so4509421plg.9
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 12:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O/cQOHIT4dUIkD3ylBOg5UCLIDqggdQ/SXEYQXgPV+E=;
 b=NuPyHPBiCR4ajXeQGxFziop9b3KIWwIB5nsdqMsVNsvZAPS+/UooIBlesD2E+cxsfn
 6HBEiZST9a2+i/OWTB10+/utErUpuZ1opayRQg21GLcGRM7A0+jBc9rSD5ovwo5+40TF
 N2RcvZ72A94JyAEHDEho9eMC7WVulyUzioPbZ4dw0sfilIjQ+xxgExeCiY2QdvGngqoM
 1PM14mzzJWFpftAff7KF2v3gp/9xKDc7RYQRabZpCCv+i/V4E55rSB40r2vrShcRaKk2
 wiavzgI2JCW8UA/ZzLEBR/I2E2IFcbWOCraGfc73tNjxVvFnXNSZF85zxX3zaOurBqAq
 rRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O/cQOHIT4dUIkD3ylBOg5UCLIDqggdQ/SXEYQXgPV+E=;
 b=IKIbU9R9/gorC5Qmx2FmH7QJ0YQX55e02o9st2U9VNJxTSeW2kaYU/dDej4xGhzXOd
 XU18xaGgC3D65V1DAgwQ1iPRzKMXQjWZtuv1/+/9NiYg184rrAbtBocCJ2X/6UvqupT+
 dsEXjhzS/Bq/Kz3FtSLwRqfwPfFT5XEGkJuMS6hILGupOX1IxnYnpUsoHZl5NdoYtZSB
 Tf2RkWD2OVvWBrUYsqy6ijfzfYnoYQHKxNdObD/QpcY2b8zl2hWgSmY/S5b/ALDeCI5p
 51cJvkYeBeGk88wqc1E3NUwqNtvvL+GxpJeaQENF883g8C3vH0pc6TRrIK0hpmeC2MiQ
 nN2Q==
X-Gm-Message-State: AOAM532uMPiR38L3ekfOfy8WZHUp12TncKSfL8/HdDVv4A8RyEQDEOPJ
 rnY9jmtBIrn1qJAjE7MXaegDhCqI1NDQ5A==
X-Google-Smtp-Source: ABdhPJwCYx9GhQYgkEWSvtM71QdHVyzSK2wBlmvSuGslsPp5kQnfunmO6u0nhgHkhRqdgaQENLQPkQ==
X-Received: by 2002:a17:90b:1195:: with SMTP id
 gk21mr341604pjb.89.1629401462116; 
 Thu, 19 Aug 2021 12:31:02 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id gl19sm3952029pjb.20.2021.08.19.12.31.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 12:31:01 -0700 (PDT)
Subject: Re: [PATCH v3 46/66] linux-user: Split out do_prctl and subroutines
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-47-richard.henderson@linaro.org>
 <CAFEAcA-FxaRGCzjDTJG7rUX1-LHs6_BB0DkDtqfo0cn6X3JXnw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7230afa7-8c24-6ec3-c2dc-d5b3fedb1d26@linaro.org>
Date: Thu, 19 Aug 2021 09:30:58 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-FxaRGCzjDTJG7rUX1-LHs6_BB0DkDtqfo0cn6X3JXnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.591,
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

On 8/19/21 6:06 AM, Peter Maydell wrote:
> On Wed, 18 Aug 2021 at 20:39, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Since the prctl constants are supposed to be generic, supply
>> any that are not provided by the host.
>>
>> Split out subroutines for PR_GET_FP_MODE, PR_SET_FP_MODE,
>> PR_GET_VL, PR_SET_VL, PR_RESET_KEYS, PR_SET_TAGGED_ADDR_CTRL,
>> PR_GET_TAGGED_ADDR_CTRL.  Return EINVAL for guests that do
>> not support these options rather than pass them on to the host.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/aarch64/target_syscall.h |  23 -
>>   linux-user/mips/target_syscall.h    |   6 -
>>   linux-user/mips64/target_syscall.h  |   6 -
>>   linux-user/syscall.c                | 644 ++++++++++++++++------------
> 
>> +static abi_long do_prctl_get_fp_mode(CPUArchState *env)
>> +{
>> +#ifdef TARGET_MIPS
>> +    abi_long ret = 0;
>> +
>> +    if (env->CP0_Status & (1 << CP0St_FR)) {
>> +        ret |= PR_FP_MODE_FR;
>> +    }
>> +    if (env->CP0_Config5 & (1 << CP0C5_FRE)) {
>> +        ret |= PR_FP_MODE_FRE;
>> +    }
>> +    return ret;
>> +#else
>> +    return -TARGET_EINVAL;
>> +#endif
>> +}
> 
> If we're going to refactor the prctl code, I think it would be
> better to have architecture-specific prctl handling in
> linux-user/$ARCH/prctl.c files rather than lots of target ifdefs
> in syscall.c...

Ok, I'll give it some more thought.

r~


