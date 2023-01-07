Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C416612AA
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 00:58:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEJ4K-00063l-RZ; Sat, 07 Jan 2023 18:57:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEJ4J-00063Y-H3; Sat, 07 Jan 2023 18:57:43 -0500
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEJ4H-0004Dw-0r; Sat, 07 Jan 2023 18:57:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sb6CyDY+3MAnefB56wvOA0QjcDiiXYWvzv2dxQlhVQ4=; b=gwv5mbE4+ZRm/nr8V2/qimanoC
 ehz9IJMRYWPo+LeEM/n6R20ZpnIeIsHBjG796Y0gt5lAI3t33nkoRmpH4dz/Blt4KI8zfrPhQCcJH
 UvgjzVpHEQUpNTk3v9a0eALAxlCg+Ina+do7NjB/MQ+Eyf38ZmySF8NGK/VchUiU61obVPHGmEde8
 NKfP+Ks5fJprJ31GDHPTEg20gQeKEtRbuHmWsiftBAsXH47ftbzuutloucA8PEA2cst7TItHjmhTj
 Yn5oGANICIU8spOCb4psYaD/6oVAWfRivWrgwWiRLYL6vqVwo39NI/g/ZjVP0vYiVCIcI9gHT1Jxf
 ZcTi0WP9XfPdlV/7slYJdoE7cMDS67c6n6XhVOoo35qjlF8UdGBiLkhUcXfQkMHoEzMifER7nVhla
 m0rZbd0ODH+i3yS8XCFu1SsfInwUithR3LHecMqHAx1zznTxp94t4g03aAAM7tzOsF0UzofmhPfHK
 yoUy3dS9t+tzHZUsp87njioTIp8oEfk2OFpC7Hl9D9MphvQNItdkq6J/K4vKWW5EiPD6p+KSO/MiM
 NY0PR0WQuGV82jSPjoHxAm//kWeF0Cckazz6bka/mwkU+TCohPEgEHg4i2ytStrytGv8tHqfMBtIe
 Ut96HiIC4X2jaBOnCfXl7pEq16BYM2vzw5itYjgt4=;
Received: from [2a00:23c4:8baa:1d00:e655:fde:753f:696a]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1pEJ3p-000BMO-B6; Sat, 07 Jan 2023 23:57:17 +0000
Message-ID: <dcbda1fc-3380-a96b-78c7-b3b35dee5ac4@ilande.co.uk>
Date: Sat, 7 Jan 2023 23:57:32 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>, Richard Henderson
 <richard.henderson@linaro.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>
References: <20230105143228.244965-1-shentey@gmail.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8baa:1d00:e655:fde:753f:696a
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v5 00/31] Consolidate PIIX south bridges
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.114,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 05/01/2023 14:31, Bernhard Beschow wrote:

