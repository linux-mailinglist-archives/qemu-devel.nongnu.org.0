Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835035BC013
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Sep 2022 23:34:53 +0200 (CEST)
Received: from localhost ([::1]:56998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oa1wB-00039N-Lo
	for lists+qemu-devel@lfdr.de; Sun, 18 Sep 2022 17:34:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oa1tL-0000fM-DZ
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 17:31:55 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:34670)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1oa1tJ-000697-Hd
 for qemu-devel@nongnu.org; Sun, 18 Sep 2022 17:31:55 -0400
Received: by mail-ej1-x62e.google.com with SMTP id y3so60508050ejc.1
 for <qemu-devel@nongnu.org>; Sun, 18 Sep 2022 14:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date;
 bh=7cSyv5n3n4GFdt57KGeY4LPwlwCnU2/LejG4tbGVPjY=;
 b=jFe/UX7+S+OvbYIrH6yo2CVWSeXKv++AWGgmfYK5pAcO7e1NH0zo0opHfjpX/4R6sm
 pG3tZDqC7pbTy9+T0rPk9NNaxtUxI1TAt9lYQaCkcXVDYPaZfbqLZA5auWHE4geEheAq
 DfNkwQ2Dw4InhbQY83f1Jc5dUp0CYYibPWSHFhP1tN/BVTgqi/+5ZSvWikRMbyWsDbU8
 EwQVmx6UsbmhdwXc4jIoykgkBKCJVhpd0L21LP1kXSOETt7ZcBs8py4gmadboqzxHuPe
 ix5zfywap8cFTucn0S1yVJwDqTWP7waB7GrhuPNtRSEndrkAB1W9dajxH53D/IDXsfu2
 YhVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date;
 bh=7cSyv5n3n4GFdt57KGeY4LPwlwCnU2/LejG4tbGVPjY=;
 b=ilunOcWinJReg4QsXHVfH+QYiN1NF2FFbW7B/MmWkGN493DPCcYkL6RkcUGCa8uAJp
 +1HSTSTl9UgKfkMQ+Pc8KS0BS+b9figm+yiTQebnZBcpDLsZGtmyLW3IWvAwEauqDoyl
 upaGYdfEknY9rHFfeYnX2m6z+mDK5ZOaGZPZqtvXCvz/2lE92ZsAPQGW4JIZLyKc6659
 YvV+NXYgjMXYvmGAllR/8xD/6EKsDqclQui0m0G0zT22nTOfZ7wfyv8fMeDdo2OElO9S
 kTxRAcjMsAlkU1E72uP+pGK/V7I/QxPWM90BBPGip20Sm+jvrptVTukoBWvimcTGB7up
 doqw==
X-Gm-Message-State: ACrzQf04cn/31ZNY002TdSOEgvI74K7GbA5K9x8J+2hU4y2eew8BjWYf
 +qTJZynMHLWmoh3I9AnuIeg=
X-Google-Smtp-Source: AMsMyM5gaS19dY/6ZLzgHOUh7dQyvQjmTi+0/TbBVu/j+KPpjuyWrN2zugGl7Ia2TcuZCbTNRtZLwA==
X-Received: by 2002:a17:907:25cd:b0:77b:9672:38e7 with SMTP id
 ae13-20020a17090725cd00b0077b967238e7mr10944907ejc.10.1663536709745; 
 Sun, 18 Sep 2022 14:31:49 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-078-054-124-024.78.54.pool.telefonica.de.
 [78.54.124.24]) by smtp.gmail.com with ESMTPSA id
 l5-20020a056402028500b004542c37e68esm293696edv.33.2022.09.18.14.31.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Sep 2022 14:31:49 -0700 (PDT)
Date: Sun, 18 Sep 2022 21:31:43 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org
CC: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 39/42] hw/isa/piix: Unexport PIIXState
In-Reply-To: <7464ed32-7dbd-b0a1-26af-4643b5daf6d6@ilande.co.uk>
References: <20220901162613.6939-1-shentey@gmail.com>
 <20220901162613.6939-40-shentey@gmail.com>
 <7464ed32-7dbd-b0a1-26af-4643b5daf6d6@ilande.co.uk>
