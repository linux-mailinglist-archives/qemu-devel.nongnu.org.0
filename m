Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A9A2E09F1
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Dec 2020 13:14:23 +0100 (CET)
Received: from localhost ([::1]:38834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krgYY-0007vU-Ar
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 07:14:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krgXf-0007UL-8Z
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 07:13:27 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:38573)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1krgXd-00045B-Al
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 07:13:27 -0500
Received: by mail-wr1-x42f.google.com with SMTP id r7so14312377wrc.5
 for <qemu-devel@nongnu.org>; Tue, 22 Dec 2020 04:13:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=8pfKfI1uh24X2xp+2vD2hN8cFIvPXCNhlFJkOMhM5dw=;
 b=HHhhXgZaZuqFKQ+tw7hYi1cRSOWeCnxhoJog4WBH3g6tG65s0cJmDReCeZIjWumfaP
 GTIvLnJN9n5Kjd86KT5yuMOXbC9atPGYOc+NHBYabbY3gBF1pU1136HM7k1kc8AS0qPo
 ciXGMupQKG3ZUSd7p5TD7LfCSowbM3G+E78v6Qw4G8xVn60v0qBX9BihbfbAl0VRqEgn
 gN7kwBGp/0VCZPAqQpt8eboDIwYbBCqFc8/6Idx+qEk7dPcgKapkRRyFt96B1EP30at4
 e2Am04Q4ZlL1EHL9/nGCR4ckMyUN0uehoHGz3iK0fTOCcS2tQt2eXxIGquk4eqEOTVO6
 0yLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8pfKfI1uh24X2xp+2vD2hN8cFIvPXCNhlFJkOMhM5dw=;
 b=MyM8hYIZmC5lI7FDfrxrQuaHTl0xnvJn9feSj7ynCV/9UIxReL+1eBZGXhta1oLUrj
 /CDG9oZlj62n8tjKIP+gXyzasyj0FViXjpHG4J+zedegelaVxRjY/DWqPtI8K6eESXrC
 HpswTgaAXZsyb2F8eF17AaydZ50Q3qJWHOeA0B0ZHsiFmSeVBi9pTjbqdvRY+iBG0Ep0
 Q1mSVzHhz5ey9dv0e0ow9+9MRp6PuA/yM2qyQptoODBefnu1Ydl9NEalGym96h4T2gzJ
 zuIweq/Vt70Pm2bC1DFrVxtEVIG9FQ5PePSoe7mR1IydY3uYCSo5YZPTsg4hQ0eY5kYH
 JqBg==
X-Gm-Message-State: AOAM5323GuZfCXdiYhn3WjzgDfcSXC1SmavdTHtTutwjt7Tp/jLMNdqH
 kwePQAPOQSfC/UPvB48XQWo=
X-Google-Smtp-Source: ABdhPJxO0MINax33Qh2G2xg7FdhyUfgY2IxoL1d0Vt2eHzNL+7+B6tD4ch1YUOi1LOQ9TUNbavAQlA==
X-Received: by 2002:a5d:6cc2:: with SMTP id c2mr23621615wrc.374.1608639203602; 
 Tue, 22 Dec 2020 04:13:23 -0800 (PST)
Received: from ?IPv6:2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b?
 ([2a01:e35:2fb0:49e0:98dc:fe2:8fe8:bc3b])
 by smtp.gmail.com with ESMTPSA id x17sm30624467wro.40.2020.12.22.04.13.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Dec 2020 04:13:22 -0800 (PST)
Subject: Re: [PATCH v2 4/8] hw/pci-host/bonito: Fixup pci.lomem mapping
To: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org
References: <20201219071235.35040-1-jiaxun.yang@flygoat.com>
 <20201219071816.37963-2-jiaxun.yang@flygoat.com>
 <05d6819c-67dd-9275-e9df-1a26baf807ee@amsat.org>
 <1089c6a2-e446-9312-4edb-090a6ae8bf72@flygoat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <981a0855-7062-de3c-5baf-18b0b8216061@amsat.org>
