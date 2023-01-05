Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A87D765F2B2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:30:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDU4G-0007yz-5c; Thu, 05 Jan 2023 12:30:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDU40-0007uC-R2; Thu, 05 Jan 2023 12:30:01 -0500
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDU3y-0001P5-Mi; Thu, 05 Jan 2023 12:30:00 -0500
Received: by mail-ed1-x533.google.com with SMTP id i9so53703014edj.4;
 Thu, 05 Jan 2023 09:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WbjAJHeBhMoXEUmsSRIMgHdOEJp0Mqv3li72HNLjv4c=;
 b=NgoeGpHiz2KlPucqG9IFroxIYsI8ptY169ikO3ouJdfAIG2i+oElXZ3/XHY66Hrznn
 LzRNtNcNJUlWXsb0AUOpcNVi5Bx9W3WcPQmWOfpYzk0sVMSBzX41vMoZpSYPFh/auu9E
 BVbys3eHNXYjxW5QZ8SFMMbd6lYEeOVdDt+aF7m/tbvq25Z/JZ2C/+MKlINm41tVZOUE
 OwOAvMWzOoyYKDHVFGdrAVKITa+4e2pjNWH0Q7dbkW/pizgp8oCc20wRfzRxOR+tdah2
 88E9JCFT2mpz41QF+Rf4OXBGaZHL8COEIcj9yTNwU1lFbejQJa3nKsiUz3BkmDwJcvVs
 /aZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WbjAJHeBhMoXEUmsSRIMgHdOEJp0Mqv3li72HNLjv4c=;
 b=T9kGpcJgJ5HT+PLqXe/F4dGriyTA/M9v6s3QrQit9DnjW59EvDP/YY5/YdB3SGQ+km
 zNpDZxIInnSnR+IyceYSVLfNqsSYjaFA2iiTzR6IO1YOvwS+S1HV/vxLZ1IzIgfMT9uU
 yoPK7gbrt0FLjFQ7p16nSyQEJSrIgWLjdScW8xJRCdOg1xCCLstzyFUoRlcjT9owmTKD
 85TaceOYdieB99IXmK9VdCi93UEn78tYRyvHnCMI/l1Y1Rc3MW6e7IbJ9HdVQf6JfX03
 JA2Qb6Wlz3b/afuta0im0EkHGZbJRkl+ZP/qwht3YzYoqG93K0/qa1ikuyDNbD7ods/U
 oaGw==
X-Gm-Message-State: AFqh2kqzhNoo7/rBrETMHoH+cTgYRKX3UZn5g7gBUlf5GP6mL3YkZXt0
 aN0bNNGnZDvkY1mwFtFXhC8=
X-Google-Smtp-Source: AMrXdXtd1xdaFz+O6RQLw3f04zpSLAupAwuR1LZCPbczOB+YdXlGZsJ3khTgBk7KuVCz9Bo/uWcXLg==
X-Received: by 2002:a05:6402:4010:b0:48e:cad5:c703 with SMTP id
 d16-20020a056402401000b0048ecad5c703mr9609441eda.20.1672939796563; 
 Thu, 05 Jan 2023 09:29:56 -0800 (PST)
Received: from ?IPv6:::1?
 (p200300faaf0bb200dd01067508562054.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:dd01:675:856:2054])
 by smtp.gmail.com with ESMTPSA id
 b18-20020aa7cd12000000b00482e0c55e2bsm14659061edw.93.2023.01.05.09.29.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 09:29:56 -0800 (PST)
Date: Thu, 05 Jan 2023 17:29:54 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
CC: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 qemu-block@nongnu.org,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Aurelien Jarno <aurelien@aurel32.net>, 
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 00/31] Consolidate PIIX south bridges
In-Reply-To: <20230105113831-mutt-send-email-mst@kernel.org>
References: <20230105143228.244965-1-shentey@gmail.com>
 <20230105113831-mutt-send-email-mst@kernel.org>
Message-ID: <EC7E6B40-16BD-4479-82C5-9F50FDF04844@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x533.google.com
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



