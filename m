Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8CE66AE50
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 23:29:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGp0J-00011i-Dm; Sat, 14 Jan 2023 17:27:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0H-000115-4e
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:27:57 -0500
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0F-0003hR-7x
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:27:56 -0500
Received: by mail-ej1-x62b.google.com with SMTP id u9so60069403ejo.0
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 14:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4ivzhOBoHs6TsWJVbB02QgvJlXBejawvefx7rWYbcVw=;
 b=iVgOP0RKjNjgZOVIsAvHMD2SZ+9hjGhKhoWYirbOeqBqr2r2gkQwd5ycpevprQjDro
 dYvJKfb3znlLCA6M0P7Dtrh7RXCF7PlIjngNzql24EyLqSC+S60p9tOJCFgC7Et5GIoS
 /TuHnNNauEwN8mE/Nih/Cx5KRSrq2eLtIfs6FVniCsl5tgdFZ1N7a9WZlsXTBswdsk7/
 FfQZFOay+8/YSY2SDnV63pWSAgtYS8KoOGH9Cfi/82i9HlmAYMyERjtr30fBv/gaDZbF
 URlcAHLb/mE/sFswXN57L+PNpLj9Y+ON3EQthZZugnsk2C8FsnriABeifpLjyloWnPaA
 diAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4ivzhOBoHs6TsWJVbB02QgvJlXBejawvefx7rWYbcVw=;
 b=70Z81JBVNm8TX8jDvf9ZNSs/4sX54L66OiVSl4JWdOY4BPP3GAX6fo7npF54pku4tS
 sPBc3LAiLU7f+pC6GjGGFN+F1jJL250xMp6F749GK29T7Nk4jsR6jE147tb7klWBrDBP
 gUibK1Xlm+xWbuJ+eJeCpIYBH7Ha2hKjBz4F6PUBENWUQSeiRqTD9YsO4h/X2D5Rh8L5
 rQquGngcO4ERjvxgUu2TdC/uLBGU62E6m84a/5z4hEe8hntQkxEwC4Hu1xd2Py5LU/M+
 IbxPOTDWVSsCWBzN+5qU7n5eRGStnJNO5XzRPgGs0NM6oAYronn9cugnW4U6OAohoHoP
 C4IQ==
X-Gm-Message-State: AFqh2kox2L/c5ONTea3Hwa6iRyd8sapW0oeyVf//TXj0kw518OdVyXlh
 zVSclioLCuKKLErWlY2r1oDY74qO1oo=
X-Google-Smtp-Source: AMrXdXuWAWk73n5DvlXBa2hiQFPovGsrbh1uIf/yzMYW7ScQKd14Utcl9zs4BZ8cq3qHG3sg7HCHsQ==
X-Received: by 2002:a17:906:f6c1:b0:7cd:ffd:51f2 with SMTP id
 jo1-20020a170906f6c100b007cd0ffd51f2mr89354419ejb.57.1673735273038; 
 Sat, 14 Jan 2023 14:27:53 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-013-123-004.77.13.pool.telefonica.de. [77.13.123.4])
 by smtp.gmail.com with ESMTPSA id
 og5-20020a1709071dc500b0084d420503a3sm8324840ejc.178.2023.01.14.14.27.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 14:27:52 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 0/7] AML Housekeeping
Date: Sat, 14 Jan 2023 23:27:31 +0100
Message-Id: <20230114222738.282478-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
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
Testing done:=0D
* `make check`=0D
* `make check-avocado`=0D
* `qemu-system-x86_64 -M pc -m 2G -cdrom manjaro-kde-21.2.6-220416-linux515=
.iso`=0D
* `qemu-system-x86_64 -M q35 -m 2G -cdrom \=0D
   manjaro-kde-21.2.6-220416-linux515.iso`=0D
=0D
Bernhard Beschow (7):=0D
  hw/acpi: Add missing includes=0D
  hw/acpi/acpi_dev_interface: Remove unused parameter from=0D
    AcpiDeviceIfClass::madt_cpu=0D
  hw/acpi/acpi_dev_interface: Resolve AcpiDeviceIfClass::madt_cpu=0D
  hw/i386/acpi-build: Remove unused attributes=0D
  hw/acpi/acpi_aml_interface: Extract qbus_build_aml()=0D
  hw/i386/acpi-microvm: Reuse qbus_build_aml()=0D
  hw/isa/isa-bus: Remove now unused isa_build_aml()=0D
=0D
 hw/acpi/hmat.h                       |  3 ++-=0D
 hw/i386/acpi-common.h                |  7 +++++--=0D
 include/hw/acpi/acpi_aml_interface.h | 11 +++++++++++=0D
 include/hw/acpi/acpi_dev_interface.h |  4 ----=0D
 include/hw/acpi/cpu.h                |  6 +++++-=0D
 include/hw/i386/pc.h                 |  6 ------=0D
 include/hw/isa/isa.h                 |  1 -=0D
 hw/acpi/acpi-x86-stub.c              |  7 -------=0D
 hw/acpi/cpu.c                        | 12 +++++-------=0D
 hw/acpi/hmat.c                       |  1 +=0D
 hw/acpi/memory_hotplug.c             |  1 +=0D
 hw/acpi/piix4.c                      |  2 --=0D
 hw/i2c/smbus_ich9.c                  |  5 +----=0D
 hw/i386/acpi-build.c                 |  7 ++-----=0D
 hw/i386/acpi-common.c                | 10 ++++------=0D
 hw/i386/acpi-microvm.c               |  6 +++---=0D
 hw/i386/generic_event_device_x86.c   |  9 ---------=0D
 hw/isa/isa-bus.c                     | 10 ----------=0D
 hw/isa/lpc_ich9.c                    |  6 +-----=0D
 hw/isa/piix3.c                       |  5 +----=0D
 monitor/qmp-cmds.c                   |  1 +=0D
 21 files changed, 43 insertions(+), 77 deletions(-)=0D
=0D
-- =0D
2.39.0=0D
=0D

