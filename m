Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CE868A13B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:10:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0V2-000703-60; Fri, 03 Feb 2023 13:09:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0V0-0006zF-EO
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:22 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Uw-00088s-CO
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:22 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so6603191wma.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:09:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jbtr3K/soYpD39/JOx7OqaCZkI9+H1VvjPFqpPMYVq0=;
 b=SP+vwCH5qYrHjRPHA/lMsY+Kta5SwlPcAY8AJaKR9oT1VSTVE2C2ysGzhTFaYMdLhn
 qvnmniHEhkNZYrieLa7sNyO1ZljbElQhvGllSGs0otNyJQCeZIXwGBT6wvKgw/KUN9jv
 hf1D7izv//uEsxyvKAQhCSEMKMrzs3k3QndDGEhN8Uk3P0D3+JtNf3GkU42gzoMASviQ
 80bzi2gpWSKELb+WTRuvBPA+35GbskHkakG4eQtqcMHhtPBtoAgHqKcQ9D9ytnLLj6/w
 Z8NjO8680Rv9n/Tuuur2/SMNbe2AkMz3oKcbGqoMQ3x9S/0oJFnItUjelAcK03wiXinZ
 BnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jbtr3K/soYpD39/JOx7OqaCZkI9+H1VvjPFqpPMYVq0=;
 b=CY0k6OhBt92BfcicUIUPs2kghbMMN7bw66ZBdwm8Ss1aQ2pDRxQeFR3QlxuY5Zcydr
 zpwTNcCxS44b6xSb+REAiwJdwVp0es3px0m2KPAPAwXsf3dqRwCEcQ16zIRHgdPHDN5R
 xWm+6wVvRT4HUoqEdkYs6eo12NNwVyuweRw8OgFCwCICw5r7y11OTwwmJUmFm9Oq4O0o
 itTsWguzHLHqXCy4FCvuioAEg1YB8QIrKuKU6BzXb7pN5bh/okJMNVnhqY7ni4gelbAA
 lFBwSlASuxhH8mqVajKNHJyl2u+2vKGEQZeJ6zC7YIOW1Vq75MiDDYIzhWa0FRKD4prl
 H6IA==
X-Gm-Message-State: AO0yUKUrmLA3ayFFmxVZGdeFZfL4WieJt4sDZiocsKRI1rV0tOfTVwyi
 YcUyueGH6s/WX7LAAmDLqzaLeE28wS7PXhOp
X-Google-Smtp-Source: AK7set8BwjF2JaeM5/6Bq+oGwLF7MGmbkhd723xLrgClcnIKUhL7OmJZTsrvFnb/lXXTMi0aTn9AXQ==
X-Received: by 2002:a05:600c:4711:b0:3df:e474:2ab2 with SMTP id
 v17-20020a05600c471100b003dfe4742ab2mr5872752wmo.33.1675447756023; 
 Fri, 03 Feb 2023 10:09:16 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m40-20020a05600c3b2800b003dcc82ce53fsm3700790wms.38.2023.02.03.10.09.15
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:15 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/19] hw: Set QDev properties using QDev API (part 1/3)
Date: Fri,  3 Feb 2023 19:08:55 +0100
Message-Id: <20230203180914.49112-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

QEMU provides the QOM API for core objects.
Devices are modelled on top of QOM as QDev objects.

There is no point in using the lower level QOM API with
QDev; it makes the code more complex and harder to review.

I first converted all the calls using errp=&error_abort or
&errp=NULL, then noticed the other uses weren't really
consistent.

A QDev property defined with the DEFINE_PROP_xxx() macros
is always available, thus can't fail. When using hot-plug
devices, we only need to check for optional properties
registered at runtime with the object_property_add_XXX()
API. Some are even always registered in device instance_init.

I have probably been overzealous, so I tagged the patches
not using errp=&error_abort|&error_fatal|NULL as RFC.

PPC and ARM conversions will follow as two different series.

