Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9B27641F2A
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 20:13:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1uKl-0001jR-AH; Sun, 04 Dec 2022 14:07:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKj-0001ht-Bq; Sun, 04 Dec 2022 14:07:25 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p1uKg-0001Zt-5V; Sun, 04 Dec 2022 14:07:24 -0500
Received: by mail-ej1-x62b.google.com with SMTP id gu23so23019026ejb.10;
 Sun, 04 Dec 2022 11:07:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dZJ/7J+EDnGTLzjz+tGPafCrkJXmMJS93PNl8e7M3E8=;
 b=AobKdZPHXTDOmnfWvkVaD6ejKmd3HGmJGF/bPPgoxCz+qGoHLmm/zrhMTBGWmbjK0I
 nULWtl8MKMi9SUW/rE7Y0FYpt9qbFd00sW+WqjTpDa35PnN2PrM7pA3Io35fOTD3ew6a
 INSjTAPhv3Patu2lA/CjjxbbY3O4kcrY56avPbZ1l2PQcIXAvGroi6hX+TD3aq57boAg
 XpKp4PodbPm3f4+iBX5VofN75c5rDc9LqJYEFI0z98kjt4vCWSbJ0AGG8ovMSFe0QbHY
 v47Xa+uE407PQY5D0VuHPxknI0rJnbboXqcrxEwZbHgrn+QgktxpBrFwh/LIGNxyFcRA
 +KUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dZJ/7J+EDnGTLzjz+tGPafCrkJXmMJS93PNl8e7M3E8=;
 b=c8MWWI7Gh4npCwrPN6d8LiuhHjFIUmU5DKQjXmubrYX8crQ4SEMed4529FI0ypR7AM
 h9hbWB99Xv2r8gRWfYCNq28ReUC1Efgck+wBw/Mbb5IWVq5iw5mNqsdk5hk0DrrCozHu
 ErX1ZACFYW3uCUBSZ/ALhHEfKKiHyCEgv0KiAABxMKHSf2zdG35eKpIrL3KbuvB6g/se
 fng8ll1WeNvTLlL9bisQKpJKzkBMwOOsPtmhoqNleTa/vaaYcS7kpoUwiqVo1uykMLpz
 fgYt7rZvvmTKdhB0Yzwbesm8krGIAN8VkFUlmgnoEUNXpd5alRoLBkYwhrPpbsUbU8bd
 RSrQ==
X-Gm-Message-State: ANoB5pk7xJJZZ5C7Vy+da3FHIpmZ1l+hXiS6XrlXHlGwDytSnq+ak5Pz
 OxSAsahSN5Nt5euhZ5803cjhmlWL+7Q=
X-Google-Smtp-Source: AA0mqf4ZD0aCnQ3OPJuT3HXhnMPEDQi62h2Fyok1lZCl8zzc2v4fFMNmt68MV/PpxpM0v1fYQVTVxQ==
X-Received: by 2002:a17:907:8c83:b0:7bf:4ac7:56e4 with SMTP id
 td3-20020a1709078c8300b007bf4ac756e4mr8634685ejc.39.1670180838613; 
 Sun, 04 Dec 2022 11:07:18 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-089-012-182-051.89.12.pool.telefonica.de. [89.12.182.51])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a17090623ea00b00782ee6b34f2sm5359835ejg.183.2022.12.04.11.07.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Dec 2022 11:07:18 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eduardo Habkost <eduardo@habkost.net>, Ani Sinha <ani@anisinha.ca>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 00/32] Consolidate PIIX south bridges
Date: Sun,  4 Dec 2022 20:05:21 +0100
Message-Id: <20221204190553.3274-1-shentey@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62b.google.com
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
The series is structured as follows: First, PIIX3 is changed to instantiate=
=0D
internal devices itself, like PIIX4 does already. Second, PIIX3 gets prepar=
ed=0D
for the merge with PIIX4 which includes some fixes, cleanups, and renamings=
.=0D
Third, the same is done for PIIX4. In step four the implementations are mer=
ged.=0D
Since some consolidations could be done easier with merged implementations,=
 the=0D
consolidation continues in step five which concludes the series.=0D
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
A challenge still remains with consolidating PCI interrupt handling. There =
are=0D
still board-specific piix3_pci_slot_get_pirq() and piix4_pci_slot_get_pirq(=
)=0D
which are implemented in isa/piix.c. Any advice how to resolve these would =
be=0D
highly appreaciated. See [2] for details.=0D
=0D
Last but not least there might be some opportunity to consolidate VM state=
=0D
handling, probably by reusing the one from PIIX3. Since I'm not very famili=
ar=0D
with the requirements I didn't touch it so far.=0D
=0D
Testing done:=0D
* make check=0D
* make check-avocado=0D
* Boot live CD:=0D
  * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde=
