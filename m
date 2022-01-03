Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 162F84836BD
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 19:21:56 +0100 (CET)
Received: from localhost ([::1]:44372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4Rxz-00014h-7t
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 13:21:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RwL-0008S5-Bq
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 13:20:13 -0500
Received: from [2607:f8b0:4864:20::42b] (port=37572
 helo=mail-pf1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1n4RwI-0002HN-Ld
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 13:20:12 -0500
Received: by mail-pf1-x42b.google.com with SMTP id 8so30123533pfo.4
 for <qemu-devel@nongnu.org>; Mon, 03 Jan 2022 10:20:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=NtPQKe/kGwerFMLIbBtq0vz3KNYNQh6X5ZIff2Nt5+A=;
 b=OYJjkwQjp40q/X5hiiEh6jfj0yZaFR0b+TeWHCbmj4pHJyXIlV8OUY9PMfgkdUU2t/
 XbIDlYfJOyAi+iqLoVmJEITzIPis4+JAg4wqOs7tZvxGRUdmpH7tfGGkSsrKAuf5CR1f
 tNwPlklJs2fDjh7PZ9hiWAoNCTtH4DZHhLKGzTpgppj1FytUacvrxaIJzTA4Jn9JxUS7
 a5KhhTc3K6/x+ubk51MEXFngOQ1sz3z+6mODrXHfnheZVGJU0GrXQYJVAU3NmFupLRM7
 x1AaMdmOeyKdmCcEoErUlCLu823Gptm8J/U245474fp6WwGDUByk+JTlb4zfzZkrVXnc
 X5Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NtPQKe/kGwerFMLIbBtq0vz3KNYNQh6X5ZIff2Nt5+A=;
 b=ADokpPCMmLbPIZ04YYXrzuHUGm7EBMpOJsIR8W2ajxl44uh8/C21xFjr5Hdoj4izfe
 XXJ+mhJIjHvAY7VyHIFTzVaJNnBVCkYEJKBA7ENc1urx+7LzEC14DRoZioVMOXHNGmmW
 pqX/W9TSYideJReLqdeG6OlUqR8qZ4zEEeGkTF4xMPxn566hNqVyjdWEOPTEUqhPQ+DO
 DJ7Jz0NersXKMH8T37U+3H+aIQB0CZM+QEstIgaba0Eo+QB9ZVP/jtmNJk1PMx8f8nXt
 WZF6V/4Wu59ZR3GbX28r/yfWbn6eqjIjjrIoc0LC/DolLk7mxLdqag2l6JEXqm6o7ORy
 EG8Q==
X-Gm-Message-State: AOAM5322udI35AsnrHRjOXzQTK1b173vZoJ/rRuozVsJpEfky/OH2rfr
 ChDpi7oHn+7xnVCy/dO7QYxHGQ==
X-Google-Smtp-Source: ABdhPJyd/ZXAXE1I0jzW6KypM76VCw2VHJWz2BHt2klo58GnKzUeRC7RcFfv+psxpDHvKfxH27NC0Q==
X-Received: by 2002:a63:88c7:: with SMTP id
 l190mr41131512pgd.392.1641234009046; 
 Mon, 03 Jan 2022 10:20:09 -0800 (PST)
Received: from [192.168.1.13] (174-21-75-75.tukw.qwest.net. [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id t5sm31411173pgj.85.2022.01.03.10.20.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Jan 2022 10:20:08 -0800 (PST)
Subject: Re: [PATCH 1/2] linux-user/ppc: deliver SIGTRAP on POWERPC_EXCP_TRAP
To: "Matheus K. Ferst" <matheus.ferst@eldorado.org.br>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org
References: <20220103165625.307309-1-matheus.ferst@eldorado.org.br>
 <20220103165625.307309-2-matheus.ferst@eldorado.org.br>
 <8c606234-2939-e64e-d2d6-ae351e13fede@linaro.org>
 <9fb0237b-d960-348f-f875-261f331d0cbc@eldorado.org.br>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <2f73f73e-b8fb-212c-08fd-4daee3695290@linaro.org>
Date: Mon, 3 Jan 2022 10:20:07 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <9fb0237b-d960-348f-f875-261f331d0cbc@eldorado.org.br>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.354,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: laurent@vivier.eu, groug@kaod.org, danielhb413@gmail.com, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/3/22 10:12 AM, Matheus K. Ferst wrote:
> On 03/01/2022 14:50, Richard Henderson wrote:
>> On 1/3/22 8:56 AM, matheus.ferst@eldorado.org.br wrote:
>>> From: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>>
>>> Handle POWERPC_EXCP_TRAP in cpu_loop to deliver SIGTRAP on tw[i]/td[i].
>>> The si_code comes from do_program_check in the kernel source file
>>> arch/powerpc/kernel/traps.c
>>>
>>> Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
>>> ---
>>>   linux-user/ppc/cpu_loop.c | 4 +++-
>>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/linux-user/ppc/cpu_loop.c b/linux-user/ppc/cpu_loop.c
>>> index 30c82f2354..8fbaa772dc 100644
>>> --- a/linux-user/ppc/cpu_loop.c
>>> +++ b/linux-user/ppc/cpu_loop.c
>>> @@ -242,7 +242,9 @@ void cpu_loop(CPUPPCState *env)
>>>                   }
>>>                   break;
>>>               case POWERPC_EXCP_TRAP:
>>> -                cpu_abort(cs, "Tried to call a TRAP\n");
>>> +                info.si_signo = TARGET_SIGTRAP;
>>> +                info.si_errno = 0;
>>> +                info.si_code = TARGET_TRAP_BRKPT;
>>
>> You're missing the address, which should be nip.
>>
>> https://github.com/torvalds/linux/blob/master/arch/powerpc/kernel/traps.c#L1503
> 
> After this switch-case, there is a
> 
> info._sifields._sigfault._addr = env->nip;
> 
> Is there anything else to be set?

Nope, sorry I missed that.

r~

