Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF256FE41C
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 20:41:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwojI-0002hC-5K; Wed, 10 May 2023 14:40:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pwojE-0002gx-MF
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:39:56 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pwojC-00075G-Fm
 for qemu-devel@nongnu.org; Wed, 10 May 2023 14:39:56 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94a342f7c4cso1346464566b.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 11:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683743993; x=1686335993;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4VeNTPDDt3l+h0uUQLdReCd80Trp9D93xvbS/ShEcb8=;
 b=gWGAeisySBEgAaKCaA8aqSVOcNiFVIgWq1dKobOtU5MCfBwRedxVgtn230J8QkUExT
 +1GoZAq1J+ht8Ws1tNhT+OK/FTyy3rrcpRajL9grXfVhgi81/3oDyinqIOVRcAAN89pv
 fONjRdGk3SuWIpQBLi1mmgGijjyO7oBnFLn+RBaTh3PtmuSk3QpRqxfQy+uiBYkHBq+P
 EyDZ6mglFyaEj/UeB6YLj1AHUsESPx3k24osandT8vef7kYPZaSgiuPqST0tpiaRsKnH
 gGlNtFe+Goc3yUug7sSAPvXKbw/LuUpbR8vj8rmZWBTQCL/fEYXs+sEzg2PmUIAiubQQ
 deFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683743993; x=1686335993;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4VeNTPDDt3l+h0uUQLdReCd80Trp9D93xvbS/ShEcb8=;
 b=F/gu7AoF9v5czP3358TjWp+HZrSKoGs/vRC9hxqUQRsdym0QUQt2NMqJEm8fN26kpZ
 Opcx96CDJL1vQ8LUlqW4b1YSq0PrCS2GflMjjfjpiHzW+v10sKJIE6JcDAGCkxj4qSq2
 Lnh0VxPR9H+NfcqmNxgQ/YD3ZuEIvLTFgIDe0SdX6+qrmWp3kl26bM6qHorMTEM+wHV3
 RN6o54jFEHiD9PSVx/+RST6ZWiFvq8Ik8/R40Anc4v8Oq9TNGS6dmU9RxyMfm1R9r94t
 Ozm4tzZl5adSk3aU9wHHraBakuay/RRAfG7JWYruHmDZtP6Y6gIUDd4nVcN093fFIOv7
 Iy1A==
X-Gm-Message-State: AC+VfDxjD0Q2Qc8fzgfIRPbJqZ13MQxzbXN4IJIvmlyc/HLhv5/P20FE
 op03RrMKcpqlVd+WuQ2pA9c=
X-Google-Smtp-Source: ACHHUZ4MwBZdXNUs2rZ8QiKLIygW0OozuNEVLa2Rp7+WPNQMyA9FGX/I54K/pne0sQh/31Igk/8tNQ==
X-Received: by 2002:a17:907:8a29:b0:965:f8b7:b0cd with SMTP id
 sc41-20020a1709078a2900b00965f8b7b0cdmr22278125ejc.25.1683743992457; 
 Wed, 10 May 2023 11:39:52 -0700 (PDT)
Received: from [127.0.0.1] (dynamic-089-012-021-051.89.12.pool.telefonica.de.
 [89.12.21.51]) by smtp.gmail.com with ESMTPSA id
 x13-20020aa7cd8d000000b0050488d1d376sm2068349edv.0.2023.05.10.11.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 May 2023 11:39:52 -0700 (PDT)
Date: Wed, 10 May 2023 18:39:49 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v8 00/23] Consolidate PIIX south bridges
In-Reply-To: <E7BEB643-EA7E-4CF5-A00B-D9D280442472@gmail.com>
References: <20230302212201.224360-1-shentey@gmail.com>
 <20230421031431-mutt-send-email-mst@kernel.org>
 <E7BEB643-EA7E-4CF5-A00B-D9D280442472@gmail.com>
Message-ID: <614D0648-CA0B-4773-A1A9-82F78813EA9A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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



Am 21=2E April 2023 16:40:47 UTC schrieb Bernhard Beschow <shentey@gmail=
=2Ecom>:
>
>
>Am 21=2E April 2023 07:15:18 UTC schrieb "Michael S=2E Tsirkin" <mst@redh=
at=2Ecom>:
>>On Thu, Mar 02, 2023 at 10:21:38PM +0100, Bernhard Beschow wrote:
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
>>Hi!
>>No freeze is over, could you rebase pls?
>>I could try to resolve the conflicts but this is so big I'd rather
>>not take the risk of messing it up=2E
>
>Sure! Since this series is still under discussion I'd wait for the PIIX3 =
Xen decoupling series to land in master=2E This will simplify this series a=
 bit by taking Xen out of the equation=2E