Message-ID: <BB792616-C267-4088-BF20-8DE656600CF1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 18=2E September 2022 20:21:09 UTC schrieb Mark Cave-Ayland <mark=2Ecave-=
ayland@ilande=2Eco=2Euk>:
>On 01/09/2022 17:26, Bernhard Beschow wrote:
>
>> The - deliberately exported - components can still be accessed
>> via QOM properties=2E
>>=20
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/isa/piix=2Ec                 | 52 ++++++++++++++++++++++++++++++++=
+
>>   include/hw/southbridge/piix=2Eh | 54 --------------------------------=
---
>>   2 files changed, 52 insertions(+), 54 deletions(-)
>>=20
>> diff --git a/hw/isa/piix=2Ec b/hw/isa/piix=2Ec
>> index e413d7e792=2E=2Ec503a6e836 100644
>> --- a/hw/isa/piix=2Ec
>> +++ b/hw/isa/piix=2Ec
>> @@ -26,20 +26,72 @@
>>   #include "qemu/osdep=2Eh"
>>   #include "qemu/range=2Eh"
>>   #include "qapi/error=2Eh"
>> +#include "qom/object=2Eh"
>> +#include "hw/acpi/piix4=2Eh"
>>   #include "hw/dma/i8257=2Eh"
>> +#include "hw/ide/pci=2Eh"
>>   #include "hw/intc/i8259=2Eh"
>>   #include "hw/southbridge/piix=2Eh"
>>   #include "hw/timer/i8254=2Eh"
>>   #include "hw/irq=2Eh"
>>   #include "hw/qdev-properties=2Eh"
>>   #include "hw/isa/isa=2Eh"
>> +#include "hw/pci/pci=2Eh"
>> +#include "hw/qdev-properties=2Eh"
>> +#include "hw/rtc/mc146818rtc=2Eh"
>> +#include "hw/usb/hcd-uhci=2Eh"
>>   #include "hw/xen/xen=2Eh"
>>   #include "sysemu/runstate=2Eh"
>>   #include "migration/vmstate=2Eh"
>>   #include "hw/acpi/acpi_aml_interface=2Eh"
>>   +#define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
>>   #define XEN_PIIX_NUM_PIRQS      128ULL
>>   +struct PIIXState {
>> +    PCIDevice dev;
>> +
>> +    /*
>> +     * bitmap to track pic levels=2E
>> +     * The pic level is the logical OR of all the PCI irqs mapped to i=
t
>> +     * So one PIC level is tracked by PIIX_NUM_PIRQS bits=2E
>> +     *
>> +     * PIRQ is mapped to PIC pins, we track it by
>> +     * PIIX_NUM_PIRQS * ISA_NUM_IRQS =3D 64 bits with
>> +     * pic_irq * PIIX_NUM_PIRQS + pirq
>> +     */
>> +#if ISA_NUM_IRQS * PIIX_NUM_PIRQS > 64
>> +#error "unable to encode pic state in 64bit in pic_levels=2E"
>> +#endif
>> +    uint64_t pic_levels;
>> +
>> +    /* This member isn't used=2E Just for save/load compatibility */
>> +    int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
>> +    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
>> +
>> +    ISAPICState pic;
>> +    RTCState rtc;
>> +    PCIIDEState ide;
>> +    UHCIState uhci;
>> +    PIIX4PMState pm;
>> +
>> +    uint32_t smb_io_base;
>> +
>> +    /* Reset Control Register contents */
>> +    uint8_t rcr;
>> +
>> +    /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) *=
/
>> +    MemoryRegion rcr_mem;
>> +
>> +    bool has_acpi;
>> +    bool has_usb;
>> +    bool smm_enabled;
>> +};
>> +typedef struct PIIXState PIIXState;
>> +
>> +DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
>> +                         TYPE_PIIX3_PCI_DEVICE)
>> +
>>   static void piix_set_irq_pic(PIIXState *piix, int pic_irq)
>>   {
>>       qemu_set_irq(piix->pic=2Ein_irqs[pic_irq],
>> diff --git a/include/hw/southbridge/piix=2Eh b/include/hw/southbridge/p=
iix=2Eh
>> index c9fa0f1aa6=2E=2E0edc23710c 100644
>> --- a/include/hw/southbridge/piix=2Eh
>> +++ b/include/hw/southbridge/piix=2Eh
>> @@ -12,14 +12,6 @@
>>   #ifndef HW_SOUTHBRIDGE_PIIX_H
>>   #define HW_SOUTHBRIDGE_PIIX_H
>>   -#include "hw/pci/pci=2Eh"
>> -#include "qom/object=2Eh"
>> -#include "hw/acpi/piix4=2Eh"
>> -#include "hw/ide/pci=2Eh"
>> -#include "hw/intc/i8259=2Eh"
>> -#include "hw/rtc/mc146818rtc=2Eh"
>> -#include "hw/usb/hcd-uhci=2Eh"
>> -
>>   /* PIRQRC[A:D]: PIRQx Route Control Registers */
>>   #define PIIX_PIRQCA 0x60
>>   #define PIIX_PIRQCB 0x61
>> @@ -32,53 +24,7 @@
>>    */
>>   #define PIIX_RCR_IOPORT 0xcf9
>>   -#define PIIX_NUM_PIRQS          4ULL    /* PIRQ[A-D] */
>> -
>> -struct PIIXState {
>> -    PCIDevice dev;
>> -
>> -    /*
>> -     * bitmap to track pic levels=2E
>> -     * The pic level is the logical OR of all the PCI irqs mapped to i=
t
>> -     * So one PIC level is tracked by PIIX_NUM_PIRQS bits=2E
>> -     *
>> -     * PIRQ is mapped to PIC pins, we track it by
>> -     * PIIX_NUM_PIRQS * ISA_NUM_IRQS =3D 64 bits with
>> -     * pic_irq * PIIX_NUM_PIRQS + pirq
>> -     */
>> -#if ISA_NUM_IRQS * PIIX_NUM_PIRQS > 64
>> -#error "unable to encode pic state in 64bit in pic_levels=2E"
>> -#endif
>> -    uint64_t pic_levels;
>> -
>> -    /* This member isn't used=2E Just for save/load compatibility */
>> -    int32_t pci_irq_levels_vmstate[PIIX_NUM_PIRQS];
>> -    uint8_t pci_irq_reset_mappings[PIIX_NUM_PIRQS];
>> -
>> -    ISAPICState pic;
>> -    RTCState rtc;
>> -    PCIIDEState ide;
>> -    UHCIState uhci;
>> -    PIIX4PMState pm;
>> -
>> -    uint32_t smb_io_base;
>> -
>> -    /* Reset Control Register contents */
>> -    uint8_t rcr;
>> -
>> -    /* IO memory region for Reset Control Register (PIIX_RCR_IOPORT) *=
/
>> -    MemoryRegion rcr_mem;
>> -
>> -    bool has_acpi;
>> -    bool has_usb;
>> -    bool smm_enabled;
>> -};
>> -typedef struct PIIXState PIIXState;
>> -
>>   #define TYPE_PIIX3_PCI_DEVICE "pci-piix3"
>> -DECLARE_INSTANCE_CHECKER(PIIXState, PIIX_PCI_DEVICE,
>> -                         TYPE_PIIX3_PCI_DEVICE)
>> -
>>   #define TYPE_PIIX3_DEVICE "PIIX3"
>>   #define TYPE_PIIX3_XEN_DEVICE "PIIX3-xen"
>>   #define TYPE_PIIX4_PCI_DEVICE "piix4-isa"
>
>I don't think that this is the right way to go here - whilst the definiti=
on of public and private can be a little vague, the general aim should be f=
or the QOM type struct and macros to be in the corresponding =2Eh file and =
the implementation in the =2Ec file=2E In effect this ensures that anyone w=
ho wants to use a TYPE_FOO will include foo=2Eh which helps make it easier =
to keep track of dependencies=2E

So essentially I'd omit this patch from the series=2E=2E=2E

>Looking at TYPE_PIIX3_PCI_DEVICE I'm wondering why this couldn't be OBJEC=
T_SIMPLE_TYPE instead of DECLARE_INSTANCE_CHECKER with this series?

=2E=2E=2E and instead add one which replaces DECLARE_INSTANCE_CHECKER with=
 OBJECT_SIMPLE_TYPE here?

Best regards,
Bernhard
>
>
>ATB,
>
>Mark=2E


