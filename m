Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 486962E86ED
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jan 2021 11:58:01 +0100 (CET)
Received: from localhost ([::1]:38830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kvebc-0005WF-AN
	for lists+qemu-devel@lfdr.de; Sat, 02 Jan 2021 05:57:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kveaL-00052T-UP; Sat, 02 Jan 2021 05:56:37 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:51051)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kveaI-0007c4-B1; Sat, 02 Jan 2021 05:56:37 -0500
Received: by mail-wm1-x32a.google.com with SMTP id 190so12821041wmz.0;
 Sat, 02 Jan 2021 02:56:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=YJ3126DFEoUEnW4150rpQFeQ0FpJNs3b+LQdWSRPXRA=;
 b=YKepl571ZW3uG8XHeCWmuy0x+Ne7IpT7aAWA/puHd7wLN2fZCbJx1b3UZe3X0oVaBn
 qSVquY1tr2beyUf/Uci1nJgfVy5R+T6UbIPZR9YaqU5ZqeuT62BOVVdJbNhH67WkJdCn
 sDLUCkIiZMmNWZKij5qSOkLsiYVSlBhkk2lmYQayXfV7alpE0Sihc3FaeAipfqumJ+Rf
 t0BXtQ7SP7KK+1dg9qxN0HPw5KZhEXXYd4D83esd4V0ecOOPfktBMYeZrVwHZz4dKgv0
 R3OnQEMRYVi+0my91GG7dPe1a1SlH+2nacynCYES7VbsNgL4MvG6EIzt/Nt9DyjcWYqZ
 6eZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YJ3126DFEoUEnW4150rpQFeQ0FpJNs3b+LQdWSRPXRA=;
 b=sutB+cI3OJ2N22HObiGkGhehfZHmms8YOlD8ZM8lQ8pa5JfPFEmTIQkVLYHWYnnmvM
 tkyZ1EwzwP0QmLDAxImalejsramNfRu9am3B1/RMi1LbMtJXFxdRtSmvPmlDEoyaS3OX
 oGsEz2gfJT7iNxYmLKOVx3atdbkkpHJA7NyZqWcJschbuB/gZcGhh0o0WeYGZUd/oH8M
 ffrF1trXG4TvDKahn5DmSNtOGcxlGVmGqOmiFXL2vPIquk1NGj0Epq2UjzYMc5cbW1pA
 GY7trzkGBRypw6/jc7V8DVW57uw2qihnDA4GfIcLQsNzCB3sfR5fCda1ck2zvr7FHE8s
 x2Cw==
X-Gm-Message-State: AOAM530xFfQT8XKZJGkDNOR7/VOu1d5CPgPTyfC7B1knVljj/5SlROno
 LK9Bw0meacdHL5Op8PYRyPs=
X-Google-Smtp-Source: ABdhPJyAeQzs8tsMvSCbYAq5IdOjNCk7nCqL+tXIs5vuWS7zDsSekd7yEZe1dsEIcxcBgWtUJN8k1w==
X-Received: by 2002:a05:600c:1483:: with SMTP id
 c3mr18852546wmh.87.1609584992052; 
 Sat, 02 Jan 2021 02:56:32 -0800 (PST)
Received: from [192.168.1.34] (194.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.194])
 by smtp.gmail.com with ESMTPSA id u205sm23550214wme.42.2021.01.02.02.56.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 02 Jan 2021 02:56:31 -0800 (PST)
Subject: Re: [RFC PATCH 3/5] hw/pci-host/bonito: Remap PCI "lo" regions when
 PCIMAP reg is modified
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210101231215.1870611-1-f4bug@amsat.org>
 <20210101231215.1870611-4-f4bug@amsat.org>
 <CAFEAcA_Hi+4BAPL+0BhDgbsXtzDQjiCs0SAs44mKgUbcSE+XCg@mail.gmail.com>
 <2da14074-a4ef-e90c-ea42-74d48ca06afd@amsat.org>