Could we queue the first two RTC patches already? IMO they're useful gener=
al PC cleanups on their own=2E

Best regards,
Bernhard

>
>Best regards,
>Bernhard
>
>>
>>> The series is structured as follows:
>>>=20
>>> Move sub devices into the PIIX3 south bridge, like PIIX4 does already:
>>> * hw/i386/pc: Create RTC controllers in south bridges
>>> * hw/i386/pc: No need for rtc_state to be an out-parameter
>>> * hw/i386/pc_piix: Allow for setting properties before realizing PIIX3=
 south bridge
>>> * hw/isa/piix3: Create USB controller in host device
>>> * hw/isa/piix3: Create power management controller in host device
>>> * hw/isa/piix3: Move ISA bus IRQ assignments into host device
>>> * hw/isa/piix3: Create IDE controller in host device
>>> * hw/isa/piix3: Wire up ACPI interrupt internally
>>>=20
>>> Make PIIX3 and PIIX4 south bridges more similar:
>>> * hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>> * hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>> * hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>> * hw/isa/piix3: Drop the "3" from PIIX base class
>>> * hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>> * hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>> * hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>> * hw/isa/piix4: Create the "intr" property during init() already
>>> * hw/isa/piix4: Rename reset control operations to match PIIX3
>>>=20
>>> This patch achieves the main goal of the series:
>>> * hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>>=20
>>> Perform some further consolidations which were easier to do after the =
merge:
>>> * hw/isa/piix: Harmonize names of reset control memory regions
>>> * hw/isa/piix: Rename functions to be shared for interrupt triggering
>>> * hw/isa/piix: Consolidate IRQ triggering
>>> * hw/isa/piix: Share PIIX3's base class with PIIX4
>>> * hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>>=20
>>> One challenge was dealing with optional devices where Peter already ga=
ve advice
>>> in [1] which this series implements=2E
>>>=20
>>> There are still some differences in the device models:
>>> - PIIX4 instantiates its own PIC and PIT while PIIX3 doesn't
>>> - PIIX4 wires up the RTC IRQ itself while PIIX3 doesn't
>>> - Different binary layout in VM state
>>>=20
>>> v8:
>>> - Rebase onto master
>>> - Remove Reviewed-by tag from 'hw/isa/piix: Reuse PIIX3 base class' re=
alize
>>>   method in PIIX4' since it changed considerably in v7=2E
>>>=20
>>> Testing done (both on top of series as well as on 'hw/isa/piix3: Drop =
the "3"
>>> from PIIX base class'):
>>> * `make check`
>>> * `make check-avocado`
>>> * Boot live CD:
>>>   * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom
>>> manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>>   * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom
>>> manjaro-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3=2E2=2E0-4-5kc-malta=
 -hda
>>> debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 consol=
e=3DttyS0"`
>>>=20
>>> v7:
>>> - Rebase onto master
>>> - Avoid the PIC proxy (Phil)
>>>   The motivation for the PIC proxy was to allow for wiring up ISA inte=
rrupts in
>>>   the south bridges=2E ISA interrupt wiring requires the GPIO lines to=
 be
>>>   populated already but pc_piix assigned the interrupts only after rea=
lizing
>>>   PIIX3=2E By shifting interrupt assignment before realizing, the ISA =
interrupts
>>>   are already populated during PIIX3's realize phase where the ISA int=
errupts
>>>   are wired up=2E
>>> - New patches:
>>>   * hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>>   * hw/isa/piix4: Create the "intr" property during init() already
>>> - Patches with substantial changes (Reviewed-by dropped):
>>>   * hw/isa/piix3: Move ISA bus IRQ assignments into host device
>>>=20
>>> v6:
>>> - Fix some comments about TYPE_ISA_PIC (Mark) =2E=2E=2E and use it con=
sistently
>>>   within the patch series=2E
>>> - Incorporate series "[PATCH v2 0/3] Decouple INTx-to-LNKx routing fro=
m south
>>>   bridges" [2] for maintainer convenience=2E
>>> - Merge v5's 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI=
 bus is
>>>   created' into
>>>   https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg0331=
2=2Ehtml =2E Do
>>>   similar for Malta=2E
>>> - Rebase onto latest master (d6271b657286 "Merge tag 'for_upstream' of
>>>   https://git=2Ekernel=2Eorg/pub/scm/virt/kvm/mst/qemu into staging")
>>>=20
>>> v5:
>>> - Pick up Reviewed-by tags from https://lists=2Enongnu=2Eorg/archive/h=
tml/qemu-devel/2023-01/msg00116=2Ehtml
>>> - Add patch to make usage of the isa_pic global more type-safe
>>> - Re-introduce isa-pic as PIC specific proxy (Mark)
>>>=20
>>> v4:
>>> - Rebase onto "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south=
 bridges"
>>>   since it is already queued via mips-next=2E This eliminates patches
>>>   'hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"' and 'hw/isa=
/piix4:
>>>   Prefix pci_slot_get_pirq() with "piix4_"'=2E
>>> - Squash 'hw/isa/piix: Drop the "3" from the PIIX base class' into
>>>   'hw/isa/piix3: Rename typedef PIIX3State to PIIXState'=2E I original=
ly only
>>>   split these patches since I wasn't sure whether renaming a type was =
allowed=2E
>>> - Add new patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as =
PCI bus is
>>>   created' for forther cleanup of INTx-to-LNKx route decoupling=2E
>>>=20
>>> v3:
>>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_U=
SB_UHCIx
>>>   (Philippe)
>>> - Make proxy PIC generic (Philippe)
>>> - Track Malta's PIIX dependencies through KConfig
>>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bit=
s' series [3]
>>> - Also rebase onto latest master to resolve merge conflicts=2E This re=
quired
>>>   copying Philippe's series as first three patches - please ignore=2E
>>>=20
>>> v2:
>>> - Introduce TYPE_ defines for IDE and USB device models (Mark)
>>> - Omit unexporting of PIIXState (Mark)
>>> - Improve commit message of patch 5 to mention reset triggering throug=
h PCI
>>>   configuration space (Mark)
>>> - Move reviewed patches w/o dependencies to the bottom of the series f=
or early
>>>   upstreaming
>>>=20
>>> [1] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-07/msg02=
348=2Ehtml
>>> [2] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg03=
310=2Ehtml
>>> [3] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-10/msg05=
367=2Ehtml
>>>=20
>>> Bernhard Beschow (23):
>>>   hw/i386/pc: Create RTC controllers in south bridges
>>>   hw/i386/pc: No need for rtc_state to be an out-parameter
>>>   hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>>     south bridge
>>>   hw/isa/piix3: Create USB controller in host device
>>>   hw/isa/piix3: Create power management controller in host device
>>>   hw/isa/piix3: Move ISA bus IRQ assignments into host device
>>>   hw/isa/piix3: Create IDE controller in host device
>>>   hw/isa/piix3: Wire up ACPI interrupt internally
>>>   hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>>   hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>>   hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>>   hw/isa/piix3: Drop the "3" from PIIX base class
>>>   hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>>   hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>>   hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>>   hw/isa/piix4: Create the "intr" property during init() already
>>>   hw/isa/piix4: Rename reset control operations to match PIIX3
>>>   hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>>   hw/isa/piix: Harmonize names of reset control memory regions
>>>   hw/isa/piix: Rename functions to be shared for interrupt triggering
>>>   hw/isa/piix: Consolidate IRQ triggering
>>>   hw/isa/piix: Share PIIX3's base class with PIIX4
>>>   hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>>=20
>>>  MAINTAINERS                   |   6 +-
>>>  include/hw/i386/pc=2Eh          |   2 +-
>>>  include/hw/southbridge/ich9=2Eh |   2 +
>>>  include/hw/southbridge/piix=2Eh |  28 +++-
>>>  hw/i386/pc=2Ec                  |  16 +-
>>>  hw/i386/pc_piix=2Ec             |  67 ++++----
>>>  hw/i386/pc_q35=2Ec              |   4 +-
>>>  hw/isa/lpc_ich9=2Ec             |   8 +
>>>  hw/isa/{piix3=2Ec =3D> piix=2Ec}    | 306 ++++++++++++++++++++++++++-=
-------
>>>  hw/isa/piix4=2Ec                | 302 -------------------------------=
--
>>>  hw/mips/malta=2Ec               |   6 +-
>>>  hw/i386/Kconfig               |   3 +-
>>>  hw/isa/Kconfig                |   8 +-
>>>  hw/isa/meson=2Ebuild            |   3 +-
>>>  hw/mips/Kconfig               |   2 +-
>>>  15 files changed, 334 insertions(+), 429 deletions(-)
>>>  rename hw/isa/{piix3=2Ec =3D> piix=2Ec} (55%)
>>>  delete mode 100644 hw/isa/piix4=2Ec
>>>=20
>>> --=20
>>> 2=2E39=2E2
>>>=20
>>

