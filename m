Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4AF37FC6B
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:22:05 +0200 (CEST)
Received: from localhost ([::1]:57522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhF2C-00021w-PS
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:22:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhElJ-0002m6-4Q; Thu, 13 May 2021 13:04:37 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:38429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lhElH-0006oR-Fa; Thu, 13 May 2021 13:04:36 -0400
Received: by mail-ej1-x629.google.com with SMTP id b25so40784893eju.5;
 Thu, 13 May 2021 10:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=06C34SLwerixM0UnCWH4Cv8sH0GOCCCWKl1/5MV0V/I=;
 b=lxnpOQHaJYnf/G0odB1sEf/5F2ow0hTeuBMGztOR8h7Tn6db+d/iDgIF8twYkaM5Mo
 2tWOHlNGmfxv5llt+ps5TARW1H4635FDO7KHxHTcsbDeGn3E0O3u1AbmTzu6V44FPGw+
 4wN7F4RP4/8BdAr7fdTwRdgBE0zr5Yq91wTcrFfvYFz6S8hba3vIhJtXsOtVT3yG+zXT
 igwCQap2rj2fTYNJpRmOYfo08Ik5roTaM5+bXpmaz43Vq5UtrgqK06Go8cSMcHH2HKJB
 V/odTjLK4ivGGs+rCzspJBQuyTcPkrOsT9GJLLo/Y0gvujv3ihPRVs2ZaIYnnefCYqsY
 OASg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=06C34SLwerixM0UnCWH4Cv8sH0GOCCCWKl1/5MV0V/I=;
 b=tUFAKYj4nZsIITEU8jcj5xauR1VtrJHKP0OZlHQEzUFPDkzuX5qOvbxydm672sFnWX
 bu3kYPebl1ZM9i7tgTj8bm12aWzw62CaigVom5Ltr8zQLM9AKv6P1SVf2eCqGvpngMC6
 O2f3LBBF7Dj9aPIG5k7MlQjahSdNLXBlsNxpQ6WQkaqk+6MF8eBpjKTsNjVrW1YCuYZi
 LgFtyFEfvzTEP+MiFbhCZenmddhbbtrpzhH6ZbdjPtZ/RPUBS0A3fEDU1xKoczw3muV6
 EfyBgGjMkvPwiBRqGE/K5ep7Bo8a2hCBhd3jy+t7QtrB2GK/rhQFA7YGtxnUJYDBgaYl
 Z1xg==
X-Gm-Message-State: AOAM530pw4dgkcaGiLiAkWtMIMAHO7ReiF8w9FllVSSfuFSobV8T5wGc
 JUIU5exa9oMwIdWBORmBWKiAXxfR0qna3g==
X-Google-Smtp-Source: ABdhPJwe7phgYR73zsqm1nhLcTLtwaBw2e5x+u3yKDrDLpFOT+JCOzOAtwntAuVq2rmBW2saUCJaaQ==
X-Received: by 2002:a17:907:209b:: with SMTP id
 pv27mr44963796ejb.475.1620925473519; 
 Thu, 13 May 2021 10:04:33 -0700 (PDT)
Received: from [192.168.1.36] (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id n2sm2781858edi.32.2021.05.13.10.04.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 May 2021 10:04:32 -0700 (PDT)
Subject: Re: [PATCH] hw/avr/atmega.c: use the avr51 cpu for atmega1280
To: Joaquin de Andres <me@xcancerberox.com.ar>,
 Fred Konrad <konrad@adacore.com>, qemu-devel@nongnu.org
References: <1619637319-22299-1-git-send-email-frederic.konrad@adacore.com>
 <7970a6ec-f5ac-bcc9-9184-d8450b64b116@amsat.org>
 <27cc1bc5-ee71-abf6-fd8f-58ec44e1767f@xcancerberox.com.ar>
 <d8b05f93-ef5f-1697-439b-8961cb446cdf@adacore.com>
 <b61dabc3-e5e6-5bab-503c-53dd32a11aff@xcancerberox.com.ar>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <4f22587c-1eb1-deab-fdb6-c53e36537e36@amsat.org>
Date: Thu, 13 May 2021 19:04:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b61dabc3-e5e6-5bab-503c-53dd32a11aff@xcancerberox.com.ar>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Rolnik <mrolnik@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Cc'ing qemu-trivial@

On 5/5/21 4:00 PM, Joaquin de Andres wrote:
> On 5/5/21 3:33 PM, Fred Konrad wrote:
>>
>>
>> Le 4/30/21 à 12:27 PM, Joaquin de Andres a écrit :
>>> On 4/28/21 9:17 PM, Philippe Mathieu-Daudé wrote:
>>>> Cc'ing Joaquín.
>>>>
>>>> On 4/28/21 9:15 PM, Frederic Konrad wrote:
>>>>> According to the as documentation:
>>>>>   (https://sourceware.org/binutils/docs-2.36/as/AVR-Options.html)
>>>>>
>>>>> "Instruction set avr51 is for the enhanced AVR core with exactly 128K
>>>>>   program memory space (MCU types: atmega128, atmega128a, atmega1280,
>>>>>   atmega1281, atmega1284, atmega1284p, atmega128rfa1, atmega128rfr2,
>>>>>   atmega1284rfr2, at90can128, at90usb1286, at90usb1287, m3000)."
>>>>>
>>>>> But when compiling a program for atmega1280 or avr51 and trying to
>>>>> execute
>>>>> it:
>>>>>
>>>>> $ cat > test.S << EOF
>>>>>> loop:
>>>>>>      rjmp loop
>>>>>> EOF
>>>>> $ avr-gcc -nostdlib -nostartfiles -mmcu=atmega1280 test.S -o test.elf
>>>>> $ qemu-system-avr -serial mon:stdio -nographic -no-reboot -M mega \
>>>>>                    -bios test.elf
>>>>> qemu-system-avr: Current machine: Arduino Mega (ATmega1280) with
>>>>> 'avr6' CPU
>>>>> qemu-system-avr: ELF image 'test.elf' is for 'avr51' CPU
>>>>>
>>>>> So this fixes the atmega1280 class to use an avr51 CPU.
>>>>>
>>>>> Signed-off-by: Frederic Konrad <frederic.konrad@adacore.com>
>>>>> ---
>>>>>   hw/avr/atmega.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/hw/avr/atmega.c b/hw/avr/atmega.c
>>>>> index 44c6afebbb..e3ea5702f5 100644
>>>>> --- a/hw/avr/atmega.c
>>>>> +++ b/hw/avr/atmega.c
>>>>> @@ -402,7 +402,7 @@ static void atmega1280_class_init(ObjectClass
>>>>> *oc, void *data)
>>>>>   {
>>>>>       AtmegaMcuClass *amc = ATMEGA_MCU_CLASS(oc);
>>>>>   -    amc->cpu_type = AVR_CPU_TYPE_NAME("avr6");
>>>>> +    amc->cpu_type = AVR_CPU_TYPE_NAME("avr51");
>>>>>       amc->flash_size = 128 * KiB;
>>>>>       amc->eeprom_size = 4 * KiB;
>>>>>       amc->sram_size = 8 * KiB;
>>>>>
>>>>
>>> Good catch!
>>>
>>
>> Thanks, does that count as a reviewed-by :)?
>>
>>
> Yes! sorry.
> 
> 
> Reviewed-by: Joaquin de Andres <me@xcancerberox.com.ar>
> 

