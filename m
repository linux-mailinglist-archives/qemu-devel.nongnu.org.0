Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA6A65653E
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Dec 2022 23:05:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p9vZG-0004mJ-K9; Mon, 26 Dec 2022 17:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p9vZ4-0004kj-Ol; Mon, 26 Dec 2022 17:03:22 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p9vZ2-0003X0-RY; Mon, 26 Dec 2022 17:03:22 -0500
Received: by mail-ed1-x531.google.com with SMTP id u28so12018269edd.10;
 Mon, 26 Dec 2022 14:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E0CNKufWJ9cgOLvsHBLXpX8GKTQDW5GWzj/kJv3Ez5w=;
 b=AqZHmj72DquJ4PFgjFXSkabeaDolQyZ8zHefd1Q9h1LR+jatX1jN6txFb+cYCLaoqT
 covXd8Dqe4vCZpzWy/5dLiN0nte+1NGzmFM7S40jWoEn7jDyHcSE3njwGFgaV+50zM7j
 /6fF/TDp1da1bJQ8T5Q44ukbulyA/jW5+hf7nt8PXEml1EHDM94DUmoskt2oTpoQ+ZpS
 IDPsV3zLQwKlKZXmC69pH2ITKEcqGPqUELwfrZEDj7YDOHk+OwID0wzhZh8wgg92XplC
 lXpQC35xPREWHIGNwDqmJv0TOYfeyDZWg3VSWXLdFJOl1rRDNSrjI6URm7PEYtU9x6kA
 t/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E0CNKufWJ9cgOLvsHBLXpX8GKTQDW5GWzj/kJv3Ez5w=;
 b=r9Dd9nBHO+bRcPYuuPt8uYHRW7CwhFzeJetgHObCxfWDos0R+X4KJbXSWgSMkLHKd1
 RtB6jgnOV4MVidxX5CFXqlsEMxISXMQqvWNkwW3lGfpXK7gGWK4+737sDu6e8EbET/bW
 +CypIpXjbr37NN/PScB1bhfLf8syQoiPidmnXJagRBRpae1x1fV7IjYH2i8pj7vwMnbP
 K8Y2qXq4m+GQgYCH0M+BWNu1qyyVhcf9/5JxOAZGJDwi2SenPBJKu5ybzAAZYQKZLSNt
 lzenJG1klAYFEx4JR0NfYKiQzXQ1FPM2yY53UtjlnsxyYJT3I0rzoSs7NHL3bOPMzT0B
 Js1Q==
X-Gm-Message-State: AFqh2kr80qUwi3y2ZCkyJSpr0uRmT0BKD7IpXInGDMr12QNR84ZSaL3I
 +YK2fR2cyHeUCSlNCqF4KBE=
X-Google-Smtp-Source: AMrXdXu4alnEEhc7ZIErihVB4HszEThMIZ6tzR9XPXiUDZED223r1K2XzWHLrxZLYfMT0zXWVOEsHw==
X-Received: by 2002:a05:6402:548e:b0:479:8303:dc1c with SMTP id
 fg14-20020a056402548e00b004798303dc1cmr15320838edb.7.1672092197052; 
 Mon, 26 Dec 2022 14:03:17 -0800 (PST)
Received: from penguin.lxd ([87.116.176.120])
 by smtp.googlemail.com with ESMTPSA id
 u1-20020aa7d541000000b0046951b43e84sm5111467edr.55.2022.12.26.14.03.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Dec 2022 14:03:16 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, philmd@linaro.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org,
 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v3 0/7] Enable Cubieboard A10 boot SPL from SD card
Date: Mon, 26 Dec 2022 23:02:56 +0100
Message-Id: <20221226220303.14420-1-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-ed1-x531.google.com
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

This patch series adds missing Allwinner A10 modules needed for
successful SPL boot:
- Clock controller module
- DRAM controller
- I2C0 controller (added also for Allwinner H3 since it is the same)
- AXP-209 connected to I2C0 bus

It also updates Allwinner A10 emulation so SPL is copied from attached
SD card if `-kernel` parameter is not passed when starting QEMU
(approach adapted from Allwinner H3 implementation).

Boot from SD card has been tested with Cubieboard Armbian SD card image and custom
Yocto image built for Cubieboard.
Example usage for Armbian image:
qemu-system-arm -M cubieboard -nographic -sd ~/Armbian_22.11.0-trunk_Cubieboard_kinetic_edge_6.0.7.img

v3:
* new avocado test for SD card boot for Cubieboard with OpenWrt image 
* renamed file and functions for AXP209 so there is not allwinner prefix
* replaced cast with I2C_BUS in AXP209 instantiation for Cubieboard
* squashed commit with Cubieboard and OrangePi-PC documentation update
with actual code changes
* added myself as Designated Reviewer to the Allwinner-A10 section in
MAINTAINERS file and added hw/misc/axp209.c to the same section.

v2:
* replaced DB_PRINTF with tracing functions
* removed .init function in AXP209 since .reset covers functionality
* moved defines to allwinner_i2c.c from header file
* updated docs with information about TWI
* minor code style fixes


Strahinja Jankovic (7):
  hw/misc: Allwinner-A10 Clock Controller Module Emulation
  hw/misc: Allwinner A10 DRAM Controller Emulation
  {hw/i2c,docs/system/arm}: Allwinner TWI/I2C Emulation
  hw/misc: AXP209 PMU Emulation
  hw/arm: Add AXP209 to Cubieboard
  hw/arm: Allwinner A10 enable SPL load from MMC
  tests/avocado: Add SD boot test to Cubieboard

 MAINTAINERS                           |   2 +
 docs/system/arm/cubieboard.rst        |   1 +
 docs/system/arm/orangepi.rst          |   1 +
 hw/arm/Kconfig                        |   5 +
 hw/arm/allwinner-a10.c                |  40 +++
 hw/arm/allwinner-h3.c                 |  11 +-
 hw/arm/cubieboard.c                   |  11 +
 hw/i2c/Kconfig                        |   4 +
 hw/i2c/allwinner-i2c.c                | 459 ++++++++++++++++++++++++++
 hw/i2c/meson.build                    |   1 +
 hw/i2c/trace-events                   |   5 +
 hw/misc/Kconfig                       |  10 +
 hw/misc/allwinner-a10-ccm.c           | 224 +++++++++++++
 hw/misc/allwinner-a10-dramc.c         | 179 ++++++++++
 hw/misc/axp209.c                      | 238 +++++++++++++
 hw/misc/meson.build                   |   3 +
 hw/misc/trace-events                  |   5 +
 include/hw/arm/allwinner-a10.h        |  27 ++
 include/hw/arm/allwinner-h3.h         |   3 +
 include/hw/i2c/allwinner-i2c.h        |  55 +++
 include/hw/misc/allwinner-a10-ccm.h   |  67 ++++
 include/hw/misc/allwinner-a10-dramc.h |  68 ++++
 tests/avocado/boot_linux_console.py   |  47 +++
 23 files changed, 1465 insertions(+), 1 deletion(-)
 create mode 100644 hw/i2c/allwinner-i2c.c
 create mode 100644 hw/misc/allwinner-a10-ccm.c
 create mode 100644 hw/misc/allwinner-a10-dramc.c
 create mode 100644 hw/misc/axp209.c
 create mode 100644 include/hw/i2c/allwinner-i2c.h
 create mode 100644 include/hw/misc/allwinner-a10-ccm.h
 create mode 100644 include/hw/misc/allwinner-a10-dramc.h

-- 
2.30.2


