Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7E769C7B4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:31:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2FX-0005Yk-If; Mon, 20 Feb 2023 04:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2FJ-0005VC-I3
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:06 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2FG-0003ih-8n
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:04 -0500
Received: by mail-wr1-x42a.google.com with SMTP id b10so1925372wrx.11
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:14:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VAcxTXaJsTusl3yZhKygxIt+KhRNye/LY3stB0sBLME=;
 b=DbUzG8z/Ilu+8cqi51iRJnu4UHen535M3asOzw3dcK5pR47bzNGD1mGkkylQXvNGDa
 bcdVgqv2N9d5GmnMS98hU9P54duaDmDMftxT0zJv7sjeY7H2892Zh8L097LxVfo5f4pz
 bT58G87YjHBcQ79yCoIR7vKgwQXk2vmbLV3N9bM3u0VvpFCuxF4R1j1FuOvhsNjv0IWY
 EvRjgAxXzWG9p7c1wAXIfOm5djy6u4nca5xEnXlTv6YS2Pp1zmmAMwE9EQGQDQY5x/jK
 ZowDB+u7tw43E23+st/MjPlJ7Sx1PfhBNMZpQQ6UPoHT/mS6V2mbAw7nWiPaf6QFtixr
 HQBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VAcxTXaJsTusl3yZhKygxIt+KhRNye/LY3stB0sBLME=;
 b=JgRKKbL6FbKC5iDOL0ei3QpuSsCCYai5aZd29PfnWtzSkyRHc5IigaNJsdebRvKSw7
 XYc2QKEPrJfiJDIkqBOJgbOUxgsa0vknUFofZPIXuVjfvbAZlgVlaAIaUGal7FTl1Vck
 rzt/uxFOzCZppOnwRe/DTimnmSLZeo6+pEqb+1s+081fe9s4jioUM72LjkYAntckXlhw
 Cz5vM5ulMZ3GhSUSjvBFnClmOPfayPTqep88dKN73wwYDolBXzeoxS5MP7jhHs6wflOS
 dg09t9gXsEdjLtZ8JbKFc6DoCG0kcCAyNtQykgxv3E+54R+/w2HSlPuHyMN+s59AhVwU
 unKA==
X-Gm-Message-State: AO0yUKXw5kuA3iXq0fU+89PQGQNiHJiwhMm8syZxvhM6xlc+uFx7rS4/
 jnDMKNcymsquFswDV/2S0xKRGMXioLxksJ6G
X-Google-Smtp-Source: AK7set8V5Id1ovB75WQ6taArt5xdRIAShAUPlfk+8NOYjGZsqvbVoaFXp76vNcUbMu/XU2sjjr72pg==
X-Received: by 2002:a5d:5b07:0:b0:2c5:5069:2aa7 with SMTP id
 bx7-20020a5d5b07000000b002c550692aa7mr1545603wrb.31.1676884440617; 
 Mon, 20 Feb 2023 01:14:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 a17-20020adffad1000000b002c54e26bca5sm4972481wrs.49.2023.02.20.01.13.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:00 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 00/24] hw/ide: QOM/QDev housekeeping
Date: Mon, 20 Feb 2023 10:13:34 +0100
Message-Id: <20230220091358.17038-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Missing review: 2, 17, 20

Since v1:
- addressed review comments

John, can I get your formal Ack?

Thanks,

Phil.

Bernhard Beschow (1):
  hw/ide/pci: Unexport bmdma_active_if()

Fiona Ebner (1):
  hw/ide/ahci: trace ncq write command as write instead of read

John Snow (1):
  MAINTAINERS: Mark IDE and Floppy as "Odd Fixes"

Philippe Mathieu-Daudé (21):
  hw/ide/mmio: Use CamelCase for MMIO_IDE state name
  hw/ide/mmio: Extract TYPE_MMIO_IDE declarations to 'hw/ide/mmio.h'
  hw/ide/isa: Rename isairq -> irqnum
  hw/ide/isa: Extract TYPE_ISA_IDE declarations to 'hw/ide/isa.h'
  hw/ide/isa: Remove intermediate ISAIDEState::irq variable
  hw/ide/atapi: Restrict 'scsi/constants.h' inclusion
  hw/ide: Remove unused 'qapi/qapi-types-run-state.h'
  hw/ide: Include 'exec/ioport.h' instead of 'hw/isa/isa.h'
  hw/ide: Un-inline ide_set_irq()
  hw/ide: Rename ide_set_irq() -> ide_bus_set_irq()
  hw/ide: Rename ide_create_drive() -> ide_bus_create_drive()
  hw/ide: Rename ide_register_restart_cb -> ide_bus_register_restart_cb
  hw/ide: Rename ide_exec_cmd() -> ide_bus_exec_cmd()
  hw/ide: Rename ide_init2() -> ide_bus_init_output_irq()
  hw/ide: Rename idebus_active_if() -> ide_bus_active_if()
  hw/ide: Declare ide_get_[geometry/bios_chs_trans] in
    'hw/ide/internal.h'
  hw/ide: Rename ISA specific ide_init_ioport -> ide_bus_init_ioport_isa
  hw/ide/ioport: Remove unnecessary includes
  hw/ide/piix: Remove unused includes
  hw/ide/piix: Pass Error* to pci_piix_init_ports() for better error msg
  hw/ide/piix: Refactor pci_piix_init_ports as pci_piix_init_bus per bus

 MAINTAINERS               |  4 +-
 hw/arm/sbsa-ref.c         |  2 +-
 hw/i386/pc.c              |  3 +-
 hw/i386/pc_piix.c         |  1 +
 hw/ide/ahci.c             | 13 ++++---
 hw/ide/atapi.c            | 13 ++++---
 hw/ide/cmd646.c           |  4 +-
 hw/ide/core.c             | 80 +++++++++++++++++++++------------------
 hw/ide/ich.c              |  1 +
 hw/ide/ioport.c           | 14 ++-----
 hw/ide/isa.c              | 24 +++++-------
 hw/ide/macio.c            | 15 ++++----
 hw/ide/microdrive.c       |  9 +++--
 hw/ide/mmio.c             | 39 +++++++++----------
 hw/ide/pci.c              | 11 +++++-
 hw/ide/piix.c             | 47 ++++++++++-------------
 hw/ide/qdev.c             |  2 +-
 hw/ide/sii3112.c          |  4 +-
 hw/ide/trace-events       |  3 +-
 hw/ide/via.c              |  4 +-
 hw/misc/macio/gpio.c      |  1 +
 hw/sh4/r2d.c              |  4 +-
 hw/sparc64/sun4u.c        |  1 +
 include/hw/ide.h          | 12 ------
 include/hw/ide/internal.h | 30 ++++++---------
 include/hw/ide/isa.h      | 23 +++++++++++
 include/hw/ide/mmio.h     | 26 +++++++++++++
 include/hw/ide/pci.h      |  6 ---
 28 files changed, 212 insertions(+), 184 deletions(-)
 create mode 100644 include/hw/ide/isa.h
 create mode 100644 include/hw/ide/mmio.h

-- 
2.38.1


