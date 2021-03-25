Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2478349409
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Mar 2021 15:29:30 +0100 (CET)
Received: from localhost ([::1]:53788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPQzE-0003H0-IG
	for lists+qemu-devel@lfdr.de; Thu, 25 Mar 2021 10:29:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPQxF-0000ba-0o; Thu, 25 Mar 2021 10:27:21 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lPQxB-0008Ok-CJ; Thu, 25 Mar 2021 10:27:20 -0400
Received: by mail-wr1-x42e.google.com with SMTP id j7so2516263wrd.1;
 Thu, 25 Mar 2021 07:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=O4T4KMc2bwIpf+GfUUo25JEgFm1gxLWIxlcFRrVPQzo=;
 b=HCbaqQAZuOIBJ8FKb45pNoUxOlu3PYGWCP+ACNW1RAUuYPYUjcjVFsqxn8Qdo6LnoC
 wJNIKY7R7TsUpoV3HZzkzE9gkfjXdDGrGQT+0NylRDuuCN75DSE+KkS07ahTatWLEkZF
 JnzD6x73GJHc8XESL9OJGZMhkDd35rBTuE2L0qCtBQ/don+5T9TnO9QK1nkK5Z5Ozilx
 yXET9bwr9wShUAQ/Sb7VswdRDBa6mu8sCE2uWk9F41FCl+W6x1q4T0xpVzCoSyvrrQG1
 jSzcPla0VDzuBvPmb+26c6CRIkr7ZtQvRZLMTdbtRZYdAeGjD2jZV9b1zLal8vcUUMIW
 CE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=O4T4KMc2bwIpf+GfUUo25JEgFm1gxLWIxlcFRrVPQzo=;
 b=mHyqXX63QgivZJf8EMmBJ+ldtS2EBpiNVAdPoUJqlHDvEQuAKZRLKc52aXP7JyT/W/
 BRK/nDj1K2Kgvb+8MDd88mr50qJNOcse6dM1ZeF5v+kC3XQdXI6WoXODaLQoQ9TaQIq4
 WkBYVdbGmjdJUzT7i9OS1Rk7SvubzsBxKZHpW25ngyM3h6K8FBQr/5LmRLvX14mH395Z
 crooKpnGjVNc+C4uSYnXOtUEm6xFGfrP3UczcTvnAVt2ZEiGPnobg+Pht6MdPboPGhYF
 AiRSqeo/Htn87J/yF7Odhlr8l4UZcmBQQoWzCPqb62EMr/R0aZMqk1F/nxV/ixV1JlWR
 XqoA==
X-Gm-Message-State: AOAM530x/PC79J0YA8yoVSXACSFP562lvya/Pfyg+Fom5NomVqnuBjrt
 BVoy9rTsDxkylCTMZ1oLjL44RpRc/dNzRA==
X-Google-Smtp-Source: ABdhPJxpXTUMm42SYY0ME+Ppj+cuoiZeJ8Of5Uu5bu7NMCC6T9F9PVnTpomnDag6+ODpVlP+FQjPwA==
X-Received: by 2002:a5d:670f:: with SMTP id o15mr1252926wru.349.1616682434465; 
 Thu, 25 Mar 2021 07:27:14 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id a13sm7755661wrp.31.2021.03.25.07.27.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Mar 2021 07:27:13 -0700 (PDT)
Subject: Re: [PATCH 5/6] hw/ide/via: Connect IDE function output IRQs to the
 ISA function input
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210324175438.680310-1-f4bug@amsat.org>
 <20210324175438.680310-6-f4bug@amsat.org>
 <6c397608-6ff4-716b-4973-55f49c24c0fa@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <a735ca8e-4846-c0ce-385c-fdd4b067d688@amsat.org>
Date: Thu, 25 Mar 2021 15:27:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <6c397608-6ff4-716b-4973-55f49c24c0fa@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, John Snow <jsnow@redhat.com>,
 qemu-block@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/25/21 1:29 PM, Richard Henderson wrote:
> On 3/24/21 11:54 AM, Philippe Mathieu-Daudé wrote:
>> To avoid abusing isa_get_irq(NULL) using a hidden ISA bridge
>> under the hood, let the IDE function expose 2 output IRQs,
>> and connect them to the ISA function inputs when creating
>> the south bridge chipset model in vt82c686b_southbridge_init.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>>   hw/ide/via.c        | 19 +++++++++++++++++--
>>   hw/mips/fuloong2e.c |  9 ++++++++-
>>   2 files changed, 25 insertions(+), 3 deletions(-)

>> diff --git a/hw/mips/fuloong2e.c b/hw/mips/fuloong2e.c
>> index 931385c760f..f1c5db13b78 100644
>> --- a/hw/mips/fuloong2e.c
>> +++ b/hw/mips/fuloong2e.c
>> @@ -203,12 +203,19 @@ static void vt82c686b_southbridge_init(PCIBus
>> *pci_bus, int slot, qemu_irq intc,
>>                                          I2CBus **i2c_bus)
>>   {
>>       PCIDevice *dev;
>> +    DeviceState *isa;
>>         dev = pci_create_simple_multifunction(pci_bus, PCI_DEVFN(slot,
>> 0), true,
>>                                             TYPE_VT82C686B_ISA);
>> -    qdev_connect_gpio_out_named(DEVICE(dev), "intr", 0, intc);
>> +    isa = DEVICE(dev);
>> +    qdev_connect_gpio_out_named(isa, "intr", 0, intc);
>>         dev = pci_create_simple(pci_bus, PCI_DEVFN(slot, 1), "via-ide");
>> +    for (unsigned i = 0; i < 2; i++) {
>> +        qdev_connect_gpio_out_named(DEVICE(dev), "ide-irq", i,
> 
>                                        ^^^^^^^^^^^ isa?

OK.

>> +                                    qdev_get_gpio_in_named(isa,
>> +                                                           "isa-irq",
>> 14 + i));
>> +    }
> 
> It all looks a little funny, but I think I follow it, and see that it
> can't be split further, because of the movement of the +14.

I can break the indent to shift left. Anyway this disappear in the next
commit.

> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 

Thanks!

Phil.

