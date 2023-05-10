Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61FB26FE475
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 21:22:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwpMi-0004RX-6A; Wed, 10 May 2023 15:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwpMg-0004RE-Nb
 for qemu-devel@nongnu.org; Wed, 10 May 2023 15:20:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pwpMb-0007GB-S0
 for qemu-devel@nongnu.org; Wed, 10 May 2023 15:20:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683746436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SQn/vVJpGt+wSH0/LvLKJtuLSzXuKMpL7Nqa6a8NAfE=;
 b=WvKY8xMPZE/FnRKLb+EEziSmQjzvmOZBbZYz+LmydUnPDdpEktFaT//rgZJzuupPD1cg6T
 zJ34OzZO7tPkYdzmFmiAEt4+rb4qVtN22QTbvdca/YuedJyIS4jNOh93/Z9S409XLYanWA
 URQpot0yY62mGgi9g4+FrGjiMwfXWJ4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-237-rRR5vsmqPgKmD_9OZa-8cg-1; Wed, 10 May 2023 15:20:35 -0400
X-MC-Unique: rRR5vsmqPgKmD_9OZa-8cg-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-3f426ffdbc6so24042165e9.3
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 12:20:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683746434; x=1686338434;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SQn/vVJpGt+wSH0/LvLKJtuLSzXuKMpL7Nqa6a8NAfE=;
 b=atkSiEExnNfNcNM3P03se2fQhoNpF29+2pjTTdnur2KBj1GcLecX/9Fi1iPstw0Qr8
 gzztdS+rrjQEtQ0DBTxgrXa00Yml/afVxHrjs955q3eGZPOcVdzo7a/YTHSRp0jdVb3h
 PhT0ZjgmHYheyJAuVpLQFRz5EdAaABYAELBWFWwEfwdq/CB5Hke/D9rGJEMcWl8+0LCX
 syaxRnmyp+QafANTPIlB+huRIjcEZAargb1W6AEMwvq3IUrPJP2q804Rr5dTs1IVXik8
 dFsOMwnvhZvQrGY411zU3jcKh9mjQFVArcYCsebH/1y5NwQqp61/PTUzYY10fRcrmEfy
 ELnQ==
X-Gm-Message-State: AC+VfDynxZaXlm4qQjY3CtkxLxn21x/tul7nGY2tT6z4ZtMG2fYUQxiy
 6848oi0fD1KvXPIsocekC6tGDOt0FjhfVHTZTSJW67RPyocmGFdioOvHPJ6WMixUKt1qnBiLxip
 PkBQqF10eXS4DV04=
X-Received: by 2002:a1c:4c19:0:b0:3f4:27ff:7d52 with SMTP id
 z25-20020a1c4c19000000b003f427ff7d52mr7089128wmf.2.1683746434592; 
 Wed, 10 May 2023 12:20:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5wbPzlA1TALh05xH8tETDoqfwZt6whecIehMhR3iYJXZ96jYLQBXG+uLhD4IcCNNjQfmmoCQ==
X-Received: by 2002:a1c:4c19:0:b0:3f4:27ff:7d52 with SMTP id
 z25-20020a1c4c19000000b003f427ff7d52mr7089114wmf.2.1683746434176; 
 Wed, 10 May 2023 12:20:34 -0700 (PDT)
Received: from redhat.com ([31.187.78.71]) by smtp.gmail.com with ESMTPSA id
 d6-20020a056000114600b00306344eaebfsm18172987wrx.28.2023.05.10.12.20.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 12:20:33 -0700 (PDT)
Date: Wed, 10 May 2023 15:20:27 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v8 00/23] Consolidate PIIX south bridges
Message-ID: <20230510152016-mutt-send-email-mst@kernel.org>
References: <20230302212201.224360-1-shentey@gmail.com>
 <20230421031431-mutt-send-email-mst@kernel.org>
 <E7BEB643-EA7E-4CF5-A00B-D9D280442472@gmail.com>
 <614D0648-CA0B-4773-A1A9-82F78813EA9A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <614D0648-CA0B-4773-A1A9-82F78813EA9A@gmail.com>
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

On Wed, May 10, 2023 at 06:39:49PM +0000, Bernhard Beschow wrote:
> 
> 
> Am 21. April 2023 16:40:47 UTC schrieb Bernhard Beschow <shentey@gmail.com>:
> >
> >
> >Am 21. April 2023 07:15:18 UTC schrieb "Michael S. Tsirkin" <mst@redhat.com>:
> >>On Thu, Mar 02, 2023 at 10:21:38PM +0100, Bernhard Beschow wrote:
> >>> This series consolidates the implementations of the PIIX3 and PIIX4 south
> >>> bridges and is an extended version of [1]. The motivation is to share as much
> >>> code as possible and to bring both device models to feature parity such that
> >>> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
> >>> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
> >>> list before.
> >>
> >>Hi!
> >>No freeze is over, could you rebase pls?
> >>I could try to resolve the conflicts but this is so big I'd rather
> >>not take the risk of messing it up.
> >
> >Sure! Since this series is still under discussion I'd wait for the PIIX3 Xen decoupling series to land in master. This will simplify this series a bit by taking Xen out of the equation.
> 
> Could we queue the first two RTC patches already? IMO they're useful general PC cleanups on their own.
> 
> Best regards,
> Bernhard

