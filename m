Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959F06AFAAF
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 00:48:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZh1h-0008NF-15; Tue, 07 Mar 2023 18:47:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh1b-0008Lm-5n
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:19 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZh1Y-0002dl-Oc
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 18:47:18 -0500
Received: by mail-wr1-x433.google.com with SMTP id l1so13736923wry.12
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 15:47:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678232834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RhkH3Zu/yxEN0g7nAHoLic1bBvpCNancBoa/vvcJp4s=;
 b=uHsB93TaW5yo9XiTeXIL1TCBViogNs9lR/yMFnv0qWi3U+DmVUyOTgG7Hs5AJSfgvR
 3exmFpy31FuKux2dkDue7h8zcKJ1YIJfdv15bbfAjJwHXxWLE/muyHUqGCX04TsEnmjo
 1M2L9MH9RvQVPGGhzeCa64pTDnRLR5V1dFsTUmBHOdNcOkBh7Ki4nGTGt+qhdwlq4k06
 M2ia1ycdyPbLmyrMKfP9XoSi8ZFxJ0K1ANLapzxZ29KWXakMG/qG2iALvYv/Uj7asFl0
 pxD+2+8+4cTVpL9Og2xDlC/aWoA0/QOe02I6gxZrVRyhrm6RKTmv1u0BZmoDzIiqg3Kz
 kVnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678232834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RhkH3Zu/yxEN0g7nAHoLic1bBvpCNancBoa/vvcJp4s=;
 b=e9be5CkdYXxJbJCPpD1UK61xXklsJBash9PIK1rdI34kIBGCs3BVEG2+5GLmzvCszQ
 M1jMyRu12X1bAnULD+fKKk4idIxCsvcG0wCyLkSG/jij8sFWZ5IcXJlwWJkaDMRDDH/V
 O3xBbTrYyr2m1/hUjEXx2wHDPiZwjnOhp0mAsQcy8U3ZwkkmtF0LiEASW9hrskCrSBzi
 g6dMctPWZ7ZzzMoa0QQuWyNRWQEufejijTFl1STf51eAZ2S3Qp6sOokqmE7ceL6trt8a
 WnTMC3yLJN3NlD3xVXrNL7DKhfOQrdWu1UfYlUABqOhAjL0sXISyAJOvACwrxcyjjq/s
 Q7Kg==
X-Gm-Message-State: AO0yUKVv30pC3f1QESNvjr0wTa/FpWWlqeGXU0OFUhvJ+u/Xln0tobx+
 M/yKFfOGTWFjXeoav1Z3HRIVj/B7nQGQiLHY5VI=
X-Google-Smtp-Source: AK7set8uR0EFFaRmGA/j09ognTfcBuzrE9hnUVz0UEjv9H4U3zx0oTujCUKA+eRnyFg3QBEfFM8ULA==
X-Received: by 2002:a5d:4acf:0:b0:2c5:5b9d:70ee with SMTP id
 y15-20020a5d4acf000000b002c55b9d70eemr10289043wrs.22.1678232833980; 
 Tue, 07 Mar 2023 15:47:13 -0800 (PST)
Received: from localhost.localdomain (57.red-88-29-179.dynamicip.rima-tde.net.
 [88.29.179.57]) by smtp.gmail.com with ESMTPSA id
 q10-20020a5d658a000000b002c70851fdd8sm13698818wru.75.2023.03.07.15.47.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 07 Mar 2023 15:47:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>
Subject: [PULL 00/20] MIPS patches for 2023-03-07
Date: Wed,  8 Mar 2023 00:46:51 +0100
Message-Id: <20230307234711.55375-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8bd:

  Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-dabbelt/qemu into staging (2023-03-07 12:53:00 +0000)

are available in the Git repository at:

  https://github.com/philmd/qemu.git tags/mips-misc-20230308

for you to fetch changes up to cb9291e550c58825d6d7a6c9dc877705bd635376:

  log: Remove unneeded new line (2023-03-08 00:37:48 +0100)

----------------------------------------------------------------
MIPS (and few misc) patches

