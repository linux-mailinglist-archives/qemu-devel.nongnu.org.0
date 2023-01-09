Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BE06662C98
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 18:26:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEvtL-0002Ob-1w; Mon, 09 Jan 2023 12:24:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtI-0002O7-LY; Mon, 09 Jan 2023 12:24:56 -0500
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pEvtG-0000yV-9z; Mon, 09 Jan 2023 12:24:56 -0500
Received: by mail-ej1-x630.google.com with SMTP id ud5so21940203ejc.4;
 Mon, 09 Jan 2023 09:24:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=p+y3YvOwEdr28YAjEaekiYYBCoJD3NcqH/Akwzddnnc=;
 b=ZHBkvMDEdcsM0vKkgrBWsjdleI3fsezF75HP4eB+ywYwHMeM+NVG5RxZ0+CYRWSxct
 r15cMf5oaom++cZy/yFTsjuRn814aGAc4puoC6aaks8AzEAa5YZw1rwujUjew/28EYxA
 7Hc7JB8nGYiK/Oga2dlN0Qhjkml/CrhT9vWJw0xaNGRFNGPImyx18XpgnOEgFQQKbAzl
 F4GXxy9+m3ZOx8KTRyyhbYBkoeOvwoPiFOtecy1SbdredbZP9FglyCb9OWLcMTqDvqnG
 vqKbzVQL+ztqEiiOGOiyjzvu9fIvDB9YKmMIo6paE24jYZBFNm0uz0xeZx4/Qiai60io
 8CiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p+y3YvOwEdr28YAjEaekiYYBCoJD3NcqH/Akwzddnnc=;
 b=VjzxqZyFzf3WrNbfCtWS2XNmy3AWMcGgJA8GzyE4tYTwv5/KG+Aq9nt0xwz0VnWaWL
 7ry3E6CSwakmKcXlLFOOs6T2UrvvRbfNnTcWCn8QqcXvpNb73vJTi7RiAj8rTRnE3Qau
 E0+FDy5Ap1he8xCD9KZFoRpFsUZYiKnmRrpCuciIzo8j+PGcpaURmncXVRFerEJB1ra/
 WnKi8plMgE9/syVy4gFXnCaWWTlSPKSxmoEHotsT7bNw8pUxz11rXKViM6k/JRxQCehB
 LA5HDSLyjngboeWTVj7n0qgA8ngH5yd5MA16QE0FIVg9cM3Kr+gPRUZ3WTzBgmB4jYCB
 xs8A==
X-Gm-Message-State: AFqh2koP4SFIzTWTTGzzh7NkT7aSx3ZWGqK2v6p6ymwWzTjMriw98Pwc
 R9B4gut3QMeVkk4QGPPhVpL8DW31T2kIxA==
X-Google-Smtp-Source: AMrXdXthryZjQ3vnOJEtaYtUyF6mXk3pbJPNFWz6AG42kj3mrcS5022HsMMZmp9Sso8VeWpgISmcSw==
X-Received: by 2002:a17:907:6f09:b0:7c1:277:cb00 with SMTP id
 sy9-20020a1709076f0900b007c10277cb00mr56814654ejc.23.1673285091415; 
 Mon, 09 Jan 2023 09:24:51 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 18-20020a170906201200b00846734faa9asm3925625ejo.164.2023.01.09.09.24.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 09:24:50 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: John G Johnson <john.g.johnson@oracle.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Eduardo Habkost <eduardo@habkost.net>, Gerd Hoffmann <kraxel@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 qemu-ppc@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v6 00/33] Consolidate PIIX south bridges
Date: Mon,  9 Jan 2023 18:23:13 +0100
Message-Id: <20230109172347.1830-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x630.google.com
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

This series consolidates the implementations of the PIIX3 and PIIX4 south=0D
bridges and is an extended version of [1]. The motivation is to share as mu=
ch=0D
code as possible and to bring both device models to feature parity such tha=
t=0D
perhaps PIIX4 can become a drop-in-replacement for PIIX3 in the pc machine.=
 This=0D
