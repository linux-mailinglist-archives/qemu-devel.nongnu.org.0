Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F4955F27B
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 02:39:44 +0200 (CEST)
Received: from localhost ([::1]:48098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Lk7-0004au-05
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 20:39:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o6LhH-0003rr-75
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 20:36:47 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:35804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o6LhF-0002XZ-4p
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 20:36:46 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 x1-20020a17090abc8100b001ec7f8a51f5so17678667pjr.0
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 17:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=31lFCxGKGH/kbfLBZnjJfqd7Dpl72om+zCsxjEWagag=;
 b=sCfteJuLm7pnSF3rG8UNv7yMlOmHfwuwa32SDzCbcIVTTVN2QAt9AMEzUs5fasMPGn
 I4rJ5KOzDPqmvV7lPVlgZktdv8l8q/+iUGRS/iKP6nvYj4TSWTmnvSRPWmM3KEwXa7g4
 /tYZ8Wam++OyZazoaMPOphwdqbJq8N1gHJgDC7SUibonw7cgKMj/nPq7uvTJTwSM1hVK
 O8rwuwKgE2n75jxxbxLWTtuPaWklGTWINVBGqjQ+9IH0l7ECAoYj56JAQjIholF1KI6/
 CnxsYcDmtNzq0nr09pxpf+Ab+R1CLpWGFRmZ+f+P3qSIYwT4YBqS109mj9nQ6Hsxa5GO
 1FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=31lFCxGKGH/kbfLBZnjJfqd7Dpl72om+zCsxjEWagag=;
 b=ONkF52EKHz6KHMlxUO/S7xCH53oRBHzU16HDm7/koSQbUgDSWNajN05BZVRDeqbng9
 t5pNJuqXbdzAtlraJHG7ikwrwgR1dhaoj0Vv/LK8Buea2Mzg3YJcwa+C6zIjplMCARik
 RcKr7zwkwABhpxCCPrGoldxNi6oBJyMeS33iVz5zyAnegs9gOJ3jkZwcAvBr2RIT/HRb
 ez8/4qaky02YpPhrZWJLkPAsPpgLwKYtXlEijsIopY6PRfFj9PfIuAv4kzGE8KPkF91A
 x85tbd2tC5JK8msP/tQCyndfPdMLeovuuSEO/HifXdQSJun1rUnsuPyB8/IvJ3Sj+KLb
 6KYQ==
X-Gm-Message-State: AJIora/1T4Y3zLQQVzD0mj/p09swcepQI59Z8eTEUDtd7N1bZNZCnbVO
 VkAss0oWlqeYtU0eis4I5hpEHA==
X-Google-Smtp-Source: AGRyM1ti8in/orfPlSZCOT51SqbpZc9ITTzgbdl4iNuv/yK+YUxTrWttdM9+GHuSd5nDCyj8BO4iEw==
X-Received: by 2002:a17:902:eb86:b0:16a:f36d:741a with SMTP id
 q6-20020a170902eb8600b0016af36d741amr6448581plg.149.1656463002834; 
 Tue, 28 Jun 2022 17:36:42 -0700 (PDT)
Received: from [192.168.123.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 a6-20020a056a000c8600b0051c49fb62b7sm10293137pfv.165.2022.06.28.17.36.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jun 2022 17:36:42 -0700 (PDT)
Message-ID: <b4f49f9d-769d-e307-b01d-aadc5df70642@linaro.org>
Date: Wed, 29 Jun 2022 06:06:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v5 2/2] target/xtensa: Use semihosting/syscalls.h
Content-Language: en-US
To: Max Filippov <jcmvbkbc@gmail.com>
Cc: qemu-devel <qemu-devel@nongnu.org>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20220628114307.697943-1-richard.henderson@linaro.org>
 <20220628114307.697943-3-richard.henderson@linaro.org>
 <CAMo8BfJgo184TYxr0O-t5x68Ac1U3t9LWWvPeUEwm-E_qizGWQ@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAMo8BfJgo184TYxr0O-t5x68Ac1U3t9LWWvPeUEwm-E_qizGWQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/28/22 19:08, Max Filippov wrote:
> On Tue, Jun 28, 2022 at 4:43 AM Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> This separates guest file descriptors from host file descriptors,
>> and utilizes shared infrastructure for integration with gdbstub.
>> Remove the xtensa custom console handing and rely on the
>> generic -semihosting-config handling of chardevs.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   target/xtensa/cpu.h         |   1 -
>>   hw/xtensa/sim.c             |   3 -
>>   target/xtensa/xtensa-semi.c | 226 ++++++++----------------------------
>>   3 files changed, 50 insertions(+), 180 deletions(-)
>>
>> diff --git a/target/xtensa/cpu.h b/target/xtensa/cpu.h
>> index ea66895e7f..99ac3efd71 100644
>> --- a/target/xtensa/cpu.h
>> +++ b/target/xtensa/cpu.h
>> @@ -612,7 +612,6 @@ void xtensa_translate_init(void);
>>   void **xtensa_get_regfile_by_name(const char *name, int entries, int bits);
>>   void xtensa_breakpoint_handler(CPUState *cs);
>>   void xtensa_register_core(XtensaConfigList *node);
>> -void xtensa_sim_open_console(Chardev *chr);
>>   void check_interrupts(CPUXtensaState *s);
>>   void xtensa_irq_init(CPUXtensaState *env);
>>   qemu_irq *xtensa_get_extints(CPUXtensaState *env);
>> diff --git a/hw/xtensa/sim.c b/hw/xtensa/sim.c
>> index 946c71cb5b..5cca6a170e 100644
>> --- a/hw/xtensa/sim.c
>> +++ b/hw/xtensa/sim.c
>> @@ -87,9 +87,6 @@ XtensaCPU *xtensa_sim_common_init(MachineState *machine)
>>           xtensa_create_memory_regions(&sysram, "xtensa.sysram",
>>                                        get_system_memory());
>>       }
>> -    if (serial_hd(0)) {
>> -        xtensa_sim_open_console(serial_hd(0));
>> -    }
> 
> I've noticed that with this change '-serial stdio' and its variants are still
> accepted in the command line, but now they do nothing.

