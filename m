Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16447345DE8
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:17:08 +0100 (CET)
Received: from localhost ([::1]:36986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOfy7-00019I-4C
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:17:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOfw7-0000Bn-E1
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:15:03 -0400
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729]:35621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lOfw5-0007Te-K8
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:15:03 -0400
Received: by mail-qk1-x729.google.com with SMTP id i9so13986616qka.2
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 05:15:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qpAc1cZRKeggjUa59u5E7WdUsGVmZXnJVG1+ZckYEKQ=;
 b=nHP4I1r4noxVQ6dSjcYixmqYV9lSBJ8vanBgkuL3Llvnb5nO1EJYQAxmAvP9t7VBGD
 idq2g2EYzLhgPBofIO6zG8LbPbCaFGLRwyOLTK8X841lhO8aawtQE/pxk0L1m/YbzArQ
 /KhIxrI0yumm7goTATMvBU3zEQMcFD37Gx2/3RsYXKVONB+YcT0gu0atf0bYJKd9AA+p
 L+twdJnd4yYi/CMAZGHjU28uj8HbItk1XYGkcjtuAU9L6ITczZAyDe0sOrn34BNsS+Pt
 ZWA6cLdVV8iO6wJ1Ykm6ZWOdM+oEOjzM884X1L/1kCUEl7XdvAALwovaUhc2031TkYpJ
 xFKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qpAc1cZRKeggjUa59u5E7WdUsGVmZXnJVG1+ZckYEKQ=;
 b=l9d2mz0vK28ghwYnh5ae0HRiGfS01KVuXBVzngxnrEGGEZy8MkxODBrjSusfIgPRdP
 rYm4zO2YAeY1kCxRsUGCYCWMMmmKN3kICg5W4yctGn3cG5iudCmv8IqFdzJyAKa5nmQ8
 kgeB7vDY+P9F2p6I2sdX4kX1scYVvbD1fW15uG9W5XWiuph2/g+nN1pkemStO+xN9Uu/
 CKFzXtWlrtkZCwg8FBDL+o9P/D0e1Xds+9btK9QC38ZIg4y6btXew2f0KoYBymzKBqfl
 hNgILX87eMs0pLVZG/uiI8xTAVVyz/9/zIP3npazzc1isO5myEtipC+TvjkTxPgNj2Ua
 pSvQ==
X-Gm-Message-State: AOAM533eAIztoFO6ve48rvM7u+bLAtl6Kw8egVCnFRF5Etb1oGcPlDV8
 l0wiRrD1VhRoTo0vFyFbchbyXEf11xkGHSu0
X-Google-Smtp-Source: ABdhPJzIBQWrRqoFtYWl3wczeCqDXpMwxm3HK/++ruIa9/XMDljWdQzLEVboB7F5E2CprxHTirPSrw==
X-Received: by 2002:a05:620a:142b:: with SMTP id
 k11mr4924209qkj.46.1616501700251; 
 Tue, 23 Mar 2021 05:15:00 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id r17sm10662388qtx.62.2021.03.23.05.14.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 05:14:59 -0700 (PDT)
Subject: Re: [PATCH] i386/cpu_dump: support AVX512 ZMM regs dump
To: Robert Hoo <robert.hu@linux.intel.com>, pbonzini@redhat.com,
 ehabkost@redhat.com
References: <1616410796-43167-1-git-send-email-robert.hu@linux.intel.com>
 <6afd2662-d9eb-35c1-4401-6e699c8f861e@linaro.org>
 <705f02a0903fc40d7328b506ebe8517f007a5d9d.camel@linux.intel.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5b016ffe-8e55-df3d-e2f9-fef9452a7e5c@linaro.org>
Date: Tue, 23 Mar 2021 06:14:56 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <705f02a0903fc40d7328b506ebe8517f007a5d9d.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::729;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x729.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 1:00 AM, Robert Hoo wrote:
> On Mon, 2021-03-22 at 15:06 -0600, Richard Henderson wrote:
>> On 3/22/21 4:59 AM, Robert Hoo wrote:
>>> Since commit fa4518741e (target-i386: Rename struct XMMReg to
>>> ZMMReg),
>>> CPUX86State.xmm_regs[] has already been extended to 512bit to
>>> support
>>> AVX512.
>>> Also, other qemu level supports for AVX512 registers are there for
>>> years.
>>> But in x86_cpu_dump_state(), still only dump XMM registers.
>>> This patch is just to complement this part, let it dump ZMM of
>>> 512bits.
>>
>> I think you should examine the state of the cpu to determine what of
>> SSE, AVX
>> or AVX512 is currently enabled, then dump that.
> 
> Thanks Richard for review.
> 
> Uh, looks like the existing code doesn't have this logic yet.
> OK, I'm to add this logic.

Correct.


>>> -        if (env->hflags & HF_CS64_MASK)
>>> -            nb = 16;
>>> -        else
>>> -            nb = 8;
>>> -        for(i=0;i<nb;i++) {
>>> -            qemu_fprintf(f, "XMM%02d=%08x%08x%08x%08x",
>>> +
>>> +        nb = sizeof(env->xmm_regs) / sizeof(env->xmm_regs[0]);
>>
>> E.g., you're dumping all of the registers in 32-bit mode, which is
>> restricted
>> to 8 registers, not 32.
> 
> In typedef struct CPUX86State {
> ...
> ZMMReg xmm_regs[CPU_NB_REGS == 8 ? 8 : 32];
> ...
> }
> 
> where in cpu.h
> 
> #define CPU_NB_REGS64 16
> #define CPU_NB_REGS32 8
> 
> #ifdef TARGET_X86_64
> #define CPU_NB_REGS CPU_NB_REGS64
> #else
> #define CPU_NB_REGS CPU_NB_REGS32
> #endif
> 
> so the register number is 8 in 32-bit mode and 32 in 64-bit mode.

The array size is the maximum.  But of course a 64-bit cpu can be put into 
32-bit mode.  You removed the exact check for that, using HF_CS64_MASK, quoted 
above.


r~

