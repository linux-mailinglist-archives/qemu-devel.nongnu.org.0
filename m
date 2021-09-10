Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B28D406CF2
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 15:36:54 +0200 (CEST)
Received: from localhost ([::1]:56920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOgi5-0004IA-Af
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 09:36:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOgfr-0002Lp-I1
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:34:37 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:53772)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mOgfq-0001Xq-0r
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 09:34:35 -0400
Received: by mail-wm1-x333.google.com with SMTP id i3so1238403wmq.3
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 06:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=HJLyEKtIwB4483YMnKNbGhcQNFIAj7A8+gTCN7yzf74=;
 b=SLvTGYF+Lg7+iYFegfxQuqJBhUJCXF/fYacNx2OXA+EFZlpbmN/kuo+TXgrhPGDUY3
 oYzYRXIpNh2MasfW50ZnDbramukrzOaOWIYVwUhBuUAFQEux9bhBY4UNXMOYRDvzAxaT
 WdHUPe7kcj1FKXICJsGi9LbgNjho3Z1zl+J6/VgGhUS0Bl4rirZv8POVJOBd0voGamPM
 dnXmtvd2sXNkpApvv5V8nmwKZzuA/htCXdB9/dkQoHYB+IHO+pgXEnZgXqvp5wdB6nWZ
 8TfFF4v6fgMMCGsg07ljN53UD3AiIBWdgiydhF/LRA1oBEqWi2aoUNDtdWVSP5mqi82r
 CxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HJLyEKtIwB4483YMnKNbGhcQNFIAj7A8+gTCN7yzf74=;
 b=ZH3gMg1+IEGjCoqPa8M8iCxUFMAcrMGaKogFOHkY2rcLYlCdX5uPUbUV8ntAIz2TTB
 7IcUJAlO0IQXuBG4PEQgHNNW9Nw6cfbqzbrEIVMRY9hlufWQa1G2Ev2bAB+UpvUgyZG7
 OAybJtSKWDH5S4nD7i1RMQtA3eqgO7gfCQsJGpScLch05O+/2V3fyDHI0kUMNlIeTb72
 zoT1fEvHEMV0o1fwwB+m+HJM7/fZKse0NTwMdJvRIWFqDpHUmN5KUuAUW1gHfRj/ToC9
 CX3OWJRL1MuVasOrKz+GJVA7LDs8yZx71J90h3rowiEULptE2J5kp3qcOjwCuYOSJePT
 OMFA==
X-Gm-Message-State: AOAM5317GoJCbnsPIL5qIqflGJwgGb3ZotvY1DYWUk745+f8S6CYieDl
 dLdWO6kcNtnpoD8dqrO3WKyGaA==
X-Google-Smtp-Source: ABdhPJzgfQWxZT5D5+hMurKuORSgswb2IoiYiJyXf20PYI7f/KJ4gl9y5ozm6Bw7adfxiamHTNU3+Q==
X-Received: by 2002:a1c:790e:: with SMTP id l14mr5779476wme.47.1631280872306; 
 Fri, 10 Sep 2021 06:34:32 -0700 (PDT)
Received: from [192.168.1.147] (149.164.14.37.dynamic.jazztel.es.
 [37.14.164.149])
 by smtp.gmail.com with ESMTPSA id x14sm1611598wro.64.2021.09.10.06.34.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Sep 2021 06:34:31 -0700 (PDT)
Subject: Re: [PATCH] softmmu: fix watchpoint processing in icount mode
To: David Hildenbrand <david@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>, qemu-devel@nongnu.org
References: <163101424137.678744.18360776310711795413.stgit@pasha-ThinkPad-X280>
 <f103375f-9c3b-9b5b-6ef1-5437b4990c23@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <9bbee49c-f175-fa6e-3bda-7d117f1459b1@linaro.org>
Date: Fri, 10 Sep 2021 15:34:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f103375f-9c3b-9b5b-6ef1-5437b4990c23@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x333.google.com
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

On 9/10/21 1:15 PM, David Hildenbrand wrote:
> On 07.09.21 13:30, Pavel Dovgalyuk wrote:
>> Watchpoint processing code restores vCPU state twice:
>> in tb_check_watchpoint and in cpu_loop_exit_restore/cpu_restore_state.
>> Normally it does not affect anything, but in icount mode instruction
>> counter is incremented twice and becomes incorrect.
>> This patch eliminates unneeded CPU state restore.
>>
>> Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
>> ---
>>   softmmu/physmem.c |    5 +----
>>   1 file changed, 1 insertion(+), 4 deletions(-)
>>
>> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
>> index 23e77cb771..4025dfab11 100644
>> --- a/softmmu/physmem.c
>> +++ b/softmmu/physmem.c
>> @@ -941,14 +941,11 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
>>                   if (wp->flags & BP_STOP_BEFORE_ACCESS) {
>>                       cpu->exception_index = EXCP_DEBUG;
>>                       mmap_unlock();
>> -                    cpu_loop_exit_restore(cpu, ra);
>> +                    cpu_loop_exit(cpu);
>>                   } else {
>>                       /* Force execution of one insn next time.  */
>>                       cpu->cflags_next_tb = 1 | curr_cflags(cpu);
>>                       mmap_unlock();
>> -                    if (ra) {
>> -                        cpu_restore_state(cpu, ra, true);
>> -                    }
>>                       cpu_loop_exit_noexc(cpu);
>>                   }
>>               }
>>
>>
> 
> I'm not an expert on that code, but it looks good to me.
> 
> Maybe we could have added a comment above the tb_check_watchpoint() call to highlight that 
> the restore will happen in there.

Hmm.  Curious.

Looking at tb_check_watchpoint, I have trouble seeing how it could be correct. 
Watchpoints can happen at any memory reference within the TB.  We should be rolling back 
to the cpu state at the memory reference (cpu_retore_state) and not the cpu state at the 
start of the TB (cpu_restore_state_from_tb).

I'm also not sure why we're invalidating tb's.  Why does watchpoint hit imply that we 
should want to ditch the TB?  If we want different behaviour from the next execution, we 
should be adjusting cflags.


r~

