Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D70A4C3A8F
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Feb 2022 01:54:22 +0100 (CET)
Received: from localhost ([::1]:38778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNOsH-00031x-Bv
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 19:54:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNOqF-0000zY-9t
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 19:52:15 -0500
Received: from [2607:f8b0:4864:20::42e] (port=42738
 helo=mail-pf1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nNOqD-00070n-7G
 for qemu-devel@nongnu.org; Thu, 24 Feb 2022 19:52:14 -0500
Received: by mail-pf1-x42e.google.com with SMTP id a5so2496629pfv.9
 for <qemu-devel@nongnu.org>; Thu, 24 Feb 2022 16:52:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=cTTO40/5l4nSdfZ/borcRdOdo8z5YzJTTd3GlvmcCbI=;
 b=ywFLDWcwXdUDw/3Jl6yegR8O0hVwQvQyM//a86AwisK24C6J9l7t6OLsJJrZ4gZXry
 mJgjWOEuk6MHS4529V1zeU36zjnq1STsVIYcaS3jOf+UJy0kiMAX50XzYmbAzuPPTU9p
 cvjUb65L7URA8VtNSNCMUHg68KkGTu//VZ6KCKwMrMsfJjufj/YtsXtLDue+yCIIssYJ
 2HIdqrRDq/9cvpK6QzQAJpBySP3gzgy17xiXIgZZoBQPVq+yrWPXCG3F0D06ayApfQu7
 5ZYihuCoEFJzW6CsOcaPoURt30v3SThD6hHuNoUDJ3+U0BapgMrb0QaKd9X+/o9UTAT0
 0Bvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=cTTO40/5l4nSdfZ/borcRdOdo8z5YzJTTd3GlvmcCbI=;
 b=AzPkFIQsLW0KtacR8l70UnG/F6uMCDLrCxeDI6giPcjxtD0rsmdeDHFkTeS71xdbyi
 ASS2Xd/gFjV/k1Hpjvicz3yln+9WGv+4Bmv1kmFns0cC9gBw0yF3o6XEJtEPGWylhkhO
 gHi+TmU8LcLtZ6dBwQJjO5a7Kp7MMyt69DUE2uZuEDyY9PSPAdTkHeEYJlvn4FbRbZdU
 1JJ4u6Yvydt1xK0Ksx8PmgXoNxjL3oib+VJk4FSATJi1Pq8NwruC87jSQVqwX+qDf7+T
 2keGo6wRhiQDFJKxw47Brg3zb8TYI/DD/aIWX/X+xWuHxTUQNvFuPAoSHbtb8BqHdrLM
 xl4g==
X-Gm-Message-State: AOAM530K0XLKPTcYQOsGLKxkPakdkwzIz6eoBd56CwsXG942SqjWkir3
 Hl+A846wI98N7PwcPb/9dFf0EQ==
X-Google-Smtp-Source: ABdhPJy+TArMoT6eAec4m4rHyejs+3Dk0iqim5U2Vp8woNzlFLAg6Xpj62ChEzrvd8iAo8xlCHKMtg==
X-Received: by 2002:a62:7e06:0:b0:4e0:f0f8:9b86 with SMTP id
 z6-20020a627e06000000b004e0f0f89b86mr5445697pfc.26.1645750331308; 
 Thu, 24 Feb 2022 16:52:11 -0800 (PST)
Received: from [192.168.4.112] (cpe-50-113-46-110.hawaii.res.rr.com.
 [50.113.46.110]) by smtp.gmail.com with ESMTPSA id
 k7-20020a63ff07000000b00372dc67e854sm644517pgi.14.2022.02.24.16.52.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 24 Feb 2022 16:52:10 -0800 (PST)
Message-ID: <5ec03bd3-f077-83cc-7fb1-fcfa4b991668@linaro.org>
Date: Thu, 24 Feb 2022 14:52:07 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] accel/tcg/cpu-exec: fix precise single-stepping after
 interrupt
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
To: Luc Michel <lmichel@kalray.eu>, qemu-devel@nongnu.org
References: <20220214132656.11397-1-lmichel@kalray.eu>
 <cf2e9636-5824-d96d-9a4f-60c677edbbbe@linaro.org>
In-Reply-To: <cf2e9636-5824-d96d-9a4f-60c677edbbbe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/24/22 14:23, Richard Henderson wrote:
> On 2/14/22 03:26, Luc Michel wrote:
>> In some cases, cpu->exit_request can be false after handling the
>> interrupt, leading to another TB being executed instead of returning
>> to the main loop.
>>
>> Fix this by returning true unconditionally when in single-step mode.
>>
>> Fixes: ba3c35d9c4026361fd380b269dc6def9510b7166
>>
>> Signed-off-by: Luc Michel <lmichel@kalray.eu>
>> ---
>> Coming back on this issue I worked on with Richard in 2020. The issue is
>> that when debugging the guest with GDB, the first instruction of the IRQ
>> handler is missed by GDB (it's still executed though).
>>
>> It happened to me again in TCG RR mode (but not in MTTCG). It seems that
>> cpu->exit_request can be false in RR mode when returning from
>> cc->tcg_ops->cpu_exec_interrupt, leading to cpu_handle_interrupt
>> returning false and the next TB being executed, instead of the EXCP_DEBUG
>> being handled.
>> ---
>>   accel/tcg/cpu-exec.c | 10 +++++++---
>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
>> index 8b4cd6c59d..74d7f83f34 100644
>> --- a/accel/tcg/cpu-exec.c
>> +++ b/accel/tcg/cpu-exec.c
>> @@ -796,13 +796,17 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
>>                   /*
>>                    * After processing the interrupt, ensure an EXCP_DEBUG is
>>                    * raised when single-stepping so that GDB doesn't miss the
>>                    * next instruction.
>>                    */
>> -                cpu->exception_index =
>> -                    (cpu->singlestep_enabled ? EXCP_DEBUG : -1);
>> -                *last_tb = NULL;
>> +                if (unlikely(cpu->singlestep_enabled)) {
>> +                    cpu->exception_index = EXCP_DEBUG;
>> +                    return true;
> 
> By returning here, you also need to qemu_mutex_unlock_iothread().
> 
>> +                } else {
> 
> You can remove the else after the return.
> Otherwise this looks good; sorry for the delay.

I'll just fix this up when applying, it's minor enough.

r~

