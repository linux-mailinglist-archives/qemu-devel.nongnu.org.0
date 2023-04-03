Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A4DEF6D3E4B
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Apr 2023 09:43:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pjEoz-0001fS-V2; Mon, 03 Apr 2023 03:41:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEos-0001eo-8x
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:39 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pjEop-0006cW-Sb
 for qemu-devel@nongnu.org; Mon, 03 Apr 2023 03:41:37 -0400
Received: by mail-wm1-x331.google.com with SMTP id l37so16482837wms.2
 for <qemu-devel@nongnu.org>; Mon, 03 Apr 2023 00:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680507693;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hqktkp0iv4ik+R4dzmjAFeY0JZolWYG3VGRe4IrvPbY=;
 b=LVlZ2cuXFFwexXKoLI9ZG5QLEbGwOeE1vppWSymN0IQlwF89mbzooulggZ9QEfulr8
 PcmbIyQvJCwRAHRXGOCyARG18K25hcG1Z79E7hTODBbHIK5gRp8lt+RZ/NW7FpVGFaXg
 UiyqH4AVBIN7OzYQiYUpLFf0VmO/k9PzcY6G0ppf9uuG6chbW5qZDutq4dzRlzjqDcdl
 kBLiKAIa+gs0ikEQx09bluaV4HWsb28uN9XufuY9U6tt5vV79zff5a7CVVxoUUffTFnZ
 gomowXcFGaVrFrZduuwRYSaVlDcVSGOGAgvm8M/QM0eOxop+1AsCKWsROZrw7JaX9d3K
 eKWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680507693;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hqktkp0iv4ik+R4dzmjAFeY0JZolWYG3VGRe4IrvPbY=;
 b=sXqkMfQcoEB5VbD8nC6nk2vjz6E1eEkhMwJMXgJi3pPAOBIEAHxhl/hTJ06XPh5WhH
 j5f2CAh7K7Lv7bS+KgiYhNh+YjJxcdZApJuQuzgr+ankRAt8vXWkzSLRFl27mKV9eFLC
 L0E0h0LJ3Ejvex9AnaG0ITTvMWT0tkjghkJZrEHl8b7AfV346u/JeP4DHArgCSKWujch
 mC2AH0QpEYXDeygxn1NMQWsvo8FIkXMhwosF0ZogXlmt0ZciDwAyNRccNgyfwUNaLihl
 ofzaUiKpSntJXXfNxXilXpMPVge+NMASdUy0yiKDB/PJU4G1xdmxf3QanmYzPyl5k238
 nDQg==
X-Gm-Message-State: AO0yUKWuPV8FxgA12CJqow7EGkZPscUdBS7RWq5mhkj+kl7xFHYuQER5
 w0aM3cQVyP5Yi+qz3O+AFWgvSW+ny9w=
X-Google-Smtp-Source: AK7set+w4NV/Q17dNwmnKiNJ9TGNyLmYq7XLiiKjnzxMzffvXWPMfja/NHU/YbSqWzE9T9gy1AwaVA==
X-Received: by 2002:a05:600c:ad0:b0:3ed:abb9:7515 with SMTP id
 c16-20020a05600c0ad000b003edabb97515mr26505746wmr.11.1680507693506; 
 Mon, 03 Apr 2023 00:41:33 -0700 (PDT)
Received: from Provence.localdomain
 (dynamic-078-055-162-106.78.55.pool.telefonica.de. [78.55.162.106])
 by smtp.gmail.com with ESMTPSA id
 s11-20020a5d424b000000b002e5f6f8fc4fsm8414960wrr.100.2023.04.03.00.41.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 00:41:33 -0700 (PDT)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 David Woodhouse <dwmw@amazon.co.uk>, Eduardo Habkost <eduardo@habkost.net>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Chuck Zmudzinski <brchuckz@aol.com>, Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?q?Herv=C3=A9=20Poussineau?= <hpoussin@reactos.org>,
 Paul Durrant <paul@xen.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v4 0/7] Resolve TYPE_PIIX3_XEN_DEVICE
Date: Mon,  3 Apr 2023 09:41:17 +0200
Message-Id: <20230403074124.3925-1-shentey@gmail.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=shentey@gmail.com; helo=mail-wm1-x331.google.com
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
- `qemu-system-x86_64 -M pc -m 2G -cpu host -accel kvm \=0D
    -cdrom manjaro-kde-21.2.6-220416-linux515.iso`=0D
=0D
v4:=0D
- Add patch fixing latent memory leak in pci_bus_irqs() (Anthony)=0D
=0D
v3:=0D
- Rebase onto master=0D
=0D
v2:=0D
- xen_piix3_set_irq() is already generic. Just rename it. (Chuck)=0D
=0D
Tested-by: Chuck Zmudzinski <brchuckz@aol.com>=0D
=0D
Bernhard Beschow (7):=0D
  include/hw/xen/xen: Rename xen_piix3_set_irq() to xen_intx_set_irq()=0D
  hw/pci/pci.c: Don't leak PCIBus::irq_count[] in pci_bus_irqs()=0D
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
 hw/pci/pci.c                  |  2 ++=0D
 stubs/xen-hw-stub.c           |  2 +-=0D
 7 files changed, 39 insertions(+), 66 deletions(-)=0D
=0D
-- =0D
2.40.0=0D
=0D

