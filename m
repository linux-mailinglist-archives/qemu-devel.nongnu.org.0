Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 876D330DD3C
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 15:51:14 +0100 (CET)
Received: from localhost ([::1]:54342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7JUv-0007eE-JB
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 09:51:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7JS7-0005p9-RZ
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:48:19 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:43501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l7JS6-00033V-0r
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 09:48:19 -0500
Received: by mail-ed1-x52d.google.com with SMTP id i5so4982953edu.10
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 06:48:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=N6O8qYTxEzGo3fUj8qfEE6rAJdUBPzeLnjHAOnz/Yss=;
 b=gPIr9PMy5rXpT1Wnc/nsbIXvdF9/mSfilu/S0PD/k0qM6AYqBY14Nz53h2TJgNdHcX
 JvEzsEnOb6Sob2Vt+LFWY3PCyke5csxCV3t1LsaDyykPMjHNFMSgt4rseoUKzI0hFNGc
 ccSn3mCfVh+CskM70Ku9OPJm7ckAzkasDyJSTX841GFJT0ROXLf4ocQXzvvl1Z6Kj92u
 FY3E5KHXhdF/BOpSvCta0cfhsfuM2t4RUS1nzpKkKAJGFxCo147SUA0rqdfPq/vJ4ZVJ
 6wsmUnAD6qsj5itehApR7l4WSjvJ9E6Du7cQoCh7agcKmr83DSKD50TkWsN15SdLcj8A
 FY4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N6O8qYTxEzGo3fUj8qfEE6rAJdUBPzeLnjHAOnz/Yss=;
 b=i+vchzsihnkiLblEOa+mqny/H63VW6xlR+Cu1yOgBbLEQxVfHm1F+MP2+gEwr2A+8O
 K/wiZh3zCwkEelGIH8CVG2Ga5+ZEXwWSrtkeTq9068MPscpl73klmo4tEKGC1SiXx4j8
 LlzFSopouWoz9d9hPI/1zH0t2vmgegEplSwmQm3KbR5wPLBX2Z+Kz+WauvlZy507cg/U
 MO1FiIvdXEJN5KUIae/C0Ig8nwGcP9oDZ+dpAVmAXKSkv7NGLofylOdRdkbwmuFscwt+
 O4XFRDiiTSDbe9QCxH0EOTzl9BwSq1M1bgBZ38ILKUCI/0BXnS9wWvwrjypnbxMqK/63
 UaHw==
X-Gm-Message-State: AOAM532vpj4lNHGi3SzmOLPnk4hg9SxSpn+ZQ4J0sJLbOVNjyy9Q8Y+z
 cBfbNojYUuvF6WLadJUAi5agUbhP8eM=
X-Google-Smtp-Source: ABdhPJyrJIBJTDv45Yv3cKeb74qJK3Z8RW7+fB287Q9+Ec4w9FQHCfLqbai/6VLcvb4k0mfu4B/QBQ==
X-Received: by 2002:a50:b0c1:: with SMTP id j59mr2908659edd.141.1612363695302; 
 Wed, 03 Feb 2021 06:48:15 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id dm6sm1048994ejc.32.2021.02.03.06.48.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Feb 2021 06:48:14 -0800 (PST)
Subject: Re: [PATCH v15 15/23] cpu: tcg_ops: move to tcg-cpu-ops.h, keep a
 pointer in CPUClass
To: Claudio Fontana <cfontana@suse.de>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
References: <20210201100903.17309-1-cfontana@suse.de>
 <20210201100903.17309-16-cfontana@suse.de> <87im79s05m.fsf@linaro.org>
 <df44fbe2-476b-f26d-0117-15dfa153e343@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b9e1f2ce-878c-71f8-c259-a8f1c7835a8c@amsat.org>
Date: Wed, 3 Feb 2021 15:48:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <df44fbe2-476b-f26d-0117-15dfa153e343@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.178,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 3:41 PM, Claudio Fontana wrote:
> On 2/3/21 2:23 PM, Alex Bennée wrote:
>> Claudio Fontana <cfontana@suse.de> writes:
...
>>  /*
>> modified   target/arm/cpu.c
>> @@ -2248,7 +2248,7 @@ static gchar *arm_gdb_arch_name(CPUState *cs)
>>   * NB: cannot be const, as some elements are changed for specific
>>   * arm cpu classes.
>>   */
>> -static struct TCGCPUOps arm_tcg_ops = {
>> +static const struct TCGCPUOps arm_tcg_ops = {
>>      .initialize = arm_translate_init,
>>      .synchronize_from_tb = arm_cpu_synchronize_from_tb,
>>      .cpu_exec_interrupt = arm_cpu_exec_interrupt,
>> --8<---------------cut here---------------end--------------->8---
>>
>> This does later break MIPS jazz:
>>
>> p/hw_mips_jazz.c.o -c ../../hw/mips/jazz.c
>> ../../hw/mips/jazz.c: In function ‘mips_jazz_init’:
>> ../../hw/mips/jazz.c:216:40: error: assignment of member ‘do_transaction_failed’ in read-only object
>>      cc->tcg_ops->do_transaction_failed = mips_jazz_do_transaction_failed;
>>
>> which...
>>
>> <snip>
>>>  
>>> +#ifdef CONFIG_TCG
>>> +#include "hw/core/tcg-cpu-ops.h"
>>> +/*
>>> + * NB: cannot be const, as some elements are changed for specific
>>> + * mips hardware (see hw/mips/jazz.c).
>>> + */
>>
>> does have a valid comment. So guess keep it as static and just don't
>> claim ARM hacks around with it or find a more elegant solution for the
>> Jazz hack (I'm not sure there is one).
> 
> Yep, the ARM claim was true when I started looking at this, but now it's not anymore after the changes.
> 
> However, I haven't found a way to remove the mips jazz hack.
> 
> Maybe Philippe knows?

We need to test the real behavior on real hardware.

Eventually writing the test and asking on linux-mips@vger.kernel.org
if someone can run it?