-21.3.2-220704-linux515.iso`=0D
  * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kd=
e-21.3.2-220704-linux515.iso`=0D
* 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda deb=
ian_wheezy_mipsel_standard.qcow2 -append "root=3D/dev/sda1 console=3DttyS0"=
`=0D
=0D
v3:=0D
- Introduce one TYPE_ICH9_USB_UHCI(fn) rather than several TYPE_ICH9_USB_UH=
CIx (Philippe)=0D
- Make proxy PIC generic (Philippe)=0D
- Track Malta's PIIX dependencies through KConfig=0D
- Rebase onto Philippe's 'hw/isa/piix4: Remove MIPS Malta specific bits' se=
ries [3]=0D
- Also rebase onto latest master to resolve merge conflicts. This required =
copying=0D
  Philippe's series as first three patches - please ignore.=0D
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
Bernhard Beschow (29):=0D
  hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig=0D
  hw/i386/pc_piix: Allow for setting properties before realizing PIIX3=0D
    south bridge=0D
  hw/usb/hcd-uhci: Introduce TYPE_ defines for device models=0D
  hw/i386/pc: Create RTC controllers in south bridges=0D
  hw/i386/pc: No need for rtc_state to be an out-parameter=0D
  hw/isa/piix3: Create USB controller in host device=0D
  hw/isa/piix3: Create power management controller in host device=0D
  hw/core: Introduce proxy-pic=0D
  hw/isa/piix3: Create Proxy PIC in host device=0D
  hw/isa/piix3: Create IDE controller in host device=0D
  hw/isa/piix3: Wire up ACPI interrupt internally=0D
  hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS=0D
  hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4=0D
  hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4=0D
  hw/isa/piix3: Prefix pci_slot_get_pirq() with "piix3_"=0D
  hw/isa/piix3: Rename typedef PIIX3State to PIIXState=0D
  hw/isa/piix4: Make PIIX4's ACPI and USB functions optional=0D
  hw/isa/piix4: Remove unused code=0D
  hw/isa/piix4: Use Proxy PIC device=0D
  hw/isa/piix4: Reuse struct PIIXState from PIIX3=0D
  hw/isa/piix4: Rename reset control operations to match PIIX3=0D
  hw/isa/piix4: Prefix pci_slot_get_pirq() with "piix4_"=0D
  hw/isa/piix3: Merge hw/isa/piix4.c=0D
  hw/isa/piix: Harmonize names of reset control memory regions=0D
  hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4=0D
  hw/isa/piix: Rename functions to be shared for interrupt triggering=0D
  hw/isa/piix: Consolidate IRQ triggering=0D
  hw/isa/piix: Share PIIX3 base class with PIIX4=0D
  hw/isa/piix: Drop the "3" from the PIIX base class=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  hw/mips/malta: Introduce PIIX4_PCI_DEVFN definition=0D
  hw/mips/malta: Set PIIX4 IRQ routes in embedded bootloader=0D
  hw/isa/piix4: Correct IRQRC[A:D] reset values=0D
=0D
 MAINTAINERS                             |   8 +-=0D
 configs/devices/mips-softmmu/common.mak |   2 -=0D
 hw/core/Kconfig                         |   3 +=0D
 hw/core/meson.build                     |   1 +=0D
 hw/core/proxy-pic.c                     |  70 +++++=0D
 hw/i386/Kconfig                         |   4 +-=0D
 hw/i386/pc.c                            |  16 +-=0D
 hw/i386/pc_piix.c                       |  71 ++---=0D
 hw/i386/pc_q35.c                        |  16 +-=0D
 hw/isa/Kconfig                          |  10 +-=0D
 hw/isa/lpc_ich9.c                       |   8 +=0D
 hw/isa/meson.build                      |   3 +-=0D
 hw/isa/{piix3.c =3D> piix.c}              | 302 +++++++++++++++++-----=0D
 hw/isa/piix4.c                          | 327 ------------------------=0D
 hw/mips/Kconfig                         |   2 +=0D
 hw/mips/malta.c                         |  38 ++-=0D
 hw/usb/hcd-uhci.c                       |  16 +-=0D
 hw/usb/hcd-uhci.h                       |   4 +=0D
 include/hw/core/proxy-pic.h             |  54 ++++=0D
 include/hw/i386/ich9.h                  |   2 +=0D
 include/hw/i386/pc.h                    |   2 +-=0D
 include/hw/southbridge/piix.h           |  30 ++-=0D
 22 files changed, 520 insertions(+), 469 deletions(-)=0D
 create mode 100644 hw/core/proxy-pic.c=0D
 rename hw/isa/{piix3.c =3D> piix.c} (56%)=0D
 delete mode 100644 hw/isa/piix4.c=0D
 create mode 100644 include/hw/core/proxy-pic.h=0D
=0D
-- =0D
2.38.1=0D
=0D