Am 5=2E Januar 2023 16:39:01 UTC schrieb "Michael S=2E Tsirkin" <mst@redha=
t=2Ecom>:
>On Thu, Jan 05, 2023 at 03:31:57PM +0100, Bernhard Beschow wrote:
>> This series consolidates the implementations of the PIIX3 and PIIX4 sou=
th
>> bridges and is an extended version of [1]=2E The motivation is to share=
 as much
>> code as possible and to bring both device models to feature parity such=
 that
>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc mach=
ine=2E This
>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on=
 this
>> list before=2E
>>=20
>> The series is structured as follows: First, PIIX3 is changed to instant=
iate
>> internal devices itself, like PIIX4 does already=2E Second, PIIX3 gets =
prepared
>> for the merge with PIIX4 which includes some fixes, cleanups, and renam=
ings=2E
>> Third, the same is done for PIIX4=2E In step four the implementations a=
re merged=2E
>> Since some consolidations could be done easier with merged implementati=
ons, the
>> consolidation continues in step five which concludes the series=2E Note=
 that the
>> first three patches are only included to avoid merge conflicts with mip=
s-next
>> -- please ignore=2E
>>=20
>> One particular challenge in this series was that the PIC of PIIX3 used =
to be
>> instantiated outside of the south bridge while some sub functions requi=
re a PIC
>> with populated qemu_irqs=2E This has been solved by introducing a proxy=
 PIC which
>> furthermore allows PIIX3 to be agnostic towards the virtualization tech=
nology
>> used (KVM, TCG, Xen)=2E Due to consolidation PIIX4 gained the proxy PIC=
 as well=2E
>>=20
>> Another challenge was dealing with optional devices where Peter already=
 gave
>> advice in [1] which this series implements=2E
>>=20
>> Last but not least there might be some opportunity to consolidate VM st=
ate
>> handling, probably by reusing the one from PIIX3=2E Since I'm not very =
familiar
>> with the requirements I didn't touch it so far=2E
>
>This is going to be merged through mips tree yes?

Right=2E Because it depends on some MIPS changes=2E

>series:
>
>Reviewed-by: Michael S=2E Tsirkin <mst@redhat=2Ecom>

Thanks!

Best regards,
Bernhard

>
>> v5:
>> - Pick up Reviewed-by tags from https://lists=2Enongnu=2Eorg/archive/ht=
ml/qemu-devel/2023-01/msg00116=2Ehtml
>> - Add patch to make usage of the isa_pic global more type-safe
>> - Re-introduce isa-pic as PIC specific proxy (Mark)
>> Note that both patches are unreviewed -> Mark?
>>=20
>> Furthermore, patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon a=
s PCI bus
>> is created' needs review and could be merged into
>> https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg03312=
=2Ehtml =2E
>>=20
>> Testing done:
>> * make check
>> * Boot live CD:
>>   * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro=
-kde-21=2E3=2E2-220704-linux515=2Eiso`
>>   * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjar=
o-kde-21=2E3=2E2-220704-linux515=2Eiso`
>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3=2E2=2E0-4-5kc-malta =
-hda debian_wheezy_mipsel_standard=2Eqcow2 -append "root=3D/dev/sda1 consol=
e=3DttyS0"`
>>=20
>> Based-on: <20221120150550=2E63059-1-shentey@gmail=2Ecom>
>>           "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south brid=
ges"
>>=20
>> v4:
>> - Rebase onto "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south =
bridges"
>>   since it is already queued via mips-next=2E This eliminates patches
>>   'hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"' and 'hw/isa/=
piix4:
>>   Prefix pci_slot_get_pirq() with "piix4_"'=2E
>> - Squash 'hw/isa/piix: Drop the "3" from the PIIX base class' into
>>   'hw/isa/piix3: Rename typedef PIIX3State to PIIXState'=2E I originall=
y only
>>   split these patches since I wasn't sure whether renaming a type was a=
llowed=2E
>> - Add new patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as P=
CI bus is
>>   created' for forther cleanup of INTx-to-LNKx route decoupling=2E
>>=20
>> v3:
>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_US=
B_UHCIx
>>   (Philippe)
>> - Make proxy PIC generic (Philippe)
>> - Track Malta's PIIX dependencies through KConfig
>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits=
' series [3]
>> - Also rebase onto latest master to resolve merge conflicts=2E This req=
uired
>>   copying Philippe's series as first three patches - please ignore=2E
>>=20
>> v2:
>> - Introduce TYPE_ defines for IDE and USB device models (Mark)
>> - Omit unexporting of PIIXState (Mark)
>> - Improve commit message of patch 5 to mention reset triggering through=
 PCI
