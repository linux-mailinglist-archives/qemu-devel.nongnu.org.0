Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DEE3468CC
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 20:17:54 +0100 (CET)
Received: from localhost ([::1]:50582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOmXJ-0001bY-5z
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 15:17:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOm0V-0008BD-9E
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:44:02 -0400
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:44591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lOm0G-0003eS-FI
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:43:53 -0400
Received: by mail-wm1-x332.google.com with SMTP id
 j4-20020a05600c4104b029010c62bc1e20so11426715wmi.3
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 11:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=9BB8AP2BlL2Z+DaWhfIeMts3WTuTpAs1lDvZCm3jtG4=;
 b=tKfUbRIdo7/I7tkx7c6voQGo7tdb+q3o7UXUOApO6txFJ8OGh4oxq/84WUYx5hC0ok
 VTKo3suvJVw3aGacG2K9Yo9NZ4ABJOQomGiZhoxb4Bzbgvus8iMD8h9g1n4Mjfo7D9dy
 VvH+H3BO8CoSiZ27phQY0a0oI5ywy2Rmu7eSdDJDo2Z7hMq8bVFMoniT5yoUs2qUwSdI
 LqT7SDMX/lWd+TLMmCCPCxCIOGwbVlOFqgd5kFVyXYNMfzHT7FBMMOTKIWjaUXPt32ku
 /b/szEdXMNajTNaODp7Em3gzR7PQUcOj7YD8TGPowgWdxAdPFw8+tEr+B24C3cGA1sdJ
 FDSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9BB8AP2BlL2Z+DaWhfIeMts3WTuTpAs1lDvZCm3jtG4=;
 b=mCGDmNn4whtrm1pgZNSfU+wjcUb0PwrbDDxX/lbFQ7VrqOoezI5AZDfQY+gUcwViiJ
 m9+t/zuLE7SWiSx4fhW3YmK7wUy4dleFEKhh9gCbAnguEMxYT+Hcy8uwrKqMsdK2fhcq
 2Bl54v4yIC1gviDNszSqOm4aQxOX1LTEKDRSK+7oeEA0eB/yLE9RYeyzg+yHglrhbaJu
 xF0Y12FAVtR8e1SVTzElw2bsoY/gbOZTJFKiOpyPjZszHewcaEZnNCsu2ryxt9ltqGIZ
 S8oY8yLhVBTDyYF96dR/HMojHmBkS9FwekG1ARxnJi/iyytSQtVVrOVaPIosLelBpsa0
 i2Gw==
X-Gm-Message-State: AOAM533Rp/i5FGtVHEvPC/ItbZUoBGObuJoNwv7qY056oD0xesYoNpH9
 oklA8pvYbXk2f9y3dNnJ/8k=
X-Google-Smtp-Source: ABdhPJytzzPcGEI3BBci7SmwN2xSXdAdJJelaEhWDFNkJAFbQ56Ex85wT8EWdmRERlQ3lQuuX/8Pjg==
X-Received: by 2002:a1c:a306:: with SMTP id m6mr4465873wme.13.1616525021931;
 Tue, 23 Mar 2021 11:43:41 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id h13sm3277961wmq.29.2021.03.23.11.43.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 11:43:41 -0700 (PDT)
Subject: Re: [PATCH v2 1/3] vt82c686.c: don't raise SCI when PCI_INTERRUPT_PIN
 isn't setup
To: Isaku Yamahata <isaku.yamahata@intel.com>, qemu-devel@nongnu.org,
 Huacai Chen <chenhuacai@kernel.org>, BALATON Zoltan <balaton@eik.bme.hu>
References: <cover.1616519655.git.isaku.yamahata@intel.com>
 <00c07067c1c8700bea48407cbec6d854e87de742.1616519655.git.isaku.yamahata@intel.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <3a91db07-a452-43a7-0156-a3720ad9e209@amsat.org>
Date: Tue, 23 Mar 2021 19:43:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <00c07067c1c8700bea48407cbec6d854e87de742.1616519655.git.isaku.yamahata@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: peter.maydell@linaro.org, imammedo@redhat.com, isaku.yamahata@gmail.com,
 Peter Maydell <Peter.maydel@linaro.org>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Isaku,

On 3/23/21 6:24 PM, Isaku Yamahata wrote:
> Without this patch, the following patch will triger clan runtime
> sanitizer warnings as follows. This patch proactively works around it.
> I let v582c686.c maintainer address a correct fix as I'm not sure
> about fuloong2e device model.
> 
>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>> QTEST_QEMU_IMG=./qemu-img
>> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
>> QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/qom-test --tap -k
>> PASS 1 qtest-mips64el/qom-test /mips64el/qom/loongson3-virt
>> PASS 2 qtest-mips64el/qom-test /mips64el/qom/none
>> PASS 3 qtest-mips64el/qom-test /mips64el/qom/magnum
>> PASS 4 qtest-mips64el/qom-test /mips64el/qom/mipssim
>> PASS 5 qtest-mips64el/qom-test /mips64el/qom/malta
>> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
>> PASS 6 qtest-mips64el/qom-test /mips64el/qom/fuloong2e
>> PASS 7 qtest-mips64el/qom-test /mips64el/qom/boston
>> PASS 8 qtest-mips64el/qom-test /mips64el/qom/pica61
>>
>> and similarly for eg
>>
>> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
>> QTEST_QEMU_IMG=./qemu-img
>> G_TEST_DBUS_DAEMON=/home/petmay01/linaro/qemu-for-merges/tests/dbus-vmstate-daemon.sh
>> QTEST_QEMU_BINARY=./qemu-system-mips64el tests/qtest/endianness-test
>> --tap -k
>> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
>> PASS 1 qtest-mips64el/endianness-test /mips64el/endianness/fuloong2e
>> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
>> PASS 2 qtest-mips64el/endianness-test /mips64el/endianness/split/fuloong2e
>> ../../hw/pci/pci.c:252:30: runtime error: shift exponent -1 is negative
>> PASS 3 qtest-mips64el/endianness-test /mips64el/endianness/combine/fuloong2e
> 
> Cc: Huacai Chen <chenhuacai@kernel.org>
> Cc: "Philippe Mathieu-Daudé" <f4bug@amsat.org>
> Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>
> Reported-by: Peter Maydell <Peter.maydel@linaro.org>
> Signed-off-by: Isaku Yamahata <isaku.yamahata@intel.com>
> ---
>  hw/isa/vt82c686.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 05d084f698..f0fb309f12 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -144,7 +144,18 @@ static void pm_update_sci(ViaPMState *s)
>                     ACPI_BITMASK_POWER_BUTTON_ENABLE |
>                     ACPI_BITMASK_GLOBAL_LOCK_ENABLE |
>                     ACPI_BITMASK_TIMER_ENABLE)) != 0);
> -    pci_set_irq(&s->dev, sci_level);
> +    if (pci_get_byte(s->dev.config + PCI_INTERRUPT_PIN)) {
> +        /*
> +         * FIXME:
> +         * Fix device model that realizes this PM device and remove
> +         * this work around.
> +         * The device model should wire SCI and setup
> +         * PCI_INTERRUPT_PIN properly.
> +         * If PIN# = 0(interrupt pin isn't used), don't raise SCI as
> +         * work around.
> +         */
> +        pci_set_irq(&s->dev, sci_level);

I'll defer this to Zoltan.

Personally I wouldn't care about SCI_EN on the vt82c686, as
it is not used by x86 machines (IOW, I'd not modify via_pm_reset
and KISS).

> +    }
>      /* schedule a timer interruption if needed */
>      acpi_pm_tmr_update(&s->ar, (s->ar.pm1.evt.en & ACPI_BITMASK_TIMER_ENABLE) &&
>                         !(pmsts & ACPI_BITMASK_TIMER_STATUS));
> 

