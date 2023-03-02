Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B301E6A8B32
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 22:26:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXqNW-0000iX-L5; Thu, 02 Mar 2023 16:22:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNS-0000h4-T0
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:14 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pXqNQ-0002NS-MP
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 16:22:14 -0500
Received: by mail-ed1-x532.google.com with SMTP id x3so2374361edb.10
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 13:22:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1677792130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qNwYBysOtwMVYQvusQLUhfswdDeFzbPF16O+epoD8yY=;
 b=LIMVietvnmNshQF5Gqbr3FFjW0DH90RZ+fdqk9pbEB+TSuZnIiLHDygUo0fLHUgaxp
 8Ui4TbBfOP5+eGAtbw43o6N8ral5zouTZQA94b+Ua2zpvWuMUemHKCtzqQeT5HEOk4Qk
 b5e1dic0SW2pmPwdjOAyuk1RgiHJXJ4BUFMq6DGv05l0NDV1aCHaLK67swHwZ4/Xly5Q
 /hDW8D6d4p/1nIKw+ps0ajUL3qUguRSdzLjq1EBkskWAuU9LoUOl4wwWlTsGmFG4DZ8b
 cAliPs4yzYRK5WgKvkT9ar1j4dvS1IBFGWb7B54o9Zw8Ff6THrAIxvxlhrz6VKcGrBeL
 r8xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677792130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qNwYBysOtwMVYQvusQLUhfswdDeFzbPF16O+epoD8yY=;
 b=pV4A/EAS/eSYyDUvdtk/J0ajh2W0F9pFJk0TBP1h3vTHjnMqk7a83b3KVQB5LwqYCH
 yuH4gKq6DMfR89fr+d3H1X523W7E8MgAyqpKNuO9R7LtKX9yoBnAsqn7xAEzhvIffTNw
 JwvNcbP6XrRBOVnuFJl2h1u+TedtH9eeiXz+db5Eh2L/nlEP6B5JYOQHQa+vjsWPtCOt
 Nu+JCescRSdPZ7aAk5/TSkEdpJDGUm+b4l72sKZHeypws75o0kPdx5hsGUUmAxBmRzXp
 dmmHit0oJ85nK1hmMP/tFKBn2sb8wLl+SDV3erm7Ym8G6+3xMZ/L0V3e2hq1TJXfopiP
 eDzw==
X-Gm-Message-State: AO0yUKUsLnnenCvv0uzJ3Y7FOb9foeuA0a0PK94SFEwp2KCRUNPBL9TY
 dnyHGOVTtbL7vc5t++5iqVBjyyVFmvA=
X-Google-Smtp-Source: AK7set/JdH5f6H77oMPG1wvCd5uAP6IEtqhazHd2uFKE7/gbPUgbpRcHmGa2MCwnOiS97NGrL5oM1g==
X-Received: by 2002:a17:906:c28a:b0:8b1:3008:b4f3 with SMTP id
 r10-20020a170906c28a00b008b13008b4f3mr11672088ejz.52.1677792130212; 
 Thu, 02 Mar 2023 13:22:10 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-092-224-150-004.92.224.pool.telefonica.de. [92.224.150.4])
 by smtp.gmail.com with ESMTPSA id
 s4-20020a1709062ec400b008f89953b761sm145895eji.3.2023.03.02.13.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 13:22:09 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v8 00/23] Consolidate PIIX south bridges
Date: Thu,  2 Mar 2023 22:21:38 +0100
Message-Id: <20230302212201.224360-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=shentey@gmail.com; helo=mail-ed1-x532.google.com
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
Move sub devices into the PIIX3 south bridge, like PIIX4 does already:=0D
* hw/i386/pc: Create RTC controllers in south bridges=0D
* hw/i386/pc: No need for rtc_state to be an out-parameter=0D
* hw/i386/pc_piix: Allow for setting properties before realizing PIIX3 sout=
h bridge=0D
* hw/isa/piix3: Create USB controller in host device=0D
* hw/isa/piix3: Create power management controller in host device=0D
* hw/isa/piix3: Move ISA bus IRQ assignments into host device=0D
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
* hw/isa/piix4: Reuse struct PIIXState from PIIX3=0D
* hw/isa/piix4: Create the "intr" property during init() already=0D
* hw/isa/piix4: Rename reset control operations to match PIIX3=0D
=0D
This patch achieves the main goal of the series:=0D
* hw/isa/piix3: Merge hw/isa/piix4.c=0D
=0D
Perform some further consolidations which were easier to do after the merge=
:=0D
* hw/isa/piix: Harmonize names of reset control memory regions=0D
* hw/isa/piix: Rename functions to be shared for interrupt triggering=0D
* hw/isa/piix: Consolidate IRQ triggering=0D
* hw/isa/piix: Share PIIX3's base class with PIIX4=0D
* hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4=0D
=0D
One challenge was dealing with optional devices where Peter already gave ad=
vice=0D
in [1] which this series implements.=0D
=0D
There are still some differences in the device models:=0D
- PIIX4 instantiates its own PIC and PIT while PIIX3 doesn't=0D
- PIIX4 wires up the RTC IRQ itself while PIIX3 doesn't=0D
- Different binary layout in VM state=0D
=0D
v8:=0D
- Rebase onto master=0D
- Remove Reviewed-by tag from 'hw/isa/piix: Reuse PIIX3 base class' realize=
=0D
  method in PIIX4' since it changed considerably in v7.=0D
