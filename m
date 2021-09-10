Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C16406DCC
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 16:53:17 +0200 (CEST)
Received: from localhost ([::1]:55020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOhu0-0003tK-7h
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 10:53:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOhix-0005ry-5a
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:41:51 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:35583)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOhiv-0004k9-F0
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 10:41:50 -0400
Received: by mail-wr1-x436.google.com with SMTP id i23so2991388wrb.2
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V4UteMGDv/6mFMhz2Q6VQGcmiUKpEIcYvHIfDng/yi4=;
 b=UgFShiqKPEkcnfv+uzQaH2NAvSKTNHk6voxKRRAzRVteUklD4SDpfeXOTuuEEqd1C6
 kE7ShgiVjbLGqxhw/LObXiWWCUm4j62pSsP7yoo/d2W8/7GpEisU0UQE7XCL7x3iUc73
 fjiKXNKHapH942hsW/YVP5uuMVu05J+H0uxRJV81g9MXFliYDnt0YPNQeDAcmgRfxg9N
 tnpQal2hz0NohyDWM8GzexuJ8G7Suc+z5nMtLchFoPxBusHVtprCmSzy81Q0WvUjjbGI
 Q43e3dfeoaIkenBGGE4433pBiUsvnknKwFtSEuSU+CkZOAs3OQPcv5S3RfL5YUWjr+06
 bV7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V4UteMGDv/6mFMhz2Q6VQGcmiUKpEIcYvHIfDng/yi4=;
 b=Sd8S1RMmgYjDd029oPodWaNd4Ym371VU+n8gNqt8R1XBvx5KUPkqILeBOKVbN7KJLt
 R52l141QVL/bYm5UcWx+NLQKdgUrQw0Bk8e5ybGk1Vc6d5bRN075llBEE0fs21KpzIvB
 WQve639fvnzrO56HAu8SBmz6oi/Su2U9sfrOpM3F6C4dWh8xx/T9helBdvrBmjtr1V/H
 wJWNAcOIc/788aqcyhdseXbRqe73nXmKXxuznOyVdt3GYYaZss7O2+wKn1U0ftf+/9+A
 TFs+VlfEPhmdC6mlB6N1Kx/qAQW7+Fv+fpnPWmRXZNCAqUZxxvcFP7V4BbkeQACngfLq
 ba5A==
X-Gm-Message-State: AOAM531WmGRmlwTy+othrZAQQHyIN3kqynwHtbjzsvj/eLbfMDKfbJPN
 uN0iUdvdhNUCc5fMvQSfXQ5ZwA==
X-Google-Smtp-Source: ABdhPJwN09QYwBAVILrcSk+cJ4JUZ/9vwmFjFhOqYLEqhxjU8F2v9DumrZs2U/hj813pO1zXP8j/9w==
X-Received: by 2002:a5d:44ca:: with SMTP id z10mr9995014wrr.298.1631284906843; 
 Fri, 10 Sep 2021 07:41:46 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id o2sm5255629wrh.13.2021.09.10.07.41.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 07:41:46 -0700 (PDT)
Subject: Re: [PATCH] softmmu: fix watchpoint processing in icount mode
To: David Hildenbrand <david@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <163101424137.678744.18360776310711795413.stgit@pasha-ThinkPad-X280>
 <f103375f-9c3b-9b5b-6ef1-5437b4990c23@redhat.com>
 <9bbee49c-f175-fa6e-3bda-7d117f1459b1@linaro.org>
 <31e9ded8-6187-bced-51b8-45e35d2e9f06@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8096c13b-f87c-c8ae-70c7-499ee397850c@linaro.org>
