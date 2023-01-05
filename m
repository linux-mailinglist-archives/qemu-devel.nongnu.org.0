Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4280665F151
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 17:40:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTGw-0005pO-Qp; Thu, 05 Jan 2023 11:39:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDTGu-0005om-R4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:39:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDTGp-00019p-Oe
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:39:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672936749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lOgK2afHTeSSoWopgUoIWYG9EWbekdWgjgsMxxZ7ToM=;
 b=D7wBAWpXBBCwDe5qWuDsBZe2JdGVcFsgYhCDtLtcO+B3gSv1ldRUq//EpH/oUmLbCMVzDh
 ez+SqY8MCO1sRETRxcGfjxrFxmNKeXP3611maMX9TA1Ksq+CTVTi325tQfL4j6y+K8kDJN
 i6IdQvtKhGEgVRj9pcRlkDE0J7CZIhk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-647-4rW2_-L3NL-4eNp8sa4u4A-1; Thu, 05 Jan 2023 11:39:08 -0500
X-MC-Unique: 4rW2_-L3NL-4eNp8sa4u4A-1
Received: by mail-ed1-f70.google.com with SMTP id
 e6-20020a056402190600b0048ee2e45daaso4594433edz.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:39:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lOgK2afHTeSSoWopgUoIWYG9EWbekdWgjgsMxxZ7ToM=;
 b=DZ0bJgPd3Tuc2oqQJVx6hGKlHbktHd4fTrTnxtyehaRRyqfTMEzTUOQ/7eVB6R5eH2
 hgIT3+nz3bmM+2LPv8cvJ31CufDjrgzev62sQ2j1JEzTi+pxF9N0+mcm9aHQxMKnIVyA
 2/NHpfgXLrASbfXpV4xoYWom39KgJwXivUCRmMqj9+Sp0ua7AKg+ZHSV4C9uyCuTdGS4
 Z37uqFxe8jMrxJc8vH0JIyyf5logIDyG1XOx7ZJcvtjzLvFr5fZtWBPc8Vui9i3x7wTy
 CFeo1e0Fnruew2iiuiw55dXCl0nP5o6NoCInDK+vz0dk8Y+nWTEy00MWO719H3z5Y2G8
 8j+A==
X-Gm-Message-State: AFqh2kqrdOwL0k7MxDXuOzjwl33ICe0ntS6ZpRusa3PkQsYtR6vfMMis
 rlIvvj6rgcyi9ceijScNo04dsz6GqxGiFFs7lkzNe1YK9fyobnYaD19g8mtZpVheYpHL4cZKCyz
 qlHBKjsc+1e+OR+M=
X-Received: by 2002:a17:906:79d2:b0:7ae:987d:d7f9 with SMTP id
 m18-20020a17090679d200b007ae987dd7f9mr40523050ejo.17.1672936747396; 
 Thu, 05 Jan 2023 08:39:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs5yA8Lamk/cPLRK1Wfnv4GsrDXgQZvKZC5E9to+BZznz/KkbDcI0isf2Ehzb1OuGH1+tyiCA==
X-Received: by 2002:a17:906:79d2:b0:7ae:987d:d7f9 with SMTP id
 m18-20020a17090679d200b007ae987dd7f9mr40523032ejo.17.1672936747152; 
 Thu, 05 Jan 2023 08:39:07 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 s2-20020a170906168200b00808c5e283e8sm17007955ejd.178.2023.01.05.08.39.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:39:06 -0800 (PST)
Date: Thu, 5 Jan 2023 11:39:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 qemu-block@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v5 00/31] Consolidate PIIX south bridges
Message-ID: <20230105113831-mutt-send-email-mst@kernel.org>
References: <20230105143228.244965-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105143228.244965-1-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Thu, Jan 05, 2023 at 03:31:57PM +0100, Bernhard Beschow wrote:
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

This is going to be merged through mips tree yes?