Message-ID: <d0838a76-b99d-8c21-38bf-cac71ca24bcc@amsat.org>
Date: Sat, 2 Jan 2021 11:56:29 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <2da14074-a4ef-e90c-ea42-74d48ca06afd@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.749,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Qemu-block <qemu-block@nongnu.org>, Huacai Chen <chenhuacai@kernel.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/2/21 11:44 AM, Philippe Mathieu-Daudé wrote:
> On 1/2/21 12:19 AM, Peter Maydell wrote:
>> On Fri, 1 Jan 2021 at 23:12, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>>>
>>> Per the datasheet (Chapter 5.7.1. "PCI address regions"),
>>> the PCIMAP register:
>>>
>>>   Map the 64Mbyte regions marked "PCI_Lo" in the CPU's memory map,
>>>   each of which can be assigned to any 64 Mbyte-aligned region of
>>>   PCI memory. The address appearing on the PCI bus consists of the
>>>   low 26 bits of the CPU physical address, with the high 6 bits
>>>   coming from the appropriate base6 field. Each of the three regions
>>>   is an independent window onto PCI memory, and can be positioned on
>>>   any 64Mbyte boundary in PCI space.
>>>
>>> Remap the 3 regions on reset and when PCIMAP is updated.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>>  hw/pci-host/bonito.c | 49 ++++++++++++++++++++++++++++++++------------
>>>  1 file changed, 36 insertions(+), 13 deletions(-)
>>>
>>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>>> index a99eced0657..c58eeaf504c 100644
>>> --- a/hw/pci-host/bonito.c
>>> +++ b/hw/pci-host/bonito.c
>>> @@ -137,6 +137,10 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>>>
>>>  /* 4. PCI address map control */
>>>  #define BONITO_PCIMAP           (0x10 >> 2)      /* 0x110 */
>>> +FIELD(PCIMAP, LO0,               0, 6)
>>> +FIELD(PCIMAP, LO1,               6, 6)
>>> +FIELD(PCIMAP, LO2,              12, 6)
>>> +FIELD(PCIMAP, 2G,               18, 1)
>>>  #define BONITO_PCIMEMBASECFG    (0x14 >> 2)      /* 0x114 */
>>>  #define BONITO_PCIMAP_CFG       (0x18 >> 2)      /* 0x118 */
>>>
>>> @@ -237,6 +241,7 @@ struct BonitoState {
>>>      qemu_irq *pic;
>>>      PCIBonitoState *pci_dev;
>>>      MemoryRegion pci_mem;
>>> +    MemoryRegion pcimem_lo_alias[3];
>>>  };
>>>
>>>  #define TYPE_BONITO_PCI_HOST_BRIDGE "Bonito-pcihost"
>>> @@ -245,6 +250,31 @@ OBJECT_DECLARE_SIMPLE_TYPE(BonitoState, BONITO_PCI_HOST_BRIDGE)
>>>  #define TYPE_PCI_BONITO "Bonito"
>>>  OBJECT_DECLARE_SIMPLE_TYPE(PCIBonitoState, PCI_BONITO)
>>>
>>> +static void bonito_remap(PCIBonitoState *s)
>>> +{
>>> +    static const char *const region_name[3] = {
>>> +        "pci.lomem0", "pci.lomem1", "pci.lomem2"
>>> +    };
>>> +    BonitoState *bs = BONITO_PCI_HOST_BRIDGE(s->pcihost);
>>> +
>>> +    for (size_t i = 0; i < 3; i++) {
>>> +        uint32_t offset = extract32(s->regs[BONITO_PCIMAP], 6 * i, 6) << 26;
>>> +
>>> +        if (memory_region_is_mapped(&bs->pcimem_lo_alias[i])) {
>>> +            memory_region_del_subregion(get_system_memory(),
>>> +                                        &bs->pcimem_lo_alias[i]);
>>> +            object_unparent(OBJECT(&bs->pcimem_lo_alias[i]));
>>> +        }
>>> +
>>> +        memory_region_init_alias(&bs->pcimem_lo_alias[i], OBJECT(s),
>>> +                                 region_name[i], &bs->pci_mem,
>>> +                                 offset, 64 * MiB);
>>> +        memory_region_add_subregion(get_system_memory(),
>>> +                                    BONITO_PCILO_BASE + i * 64 * MiB,
>>> +                                    &bs->pcimem_lo_alias[i]);
>>> +    }
>>
>> Rather than delete-and-reinit-and-add, it's probably better to
>> just create the subregions once at device startup, and then use
>> memory_region_set_enabled() and memory_region_set_address()
>> to manipulate whether the subregion is visible and what address
>> in the system memory it is mapped at.
> 
> Great! Thanks Peter :) TIL these functions.
> From what I understand from memory_region_readd_subregion (called
> from memory_region_set_address) using memory_region_set_enabled()
> directly is enough.

Actually since this is a alias, we don't want to modify the base
address but the alias offset, so I need to use
memory_region_set_alias_offset().

