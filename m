Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18EC23F2087
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 21:23:14 +0200 (CEST)
Received: from localhost ([::1]:36356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGndB-0002cR-5i
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 15:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGnc5-0001wJ-49
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:22:05 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:40467)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGnc1-0005cp-35
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 15:22:04 -0400
Received: by mail-pl1-x636.google.com with SMTP id c4so4497826plh.7
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 12:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R9xBBmvbUJI7eBfYOUTob0g/Iq7NHZ0X9YqXHweHSP8=;
 b=a78+AkUj1NRgBGOGdIkti6NpNK2OzaZa81G8Up5I1fF85adRMOMGy666dCHFfQGAc0
 7Jq7ZLMFerGaJgtdhFhZIc/Bk2/mMOXXZALpm+AYCSmTa2f6MmcXekLiohhr0gI2BD9B
 9rXfu17JgpMxYwfIYd62PqloJdPSy1OjyzFsOnlY3OeQUbkRoUE2X6AuzQLQGm/thqX+
 ZaC/3mS2uXOq0T/cZLu8t7kO3VkCktLUNL0FDiWCsTCHcRxdx9Ataba4jfrq5zYnEUxK
 x9gy9eHxzeTtscn7Li3HKnECxEWtFrYeYAZkduBjjv/uHDMDBJlD6oa0Vj7bba/L6xZS
 pAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=R9xBBmvbUJI7eBfYOUTob0g/Iq7NHZ0X9YqXHweHSP8=;
 b=o+EPdUHuMnc2bDA1VxlI+XOha+fXCcW2d79Bp6Vo9/8O4KIRG0Wdsbh4qvFQIrmvBE
 1ISwkdOTghN1zl9kyXMkoE6dkp7rM7BjSGbYz3Uxv/E6fqH3XZGPbqAQlaFdgcGyQl/r
 nICoaAc0WE2QJ36lmMbK1EI4sRJk1e0wB2qJ2mdNYT+ei02ZrIbvWMhRq6lH1SSse5cf
 Mq6U3kWvtfIaWZQZQifJRVy6roscG3JxHlZv+LXpp6IGkuGDztGtWCXqUSB4t78J65xv
 fuY26YzPdaXVaD+5kLmVd/Y98WnfgyfGA6W6KXKj9ZMTN7VgIioAO8r6CeanTWFVjgS7
 sTDQ==
X-Gm-Message-State: AOAM533M+G8rZa9ra63lINZwlnGaFLenE9DfpegKn8OQmo7XmWD81SJY
 AiWdmEi5PndxNrdcgcr+nLl0dg==
X-Google-Smtp-Source: ABdhPJwMygRcUiNrL0lbw3GerRFI5HjEGUT9XGO7gcOAD0z4XN63WAsVdNBRp4poej4fUnoltvEI7Q==
X-Received: by 2002:a17:90a:a389:: with SMTP id
 x9mr277948pjp.167.1629400919078; 
 Thu, 19 Aug 2021 12:21:59 -0700 (PDT)
Received: from [192.168.3.43] ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id r17sm5410329pgu.8.2021.08.19.12.21.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 12:21:58 -0700 (PDT)
Subject: Re: [PATCH v3 15/66] target/sh4: Implement do_unaligned_access for
 user-only
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
 <20210818191920.390759-16-richard.henderson@linaro.org>
 <CAFEAcA_NWeFVSMoRLKPQKTEbwvTEJiY4YuUna5BO7KJX+RtAVg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <755aaec3-d878-68e0-8fe9-1b82276453f7@linaro.org>
Date: Thu, 19 Aug 2021 09:21:55 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_NWeFVSMoRLKPQKTEbwvTEJiY4YuUna5BO7KJX+RtAVg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/19/21 5:46 AM, Peter Maydell wrote:
> On Wed, 18 Aug 2021 at 20:26, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   linux-user/sh4/cpu_loop.c | 8 ++++++++
>>   target/sh4/cpu.c          | 2 +-
>>   target/sh4/op_helper.c    | 3 ---
>>   3 files changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/linux-user/sh4/cpu_loop.c b/linux-user/sh4/cpu_loop.c
>> index 222ed1c670..21d97250a8 100644
>> --- a/linux-user/sh4/cpu_loop.c
>> +++ b/linux-user/sh4/cpu_loop.c
>> @@ -71,6 +71,14 @@ void cpu_loop(CPUSH4State *env)
>>               info._sifields._sigfault._addr = env->tea;
>>               queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>>               break;
>> +        case 0xe0:
>> +        case 0x100:
>> +            info.si_signo = TARGET_SIGBUS;
>> +            info.si_errno = 0;
>> +            info.si_code = TARGET_BUS_ADRALN;
>> +            info._sifields._sigfault._addr = env->tea;
>> +            queue_signal(env, info.si_signo, QEMU_SI_FAULT, &info);
>> +            break;
>>           case EXCP_ATOMIC:
>>               cpu_exec_step_atomic(cs);
>>               arch_interrupt = false;
> 
> Doesn't this have to wait until after the later patches in the
> series that implement the "actually don't worry about alignment
> on most sh4 load/stores" ?

Hmm.  I don't think that helps.  The only thing that delaying this patch would do is hit 
the assert in cpu_unaligned_access() due to an alignment fault occurring but not having 
the do_unaligned_access hook set.

I think the real requirement is that the tcg/i386 patch that enforces the alignment is 
delayed until after all of the prctl patches.


r~

