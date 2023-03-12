Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97EB46B65CB
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Mar 2023 13:04:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbKPT-0003MV-51; Sun, 12 Mar 2023 08:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPR-0003LH-CE
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:41 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pbKPP-0000Iq-LH
 for qemu-devel@nongnu.org; Sun, 12 Mar 2023 08:02:41 -0400
Received: by mail-ed1-x52d.google.com with SMTP id ek18so6998202edb.6
 for <qemu-devel@nongnu.org>; Sun, 12 Mar 2023 05:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678622553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Zx4WQ0rpWKtdmR92czSmYxtVfc9kMMG+Fa09pszRXII=;
 b=Kq0+PWIOx/dVZ15PrMf151vUjYkB6uw1jPdTgLlXYfQXbhvPC3e617ZPRfDQPm0p52
 D7BWiQFSoGlRTF9l4bCMsUCYx6VRorBIRy7q9oP5dTNrPeZB7QETmuW6FwDPYWAvNJb9
 oofS6MVVF9rjv7aBcUTfqOap5T6OHG3k8g58VIiS8sI1Y3/jT9pxCb0zV7FtIATh187L
 Bxog9AQv8s+toelMiZoQA4pkJ4D/gBJtBDJj6h7jmlccLMZB7WiNHLlNKBooCckMrGuo
 prxzTTi/98U/zrmf+c+sFw+Oc3v6PNtXvWK0M9wNPocVYkbhNAXbmddghY/34R+IxilH
 HTQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678622553;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Zx4WQ0rpWKtdmR92czSmYxtVfc9kMMG+Fa09pszRXII=;
 b=3XSqp+blo/Re6V6D0NMbXqzuzumCz92NwQy1TqA0dPdCsgjvTMyL3y2NAQ7qfESafJ
 ILi2YNqm5OBqdy2noSZ+B4OSTwxiqNNTbVwceBzT+jNOrfh/O9kz/HA/qRmPfwfiDr+y
 1LEFrltkKcyCvB+Xs+/ZS9RHCvNByqarjiV6rYGCrYcCfW5rBQI/c4ysMHWYZ9KPU7ms
 mHzTVE8iqR47ovpPFYf6Ar18+V56k8EdXLvuBDj+iE3x1Op+Al41o16i74G6i04zg0bs
 V0Bik8l77DmkibcFPPWfEdtY/wAQyJkg6Cj1r5vacp2h+jm9UfnznotdTijMSGcP9RSh
 9NIw==
X-Gm-Message-State: AO0yUKXrnHwdTsMm09jrutjbPmPZreYO9IX70jCItU7YXtFXvz0VPsr8
 WsxmEtTopl0swdAB/j3gpgXouvBskjI=
X-Google-Smtp-Source: AK7set/yTkaiC/AD/f/M0Ng0EK/oMU6zvGaSDuWVsoHBKyUNqdpnuBumcPec5u1y/AC8bZR4Zq7YGQ==
X-Received: by 2002:a17:907:2beb:b0:921:5cce:6599 with SMTP id
 gv43-20020a1709072beb00b009215cce6599mr3576266ejc.41.1678622552832; 
 Sun, 12 Mar 2023 05:02:32 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-054-022-093.78.54.pool.telefonica.de. [78.54.22.93])
 by smtp.gmail.com with ESMTPSA id
 xj9-20020a170906db0900b009231714b3d4sm1293745ejb.151.2023.03.12.05.02.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Mar 2023 05:02:32 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Woodhouse <dwmw@amazon.co.uk>,
 Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Eduardo Habkost <eduardo@habkost.net>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 0/6] Resolve TYPE_PIIX3_XEN_DEVICE
Date: Sun, 12 Mar 2023 13:02:15 +0100
Message-Id: <20230312120221.99183-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.2
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
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

There is currently a dedicated PIIX3 device model for use under Xen. By reu=
sing=0D
existing PCI API during initialization this device model can be eliminated =
and=0D
the plain PIIX3 device model can be used instead.=0D
=0D
Resolving TYPE_PIIX3_XEN_DEVICE results in less code while also making Xen=
=0D
agnostic towards the precise south bridge being used in the PC machine. The=
=0D
latter might become particularily interesting once PIIX4 becomes usable in =
the=0D
PC machine, avoiding the "Frankenstein" use of PIIX4_ACPI in PIIX3.=0D
=0D
Testing done:=0D
- `make check`=0D
- `make check-avocado`=0D
- Run `xl create` with the following config:=0D
    name =3D "Manjaro"=0D
    type =3D 'hvm'=0D
    memory =3D 1536=0D
    apic =3D 1=0D
    usb =3D 1=0D
    disk =3D [ "file:manjaro-kde-21.2.6-220416-linux515.iso,hdc:cdrom,r" ]=
=0D
    device_model_override =3D "/usr/bin/qemu-system-x86_64"=0D
    vga =3D "stdvga"=0D
    sdl =3D 1=0D
- `qemu-system-x86_64 -M pc -m 2G -cpu host \=0D
    -accel kvm,xen-version=3D0x4000a,kernel-irqchip=3Dsplit \=0D
    -cdrom manjaro-kde-21.2.6-220416-linux515.iso`=0D
- `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \=0D
    -cdrom manjaro-kde-21.2.6-220416-linux515.iso`=0D
=0D
v3:=0D
- Rebase onto master=0D
=0D
v2:=0D
- xen_piix3_set_irq() is already generic. Just rename it. (Chuck)=0D
=0D
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>=0D
=0D
Bernhard Beschow (6):=0D
  include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()=0D
  hw/isa/piix3: Reuse piix3_realize() in piix3_xen_realize()=0D
  hw/isa/piix3: Wire up Xen PCI IRQ handling outside of PIIX3=0D
  hw/isa/piix3: Avoid Xen-specific variant of piix3_write_config()=0D
  hw/isa/piix3: Resolve redundant k->config_write assignments=0D
  hw/isa/piix3: Resolve redundant TYPE_PIIX3_XEN_DEVICE=0D
=0D
 include/hw/southbridge/piix.h |  1 -=0D
 include/hw/xen/xen.h          |  2 +-=0D
 hw/i386/pc_piix.c             | 36 +++++++++++++++++++--=0D
 hw/i386/xen/xen-hvm.c         |  2 +-=0D
 hw/isa/piix3.c                | 60 +----------------------------------=0D
 stubs/xen-hw-stub.c           |  2 +-=0D
 6 files changed, 37 insertions(+), 66 deletions(-)=0D
=0D
-- =0D
2.39.2=0D
=0D

