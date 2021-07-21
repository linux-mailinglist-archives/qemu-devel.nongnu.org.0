Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ADE83D1456
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 18:43:16 +0200 (CEST)
Received: from localhost ([::1]:38372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6FJT-0006T5-8O
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 12:43:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6FIL-0005OR-So
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:42:05 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6FIJ-0005WE-CD
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 12:42:05 -0400
Received: by mail-pg1-x532.google.com with SMTP id j4so2434203pgk.5
 for <qemu-devel@nongnu.org>; Wed, 21 Jul 2021 09:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gvfXH89jeLxvOomyb9EjtW4HsX8k99veT5XRMiSPshU=;
 b=AqqIs8K4561mD/A2q+lREF3VdyIH7NvyPkJjYgvAzvY2vwmov4QtPTkH5GvVJwqKnS
 T4GdEdqntdIRUmA9EqwaclscdRQfVv+NZoUT2BDvL0JGSpvRCDePtD3nYQKUwgHcG9KA
 /6FN8c9kowM/77sN0N29d2qN7jxkGQSG4PQi3OT8hYMWE+Oh+rnB7K8EzIsk8KOZ8Ye7
 rUfWEnRJ4dlQ73smcfBvQmRz9jkcdW2gYYjlMbD8Zh2Q3CBHVOa1PeMKEB0PtfI2vYyL
 V4JzKrNJ1leMVxSXjJ4HO82eRGaGB5X0ZMVy3X8nAvRDSvEoEk/Q7WYlvpBdehXIFlM2
 gClQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gvfXH89jeLxvOomyb9EjtW4HsX8k99veT5XRMiSPshU=;
 b=pOqhu5GgcqsNWpXr06pMo7Fs/UhexE3ar9ztHLKbDB3pJbbfl3H9kbwhillnaQi6dh
 AvvhubLASqZY8HW76qHzxPVvClyqF6Lh489LT42WYg5rviTFy9071bv/HDMDIvwUdXyf
 jsS0m/CqmY7NhB2k/2kjaUnpfM35CiblkFtMpiU/YTLMQPEkRA40aix5V2uMnqsPrCyY
 FXa6Zavkct8s+fW4ttgf2SlZ07sahVl++lDy9V+X7wtopxK+w9zLqd6srif6bNZZnuOJ
 dQ+EMw6KZO8YPbzL6QyfyV9lB4zwK281Kttu8QYg6CBeTLPX9mypDk4Aw4hFYlx51NBd
 XUfg==
X-Gm-Message-State: AOAM531NwHok2uakTGbRrrIaWJ6g5Tv0izI/Ed48bf4jozAS504vjf4r
 IR0CAai97dgE9CNbO5P2xJdYJg==
X-Google-Smtp-Source: ABdhPJyV+PyOU8dt9qltSlzYXmzgGG3dLZvvJm7TL/zHrM16N1W4n/QYxpacoOh2SVuZLPj3PlZ64g==
X-Received: by 2002:a63:114d:: with SMTP id 13mr37658886pgr.180.1626885721640; 
 Wed, 21 Jul 2021 09:42:01 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id d2sm27763056pfa.84.2021.07.21.09.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 21 Jul 2021 09:42:01 -0700 (PDT)
Subject: Re: [PATCH for-6.1 v6 17/17] accel/tcg: Record singlestep_enabled in
 tb->cflags
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210720195439.626594-1-richard.henderson@linaro.org>
 <20210720195439.626594-18-richard.henderson@linaro.org>
 <878s20kkmv.fsf@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <0c4a0e4d-faf1-3843-edf5-2ae807a33b94@linaro.org>
Date: Wed, 21 Jul 2021 06:41:56 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <878s20kkmv.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x532.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.117,
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 qemu-devel@nongnu.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/21/21 12:38 AM, Alex Bennée wrote:
> 
> Richard Henderson <richard.henderson@linaro.org> writes:
> 
>> Set CF_SINGLE_STEP when single-stepping is enabled.
>> This avoids the need to flush all tb's when turning
>> single-stepping on or off.
>>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   include/exec/exec-all.h   | 1 +
>>   accel/tcg/cpu-exec.c      | 7 ++++++-
>>   accel/tcg/translate-all.c | 4 ----
>>   accel/tcg/translator.c    | 7 +------
>>   cpu.c                     | 4 ----
>>   5 files changed, 8 insertions(+), 15 deletions(-)
>>
>> diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
>> index 6873cce8df..5d1b6d80fb 100644
>> --- a/include/exec/exec-all.h
>> +++ b/include/exec/exec-all.h
>> @@ -497,6 +497,7 @@ struct TranslationBlock {
>>   #define CF_COUNT_MASK    0x000001ff
>>   #define CF_NO_GOTO_TB    0x00000200 /* Do not chain with goto_tb */
>>   #define CF_NO_GOTO_PTR   0x00000400 /* Do not chain with goto_ptr */
>> +#define CF_SINGLE_STEP   0x00000800 /* gdbstub single-step in effect */
>>   #define CF_LAST_IO       0x00008000 /* Last insn may be an IO access.  */
>>   #define CF_MEMI_ONLY     0x00010000 /* Only instrument memory ops */
>>   #define CF_USE_ICOUNT    0x00020000
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 5cc6363f4c..fc895cf51e 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -150,10 +150,15 @@ uint32_t curr_cflags(CPUState *cpu)
>>       uint32_t cflags = cpu->tcg_cflags;
>>   
>>       /*
>> +     * Record gdb single-step.  We should be exiting the TB by raising
>> +     * EXCP_DEBUG, but to simplify other tests, disable chaining too.
>> +     *
>>        * For singlestep and -d nochain, suppress goto_tb so that
>>        * we can log -d cpu,exec after every TB.
>>        */
>> -    if (singlestep) {
>> +    if (unlikely(cpu->singlestep_enabled)) {
>> +        cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | CF_SINGLE_STEP |
>>       1;
> 
> What does CF_SINGLE_STEP achieve that isn't already handled by having:
> 
>    cflags |= CF_NO_GOTO_TB | CF_NO_GOTO_PTR | 1;

It sets DisasContextBase.singlestep_enabled.

With only this patch set, we still check that and emit EXCP_DEBUG at the end of every TB. 
  After the 6.2 singlestep cleanup, we still have one reference to 
DisasContextBase.singlestep_enabled in target/mips for the branch delay slot thing that we 
discussed on IRC yesterday.

> 
> (btw did we mask CF_COUNT_MASK somewhere else?). Because surely the
> CF_COUNT is part of cflags so limits the TB's that could be returned
> anyway?

Here in curr_cflags(), CF_COUNT_MASK begins at zero.


r~

