Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F131364A3FF
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 16:18:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4kYT-00068q-Jg; Mon, 12 Dec 2022 10:17:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p4kYJ-00067R-Jb
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:17:11 -0500
Received: from mail-oa1-x36.google.com ([2001:4860:4864:20::36])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <groeck7@gmail.com>) id 1p4kYH-0003DU-OD
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 10:17:11 -0500
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1433ef3b61fso8696034fac.10
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 07:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date:message-id:reply-to;
 bh=cINKPtgt2p2sS7Bsd5DDbc2XXSyc8hSOkUAE981tAv4=;
 b=g6R3xnTgtyV94FxHt6X7+/N5BIloSAdvmJ8k/oBqneNJjx6qyej4QASrTYhuQuGDoN
 50G4zNdDVGnYDC11BnbPFaRfinE33iY1kGX8Umkn9ycT5R0Cv6Vx9TK03EBMgBuqVMfJ
 KSu5bHy0xRl7rKfUt/6tNgNpAzyb4RKxWOhQHsGZMNNKIVTGYVnP8ySwj91OX3EQwC73
 MgrSl1VNTUauzlaLe9wddBdMfiI0Uf3P3yoPAW1YjYDJZRF7dIsYHAwkW+E+OlsU81Dw
 BbaVJOHe+Hy+BSJR+FCJPMcePew0pX8fv/f3p9n8PWgX6uPlodjqe9FJkZ7TkmB76dF3
 Pb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cINKPtgt2p2sS7Bsd5DDbc2XXSyc8hSOkUAE981tAv4=;
 b=5DD1x++v5PMLZHby32aW5uVQS9L7aJoMnPZp0aC9Yqiu7ZjkGgG8pSfD119xMcxWqA
 uhsAaylYdHCHMbIvLd1hB8s2OHm3bkCV5PkaVLYBT97Hhv4A2gX4ZZhdt2AI1rE5Ic6B
 duYBaFkwdb0cgViVPLN8WdUzIknE5AtnluQfYJ6Cgh4v8CbganwysX3RFOdDHI83k9ZP
 g5rH1f+mKFzAm11CwexW05Y1Md6/WkreMfWbJTZuhlGnuTUbKHJQoNK83HoLRkMj2rHk
 L0WucU0qgu5dORpCFQba2CS9pRs0CFgMpXr0ohki6vLWsaoc+nW+J8JXOeVl8Z98yBV1
 p0qQ==
X-Gm-Message-State: ANoB5pmjOPCU02YAnPibVTa3/oKQjzM/ef/kLfoNA00vyNJf1LtfH8ua
 o0/gZX+xcLYWjDaK4dLuIRw=
X-Google-Smtp-Source: AA0mqf6k2oSyiJOFYcmUh133EYLV4CiqggXebiqpQprzr6DI1//r/dhDpoLdTde19SYPGm9Rc2B8bg==
X-Received: by 2002:a05:6871:4197:b0:144:c008:f517 with SMTP id
 lc23-20020a056871419700b00144c008f517mr8737919oab.31.1670858228364; 
 Mon, 12 Dec 2022 07:17:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c?
 ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id
 kw32-20020a056870ac2000b0013b911d5960sm5048785oab.49.2022.12.12.07.17.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 07:17:08 -0800 (PST)
Message-ID: <82be0c6e-3c5e-7ba8-c49f-9c709f161ee8@roeck-us.net>
Date: Mon, 12 Dec 2022 07:17:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] target/sh4: Fix TB_FLAG_UNALIGN
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, ysato@users.sourceforge.jp, balaton@eik.bme.hu
References: <20220901101509.145758-1-richard.henderson@linaro.org>
 <20221210152744.GA2275483@roeck-us.net>
 <20221212011345.GA2235238@roeck-us.net>
 <375e840f-a823-b1e8-3d3c-3b1b4298188e@linaro.org>
From: Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <375e840f-a823-b1e8-3d3c-3b1b4298188e@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::36;
 envelope-from=groeck7@gmail.com; helo=mail-oa1-x36.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/12/22 06:30, Richard Henderson wrote:
> On 12/11/22 19:13, Guenter Roeck wrote:
>> On Sat, Dec 10, 2022 at 07:27:46AM -0800, Guenter Roeck wrote:
>>> Hi,
>>>
>>> On Thu, Sep 01, 2022 at 11:15:09AM +0100, Richard Henderson wrote:
>>>> The value previously chosen overlaps GUSA_MASK.
>>>>
>>>> Rename all DELAY_SLOT_* and GUSA_* defines to emphasize
>>>> that they are included in TB_FLAGs.  Add aliases for the
>>>> FPSCR and SR bits that are included in TB_FLAGS, so that
>>>> we don't accidentally reassign those bits.
>>>>
>>>> Fixes: 4da06fb3062 ("target/sh4: Implement prctl_unalign_sigbus")
>>>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/856
>>>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>>>
>>> I noticed that my sh4 emulations crash randomly with qemu v7.2-rc4.
>>> This happens with all Linux kernel versions. Testing shows that this
>>> patch is responsible. Reverting it fixes the problem.
>>>
>>
>> The patch below fixes the problem for me.
> 
> Thanks for the investigation.
> 
> 
>> +++ b/target/sh4/cpu.c
>> @@ -47,7 +47,7 @@ static void superh_cpu_synchronize_from_tb(CPUState *cs,
>>       SuperHCPU *cpu = SUPERH_CPU(cs);
>>       cpu->env.pc = tb_pc(tb);
>> -    cpu->env.flags = tb->flags;
>> +    cpu->env.flags = tb->flags & TB_FLAG_ENVFLAGS_MASK;
> 
> Only this hunk should be necessary.
> 

I'll give it a try.

Thanks,
Guenter


