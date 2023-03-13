Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A306B70CA
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 09:04:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbd9I-00065w-Fz; Mon, 13 Mar 2023 04:03:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbd9C-00065Z-9f
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:03:11 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pbd99-0005Lz-PG
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 04:03:09 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 l7-20020a05600c4f0700b003e79fa98ce1so7197010wmq.2
 for <qemu-devel@nongnu.org>; Mon, 13 Mar 2023 01:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678694586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=VRVByIBjBiOzlr3Z/Pa5K+bxEgnDY1SGU7M2bbuRaik=;
 b=QUAxuevPn7oUofo+eeReN+4VYDwNLwsuxaNv5MCyIvY0yCZW1JHgur39IQxeMkxSYr
 l6fR6K3zsQWbxAxJo3nwQAXLfWvwUVxaKLVxczDmdHJ8nNYmUo79X+70GqylQVSnN+yN
 IIazXHpAqOcW+a3w6W5Jfp7HKo60Nc1hVv/2JbRT1sZ6R8jKVNXaIFtAsIZM9ZpjULHo
 EL8fBMnaK1fhdGEFt91vbXBTt3eqeHxfwKfCi/D6ko2cYy4iwcErO3ZwfORsuJFoOdSb
 JO7cbTiPfg5tWBtiN3ZHYAU7km3rKeWADe4NsgClpqADcpCl/j0f0ODeW14zhHE9+bot
 +JZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678694586;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VRVByIBjBiOzlr3Z/Pa5K+bxEgnDY1SGU7M2bbuRaik=;
 b=mrHssLqDlIkfXUvK6Plo5+L55dGZoAgpzKWTgMGfZVLOX25tLLLnH9VDr6QZ/XWRxr
 5lQ78Xp8NJ+emw5DeDsjBbLUuSO9MUyxD4o7qjp+p1RvQi5dw0Gi/8GMvgp6UKDqrfYR
 Kw49VcMnfXVhsMnYpJbrfgHgb1+0xWfAgo9x3+5uEgkdbmuy5jPf86/9HldIT/gwg/We
 1lXMhjKNkKq2sPmuU65hBZ4hZvJlgXJs/ETHMzqXlcUNNA8HUSjqo+pyn1+4X0TA1w5y
 kXVvdbCbqaBNOeksbc9g6vvkaLpM5VGnkt0XpKzXsQFeN9bg9l/nO32RYeTQuu85vI09
 iIvA==
X-Gm-Message-State: AO0yUKVL7TR4R6MrXHFlLjFPwPIhP55pdxzDoOJ9+sjFXy58Bvl7wFgF
 a2luaG4ADg9aA62et3ZKHCrpmw==
X-Google-Smtp-Source: AK7set8yzUwvZDN5dIf2wbyh9VrdDsQLxpUOJtSnZ2gxUpFY0Wb1UipWt8gUZJiTeLPmYWRA0lgoLA==
X-Received: by 2002:a05:600c:4587:b0:3df:e468:17dc with SMTP id
 r7-20020a05600c458700b003dfe46817dcmr9363679wmo.40.1678694585968; 
 Mon, 13 Mar 2023 01:03:05 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 k26-20020a05600c1c9a00b003dfe549da4fsm9030477wms.18.2023.03.13.01.03.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Mar 2023 01:03:05 -0700 (PDT)
Message-ID: <ac03c48a-97ad-a02a-c5cf-1e0a0bc9625d@linaro.org>
Date: Mon, 13 Mar 2023 09:03:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PULL 00/73] virtio,pc,pci: features, fixes
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <cover.1678237635.git.mst@redhat.com>
 <20230309094647-mutt-send-email-mst@kernel.org>
 <CAFEAcA-pO1OYwO8PZwSjFiLX=MJcK+cYqtFqaF3ZZtTGdZ_EXw@mail.gmail.com>
 <dbc5dad7-0bb7-e947-60f8-84b6ff5a2dde@linaro.org>
 <20230311141858-mutt-send-email-mst@kernel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230311141858-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/3/23 20:22, Michael S. Tsirkin wrote:
