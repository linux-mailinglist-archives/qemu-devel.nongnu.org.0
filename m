Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A87611A6F
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 20:48:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUN4-0004nE-Ij; Fri, 28 Oct 2022 14:46:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooUMz-0004mi-Ph
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 14:46:19 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ooUMx-0006Dg-SY
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 14:46:17 -0400
Received: by mail-pl1-x631.google.com with SMTP id v17so2563518plo.1
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 11:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=V1FdD5hFxz4pYLFGCrcsGcwlbop0oyZcGum60JawW9c=;
 b=hziBpfTB2lRtP47RKffEVPrTUX/QKIdp5ai0BGpckE6CYs74rzyF+Bzobjl8fljvg+
 NbtW779A63SQqP9ZEisqWXJwEVFM8e70z2GsaJNwlbD8c4WwKH2dz8dbz/9HWTycdhww
 +X5EwMoDw4ePLLY2df1Dm4VHOrAUAYdFZL7cXJGtFMGN50eRIuqSzXgvU9ko5fuN0tAN
 GFTvfxFbToTgj5jQ4p3yoor5EAOVKecVnEaoMTHvxXoDxegG62hoDsEBD0Uk9cTEFO6m
 Q39UxFcC/DmhGrfROaT9j2X6+aFNp+gr7UBNpZlriK/HDwiQhhGiWe8xWbjgGN/uFw5+
 3bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=V1FdD5hFxz4pYLFGCrcsGcwlbop0oyZcGum60JawW9c=;
 b=dcuB9aC9bLWzdy/zdAaJz3vNkEC7BYbHETO1FmnR/rgrC/J5pqlanCd1t36OG8Tz50
 iU8KBbIkqRLw+fwCjbNuyFcuZuK3Z/4DfYumOi5tGGbBNkexdJZQmJgc660vp2vvXuvC
 3PHmvUmKpD4ZUjP6nR+9FQeClGuM6LREXEFSpHLKHS8IYRh6rpuz3m+ZaCc0/zAHZjDo
 0LB9PPjRvOJRPLntcjGHZn2aUpmJs3UvHtpj/v8HmIB8jPuqkw0PR3pw/8GjOw9luxDs
 Pcwe1bpkD5XJu5tYoy8dY5GN/OLHN/4M9wJr2YHKTP7EtwkTzJmY+Qy2hUd4AiFTA7lH
 dIrw==
X-Gm-Message-State: ACrzQf020VyjmQWPHT1L8FJDP9JGWNB8VFif/y3XM7Dt9wlRdjnUHuPt
 bl9Gl872vEK/S4lmQ/siUkvfIg==
X-Google-Smtp-Source: AMsMyM4IOAJJerT9XngiJMcvvgCw+OCu3fA8Az0/MqReP/fKHOmE+Hc3w1JcZ0aMI/BR87kp4tQBAA==
X-Received: by 2002:a17:902:64c1:b0:186:827e:a0da with SMTP id
 y1-20020a17090264c100b00186827ea0damr403046pli.94.1666982772410; 
 Fri, 28 Oct 2022 11:46:12 -0700 (PDT)
Received: from [10.0.0.64] (180-150-56-70.b49638.mel.static.aussiebb.net.
 [180.150.56.70]) by smtp.gmail.com with ESMTPSA id
 w4-20020a170902e88400b0015e8d4eb26esm3407294plg.184.2022.10.28.11.46.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 11:46:11 -0700 (PDT)
Message-ID: <b00d8acc-043f-0319-1611-2d09d2021227@linaro.org>
Date: Sat, 29 Oct 2022 05:46:05 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v2 4/6] target/openrisc: Use cpu_unwind_state_data for
 mfspr
To: Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Stafford Horne <shorne@gmail.com>
References: <20221027100254.215253-1-richard.henderson@linaro.org>
 <20221027100254.215253-5-richard.henderson@linaro.org>
 <3e38900a-cdfe-c52c-85ce-5a7b1a0586f8@suse.de>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <3e38900a-cdfe-c52c-85ce-5a7b1a0586f8@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/28/22 20:16, Claudio Fontana wrote:
> On 10/27/22 12:02, Richard Henderson wrote:
>> Since we do not plan to exit, use cpu_unwind_state_data
>> and extract exactly the data requested.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/openrisc/sys_helper.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>> diff --git a/target/openrisc/sys_helper.c b/target/openrisc/sys_helper.c
>> index a3508e421d..dde2fa1623 100644
>> --- a/target/openrisc/sys_helper.c
>> +++ b/target/openrisc/sys_helper.c
>> @@ -199,6 +199,7 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
>>                              target_ulong spr)
>>   {
>>   #ifndef CONFIG_USER_ONLY
>> +    uint64_t data[TARGET_INSN_START_WORDS];
>>       MachineState *ms = MACHINE(qdev_get_machine());
>>       OpenRISCCPU *cpu = env_archcpu(env);
>>       CPUState *cs = env_cpu(env);
>> @@ -232,14 +233,20 @@ target_ulong HELPER(mfspr)(CPUOpenRISCState *env, target_ulong rd,
>>           return env->evbar;
>>   
>>       case TO_SPR(0, 16): /* NPC (equals PC) */
>> -        cpu_restore_state(cs, GETPC(), false);
>> +        if (cpu_unwind_state_data(cs, GETPC(), data)) {
>> +            return data[0];
>> +        }
>>           return env->pc;
>>   
>>       case TO_SPR(0, 17): /* SR */
>>           return cpu_get_sr(env);
>>   
>>       case TO_SPR(0, 18): /* PPC */
>> -        cpu_restore_state(cs, GETPC(), false);
>> +        if (cpu_unwind_state_data(cs, GETPC(), data)) {
>> +            if (data[1] & 2) {
>> +                return data[0] - 4;
>> +            }
>> +        }
>>           return env->ppc;
>>   
>>       case TO_SPR(0, 32): /* EPCR */
> 
> I am struggling to understand if the fact that we are not setting cpu->env.dflag anymore in the mfspr helper is fine;

That we might do so before was buggy.  We manage dflag in openrisc_tr_tb_stop expecting a 
particular value.  I should expand the patch comment on this.

Consider:

	l.j	L2	// branch
	l.mfspr r1, ppc	// delay

L1:	boom
L2:	l.lwa	r3, (r4)

With  "l.mfspr reg, ppc" executed in a delay slot, dflag would be set, but it would not be 
cleared by openrisc_tr_tb_stop on exiting the TB, because tb_stop thinks the value is 
already zero.

The next TB begins at L2 with dflag set when it should not.  If the load has a tlb miss, 
then the interrupt will be delivered with DSX set in the status register, and the pc 
decremented (openrisc implements restart after delay slot by re-executing the branch). 
This will cause the return from interrupt to go to L1, and boom!


r~