Pardon?  They certainly will do something, via writes to the serial hardware.


> This quiet
> change of behavior is unfortunate. I wonder if it would be acceptable
> to map the '-serial stdio' option in the presence of '-semihosting' to
> something like '-chardev stdio,id=id1 -semihosting-config chardev=id1'?

I dunno.  I'm wary of having xtensa be unique here.  Alex, thoughts?

>> +                if (get_user_u32(tv_sec, regs[5]) ||
>> +                    get_user_u32(tv_usec, regs[5])) {
> 
> get_user_u32(tv_usec, regs[5] + 4)?

Oops, yes.

>> -                regs[2] = select(fd + 1,
>> -                                 rq == SELECT_ONE_READ   ? &fdset : NULL,
>> -                                 rq == SELECT_ONE_WRITE  ? &fdset : NULL,
>> -                                 rq == SELECT_ONE_EXCEPT ? &fdset : NULL,
>> -                                 target_tv ? &tv : NULL);
>> -                regs[3] = errno_h2g(errno);
>> +                /* Poll timeout is in milliseconds; overflow to infinity. */
>> +                msec = tv_sec * 1000ull + DIV_ROUND_UP(tv_usec, 1000ull);
>> +                timeout = msec <= INT32_MAX ? msec : -1;
>> +            } else {
>> +                timeout = -1;
>>               }
>> +
>> +            switch (regs[4]) {
>> +            case SELECT_ONE_READ:
>> +                events = G_IO_IN;
>> +                break;
>> +            case SELECT_ONE_WRITE:
>> +                events = G_IO_OUT;
>> +                break;
>> +            case SELECT_ONE_EXCEPT:
>> +                events = G_IO_PRI;
>> +                break;
>> +            default:
>> +                xtensa_cb(cs, -1, EINVAL);
> 
> This doesn't match what there used to be: it was possible to call
> select_one with rq other than SELECT_ONE_* and that would've
> passed NULL for all fd sets in the select invocation turning it into
> a sleep. It would return 0 after the timeout.

Hmm.  Is there any documentation of what it was *supposed* to do?  Passing rq == 
0xdeadbeef and expecting a specific behaviour seems odd.


r~