> This series consolidates the implementations of the PIIX3 and PIIX4 south
> bridges and is an extended version of [1]. The motivation is to share as much
> code as possible and to bring both device models to feature parity such that
> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
> list before.
> 
> The series is structured as follows: First, PIIX3 is changed to instantiate
> internal devices itself, like PIIX4 does already. Second, PIIX3 gets prepared
> for the merge with PIIX4 which includes some fixes, cleanups, and renamings.
> Third, the same is done for PIIX4. In step four the implementations are merged.
> Since some consolidations could be done easier with merged implementations, the
> consolidation continues in step five which concludes the series. Note that the
> first three patches are only included to avoid merge conflicts with mips-next
> -- please ignore.
> 
> One particular challenge in this series was that the PIC of PIIX3 used to be
> instantiated outside of the south bridge while some sub functions require a PIC
> with populated qemu_irqs. This has been solved by introducing a proxy PIC which
> furthermore allows PIIX3 to be agnostic towards the virtualization technology
> used (KVM, TCG, Xen). Due to consolidation PIIX4 gained the proxy PIC as well.
> 
> Another challenge was dealing with optional devices where Peter already gave
> advice in [1] which this series implements.
> 
> Last but not least there might be some opportunity to consolidate VM state
> handling, probably by reusing the one from PIIX3. Since I'm not very familiar
> with the requirements I didn't touch it so far.
> 
> v5:
> - Pick up Reviewed-by tags from https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg00116.html
> - Add patch to make usage of the isa_pic global more type-safe
> - Re-introduce isa-pic as PIC specific proxy (Mark)
> Note that both patches are unreviewed -> Mark?
> 
> Furthermore, patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus
> is created' needs review and could be merged into
> https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03312.html .
> 
> Testing done:
> * make check
> * Boot live CD:
>    * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
>    * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
> * 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=ttyS0"`
> 
> Based-on: <20221120150550.63059-1-shentey@gmail.com>
>            "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges"
> 
> v4:
> - Rebase onto "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges"
>    since it is already queued via mips-next. This eliminates patches
>    'hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"' and 'hw/isa/piix4:
>    Prefix pci_slot_get_pirq() with "piix4_"'.
> - Squash 'hw/isa/piix: Drop the "3" from the PIIX base class' into
>    'hw/isa/piix3: Rename typedef PIIX3State to PIIXState'. I originally only
>    split these patches since I wasn't sure whether renaming a type was allowed.
> - Add new patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
>    created' for forther cleanup of INTx-to-LNKx route decoupling.
> 
> v3:
> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_USB_UHCIx
>    (Philippe)
> - Make proxy PIC generic (Philippe)
> - Track Malta's PIIX dependencies through KConfig
> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits' series [3]
> - Also rebase onto latest master to resolve merge conflicts. This required
>    copying Philippe's series as first three patches - please ignore.
> 
> v2:
> - Introduce TYPE_ defines for IDE and USB device models (Mark)
> - Omit unexporting of PIIXState (Mark)
> - Improve commit message of patch 5 to mention reset triggering through PCI
>    configuration space (Mark)
> - Move reviewed patches w/o dependencies to the bottom of the series for early
>    upstreaming
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02348.html
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03310.html
> [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg05367.html
> 
> Bernhard Beschow (28):
>    hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>    hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>    hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
>      created
>    hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>      south bridge
>    hw/i386/pc: Create RTC controllers in south bridges
>    hw/i386/pc: No need for rtc_state to be an out-parameter
>    hw/isa/piix3: Create USB controller in host device
>    hw/isa/piix3: Create power management controller in host device
>    hw/intc/i8259: Make using the isa_pic singleton more type-safe
>    hw/intc/i8259: Introduce i8259 proxy "isa-pic"
>    hw/isa/piix3: Create ISA PIC in host device
>    hw/isa/piix3: Create IDE controller in host device
>    hw/isa/piix3: Wire up ACPI interrupt internally
>    hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>    hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>    hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>    hw/isa/piix3: Drop the "3" from PIIX base class
>    hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>    hw/isa/piix4: Remove unused inbound ISA interrupt lines
>    hw/isa/piix4: Use ISA PIC device
>    hw/isa/piix4: Reuse struct PIIXState from PIIX3
>    hw/isa/piix4: Rename reset control operations to match PIIX3
>    hw/isa/piix3: Merge hw/isa/piix4.c
>    hw/isa/piix: Harmonize names of reset control memory regions
>    hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>    hw/isa/piix: Rename functions to be shared for interrupt triggering
>    hw/isa/piix: Consolidate IRQ triggering
>    hw/isa/piix: Share PIIX3's base class with PIIX4
> 
> Philippe Mathieu-Daudé (3):
>    hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>    hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>    hw/isa/piix4: Correct IRQRC[A:D] reset values
> 
>   configs/devices/mips-softmmu/common.mak |   2 -
>   hw/usb/hcd-uhci.h                       |   4 +
>   include/hw/i386/ich9.h                  |   2 +
>   include/hw/i386/pc.h                    |   2 +-
>   include/hw/intc/i8259.h                 |  25 +-
>   include/hw/southbridge/piix.h           |  30 ++-
>   include/qemu/typedefs.h                 |   1 +
>   hw/i386/pc.c                            |  16 +-
>   hw/i386/pc_piix.c                       |  77 +++---
>   hw/i386/pc_q35.c                        |  16 +-
>   hw/intc/i8259.c                         |  38 ++-
>   hw/isa/lpc_ich9.c                       |   8 +
>   hw/isa/{piix3.c => piix.c}              | 274 ++++++++++++++++-----
>   hw/isa/piix4.c                          | 302 ------------------------
>   hw/mips/malta.c                         |  38 ++-
>   hw/usb/hcd-uhci.c                       |  16 +-
>   MAINTAINERS                             |   6 +-
>   hw/i386/Kconfig                         |   4 +-
>   hw/isa/Kconfig                          |   8 +-
>   hw/isa/meson.build                      |   3 +-
>   hw/mips/Kconfig                         |   2 +
>   21 files changed, 419 insertions(+), 455 deletions(-)
>   rename hw/isa/{piix3.c => piix.c} (57%)
>   delete mode 100644 hw/isa/piix4.c

I've made a few comments on minor things I spotted reading through the series, but in 
general I'm happy with this series as it does a lot of good tidy-up work (and even if 
any problems do occur later, it's early enough in the development cycle to catch them 
in plenty of time).

Phil - over to you!


ATB,

Mark.

