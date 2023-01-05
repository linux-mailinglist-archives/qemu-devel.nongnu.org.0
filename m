Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E31F265EEE2
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:38:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDRJF-0002p9-LO; Thu, 05 Jan 2023 09:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRIu-0002jt-LX; Thu, 05 Jan 2023 09:33:26 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pDRIr-0006t9-94; Thu, 05 Jan 2023 09:33:12 -0500
Received: by mail-wm1-x334.google.com with SMTP id o15so28151672wmr.4;
 Thu, 05 Jan 2023 06:33:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Vc78+cBIBMfx77CoTkCVuZaBTMexkjj2jUlbYFxTe0A=;
 b=pp8D4OKjIzUOouB1sXVCaVZctOp+1TZUYsRyv2eO7OPQBUeMU+2RFWGMHJoSsb9ouU
 lFKb3+EABoXc6CoXwt+euZG0xWx7jVUCPn+UyZxvL23jOtG4oiGLLhkaVWNMsZTzabi3
 /+vzqw2vxu1nC/taVdv4TPmjQRAKcg57edSJRUzJw7bzR7u0miPG6xNJLn5hOF+zCfNp
 eSVzrtiFLYymNUJ220ASkiUB1sclfHnWFki1b6luHdbLilfLH5kz8LSlNLyzSvrxjFjy
 AIj5nEs0WWlrVhoPNTeLm+WXksU1DF8wVfPWEGQoBS0SJRSm0EgtgsgSkTnPi+diEd8x
 xpfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vc78+cBIBMfx77CoTkCVuZaBTMexkjj2jUlbYFxTe0A=;
 b=OHCqLqUgSnQhuUCKlyG0OgP1n7hf5eaBH9mHVNk0Q1/65xaYYSDZ5OvTE3tnxXWYSt
 yltSE6lTLZYGXe2WKhtAXpGO2CEgZwQ73yan4p8msQXFM361okjAVAyv33lj+c5S6iw8
 y6bUauH5mUFg/ubpUJGpnVPJSh7Cqhts2OJC0lZ4xfmZeGFfeQ97CSlseXC5OCEBNfNa
 XiP2uY0wmB5JCB4A/yUdWRl4Xr+LWNYBMg42NaJ3u5i6sWime562KPIlyIFeBVwWX7ys
 XfWgUHFgeRVSjaxH1/5Ms2iXd8tb6iz2W149m5rF1OkJO/MxAcijf03XyBSx4mTc0t47
 g+og==
X-Gm-Message-State: AFqh2kpjvIt4ui+KsK54wycwOegX4fgH1XdHk4Dx9yoWeaHzsrHnsjzS
 caZDxFytRGOEuOOjPkzreiGXkmDZYJjraQ==
X-Google-Smtp-Source: AMrXdXtAUd5d/TFEx0cJYur7PfDjWWZWYA9o3Xrj2xHgEJXq3Ta1r2oNncB6tWlhwAEbYtWk2Rt25g==
X-Received: by 2002:a05:600c:3ac8:b0:3d3:4ae6:a71b with SMTP id
 d8-20020a05600c3ac800b003d34ae6a71bmr37258057wms.2.1672929186454; 
 Thu, 05 Jan 2023 06:33:06 -0800 (PST)
Received: from osoxes.fritz.box
 (p200300faaf0bb2009c4947838afc41b6.dip0.t-ipconnect.de.
 [2003:fa:af0b:b200:9c49:4783:8afc:41b6])
 by smtp.gmail.com with ESMTPSA id
 bt15-20020a056000080f00b00297dcfdc90fsm12260447wrb.24.2023.01.05.06.33.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 06:33:06 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-block@nongnu.org,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 John Snow <jsnow@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v5 00/31] Consolidate PIIX south bridges
Date: Thu,  5 Jan 2023 15:31:57 +0100
Message-Id: <20230105143228.244965-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x334.google.com
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
consolidation continues in step five which concludes the series. Note that =
the=0D
first three patches are only included to avoid merge conflicts with mips-ne=
xt=0D
-- please ignore.=0D
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
v5:=0D
- Pick up Reviewed-by tags from https://lists.nongnu.org/archive/html/qemu-=
devel/2023-01/msg00116.html=0D
- Add patch to make usage of the isa_pic global more type-safe=0D
- Re-introduce isa-pic as PIC specific proxy (Mark)=0D
Note that both patches are unreviewed -> Mark?=0D
=0D
Furthermore, patch 'hw/i386/pc_piix: Associate pci_map_irq_fn as soon as PC=
I bus=0D
is created' needs review and could be merged into=0D
https://lists.nongnu.org/archive/html/qemu-devel/2022-11/msg03312.html .=0D
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
Based-on: <20221120150550.63059-1-shentey@gmail.com>=0D
          "[PATCH v2 0/3] Decouple INTx-to-LNKx routing from south bridges"=
=0D
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
Bernhard Beschow (28):=0D
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
  hw/intc/i8259: Make using the isa_pic singleton more type-safe=0D
  hw/intc/i8259: Introduce i8259 proxy "isa-pic"=0D
  hw/isa/piix3: Create ISA PIC in host device=0D
  hw/isa/piix3: Create IDE controller in host device=0D
  hw/isa/piix3: Wire up ACPI interrupt internally=0D
  hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS=0D
  hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4=0D
  hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4=0D
  hw/isa/piix3: Drop the "3" from PIIX base class=0D
  hw/isa/piix4: Make PIIX4's ACPI and USB functions optional=0D
  hw/isa/piix4: Remove unused inbound ISA interrupt lines=0D
  hw/isa/piix4: Use ISA PIC device=0D
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
 include/hw/intc/i8259.h                 |  25 +-=0D
 include/hw/southbridge/piix.h           |  30 ++-=0D
 include/qemu/typedefs.h                 |   1 +=0D
 hw/i386/pc.c                            |  16 +-=0D
 hw/i386/pc_piix.c                       |  77 +++---=0D
 hw/i386/pc_q35.c                        |  16 +-=0D
 hw/intc/i8259.c                         |  38 ++-=0D
 hw/isa/lpc_ich9.c                       |   8 +=0D
 hw/isa/{piix3.c =3D> piix.c}              | 274 ++++++++++++++++-----=0D
 hw/isa/piix4.c                          | 302 ------------------------=0D
 hw/mips/malta.c                         |  38 ++-=0D
 hw/usb/hcd-uhci.c                       |  16 +-=0D
 MAINTAINERS                             |   6 +-=0D
 hw/i386/Kconfig                         |   4 +-=0D
 hw/isa/Kconfig                          |   8 +-=0D
 hw/isa/meson.build                      |   3 +-=0D
 hw/mips/Kconfig                         |   2 +=0D
 21 files changed, 419 insertions(+), 455 deletions(-)=0D
 rename hw/isa/{piix3.c =3D> piix.c} (57%)=0D
 delete mode 100644 hw/isa/piix4.c=0D
=0D
-- =0D
2.39.0=0D
=0D

