Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E0D3E2C0F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:03:57 +0200 (CEST)
Received: from localhost ([::1]:45968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0S3-0000et-VP
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:03:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56260)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC0Q5-0007XU-37
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:01:53 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:54229)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mC0Q3-0002bB-37
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:01:52 -0400
Received: by mail-wm1-x329.google.com with SMTP id k4so5698833wms.3
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=1yzf7s7wIM10VaW6wPLIZTQ5iFcPxdVi7KVezzjQT80=;
 b=X1kLAVdMpSr2YQoBF01TiSMRDY0RZGGF+Phjtv7y/SRnNwW82afuZOKXRMN3ZeGTqq
 av7ifpRky9uodS7bL+Anmjm/Vw2tqNPnb/Hdr7ycGTabZKG0mTE7nTBs7K3VkFTkpcPH
 LeVugv8340CZVFEHpDYphkXK7/VA40IKcxW+Jfz8Jm8Mi7pP0wGTn2XAMr/j1d58cci6
 FFw9N0B6HUBkpXu76wLh7GX+NlrYGzju4W4QOv9fRaGsD2/eFoLF+Gx/b8Qs0FYXHbHX
 dUUOMPyMklyS63tHBlBI0uWt9HU2qHRJGp2enUsBVoosWA+N1eAFFcdbvauSarW5oiTP
 H4+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=1yzf7s7wIM10VaW6wPLIZTQ5iFcPxdVi7KVezzjQT80=;
 b=erG08PptMAPX2ro6xIIAJ2KNvcRn8NxLgc4y/iUWfM/oTNERVEdQQfDg36lOCKOKnP
 gzpdCXyWbCB4RSTMhVWFZ6uS5Y3oAHwCtNBlrCBj5jIQYtCm3cU/wv35AYDSF6Yw+BKd
 UGNxbWYwb4F1VEM+9d0N73NXu/mgcCiWUbEDCvCVkJip7MohVKrvKyrhmAVJ7ZbfHWn9
 Syfq13pV2Z+m2ePnGncd74Je4A7izVCBv1I0Wc3XKvgmtaBqJqywW5d9rDtWWC1DndcU
 OWeX8bG2kKRCTDvE6FQr6NBYSEiwHT+j3r+i7tNKU/DB4xdAiVyn/iCBZnq3Cfw6wWkU
 ZEMg==
X-Gm-Message-State: AOAM532PYxvqPcP7ccGUELVX+PmqGG4TWPerUDWGJJPkC7tabNdL0Mp3
 5ZN+GDQPRAEi7C3i8mDUgi8=
X-Google-Smtp-Source: ABdhPJw+zbWAyvG8lxovcgPpDjYCH9zotgeJBldhwDtkIKxaDjBK1bgP7nSFtNREjNA3YRd6IBrstA==
X-Received: by 2002:a05:600c:28b:: with SMTP id
 11mr19898034wmk.6.1628258507650; 
 Fri, 06 Aug 2021 07:01:47 -0700 (PDT)
Received: from [192.168.43.238] (206.red-95-127-155.staticip.rima-tde.net.
 [95.127.155.206])
 by smtp.gmail.com with ESMTPSA id t1sm9309974wrm.42.2021.08.06.07.01.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 06 Aug 2021 07:01:46 -0700 (PDT)
Subject: Re: [PATCH v3] hw/acpi: add an assertion check for non-null return
 from acpi_get_i386_pci_host
To: Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>
References: <20210726165743.232073-1-ani@anisinha.ca>
 <20210805111543.5fb99abf@redhat.com>
 <alpine.DEB.2.22.394.2108051705240.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051826190.291909@anisinha-lenovo>
 <alpine.DEB.2.22.394.2108051938340.329433@anisinha-lenovo>
 <20210806123754.1a1fa8a8@redhat.com>
 <alpine.DEB.2.22.394.2108061618320.433849@anisinha-lenovo>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d95cb2ea-2cf1-83fb-03c2-3bff8c537cd8@amsat.org>
Date: Fri, 6 Aug 2021 16:01:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.22.394.2108061618320.433849@anisinha-lenovo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x329.google.com
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

