Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EAF20697AB0
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 12:28:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSFwV-0008AP-BC; Wed, 15 Feb 2023 06:27:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwU-00089x-3C
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:18 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pSFwS-0003Np-ED
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 06:27:17 -0500
Received: by mail-wm1-x32d.google.com with SMTP id r18so13080155wmq.5
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 03:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sSM6ztMVd2QOZhnxUWFqggt+hjD4dShMf0V9sif6D34=;
 b=GfB59kvD58TuO62SlofweuaKWkc7xraeq41mydW5DpQLE+/uj9qi079xCy+izck8iW
 J2+cZ5m/hjyXx5gmpwKrjMe2kSmU3Kfm4sZbS6TAamuaLvDpMmY0rkkhlv5YRi+tZwoA
 Nfl3yjoQclx5BiG8gIzvG7QmXpa6YT1/56Vwgs7x0GXCphYaDOqD1QCSVOFYTW7pRmsd
 5QMBK5/rcczCtFj76Uspy/uFQ6i18OXoCnTqjc4v/eYvS2Z7hoK+1r9BTY7otJfSTlXT
 RmZ5BbqJZmptn5gQD+GC8AVpeke/EV012r1rluB907e5Ov9mU7X3BVM3CtfVAp6cSjeu
 yGHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sSM6ztMVd2QOZhnxUWFqggt+hjD4dShMf0V9sif6D34=;
 b=5yKHuGxdYrjrQp/Upq7BpItoI+F5GbJQ03gcKWG9JPXrlBffH5e8toVz+qfSeQCXw4
 yQjQv/X76l3natb9IWAWMD8g3PdNSZujpL6LEhLFPTektreFGYElT7Z1yDd/YF4WyPck
 ZPweh5Z3wGpUk4QxOcRJJ5rxhnhM94MRtKvel9axk1Ity0PBJYzFXIQ+MJ/3ILXRUSxD
 HT9n8tekHrYJszsGShE9AK4vqU6RHh9ET+nzonfijHxBBsHruXjqXW8aAAtcYFCkzu59
 hr3zcMfCFWZNlcmSDHtVN4/5O1psNm6f4RbPI+tRx1pGJDSERQCuGVoRD3hkjNadq6sF
 Dkmw==
X-Gm-Message-State: AO0yUKWlAbqNpw+8z0pJ1BRgce7mOcTpjqud6Q0jN1kdZA+JlttyTJm5
 ijDcSXUQPBpW+XU1pQSC4qT4q0JCKvn32S9X
X-Google-Smtp-Source: AK7set+USvsJPs30dF4g2eFkFNlQdlvjPXUf1kuvWGqilhT0J7kPLB9A/s2XXreRAljDI7UI0ws0tg==
X-Received: by 2002:a05:600c:4da2:b0:3dc:561a:79e7 with SMTP id
 v34-20020a05600c4da200b003dc561a79e7mr1679477wmp.2.1676460434633; 
 Wed, 15 Feb 2023 03:27:14 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c2-20020a05600c0a4200b003e1fb31fc2bsm1968513wmq.37.2023.02.15.03.27.13
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Feb 2023 03:27:14 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 John Snow <jsnow@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/20] hw/ide: QOM/QDev housekeeping
Date: Wed, 15 Feb 2023 12:26:52 +0100
Message-Id: <20230215112712.23110-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Mostly trivial cleanups in preparation of a v2 of
"hw/ide: Untangle ISA/PCI abuses of ide_init_ioport()":
https://lore.kernel.org/qemu-devel/20230208000743.79415-1-philmd@linaro.org/

Bernhard Beschow (1):
  hw/ide/pci: Unexport bmdma_active_if()

John Snow (1):
  MAINTAINERS: Mark IDE and Floppy as "Odd Fixes"

Philippe Mathieu-Daudé (18):
  hw/ide/mmio: Use CamelCase for MMIO_IDE state name
  hw/ide/mmio: Extract TYPE_MMIO_IDE declarations to 'hw/ide/mmio.h'
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
  hw/ide/ioport: Remove unnecessary includes
  hw/ide/piix: Remove unused includes
  hw/ide/piix: Pass Error* to pci_piix_init_ports() for better error msg
  hw/ide/piix: Refactor pci_piix_init_ports as pci_piix_init_bus per bus

 MAINTAINERS               |  4 +-
 hw/arm/sbsa-ref.c         |  2 +-
 hw/i386/pc_piix.c         |  1 +
 hw/ide/ahci.c             |  9 +++--
 hw/ide/atapi.c            | 13 ++++---
 hw/ide/cmd646.c           |  4 +-
 hw/ide/core.c             | 80 +++++++++++++++++++++------------------
 hw/ide/ich.c              |  1 +
 hw/ide/ioport.c           | 10 -----
 hw/ide/isa.c              | 22 +++++------
 hw/ide/macio.c            | 15 ++++----
 hw/ide/microdrive.c       |  9 +++--
 hw/ide/mmio.c             | 37 ++++++++----------
 hw/ide/pci.c              | 11 +++++-
 hw/ide/piix.c             | 46 ++++++++++------------
 hw/ide/qdev.c             |  2 +-
 hw/ide/sii3112.c          |  4 +-
 hw/ide/trace-events       |  2 +-
 hw/ide/via.c              |  4 +-
 hw/misc/macio/gpio.c      |  1 +
 hw/sh4/r2d.c              |  2 +-
 hw/sparc64/sun4u.c        |  1 +
 include/hw/ide.h          |  8 ----
 include/hw/ide/internal.h | 25 ++++--------
 include/hw/ide/isa.h      | 20 ++++++++++
 include/hw/ide/mmio.h     | 26 +++++++++++++
 include/hw/ide/pci.h      |  6 ---
 27 files changed, 193 insertions(+), 172 deletions(-)
 create mode 100644 include/hw/ide/isa.h
 create mode 100644 include/hw/ide/mmio.h

-- 
2.38.1