Date: Tue, 22 Dec 2020 13:13:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <1089c6a2-e446-9312-4edb-090a6ae8bf72@flygoat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.521,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: chenhuacai@kernel.org, wainersm@redhat.com, crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/22/20 1:36 AM, Jiaxun Yang wrote:
> 在 2020/12/22 上午4:45, Philippe Mathieu-Daudé 写道:
>> On 12/19/20 8:18 AM, Jiaxun Yang wrote:
>>> The original mapping had wrong base address.
>>> Fix by correct the base adress and merge three alias into
>>> a single.
>> Why merge? Beside, typo "address".
> 
> 
> Hi Philippe,
> 
> Thanks for your reviewing!
> 
> Because I can't understand why it was in three pieces.
> I was just trying to do what kernel as I don't have much knowledge with
> Fuloong2E.

You can find the information in the 'BONITO64 - "north bridge"
controller for 64-bit MIPS CPUs" datasheet from Algorithmics Ltd. 2001,
section "4.1. Address maps" and Table 4.1: "CPU/local bus address map".

See also "Design and Implementation of EBoot based on Godson Platform":
http://www.ecice06.com/CN/article/downloadArticleFile.do?attachType=PDF&id=10656

> 
> The kernel treated PCI region as a whole part[1] at 0x10000000 with size
> 0x0c000000.
> 
> It fixed long lasting radeonfb starting failure.
> 
>>
>>> Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>>> ---
>>>   hw/pci-host/bonito.c | 17 ++++++-----------
>>>   1 file changed, 6 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>>> index 43b79448a9..3a31ba42f2 100644
>>> --- a/hw/pci-host/bonito.c
>>> +++ b/hw/pci-host/bonito.c
>>> @@ -608,7 +608,7 @@ static void bonito_pcihost_realize(DeviceState
>>> *dev, Error **errp)
>>>   {
>>>       PCIHostState *phb = PCI_HOST_BRIDGE(dev);
>>>       BonitoState *bs = BONITO_PCI_HOST_BRIDGE(dev);
>>> -    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 3);
>>> +    MemoryRegion *pcimem_lo_alias = g_new(MemoryRegion, 1);
>>>         memory_region_init(&bs->pci_mem, OBJECT(dev), "pci.mem",
>>> BONITO_PCIHI_SIZE);
>>>       phb->bus = pci_register_root_bus(dev, "pci",
>>> @@ -616,16 +616,11 @@ static void bonito_pcihost_realize(DeviceState
>>> *dev, Error **errp)
>>>                                        dev, &bs->pci_mem,
>>> get_system_io(),
>>>                                        0x28, 32, TYPE_PCI_BUS);
>>>   -    for (size_t i = 0; i < 3; i++) {
>>> -        char *name = g_strdup_printf("pci.lomem%zu", i);
>>> -
>>> -        memory_region_init_alias(&pcimem_lo_alias[i], NULL, name,
>>> -                                 &bs->pci_mem, i * 64 * MiB, 64 * MiB);
>>> -        memory_region_add_subregion(get_system_memory(),
>>> -                                    BONITO_PCILO_BASE + i * 64 * MiB,
>>> -                                    &pcimem_lo_alias[i]);
>>> -        g_free(name);
>>> -    }
>>> +    memory_region_init_alias(pcimem_lo_alias, OBJECT(dev), "pci.lomem",
>>> +                             &bs->pci_mem, BONITO_PCILO_BASE,
>>> +                             BONITO_PCILO_SIZE);
>> Why is your pci_mem mapped at 0?
> 
> It is actually started at 0x10000000.
> 
> As: #define BONITO_PCILO_BASE       0x10000000
> 
> 
> Thanks.
> 
> [1]:
> https://elixir.bootlin.com/linux/latest/source/arch/mips/loongson2ef/common/pci.c
> 
> 
> - Jiaxun
>>
>>> +    memory_region_add_subregion(get_system_memory(), BONITO_PCILO_BASE,
>>> +                                pcimem_lo_alias);
>>>         create_unimplemented_device("pci.io", BONITO_PCIIO_BASE, 1 *
>>> MiB);
>>>   }
>>>
> 
> 

