Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4471C3B6DCA
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Jun 2021 06:55:20 +0200 (CEST)
Received: from localhost ([::1]:47244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ly5mJ-0000U6-BQ
	for lists+qemu-devel@lfdr.de; Tue, 29 Jun 2021 00:55:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47704)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly5lT-0008FW-H5
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:54:27 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:38617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ly5lR-0001PP-Op
 for qemu-devel@nongnu.org; Tue, 29 Jun 2021 00:54:27 -0400
Received: by mail-wr1-x436.google.com with SMTP id u6so1952470wrs.5
 for <qemu-devel@nongnu.org>; Mon, 28 Jun 2021 21:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=hPB2BiDoenUlvcP0wU20V2Ce9rNF/3kxoQEmPhZn830=;
 b=JPoqTo8mwSUCUIfML9fxNqCvv3G9F30y2AM46krEXZnigy8CY+SLggMO1vNvKjKwO0
 +mGrDH9WR93fhhtPWNPtrflZHBBCb17jtbWFtvS2kj89jdQ7g0CW+4K07dwmDBgqbJOa
 WET02PkNwyJFWVpN3Lekwo2kd5JJCpx8Hcsp10Z7SRkyq2MSbSphFA4YLm/iKXI8aI+J
 7tI9VvAiW1XWAVvT5+fDmxtumMG3EPvQkUa1vduhoYdnH9wQs+KzjkensX+uQXWbkNBT
 H8SraYkjiEA4G30pV6gBhHvFYOHzSAN17yZ20Gc8tRGoAIsDKMMRi5XJKp6eZ+Yxr8ef
 5XyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=hPB2BiDoenUlvcP0wU20V2Ce9rNF/3kxoQEmPhZn830=;
 b=XRyD8idIrbJQHl3XiX34kO/lw3NBbdt8EFhhTsTsyuNCa2DsvBncCSihMNuTVJmr3Q
 +iiycLvNV3Z55pg+mOdXydps69ItTmcQ7Wm2FTGgwGV11bo6CEAv9Ncs0mazZfDaqsPQ
 shfD4imKhebHTumeasvBLEkifziJ+C197U2+C1EtSMRow1G3UKaS54bwXHuj7sGZQthv
 eFz9837Ful0ue9CPuiPkeAeMw2ECBhJdgfRAbjca2mEWX2eMfJDU5+v2IEsjgOIK6qAv
 Q/ho5vGxiE5koLc7TFixbZLy5gq1v32e6hVp+yD9RreFa23oKo7f+sKwApIMOJLVzREg
 NiDg==
X-Gm-Message-State: AOAM532zOdIce6Wt7egck+sSXhTlG62ZmT7qpQhL994oqEfBg3aw6RA3
 cgwh8ap8Onexf2Hr0/iiDMU=
X-Google-Smtp-Source: ABdhPJw6aduxKBnNhkSpMVx5odsRt7eanq1KUHIc40iChFJRSMK2MJmzBAqxBufS826xWiRmNx+z4A==
X-Received: by 2002:adf:fc08:: with SMTP id i8mr14808435wrr.181.1624942464054; 
 Mon, 28 Jun 2021 21:54:24 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t16sm2425898wrx.89.2021.06.28.21.54.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Jun 2021 21:54:23 -0700 (PDT)
Subject: Re: [PATCH 3/5] hw/pci-host/bonito: Allow PCI config accesses smaller
 than 32-bit
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20210624202747.1433023-1-f4bug@amsat.org>
 <20210624202747.1433023-4-f4bug@amsat.org>
 <10a58f2c-7b8f-fe6c-53c6-cd70b378395a@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <7b5a0eb0-d280-a25f-01c1-54f2b3e6ce5f@amsat.org>
