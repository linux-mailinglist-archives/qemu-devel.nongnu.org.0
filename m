Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E9BD6EA476
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 09:17:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppkzd-00079d-C9; Fri, 21 Apr 2023 03:15:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ppkza-00079T-Np
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:15:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ppkzY-0004Vq-FW
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 03:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682061335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HHh5g57kiUaHJtDCutCL/V7Qo3rn7JBr2Ig7j2TgvmI=;
 b=KbVR6YBX3UfhraRZf4Cyi/esTOg+ZPJq5CHugIAW3Z/0vLuIquZhh+plxjJqr33uZM4nMz
 +1n/igjJjBQQcmSwfNRUsWqeE7ili5q3bNmnkalPdPiCcDG4sANt3O5tHsGBIfvJ00BBV4
 XB2vJnI0sk0v7mjvmi8f8lVpUFyIiRI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-178-AZOajXQ-NIeCilFKBEhFpQ-1; Fri, 21 Apr 2023 03:15:24 -0400
X-MC-Unique: AZOajXQ-NIeCilFKBEhFpQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-2f831f6e175so796778f8f.2
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 00:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682061323; x=1684653323;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HHh5g57kiUaHJtDCutCL/V7Qo3rn7JBr2Ig7j2TgvmI=;
 b=PTxxcYuidwkqBKwpRYa2Usn96B/7sOuQNneJsghzTSrhH5ZlxQsQaqJPzuVA7eE5YB
 ZZ5Aqn5da0BdAZ5jwk/T2bbQYLN2F/R7rue5bIRaskv+EXhRZFRTlGZz1vpsWKSluSe9
 Qe1rPG/snvBR/72JXkBPwOopY6i4jp2INMRsC/6eLEd0sOQ4jVYdJrJDldBxgM+nc5CM
 GNte3/gdDw2wPXIEFWb1essGRGa53LBLBhqvcDWMaCelxiXhmutBoU24ephmms4zL4zo
 EDkRh+nJkvNckZHNL6HWGkOfwx22rYHfmAKW5gq9G/ptw66lwENCaG0rnRPaODzWxtTU
 KxFg==
X-Gm-Message-State: AAQBX9dlEZvMAg0SCy1j7mzjxiBHd4e2Z38CbkncAeG3cBJM0ghUZru9
 IULLbJgyeaAftM0MAQBELgYexJBy23LdfJm/7KQrk/1oAZu9w3St1W5JFKRl5kpIas5CRn2zT3F
 MVTW2QX2PGJFtamc=
X-Received: by 2002:a05:6000:1289:b0:2ce:ae05:4436 with SMTP id
 f9-20020a056000128900b002ceae054436mr3004509wrx.41.1682061323686; 
 Fri, 21 Apr 2023 00:15:23 -0700 (PDT)
X-Google-Smtp-Source: AKy350YI6Nu5AFgRZ0PdJVcd4krklLdnW9pGXZPkCH8MLU6UKzjBLM3eIBUqo5RE7gEJDIvb5tTGHQ==
X-Received: by 2002:a05:6000:1289:b0:2ce:ae05:4436 with SMTP id
 f9-20020a056000128900b002ceae054436mr3004476wrx.41.1682061323265; 
 Fri, 21 Apr 2023 00:15:23 -0700 (PDT)
Received: from redhat.com ([2.55.17.255]) by smtp.gmail.com with ESMTPSA id
 y11-20020adfe6cb000000b002f81b4227cesm3760510wrm.19.2023.04.21.00.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 00:15:22 -0700 (PDT)
Date: Fri, 21 Apr 2023 03:15:18 -0400
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
Message-ID: <20230421031431-mutt-send-email-mst@kernel.org>
References: <20230302212201.224360-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302212201.224360-1-shentey@gmail.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Mar 02, 2023 at 10:21:38PM +0100, Bernhard Beschow wrote:
> This series consolidates the implementations of the PIIX3 and PIIX4 south
> bridges and is an extended version of [1]. The motivation is to share as much
> code as possible and to bring both device models to feature parity such that
> perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine. This
> could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on this
> list before.

Hi!
No freeze is over, could you rebase pls?
I could try to resolve the conflicts but this is so big I'd rather
not take the risk of messing it up.

