Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 622876FE10A
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 17:01:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwlJo-00034U-5h; Wed, 10 May 2023 11:01:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlJm-00034C-RV
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:01:26 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pwlJj-0008TA-P2
 for qemu-devel@nongnu.org; Wed, 10 May 2023 11:01:26 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f423521b10so28619135e9.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 08:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683730882; x=1686322882;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=x9YN8PB3MnHIRtFc0+EDLzNQ62VkWaqelpXl/P31K2k=;
 b=LCO2mgjDSgY0UqN5umFnboo6h15ih4oDJ1YlwzcAq/hjQnFnlWTVo40IbR+Xkt5AHg
 iCpUn+NAJaUu8mePoX2vkPy3/3rMtHMXZg/zLPOkfRVh21Khvlvu01r4lGNpSGQlUEVa
 gqUOpi/hTwYwnfFI2oECJnGWC5ePbmDYhCQt81m1nGfVlLYBfi4qXofueW5jhC+mZF42
 uLUlDz23+MwkXHlqXzz11AwVKMFbX25OV4inLXjbvdj6qDXouwo8/XlpqGgiTVxJ8FBA
 iuhIUAIVNMSnEChSO4FkCufTP/MLrCd6tP/sWAZuNb16ocsyxhGGx9SUC+ukjOf8vCzr
 VRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683730882; x=1686322882;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=x9YN8PB3MnHIRtFc0+EDLzNQ62VkWaqelpXl/P31K2k=;
 b=RU8ZH0STpikqCgwuE+eTWa/P7F45HrN44FC7fosk7hlHtnCPQNGv9amJzHsBSBMR2N
 OfqKbVhIuAR11qoGfFsZttajldQAK5XxvtRxsGC/KtRCg5fugR8YQEKOeK3tfD7tIfBm
 qns8bcPjICFnybXUwrbMEPvef45meIIvZreFR+DwTjKcc2FTKdjNVE7UBLWXh17x/59x
 Gzz+CJqamKWdYHbcZiBhvOXd2LVbDpr1KbBpcdPPDBmV3Z0dypIdy/dn+svU9D1mmh4D
 V/GWe/lf+6OCRW/UMqGB/F1z2BfnU8v/NVna1z2bKFaHI75dyyCF0S3XdUTlJeGYdjeP
 64oA==
X-Gm-Message-State: AC+VfDwOrFYqMIayFOL6fBruEbsz4lS3d4BFh648A0yHzUGB5eFJtiy9
 fTRsYhMACBkFjsWBLe9tflqO4A==
X-Google-Smtp-Source: ACHHUZ4fpvvjRDxdClWSAvM27Dn0yOnkgI0BmtVYKPTHlC4fW1V0sr3HhHPBdLZm5jp7CCCR3DgULg==
X-Received: by 2002:a1c:f615:0:b0:3f1:952c:3c70 with SMTP id
 w21-20020a1cf615000000b003f1952c3c70mr11246318wmc.40.1683730882191; 
 Wed, 10 May 2023 08:01:22 -0700 (PDT)
Received: from [192.168.1.177] ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 r9-20020adfe689000000b002f6dafef040sm17605278wrm.12.2023.05.10.08.01.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 08:01:21 -0700 (PDT)
Message-ID: <4e780ff9-b25c-5439-2fe7-80057785042d@linaro.org>
Date: Wed, 10 May 2023 16:01:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 0/2] accel/tcg/tcg-accel-ops-rr: ensure fairness with
 icount
Content-Language: en-US
To: Jamie Iles <quic_jiles@quicinc.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@linaro.org,
 peter.maydell@linaro.org
