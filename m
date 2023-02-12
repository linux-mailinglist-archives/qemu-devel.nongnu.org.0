Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1621269374D
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 13:40:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRBdM-0007b9-Sm; Sun, 12 Feb 2023 07:39:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBcx-0007Z3-LW; Sun, 12 Feb 2023 07:38:43 -0500
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pRBcu-0001IL-D6; Sun, 12 Feb 2023 07:38:43 -0500
Received: by mail-ej1-x634.google.com with SMTP id rp23so25842752ejb.7;
 Sun, 12 Feb 2023 04:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ltcxifq61V4rDMel4CBHsMiq2/OUsO7+K0soBC8TVN0=;
 b=KJIm/2i/WgflfeDbvGJfuBn4toj0pPgExD8g8wjWkY86F2VhEPYHWfCHX599NQFnlh
 XN8NyKeKn2UxltziChyHhGjCEgSdnaxTnjR+SnfsK/r9EUTlrw2OJcVb1Mv+rAEtjp7a
 Q+o0YwCU0XIX7vah+UJa0K0AsSP7vIRi7cEw1ggesMXdRC8XUYuwmirNjTAf7RTiS/TN
 5VYSpS9D1XVMJnGl+Yjo9JQgkT8IyeQO7YEdta2UUDB+x2rKf5R0c+apjeyPaM/MS+Lk
 DOe2aLK6Uj9IExYvMxVRRRC2fhWt6tv+Uyriu6LZj0zeNyr1GC1PdoBEcZpd0E5zwpsw
 LKuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ltcxifq61V4rDMel4CBHsMiq2/OUsO7+K0soBC8TVN0=;
 b=vE9+AqPfQ1RBbjAQCuxjez+ntmELPinIbPgKb+tGTwMUyfxnKN486OkVzhpFS7rVyH
 QifCrbU91xFLivbI2fdU4BaKrh1HhdLWggju1wLcQyZBQZaRikRjgh4KJCCotKH4qVC2
 005ic5gKROWWdrK0lcrJziXUEh8IbTkYKIz70ExyJdT1zi5A6kQi0tsbBAQZHgWktrIT
 Ik39edEH94DgyDsCtGE72tNkQDLnO2FOePHjUPYlEvKkXmxs7ghEiWjdozEN3Zl5kMaH
 BxrewbsHZiavBG1S6+l+PEjrY+MLChUHzy3oIKw0/PJIl2CRhXenQM4u8Ew6/L+bUl1z
 PHqA==
X-Gm-Message-State: AO0yUKU5qO31EctipxljQPAr6N5sDaPhC/iFR/pS4khoTRzneQifi6gf
 f/2X7Mo49S0f+tdLT4czspLWJyqVH1k=
X-Google-Smtp-Source: AK7set83exuNgP5ptDTO/++1m2/rnDJrTdm7v6XCAxFiwdfjQVp+3jP1GgblpdepviRu5oUKsqfa6g==
X-Received: by 2002:a17:906:c401:b0:88d:ba89:1837 with SMTP id
 u1-20020a170906c40100b0088dba891837mr16759280ejz.8.1676205516618; 
 Sun, 12 Feb 2023 04:38:36 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-011-172-153.77.11.pool.telefonica.de. [77.11.172.153])
 by smtp.gmail.com with ESMTPSA id
 qw14-20020a170906fcae00b008af1f1bee79sm5233164ejb.9.2023.02.12.04.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 04:38:36 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 qemu-arm@nongnu.org, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 John Snow <jsnow@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Jagannathan Raman <jag.raman@oracle.com>, qemu-ppc@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v7 00/23] Consolidate PIIX south bridges
Date: Sun, 12 Feb 2023 13:37:42 +0100
Message-Id: <20230212123805.30799-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x634.google.com
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
* hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4=0D
* hw/isa/piix: Rename functions to be shared for interrupt triggering=0D
* hw/isa/piix: Consolidate IRQ triggering=0D
* hw/isa/piix: Share PIIX3's base class with PIIX4=0D
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
Testing done:=0D
* `make check`=0D
* Boot live CD:=0D
  * `qemu-system-x86_64 -M pc -m 2G -accel kvm -cpu host -cdrom manjaro-kde=
-21.3.2-220704-linux515.iso`=0D
  * `qemu-system-x86_64 -M q35 -m 2G -accel kvm -cpu host -cdrom manjaro-kd=
e-21.3.2-220704-linux515.iso`=0D
* 'qemu-system-mips64el -M malta -kernel vmlinux-3.2.0-4-5kc-malta -hda deb=
ian_wheezy_mipsel_standard.qcow2 -append "root=3D/dev/sda1 console=3DttyS0"=
`=0D
* Run HVM domU guest under Xen with manjaro-kde-21.3.2-220704-linux515.iso =
image=0D
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
  hw/isa/piix: Reuse PIIX3 base class' realize method in PIIX4=0D
  hw/isa/piix: Rename functions to be shared for interrupt triggering=0D
  hw/isa/piix: Consolidate IRQ triggering=0D
  hw/isa/piix: Share PIIX3's base class with PIIX4=0D
=0D
 MAINTAINERS                   |   6 +-=0D
 include/hw/i386/ich9.h        |   2 +=0D
 include/hw/i386/pc.h          |   2 +-=0D
 include/hw/southbridge/piix.h |  28 +++-=0D
 hw/i386/pc.c                  |  16 +-=0D
 hw/i386/pc_piix.c             |  67 ++++----=0D
 hw/i386/pc_q35.c              |   3 +-=0D
 hw/isa/lpc_ich9.c             |   8 +=0D
 hw/isa/{piix3.c =3D> piix.c}    | 306 ++++++++++++++++++++++++++--------=0D
 hw/isa/piix4.c                | 302 ---------------------------------=0D
 hw/mips/malta.c               |   6 +-=0D
 hw/i386/Kconfig               |   3 +-=0D
 hw/isa/Kconfig                |   8 +-=0D
 hw/isa/meson.build            |   3 +-=0D
 hw/mips/Kconfig               |   2 +-=0D
 15 files changed, 333 insertions(+), 429 deletions(-)=0D
 rename hw/isa/{piix3.c =3D> piix.c} (55%)=0D
 delete mode 100644 hw/isa/piix4.c=0D
=0D
-- =0D
2.39.1=0D
=0D