Philippe Mathieu-Daudé (19):
  scripts/coccinelle: Add qom-qdev-prop.cocci
  hw/qdev: Introduce qdev_prop_set_link()
  hw/acpi: Set QDev properties using QDev API
  hw/audio: Set QDev properties using QDev API
  hw/core/numa: Set QDev properties using QDev API
  hw/core/gpio: Set QDev properties using QDev API
  hw/scsi: Set QDev properties using QDev API
  hw/usb: Set QDev properties using QDev API
  hw/virtio: Set QDev properties using QDev API
  hw/avr: Set QDev properties using QDev API
  hw/hppa: Set QDev properties using QDev API
  hw/i386: Set QDev properties using QDev API
  hw/m68k: Set QDev properties using QDev API
  hw/microblaze: Set QDev properties using QDev API
  hw/mips: Set QDev properties using QDev API
  hw/nios2: Set QDev properties using QDev API
  hw/riscv: Set QDev properties using QDev API
  hw/rx: Set QDev properties using QDev API
  hw/sparc: Set QDev properties using QDev API

 hw/acpi/cpu_hotplug.c                    |  7 ++--
 hw/acpi/ich9.c                           |  4 +--
 hw/acpi/piix4.c                          |  4 +--
 hw/avr/arduino.c                         |  4 +--
 hw/avr/atmega.c                          |  4 +--
 hw/core/gpio.c                           |  8 ++---
 hw/core/numa.c                           |  4 +--
 hw/core/qdev-properties.c                |  5 +++
 hw/display/virtio-gpu-pci.c              |  4 +--
 hw/display/virtio-vga.c                  |  4 +--
 hw/dma/sparc32_dma.c                     |  6 ++--
 hw/hppa/machine.c                        |  3 +-
 hw/i386/pc.c                             |  8 ++---
 hw/i386/pc_q35.c                         | 25 +++++++-------
 hw/i386/sgx.c                            |  3 +-
 hw/i386/x86.c                            | 12 +++----
 hw/m68k/next-cube.c                      |  2 +-
 hw/m68k/q800.c                           |  7 ++--
 hw/mem/pc-dimm.c                         |  5 ++-
 hw/microblaze/petalogix_ml605_mmu.c      | 40 ++++++++++------------
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  2 +-
 hw/microblaze/xlnx-zynqmp-pmu.c          | 40 +++++++++-------------
 hw/mips/boston.c                         |  6 ++--
 hw/mips/cps.c                            | 42 ++++++++----------------
 hw/mips/jazz.c                           |  3 +-
 hw/mips/malta.c                          |  6 ++--
 hw/nios2/10m50_devboard.c                |  2 +-
 hw/riscv/microchip_pfsoc.c               |  8 ++---
 hw/riscv/opentitan.c                     |  9 ++---
 hw/riscv/shakti_c.c                      |  7 ++--
 hw/riscv/sifive_e.c                      |  8 ++---
 hw/riscv/sifive_u.c                      |  9 ++---
 hw/riscv/spike.c                         | 10 +++---
 hw/riscv/virt.c                          |  9 ++---
 hw/rx/rx-gdbsim.c                        | 11 +++----
 hw/scsi/scsi-bus.c                       |  6 +---
 hw/sparc/sun4m.c                         | 10 +++---
 hw/sparc64/sun4u.c                       |  3 +-
 hw/usb/hcd-xhci-pci.c                    |  2 +-
 hw/usb/hcd-xhci-sysbus.c                 |  2 +-
 hw/virtio/virtio-iommu-pci.c             |  3 +-
 hw/virtio/virtio-rng.c                   |  3 +-
 include/hw/audio/pcspk.h                 |  2 +-
 include/hw/qdev-properties.h             |  1 +
 target/i386/cpu.c                        |  6 ++--
 target/i386/host-cpu.c                   |  7 ++--
 46 files changed, 155 insertions(+), 221 deletions(-)
 create mode 100644 scripts/coccinelle/qom-qdev-prop.cocci

-- 
2.38.1


