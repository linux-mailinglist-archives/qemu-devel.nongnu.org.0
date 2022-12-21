Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE83965347F
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 18:02:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p82Sz-0002n3-QB; Wed, 21 Dec 2022 12:01:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82SX-0002k6-QI; Wed, 21 Dec 2022 12:00:49 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1p82SV-0008BF-KW; Wed, 21 Dec 2022 12:00:49 -0500
Received: by mail-ed1-x52d.google.com with SMTP id a16so22853303edb.9;
 Wed, 21 Dec 2022 09:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6WUMEgs7N2rxpEmzlV02CCOreJPemtRaeayme9ASRZo=;
 b=UHkzE6mEtJjNLGJoIpwBFrv2JtHQt7IO6WGLQVpDErryKN681i6EkhiGegkd6KmM6p
 VfCRa5hnah6+nwCb+zUOxNDmoe8pV+GBBaLbCn92FDk/dXwXA6X/PXzxHVTV+3fYHH/a
 4mSq/1oNTrG9GaeJlIXePFNDoa3Cq7oi/SY8iH3xnfcKqS6DLYTGGAgbEWGhWfSrwGPk
 RhviSLt8fm8oZ7gDAzuryUXkPT0r5EEhc/fmaMWdK0ZMNEvlYesd31B4WTKUb3GQix19
 Aa59zUuRns2umPPmE25f+FqUQefPe13fvKAoe0+ZhEquU4jEOX8Gv+mC1heQ46WvD+z3
 QtbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6WUMEgs7N2rxpEmzlV02CCOreJPemtRaeayme9ASRZo=;
 b=vwSX9zo4AWhFfo0T9ndD6mHZyWbZDhBOtdKcVeX+x5jTsTOdKv87J+yeY4qDf6Q48f
 kbzPX3HDFHOhukxctEm0Fi4fqZMP2gO6CrmGLDxr7P2xjnwqx57Q+5zq92oCp6P2IGSM
 lXoNYaXtqdJnemdFJzZUjQa7i4mXLdnI3sZtPKQyKVRsUrc7WRpDicOE0UwExVhKOGK5
 gLyVgRtSfCG+yQruwjQSKON/Jyx0JaVEC5CdEuoWTnI9wAxb37bmP/0oEYfn4+Qt8JPE
 69bZ4+UsSP/MTF8KbGJsmSBDAq9hXPQVLu0/PDDe/Hk6ZM21GwjrozxPFeLysHoqjB/Z
 zwZg==
X-Gm-Message-State: AFqh2ko23t8Mpl3nM1s32oNlmwOwDiUKJ7okxhZyUh/o8xnWWlCSCZ9a
 1LoKsEk54CKNPwHVs8QToFVG4IGJ2do=
X-Google-Smtp-Source: AMrXdXsC4HoQ61hTBP643LN9fUjRtExUpnXiDl1GfPSclggm+o1nzFXXcoZNEn3hkN1CU7gyqAo9gA==
X-Received: by 2002:a05:6402:31e4:b0:46f:fb60:8bd6 with SMTP id
 dy4-20020a05640231e400b0046ffb608bd6mr2044358edb.24.1671642045175; 
 Wed, 21 Dec 2022 09:00:45 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-092-224-051-061.92.224.pool.telefonica.de. [92.224.51.61])
 by smtp.gmail.com with ESMTPSA id
 n14-20020aa7db4e000000b0047466e46662sm7204019edt.39.2022.12.21.09.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Dec 2022 09:00:44 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 00/30] This series consolidates the implementations of the
 PIIX3 and PIIX4 south
Date: Wed, 21 Dec 2022 17:59:33 +0100
Message-Id: <20221221170003.2929-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x52d.google.com
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
Last but not least there might be some opportunity to consolidate VM state=
=0D
handling, probably by reusing the one from PIIX3. Since I'm not very famili=
ar=0D
with the requirements I didn't touch it so far.=0D
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
Based-on: <20221120150550.63059-1-shentey@gmail.com>=0D
          "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges"=
=0D
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
Bernhard Beschow (27):=0D
  hw/mips/Kconfig: Track Malta's PIIX dependencies via Kconfig=0D
  hw/usb/hcd-uhci: Introduce TYPE_ defines for device models=0D
  hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PCI bus is=0D
    created=0D
  hw/i386/pc_piix: Allow for setting properties before realizing PIIX3=0D
    south bridge=0D
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
  hw/isa/piix3: Drop the "3" from PIIX base class=0D
  hw/isa/piix4: Make PIIX4's ACPI and USB functions optional=0D
  hw/isa/piix4: Remove unused inbound ISA interrupt lines=0D
  hw/isa/piix4: Use Proxy PIC device=0D
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
 MAINTAINERS                             |   8 +-=0D
 configs/devices/mips-softmmu/common.mak |   2 -=0D
 hw/core/Kconfig                         |   3 +=0D
 hw/core/meson.build                     |   1 +=0D
 hw/core/proxy-pic.c                     |  70 ++++++=0D
 hw/i386/Kconfig                         |   4 +-=0D
 hw/i386/pc.c                            |  16 +-=0D
 hw/i386/pc_piix.c                       |  77 +++---=0D
 hw/i386/pc_q35.c                        |  16 +-=0D
 hw/isa/Kconfig                          |  10 +-=0D
 hw/isa/lpc_ich9.c                       |   8 +=0D
 hw/isa/meson.build                      |   3 +-=0D
 hw/isa/{piix3.c =3D> piix.c}              | 274 ++++++++++++++++-----=0D
 hw/isa/piix4.c                          | 302 ------------------------=0D
 hw/mips/Kconfig                         |   2 +=0D
 hw/mips/malta.c                         |  38 ++-=0D
 hw/usb/hcd-uhci.c                       |  16 +-=0D
 hw/usb/hcd-uhci.h                       |   4 +=0D
 include/hw/core/proxy-pic.h             |  54 +++++=0D
 include/hw/i386/ich9.h                  |   2 +=0D
 include/hw/i386/pc.h                    |   2 +-=0D
 include/hw/southbridge/piix.h           |  30 ++-=0D
 22 files changed, 496 insertions(+), 446 deletions(-)=0D
 create mode 100644 hw/core/proxy-pic.c=0D
 rename hw/isa/{piix3.c =3D> piix.c} (57%)=0D
 delete mode 100644 hw/isa/piix4.c=0D
 create mode 100644 include/hw/core/proxy-pic.h=0D
=0D
-- =0D
2.39.0=0D
=0D