series:

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


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
>   * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
>   * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
> * 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=ttyS0"`
> 
> Based-on: <20221120150550.63059-1-shentey@gmail.com>
>           "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges"
> 
> v4:
> - Rebase onto "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges"
>   since it is already queued via mips-next. This eliminates patches
>   'hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"' and 'hw/isa/piix4:
>   Prefix pci_slot_get_pirq() with "piix4_"'.
> - Squash 'hw/isa/piix: Drop the "3" from the PIIX base class' into
>   'hw/isa/piix3: Rename typedef PIIX3State to PIIXState'. I originally only
>   split these patches since I wasn't sure whether renaming a type was allowed.
> - Add new patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
>   created' for forther cleanup of INTx-to-LNKx route decoupling.
> 
> v3:
> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_USB_UHCIx
>   (Philippe)
> - Make proxy PIC generic (Philippe)
> - Track Malta's PIIX dependencies through KConfig
> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits' series [3]
> - Also rebase onto latest master to resolve merge conflicts. This required
>   copying Philippe's series as first three patches - please ignore.
> 
> v2:
> - Introduce TYPE_ defines for IDE and USB device models (Mark)
> - Omit unexporting of PIIXState (Mark)
> - Improve commit message of patch 5 to mention reset triggering through PCI
>   configuration space (Mark)
> - Move reviewed patches w/o dependencies to the bottom of the series for early
>   upstreaming
> 
> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02348.html
> [2] https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03310.html
> [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg05367.html
> 
> Bernhard Beschow (28):
>   hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>   hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>   hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
>     created
>   hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>     south bridge
>   hw/i386/pc: Create RTC controllers in south bridges
>   hw/i386/pc: No need for rtc_state to be an out-parameter
>   hw/isa/piix3: Create USB controller in host device
>   hw/isa/piix3: Create power management controller in host device
>   hw/intc/i8259: Make using the isa_pic singleton more type-safe
>   hw/intc/i8259: Introduce i8259 proxy "isa-pic"
>   hw/isa/piix3: Create ISA PIC in host device
>   hw/isa/piix3: Create IDE controller in host device
>   hw/isa/piix3: Wire up ACPI interrupt internally
>   hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>   hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>   hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>   hw/isa/piix3: Drop the "3" from PIIX base class
>   hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>   hw/isa/piix4: Remove unused inbound ISA interrupt lines
>   hw/isa/piix4: Use ISA PIC device
>   hw/isa/piix4: Reuse struct PIIXState from PIIX3
>   hw/isa/piix4: Rename reset control operations to match PIIX3
>   hw/isa/piix3: Merge hw/isa/piix4.c
>   hw/isa/piix: Harmonize names of reset control memory regions
>   hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>   hw/isa/piix: Rename functions to be shared for interrupt triggering
>   hw/isa/piix: Consolidate IRQ triggering
>   hw/isa/piix: Share PIIX3's base class with PIIX4
> 
> Philippe Mathieu-Daudé (3):
>   hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>   hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>   hw/isa/piix4: Correct IRQRC[A:D] reset values
> 
>  configs/devices/mips-softmmu/common.mak |   2 -
>  hw/usb/hcd-uhci.h                       |   4 +
>  include/hw/i386/ich9.h                  |   2 +
>  include/hw/i386/pc.h                    |   2 +-
>  include/hw/intc/i8259.h                 |  25 +-
>  include/hw/southbridge/piix.h           |  30 ++-
>  include/qemu/typedefs.h                 |   1 +
>  hw/i386/pc.c                            |  16 +-
>  hw/i386/pc_piix.c                       |  77 +++---
>  hw/i386/pc_q35.c                        |  16 +-
>  hw/intc/i8259.c                         |  38 ++-
>  hw/isa/lpc_ich9.c                       |   8 +
>  hw/isa/{piix3.c => piix.c}              | 274 ++++++++++++++++-----
>  hw/isa/piix4.c                          | 302 ------------------------
>  hw/mips/malta.c                         |  38 ++-
>  hw/usb/hcd-uhci.c                       |  16 +-
>  MAINTAINERS                             |   6 +-
>  hw/i386/Kconfig                         |   4 +-
>  hw/isa/Kconfig                          |   8 +-
>  hw/isa/meson.build                      |   3 +-
>  hw/mips/Kconfig                         |   2 +
>  21 files changed, 419 insertions(+), 455 deletions(-)
>  rename hw/isa/{piix3.c => piix.c} (57%)
>  delete mode 100644 hw/isa/piix4.c
> 
> -- 
> 2.39.0
> 