queues 1 and 2.

> >
> >Best regards,
> >Bernhard
> >
> >>
> >>> The series is structured as follows:
> >>> 
> >>> Move sub devices into the PIIX3 south bridge, like PIIX4 does already:
> >>> * hw/i386/pc: Create RTC controllers in south bridges
> >>> * hw/i386/pc: No need for rtc_state to be an out-parameter
> >>> * hw/i386/pc_piix: Allow for setting properties before realizing PIIX3 south bridge
> >>> * hw/isa/piix3: Create USB controller in host device
> >>> * hw/isa/piix3: Create power management controller in host device
> >>> * hw/isa/piix3: Move ISA bus IRQ assignments into host device
> >>> * hw/isa/piix3: Create IDE controller in host device
> >>> * hw/isa/piix3: Wire up ACPI interrupt internally
> >>> 
> >>> Make PIIX3 and PIIX4 south bridges more similar:
> >>> * hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
> >>> * hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
> >>> * hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
> >>> * hw/isa/piix3: Drop the "3" from PIIX base class
> >>> * hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
> >>> * hw/isa/piix4: Remove unused inbound ISA interrupt lines
> >>> * hw/isa/piix4: Reuse struct PIIXState from PIIX3
> >>> * hw/isa/piix4: Create the "intr" property during init() already
> >>> * hw/isa/piix4: Rename reset control operations to match PIIX3
> >>> 
> >>> This patch achieves the main goal of the series:
> >>> * hw/isa/piix3: Merge hw/isa/piix4.c
> >>> 
> >>> Perform some further consolidations which were easier to do after the merge:
> >>> * hw/isa/piix: Harmonize names of reset control memory regions
> >>> * hw/isa/piix: Rename functions to be shared for interrupt triggering
> >>> * hw/isa/piix: Consolidate IRQ triggering
> >>> * hw/isa/piix: Share PIIX3's base class with PIIX4
> >>> * hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
> >>> 
> >>> One challenge was dealing with optional devices where Peter already gave advice
> >>> in [1] which this series implements.
> >>> 
> >>> There are still some differences in the device models:
> >>> - PIIX4 instantiates its own PIC and PIT while PIIX3 doesn't
> >>> - PIIX4 wires up the RTC IRQ itself while PIIX3 doesn't
> >>> - Different binary layout in VM state
> >>> 
> >>> v8:
> >>> - Rebase onto master
> >>> - Remove Reviewed-by tag from 'hw/isa/piix: Reuse PIIX3 base class' realize
> >>>   method in PIIX4' since it changed considerably in v7.
> >>> 
> >>> Testing done (both on top of series as well as on 'hw/isa/piix3: Drop the "3"
> >>> from PIIX base class'):
> >>> * `make check`
> >>> * `make check-avocado`
> >>> * Boot live CD:
> >>>   * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom
> >>> manjaro-kde-21.3.2-220704-linux515.iso`
> >>>   * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom
> >>> manjaro-kde-21.3.2-220704-linux515.iso`
> >>> * 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda
> >>> debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=ttyS0"`
> >>> 
> >>> v7:
> >>> - Rebase onto master
> >>> - Avoid the PIC proxy (Phil)
> >>>   The motivation for the PIC proxy was to allow for wiring up ISA interrupts in
> >>>   the south bridges. ISA interrupt wiring requires the GPIO lines to be
> >>>   populated already but pc_piix assigned the interrupts only after realizing
> >>>   PIIX3. By shifting interrupt assignment before realizing, the ISA interrupts
> >>>   are already populated during PIIX3's realize phase where the ISA interrupts
> >>>   are wired up.
> >>> - New patches:
> >>>   * hw/isa/piix4: Reuse struct PIIXState from PIIX3
> >>>   * hw/isa/piix4: Create the "intr" property during init() already
> >>> - Patches with substantial changes (Reviewed-by dropped):
> >>>   * hw/isa/piix3: Move ISA bus IRQ assignments into host device
> >>> 
> >>> v6:
> >>> - Fix some comments about TYPE_ISA_PIC (Mark) ... and use it consistently
> >>>   within the patch series.
> >>> - Incorporate series "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south
> >>>   bridges" [2] for maintainer convenience.
> >>> - Merge v5's 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
> >>>   created' into
> >>>   https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03312.html . Do
> >>>   similar for Malta.
> >>> - Rebase onto latest master (d6271b657286 "Merge tag 'for_upstream' of
> >>>   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging")
> >>> 
> >>> v5:
> >>> - Pick up Reviewed-by tags from https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg00116.html
> >>> - Add patch to make usage of the isa_pic global more type-safe
> >>> - Re-introduce isa-pic as PIC specific proxy (Mark)
> >>> 
> >>> v4:
> >>> - Rebase onto "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges"
> >>>   since it is already queued via mips-next. This eliminates patches
> >>>   'hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"' and 'hw/isa/piix4:
> >>>   Prefix pci_slot_get_pirq() with "piix4_"'.
> >>> - Squash 'hw/isa/piix: Drop the "3" from the PIIX base class' into
> >>>   'hw/isa/piix3: Rename typedef PIIX3State to PIIXState'. I originally only
> >>>   split these patches since I wasn't sure whether renaming a type was allowed.
> >>> - Add new patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
> >>>   created' for forther cleanup of INTx-to-LNKx route decoupling.
> >>> 
> >>> v3:
> >>> - Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_USB_UHCIx
> >>>   (Philippe)
> >>> - Make proxy PIC generic (Philippe)
> >>> - Track Malta's PIIX dependencies through KConfig
> >>> - Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits' series [3]
> >>> - Also rebase onto latest master to resolve merge conflicts. This required
> >>>   copying Philippe's series as first three patches - please ignore.
> >>> 
> >>> v2:
> >>> - Introduce TYPE_ defines for IDE and USB device models (Mark)
> >>> - Omit unexporting of PIIXState (Mark)
> >>> - Improve commit message of patch 5 to mention reset triggering through PCI
> >>>   configuration space (Mark)
> >>> - Move reviewed patches w/o dependencies to the bottom of the series for early
> >>>   upstreaming
> >>> 
> >>> [1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02348.html
> >>> [2] https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03310.html
> >>> [3] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg05367.html
> >>> 
> >>> Bernhard Beschow (23):
> >>>   hw/i386/pc: Create RTC controllers in south bridges
> >>>   hw/i386/pc: No need for rtc_state to be an out-parameter
> >>>   hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
> >>>     south bridge
> >>>   hw/isa/piix3: Create USB controller in host device
> >>>   hw/isa/piix3: Create power management controller in host device
> >>>   hw/isa/piix3: Move ISA bus IRQ assignments into host device
> >>>   hw/isa/piix3: Create IDE controller in host device
> >>>   hw/isa/piix3: Wire up ACPI interrupt internally
> >>>   hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
> >>>   hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
> >>>   hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
> >>>   hw/isa/piix3: Drop the "3" from PIIX base class
> >>>   hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
> >>>   hw/isa/piix4: Remove unused inbound ISA interrupt lines
> >>>   hw/isa/piix4: Reuse struct PIIXState from PIIX3
> >>>   hw/isa/piix4: Create the "intr" property during init() already
> >>>   hw/isa/piix4: Rename reset control operations to match PIIX3
> >>>   hw/isa/piix3: Merge hw/isa/piix4.c
> >>>   hw/isa/piix: Harmonize names of reset control memory regions
> >>>   hw/isa/piix: Rename functions to be shared for interrupt triggering
> >>>   hw/isa/piix: Consolidate IRQ triggering
> >>>   hw/isa/piix: Share PIIX3's base class with PIIX4
> >>>   hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
> >>> 
> >>>  MAINTAINERS                   |   6 +-
> >>>  include/hw/i386/pc.h          |   2 +-
> >>>  include/hw/southbridge/ich9.h |   2 +
> >>>  include/hw/southbridge/piix.h |  28 +++-
> >>>  hw/i386/pc.c                  |  16 +-
> >>>  hw/i386/pc_piix.c             |  67 ++++----
> >>>  hw/i386/pc_q35.c              |   4 +-
> >>>  hw/isa/lpc_ich9.c             |   8 +
> >>>  hw/isa/{piix3.c => piix.c}    | 306 ++++++++++++++++++++++++++--------
> >>>  hw/isa/piix4.c                | 302 ---------------------------------
> >>>  hw/mips/malta.c               |   6 +-
> >>>  hw/i386/Kconfig               |   3 +-
> >>>  hw/isa/Kconfig                |   8 +-
> >>>  hw/isa/meson.build            |   3 +-
> >>>  hw/mips/Kconfig               |   2 +-
> >>>  15 files changed, 334 insertions(+), 429 deletions(-)
> >>>  rename hw/isa/{piix3.c => piix.c} (55%)
> >>>  delete mode 100644 hw/isa/piix4.c
> >>> 
> >>> -- 
> >>> 2.39.2
> >>> 
> >>