could resolve the "Frankenstein" PIIX4-PM problem in PIIX3 discussed on thi=
s=0D
list before.=0D
=0D
The series is structured as follows:=0D
=0D
These patches are included for compatibility, please ignore:=0D
* hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition=0D
* hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader=0D
* hw/isa/piix4: Correct IRQRC[A:D] reset values=0D
=0D
'Decouple INTx-to-LNKx routing from south bridges', see [2]:=0D
* hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()=0D
* hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific=0D
* hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific=0D
=0D
* hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig=0D
* hw/usb/hcd-uhci: Introduce TYPE_ defines for device models=0D
=0D
Allow for making both PIIX south bridges agnostic about the virtualization=
=0D
technology used by allowing to shift the virtualization policies into board=
=0D
code:=0D
* hw/intc/i8259: Make using the isa_pic singleton more type-safe=0D
* hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC=0D
=0D
Move sub devices into the PIIX3 south bridge, like PIIX4 does already:=0D
* hw/i386/pc: Create RTC controllers in south bridges=0D
* hw/i386/pc: No need for rtc_state to be an out-parameter=0D
* hw/i386/pc_piix: Allow for setting properties before realizing PIIX3 sout=
h bridge=0D
* hw/isa/piix3: Create USB controller in host device=0D
* hw/isa/piix3: Create power management controller in host device=0D
* hw/isa/piix3: Create TYPE_ISA_PIC in host device=0D
* hw/isa/piix3: Create IDE controller in host device=0D
* hw/isa/piix3: Wire up ACPI interrupt internally=0D
=0D
Make PIIX3 and PIIX4 south bridges more similar:=0D
* hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS=0D
* hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4=0D
* hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4=0D
* hw/isa/piix3: Drop the "3" from PIIX base class=0D
* hw/isa/piix4: Make PIIX4's ACPI and USB functions optional=0D
* hw/isa/piix4: Remove unused inbound ISA interrupt lines=0D
* hw/isa/piix4: Use TYPE_ISA_PIC device=0D
* hw/isa/piix4: Reuse struct PIIXState from PIIX3=0D
* hw/isa/piix4: Rename reset control operations to match PIIX3=0D
=0D
This patch achieves the main goal of the series:=0D
* hw/isa/piix3: Merge hw/isa/piix4.c=0D
=0D
Perform some further consolidations which were easier to do after the merge=
:=0D
* hw/isa/piix: Harmonize names of reset control memory regions=0D
* hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4=0D
* hw/isa/piix: Rename functions to be shared for interrupt triggering=0D
* hw/isa/piix: Consolidate IRQ triggering=0D
* hw/isa/piix: Share PIIX3's base class with PIIX4=0D
=0D
One particular challenge in this series was that the PIC of PIIX3 used to b=
e=0D
instantiated outside of the south bridge while some sub functions require a=
 PIC=0D
with populated qemu_irqs. This has been solved by introducing a proxy PIC w=
hich=0D
furthermore allows PIIX3 to be agnostic towards the virtualization technolo=
gy=0D
used (KVM, TCG, Xen). Due to consolidation PIIX4 gained the proxy PIC as we=
ll.=0D
=0D
Another challenge was dealing with optional devices where Peter already gav=
e=0D
advice in [1] which this series implements.=0D
=0D
Last but not least there might be some opportunity to consolidate VM state=
=0D
handling, probably by reusing the one from PIIX3. Since I'm not very famili=
ar=0D
with the requirements I didn't touch it so far.=0D
=0D
v6:=0D
- Fix some comments about TYPE_ISA_PIC (Mark) ... and use it consistently=0D
  within the patch series.=0D
- Incorporate series "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from sou=
th=0D
  bridges" [2] for maintainer convenience.=0D
- Merge v5's 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus =
is=0D
  created' into=0D
  https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03312.html . =
Do=0D
  similar for Malta.=0D
