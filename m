Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D3CF6D92CF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 11:34:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkLzE-0001ow-7Q; Thu, 06 Apr 2023 05:32:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1pkLzC-0001oi-BJ
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:32:54 -0400
Received: from mail-wm1-f46.google.com ([209.85.128.46])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1pkLzA-0006qg-Hw
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 05:32:53 -0400
Received: by mail-wm1-f46.google.com with SMTP id
 i5-20020a05600c354500b003edd24054e0so25189202wmq.4
 for <qemu-devel@nongnu.org>; Thu, 06 Apr 2023 02:32:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680773570;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nhthalH//vyRAfoqK1ee+1ZEpriCLUxfDBX4GUo7IxA=;
 b=kVUjRQoFQP0ZMVdXT7AKY60OiL1TvdCe5+BZjBkZcRe8JIxr7o8D7XyPh1OfD5HL8+
 UzOTwzm+o87nFKBUNYPm6E2NVJN8vKLMxhFFneepRt0xfu0yCvS5MVA+iq0F93rOsJg3
 FseXMpuG3lI0ZybEaApoRVg6gdQaA9h7xKin5YEnyKI4za91Bbl3etbQEtG/J+ynYAxH
 0eR2sP8XCAAifXYBOCGnjlQFoYEWZi8uTEajYmrYuiy6CpfFTAE5as0XisuGgwS/FvZ0
 hh/hjs2UYcbJj2KZhzOtj7JoSjSGqpXkpn8TA5M3D3370CQ1oOJA1l0DxgCmCmSp7xis
 60QQ==
X-Gm-Message-State: AAQBX9f+Du3husG5XPTXbGxB6X/ehvbdtsPtMBAASnZaE7GMiL31EQBC
 Ck9NfC587pklOkrzOshVAPCX0kIVVw1fNVhv
X-Google-Smtp-Source: AKy350YAxBMKWSknia119RYrFNePFNJwaikfDtVYnIkq+cyuEye7RIjmOXsgqcIZb/IG5KJ/a458vQ==
X-Received: by 2002:a05:600c:cc:b0:3eb:39e7:35fe with SMTP id
 u12-20020a05600c00cc00b003eb39e735femr6903614wmm.30.1680773570046; 
 Thu, 06 Apr 2023 02:32:50 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-82-135-86-174.dynamic.mnet-online.de. [82.135.86.174])
 by smtp.googlemail.com with ESMTPSA id
 g6-20020a05600c4ec600b003edc4788fa0sm4914832wmq.2.2023.04.06.02.32.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 02:32:49 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 =?UTF-8?q?Jorge=20Sanjuan=20Garc=C3=ADa?= <Jorge.SanjuanGarcia@duagon.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>
Subject: [PATCH v2 0/4] Add emulation of MEN Chameleon Hardware
Date: Thu,  6 Apr 2023 11:31:53 +0200
Message-Id: <20230406093157.104145-1-jth@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.46; envelope-from=morbidrsa@gmail.com;
 helo=mail-wm1-f46.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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