- MIPS
  - Remove obsolete "mips" board from target-mips.rst
  - Fix JALS32/J32/SWM32 instructions for microMIPS
  - Fix CP0.Config7.WII handling on pre-R6 cores

- HW
  - Revert "Remove intermediate IRQ forwarder" commits
  - Implement legacy LTIM Edge/Level Bank Select in Intel 8259 INTC
  - Improve PCI IRQ routing in VT82C686 / Pegasos II
  - Basic implementation of VIA AC97 audio playback
  - Implement 'resume on connection status change' in USB OHCI

- UI
  - Override windowDidResignKey

- memory
  - Dump HPA and access type in HMP 'info ramblock'

----------------------------------------------------------------

Akihiko Odaki (1):
  ui/cocoa: Override windowDidResignKey

BALATON Zoltan (7):
  Revert "hw/isa/vt82c686: Remove intermediate IRQ forwarder"
  hw/display/sm501: Add debug property to control pixman usage
  hw/isa/vt82c686: Implement PCI IRQ routing
  hw/ppc/pegasos2: Fix PCI interrupt routing
  hw/audio/via-ac97: Basic implementation of audio playback
  hw/usb/ohci: Implement resume on connection status change
  log: Remove unneeded new line

Bernhard Beschow (1):
  hw/usb/vt82c686-uhci-pci: Use PCI IRQ routing

David Woodhouse (1):
  hw/intc/i8259: Implement legacy LTIM Edge/Level Bank Select

Jiaxun Yang (1):
  docs/system: Remove "mips" board from target-mips.rst

Marcin Nowakowski (4):
  target/mips: Fix JALS32/J32 instruction handling for microMIPS
  target/mips: Fix SWM32 handling for microMIPS
  target/mips: Implement CP0.Config7.WII bit support
  target/mips: Set correct CP0.Config[4, 5] values for M14K(c)

Philippe Mathieu-Daudé (4):
  target/mips: Replace [g_]assert(0) -> g_assert_not_reached()
  hw/mips: Declare all length properties as unsigned
  hw/mips/itu: Pass SAAR using QOM link property
  Revert "hw/isa/i82378: Remove intermediate IRQ forwarder"

Ted Chen (1):
  memory: Dump HPA and access type of ramblocks

 docs/system/target-mips.rst     |  14 -
 hw/audio/trace-events           |   6 +
 hw/audio/via-ac97.c             | 455 +++++++++++++++++++++++++++++++-
 hw/display/sm501.c              |  18 +-
 hw/intc/i8259.c                 |  10 +-
 hw/intc/i8259_common.c          |  24 +-
 hw/intc/mips_gic.c              |   4 +-
 hw/isa/i82378.c                 |  10 +-
 hw/isa/trace-events             |   1 +
 hw/isa/vt82c686.c               |  54 +++-
 hw/mips/boston.c                |   2 +-
 hw/mips/cps.c                   |  35 +--
 hw/mips/malta.c                 |   2 +-
 hw/misc/mips_cmgcr.c            |   2 +-
 hw/misc/mips_itu.c              |  30 ++-
 hw/pci-host/mv64361.c           |   4 -
 hw/ppc/pegasos2.c               |  26 +-
 hw/usb/hcd-ohci.c               |  23 +-
 hw/usb/vt82c686-uhci-pci.c      |  12 -
 include/hw/intc/mips_gic.h      |   4 +-
 include/hw/isa/i8259_internal.h |   1 +
 include/hw/isa/vt82c686.h       |  25 ++
 include/hw/misc/mips_cmgcr.h    |   2 +-
 include/hw/misc/mips_itu.h      |   9 +-
 softmmu/physmem.c               |  14 +-
 target/mips/cpu-defs.c.inc      |  13 +-
 target/mips/cpu.c               |   4 +-
 target/mips/cpu.h               |   1 +
 target/mips/sysemu/physaddr.c   |   3 +-
 target/mips/tcg/ldst_helper.c   |   4 +-
 target/mips/tcg/msa_helper.c    | 104 ++++----
 target/mips/tcg/translate.c     |   8 +
 ui/cocoa.m                      |  11 +-
 util/log.c                      |   2 +-
 34 files changed, 768 insertions(+), 169 deletions(-)

-- 
2.38.1


