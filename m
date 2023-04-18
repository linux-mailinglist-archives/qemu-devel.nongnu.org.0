Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EF06E6B32
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Apr 2023 19:38:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1popGA-0002cO-7d; Tue, 18 Apr 2023 13:36:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1popG7-0002aS-Vs
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 13:36:51 -0400
Received: from mail-ej1-f49.google.com ([209.85.218.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1popG6-0007Gx-Fz
 for qemu-devel@nongnu.org; Tue, 18 Apr 2023 13:36:51 -0400
Received: by mail-ej1-f49.google.com with SMTP id a5so18709345ejb.6
 for <qemu-devel@nongnu.org>; Tue, 18 Apr 2023 10:36:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681839407; x=1684431407;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=S7E95Yukh3r55CeGcd0k2YgXT1hgJKut7e/zVlKR2sY=;
 b=HTbmLvPlXPk6ONoQsN+3tJQAxOYc7MP4TVdWSrQ/NTphZthiQriEyQ8DRVlgOwnmlk
 nbTjHRv9b5OPXXBH5Y3T5CiNMyuj7yfd4Tj33GsywbToBuUA5YUPRoROor19ZFa3CMy1
 XiM10p6/X2jwO6FGFA76lOWzeStftOlPmGL9zY2BjdiMCJazj4GGUhJuJxmMjlN1D62b
 3dUfOr4HXGcoq31c4ZS9ZGohUgcBncuf9E0raKwSnKRDCXzuxqCDzvTHDiFpvxhB6u38
 dZ7x+UVj0ZOEESLxaGw+f+GFLOc6XKMOyJQxqOhfC5MUht0uEULH/erLTWd3sd8wAgf1
 xn8Q==
X-Gm-Message-State: AAQBX9fNBKsvk9hxa8V5ZHPyvHSVZ42CAifZBGac50w0AgBLxdIvwczu
 PdQMDnDSU9n99RTWniRMxBlDvo+/u/6kCEPx
X-Google-Smtp-Source: AKy350bNNSGWI0cUVQ6Rauw5WLiXLvTQWOvO4pbNJkNdtePoIm0D/zSAgR2jWKqY5s11K+gISBerNQ==
X-Received: by 2002:a17:906:b817:b0:94d:e2ef:1618 with SMTP id
 dv23-20020a170906b81700b0094de2ef1618mr11225242ejb.7.1681839407162; 
 Tue, 18 Apr 2023 10:36:47 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-62-216-205-204.dynamic.mnet-online.de. [62.216.205.204])
 by smtp.googlemail.com with ESMTPSA id
 j23-20020a1709066c1700b0095342bfb701sm73738ejr.16.2023.04.18.10.36.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 10:36:46 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 =?UTF-8?q?Jorge=20Sanjuan=20Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>
Subject: [PATCH v4 0/4] Add emulation of MEN Chameleon Hardware
Date: Tue, 18 Apr 2023 19:35:52 +0200
Message-Id: <20230418173556.177985-1-jth@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.49; envelope-from=morbidrsa@gmail.com;
 helo=mail-ej1-f49.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Add emulation of MEN Chameleon Hardware to Qemu.
This emulation is specifically designed to test the upstream Linux kernel
drivers when one has no access to the hardware.

The emulation consists of the bus itself, a PCI hardware target creating the
bus, MEN Micro Electronic's 8250 based UART via MCB and a watchdog timer.

Changes since v2:
- Converted DPRINTF() to tracing infrastructure again (Alistair)

Changes since v2:
- Adjusted license to GPL 2 or later (Peter)

Changes since v1:
- Converted DPRINTF() to tracing infrastructure (Alistair)
- Fixed style issues (Alistair)

Johannes Thumshirn (4):
  Add MEN Chameleon Bus emulation
  Add MEN Chameleon Bus via PCI carrier
  serial-mcb: Add serial via MEN chameleon bus
  wdt_z069: Add support for MEN 16z069 Watchdog

 MAINTAINERS              |   6 +
 hw/Kconfig               |   1 +
 hw/char/Kconfig          |   6 +
 hw/char/meson.build      |   1 +
 hw/char/serial-mcb.c     | 115 +++++++++++++++
 hw/mcb/Kconfig           |   8 ++
 hw/mcb/mcb-pci.c         | 298 +++++++++++++++++++++++++++++++++++++++
 hw/mcb/mcb.c             | 180 +++++++++++++++++++++++
 hw/mcb/meson.build       |   2 +
 hw/mcb/trace-events      |   4 +
 hw/mcb/trace.h           |   1 +
 hw/meson.build           |   1 +
 hw/watchdog/Kconfig      |   5 +
 hw/watchdog/meson.build  |   1 +
 hw/watchdog/trace-events |   6 +
 hw/watchdog/wdt_z069.c   | 207 +++++++++++++++++++++++++++
 include/hw/mcb/mcb.h     | 106 ++++++++++++++
 meson.build              |   1 +
 18 files changed, 949 insertions(+)
 create mode 100644 hw/char/serial-mcb.c
 create mode 100644 hw/mcb/Kconfig
 create mode 100644 hw/mcb/mcb-pci.c
 create mode 100644 hw/mcb/mcb.c
 create mode 100644 hw/mcb/meson.build
 create mode 100644 hw/mcb/trace-events
 create mode 100644 hw/mcb/trace.h
 create mode 100644 hw/watchdog/wdt_z069.c
 create mode 100644 include/hw/mcb/mcb.h

-- 
2.39.2


