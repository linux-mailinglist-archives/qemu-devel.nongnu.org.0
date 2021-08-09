Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E44D93E4337
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 11:50:28 +0200 (CEST)
Received: from localhost ([::1]:55298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD1vQ-0007WA-0J
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 05:50:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD1tt-0005LK-Fo
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:48:53 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:36670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mD1tr-00023J-As
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:48:53 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 o7-20020a05600c5107b0290257f956e02dso14110813wms.1
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Z6qoHrFsNMH9JJ5Iy6uGbIEe1fk3FvfdjGi8jRps/N0=;
 b=hGXb5+v1wL7bu+XZxCUdJEzIyML+ndxCNxeG7KpUKDrJp76sQ5119rCiiDz7RDDFfY
 0h+OLkcx3/frF9j71YOhHAfKdJfNE2+EenghU3meX070KAyHLKQ5bBIuxSssHDdFfnn/
 CZGsC1xDX7nLVh2fqJWhvYKZm6EdlDebIo7+d9HwijwidqHKfzQMsk6YFCB15Wizp1p6
 lEJ8actK+DdlWIbWb43F4G9YdUU38XU6leD7FBq24nVeiHGeQ3ePnOHeENcw+ORl6Mwx
 /GLyX5zreiR0jHkJc3Emk5mMU/s5LlSB3PZxRKWRdM3D2OGH3u2oTDBfpmQ55kRp7btV
 1UEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z6qoHrFsNMH9JJ5Iy6uGbIEe1fk3FvfdjGi8jRps/N0=;
 b=RqLHMHyZyj3eayOhyEpJ4qxoKViYWRR7nVMmAjZUgE30wmtHWZThmYqXqR7XyCiJQk
 GnatsrEv2HMgZVAwW4mt5njsMy1RNo4dO6TL2HOX5g3WVyZ4yx7NZPsONm+LziGCYDbg
 R/DNW0RfiVdi38SMbjqplByJ2fwBMqp1PikpWtC2X5oMFuEZqCZr/2bLLjtkeTALQ8wz
 wcoxWvk47dOcxV1u6YQ45f4blwrN13GqdvqP02j7V2XLvEn4T4FGdJcWBygARECK8c+U
 +QO9BHUvqGpObpgfxmfXm5A+EnH+eXBGCNO6SpAeSJbomi1Cyc8cCWKRUqABBsdulesw
 qHzg==
X-Gm-Message-State: AOAM530T0xJ7monchBYUF7WVDOarK7fD1BIx4vw4V2e5vBGyOzQNzwYB
 7eyEVhlFibHZPuF6sx/QTxw=
X-Google-Smtp-Source: ABdhPJwO1hXd/zzXModjRHe59kqf041ulHAiSlLhXWoj5qin5NNSMnwqMVOEH7WNI1/pT6Ijo3NHaA==
X-Received: by 2002:a7b:c353:: with SMTP id l19mr32049302wmj.127.1628502530044; 
 Mon, 09 Aug 2021 02:48:50 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id e10sm1391052wrt.82.2021.08.09.02.48.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 09 Aug 2021 02:48:49 -0700 (PDT)
Subject: Re: [PATCH-for-6.2 2/2] disas/nios2: Simplify endianess conversion
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Marek Vasut <marex@denx.de>
References: <20210807110939.95853-1-f4bug@amsat.org>
 <20210807110939.95853-3-f4bug@amsat.org>
 <b869358f-caed-6e03-5822-ada080961a11@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bb2a9d03-94c3-bf48-ace0-e9669950f34e@amsat.org>
Date: Mon, 9 Aug 2021 11:48:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b869358f-caed-6e03-5822-ada080961a11@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Chris Wulff <crwulff@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alexander Graf <agraf@csgraf.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/9/21 8:12 AM, Thomas Huth wrote:
> On 07/08/2021 13.09, Philippe Mathieu-Daudé wrote:
>> Since commit 12b6e9b27d4 ("disas: Clean up CPUDebug initialization")
>> the disassemble_info->bfd_endian enum is set for all targets in
>> target_disas(). We can directly call print_insn_nios2() and simplify.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   include/disas/dis-asm.h |  3 +--
>>   disas/nios2.c           | 22 +++-------------------
>>   target/nios2/cpu.c      |  6 +-----
>>   3 files changed, 5 insertions(+), 26 deletions(-)
> [...]
>> diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
>> index 5e37defef80..5b503b5bb99 100644
>> --- a/target/nios2/cpu.c
>> +++ b/target/nios2/cpu.c
>> @@ -146,11 +146,7 @@ static void nios2_cpu_disas_set_info(CPUState
>> *cpu, disassemble_info *info)
>>   {
>>       /* NOTE: NiosII R2 is not supported yet. */
>>       info->mach = bfd_arch_nios2;
>> -#ifdef TARGET_WORDS_BIGENDIAN
>> -    info->print_insn = print_insn_big_nios2;
>> -#else
>> -    info->print_insn = print_insn_little_nios2;
>> -#endif
>> +    info->print_insn = print_insn_nios2;
>>   }
> 
> Oh, wow, I didn't even know that nios2 could be compiled with different
> endianness? I mean, we only have a "nios2-softmmu" target, not something
> like "nios2be-softmmu" and "nios2le-softmmu" ?

$ git grep ENDIAN configs/targets/nios2-*
$

We only build little-endian targets, but looking at commit
b7862564880 ("nios2: Add Altera 10M50 GHRD emulation")
hw/nios2/boot.c is ready to load big-endian ELF if we were
building the big-endian targets.

> Anyway, your patch makes a lot of sense to clean this up.
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 
> 