> The series is structured as follows:
> 
> Move sub devices into the PIIX3 south bridge, like PIIX4 does already:
> * hw/i386/pc: Create RTC controllers in south bridges
> * hw/i386/pc: No need for rtc_state to be an out-parameter
> * hw/i386/pc_piix: Allow for setting properties before realizing PIIX3 south bridge
> * hw/isa/piix3: Create USB controller in host device
> * hw/isa/piix3: Create power management controller in host device
> * hw/isa/piix3: Move ISA bus IRQ assignments into host device
> * hw/isa/piix3: Create IDE controller in host device
> * hw/isa/piix3: Wire up ACPI interrupt internally
> 
> Make PIIX3 and PIIX4 south bridges more similar:
> * hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
> * hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
> * hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
> * hw/isa/piix3: Drop the "3" from PIIX base class
> * hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
> * hw/isa/piix4: Remove unused inbound ISA interrupt lines
> * hw/isa/piix4: Reuse struct PIIXState from PIIX3
> * hw/isa/piix4: Create the "intr" property during init() already
> * hw/isa/piix4: Rename reset control operations to match PIIX3
> 
> This patch achieves the main goal of the series:
> * hw/isa/piix3: Merge hw/isa/piix4.c
> 
> Perform some further consolidations which were easier to do after the merge:
> * hw/isa/piix: Harmonize names of reset control memory regions
> * hw/isa/piix: Rename functions to be shared for interrupt triggering
> * hw/isa/piix: Consolidate IRQ triggering
> * hw/isa/piix: Share PIIX3's base class with PIIX4
> * hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
> 
> One challenge was dealing with optional devices where Peter already gave advice
> in [1] which this series implements.
> 
> There are still some differences in the device models:
> - PIIX4 instantiates its own PIC and PIT while PIIX3 doesn't
> - PIIX4 wires up the RTC IRQ itself while PIIX3 doesn't
> - Different binary layout in VM state
> 
> v8:
> - Rebase onto master
> - Remove Reviewed-by tag from 'hw/isa/piix: Reuse PIIX3 base class' realize
>   method in PIIX4' since it changed considerably in v7.
> 
> Testing done (both on top of series as well as on 'hw/isa/piix3: Drop the "3"
> from PIIX base class'):
> * `make check`
> * `make check-avocado`
> * Boot live CD:
>   * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom
> manjaro-kde-21.3.2-220704-linux515.iso`
>   * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom
> manjaro-kde-21.3.2-220704-linux515.iso`
> * 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda
> debian_wheezy_mipsel_standard.qcow2 -append "root=/dev/sda1 console=ttyS0"`
> 
> v7:
> - Rebase onto master
> - Avoid the PIC proxy (Phil)
>   The motivation for the PIC proxy was to allow for wiring up ISA interrupts in
>   the south bridges. ISA interrupt wiring requires the GPIO lines to be
>   populated already but pc_piix assigned the interrupts only after realizing
>   PIIX3. By shifting interrupt assignment before realizing, the ISA interrupts
>   are already populated during PIIX3's realize phase where the ISA interrupts
>   are wired up.
> - New patches:
>   * hw/isa/piix4: Reuse struct PIIXState from PIIX3
>   * hw/isa/piix4: Create the "intr" property during init() already
> - Patches with substantial changes (Reviewed-by dropped):
>   * hw/isa/piix3: Move ISA bus IRQ assignments into host device
> 
> v6:
> - Fix some comments about TYPE_ISA_PIC (Mark) ... and use it consistently
>   within the patch series.
> - Incorporate series "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south
>   bridges" [2] for maintainer convenience.
> - Merge v5's 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is
>   created' into
>   https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03312.html . Do
>   similar for Malta.
> - Rebase onto latest master (d6271b657286 "Merge tag 'for_upstream' of
>   https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging")
> 
> v5:
> - Pick up Reviewed-by tags from https://lists.nongnu.org/archive/html/qemu-devel/2023-01/msg00116.html
> - Add patch to make usage of the isa_pic global more type-safe
> - Re-introduce isa-pic as PIC specific proxy (Mark)
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
> Bernhard Beschow (23):
>   hw/i386/pc: Create RTC controllers in south bridges
>   hw/i386/pc: No need for rtc_state to be an out-parameter
>   hw/i386/pc_piix: Allow for setting properties before realizing PIIX3
>     south bridge
>   hw/isa/piix3: Create USB controller in host device
>   hw/isa/piix3: Create power management controller in host device
>   hw/isa/piix3: Move ISA bus IRQ assignments into host device
>   hw/isa/piix3: Create IDE controller in host device
>   hw/isa/piix3: Wire up ACPI interrupt internally
>   hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS
>   hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4
>   hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4
>   hw/isa/piix3: Drop the "3" from PIIX base class
>   hw/isa/piix4: Make PIIX4's ACPI and USB functions optional
>   hw/isa/piix4: Remove unused inbound ISA interrupt lines
>   hw/isa/piix4: Reuse struct PIIXState from PIIX3
>   hw/isa/piix4: Create the "intr" property during init() already
>   hw/isa/piix4: Rename reset control operations to match PIIX3
>   hw/isa/piix3: Merge hw/isa/piix4.c
>   hw/isa/piix: Harmonize names of reset control memory regions
>   hw/isa/piix: Rename functions to be shared for interrupt triggering
>   hw/isa/piix: Consolidate IRQ triggering
>   hw/isa/piix: Share PIIX3's base class with PIIX4
>   hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4
> 
>  MAINTAINERS                   |   6 +-
>  include/hw/i386/pc.h          |   2 +-
>  include/hw/southbridge/ich9.h |   2 +
>  include/hw/southbridge/piix.h |  28 +++-
>  hw/i386/pc.c                  |  16 +-
>  hw/i386/pc_piix.c             |  67 ++++----
>  hw/i386/pc_q35.c              |   4 +-
>  hw/isa/lpc_ich9.c             |   8 +
>  hw/isa/{piix3.c => piix.c}    | 306 ++++++++++++++++++++++++++--------
>  hw/isa/piix4.c                | 302 ---------------------------------
>  hw/mips/malta.c               |   6 +-
>  hw/i386/Kconfig               |   3 +-
>  hw/isa/Kconfig                |   8 +-
>  hw/isa/meson.build            |   3 +-
>  hw/mips/Kconfig               |   2 +-
>  15 files changed, 334 insertions(+), 429 deletions(-)
>  rename hw/isa/{piix3.c => piix.c} (55%)
>  delete mode 100644 hw/isa/piix4.c
> 
> -- 
> 2.39.2
> 


