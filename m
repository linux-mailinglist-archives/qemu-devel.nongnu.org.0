Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E846F6CDA24
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Mar 2023 15:09:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phVX7-0000q8-Ip; Wed, 29 Mar 2023 09:08:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1phRRV-0007zu-Tc
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 04:46:05 -0400
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morbidrsa@gmail.com>)
 id 1phRRU-00046N-9L
 for qemu-devel@nongnu.org; Wed, 29 Mar 2023 04:46:05 -0400
Received: by mail-wm1-f47.google.com with SMTP id n19so8428093wms.0
 for <qemu-devel@nongnu.org>; Wed, 29 Mar 2023 01:46:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680079562;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=140bPVSIs6Eo1pjPo1YEio3Cz3eQUpsI3MG7QwIxv38=;
 b=cTqdYnCLDqF30IvACSIR5p2fJXbfJZWlWNfU23Nj8mQp2bqNDOR73ZB7EKhWmFM8KX
 awtaBqh3zV2LQB8vzO1dgb/pL4dE+mfiNv5zSb8g/yA4D1/ifq4kiGji/gHfNLClf1UZ
 TUmbCV3WkmbSYW7M1hEyEwpYlYvqiKm2tQsxbNenrbbi64FzpnYhKfWfdcboB56Raozd
 LChMp1VB5+QAuI4z6uQdI3gSd4H3vf7mjKVTigXqMZ6iH0Q16HzppJyikepfFmc6cuaR
 dZ8ABfZTX9yfhnpwSM/xsTQDyhM86Ij08nXArfcWdNxfyniC4w4ff+Qj04hnKJQ851IF
 LGUw==
X-Gm-Message-State: AAQBX9faMSWiHj9vxUDQsHixt3iZkmrSo+efeGJRtoekvteMR/v1bfQc
 SqMl0g2tX8hPbxQ6pLS+saQUva+8ynveGQ==
X-Google-Smtp-Source: AKy350bg6gyjKvUXu4BdAh5nW19NEk3jomvrIZSgyjIra8fHR8DyxT+KLYzcYlJPBXhYNXfttbqE9Q==
X-Received: by 2002:a05:600c:21cd:b0:3ef:6e1c:3fe9 with SMTP id
 x13-20020a05600c21cd00b003ef6e1c3fe9mr8072442wmj.16.1680079562057; 
 Wed, 29 Mar 2023 01:46:02 -0700 (PDT)
Received: from localhost.localdomain
 (aftr-82-135-86-174.dynamic.mnet-online.de. [82.135.86.174])
 by smtp.googlemail.com with ESMTPSA id
 n30-20020a05600c501e00b003edc9a5f98asm1466280wmr.44.2023.03.29.01.46.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 01:46:01 -0700 (PDT)
From: Johannes Thumshirn <jth@kernel.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair@alistair23.me>,
 Javier Rodriguez <josejavier.rodriguez@duagon.com>,
 Dmitry Fomichev <dmitry.fomichev@wdc.com>,
 Johannes Thumshirn <jth@kernel.org>
Subject: [PATCH 0/4] Add emulation of MEN Chameleon Hardware
Date: Wed, 29 Mar 2023 10:45:09 +0200
Message-Id: <20230329084513.7835-1-jth@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.128.47; envelope-from=morbidrsa@gmail.com;
 helo=mail-wm1-f47.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 29 Mar 2023 09:08:07 -0400
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

Johannes Thumshirn (4):
  Add MEN Chameleon Bus emulation
  Add MEN Chameleon Bus via PCI carrier
  serial-mcb: Add serial via MEN chameleon bus
  wdt_z069: Add support for MEN 16z069 Watchdog

 MAINTAINERS             |   6 +
 hw/Kconfig              |   1 +
 hw/char/Kconfig         |   6 +
 hw/char/meson.build     |   1 +
 hw/char/serial-mcb.c    | 115 +++++++++++++++
 hw/mcb/Kconfig          |   8 ++
 hw/mcb/mcb-pci.c        | 307 ++++++++++++++++++++++++++++++++++++++++
 hw/mcb/mcb.c            | 182 ++++++++++++++++++++++++
 hw/mcb/meson.build      |   2 +
 hw/meson.build          |   1 +
 hw/watchdog/Kconfig     |   5 +
 hw/watchdog/meson.build |   1 +
 hw/watchdog/wdt_z069.c  | 218 ++++++++++++++++++++++++++++
 include/hw/mcb/mcb.h    | 106 ++++++++++++++
 14 files changed, 959 insertions(+)
 create mode 100644 hw/char/serial-mcb.c
 create mode 100644 hw/mcb/Kconfig
 create mode 100644 hw/mcb/mcb-pci.c
 create mode 100644 hw/mcb/mcb.c
 create mode 100644 hw/mcb/meson.build
 create mode 100644 hw/watchdog/wdt_z069.c
 create mode 100644 include/hw/mcb/mcb.h

-- 
2.39.2


