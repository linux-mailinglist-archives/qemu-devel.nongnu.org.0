Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18343F9C14
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 18:06:28 +0200 (CEST)
Received: from localhost ([::1]:32828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJeN9-0002ot-Hm
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 12:06:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJeHI-0003PG-Vx
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:00:26 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:40599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mJeHH-0006gH-4b
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 12:00:24 -0400
Received: by mail-wr1-x435.google.com with SMTP id t15so4954152wrg.7
 for <qemu-devel@nongnu.org>; Fri, 27 Aug 2021 09:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RfJ6MjPIX/WaO0jb8mm/roXBg+YQMjKNmoWp8O8MdM4=;
 b=mLj1tN6eoe/k9Wjp3pKu3Ec8jdTTZn/OJvv4969PDqz9+rsNUms7K0tn/8WhxVM7Qq
 oD4yaimQW7054jW8rqsQf0ule/+p3RSqVY4RPeaWvUB+z6A7s5pW5h/CWGryaqNVLu0W
 Q7MmOEYbTuNuaMGjLdoWDwJj7wbTXgzcHa3ojbeJvytgYMdaD9wHNwPBgJduQLE2xpKZ
 pP9Eq+NyU1UOfcVjBxXL+IO7YZ1+zeGlx8XrxiQ32RxDB9L03o0axeMBSbevtwCV/Ydc
 YdIoUi4upzQTm0o6QVihyN6KzIvtajBEhHXHWuzjSLMOjO0q8WL+ys30Ag2zoIT2o6R2
 Pehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RfJ6MjPIX/WaO0jb8mm/roXBg+YQMjKNmoWp8O8MdM4=;
 b=CgPKF22Atx+wLxkweTJtr3JtTSUlsRC7dWrVSryIcBAfMJOABX9UspPR2rdoo832Bc
 tGYbTmZ93puyXiHLoQCgg+ZH0VYYqtyaLV23NniKM0/A+g/oeufsVCPWzIOFWsqAq3bL
 esVVlQbg4XCxnMMIC1IdHQYCDTPH0EgP9/W3OIUmYLQRfbBY4+ARRoIDdVHIDM519fqo
 Au0BnWCmzyI02ZY2lb367pwudiT0dRkKF7Y7h0L3Zbc7dQKGjncVni/FtZrgKoBUEkSn
 E8k5xz7y2FGn/ocb/EB3TAJt1QqSxaKDgnWw4IGGBDEsvS930NYUwDrON8aAcM+txhMY
 DVKA==
X-Gm-Message-State: AOAM530lQtljRb/kIErszhPawYVzcWxcLq50LKLPHBTX7EmzYbjjjFQV
 uaF3fIUTkyfVQPId1oO2WOk=
X-Google-Smtp-Source: ABdhPJxRO9AGeQvfI0u79rz4o5NAHVGEiw0VydLh5UJK3WfhkgNzR0s74TEsY5RRFWDfjMC/OTt6Zg==
X-Received: by 2002:a5d:6149:: with SMTP id y9mr11380024wrt.162.1630080021526; 
 Fri, 27 Aug 2021 09:00:21 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id z2sm6011007wma.45.2021.08.27.09.00.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Aug 2021 09:00:21 -0700 (PDT)
Subject: Re: [PATCH v2 41/43] bsd-user: Implement cpu_copy() helper routine
To: Warner Losh <wlosh@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
 <20210826211201.98877-42-imp@bsdimp.com>
 <f76e5319-6f95-4765-cac7-ad945b52f662@amsat.org>
 <E0A580FD-61B8-4889-A7F6-778E1848773F@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <75787713-74e2-db26-26d1-83f5118c5546@amsat.org>
Date: Fri, 27 Aug 2021 18:00:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <E0A580FD-61B8-4889-A7F6-778E1848773F@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.437,
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
Cc: Stacey Son <sson@FreeBSD.org>, Justin Hibbits <chmeeedalf@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/27/21 4:56 PM, Warner Losh wrote:
>> On Aug 26, 2021, at 10:47 PM, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>
>> On 8/26/21 11:11 PM, imp@bsdimp.com wrote:
>>> From: Warner Losh <imp@FreeBSD.org>
>>>
>>> cpu_copy shouldbe called when processes are creating new threads. It
>>
>> Typo "should be"
>>
>>> copies the current state of the CPU to a new cpu state needed for the
>>> new thread.
>>>
>>> Signed-off-by: Stacey Son <sson@FreeBSD.org>
>>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>>> Signed-off-by: Justin Hibbits <chmeeedalf@gmail.com>
>>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>>> ---
>>> bsd-user/main.c | 30 ++++++++++++++++++++++++++++++
>>> 1 file changed, 30 insertions(+)
>>>
>>> diff --git a/bsd-user/main.c b/bsd-user/main.c
>>> index e2ed9e32ba..b35bcf4d1e 100644
>>> --- a/bsd-user/main.c
>>> +++ b/bsd-user/main.c
>>> @@ -180,6 +180,36 @@ void init_task_state(TaskState *ts)
>>>     ts->sigqueue_table[i].next = NULL;
>>> }
>>>
>>> +CPUArchState *cpu_copy(CPUArchState *env)
>>> +{
>>> +    CPUState *cpu = env_cpu(env);
>>> +    CPUState *new_cpu = cpu_create(cpu_type);
>>> +    CPUArchState *new_env = new_cpu->env_ptr;
>>> +    CPUBreakpoint *bp;
>>> +    CPUWatchpoint *wp;
>>> +
>>> +    /* Reset non arch specific state */
>>> +    cpu_reset(new_cpu);
>>> +
>>> +    memcpy(new_env, env, sizeof(CPUArchState));
>>> +
>>> +    /*
>>> +     * Clone all break/watchpoints.
>>> +     * Note: Once we support ptrace with hw-debug register access, make sure
>>> +     * BP_CPU break/watchpoints are handled correctly on clone.
>>> +     */
>>> +    QTAILQ_INIT(&cpu->breakpoints);
>>> +    QTAILQ_INIT(&cpu->watchpoints);
>>> +    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
>>> +        cpu_breakpoint_insert(new_cpu, bp->pc, bp->flags, NULL);
>>> +    }
>>> +    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
>>> +        cpu_watchpoint_insert(new_cpu, wp->vaddr, wp->len, wp->flags, NULL);
>>> +    }
>>> +
>>> +    return new_env;
>>> +}
>>
>> But where is it called?
> 
> It’s in the bsd-user fork’d proc code:
> 
> https://github.com/qemu-bsd-user/qemu-bsd-user/blob/079d45942db8d1038806cb459992b4f016b52b51/bsd-user/freebsd/os-thread.c#L1566
> 
> Is where it’s called from. I wanted to get it out of the way in this review since I was trying to get all the changes to main.c done, but if you’d like, I can drop it and submit in the next round.

Better keep it for next round :)