Date: Tue, 29 Jun 2021 06:54:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <10a58f2c-7b8f-fe6c-53c6-cd70b378395a@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/24/21 10:49 PM, BALATON Zoltan wrote:
> On Thu, 24 Jun 2021, Philippe Mathieu-Daudé wrote:
>> When running the official PMON firmware for the Fuloong 2E, we see
>> 8-bit and 16-bit accesses to PCI config space:
>>
>>  $ qemu-system-mips64el -M fuloong2e -bios pmon_2e.bin \
>>    -trace -trace bonito\* -trace pci_cfg\*
>>
>>  pci_cfg_write vt82c686b-pm 05:4 @0x90 <- 0xeee1
>>  bonito_spciconf_small_access PCI config address is smaller then
>> 32-bit, addr: 0x4d2, size: 2
>>  pci_cfg_write vt82c686b-pm 05:4 @0xd2 <- 0x1
>>  pci_cfg_write vt82c686b-pm 05:4 @0x4 <- 0x1
>>  pci_cfg_write vt82c686b-isa 05:0 @0x4 <- 0x7
>>  bonito_spciconf_small_access PCI config address is smaller then
>> 32-bit, addr: 0x81, size: 1
>>  pci_cfg_read vt82c686b-isa 05:0 @0x81 -> 0x0
>>  bonito_spciconf_small_access PCI config address is smaller then
>> 32-bit, addr: 0x81, size: 1
>>  pci_cfg_write vt82c686b-isa 05:0 @0x81 <- 0x80
>>  bonito_spciconf_small_access PCI config address is smaller then
>> 32-bit, addr: 0x83, size: 1
>>  pci_cfg_write vt82c686b-isa 05:0 @0x83 <- 0x89
>>  bonito_spciconf_small_access PCI config address is smaller then
>> 32-bit, addr: 0x85, size: 1
>>  pci_cfg_write vt82c686b-isa 05:0 @0x85 <- 0x3
>>  bonito_spciconf_small_access PCI config address is smaller then
>> 32-bit, addr: 0x5a, size: 1
>>  pci_cfg_write vt82c686b-isa 05:0 @0x5a <- 0x7
>>  bonito_spciconf_small_access PCI config address is smaller then
>> 32-bit, addr: 0x85, size: 1
>>  pci_cfg_write vt82c686b-isa 05:0 @0x85 <- 0x1
>>
>> Also this is what the Linux kernel does since it supports the Bonito
>> north bridge:
>> https://elixir.bootlin.com/linux/v2.6.15/source/arch/mips/pci/ops-bonito64.c#L85
>>
>>
>> So it seems safe to assume the datasheet is incomplete or outdated
>> regarding the address constraints.
>>
>> This problem was exposed by commit 911629e6d3773a8adeab48b
>> ("vt82c686: Fix SMBus IO base and configuration registers").
>>
>> Reported-by: BALATON Zoltan <balaton@eik.bme.hu>
>> Suggested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> ---
>> hw/pci-host/bonito.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
>> index 751fdcec689..3c10608c9a2 100644
>> --- a/hw/pci-host/bonito.c
>> +++ b/hw/pci-host/bonito.c
>> @@ -187,7 +187,7 @@ FIELD(BONGENCFG, PCIQUEUE,      12, 1)
>> #define BONITO_PCICONF_FUN_MASK        0x700    /* [10:8] */
>> #define BONITO_PCICONF_FUN_OFFSET      8
>> #define BONITO_PCICONF_REG_MASK_DS     (~3)         /* Per datasheet */
>> -#define BONITO_PCICONF_REG_MASK        0xFC
>> +#define BONITO_PCICONF_REG_MASK_HW     0xff         /* As seen on
>> hardware */
> 
> I think we didn't really see it on hardware just inferred this from what
> the firmware does. That's a slight difference but may worth noting so
> people later don't think this was really tested with real hardware.
> Maybe "As seen with PMON"?

OK.

> Also if this is a loongson thing as was
> thought in the thread in December then maybe the #define could be named
> that instead of _HW so if somebody wants to reuse this model later ad
> Bonito then know that it implements the Loongson version.

Bonito64 is what is modelled. This is what I checked from the Linux
kernel:
https://elixir.bootlin.com/linux/v2.6.15/source/arch/mips/pci/ops-bonito64.c#L85

