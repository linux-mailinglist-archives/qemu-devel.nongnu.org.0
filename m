Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6182D1D45
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 23:25:35 +0100 (CET)
Received: from localhost ([::1]:36448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmOwo-0006Zk-2R
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 17:25:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36280)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmOug-0005wd-GB
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:23:22 -0500
Received: from mail-ed1-x542.google.com ([2a00:1450:4864:20::542]:43901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kmOue-00065X-Fw
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 17:23:21 -0500
Received: by mail-ed1-x542.google.com with SMTP id q16so15464761edv.10
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 14:23:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Xsn0kXRI/NhDGmwQKDYDymm/KtE2EhhZzfK9K/JoPYY=;
 b=Ka8xqLOtDWjmKLBgZNmX0vL/8r7PNh7mmRVQpVoXhxuZ9S57pU3W/3t0h85fqQCvqe
 MZ+Aw2wLXdwZpJfcTGZQ1NqUanDXQMgFY21kK8mMbjrTu9PZFETImBLZeAP1pHTqqB5s
 NfAwy4Eu5lH49sxnsptUu2aM+fPolRGtEiuiDZVKgtkGAD7yn8nNex6ev0rMtmO56gya
 /zmETu9KCX2lBdRkokUUv5B7U+sbbBZm99GxTstm235XpP6pzZMIPZv9nj0xW1PukrV7
 U7/f2d/hPlksbtNHA9f9SZmWK46ezqKEPWnO11LvS4WQCK34NcArQpx1Cg0x0k/baWLh
 UfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Xsn0kXRI/NhDGmwQKDYDymm/KtE2EhhZzfK9K/JoPYY=;
 b=O8kJKkHfGtJ4QSPsLwomOmdHJZbtyvJiVIP+WPT84ZfNmIyiLkksktusG3xVhm1LGZ
 CLCGzXR64XS3R3EX2p2mg4gMdK3iUnz4q3oTlZzrABrT/jU6fx11+uTKeqRaJBfu8v9F
 wVr+Xxio95kv+kppFU1SyRNreidCdfdAE6Q+Km6U9w9uaVcmEf9usaCj0mPrkUE4tV1D
 391QrBCOD+hMOy2FFPfp8RQCfrsykxCxrmzJxVxWutul8Th/aYa+keTw5vrktjhBSdxr
 dwlyBtFhN6CFh3baGRTImAMjecZI/Rn3unD6whJ372L6796+/QfwAs4TxqPsKqC3jyoi
 u5ig==
X-Gm-Message-State: AOAM530sb0R39xcE7DRJmgDlC7+9paXBMImfH/BzUN+19yNUcbaBjj86
 tvlu/qcD3y969pNcO2HikWA=
X-Google-Smtp-Source: ABdhPJzW8aBPWwQY8CfEIOh5PjvtIBrb+AC52E4DWl3WfkGMZqA8ZtmM4kNCI6P07FeF+jKgtlOaaQ==
X-Received: by 2002:a05:6402:4d2:: with SMTP id
 n18mr21779534edw.169.1607379798959; 
 Mon, 07 Dec 2020 14:23:18 -0800 (PST)
Received: from [192.168.1.36] (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id y17sm13683064ejj.84.2020.12.07.14.23.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Dec 2020 14:23:17 -0800 (PST)
Subject: Re: [PATCH 2/2] target/mips/kvm: Assert unreachable code is not used
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhuacai@gmail.com>
References: <20200429082916.10669-1-f4bug@amsat.org>
 <20200429082916.10669-3-f4bug@amsat.org>
 <e33820ee-0013-bed9-ef06-9a66995f6405@amsat.org>
 <b938bfae-cc2b-e43b-36ef-8ac4b5f78eb4@amsat.org>
 <98e6a5b3-15b5-0365-67dd-23830687d949@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <5555cc1f-8053-a964-ca3d-3b34a5954c19@amsat.org>
Date: Mon, 7 Dec 2020 23:23:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <98e6a5b3-15b5-0365-67dd-23830687d949@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::542;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x542.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
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
Cc: Huacai Chen <chenhc@lemote.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/20 12:02 PM, Paolo Bonzini wrote:
> On 24/11/20 11:41, Philippe Mathieu-Daudé wrote:
>> Huacai, ping?
>>
>> On 5/12/20 9:09 AM, Philippe Mathieu-Daudé wrote:
>>> +Paolo
>>>
>>> On 4/29/20 10:29 AM, Philippe Mathieu-Daudé wrote:
>>>> This code must not be used outside of KVM. Abort if it is.
>>>>
>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>> ---
>>>>    target/mips/kvm.c | 8 ++------
>>>>    1 file changed, 2 insertions(+), 6 deletions(-)
>>>>
>>>> diff --git a/target/mips/kvm.c b/target/mips/kvm.c
>>>> index de3e26ef1f..050bfbd7fa 100644
>>>> --- a/target/mips/kvm.c
>>>> +++ b/target/mips/kvm.c
>>>> @@ -196,9 +196,7 @@ int kvm_mips_set_interrupt(MIPSCPU *cpu, int irq,
>>>> int level)
>>>>        CPUState *cs = CPU(cpu);
>>>>        struct kvm_mips_interrupt intr;
>>>>    -    if (!kvm_enabled()) {
>>>> -        return 0;
>>>> -    }
>>>> +    assert(kvm_enabled());
>>>>          intr.cpu = -1;
>>>>    @@ -219,9 +217,7 @@ int kvm_mips_set_ipi_interrupt(MIPSCPU *cpu, int
>>>> irq, int level)
>>>>        CPUState *dest_cs = CPU(cpu);
>>>>        struct kvm_mips_interrupt intr;
>>>>    -    if (!kvm_enabled()) {
>>>> -        return 0;
>>>> -    }
>>>> +    assert(kvm_enabled());
>>>>          intr.cpu = dest_cs->cpu_index;
>>>>   
>>>
>>
> 
> Acked-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> For kvm_mips_set_ipi_interrupt, however, it would be nicer if
> hw/intc/mips_gic.c always used gic->vps[vp].env->irq[], and the qemu_irq
> handler took care of calling kvm_mips_set_ipi_interrupt.
> 
> Likewise, there is some duplication between kvm_mips_interrupt's caller
> and kvm_arch_pre_run.  I'm not sure if kvm_arch_pre_run is needed at all.

OK, I'll have a look and ask Huacai to test.

Meanwhile, patch applied to mips-next.

Thanks,

Phil.

