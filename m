Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1FD6A4394
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:02:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe4p-0000Y6-Qb; Mon, 27 Feb 2023 09:02:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe3x-0000Mu-TG
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:09 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pWe3v-0007WC-62
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:01:09 -0500
Received: by mail-wr1-x42b.google.com with SMTP id q16so6348172wrw.2
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=Z0k1aTyZKEjD0myPdSHlY6yzM7necFKC8IWq8PTMo4U=;
 b=JwKpZrbWmT5F1RRBDylywtfEYWkMCuVlteuIqpr6bXmBbADlcba66E1hWFqOQHrVjr
 RGH4LLhG2fOw6FVrjpTK1812vMvoK9mtbUgM0pkGktq3oL4qbvVRqHyfjkBbJXERDVNd
 745v6LKYTk9r2zcSSIV340o8MkaddXEocAYWQaQ9T4U60Y6c1EwnrjZGq0a0fzmPtyP4
 KG9a4SJpmXfd/yw27gFniE7u3PXSbNfja8ehsOiNpBNYx5OtM10Hyn74ZDlzEKOCUkZZ
 Dk/4YK4bH7HzKOA+xGbQH8ccjqXYp0x2gjR00dL1Di4A6+smvj2yMb6I3LwjjgfwZzVw
 emTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Z0k1aTyZKEjD0myPdSHlY6yzM7necFKC8IWq8PTMo4U=;
 b=BgP63mlGXKZKxxi1MPwsya8MH4OuLs9MyFwOshpEthzh94NFGD1/3otRgtk5skAOL7
 N+XHywcqUejWPf8495ExIfeCjTjw+EGLzS0riehe8q9eeWUQHzGoCCmDtIqpKIga94S8
 ad+qztKxLdv3rtzLDSpJdHuUwNp5UuwedghcHmgQwqW6xPw9FtkMG4PSkUi1jYyEg/Sk
 6SlLBrGoQ0C4exfgmPI4gO0Uqt0AWwXXFnoEn+swyq7ap4SgP19qQT1uJRoVwoVRm6RT
 L9n5HevSmeVBr1i+P71cEAZEpDW3qIPs52ar9FAE7UULyBEmUrHIuVd+aJQIjFIkkHjk
 2yyw==
X-Gm-Message-State: AO0yUKUIIv6Q5VItV5OK8C6hCCthVSSiZ2R9PouUsw3M9zCOAAc8UnDG
 VXB8ugj2eE9EZnItaft4D23fDM8XLXlU1bdF
