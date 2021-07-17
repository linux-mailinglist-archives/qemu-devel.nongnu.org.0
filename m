Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C5D3CC598
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Jul 2021 21:04:17 +0200 (CEST)
Received: from localhost ([::1]:48558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4pbj-0007Yq-9U
	for lists+qemu-devel@lfdr.de; Sat, 17 Jul 2021 15:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35992)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4pay-0006po-Fn
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:03:28 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:34318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m4paw-0005mN-WA
 for qemu-devel@nongnu.org; Sat, 17 Jul 2021 15:03:28 -0400
Received: by mail-pl1-x629.google.com with SMTP id b2so2667622plx.1
 for <qemu-devel@nongnu.org>; Sat, 17 Jul 2021 12:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=d5vLCWGgnxpPqPYTHRuVRqjHDg9D5cLKg8/ghLnmwTM=;
 b=N6r6+HmLpvo/j9WPYxH5XYWIU2sKRecCEuwZ/ZOO80fbws3/UmHsatGUV4i3gX/Jfx
 /PyPpVDYjI4b+z40xZ+97rRdjnNEKs8IvQTtCipHYxj7lqMHkLjLf5HY/zj6yMUODlTr
 eMgzXdyWqqAcDZXbKp3tFVtm/2FHmoOQ+ahPaDlFa4DPYRJOsYGMN77LVDjM3alHwx0h
 s0COjKIBs1voh54kFvKlc379iE9Oa5k1O7EKpZidgwl04fj1P4tNgLODXHL9pZn1T2nY
 1R0+XaIsc2FH9XNBgMQnRJW5hlYt+DLMNc1GJA3/y91Qp+u1RQC8ySc05sspjtC+mONf
 vY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=d5vLCWGgnxpPqPYTHRuVRqjHDg9D5cLKg8/ghLnmwTM=;
 b=Dv95QoI+o6x6POrSqTUBAYDpbvGuq7mVSeWZQCx8cPa2UtuERe+Tvek14O147CStDr
 QRJzvcNJOQhZC2PWNwE4H18YZeaIkJQh0NiIcRo5MpytbMyM/f4ogD7pRKs7WecQ1N2Y
 LjHI08huBUyCXVPT+CY2Y8xzoVsbeLirbl7pD5nDL0tRZTGfRKdrthAG9CmcUNpDVEZA
 GbWL8JXYsAos5C8acWSJhRbdFzqs+139frx2Axs+LrCm5nKQiYKhULSzMmiNiB1oxccj
 a8xDCNieITNallfGwMI+ssp1XaXgSnrvdCkyV2OzOl/vvnQi5fNlYUWf6pAP2ONSastU
 D+uA==
X-Gm-Message-State: AOAM533ikovDNpBkuT+pfguIXoQhw23tlvNyMH/xs8jg0p0UuJdMW/fR
 KBOd8It+5VNrETQqT6Nhwu5FcQ==
X-Google-Smtp-Source: ABdhPJz6x4TroysopzKOzU4Ffr6LpZyZfSjc2+bfRmVasDm37E4CyEYQV0hTPJvQNNZMFP54tjxgKQ==
X-Received: by 2002:a17:902:b188:b029:11b:1549:da31 with SMTP id
 s8-20020a170902b188b029011b1549da31mr12374962plr.7.1626548605315; 
 Sat, 17 Jul 2021 12:03:25 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id d12sm14135796pfv.212.2021.07.17.12.03.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 17 Jul 2021 12:03:24 -0700 (PDT)
Subject: Re: [PATCH v2 06/10] accel/tcg: Use CF_NO_GOTO_{TB, PTR} in
 cpu_exec_step_atomic
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210712154004.1410832-1-richard.henderson@linaro.org>
 <20210712154004.1410832-7-richard.henderson@linaro.org>
 <CAFEAcA_TGeJiBk_jCzkK0wS3+BpLh3CK640pbtYi8s7sAp_98A@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <35d15c09-cc40-f04a-c2f2-7c3da930df8e@linaro.org>
Date: Sat, 17 Jul 2021 12:03:22 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_TGeJiBk_jCzkK0wS3+BpLh3CK640pbtYi8s7sAp_98A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/17/21 10:43 AM, Peter Maydell wrote:
> On Mon, 12 Jul 2021 at 16:46, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Request that the one TB returns immediately, so that
>> we release the exclusive lock as soon as possible.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   accel/tcg/cpu-exec.c | 11 ++++++++---
>>   1 file changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 2206c463f5..5bb099174f 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -330,8 +330,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
>>       CPUArchState *env = (CPUArchState *)cpu->env_ptr;
>>       TranslationBlock *tb;
>>       target_ulong cs_base, pc;
>> -    uint32_t flags;
>> -    uint32_t cflags = (curr_cflags(cpu) & ~CF_PARALLEL) | 1;
>> +    uint32_t flags, cflags;
>>       int tb_exit;
>>
>>       if (sigsetjmp(cpu->jmp_env, 0) == 0) {
>> @@ -341,8 +340,14 @@ void cpu_exec_step_atomic(CPUState *cpu)
>>           cpu->running = true;
>>
>>           cpu_get_tb_cpu_state(env, &pc, &cs_base, &flags);
>> -        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
>>
>> +        cflags = curr_cflags(cpu);
>> +        /* Execute in a serial context. */
>> +        cflags &= ~CF_PARALLEL;
>> +        /* After 1 insn, return and release the exclusive lock. */
>> +        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;
>> +
>> +        tb = tb_lookup(cpu, pc, cs_base, flags, cflags);
>>           if (tb == NULL) {
>>               mmap_lock();
>>               tb = tb_gen_code(cpu, pc, cs_base, flags, cflags);
> 
> So previously we would have executed possibly a chain of TBs
> before releasing the lock, and now we definitely execute just one?

Correct.

> (I guess the execute-a-chain case is unlikely given the TB
> only has one insn and we know it's an exclusive insn...)

I think it's actually likely.  While the tb would definitely end after one insn, we had 
passed nothing down that would lead to returning to the main loop.


r~

> 
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> thanks
> -- PMM
> 