Date: Fri, 10 Sep 2021 16:41:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <31e9ded8-6187-bced-51b8-45e35d2e9f06@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.349,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, peterx@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/10/21 3:46 PM, David Hildenbrand wrote:
> On 10.09.21 15:34, Richard Henderson wrote:
>> On 9/10/21 1:15 PM, David Hildenbrand wrote:
>>> On 07.09.21 13:30, Pavel Dovgalyuk wrote:
>>>> Watchpoint processing code restores vCPU state twice:
>>>> in tb_check_watchpoint and in cpu_loop_exit_restore/cpu_restore_state.
>>>> Normally it does not affect anything, but in icount mode instruction
>>>> counter is incremented twice and becomes incorrect.
>>>> This patch eliminates unneeded CPU state restore.
>>>>
>>>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>>>> ---
>>>>    softmmu/physmem.c |    5 +----
>>>>    1 file changed, 1 insertion(+), 4 deletions(-)
>>>>
>>>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>>>> index 23e77cb771..4025dfab11 100644
>>>> --- a/softmmu/physmem.c
>>>> +++ b/softmmu/physmem.c
>>>> @@ -941,14 +941,11 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>>>>                    if (wp->flags & BP_STOP_BEFORE_ACCESS) {
>>>>                        cpu->exception_index = EXCP_DEBUG;
>>>>                        mmap_unlock();
>>>> -                    cpu_loop_exit_restore(cpu, ra);
>>>> +                    cpu_loop_exit(cpu);
>>>>                    } else {
>>>>                        /* Force execution of one insn next time.  */
>>>>                        cpu->cflags_next_tb = 1 | curr_cflags(cpu);
>>>>                        mmap_unlock();
>>>> -                    if (ra) {
>>>> -                        cpu_restore_state(cpu, ra, true);
>>>> -                    }
>>>>                        cpu_loop_exit_noexc(cpu);
>>>>                    }
>>>>                }
>>>>
>>>>
>>>
>>> I'm not an expert on that code, but it looks good to me.
>>>
>>> Maybe we could have added a comment above the tb_check_watchpoint() call to highlight that
>>> the restore will happen in there.
>>
>> Hmm.  Curious.
>>
>> Looking at tb_check_watchpoint, I have trouble seeing how it could be correct.
>> Watchpoints can happen at any memory reference within the TB.  We should be rolling back
>> to the cpu state at the memory reference (cpu_retore_state) and not the cpu state at the
>> start of the TB (cpu_restore_state_from_tb).
> 
> cpu_restore_state() ends up calling cpu_restore_state_from_tb() with essentially
> the same parameters or what am I missing?

Whoops, yes.  I must have been thinking of a different function.

>> I'm also not sure why we're invalidating tb's.  Why does watchpoint hit imply that we
>> should want to ditch the TB?  If we want different behaviour from the next execution, we
>> should be adjusting cflags.
> 
> It goes back to
> 
> commit 06d55cc19ac84e799d2df8c750049e51798b00a4
> Author: aliguori <aliguori@c046a42c-6fe2-441c-8c8c-71466251a162>
> Date:   Tue Nov 18 20:24:06 2008 +0000
> 
>      Restore pc on watchpoint hits (Jan Kiszka)
>      In order to provide accurate information about the triggering
>      instruction, this patch adds the required bits to restore the pc if the
>      access happened inside a TB. With the BP_STOP_BEFORE_ACCESS flag, the
>      watchpoint user can control if the debug trap should be issued on or
>      after the accessing instruction.
>      Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
>      Signed-off-by: Anthony Liguori <aliguori@us.ibm.com>
> 
> 
> *trying to rememebr what we do on watchpoints* I think we want to
> make sure that we end up with a single-instruction TB, right? So we
> want to make sure to remove the old one.

When the watchpoint needs to trigger after the insn, we do indeed want to execute a single 
insn, which we do with the cflags there in the patch context.  But when we want to stop 
before the insn, we're already done -- so what was the invalidate supposed to achieve?

(Then of course there's the problem that Phillipe filed (#245) in which we set cflags as 
per above, then take an interrupt before using it, then wind up with garbage.  Ho hum.)


r~

r~