X-Google-Smtp-Source: AK7set+rHk9cThjB0y2nlG4B8xGnClApEVmR+RDLj8eq8RGiAe0RJ9wGpMDyfaWhtZxzLOQHelu+mA==
X-Received: by 2002:a5d:66c7:0:b0:2c7:11ae:9fd8 with SMTP id
 k7-20020a5d66c7000000b002c711ae9fd8mr12465827wrw.8.1677506465047; 
 Mon, 27 Feb 2023 06:01:05 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 s9-20020a5d4249000000b002c5598c14acsm7158514wrr.6.2023.02.27.06.01.03
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Feb 2023 06:01:03 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/25] target-arm queue
Date: Mon, 27 Feb 2023 14:00:37 +0000
Message-Id: <20230227140102.3712344-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The following changes since commit b11728dc3ae67ddedf34b7a4f318170e7092803c:

  Merge tag 'pull-riscv-to-apply-20230224' of github.com:palmer-dabbelt/qemu into staging (2023-02-26 20:14:46 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git pull-target-arm-20230227

for you to fetch changes up to e844f0c5d0bd2c4d8d3c1622eb2a88586c9c4677:

  hw: Replace qemu_or_irq typedef by OrIRQState (2023-02-27 13:27:05 +0000)

----------------------------------------------------------------
target-arm queue:
 * Various code cleanups
 * More refactoring working towards allowing a build
   without CONFIG_TCG

----------------------------------------------------------------
Claudio Fontana (2):
      target/arm: move helpers to tcg/
      target/arm: Move psci.c into the tcg directory

Fabiano Rosas (9):
      target/arm: Wrap breakpoint/watchpoint updates with tcg_enabled
      target/arm: Wrap TCG-only code in debug_helper.c
      target/arm: move translate modules to tcg/
      target/arm: Wrap arm_rebuild_hflags calls with tcg_enabled
      target/arm: Move hflags code into the tcg directory
      target/arm: Move regime_using_lpae_format into internal.h
      target/arm: Don't access TCG code when debugging with KVM
      cpu-defs.h: Expose CPUTLBEntryFull to non-TCG code
      tests/avocado: add machine:none tag to version.py

Philippe Mathieu-Daudé (13):
      hw/gpio/max7310: Simplify max7310_realize()
      hw/char/pl011: Un-inline pl011_create()
      hw/char/pl011: Open-code pl011_luminary_create()
      hw/char/xilinx_uartlite: Expose XILINX_UARTLITE QOM type
      hw/char/xilinx_uartlite: Open-code xilinx_uartlite_create()
      hw/char/cmsdk-apb-uart: Open-code cmsdk_apb_uart_create()
      hw/timer/cmsdk-apb-timer: Remove unused 'qdev-properties.h' header
      hw/intc/armv7m_nvic: Use QOM cast CPU() macro
      hw/arm/musicpal: Remove unused dummy MemoryRegion
      iothread: Remove unused IOThreadClass / IOTHREAD_CLASS
      hw/irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
      hw/or-irq: Declare QOM macros using OBJECT_DECLARE_SIMPLE_TYPE()
      hw: Replace qemu_or_irq typedef by OrIRQState

Thomas Huth (1):
      include/hw/arm/allwinner-a10.h: Remove superfluous includes from the header

 MAINTAINERS                              |   1 +
 include/exec/cpu-defs.h                  |   6 +
 include/hw/arm/allwinner-a10.h           |   2 -
 include/hw/arm/armsse.h                  |   6 +-
 include/hw/arm/bcm2835_peripherals.h     |   2 +-
 include/hw/arm/exynos4210.h              |   4 +-
 include/hw/arm/stm32f205_soc.h           |   2 +-
 include/hw/arm/stm32f405_soc.h           |   2 +-
 include/hw/arm/xlnx-versal.h             |   6 +-
 include/hw/arm/xlnx-zynqmp.h             |   2 +-
 include/hw/char/cmsdk-apb-uart.h         |  34 ---
 include/hw/char/pl011.h                  |  36 +--
 include/hw/char/xilinx_uartlite.h        |  22 +-
 include/hw/or-irq.h                      |   5 +-
 include/hw/timer/cmsdk-apb-timer.h       |   1 -
 target/arm/internals.h                   |  23 +-
 target/arm/{ => tcg}/translate-a64.h     |   0
 target/arm/{ => tcg}/translate.h         |   0
 target/arm/{ => tcg}/vec_internal.h      |   0
 target/arm/{ => tcg}/a32-uncond.decode   |   0
 target/arm/{ => tcg}/a32.decode          |   0
 target/arm/{ => tcg}/m-nocp.decode       |   0
 target/arm/{ => tcg}/mve.decode          |   0
 target/arm/{ => tcg}/neon-dp.decode      |   0
 target/arm/{ => tcg}/neon-ls.decode      |   0
 target/arm/{ => tcg}/neon-shared.decode  |   0
 target/arm/{ => tcg}/sme-fa64.decode     |   0
 target/arm/{ => tcg}/sme.decode          |   0
 target/arm/{ => tcg}/sve.decode          |   0
 target/arm/{ => tcg}/t16.decode          |   0
 target/arm/{ => tcg}/t32.decode          |   0
 target/arm/{ => tcg}/vfp-uncond.decode   |   0
 target/arm/{ => tcg}/vfp.decode          |   0
 hw/arm/allwinner-a10.c                   |   1 +
 hw/arm/boot.c                            |   6 +-
 hw/arm/exynos4210.c                      |   4 +-
 hw/arm/mps2-tz.c                         |   2 +-
 hw/arm/mps2.c                            |  41 ++-
 hw/arm/musicpal.c                        |   4 -
 hw/arm/stellaris.c                       |  11 +-
 hw/char/pl011.c                          |  17 ++
 hw/char/xilinx_uartlite.c                |   4 +-
 hw/core/irq.c                            |   9 +-
 hw/core/or-irq.c                         |  18 +-
 hw/gpio/max7310.c                        |   5 +-
 hw/intc/armv7m_nvic.c                    |  26 +-
 hw/microblaze/petalogix_s3adsp1800_mmu.c |   7 +-
 hw/pci-host/raven.c                      |   2 +-
 iothread.c                               |   4 -
 target/arm/arm-powerctl.c                |   7 +-
 target/arm/cpu.c                         |   9 +-
 target/arm/debug_helper.c                | 490 ++++++++++++++++---------------
 target/arm/helper.c                      | 411 +-------------------------
 target/arm/machine.c                     |  12 +-
 target/arm/ptw.c                         |   4 +
 target/arm/tcg-stubs.c                   |  27 ++
 target/arm/{ => tcg}/crypto_helper.c     |   0
 target/arm/{ => tcg}/helper-a64.c        |   0
 target/arm/tcg/hflags.c                  | 403 +++++++++++++++++++++++++
 target/arm/{ => tcg}/iwmmxt_helper.c     |   0
 target/arm/{ => tcg}/m_helper.c          |   0
 target/arm/{ => tcg}/mte_helper.c        |   0
 target/arm/{ => tcg}/mve_helper.c        |   0
 target/arm/{ => tcg}/neon_helper.c       |   0
 target/arm/{ => tcg}/op_helper.c         |   0
 target/arm/{ => tcg}/pauth_helper.c      |   0
 target/arm/{ => tcg}/psci.c              |   0
 target/arm/{ => tcg}/sme_helper.c        |   0
 target/arm/{ => tcg}/sve_helper.c        |   0
 target/arm/{ => tcg}/tlb_helper.c        |  18 --
 target/arm/{ => tcg}/translate-a64.c     |   0
 target/arm/{ => tcg}/translate-m-nocp.c  |   0
 target/arm/{ => tcg}/translate-mve.c     |   0
 target/arm/{ => tcg}/translate-neon.c    |   0
 target/arm/{ => tcg}/translate-sme.c     |   0
 target/arm/{ => tcg}/translate-sve.c     |   0
 target/arm/{ => tcg}/translate-vfp.c     |   0
 target/arm/{ => tcg}/translate.c         |   0
 target/arm/{ => tcg}/vec_helper.c        |   0
 target/arm/meson.build                   |  46 +--
 target/arm/tcg/meson.build               |  50 ++++
 tests/avocado/version.py                 |   1 +
 82 files changed, 918 insertions(+), 875 deletions(-)
 rename target/arm/{ => tcg}/translate-a64.h (100%)
 rename target/arm/{ => tcg}/translate.h (100%)
 rename target/arm/{ => tcg}/vec_internal.h (100%)
 rename target/arm/{ => tcg}/a32-uncond.decode (100%)
 rename target/arm/{ => tcg}/a32.decode (100%)
 rename target/arm/{ => tcg}/m-nocp.decode (100%)
 rename target/arm/{ => tcg}/mve.decode (100%)
 rename target/arm/{ => tcg}/neon-dp.decode (100%)
 rename target/arm/{ => tcg}/neon-ls.decode (100%)
 rename target/arm/{ => tcg}/neon-shared.decode (100%)
 rename target/arm/{ => tcg}/sme-fa64.decode (100%)
 rename target/arm/{ => tcg}/sme.decode (100%)
 rename target/arm/{ => tcg}/sve.decode (100%)
 rename target/arm/{ => tcg}/t16.decode (100%)
 rename target/arm/{ => tcg}/t32.decode (100%)
 rename target/arm/{ => tcg}/vfp-uncond.decode (100%)
 rename target/arm/{ => tcg}/vfp.decode (100%)
 create mode 100644 target/arm/tcg-stubs.c
 rename target/arm/{ => tcg}/crypto_helper.c (100%)
 rename target/arm/{ => tcg}/helper-a64.c (100%)
 create mode 100644 target/arm/tcg/hflags.c
 rename target/arm/{ => tcg}/iwmmxt_helper.c (100%)
 rename target/arm/{ => tcg}/m_helper.c (100%)
 rename target/arm/{ => tcg}/mte_helper.c (100%)
 rename target/arm/{ => tcg}/mve_helper.c (100%)
 rename target/arm/{ => tcg}/neon_helper.c (100%)
 rename target/arm/{ => tcg}/op_helper.c (100%)
 rename target/arm/{ => tcg}/pauth_helper.c (100%)
 rename target/arm/{ => tcg}/psci.c (100%)
 rename target/arm/{ => tcg}/sme_helper.c (100%)
 rename target/arm/{ => tcg}/sve_helper.c (100%)
 rename target/arm/{ => tcg}/tlb_helper.c (94%)
 rename target/arm/{ => tcg}/translate-a64.c (100%)
 rename target/arm/{ => tcg}/translate-m-nocp.c (100%)
 rename target/arm/{ => tcg}/translate-mve.c (100%)
 rename target/arm/{ => tcg}/translate-neon.c (100%)
 rename target/arm/{ => tcg}/translate-sme.c (100%)
 rename target/arm/{ => tcg}/translate-sve.c (100%)
 rename target/arm/{ => tcg}/translate-vfp.c (100%)
 rename target/arm/{ => tcg}/translate.c (100%)
 rename target/arm/{ => tcg}/vec_helper.c (100%)
 create mode 100644 target/arm/tcg/meson.build

