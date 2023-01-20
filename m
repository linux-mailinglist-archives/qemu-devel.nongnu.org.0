Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD28675453
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:23:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqPr-0000Lh-SD; Fri, 20 Jan 2023 07:22:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pIqPp-0000KK-RC; Fri, 20 Jan 2023 07:22:41 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pIqPn-0007z9-VS; Fri, 20 Jan 2023 07:22:41 -0500
Received: by mail-ed1-x529.google.com with SMTP id b4so6635005edf.0;
 Fri, 20 Jan 2023 04:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WGw+r06uFfSpjmWD5y34BLzh/X3XWwfRyA8qpNBDs1s=;
 b=pEJxKPiS6QKfPYV8Sd6o8NNiVRaIlk5k7PY7AwDIbwOWgTGJOxY+HSX9PCMd5dPUCL
 b4ZE4OuNpZIWaIAV3Mpmz32F506mz7GM3oE62a1KLPTr39QDygj0adEhTPs9Ow93UURA
 afiMjW+DJE3UN0gMX6TRnEZJow2etXHdSeTaD0yfcf36+1igIwlDVlW+T8YtVoPOiq1V
 t3H/VvYmSYrT5Xo7YWWOCRG5u26B82Y3tpajubdIfe+55AfuHiMCnnNX7iYPgaPS3uN6
 N9QkZp+fmrSQ7kmswex1W38GNcQmJ1SlF/MTV/4VKnwgqvHkw5eHBY+lYrtanVlTL+6w
 xzwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WGw+r06uFfSpjmWD5y34BLzh/X3XWwfRyA8qpNBDs1s=;
 b=o5Y3HLcPCbrrN5sVyWo8qhoa7Mn/1T7WYKbfBGgrHCYIAoyvK4KPmxqHcz1O6vV3TT
 29nu6YjGigyLJ6ID+cXz/VoW/3DsH355rMVZYlc6NPyTkHW++pB6sZEzbN8jnVvTVta0
 g+lH0spbJbAuDkYaAKrU0ugnh6nuwOqRF72pSTL4eyNA7tk0GTTpj09iAX66MrnVelwM
 jkINvKvOKe5T1kZMPwv4O73xiz+ry2wD2ayhQHSxyPJ9VmqsguoNWLXo7i86AtZE3JoH
 nEoaAfYTLx+BeROgL3+Xjhk6SPDwM6n8FX3d9yZrkBwboviE2LOKVqlZa5zGvOOzCrMW
 s0yw==
X-Gm-Message-State: AFqh2krA3PSyvE6WhuOmk+H5MvoW5H+U/7trQHPQQa1Sj9LqmzTHHbtH
 pks9gIDFYKrfaozdtKoQtTI=
X-Google-Smtp-Source: AMrXdXvOZr6H++BYwE12WQD1RVKU7n1CkbzvEvyaRpkRdL5j6YqVwfJ5L+g4sOI/O0kR0FVxMCVhSg==
X-Received: by 2002:a05:6402:5d3:b0:49b:58ca:ebbc with SMTP id
 n19-20020a05640205d300b0049b58caebbcmr17750119edx.32.1674217356486; 
 Fri, 20 Jan 2023 04:22:36 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200b886192207547078.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:b886:1922:754:7078])
 by smtp.gmail.com with ESMTPSA id
 d3-20020aa7d5c3000000b004835bd8dfe5sm17342054eds.35.2023.01.20.04.22.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 04:22:36 -0800 (PST)
Date: Fri, 20 Jan 2023 12:22:29 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
CC: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>
Subject: Re: [PATCH v6 00/33] Consolidate PIIX south bridges
In-Reply-To: <6D8095E7-E540-4D7E-B976-D71522F8664A@gmail.com>
References: <20230109172347.1830-1-shentey@gmail.com>
 <211e791a-9d37-9655-ca93-9e3bda2e21c3@linaro.org>
 <6D8095E7-E540-4D7E-B976-D71522F8664A@gmail.com>
Message-ID: <752135A6-44DC-4504-8E16-C2E71EC76872@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x529.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org



Am 13=2E Januar 2023 17:39:45 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 13=2E Januar 2023 08:46:53 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <=
philmd@linaro=2Eorg>:
>>Hi Bernhard,
>>
>>On 9/1/23 18:23, Bernhard Beschow wrote:
>>> This series consolidates the implementations of the PIIX3 and PIIX4 so=
uth
>>> bridges and is an extended version of [1]=2E The motivation is to shar=
e as much
>>> code as possible and to bring both device models to feature parity suc=
h that
>>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc mac=
hine=2E This
>>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed o=
n this
>>> list before=2E
>>
>>> Bernhard Beschow (30):
>>>    hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()
>>>    hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific
>>>    hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific
>>>    hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>>    hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>>    hw/intc/i8259: Make using the isa_pic singleton more type-safe
>>>    hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC
>>>    hw/i386/pc: Create RTC controllers in south bridges
>>>    hw/i386/pc: No need for rtc_state to be an out-parameter
>>>    hw/i386/pc_piix: Allow for setting properties before realizing PIIX=
3
>>>      south bridge
>>>    hw/isa/piix3: Create USB controller in host device
>>>    hw/isa/piix3: Create power management controller in host device
>>>    hw/isa/piix3: Create TYPE_ISA_PIC in host device
>>>    hw/isa/piix3: Create IDE controller in host device
>>>    hw/isa/piix3: Wire up ACPI interrupt internally
>>>    hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>>    hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>>    hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>>    hw/isa/piix3: Drop the "3" from PIIX base class
>>>    hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>>    hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>>    hw/isa/piix4: Use TYPE_ISA_PIC device
>>>    hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>>    hw/isa/piix4: Rename reset control operations to match PIIX3
>>>    hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>>    hw/isa/piix: Harmonize names of reset control memory regions
>>>    hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>>    hw/isa/piix: Rename functions to be shared for interrupt triggering
>>>    hw/isa/piix: Consolidate IRQ triggering
>>>    hw/isa/piix: Share PIIX3's base class with PIIX4
>>>=20
>>> Philippe Mathieu-Daud=C3=A9 (3):
>>>    hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>>>    hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>>>    hw/isa/piix4: Correct IRQRC[A:D] reset values
>>
>>I'm queuing the first 10 patches for now to alleviate the size of this
>>series, and I'll respin a v7 with the rest to avoid making you suffer
>>any longer :/ Thanks for insisting in this effort and I apologize it
>>is taking me so long=2E=2E=2E
>
>Okay=2E=2E=2E What's the further plan? Is there anything missing?

Ping

>
>Thanks,
>Bernhard
>>
>>Regards,
>>
>>Phil=2E