> On Fri, Mar 10, 2023 at 11:20:36PM +0100, Philippe Mathieu-Daudé wrote:
>> Hi,
>>
>> On 10/3/23 18:32, Peter Maydell wrote:
>>> On Thu, 9 Mar 2023 at 14:47, Michael S. Tsirkin <mst@redhat.com> wrote:
>>
>>>> I moved it one commit back, now at (96cb085897)
>>>> Cornelia posted some concerns about the last commit.
>>>>
>>>>> ----------------------------------------------------------------
>>>>> virtio,pc,pci: features, fixes
>>>>>
>>>>> Several features that landed at the last possible moment:
>>>>>
>>>>> Passthrough HDM decoder emulation
>>>>> Refactor cryptodev
>>>>> RAS error emulation and injection
>>>>> acpi-index support on non-hotpluggable slots
>>>>> Dynamically switch to vhost shadow virtqueues at vdpa net migration
>>>>>
>>>>> Plus a couple of bugfixes that look important to have in the release.
>>>>>
>>>>> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
>>>>>
>>>
>>>
>>> Applied, thanks.
>>
>> I'm getting this failure on Darwin (m1):
>>
>> C compiler for the host machine: clang (clang 14.0.0 "Apple clang version
>> 14.0.0 (clang-1400.0.29.202)")
>> Program iasl found: YES (/opt/homebrew/bin/iasl)
>>
>> $ make check-qtest-i386 V=1
>>   ...
>>   3/61 qemu:qtest+qtest-i386 / qtest-i386/bios-tables-test ERROR
>> 17.52s   killed by signal 6 SIGABRT
>> ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>> ✀ ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――
>> stderr:
>> acpi-test: Warning! DSDT binary file mismatch. Actual
>> [aml:/var/folders/yj/r7khncsj4d77k04ybz9lw4tm0000gn/T/aml-HANQ11], Expected
>> [aml:tests/data/acpi/pc/DSDT.nosmm].
> 
> Philippe, is tests/data/acpi/DSDT.nosmm in your tree for some reason?
> Because it's not in mine:
> $ git log -- tests/data/acpi/DSDT.nosmm
> 
> 
> It's a side effect of how our tests work ATM that a presence of
> a corrupted file in the source directory will confuse the test
> and make it fail, and git reset will not be enough since some
> of these can be untracked - you need git clean.

Indeed 'git status' shows:

	tests/data/acpi/microvm/APIC.rtc
	tests/data/acpi/microvm/APIC.usb
	tests/data/acpi/microvm/FACP.ioapic2
	tests/data/acpi/microvm/FACP.pcie
	tests/data/acpi/microvm/FACP.rtc
	tests/data/acpi/microvm/FACP.usb
	tests/data/acpi/pc/APIC.acpierst
	tests/data/acpi/pc/APIC.bridge
	tests/data/acpi/pc/APIC.hpbridge
	tests/data/acpi/pc/APIC.hpbrroot
	tests/data/acpi/pc/APIC.ipmikcs
	tests/data/acpi/pc/APIC.memhp
	tests/data/acpi/pc/APIC.nohpet
	tests/data/acpi/pc/APIC.nosmm
	tests/data/acpi/pc/APIC.numamem
	tests/data/acpi/pc/APIC.roothp
	tests/data/acpi/pc/APIC.smm-compat
	tests/data/acpi/pc/APIC.smm-compat-nosmm
	tests/data/acpi/pc/DSDT.nosmm
	tests/data/acpi/pc/DSDT.smm-compat
	tests/data/acpi/pc/DSDT.smm-compat-nosmm
	tests/data/acpi/pc/FACP.acpierst
	tests/data/acpi/pc/FACP.acpihmat
	tests/data/acpi/pc/FACP.bridge
	tests/data/acpi/pc/FACP.cphp
	tests/data/acpi/pc/FACP.dimmpxm
	tests/data/acpi/pc/FACP.hpbridge
	tests/data/acpi/pc/FACP.hpbrroot
	tests/data/acpi/pc/FACP.ipmikcs
	tests/data/acpi/pc/FACP.memhp
	tests/data/acpi/pc/FACP.nohpet
	tests/data/acpi/pc/FACP.numamem
	tests/data/acpi/pc/FACP.roothp
	tests/data/acpi/pc/FACP.smm-compat
	tests/data/acpi/pc/FACP.smm-compat-nosmm
	tests/data/acpi/pc/FACS.acpierst
	tests/data/acpi/pc/FACS.acpihmat
	tests/data/acpi/pc/FACS.bridge
	tests/data/acpi/pc/FACS.cphp
	tests/data/acpi/pc/FACS.dimmpxm
	tests/data/acpi/pc/FACS.hpbridge
	tests/data/acpi/pc/FACS.hpbrroot
	tests/data/acpi/pc/FACS.ipmikcs
	tests/data/acpi/pc/FACS.memhp
	tests/data/acpi/pc/FACS.nohpet
	tests/data/acpi/pc/FACS.nosmm
	tests/data/acpi/pc/FACS.numamem
	tests/data/acpi/pc/FACS.roothp
	tests/data/acpi/pc/FACS.smm-compat
	tests/data/acpi/pc/FACS.smm-compat-nosmm
	tests/data/acpi/pc/HPET.acpierst
	tests/data/acpi/pc/HPET.acpihmat
	tests/data/acpi/pc/HPET.bridge
	tests/data/acpi/pc/HPET.cphp
	tests/data/acpi/pc/HPET.dimmpxm
	tests/data/acpi/pc/HPET.hpbridge
	tests/data/acpi/pc/HPET.hpbrroot
	tests/data/acpi/pc/HPET.ipmikcs
	tests/data/acpi/pc/HPET.memhp
	tests/data/acpi/pc/HPET.nosmm
	tests/data/acpi/pc/HPET.numamem
	tests/data/acpi/pc/HPET.roothp
	tests/data/acpi/pc/HPET.smm-compat
	tests/data/acpi/pc/HPET.smm-compat-nosmm
	tests/data/acpi/pc/WAET.acpierst
	tests/data/acpi/pc/WAET.acpihmat
	tests/data/acpi/pc/WAET.bridge
	tests/data/acpi/pc/WAET.cphp
	tests/data/acpi/pc/WAET.dimmpxm
	tests/data/acpi/pc/WAET.hpbridge
	tests/data/acpi/pc/WAET.hpbrroot
	tests/data/acpi/pc/WAET.ipmikcs
	tests/data/acpi/pc/WAET.memhp
	tests/data/acpi/pc/WAET.nohpet
	tests/data/acpi/pc/WAET.nosmm
	tests/data/acpi/pc/WAET.numamem
	tests/data/acpi/pc/WAET.roothp
	tests/data/acpi/pc/WAET.smm-compat
	tests/data/acpi/pc/WAET.smm-compat-nosmm
	tests/data/acpi/q35/APIC.acpierst
	tests/data/acpi/q35/APIC.applesmc
	tests/data/acpi/q35/APIC.bridge
	tests/data/acpi/q35/APIC.cxl
	tests/data/acpi/q35/APIC.ipmibt
	tests/data/acpi/q35/APIC.ipmismbus
	tests/data/acpi/q35/APIC.ivrs
	tests/data/acpi/q35/APIC.memhp
	tests/data/acpi/q35/APIC.mmio64
	tests/data/acpi/q35/APIC.multi-bridge
	tests/data/acpi/q35/APIC.noacpihp
	tests/data/acpi/q35/APIC.nohpet
	tests/data/acpi/q35/APIC.nosmm
	tests/data/acpi/q35/APIC.numamem
	tests/data/acpi/q35/APIC.pvpanic-isa
	tests/data/acpi/q35/APIC.slic
	tests/data/acpi/q35/APIC.smm-compat
	tests/data/acpi/q35/APIC.smm-compat-nosmm
	tests/data/acpi/q35/APIC.tis.tpm12
	tests/data/acpi/q35/APIC.tis.tpm2
	tests/data/acpi/q35/APIC.viot
	tests/data/acpi/q35/DSDT.dsl
	tests/data/acpi/q35/DSDT.nosmm
	tests/data/acpi/q35/DSDT.slic
	tests/data/acpi/q35/DSDT.smm-compat
	tests/data/acpi/q35/DSDT.smm-compat-nosmm
	tests/data/acpi/q35/FACP.acpierst
	tests/data/acpi/q35/FACP.acpihmat
	tests/data/acpi/q35/FACP.acpihmat-noinitiator
	tests/data/acpi/q35/FACP.applesmc
	tests/data/acpi/q35/FACP.bridge
	tests/data/acpi/q35/FACP.cphp
	tests/data/acpi/q35/FACP.cxl
	tests/data/acpi/q35/FACP.dimmpxm
	tests/data/acpi/q35/FACP.ipmibt
	tests/data/acpi/q35/FACP.ipmismbus
	tests/data/acpi/q35/FACP.ivrs
	tests/data/acpi/q35/FACP.memhp
	tests/data/acpi/q35/FACP.mmio64
	tests/data/acpi/q35/FACP.multi-bridge
	tests/data/acpi/q35/FACP.noacpihp
	tests/data/acpi/q35/FACP.nohpet
	tests/data/acpi/q35/FACP.numamem
	tests/data/acpi/q35/FACP.pvpanic-isa
	tests/data/acpi/q35/FACP.smm-compat
	tests/data/acpi/q35/FACP.smm-compat-nosmm
	tests/data/acpi/q35/FACP.tis.tpm12
	tests/data/acpi/q35/FACP.tis.tpm2
	tests/data/acpi/q35/FACP.viot
	tests/data/acpi/q35/FACS.acpierst
	tests/data/acpi/q35/FACS.acpihmat
	tests/data/acpi/q35/FACS.acpihmat-noinitiator
	tests/data/acpi/q35/FACS.applesmc
	tests/data/acpi/q35/FACS.bridge
	tests/data/acpi/q35/FACS.cphp
	tests/data/acpi/q35/FACS.cxl
	tests/data/acpi/q35/FACS.dimmpxm
	tests/data/acpi/q35/FACS.ipmibt
	tests/data/acpi/q35/FACS.ipmismbus
	tests/data/acpi/q35/FACS.ivrs
	tests/data/acpi/q35/FACS.memhp
	tests/data/acpi/q35/FACS.mmio64
	tests/data/acpi/q35/FACS.multi-bridge
	tests/data/acpi/q35/FACS.noacpihp
	tests/data/acpi/q35/FACS.nohpet
	tests/data/acpi/q35/FACS.nosmm
	tests/data/acpi/q35/FACS.numamem
	tests/data/acpi/q35/FACS.pvpanic-isa
	tests/data/acpi/q35/FACS.slic
	tests/data/acpi/q35/FACS.smm-compat
	tests/data/acpi/q35/FACS.smm-compat-nosmm
	tests/data/acpi/q35/FACS.tis.tpm12
	tests/data/acpi/q35/FACS.tis.tpm2
	tests/data/acpi/q35/FACS.viot
	tests/data/acpi/q35/HPET.acpierst
	tests/data/acpi/q35/HPET.acpihmat
	tests/data/acpi/q35/HPET.acpihmat-noinitiator
	tests/data/acpi/q35/HPET.applesmc
	tests/data/acpi/q35/HPET.bridge
	tests/data/acpi/q35/HPET.cphp
	tests/data/acpi/q35/HPET.cxl
	tests/data/acpi/q35/HPET.dimmpxm
	tests/data/acpi/q35/HPET.ipmibt
	tests/data/acpi/q35/HPET.ipmismbus
	tests/data/acpi/q35/HPET.ivrs
	tests/data/acpi/q35/HPET.memhp
	tests/data/acpi/q35/HPET.mmio64
	tests/data/acpi/q35/HPET.multi-bridge
	tests/data/acpi/q35/HPET.noacpihp
	tests/data/acpi/q35/HPET.nosmm
	tests/data/acpi/q35/HPET.numamem
	tests/data/acpi/q35/HPET.pvpanic-isa
	tests/data/acpi/q35/HPET.slic
	tests/data/acpi/q35/HPET.smm-compat
	tests/data/acpi/q35/HPET.smm-compat-nosmm
	tests/data/acpi/q35/HPET.tis.tpm12
	tests/data/acpi/q35/HPET.tis.tpm2
	tests/data/acpi/q35/HPET.viot
	tests/data/acpi/q35/MCFG.acpierst
	tests/data/acpi/q35/MCFG.acpihmat
	tests/data/acpi/q35/MCFG.acpihmat-noinitiator
	tests/data/acpi/q35/MCFG.applesmc
	tests/data/acpi/q35/MCFG.bridge
	tests/data/acpi/q35/MCFG.cphp
	tests/data/acpi/q35/MCFG.cxl
	tests/data/acpi/q35/MCFG.dimmpxm
	tests/data/acpi/q35/MCFG.ipmibt
	tests/data/acpi/q35/MCFG.ipmismbus
	tests/data/acpi/q35/MCFG.ivrs
	tests/data/acpi/q35/MCFG.memhp
	tests/data/acpi/q35/MCFG.mmio64
	tests/data/acpi/q35/MCFG.multi-bridge
	tests/data/acpi/q35/MCFG.noacpihp
	tests/data/acpi/q35/MCFG.nohpet
	tests/data/acpi/q35/MCFG.nosmm
	tests/data/acpi/q35/MCFG.numamem
	tests/data/acpi/q35/MCFG.pvpanic-isa
	tests/data/acpi/q35/MCFG.slic
	tests/data/acpi/q35/MCFG.smm-compat
	tests/data/acpi/q35/MCFG.smm-compat-nosmm
	tests/data/acpi/q35/MCFG.tis.tpm12
	tests/data/acpi/q35/MCFG.tis.tpm2
	tests/data/acpi/q35/MCFG.viot
	tests/data/acpi/q35/WAET.acpierst
	tests/data/acpi/q35/WAET.acpihmat
	tests/data/acpi/q35/WAET.acpihmat-noinitiator
	tests/data/acpi/q35/WAET.applesmc
	tests/data/acpi/q35/WAET.bridge
	tests/data/acpi/q35/WAET.cphp
	tests/data/acpi/q35/WAET.cxl
	tests/data/acpi/q35/WAET.dimmpxm
	tests/data/acpi/q35/WAET.ipmibt
	tests/data/acpi/q35/WAET.ipmismbus
	tests/data/acpi/q35/WAET.ivrs
	tests/data/acpi/q35/WAET.memhp
	tests/data/acpi/q35/WAET.mmio64
	tests/data/acpi/q35/WAET.multi-bridge
	tests/data/acpi/q35/WAET.noacpihp
	tests/data/acpi/q35/WAET.nohpet
	tests/data/acpi/q35/WAET.nosmm
	tests/data/acpi/q35/WAET.numamem
	tests/data/acpi/q35/WAET.pvpanic-isa
	tests/data/acpi/q35/WAET.slic
	tests/data/acpi/q35/WAET.smm-compat
	tests/data/acpi/q35/WAET.smm-compat-nosmm
	tests/data/acpi/q35/WAET.tis.tpm12
	tests/data/acpi/q35/WAET.tis.tpm2
	tests/data/acpi/q35/WAET.viot
	tests/data/acpi/virt/APIC.memhp
	tests/data/acpi/virt/APIC.numamem
	tests/data/acpi/virt/APIC.pxb
	tests/data/acpi/virt/DBG2.acpihmatvirt
	tests/data/acpi/virt/DBG2.memhp
	tests/data/acpi/virt/DBG2.numamem
	tests/data/acpi/virt/DBG2.pxb
	tests/data/acpi/virt/DBG2.topology
	tests/data/acpi/virt/DSDT.numamem
	tests/data/acpi/virt/FACP.acpihmatvirt
	tests/data/acpi/virt/FACP.memhp
	tests/data/acpi/virt/FACP.numamem
	tests/data/acpi/virt/FACP.pxb
	tests/data/acpi/virt/FACP.topology
	tests/data/acpi/virt/GTDT.acpihmatvirt
	tests/data/acpi/virt/GTDT.memhp
	tests/data/acpi/virt/GTDT.numamem
	tests/data/acpi/virt/GTDT.pxb
	tests/data/acpi/virt/GTDT.topology
	tests/data/acpi/virt/IORT.acpihmatvirt
	tests/data/acpi/virt/IORT.memhp
	tests/data/acpi/virt/IORT.numamem
	tests/data/acpi/virt/IORT.pxb
	tests/data/acpi/virt/IORT.topology
	tests/data/acpi/virt/MCFG.acpihmatvirt
	tests/data/acpi/virt/MCFG.memhp
	tests/data/acpi/virt/MCFG.numamem
	tests/data/acpi/virt/MCFG.pxb
	tests/data/acpi/virt/MCFG.topology
	tests/data/acpi/virt/PPTT.memhp
	tests/data/acpi/virt/PPTT.numamem
	tests/data/acpi/virt/PPTT.pxb
	tests/data/acpi/virt/SPCR.acpihmatvirt
	tests/data/acpi/virt/SPCR.memhp
	tests/data/acpi/virt/SPCR.numamem
	tests/data/acpi/virt/SPCR.pxb
	tests/data/acpi/virt/SPCR.topology

Tests pass after removing all of them. I forgot to check their
timestamp before removing, so I don't know how/when they appeared
in my source directory...