On 8/6/21 12:52 PM, Ani Sinha wrote:
> On Fri, 6 Aug 2021, Igor Mammedov wrote:
>> On Thu, 5 Aug 2021 19:42:35 +0530 (IST)
>> Ani Sinha <ani@anisinha.ca> wrote:
>>> On Thu, 5 Aug 2021, Ani Sinha wrote:
>>>> On Thu, 5 Aug 2021, Ani Sinha wrote:
>>>>> On Thu, 5 Aug 2021, Igor Mammedov wrote:
>>>>>> On Mon, 26 Jul 2021 22:27:43 +0530
>>>>>> Ani Sinha <ani@anisinha.ca> wrote:
>>>>>>
>>>>>>> All existing code using acpi_get_i386_pci_host() checks for a non-null
>>>>>>> return value from this function call. Instead of returning early when the value
>>>>>>> returned is NULL, assert instead. Since there are only two possible host buses
>>>>>>> for i386 - q35 and i440fx, a null value return from the function does not make
>>>>>>> sense in most cases and is likely an error situation.
>>>>>>>
>>>>>>> Fixes: c0e427d6eb5fef ("hw/acpi/ich9: Enable ACPI PCI hot-plug")
>>>>>>>
>>>>>>> Signed-off-by: Ani Sinha <ani@anisinha.ca>
>>>>>>> ---
>>>>>>>  hw/acpi/pcihp.c      |  8 ++++++++
>>>>>>>  hw/i386/acpi-build.c | 15 ++++++---------
>>>>>>>  2 files changed, 14 insertions(+), 9 deletions(-)
>>>>>>>
>>>>>>> changelog:
>>>>>>> v1: initial patch
>>>>>>> v2: removed comment addition - that can be sent as a separate patch.
>>>>>>> v3: added assertion for null host values for all cases except one.
>>>>>>>
>>>>>>> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
>>>>>>> index f4d706e47d..054ee8cbc5 100644
>>>>>>> --- a/hw/acpi/pcihp.c
>>>>>>> +++ b/hw/acpi/pcihp.c
>>>>>>> @@ -116,6 +116,12 @@ static void acpi_set_pci_info(void)
>>>>>>>      bsel_is_set = true;
>>>>>>>
>>>>>>>      if (!host) {
>>>>>>> +        /*
>>>>>>> +         * This function can be eventually called from
>>>>>>> +         * qemu_devices_reset() -> acpi_pcihp_reset() even
>>>>>>> +         * for architectures other than i386. Hence, we need
>>>>>>> +         * to ignore null values for host here.
>>>>>>> +         */
>>>>>>>          return;
>>>>>>>      }
>>>>>>
>>>>>> I suspect it's a MIPS target that call this code unnecessarily.
>>>>>> It would be better to get rid of this condition altogether.
>>>>>> Frr that I can suggest to make acpi_pcihp_reset() stub and
>>>>>> replace pcihp.c with stub (perhaps use acpi-x86-stub.c) when building
>>>>>> for MIPS.
>>>>>>
>>>>>> then a bunch of asserts/ifs won't be necessary,
>>>>>> just one in acpi_get_i386_pci_host() will be sufficient.
>>>>>>
>>>>>
>>>>> OK this is a good idea.
>>>>> I can see that mips-softmmu-config-devices.h has
>>>>> CONFIG_ACPI_X86 turned on for mips. This does not seem right.
>>>>>
>>>>> The issue here is:
>>>>>
>>>>> $ grep -R CONFIG_ACPI_X86 *
>>>>> devices/mips-softmmu/common.mak:CONFIG_ACPI_X86=y
>>>>>
>>>>> So after
>>>>>
>>>>> -CONFIG_ACPI_X86=y
>>>>> -CONFIG_PIIX4=y
>>>>>
>>>>> (the second one is needed because after removing first one we get:
>>>>>
>>>>> /usr/bin/ld: libcommon.fa.p/hw_isa_piix4.c.o: in function `piix4_create':
>>>>> /home/anisinha/workspace/qemu/build/../hw/isa/piix4.c:269: undefined
>>>>> reference to `piix4_pm_init'
>>>>>
>>>>> This is because in hw/acpi/meson.build, piix4.c is conditional on
>>>>> CONFIG_ACPI_X86. )
>>>>>
>>>>> /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_gt64xxx_pci.c.o: in
>>>>> function `gt64120_pci_set_irq':
>>>>> /home/anisinha/workspace/qemu/build/../hw/mips/gt64xxx_pci.c:1020:
>>>>> undefined reference to `piix4_dev'
>>>>> /usr/bin/ld: libqemu-mips-softmmu.fa.p/hw_mips_malta.c.o: in function
>>>>> `mips_malta_init':
>>>>> /home/anisinha/workspace/qemu/build/../hw/mips/malta.c:1404: undefined
>>>>> reference to `piix4_create'
>>>>>
>>>>> So should mips be doing piix stuff anyway? Is Piix4 etc not x86 specific?

PIIX, PIIX3 and PIIX4 are generic chipsets, not X86-specific.

QEMU's PIIX3 is a Frankenstein to support virtualization to a chipset
not designed for it.
If you look at it, the X86 machine use a PIIX3 but the PIIX3 doesn't
even provide an ACPI function. It appeared in the PIIX4. The kludge is
to instanciate the PIIX4.acpi from the PIIX3 and X86 ppl are happy with
it, but it makes it ugly for the other architectures.

>>>> Apparently this is by design:
>>>> https://qemu.readthedocs.io/en/stable/system/target-mips.html

What do you mean "by design"? The Malta uses a PIIX4 chipset for its
southbridge indeed.

>>>> which means mips malta will continue to use the x86 specific functions
>>>> like acpi_pcihp_reset(). Creating a stub for this with acpi-x86-stub.c
>>>> will result in a double symbol definition because CONFIG_PC is off for
>>>> mips.
>>>>
>>>
>>> Also to be noted that there is a stub for acpi_get_i386_pci_host() which
>>> simply returns NULL. This activates when CONFIG_PC is disabled. It is this
>>> stub that gets called for mips and hence the check for non-null host is
>>> needed in acpi_set_pci_info() function.
>> that were half measures to deal around code that shouldn't be called,
>> now with pcihp being used by both pc and q35 we don't have reason to
>> keep around null checks modulo mips calling code that shouldn't be
>> called there to begin with.
> 
> So malta mips does not need ACPI hotplug? In that case, maybe we should
> not make pcihp.c dependent on CONFIG_ACPI_X86. Ideas welcome.

Linux on Malta does use the ACPI features from the PIIX4.

Please dig in the archives, Igor / myself already argued enough about
this topic 2 years ago. The consensus was "yes, it is badly implemented,
but it works and we don't have time to get it cleaner, pc machine is
way more used than the malta one, so let not break the pc machines."

See:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg613194.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg690435.html
https://www.mail-archive.com/qemu-devel@nongnu.org/msg725504.html

