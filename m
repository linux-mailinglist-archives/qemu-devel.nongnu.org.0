Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F99D6DCA39
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 19:51:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plvec-00021c-Ec; Mon, 10 Apr 2023 13:50:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1plveU-0001z3-Dc
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 13:50:02 -0400
Received: from mail-ej1-f53.google.com ([209.85.218.53])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1plveS-0002E6-O0
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 13:50:02 -0400
Received: by mail-ej1-f53.google.com with SMTP id kt17so2005057ejb.11
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 10:50:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681148999;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JTbMOCUVIxh7OsQ3Tfh4PHu4vxt8WyGNwoUN1m5XVm8=;
 b=TVefQLLH7ASapOfX4AZS6DjFYygxS98t6LcenvESVHbbSVYizndlGU94O+Hr35NywV
 tt3C4wMkgU0RPGuwAwLla+0EVG41oXGaqDNd6qklTlDaZuJJY+LzrlFizxQ2hlqHn/nq
 Cu/twaDNFIlRIfixzLcq+6HGvRsRkGwscBnK1Zd4YvYqbJlIH0qgmdY/n099J6D4A2ow
 WWG8Rf22M+1J3BpGWy2y3BiUcpYZnCmILGjxlszP+ubgVT+zJDv/wUSLwMnjvC9IP0SM
 urLNE61o9hBhgdaez362q3DK2Log8uXwh4XlsS1h7EQCJRNU9GfXo5/3zlpgr05qDXBz
 HL8w==
X-Gm-Message-State: AAQBX9fd0R3jC+JPBiEIk3mdCGpxySkPeWTb8AkCdN0GhuvWsJcdnQlX
 45knXeGM1+2TCdeG0A7ZNSXKo/cvVscEzW0z
X-Google-Smtp-Source: AKy350ZrJ3/pJxTy7oO1W4cp5M7oAiByO+AATi62MRxHteX9UoRBocwtJ77+s/ZhOQ2N3bqLyN2/OQ==
X-Received: by 2002:a17:907:d403:b0:926:c9e4:f843 with SMTP id
 vi3-20020a170907d40300b00926c9e4f843mr8991042ejc.59.1681148999050; 
 Mon, 10 Apr 2023 10:49:59 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-82-135-86-174.dynamic.mnet-online.de. [82.135.86.174])
 by smtp.googlemail.com with ESMTPSA id
 n19-20020a509353000000b005002daeb27asm5129282eda.37.2023.04.10.10.49.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 10:49:58 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 =?UTF-8?q?Jorge=20Sanjuan=20Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>
Subject: [PATCH v3 0/4] Add emulation of MEN Chameleon Hardware
Date: Mon, 10 Apr 2023 19:49:06 +0200
Message-Id: <20230410174910.4806-1-jth@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.218.53; envelope-from=morbidrsa@gmail.com;
 helo=mail-ej1-f53.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
- Adjusted license to GPL 2 or later (Peter)

Changes since v1:
- Converted DPRINTF() to tracing infrastructure (Alistair)
- Fixed style issues (Alistair)

Johannes Thumshirn (4):
  Add MEN Chameleon Bus emulation
  Add MEN Chameleon Bus via PCI carrier
  serial-mcb: Add serial via MEN chameleon bus
  wdt_z069: Add support for MEN 16z069 Watchdog

 MAINTAINERS             |   6 +
 hw/Kconfig              |   1 +
 hw/char/Kconfig         |   6 +
 hw/char/meson.build     |   1 +
 hw/char/serial-mcb.c    | 115 ++++++++++++++++
 hw/mcb/Kconfig          |   8 ++
 hw/mcb/mcb-pci.c        | 297 ++++++++++++++++++++++++++++++++++++++++
 hw/mcb/mcb.c            | 182 ++++++++++++++++++++++++
 hw/mcb/meson.build      |   2 +
 hw/mcb/trace-events     |   3 +
 hw/mcb/trace.h          |   1 +
 hw/meson.build          |   1 +
 hw/watchdog/Kconfig     |   5 +
 hw/watchdog/meson.build |   1 +
 hw/watchdog/wdt_z069.c  | 218 +++++++++++++++++++++++++++++
 include/hw/mcb/mcb.h    | 106 ++++++++++++++
 meson.build             |   1 +
 17 files changed, 954 insertions(+)
 create mode 100644 hw/char/serial-mcb.c
 create mode 100644 hw/mcb/Kconfig
 create mode 100644 hw/mcb/mcb-pci.c
 create mode 100644 hw/mcb/mcb.c
 create mode 100644 hw/mcb/meson.build
 create mode 100644 hw/mcb/trace-events
 create mode 100644 hw/mcb/trace.h
 create mode 100644 hw/watchdog/wdt_z069.c
 create mode 100644 include/hw/mcb/mcb.h


base-commit: 652737c8090eb3792f8b4c4b22ab12d7cc32073f
-- 
2.39.2