References: <20230427020925.51003-1-quic_jiles@quicinc.com>
 <7277aa1e-413d-2f7a-37ce-23ea1f54c09a@linaro.org>
 <ZFItGQ5o67WuOwYp@JILES.na.qualcomm.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <ZFItGQ5o67WuOwYp@JILES.na.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x334.google.com
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.251,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 5/3/23 10:44, Jamie Iles wrote:
> Hi Richard,
> 
> On Sat, Apr 29, 2023 at 10:28:03AM +0100, Richard Henderson wrote:
>> On 4/27/23 03:09, Jamie Iles wrote:
>>> From: Jamie Iles <jiles@qti.qualcomm.com>
>>>
>>> The round-robin scheduler will iterate over the CPU list with an
>>> assigned budget until the next timer expiry and may exit early because
>>> of a TB exit.  This is fine under normal operation but with icount
>>> enabled and SMP it is possible for a CPU to be starved of run time and
>>> the system live-locks.
>>>
>>> For example, booting a riscv64 platform with '-icount
>>> shift=0,align=off,sleep=on -smp 2' we observe a livelock once the kernel
>>> has timers enabled and starts performing TLB shootdowns.  In this case
>>> we have CPU 0 in M-mode with interrupts disabled sending an IPI to CPU
>>> 1.  As we enter the TCG loop, we assign the icount budget to next timer
>>> interrupt to CPU 0 and begin executing where the guest is sat in a busy
>>> loop exhausting all of the budget before we try to execute CPU 1 which
>>> is the target of the IPI but CPU 1 is left with no budget with which to
>>> execute and the process repeats.
>>>
>>> We try here to add some fairness by splitting the budget across all of
>>> the CPUs on the thread fairly before entering each one.  The CPU count
>>> is cached on CPU list generation ID to avoid iterating the list on each
>>> loop iteration.  With this change it is possible to boot an SMP rv64
>>> guest with icount enabled and no hangs.
>>>
>>> New in v3 (address feedback from Richard Henderson):
>>>    - Additional patch to use QEMU_LOCK_GUARD with qemu_cpu_list_lock where
>>>      appropriate
>>>    - Move rr_cpu_count() call to be conditional on icount_enabled()
>>>    - Initialize cpu_budget to 0
>>>
>>> Jamie Iles (2):
>>>     cpu: expose qemu_cpu_list_lock for lock-guard use
>>>     accel/tcg/tcg-accel-ops-rr: ensure fairness with icount
>>
>> It appears as if one of these two patches causes a failure in replay, e.g.
>>
>>    https://gitlab.com/rth7680/qemu/-/jobs/4200609234#L4162
>>
>> Would you have a look, please?
> 
> I was out on vacation and it looks like this job got cleaned up, but was
> this a mutex check failing for the replay mutex and/or iothread mutex?
> If so then the following patch fixes it for me which I can include in a
> v4

That was it.  I'll squash this fix and re-queue.


r~

> 
> Thanks,
> 
> Jamie
> 
> 
> diff --git i/accel/tcg/tcg-accel-ops-icount.c w/accel/tcg/tcg-accel-ops-icount.c
> index e1e8afaf2f99..3d2cfbbc9778 100644
> --- i/accel/tcg/tcg-accel-ops-icount.c
> +++ w/accel/tcg/tcg-accel-ops-icount.c
> @@ -114,13 +114,13 @@ void icount_prepare_for_run(CPUState *cpu, int64_t cpu_budget)
>       g_assert(cpu_neg(cpu)->icount_decr.u16.low == 0);
>       g_assert(cpu->icount_extra == 0);
>   
> +    replay_mutex_lock();
> +
>       cpu->icount_budget = MIN(icount_get_limit(), cpu_budget);
>       insns_left = MIN(0xffff, cpu->icount_budget);
>       cpu_neg(cpu)->icount_decr.u16.low = insns_left;
>       cpu->icount_extra = cpu->icount_budget - insns_left;
>   
> -    replay_mutex_lock();
> -
>       if (cpu->icount_budget == 0) {
>           /*
>            * We're called without the iothread lock, so must take it while
> diff --git i/replay/replay.c w/replay/replay.c
> index c39156c52221..0f7d766efe81 100644
> --- i/replay/replay.c
> +++ w/replay/replay.c
> @@ -74,7 +74,7 @@ uint64_t replay_get_current_icount(void)
>   int replay_get_instructions(void)
>   {
>       int res = 0;
> -    replay_mutex_lock();
> +    g_assert(replay_mutex_locked());
>       if (replay_next_event_is(EVENT_INSTRUCTION)) {
>           res = replay_state.instruction_count;
>           if (replay_break_icount != -1LL) {
> @@ -85,7 +85,6 @@ int replay_get_instructions(void)
>               }
>           }
>       }
> -    replay_mutex_unlock();
>       return res;
>   }
>   


