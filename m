Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C92A26EB9E7
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 17:11:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqEq5-0001uq-UE; Sat, 22 Apr 2023 11:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEq0-0001oo-Gz; Sat, 22 Apr 2023 11:07:44 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pqEpv-00058s-0g; Sat, 22 Apr 2023 11:07:44 -0400
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-94f3cd32799so485125366b.0; 
 Sat, 22 Apr 2023 08:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682176055; x=1684768055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WlA15ayo3r3fbHLf5MCSjbAV34CSEzPd/ms7AQxrE+c=;
 b=M5K58iXw8FOysu7XqnEqIAnBRQGZrQr+dQB9YW3YSMq7TAFyzA//isSIv6Ws8Tlw0r
 W5Z4FPNDW7e0J34X3MkNiT1e33pK3n1/t7/RIIUCgBaOQTijPMElL1YedO562axvUTSj
 kk+eeUqydHLJfVn/jJ1G+UU1kjwTuS49nB3ybxhx6aLcRNf9K5fRcu8BsPo2c7MP0KkH
 dOMHx3Yj+AbLpzq/PQDVlCeE1GHc7l0g2WP5VkDVHLQcXV9N4CgGMV5lwDISsr62IHHy
 VD02OBMKNvhcWhNHHiDCdL1gaJF5CyKfDAhATrKBuyGepQpWGqOwYk6joPyK8c7az4AK
 kG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682176055; x=1684768055;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WlA15ayo3r3fbHLf5MCSjbAV34CSEzPd/ms7AQxrE+c=;
 b=PHyapSkyiuaIk8fpI3W09aV/F8ACl/exocb89SmSdgf2JLE713ZDxstin4msCy1626
 aqaKL1cP7MaDOXgU2WRuKRJvlWTMq83FdObQEHmPgFplWYyODUlnfxT3201R6wQVMvUj
 GeHDwNUpAFJDyaXkWegvtA0jDrUWFzDU9AEzl3H9cBFrWiZVRXb6DrWpAt1mGhO86AqE
 lxFrCh2oL+CRGpTVRRWJyl2lzl3tS7CeRJCaRXbM5IX+v85XihBmlPmhv6DrDgPOoTSJ
 a+UCy0fCsKNgixI9gIIToy23568YWIfrMGq3FxBWcQof2LwoZbDwbnoWSw+I44jsfrsZ
 rtGA==
X-Gm-Message-State: AAQBX9dYpcffBDYusZo7VK6Mwa0ykBbiFXUtz3P4NNcYIkoE+QPazRoU
 Nz4rTMKx3SaBFnRY+Qs1ePdv79zggrM=
X-Google-Smtp-Source: AKy350a4coTNKSmHHNImijHgPNyOergR8kjkd0cl605uTCjli7urgwMzLI7hOmiNWU7D0Abby5i8oA==
X-Received: by 2002:a17:906:2e9b:b0:94f:a309:67b7 with SMTP id
 o27-20020a1709062e9b00b0094fa30967b7mr5588473eji.56.1682176055341; 
 Sat, 22 Apr 2023 08:07:35 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-077-191-017-015.77.191.pool.telefonica.de. [77.191.17.15])
 by smtp.gmail.com with ESMTPSA id
 e7-20020a170906844700b0094f7b713e40sm3300108ejy.126.2023.04.22.08.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 08:07:34 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 BALATON Zoltan <balaton@eik.bme.hu>, John Snow <jsnow@redhat.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-ppc@nongnu.org, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 00/13] Clean up PCI IDE device models
Date: Sat, 22 Apr 2023 17:07:15 +0200
Message-Id: <20230422150728.176512-1-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

This series is yet another attempt to clean up the PCI IDE models. It is ma=
inly=0D
inspired the Mark's invaluable input from previous discussions. In particul=
ar,=0D
this series attempts to follow the "PCI IDE controller specification" close=
r. As=0D
a side effect, it also resolves usage of the isabus global in PIIX. Last bu=
t not=0D
least it fixes the VIA IDE controller to not depend on its south bridge whi=
ch=0D
fixes a circular dependency.=0D
=0D
The series is structured as follows: The first three commits resolve a circ=
ular=0D
dependency between the VIA IDE controller and its south bridge, thereby=0D
implementing legacy PCI IDE interrupt routing which was missing so far. The=
 next=0D
five patches factor out common code into the PCI IDE base class. The next t=
wo=0D
patches resolve usage of the isabus global in PIIX by reusing now common co=
de=0D
from the base class. The same is then done for the SIL3112 controller. Fina=
lly,=0D
a small convenience function is introduced which should hide some implement=
ation=0D
details in the PCI IDE base class.=0D
=0D
Testing done:=0D
* `make check`=0D
* `make check-avocado`=0D
* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device \=0D
   ati-vga,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3.17.iso=0D
   -kernel morphos-3.17/boot.img`=0D
   The machine booted successfully and a startup sound was hearable=0D
* `qemu-system-ppc -machine pegasos2 -rtc base=3Dlocaltime -device \=0D
   ati-vga,guest_hwcursor=3Dtrue,romfile=3D"" -cdrom morphos-3.17.iso=0D
   -kernel morphos-3.17/boot.img`=0D
   The machine booted successfully and applications could be started.=0D
* qemu-system-x86_64 was used for hours during work=0D
=0D
Bernhard Beschow (13):=0D
  hw/ide/pci: Expose legacy interrupts as GPIOs=0D
  hw/ide/via: Implement ISA IRQ routing=0D
  hw/isa/vt82c686: Remove via_isa_set_irq()=0D
  hw/ide: Extract IDEBus assignment into bmdma_init()=0D
  hw/ide: Extract pci_ide_class_init()=0D
  hw/ide: Extract bmdma_init_ops()=0D
  hw/ide: Extract pci_ide_{cmd,data}_le_ops initialization into base=0D
    class constructor=0D
  hw/ide: Rename PCIIDEState::*_bar attributes=0D
  hw/ide/piix: Disuse isa_get_irq()=0D
  hw/ide/piix: Reuse PCIIDEState::{cmd,data}_ops=0D
  hw/ide/sii3112: Reuse PCIIDEState::{cmd,data}_ops=0D
  hw/ide/sii3112: Reuse PCIIDEState::bmdma_ops=0D
  hw/ide: Extract bmdma_clear_status()=0D
=0D
 include/hw/ide/pci.h      |  12 ++-=0D
 include/hw/isa/vt82c686.h |   2 -=0D
 hw/ide/cmd646.c           |  59 ++-------------=0D
 hw/ide/pci.c              |  73 ++++++++++++++++++-=0D
 hw/ide/piix.c             |  88 ++++++++--------------=0D
 hw/ide/sii3112.c          | 150 +++++++++++++++++++-------------------=0D
 hw/ide/via.c              |  64 +++-------------=0D
 hw/isa/vt82c686.c         |  23 ++++--=0D
 hw/ide/trace-events       |   7 +-=0D
 9 files changed, 221 insertions(+), 257 deletions(-)=0D
=0D
-- =0D
2.40.0=0D
=0D

