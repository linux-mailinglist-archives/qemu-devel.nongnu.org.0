Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84BCE3E2E6E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 18:39:59 +0200 (CEST)
Received: from localhost ([::1]:39750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC2t4-0006q9-5i
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 12:39:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC2sH-000691-Q8
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 12:39:09 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:36672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC2sF-0004TI-IT
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 12:39:09 -0400
Received: by mail-lj1-x22b.google.com with SMTP id y7so1752537ljp.3
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 09:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=3cbLw9DyBxARf+TZ75GnMlmjSvMPuvRpQMpXsi+/54E=;
 b=EXfZnYDM4tyqXd2965t/De9jO/+A/hQ+IHNkiyOSlkWJZZ6299GJD0HQGsZiRq93jj
 a8niqB8RN7qF7ZF5KixE2KoCKR7pXfdaYinmjn6j3tIfPuw8ax4g8/YEF/EJWgRknpXg
 6kayxFWTsdO5XjnF9pr6fUnYoDprxfjOZn4wBMIapzfzEbSnXmhCMlCSigKUk6u611nA
 m3cYk+xJ3bR4XVUyYmvsz5Yv1xvHVqMzY2MYAtwcZnSlBdM9kONvYStP6HCjsKSH7ipk
 xtWJ67pcumCsvbOFersAjv/wdNYgPA3l5kiHSl6cc03VX36Vyax2RL3DSBt0GFfAUvFw
 IPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:from:to:cc:references:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=3cbLw9DyBxARf+TZ75GnMlmjSvMPuvRpQMpXsi+/54E=;
 b=KCj04gddImRm1JzaLL6uOIevlBevpnl+pNv1QZSmPAhyDI8zKNF239VQDtHW8D4Ab1
 zRwEzsvJWVhqalXtn7/CVJoOlJa2MGnOk/viwhZ4RcRVkS5bDYYIMlDQikHO53xv8X0s
 TACs5140TZ4ukanNGAsLS/uUM3XHjcqL/nEWODlZN9xd562i+GghACxc4bmkvsexN4we
 13zwVLb8a/w+f9B9mZF+b3pEdmZxDSxOjT2HW5Zd7yjpWKXwpHaGBVerBspEl4+ai4QJ
 z9oc3bdbGVtktnoyOJZT3nrDeQwRK1vbh29vZfn2uvT9HXllnLIb6s5xqCCnu7CvyT/p
 jg+w==
X-Gm-Message-State: AOAM533xuJA0hINZobFoZ9ggo9agb1/TQ1IVvG8xdBXABs+sfugy1rN7
 svxwZJqyU2fpI9u5VD/omAg=
X-Google-Smtp-Source: ABdhPJy+V4Ve45Xj1Zq0ZeX5UvHfJ4noClGHDmZL5zYReTxreL+yxkjVsnoVAuv7ET6Gihmzy5hpyw==
X-Received: by 2002:a2e:9304:: with SMTP id e4mr7208153ljh.244.1628267945873; 
 Fri, 06 Aug 2021 09:39:05 -0700 (PDT)
Received: from [10.101.1.184] ([185.224.57.167])
 by smtp.gmail.com with ESMTPSA id m5sm705017ljq.22.2021.08.06.09.39.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 09:39:04 -0700 (PDT)
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
To: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210805111543.5fb99abf@redhat.com>
 <alpine.DEB.2.22.394.2108051705240.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051826190.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051938340.329433@anisinha-lenovo>
 <20210806123754.1a1fa8a8@redhat.com>
 <alpine.DEB.2.22.394.2108061618320.433849@anisinha-lenovo>
 <d95cb2ea-2cf1-83fb-03c2-3bff8c537cd8@amsat.org>
Message-ID: <8b936257-2091-d92f-95ba-e7f917750bcb@amsat.org>
Date: Fri, 6 Aug 2021 18:38:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <d95cb2ea-2cf1-83fb-03c2-3bff8c537cd8@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-lj1-x22b.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.619,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, jusual@redhat.com,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/6/21 4:01 PM, Philippe Mathieu-Daudé wrote:
> On 8/6/21 12:52 PM, Ani Sinha wrote:
>> On Fri, 6 Aug 2021, Igor Mammedov wrote:
>>> On Thu, 5 Aug 2021 19:42:35 +0530 (IST)
>>> Ani Sinha <ani@anisinha.ca> wrote:
>>>> On Thu, 5 Aug 2021, Ani Sinha wrote:
>>>>> On Thu, 5 Aug 2021, Ani Sinha wrote:
>>>>>> On Thu, 5 Aug 2021, Igor Mammedov wrote:
>>>>>>> On Mon, 26 Jul 2021 22:27:43 +0530
>>>>>>> Ani Sinha <ani@anisinha.ca> wrote:
>>>>>>>
>>>>>>>> All existing code using acpi_get_i386_pci_host() checks for a non-null
>>>>>>>> return value from this function call. Instead of returning early when the value
>>>>>>>> returned is NULL, assert instead. Since there are only two possible host buses
>>>>>>>> for i386 - q35 and i440fx, a null value return from the function does not make
>>>>>>>> sense in most cases and is likely an error situation.
>>>>>>>>
>>>>>>>> Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
>>>>>>>>
>>>>>>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
>>>>>>>> ---
>>>>>>>>  hw/acpi/pcihp.c      |  8 ++++++++
>>>>>>>>  hw/i386/acpi-build.c | 15 ++++++---------
>>>>>>>>  2 files changed, 14 insertions(+), 9 deletions(-)
>>>>>>>>
>>>>>>>> changelog:
>>>>>>>> v1: initial patch
>>>>>>>> v2: removed comment addition - that can be sent as a separate patch.
>>>>>>>> v3: added assertion for null host values for all cases except one.
>>>>>>>>
>>>>>>>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>>>>>>>> index f4d706e47d..054ee8cbc5 100644
>>>>>>>> --- a/hw/acpi/pcihp.c
>>>>>>>> +++ b/hw/acpi/pcihp.c
>>>>>>>> @@ -116,6 +116,12 @@ static void acpi_set_pci_info(void)
>>>>>>>>      bsel_is_set = true;
>>>>>>>>
>>>>>>>>      if (!host) {
>>>>>>>> +        /*
>>>>>>>> +         * This function can be eventually called from
>>>>>>>> +         * qemu_devices_reset() -> acpi_pcihp_reset() even
>>>>>>>> +         * for architectures other than i386. Hence, we need
>>>>>>>> +         * to ignore null values for host here.
>>>>>>>> +         */
>>>>>>>>          return;
>>>>>>>>      }
>>>>>>>
>>>>>>> I suspect it's a MIPS target that call this code unnecessarily.
>>>>>>> It would be better to get rid of this condition altogether.
>>>>>>> Frr that I can suggest to make acpi_pcihp_reset() stub and
>>>>>>> replace pcihp.c with stub (perhaps use acpi-x86-stub.c) when building
>>>>>>> for MIPS.
>>>>>>>
>>>>>>> then a bunch of asserts/ifs won't be necessary,
>>>>>>> just one in acpi_get_i386_pci_host() will be sufficient.
>>>>>>>
>>>>>>
>>>>>> OK this is a good idea.
>>>>>> I can see that mips-softmmu-config-devices.h has
>>>>>> CONFIG_ACPI_X86 turned on for mips. This does not seem right.
>>>>>>
>>>>>> The issue here is:
>>>>>>
>>>>>> $ grep -R CONFIG_ACPI_X86 *
>>>>>> devices/mips-softmmu/common.mak:CONFIG_ACPI_X86=y
>>>>>>
>>>>>> So after
>>>>>>
>>>>>> -CONFIG_ACPI_X86=y
>>>>>> -CONFIG_PIIX4=y
>>>>>>
>>>>>> (the second one is needed because after removing first one we get:
>>>>>>
>>>>>> /usr/bin/ld: libcommon.fa.p/hw_isa_piix4.c.o: in function `piix4_create':
>>>>>> /home/anisinha/workspace/qemu/build/../hw/isa/piix4.c:269: undefined
>>>>>> reference to `piix4_pm_init'
>>>>>>
>>>>>> This is because in hw/acpi/meson.build, piix4.c is conditional on
>>>>>> CONFIG_ACPI_X86. )
>>>>>>
>>>>>> /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_gt64xxx_pci.c.o: in
>>>>>> function `gt64120_pci_set_irq':
>>>>>> /home/anisinha/workspace/qemu/build/../hw/mips/gt64xxx_pci.c:1020:
>>>>>> undefined reference to `piix4_dev'
>>>>>> /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_malta.c.o: in function
>>>>>> `mips_malta_init':
>>>>>> /home/anisinha/workspace/qemu/build/../hw/mips/malta.c:1404: undefined
>>>>>> reference to `piix4_create'
>>>>>>
>>>>>> So should mips be doing piix stuff anyway? Is Piix4 etc not x86 specific?
> 
> PIIX, PIIX3 and PIIX4 are generic chipsets, not X86-specific.
> 
> QEMU's PIIX3 is a Frankenstein to support virtualization to a chipset
> not designed for it.
> If you look at it, the X86 machine use a PIIX3 but the PIIX3 doesn't
> even provide an ACPI function. It appeared in the PIIX4. The kludge is
> to instanciate the PIIX4.acpi from the PIIX3 and X86 ppl are happy with
> it, but it makes it ugly for the other architectures.
> 
>>>>> Apparently this is by design:
>>>>> https://qemu.readthedocs.io/en/stable/system/target-mips.html
> 
> What do you mean "by design"? The Malta uses a PIIX4 chipset for its
> southbridge indeed.
> 
>>>>> which means mips malta will continue to use the x86 specific functions
>>>>> like acpi_pcihp_reset(). Creating a stub for this with acpi-x86-stub.c
>>>>> will result in a double symbol definition because CONFIG_PC is off for
>>>>> mips.
>>>>>
>>>>
>>>> Also to be noted that there is a stub for acpi_get_i386_pci_host() which
>>>> simply returns NULL. This activates when CONFIG_PC is disabled. It is this
>>>> stub that gets called for mips and hence the check for non-null host is
>>>> needed in acpi_set_pci_info() function.
>>> that were half measures to deal around code that shouldn't be called,
>>> now with pcihp being used by both pc and q35 we don't have reason to
>>> keep around null checks modulo mips calling code that shouldn't be
>>> called there to begin with.
>>
>> So malta mips does not need ACPI hotplug? In that case, maybe we should
>> not make pcihp.c dependent on CONFIG_ACPI_X86. Ideas welcome.
> 
> Linux on Malta does use the ACPI features from the PIIX4.
> 
> Please dig in the archives, Igor / myself already argued enough about
> this topic 2 years ago. The consensus was "yes, it is badly implemented,
> but it works and we don't have time to get it cleaner, pc machine is
> way more used than the malta one, so let not break the pc machines."
> 
> See:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg613194.html
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg690435.html
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg725504.html

Also:
https://gitlab.com/qemu-project/qemu/-/issues/193
https://gitlab.com/qemu-project/qemu/-/issues/221