- Rebase onto latest master (d6271b657286 "Merge tag 'for_upstream' of=0D
  https://git.kernel.org/pub/scm/virt/kvm/mst/qemu into staging")=0D
=0D
Testing done:=0D
* make check=0D
* Boot live CD:=0D
  * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde=
-21.3.2-220704-linux515.iso`=0D
  * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kd=
e-21.3.2-220704-linux515.iso`=0D
* 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda deb=
ian_wheezy_mipsel_standard.qcow2 -append "root=3D/dev/sda1 console=3DttyS0"=
`=0D
=0D
v5:=0D
- Pick up Reviewed-by tags from https://lists.nongnu.org/archive/html/qemu-=
devel/2023-01/msg00116.html=0D
- Add patch to make usage of the isa_pic global more type-safe=0D
- Re-introduce isa-pic as PIC specific proxy (Mark)=0D
=0D
v4:=0D
- Rebase onto "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south brid=
ges"=0D
  since it is already queued via mips-next. This eliminates patches=0D
  'hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"' and 'hw/isa/piix=
4:=0D
  Prefix pci_slot_get_pirq() with "piix4_"'.=0D
- Squash 'hw/isa/piix: Drop the "3" from the PIIX base class' into=0D
  'hw/isa/piix3: Rename typedef PIIX3State to PIIXState'. I originally only=
=0D
  split these patches since I wasn't sure whether renaming a type was allow=
ed.=0D
- Add new patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI b=
us is=0D
  created' for forther cleanup of INTx-to-LNKx route decoupling.=0D
=0D
v3:=0D
- Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_USB_UH=
CIx=0D
  (Philippe)=0D
- Make proxy PIC generic (Philippe)=0D
- Track Malta's PIIX dependencies through KConfig=0D
- Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits' se=
ries [3]=0D
- Also rebase onto latest master to resolve merge conflicts. This required=
=0D
  copying Philippe's series as first three patches - please ignore.=0D
=0D
v2:=0D
- Introduce TYPE_ defines for IDE and USB device models (Mark)=0D
- Omit unexporting of PIIXState (Mark)=0D
- Improve commit message of patch 5 to mention reset triggering through PCI=
=0D
  configuration space (Mark)=0D
- Move reviewed patches w/o dependencies to the bottom of the series for ea=
rly=0D
  upstreaming=0D
=0D
[1] https://lists.nongnu.org/archive/html/qemu-devel/2022-07/msg02348.html=
=0D
[2] https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03310.html=
=0D
[3] https://lists.nongnu.org/archive/html/qemu-devel/2022-10/msg05367.html=
=0D
=0D
Bernhard Beschow (30):=0D
  hw/pci/pci: Factor out pci_bus_map_irqs() from pci_bus_irqs()=0D
  hw/isa/piix3: Decouple INTx-to-LNKx routing which is board-specific=0D
  hw/isa/piix4: Decouple INTx-to-LNKx routing which is board-specific=0D
  hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig=0D
  hw/usb/hcd-uhci: Introduce TYPE_ defines for device models=0D
  hw/intc/i8259: Make using the isa_pic singleton more type-safe=0D
  hw/intc/i8259: Introduce i8259 proxy TYPE_ISA_PIC=0D
  hw/i386/pc: Create RTC controllers in south bridges=0D
  hw/i386/pc: No need for rtc_state to be an out-parameter=0D
  hw/i386/pc_piix: Allow for setting properties before realizing PIIX3=0D
    south bridge=0D
  hw/isa/piix3: Create USB controller in host device=0D
  hw/isa/piix3: Create power management controller in host device=0D
  hw/isa/piix3: Create TYPE_ISA_PIC in host device=0D
  hw/isa/piix3: Create IDE controller in host device=0D
  hw/isa/piix3: Wire up ACPI interrupt internally=0D
  hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS=0D
  hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4=0D
  hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4=0D
  hw/isa/piix3: Drop the "3" from PIIX base class=0D
  hw/isa/piix4: Make PIIX4's ACPI and USB functions optional=0D
  hw/isa/piix4: Remove unused inbound ISA interrupt lines=0D
  hw/isa/piix4: Use TYPE_ISA_PIC device=0D
  hw/isa/piix4: Reuse struct PIIXState from PIIX3=0D
  hw/isa/piix4: Rename reset control operations to match PIIX3=0D
  hw/isa/piix3: Merge hw/isa/piix4.c=0D
  hw/isa/piix: Harmonize names of reset control memory regions=0D
  hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4=0D
  hw/isa/piix: Rename functions to be shared for interrupt triggering=0D
  hw/isa/piix: Consolidate IRQ triggering=0D
  hw/isa/piix: Share PIIX3's base class with PIIX4=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition=0D
  hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader=0D
  hw/isa/piix4: Correct IRQRC[A:D] reset values=0D
=0D
 configs/devices/mips-softmmu/common.mak |   2 -=0D
 hw/usb/hcd-uhci.h                       |   4 +=0D
 include/hw/i386/ich9.h                  |   2 +=0D
 include/hw/i386/pc.h                    |   2 +-=0D
 include/hw/intc/i8259.h                 |  24 +-=0D
 include/hw/pci/pci.h                    |   3 +-=0D
 include/hw/southbridge/piix.h           |  31 ++-=0D
 include/qemu/typedefs.h                 |   1 +=0D
 hw/i386/pc.c                            |  16 +-=0D
 hw/i386/pc_piix.c                       |  87 ++++---=0D
 hw/i386/pc_q35.c                        |  20 +-=0D
 hw/intc/i8259.c                         |  38 ++-=0D
 hw/isa/lpc_ich9.c                       |   8 +=0D
 hw/isa/{piix3.c =3D> piix.c}              | 289 +++++++++++++++------=0D
 hw/isa/piix4.c                          | 327 ------------------------=0D
 hw/mips/malta.c                         |  65 ++++-=0D
 hw/pci-host/raven.c                     |   3 +-=0D
 hw/pci-host/versatile.c                 |   3 +-=0D
 hw/pci/pci.c                            |  12 +-=0D
 hw/remote/machine.c                     |   3 +-=0D
 hw/usb/hcd-uhci.c                       |  16 +-=0D
 MAINTAINERS                             |   6 +-=0D
 hw/i386/Kconfig                         |   4 +-=0D
 hw/isa/Kconfig                          |   8 +-=0D
 hw/isa/meson.build                      |   3 +-=0D
 hw/mips/Kconfig                         |   2 +=0D
 26 files changed, 479 insertions(+), 500 deletions(-)=0D
 rename hw/isa/{piix3.c =3D> piix.c} (57%)=0D
 delete mode 100644 hw/isa/piix4.c=0D
=0D
-- =0D
2.39.0=0D
=0D

