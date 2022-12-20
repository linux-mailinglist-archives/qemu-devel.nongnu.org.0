Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 373F76523AB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 16:30:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7eZO-0000oG-Km; Tue, 20 Dec 2022 10:30:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eZJ-0000nq-N2
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:30:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eZH-0002Ry-No
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 10:30:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671550211;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XX0hvPZqr1UYPcxo6wpQ6WVQ/y8Z5jmEDrjpo4EBFYs=;
 b=RysnvS47B7+Qebp8KCfitOIpCsCm/+p/IBPDHL9+j8x8iOab2V1H59e7e2GI4KihJMQF29
 LXXFDdSqctHACJGHGdPzadxjxBqUm39lbXIXA8u4ARWI3rb7Bf3QCFvubMpxO47K/T56O5
 vCVZygvlVwAR6opMB1aOGeGbsjezhF0=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-640-nb6IdcotNO6qGa4Y60hOLg-1; Tue, 20 Dec 2022 10:30:10 -0500
X-MC-Unique: nb6IdcotNO6qGa4Y60hOLg-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-3bd1ff8fadfso145789067b3.18
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:30:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XX0hvPZqr1UYPcxo6wpQ6WVQ/y8Z5jmEDrjpo4EBFYs=;
 b=kfFJ4SDLXOnQ5IAW68hVW8WN6lk66jmGx8xjj5fss89he6gPcc+DxQ96QHZQu48UDz
 Ivx0/MlqAWnFXrFcp8+uRiu1Hn+3CZ5hK4yN0K2HnnodYEemI4DzaOS3D+1lO9rC+sQc
 1/f3jR1lzO0WLvPFRuXunotJ9q68xkSs1IAAoyuRbpNCjb7C4nM6DWC0uQmluZphGO/8
 go8PPwcS9qmmwoxHL5c04fWVa1+1LUQzerlEmGo39XwgdX88SG+jEDuMqbnlTBIIcmI0
 NkUN8bATLokkYxk9xVBUwLqCAVWj3O1x41fApBuSO/H6Lu2ITmFrSCH4Fz7X1GjNvbrS
 SCRw==
X-Gm-Message-State: ANoB5pn8vqtxwNHtemlkfQPZn2TCy7nbYyQ+YbCThNjL3H45wtewr3fP
 zmqMK/CiR+5bgRQM5w3VMDLa1qIdPmg/3qxY2b/szuGOT4vJ1vkSAEu0Sk7LvXNTNB1CpDT02uF
 n85GY/yTILjICkQ8=
X-Received: by 2002:a81:791:0:b0:3bc:303a:25a3 with SMTP id
 139-20020a810791000000b003bc303a25a3mr34347997ywh.29.1671550209131; 
 Tue, 20 Dec 2022 07:30:09 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5JJ3rZTDxaMmtSjz8KrZH7Xv+K8gAyxpZY++cisxNm3aK48UOTfovYhgFndIGKnRtYvnjo0A==
X-Received: by 2002:a81:791:0:b0:3bc:303a:25a3 with SMTP id
 139-20020a810791000000b003bc303a25a3mr34347948ywh.29.1671550208760; 
 Tue, 20 Dec 2022 07:30:08 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 l10-20020a37f90a000000b006fcab4da037sm8969222qkj.39.2022.12.20.07.30.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 07:30:08 -0800 (PST)
Date: Tue, 20 Dec 2022 10:30:00 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: Re: [PATCH 00/32] Consolidate PIIX south bridges
Message-ID: <20221220102921-mutt-send-email-mst@kernel.org>
References: <20221204190553.3274-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221204190553.3274-1-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

On Sun, Dec 04, 2022 at 08:05:21PM +0100, Bernhard Beschow wrote:
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
> consolidation continues in step five which concludes the series.
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
> A challenge still remains with consolidating PCI interrupt handling. There are
> still board-specific piix3_pci_slot_get_pirq() and piix4_pci_slot_get_pirq()
> which are implemented in isa/piix.c. Any advice how to resolve these would be
> highly appreaciated. See [2] for details.
> 
> Last but not least there might be some opportunity to consolidate VM state
> handling, probably by reusing the one from PIIX3. Since I'm not very familiar
> with the requirements I didn't touch it so far.

