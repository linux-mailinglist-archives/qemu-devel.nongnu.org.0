Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AAA66BE80
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:01:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHP5B-0005B4-Pt; Mon, 16 Jan 2023 07:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP58-0005AE-GK; Mon, 16 Jan 2023 07:59:22 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP56-00014S-Sd; Mon, 16 Jan 2023 07:59:22 -0500
Received: by mail-ej1-x62d.google.com with SMTP id bk15so10408215ejb.9;
 Mon, 16 Jan 2023 04:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ayZsJ7l5Wr2NILbiICi3pySTKErzh6rH0XkYXOZ25TU=;
 b=CoE+hG06kl/bw6KhQ/ooKeOOY1GjJEoG8PfDSwSid+pplIgQr+eX+C9d0z+WGCSxCr
 JlX7+81UW93NlzpiF3174+vrY9vRqkYyPdbu2rq3x0W2yYPIuOcCIgRiibtqy2k1uFUc
 bMM2YmYsWrKkk2k+j6sBe56kBlIoIzFFLw6xqSUPsJkNckKVPddR5RBOQKV8KJ/qdTqu
 Co1QBADczVznUeSB0yheNMLelIrNAdqQxE6hdP2i+V9tZRgT+t4qvcNIUS0rKn3zBA+Z
 rf2FWYsLM8cIgRQy/2Vwu0QvhH6XGaAcSoWT89ewDd3suUtmC7s1qYHeDysZUBCIuU6Z
 8yDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ayZsJ7l5Wr2NILbiICi3pySTKErzh6rH0XkYXOZ25TU=;
 b=VMaeXGXlAIbPaqUMbIDXTOWzOzRWZxx0Hnjbnirj8RBReOeb6Lp9j0aTdl2LlRXq8b
 7RB4url+xYc8uEcbTeMqePsCIKI0MJL3UCViRVxajd4DiR7tKi7aHC4Jd5b+PA3evmhO
 qWnHZ42rnRg4ASq5Lw66zWojG5S29IbceRi+FQt9v8qn0Fg6w+rMFbvGgHOWTtSFKTuG
 Zez23FXjjuofySOOoolgnI1jSTCWHIxNWLO53H5HaOJUjgg38OuU+g+vA9E6kwDUdHYD
 jqPtpZuCkz5Z/QWxM1e43q+GNkOtzMe1ry7YBNBezJ3NWZqUUyelGxuDQfwJsK7vNIAN
 y1hQ==
X-Gm-Message-State: AFqh2kqoB0/OQ+Mx57IZrCXJ6IycwgoJX3ScQyzx2GZLs/zryZKYMdvE
 JPiAH99AzZllj+lyRs1mqrxNaXdYTmY=
X-Google-Smtp-Source: AMrXdXszvJC8e2pW0nVThIzwn6wF+A0W1SoaE5gosa+vEwL3mw2twT4WNr1YPOcyZjg/yga976vQbA==
X-Received: by 2002:a17:907:a508:b0:7c1:539b:d028 with SMTP id
 vr8-20020a170907a50800b007c1539bd028mr81200540ejc.48.1673873958516; 
 Mon, 16 Jan 2023 04:59:18 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 um41-20020a170907cb2900b0086c4fbb8507sm3201517ejc.225.2023.01.16.04.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:59:18 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 0/8] AML Housekeeping
Date: Mon, 16 Jan 2023 13:58:34 +0100
Message-Id: <20230116125842.66817-1-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62d.google.com
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
Bernhard Beschow (8):=0D
  hw/acpi: Add missing includes=0D
  hw/acpi/acpi_dev_interface: Remove unused parameter from=0D
    AcpiDeviceIfClass::madt_cpu=0D
  hw/acpi/acpi_dev_interface: Resolve AcpiDeviceIfClass::madt_cpu=0D
  hw/acpi/piix4: No need to #include "hw/southbridge/piix.h"=0D
  hw/i386/acpi-build: Remove unused attributes=0D
  hw/acpi/acpi_aml_interface: Extract qbus_build_aml()=0D
  hw/i386/acpi-microvm: Reuse qbus_build_aml()=0D
  hw/isa/isa-bus: Remove now unused isa_build_aml()=0D
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

