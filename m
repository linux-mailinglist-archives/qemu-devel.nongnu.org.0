Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EA8466C3E9
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 16:32:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHRQd-0001FD-CR; Mon, 16 Jan 2023 10:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQa-0001Ee-QC; Mon, 16 Jan 2023 10:29:40 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHRQY-00086C-FZ; Mon, 16 Jan 2023 10:29:40 -0500
Received: by mail-ej1-x635.google.com with SMTP id u19so68854644ejm.8;
 Mon, 16 Jan 2023 07:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=R1qab2GuaBWoD3Ko1VX21FFzHNBd133I47ejcbwuseM=;
 b=X/Wany2VqVwt9wYKYvFEdegtS56zfG2HaDtSKsoWJ3ZAVMsh/5D98X0eyk7cw/ujam
 LEEECaz+HFUuwWO6jpYANgaOePc1JRRs2rSgBvUgLCYeaqxuL2iB2LURL/nfa4Fa3Gir
 6hH+0MaNC9+x/it6xq8ctQWRfAyoJv1e+OhT8Qq3hBK/C+ew/5yPElg2wYlHxBnXUlF/
 /MdtfRAV5wBE1hiPc5hGsAdqjcB0jiD0r74lgUJzxu1/Y0bSdA37iH6SbFxJ/Grm8wrk
 ubip/aAZzrTJhO1Eu632R34Kl8V2GO6aD17RfCUtwVCTknpQgleOTCp6nTKUVdLNyneV
 Cmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=R1qab2GuaBWoD3Ko1VX21FFzHNBd133I47ejcbwuseM=;
 b=ipX52mEb6w5bVrfs+liI10elNkjDA6AvpIm5pfhgJDX5Jw9Pdj5qUdwJxI4HVkuCzi
 H8uuWM1OqL8WZ+kSryNdX7eACWyl2AeGFWQrQaIheKUIrKcgIhD7nCdayAT5ORzixcZI
 mJHQDpVx5xJ42+VryARQKyJpKj5oIb4krf03mGRj8rGol2WhHvg+OrLYKotss8vqvnIS
 iO9pRdz5MhgdJqbUiqu6bdVWALEmGd2iPMDHEPH1D1Cz58SZjXl/Hh+5VWWT/8izTWbC
 NQe0H98cIqcHoxL3FDod6QpdJwzhdZyf4Wb5z1P9B0gJzQXaLOgHwLM0xosnZDSV+Yt9
 S5TQ==
X-Gm-Message-State: AFqh2kqZDEvHgSjWE2MZoE6aJFOt92HZfBj2SlSgdWKz6ccgVLic3Ydj
 svAplKv0pcVZe0S5d3RG258dVGEFg+U=
X-Google-Smtp-Source: AMrXdXuSccHenHmdmKLXLCIQxikos/WbhiBN4t5nflFDA8+w5aAd4uxqXnwPBOHrWEqSK3st+Iyp4Q==
X-Received: by 2002:a17:906:5254:b0:7c0:efb4:71fb with SMTP id
 y20-20020a170906525400b007c0efb471fbmr76459829ejm.28.1673882976216; 
 Mon, 16 Jan 2023 07:29:36 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 x3-20020a170906b08300b007c0688a68cbsm12180764ejy.176.2023.01.16.07.29.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 07:29:35 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v3 0/7] AML Housekeeping
Date: Mon, 16 Jan 2023 16:29:01 +0100
Message-Id: <20230116152908.147275-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x635.google.com
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

This series resolves the AcpiDeviceIfClass::madt_cpu function pointer. It t=
urns=0D
out that it isn't needed and it even frees the ACPI controllers from assign=
ing=0D
it an x86 specific function. This is especially interesting for the PIIX4 P=
M=0D
which is also used in MIPS only contexts.=0D
=0D
Furthermore, the series introduces qbus_build_aml() which then gets=0D
used to resolve isa_build_aml().=0D
=0D
v3:=0D
- Clean up includes in AcpiDeviceIfClass::madt_cpu sub series last (Markus)=
=0D
- Restructure qbus_build_aml() sub series (Phil, me)=0D
=0D
v2:=0D
- Don't inline qbus_build_aml() (Phil)=0D
- Add 'hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"'=0D
=0D
Testing done:=0D
* `make check`=0D
* `make check-avocado`=0D
* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.2.6-220416-linux515=
.iso`=0D
* `qemu-system-x86_64 -M q35 -m 2G -cdrom \=0D
   manjaro-kde-21.2.6-220416-linux515.iso`=0D
=0D
Bernhard Beschow (7):=0D
  hw/acpi/acpi_dev_interface: Remove unused parameter from=0D
    AcpiDeviceIfClass::madt_cpu=0D
  hw/acpi/acpi_dev_interface: Resolve AcpiDeviceIfClass::madt_cpu=0D
  hw/acpi/acpi_dev_interface: Remove now unused #include "hw/boards.h"=0D
  hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"=0D
  hw/i386/acpi-build: Remove unused attributes=0D
  hw/isa/isa-bus: Turn isa_build_aml() into qbus_build_aml()=0D
  piix3, ich9: Reuse qbus_build_aml()=0D
=0D
 hw/acpi/hmat.h                       |  3 ++-=0D
 hw/i386/acpi-common.h                |  7 +++++--=0D
 include/hw/acpi/acpi_aml_interface.h |  3 +++=0D
 include/hw/acpi/acpi_dev_interface.h |  4 ----=0D
 include/hw/acpi/cpu.h                |  6 +++++-=0D
 include/hw/i386/pc.h                 |  6 ------=0D
 include/hw/isa/isa.h                 |  1 -=0D
 hw/acpi/acpi-x86-stub.c              |  7 -------=0D
 hw/acpi/acpi_interface.c             | 10 ++++++++++=0D
 hw/acpi/cpu.c                        | 12 +++++-------=0D
 hw/acpi/hmat.c                       |  1 +=0D
 hw/acpi/memory_hotplug.c             |  1 +=0D
 hw/acpi/piix4.c                      |  3 ---=0D
 hw/i2c/smbus_ich9.c                  |  5 +----=0D
 hw/i386/acpi-build.c                 |  7 ++-----=0D
 hw/i386/acpi-common.c                | 10 ++++------=0D
 hw/i386/acpi-microvm.c               |  6 +++---=0D
 hw/i386/generic_event_device_x86.c   |  9 ---------=0D
 hw/isa/isa-bus.c                     | 10 ----------=0D
 hw/isa/lpc_ich9.c                    |  6 +-----=0D
 hw/isa/piix3.c                       |  5 +----=0D
 monitor/qmp-cmds.c                   |  1 +=0D
 22 files changed, 45 insertions(+), 78 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D

