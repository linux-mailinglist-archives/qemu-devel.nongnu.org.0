Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197742C2323
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 11:43:20 +0100 (CET)
Received: from localhost ([::1]:44562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khVn5-0007H9-4O
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 05:43:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khVls-0006pe-PN
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 05:42:04 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:36172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1khVlr-00005y-BG
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 05:42:04 -0500
Received: by mail-wm1-x344.google.com with SMTP id a65so2356326wme.1
 for <qemu-devel@nongnu.org>; Tue, 24 Nov 2020 02:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=DM6HZMXZao4fUNtZXO7TGvcttKdNPcq9+B96SdLBj9U=;
 b=sxxSxD7SBayVsZ6y7H5yJB26HDUIcja9wgv0Eo7wFNvgHbwlAOVopfuuhIuiT4QKJ9
 fNAAfZNyNmfEWTZETRHnwW1TQ7VlT8A2V+ecVycRi6VlZUMvdDn018T6+gNOBMYW6kwO
 fHEouzLQ+4ZjJbUdA2sbyrZyYQFDCtQseLvaEvxPhw4NlpAb2lRUNVdzIjD0O3ek8O3l
 +jZ0YwIuk8HhM3KoEK1u87eNjDmziGyAVJCAnqvrWmQ2PmDssK3ak86sQLFgDnQR6CJX
 NpfjMc333S/FIrjlHllr9WGotJibCbuiJGjO4MdtEayTmqP5Xebs15JeuVXZgPMe85Hj
 KMpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DM6HZMXZao4fUNtZXO7TGvcttKdNPcq9+B96SdLBj9U=;
 b=ndj0ZATYmoRvslY/gWJlB3jcXb7BufTJ/ra9Mn5YNPfHHgftyhCqWdp95M6WVAIdJ6
 kRAvgf7f78bAkGheR6m+ekZ4a0a6OSD7G1Z8XHd2nAqbZApD0hZ6+o0MpbDi6xmzUwo9
 CluyhSParOlqoDwPrXphIovnjkpm9y4NjsN2r37nb3vP63u2vktRoNgh62X1NlHTzXzD
 nodFVvWBAhyQgYuRJiVWd0arNtQEsr7qf32Nab0pX/U4Q1SUg42njLMluMBbbiTXuPwS
 9bOVgAbau/9gU/2A5Q2pNKxoJ6GxFTmEICGlkqcQpbWNbmbfERvrhbLC1cKSoQC/PjhO
 2Tgw==
X-Gm-Message-State: AOAM530HN5ay2czx3P1Pgj3Cca01B5VrvZCZ06UQKpM7UVEpod32kf4S
 CIECcamfK9z0ZtVkIFGPUI8=
X-Google-Smtp-Source: ABdhPJyHw7wi4/2dhZIDChkkS2nqcd7A47+9JSDO6NInvnUecYqxlLyOQREhS0gr2ajA77WwrdTvnw==
X-Received: by 2002:a1c:7f81:: with SMTP id a123mr3868691wmd.6.1606214521671; 
 Tue, 24 Nov 2020 02:42:01 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id o4sm4524669wmh.33.2020.11.24.02.42.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 24 Nov 2020 02:42:00 -0800 (PST)
Subject: Re: [PATCH 2/2] target/mips/kvm: Assert unreachable code is not used
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, Huacai Chen <chenhuacai@gmail.com>
References: <20200429082916.10669-1-f4bug@amsat.org>
 <20200429082916.10669-3-f4bug@amsat.org>
 <e33820ee-0013-bed9-ef06-9a66995f6405@amsat.org>
Message-ID: <b938bfae-cc2b-e43b-36ef-8ac4b5f78eb4@amsat.org>
Date: Tue, 24 Nov 2020 11:41:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <e33820ee-0013-bed9-ef06-9a66995f6405@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x344.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Huacai Chen <chenhc@lemote.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Huacai, ping?

On 5/12/20 9:09 AM, Philippe Mathieu-Daudé wrote:
> +Paolo
> 
> On 4/29/20 10:29 AM, Philippe Mathieu-Daudé wrote:
>> This code must not be used outside of KVM. Abort if it is.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   target/mips/kvm.c | 8 ++------
>>   1 file changed, 2 insertions(+), 6 deletions(-)
>>
>> diff --git a/target/mips/kvm.c b/target/mips/kvm.c
>> index de3e26ef1f..050bfbd7fa 100644
>> --- a/target/mips/kvm.c
>> +++ b/target/mips/kvm.c
>> @@ -196,9 +196,7 @@ int kvm_mips_set_interrupt(MIPSCPU *cpu, int irq,
>> int level)
>>       CPUState *cs = CPU(cpu);
>>       struct kvm_mips_interrupt intr;
>>   -    if (!kvm_enabled()) {
>> -        return 0;
>> -    }
>> +    assert(kvm_enabled());
>>         intr.cpu = -1;
>>   @@ -219,9 +217,7 @@ int kvm_mips_set_ipi_interrupt(MIPSCPU *cpu, int
>> irq, int level)
>>       CPUState *dest_cs = CPU(cpu);
>>       struct kvm_mips_interrupt intr;
>>   -    if (!kvm_enabled()) {
>> -        return 0;
>> -    }
>> +    assert(kvm_enabled());
>>         intr.cpu = dest_cs->cpu_index;
>>  
> 

