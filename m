Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7FD6BDD6D
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 01:14:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcxhr-0005A6-PD; Thu, 16 Mar 2023 20:12:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pcxhp-00059p-S8; Thu, 16 Mar 2023 20:12:25 -0400
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1pcxho-0003vd-1O; Thu, 16 Mar 2023 20:12:25 -0400
Received: by mail-lf1-x136.google.com with SMTP id b10so3311852lfb.9;
 Thu, 16 Mar 2023 17:12:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679011939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lnwa9qDSsWLgPjNOqOTLvZ+BcqJAJ0FHBtMv7PwqLns=;
 b=CE0bGJ5eYrDRiqgwrVFkES2e1UqZyXeBBS1mkdoU12JWa2XisvDknBP3ujj2PA415f
 CdPniyMZu/u/IBP0dchtZuUsm9j+ZvIYaALOHAnEAU6tvAu+0nipW6YX/QAQht9ePpMo
 rh+IZ8vGiid9hIZSoTy0mUD7z0Lbn9LgKugRuYmO9+gsXUXfdNZryL8I3FU5JGq6O2yz
 VExtGBTlPvKFT9PD7BvXEDKJL+4SEIp22Y3YG/x5EmLRHdGo+DQx9RAZ0WQVS0CXgIiO
 ncvjQX/lgd1jLUzQZjClvmULHNbL7lZeXu3w8adVXb1pNbLfQm2yMvnv/OB2lJTSoJO/
 kGMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679011939;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lnwa9qDSsWLgPjNOqOTLvZ+BcqJAJ0FHBtMv7PwqLns=;
 b=BUS+3LRSO52+A8lbsaCPZ5WZTWo2/+OTC6FsbWKscxP2uYwIo7LX49QvIZEAQxvuPE
 uWNrxz7RiT7Jti24EoOZoE1AwEkaoTOhkQ7uiXvMlkhqPy80ZI096HA7G1TsaanniJiA
 2U7ddXS7XBcNTPCRTAk0Zac6sVn7QtmQzPuBlv2SwFf/stes+395xBZewKjHHqBL2JMK
 2LgMbQBJCEFTBxmqYMxkXZOVmub3QJw5PoB8i0yWG3847R46OkDHiyZ8UjESmlugaR4J
 el8t7b19XvGs4xmBV7axAj64mP5MsLvsw9OxdNLxe2CwIH0r1SGR7V9a/n5RPcwB8qkV
 TUwQ==
X-Gm-Message-State: AO0yUKWCbNGt0bUBqXGhsjFu3pq3bmY5ttbugd4lHKRSMtAvqQ23aHhV
 FhBgnzhkUKUKg/2SlIE/PAY=
X-Google-Smtp-Source: AK7set8atRSHIaYSg+dCkQUMveo2yAGbgoQ5cpiCxEBGwWHECwUJCf0ZKB8/NrC5FdYScOSvZKL5QA==
X-Received: by 2002:ac2:488f:0:b0:4d5:95c9:4eb9 with SMTP id
 x15-20020ac2488f000000b004d595c94eb9mr3433039lfc.44.1679011939572; 
 Thu, 16 Mar 2023 17:12:19 -0700 (PDT)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 y17-20020ac24211000000b004ddaea30ba6sm97776lfh.235.2023.03.16.17.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 17:12:19 -0700 (PDT)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH v2 0/4] Basic Allwinner WDT emulation
Date: Fri, 17 Mar 2023 01:11:59 +0100
Message-Id: <20230317001203.18425-1-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x136.google.com
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

This patch set introduces basic emulation of Allwinner WDT.
Since WDT in both A10 and H3 is part of Timer module, the WDT
functionality is added as an overlay in the memory map.

The focus was to enable reboot functionality, so WDT interrupt handling
is not covered in this patch set.

With these patches the `reboot` command can be used for both Cubieboard
and Orangepi-PC in order to restart the system.

Also, Cubieboard avocado tests have been improved to include reboot
steps as well.

v2:
- Cleaned up WDT implementation (changes only in patch 01/04)
- Removed unnecessary checks - instead of changing enum to start from 1,
  removed if (!c->regmap[offset]) since it was conflicting enum values
- Reorganized comments

Strahinja Jankovic (4):
  hw/watchdog: Allwinner WDT emulation for system reset
  hw/arm: Add WDT to Allwinner-A10 and Cubieboard
  hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
  tests/avocado: Add reboot tests to Cubieboard

 docs/system/arm/cubieboard.rst      |   1 +
 docs/system/arm/orangepi.rst        |   1 +
 hw/arm/Kconfig                      |   2 +
 hw/arm/allwinner-a10.c              |   7 +
 hw/arm/allwinner-h3.c               |   8 +
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/allwinner-wdt.c         | 416 ++++++++++++++++++++++++++++
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/trace-events            |   7 +
 include/hw/arm/allwinner-a10.h      |   2 +
 include/hw/arm/allwinner-h3.h       |   5 +-
 include/hw/watchdog/allwinner-wdt.h | 123 ++++++++
 tests/avocado/boot_linux_console.py |  15 +-
 13 files changed, 588 insertions(+), 4 deletions(-)
 create mode 100644 hw/watchdog/allwinner-wdt.c
 create mode 100644 include/hw/watchdog/allwinner-wdt.h

-- 
2.30.2


