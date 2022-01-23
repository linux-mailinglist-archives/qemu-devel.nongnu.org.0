Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4914975E6
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Jan 2022 23:09:21 +0100 (CET)
Received: from localhost ([::1]:55138 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nBl32-0001Kp-FL
	for lists+qemu-devel@lfdr.de; Sun, 23 Jan 2022 17:09:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBl1Z-0000eU-OI
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 17:07:49 -0500
Received: from [2607:f8b0:4864:20::102c] (port=46772
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nBl1X-0006uX-UU
 for qemu-devel@nongnu.org; Sun, 23 Jan 2022 17:07:49 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 n16-20020a17090a091000b001b46196d572so14609338pjn.5
 for <qemu-devel@nongnu.org>; Sun, 23 Jan 2022 14:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=x8gfxpHCVi88+nTl3zB3jdoWjYaTe0x1R+O28d+M4yE=;
 b=S/4o1VGN8NzzMhXzBAPeYPjkgsLl0IwtwzCTirQfzN/SFhFpVrzvRa4VqGEN0UZa4o
 gV6Jwmqch8YFWjPs45j63uPZJOzTjUFg2IEfwR1Qgm3x1pa8/MB8iRg9QfUB4b6myWio
 JNRiLuZOa2dFAGbSMMMvdzuu4QmgeB+gxx5hAsRpFSy/rgaJ9xp38+HG6Q56yLzCJpJA
 T3aji23QAJGLHsKzBDjFiYaxRIGxlIazFunryh+S6naCCl3W97K/yzrmvb0lDbSb88pu
 xVrZyJxEGEUO31Qy++Xy0jfRv6dilv2Go/otpErle8RFeB7k5L2LLGP4tbz6t0e9yHN6
 8JlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=x8gfxpHCVi88+nTl3zB3jdoWjYaTe0x1R+O28d+M4yE=;
 b=QZ01gupE7YbaGs54UtMLdGcfz+hJyFSyOWd3NtAyEHMoHnRfB8G1wBrddzxB1rCKVX
 x+btcPTEz6wLiXkF3xuEIIqithsKo2XGHHzFHneYIfpAXQ+w93eQSMn4FTrT0/Fc0GXG
 ioLJucCWOoijFttV1Nj1Gez677gzvFRy+93LHNFgT3y0uhC+Rsv9arRfZ/cGtzEKolMe
 Sf1PzIrr3hcyH14ZkQgdwsj+gBSC+/Y8ViVIDHj6HMmhrQyoP+JACvqP28t+HyAtTsvo
 P7DLs5kfLOxIrfPnQTBkkPwQ+E+Y+uiuGaaVON4U/7eIOBSsnkcO8kLJ8n4P0mtE2204
 V+mg==
X-Gm-Message-State: AOAM530lEO0JVvwKlBK067mEmvrQB0eW3/sQ1cTTiZF1KPObRiLUO90P
 11oDdEH23KPDUc/X3Hj56ZLqtV6mK1+cPK1r
X-Google-Smtp-Source: ABdhPJzO53aqId+E3n1WnuNQoRC5qZAfAuGPF2wxxgi+7zBjvc2bwP2+acgpjM5jh7GRQ+vgJexyuQ==
X-Received: by 2002:a17:90a:9f81:: with SMTP id
 o1mr10299880pjp.240.1642975666472; 
 Sun, 23 Jan 2022 14:07:46 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id mj23sm11076047pjb.54.2022.01.23.14.07.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 23 Jan 2022 14:07:46 -0800 (PST)
Subject: Re: [PATCH 07/30] bsd-user/arm/target_arch_cpu.h: Use force_sig_fault
 for EXCP_UDEF
To: Peter Maydell <peter.maydell@linaro.org>, Warner Losh <imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
 <20220109161923.85683-8-imp@bsdimp.com>
 <CAFEAcA_VD_8SJ91ri5RXdOJj0GLjKHXoEFguYaV1ohbO8TzjxA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <aa03d1a6-043e-59ae-afd0-1018fc150c25@linaro.org>
Date: Mon, 24 Jan 2022 09:07:39 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_VD_8SJ91ri5RXdOJj0GLjKHXoEFguYaV1ohbO8TzjxA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/14/22 4:19 AM, Peter Maydell wrote:
> On Sun, 9 Jan 2022 at 16:27, Warner Losh <imp@bsdimp.com> wrote:
>>
>> Use force_sig_fault to implement unknown opcode. This just uninlines
>> that function, so simplify things by using it. Fold in EXCP_NOCP and
>> EXCP_INVSTATE, as is done in linux-user.
>>
>> Signed-off-by: Warner Losh <imp@bsdimp.com>
>> ---
>>   bsd-user/arm/target_arch_cpu.h | 18 ++++++------------
>>   1 file changed, 6 insertions(+), 12 deletions(-)
>>
>> diff --git a/bsd-user/arm/target_arch_cpu.h b/bsd-user/arm/target_arch_cpu.h
>> index 905f13aa1b9..996a361e3fe 100644
>> --- a/bsd-user/arm/target_arch_cpu.h
>> +++ b/bsd-user/arm/target_arch_cpu.h
>> @@ -51,18 +51,12 @@ static inline void target_cpu_loop(CPUARMState *env)
>>           process_queued_cpu_work(cs);
>>           switch (trapnr) {
>>           case EXCP_UDEF:
>> -            {
>> -                /* See arm/arm/undefined.c undefinedinstruction(); */
>> -                info.si_addr = env->regs[15];
>> -
>> -                /* illegal instruction */
>> -                info.si_signo = TARGET_SIGILL;
>> -                info.si_errno = 0;
>> -                info.si_code = TARGET_ILL_ILLOPC;
>> -                queue_signal(env, info.si_signo, &info);
>> -
>> -                /* TODO: What about instruction emulation? */
>> -            }
>> +        case EXCP_NOCP:
>> +        case EXCP_INVSTATE:
>> +            /*
>> +             * See arm/arm/undefined.c undefinedinstruction();
>> +             */
>> +            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->regs[15]);
>>               break;
> 
> Do you want to keep the TODO comment ?
> 
> Either way,
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> 
> (Looks like FreeBSD sends SIGILL/ILL_ILLADR for UNDEF where the PC
> is misaligned and we're not in Thumb mode, but that's a pretty oddball
> corner case so not really worth emulating.)

For qemu, that case will never happen: we'll raise EXCP_PREFETCH_ABORT with fsr=1 
(Alignment).  The freebsd kernel might have this code because the behaviour with real hw 
is CONSTRAINED UNPREDICTABLE (iirc).

Anyway,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