Series

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>

ok to be merged through mips tree.

> Testing done:
> * make check
> * make check-avocado
> * Boot live CD:
>   * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
>   * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kde-21.3.2-220704-linux515.iso`
> * 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=ttyS0"`
> 
> v3:
> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_USB_UHCIx (Philippe)
> - Make proxy PIC generic (Philippe)
> - Track Malta's PIIX dependencies through KConfig
> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits' series [3]
> - Also rebase onto latest master to resolve merge conflicts. This required copying
>   Philippe's series as first three patches - please ignore.
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
> Bernhard Beschow (29):
>   hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig
>   hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>     south bridge
>   hw/usb/hcd-uhci: Introduce TYPE_ defines for device models
>   hw/i386/pc: Create RTC controllers in south bridges
>   hw/i386/pc: No need for rtc_state to be an out-parameter
>   hw/isa/piix3: Create USB controller in host device
>   hw/isa/piix3: Create power management controller in host device
>   hw/core: Introduce proxy-pic
>   hw/isa/piix3: Create Proxy PIC in host device
>   hw/isa/piix3: Create IDE controller in host device
>   hw/isa/piix3: Wire up ACPI interrupt internally
>   hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>   hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>   hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>   hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"
>   hw/isa/piix3: Rename typedef PIIX3State to PIIXState
>   hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>   hw/isa/piix4: Remove unused code
>   hw/isa/piix4: Use Proxy PIC device
>   hw/isa/piix4: Reuse struct PIIXState from PIIX3
>   hw/isa/piix4: Rename reset control operations to match PIIX3
>   hw/isa/piix4: Prefix pci_slot_get_pirq() with "piix4_"
>   hw/isa/piix3: Merge hw/isa/piix4.c
>   hw/isa/piix: Harmonize names of reset control memory regions
>   hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
>   hw/isa/piix: Rename functions to be shared for interrupt triggering
>   hw/isa/piix: Consolidate IRQ triggering
>   hw/isa/piix: Share PIIX3 base class with PIIX4
>   hw/isa/piix: Drop the "3" from the PIIX base class
> 
> Philippe Mathieu-Daudé (3):
>   hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition
>   hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader
>   hw/isa/piix4: Correct IRQRC[A:D] reset values
> 
>  MAINTAINERS                             |   8 +-
>  configs/devices/mips-softmmu/common.mak |   2 -
>  hw/core/Kconfig                         |   3 +
>  hw/core/meson.build                     |   1 +
>  hw/core/proxy-pic.c                     |  70 +++++
>  hw/i386/Kconfig                         |   4 +-
>  hw/i386/pc.c                            |  16 +-
>  hw/i386/pc_piix.c                       |  71 ++---
>  hw/i386/pc_q35.c                        |  16 +-
>  hw/isa/Kconfig                          |  10 +-
>  hw/isa/lpc_ich9.c                       |   8 +
>  hw/isa/meson.build                      |   3 +-
>  hw/isa/{piix3.c => piix.c}              | 302 +++++++++++++++++-----
>  hw/isa/piix4.c                          | 327 ------------------------
>  hw/mips/Kconfig                         |   2 +
>  hw/mips/malta.c                         |  38 ++-
>  hw/usb/hcd-uhci.c                       |  16 +-
>  hw/usb/hcd-uhci.h                       |   4 +
>  include/hw/core/proxy-pic.h             |  54 ++++
>  include/hw/i386/ich9.h                  |   2 +
>  include/hw/i386/pc.h                    |   2 +-
>  include/hw/southbridge/piix.h           |  30 ++-
>  22 files changed, 520 insertions(+), 469 deletions(-)
>  create mode 100644 hw/core/proxy-pic.c
>  rename hw/isa/{piix3.c => piix.c} (56%)
>  delete mode 100644 hw/isa/piix4.c
>  create mode 100644 include/hw/core/proxy-pic.h
> 
> -- 
> 2.38.1
> 