>>   configuration space (Mark)
>> - Move reviewed patches w/o dependencies to the bottom of the series fo=
r early
>>   upstreaming
>>=20
>> [1] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-07/msg023=
48=2Ehtml
>> [2] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-11/msg033=
10=2Ehtml
>> [3] https://lists=2Enongnu=2Eorg/archive/html/qemu-devel/2022-10/msg053=
67=2Ehtml
>>=20
>> Bernhard Beschow (28):
>>   hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>>   hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>>   hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
>>     created
>>   hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>>     south bridge
>>   hw/i386/pc: Create RTC controllers in south bridges
>>   hw/i386/pc: No need for rtc_state to be an out-parameter
>>   hw/isa/piix3: Create USB controller in host device
>>   hw/isa/piix3: Create power management controller in host device
>>   hw/intc/i8259: Make using the isa_pic singleton more type-safe
>>   hw/intc/i8259: Introduce i8259 proxy "isa-pic"
>>   hw/isa/piix3: Create ISA PIC in host device
>>   hw/isa/piix3: Create IDE controller in host device
>>   hw/isa/piix3: Wire up ACPI interrupt internally
>>   hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>>   hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>>   hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>>   hw/isa/piix3: Drop the "3" from PIIX base class
>>   hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>>   hw/isa/piix4: Remove unused inbound ISA interrupt lines
>>   hw/isa/piix4: Use ISA PIC device
>>   hw/isa/piix4: Reuse struct PIIXState from PIIX3
>>   hw/isa/piix4: Rename reset control operations to match PIIX3
>>   hw/isa/piix3: Merge hw/isa/piix4=2Ec
>>   hw/isa/piix: Harmonize names of reset control memory regions
>>   hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>>   hw/isa/piix: Rename functions to be shared for interrupt triggering
>>   hw/isa/piix: Consolidate IRQ triggering
>>   hw/isa/piix: Share PIIX3's base class with PIIX4
>>=20
>> Philippe Mathieu-Daud=C3=A9 (3):
>>   hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>>   hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>>   hw/isa/piix4: Correct IRQRC[A:D] reset values
>>=20
>>  configs/devices/mips-softmmu/common=2Emak |   2 -
>>  hw/usb/hcd-uhci=2Eh                       |   4 +
>>  include/hw/i386/ich9=2Eh                  |   2 +
>>  include/hw/i386/pc=2Eh                    |   2 +-
>>  include/hw/intc/i8259=2Eh                 |  25 +-
>>  include/hw/southbridge/piix=2Eh           |  30 ++-
>>  include/qemu/typedefs=2Eh                 |   1 +
>>  hw/i386/pc=2Ec                            |  16 +-
>>  hw/i386/pc_piix=2Ec                       |  77 +++---
>>  hw/i386/pc_q35=2Ec                        |  16 +-
>>  hw/intc/i8259=2Ec                         |  38 ++-
>>  hw/isa/lpc_ich9=2Ec                       |   8 +
>>  hw/isa/{piix3=2Ec =3D> piix=2Ec}              | 274 ++++++++++++++++--=
---
>>  hw/isa/piix4=2Ec                          | 302 ----------------------=
--
>>  hw/mips/malta=2Ec                         |  38 ++-
>>  hw/usb/hcd-uhci=2Ec                       |  16 +-
>>  MAINTAINERS                             |   6 +-
>>  hw/i386/Kconfig                         |   4 +-
>>  hw/isa/Kconfig                          |   8 +-
>>  hw/isa/meson=2Ebuild                      |   3 +-
>>  hw/mips/Kconfig                         |   2 +
>>  21 files changed, 419 insertions(+), 455 deletions(-)
>>  rename hw/isa/{piix3=2Ec =3D> piix=2Ec} (57%)
>>  delete mode 100644 hw/isa/piix4=2Ec
>>=20
>> --=20
>> 2=2E39=2E0
>>=20
>

