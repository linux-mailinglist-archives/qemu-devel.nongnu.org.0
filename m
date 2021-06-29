Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84413B77E0
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 20:32:37 +0200 (CEST)
Received: from localhost ([::1]:33356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyIXE-0005FW-F3
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 14:32:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIVh-0003um-4l
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:31:02 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:46776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyIVa-00039O-Ly
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 14:31:00 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 b5-20020a17090a9905b029016fc06f6c5bso3032386pjp.5
 for <qemu-devel@nongnu.org>; Tue, 29 Jun 2021 11:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/4Zlcxax749CPr7Yxt/Q78CVE4J4Oq0PZXVAeVtHURY=;
 b=rFif3qgT/sWFhsaBtyprELwMpE22JWSxJHYbx+BELBTsDJF8wvF/nq5+SuR31UkTUg
 GqEt1VhbJhpiENMH1TXU+Q7fwh3JoWvkavV9yB85U2uAVQtwgdYNNql4dlcV4BpA54+B
 cAoNobJSZmnFvZEAVtJRq4n29ajBdsC7sxdGSW41Fnz4KXgO2UOF8NfYDEesys7RYX8Y
 iVmEdNB1NaqODvjDaz92yIZ4/AbNdpClhdbt/BS1X20aUyX6MjVuGnKRwNuzRqoBtJ7+
 H1yRX+YKeoUru6Omw6Rc6MgejWwZ/iWYgBf7NIaVdzDnJu/fKnT4lScHB5sz98f6MrLA
 hrlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/4Zlcxax749CPr7Yxt/Q78CVE4J4Oq0PZXVAeVtHURY=;
 b=MSeFk0R1pa8ZuULFZ6w/vYVLYA562tZxXHZvxwXnLbOBtlW5FcJm2NM8DMyQBMoXNz
 D8LSE88gIQJAc2rsxc7L/ang/dX+jss7a2Itxrgg6usu7lVZqNUof85k5CtPhx43262C
 PwB+gfS4rk4LxO+jlq8m7L7Ax8Od1e0sDUOuJhL9goDiy7E8lgNkjMqfrVu2FKYmfya8
 KIgi0WT+H3rxznt5k/QOpkBnsf7Q1zolaMXstxG7vGm7X4+89Fh48EqqQ59xDJM+al/C
 lEE9ABE9IcriU124eGaiPsYuhHr2wNZ4v+jMvOW0RHMnkDbgFVjybTrp+kMvG4TX37HW
 mpzA==
X-Gm-Message-State: AOAM530AxPBaBkxBLtpbOrfu8QRcSw2jbDSY5mO0g6gsZMi+QNDx67YQ
 QBiYTj7afwILWeIZe//f/fJhRw==
X-Google-Smtp-Source: ABdhPJz+YDleD2K28Em6ox8Di4Z4Uws6nvUxnH59rRUdF2NeYQExzlvpV86vycaHfLP2WU15ruMTCw==
X-Received: by 2002:a17:90a:5d10:: with SMTP id
 s16mr187670pji.161.1624991453019; 
 Tue, 29 Jun 2021 11:30:53 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id 188sm18955421pfx.127.2021.06.29.11.30.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 29 Jun 2021 11:30:41 -0700 (PDT)
Subject: Re: [PATCH v2 10/23] linux-user/i386: Implement setup_sigtramp
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210618192951.125651-1-richard.henderson@linaro.org>
 <20210618192951.125651-11-richard.henderson@linaro.org>
 <CAFEAcA9SZmnxcN48_JEcfkSyUDhngcW0Z34DquMpjAaHyPm-cA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <87b1a4c4-ec7f-d4cd-8e7f-ab4aa8d33d0e@linaro.org>
Date: Tue, 29 Jun 2021 11:30:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9SZmnxcN48_JEcfkSyUDhngcW0Z34DquMpjAaHyPm-cA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
 QEMU Developers <qemu-devel@nongnu.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/29/21 7:40 AM, Peter Maydell wrote:
> On Fri, 18 Jun 2021 at 20:38, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Create and record the two signal trampolines.
>> Use them when the guest does not use SA_RESTORER.
>> Note that x86_64 does not use this code.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/i386/target_signal.h   |  2 ++
>>   linux-user/x86_64/target_signal.h |  3 +++
>>   linux-user/i386/signal.c          | 42 ++++++++++++++++++-------------
>>   3 files changed, 29 insertions(+), 18 deletions(-)
>>
>> diff --git a/linux-user/i386/target_signal.h b/linux-user/i386/target_signal.h
>> index 50361af874..64d09f2e75 100644
>> --- a/linux-user/i386/target_signal.h
>> +++ b/linux-user/i386/target_signal.h
>> @@ -22,4 +22,6 @@ typedef struct target_sigaltstack {
>>   #include "../generic/signal.h"
>>
>>   #define TARGET_ARCH_HAS_SETUP_FRAME
>> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 1
>> +
>>   #endif /* I386_TARGET_SIGNAL_H */
>> diff --git a/linux-user/x86_64/target_signal.h b/linux-user/x86_64/target_signal.h
>> index 4ea74f20dd..4673c5a886 100644
>> --- a/linux-user/x86_64/target_signal.h
>> +++ b/linux-user/x86_64/target_signal.h
>> @@ -21,4 +21,7 @@ typedef struct target_sigaltstack {
>>
>>   #include "../generic/signal.h"
>>
>> +/* For x86_64, use of SA_RESTORER is mandatory. */
>> +#define TARGET_ARCH_HAS_SIGTRAMP_PAGE 0
>> +
>>   #endif /* X86_64_TARGET_SIGNAL_H */
>> diff --git a/linux-user/i386/signal.c b/linux-user/i386/signal.c
>> index 8701774e37..a83ecba54f 100644
>> --- a/linux-user/i386/signal.c
>> +++ b/linux-user/i386/signal.c
>> @@ -337,16 +337,7 @@ void setup_frame(int sig, struct target_sigaction *ka,
>>       if (ka->sa_flags & TARGET_SA_RESTORER) {
>>           __put_user(ka->sa_restorer, &frame->pretcode);
>>       } else {
>> -        uint16_t val16;
>> -        abi_ulong retcode_addr;
>> -        retcode_addr = frame_addr + offsetof(struct sigframe, retcode);
>> -        __put_user(retcode_addr, &frame->pretcode);
>> -        /* This is popl %eax ; movl $,%eax ; int $0x80 */
>> -        val16 = 0xb858;
>> -        __put_user(val16, (uint16_t *)(frame->retcode+0));
>> -        __put_user(TARGET_NR_sigreturn, (int *)(frame->retcode+2));
>> -        val16 = 0x80cd;
>> -        __put_user(val16, (uint16_t *)(frame->retcode+6));
>> +        __put_user(default_sigreturn, &frame->pretcode);
>>
> 
> In the kernel in arch/x86/kernel/signal.c there is a comment:
> 
>          /*
>           * This is popl %eax ; movl $__NR_sigreturn, %eax ; int $0x80
>           *
>           * WE DO NOT USE IT ANY MORE! It's only left here for historical
>           * reasons and because gdb uses it as a signature to notice
>           * signal handler stack frames.
>           */
> 
> which suggests that we also should continue to fill in the
> retcode bytes in the signal frame for gdb's benefit even though
> we don't actually execute them any more.

Point.  I noticed the same for several other targets, but didn't actually look at the 
kernel code for i386.


r~