=0D
Testing done (both on top of series as well as on 'hw/isa/piix3: Drop the "=
3"=0D
from PIIX base class'):=0D
* `make check`=0D
* `make check-avocado`=0D
* Boot live CD:=0D
  * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom=0D
manjaro-kde-21.3.2-220704-linux515.iso`=0D
  * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom=0D
manjaro-kde-21.3.2-220704-linux515.iso`=0D
* 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda=0D
debian_wheezy_mipsel_standard.qcow2 -append "root=3D/dev/sda1 console=3Dtty=
S0"`=0D
=0D
v7:=0D
- Rebase onto master=0D
- Avoid the PIC proxy (Phil)=0D
  The motivation for the PIC proxy was to allow for wiring up ISA interrupt=
s in=0D
  the south bridges. ISA interrupt wiring requires the GPIO lines to be=0D
  populated already but pc_piix assigned the interrupts only after realizin=
g=0D
  PIIX3. By shifting interrupt assignment before realizing, the ISA interru=
pts=0D
  are already populated during PIIX3's realize phase where the ISA interrup=
ts=0D
  are wired up.=0D
- New patches:=0D
  * hw/isa/piix4: Reuse struct PIIXState from PIIX3=0D
  * hw/isa/piix4: Create the "intr" property during init() already=0D
- Patches with substantial changes (Reviewed-by dropped):=0D
  * hw/isa/piix3: Move ISA bus IRQ assignments into host device=0D
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
Bernhard Beschow (23):=0D
  hw/i386/pc: Create RTC controllers in south bridges=0D
  hw/i386/pc: No need for rtc_state to be an out-parameter=0D
  hw/i386/pc_piix: Allow for setting properties before realizing PIIX3=0D
    south bridge=0D
  hw/isa/piix3: Create USB controller in host device=0D
  hw/isa/piix3: Create power management controller in host device=0D
  hw/isa/piix3: Move ISA bus IRQ assignments into host device=0D
  hw/isa/piix3: Create IDE controller in host device=0D
  hw/isa/piix3: Wire up ACPI interrupt internally=0D
  hw/isa/piix3: Resolve redundant PIIX_NUM_PIC_IRQS=0D
  hw/isa/piix3: Rename pci_piix3_props for sharing with PIIX4=0D
  hw/isa/piix3: Rename piix3_reset() for sharing with PIIX4=0D
  hw/isa/piix3: Drop the "3" from PIIX base class=0D
  hw/isa/piix4: Make PIIX4's ACPI and USB functions optional=0D
  hw/isa/piix4: Remove unused inbound ISA interrupt lines=0D
  hw/isa/piix4: Reuse struct PIIXState from PIIX3=0D
  hw/isa/piix4: Create the "intr" property during init() already=0D
  hw/isa/piix4: Rename reset control operations to match PIIX3=0D
  hw/isa/piix3: Merge hw/isa/piix4.c=0D
  hw/isa/piix: Harmonize names of reset control memory regions=0D
  hw/isa/piix: Rename functions to be shared for interrupt triggering=0D
  hw/isa/piix: Consolidate IRQ triggering=0D
  hw/isa/piix: Share PIIX3's base class with PIIX4=0D
  hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4=0D
=0D
 MAINTAINERS                   |   6 +-=0D
 include/hw/i386/pc.h          |   2 +-=0D
 include/hw/southbridge/ich9.h |   2 +=0D
 include/hw/southbridge/piix.h |  28 +++-=0D
 hw/i386/pc.c                  |  16 +-=0D
 hw/i386/pc_piix.c             |  67 ++++----=0D
 hw/i386/pc_q35.c              |   4 +-=0D
 hw/isa/lpc_ich9.c             |   8 +=0D
 hw/isa/{piix3.c =3D> piix.c}    | 306 ++++++++++++++++++++++++++--------=0D
 hw/isa/piix4.c                | 302 ---------------------------------=0D
 hw/mips/malta.c               |   6 +-=0D
 hw/i386/Kconfig               |   3 +-=0D
 hw/isa/Kconfig                |   8 +-=0D
 hw/isa/meson.build            |   3 +-=0D
 hw/mips/Kconfig               |   2 +-=0D
 15 files changed, 334 insertions(+), 429 deletions(-)=0D
 rename hw/isa/{piix3.c =3D> piix.c} (55%)=0D
 delete mode 100644 hw/isa/piix4.c=0D
=0D
-- =0D
2.39.2=0D
=0D

