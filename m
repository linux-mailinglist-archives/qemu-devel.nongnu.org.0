Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C23456F4384
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 14:16:39 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptoua-0003lW-I6; Tue, 02 May 2023 08:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouV-0003kA-Kg
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:11 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptouN-0002zl-CS
 for qemu-devel@nongnu.org; Tue, 02 May 2023 08:15:11 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f1e2555b5aso23993325e9.0
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 05:15:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683029701; x=1685621701;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=a1T+JdFgle2qar7hfdtcGiZWGi+Z2TGQmR9bm+IBt4A=;
 b=Xa+QtDTfP4QpjKUsYJNRi5ljI8glOBxZJVo/wIxundsIVvpJvevz+FKUoMpj0hjhx3
 F1sf+3UNp9zGOQFKlJIQZxUrK7usNqQb4SBuKvlEyid7OmIvBkkcl/V+1Jt5102JD+7V
 yvHKO+NYjBSEOktAfIr51wWJitrQUCuc1mRSIVcwZjq4SE0fp8di7XO442spx8tFeJu6
 y7T1FlKY/I2Fwz6dRhETmfQYTOmmmmEvUHSxpk3OpSbrGfNQeNnZ0JC/bwnQFVMT8g7f
 7Dn9kYfDgzUa/Lc4ljHhGfCEEI6rIjkCJ07x0kH2nZq9nCbDTJKywIpWcseYmyPJLLsG
 vwEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683029701; x=1685621701;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=a1T+JdFgle2qar7hfdtcGiZWGi+Z2TGQmR9bm+IBt4A=;
 b=R/HcdhT7MYJLpWN3tRiT85Lex3M8DfEaIqDFFnqax1Zr57hRnnY1n0fxMDkBFJXtnj
 N1aHTg4iz5ik6VbZW9QGmjcy694di0IRxCz5DfzYWbeR9zbWQYu8AultE4aWlfYx8A1e
 08jrWAj3UNXu/ATY9hSMAlfx/ZbfVvmGEd4kUe25DcKS6mydxRTSmBwgGBLwmA/EW2FJ
 bWJ3UJYlTYv+0ClhsfuvSVi0La091em0L58x55OkdzJvSeNtOlMwIHeMgBke6pXaZTK4
 bSvuqvJGvsDLtfuCFpIys+TXzI/Xtjme/0ySFRnXEQ1eU/Wi/BCyQhHdqK4mmwR0J1Vv
 SMYA==
X-Gm-Message-State: AC+VfDzNTnfcklcJMIPcvE3nBc0kMX16ysfOnGnm7eKSqZGiB2ie34Fe
 fj04ApMbPNxc9epF9Abe9Dfl382cCo/ROzptf0Y=
X-Google-Smtp-Source: ACHHUZ6ZLZG8FOjOmDb6aScroJx6WIszc0rYPTgAMp0qbH4cbvVsQK3aG+ug6Pzi5bLVGPm/wHBrGw==
X-Received: by 2002:a1c:7404:0:b0:3f1:92aa:4eb8 with SMTP id
 p4-20020a1c7404000000b003f192aa4eb8mr12901014wmc.16.1683029701174; 
 Tue, 02 May 2023 05:15:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a7bc4ca000000b003f171234a08sm35040330wmk.20.2023.05.02.05.15.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 05:15:00 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/35] target-arm queue
Date: Tue,  2 May 2023 13:14:24 +0100
Message-Id: <20230502121459.2422303-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Hi; here's an arm pullreq. The big bits here are Fabiano's
CONFIG_TCG=n patches and my set that deprecate -singlestep;
other than that there's a collection of smaller bugfixes.

thanks
-- PMM

The following changes since commit 7c18f2d663521f1b31b821a13358ce38075eaf7d:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-04-29 23:07:17 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230502-1

for you to fetch changes up to 0ab99e4252f21550f2c16f859cbcdd3cced9f8bf:

  hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields (2023-05-02 13:10:42 +0100)

----------------------------------------------------------------
 * Support building Arm targets with CONFIG_TCG=no (ie KVM only)
 * hw/net: npcm7xx_emc: set MAC in register space
 * hw/arm/bcm2835_property: Implement "get command line" message
 * Deprecate the '-singlestep' command line option in favour of
   '-one-insn-per-tb' and '-accel one-insn-per-tb=on'
 * Deprecate 'singlestep' member of QMP StatusInfo struct
 * docs/about/deprecated.rst: Add "since 7.1" tag to dtb-kaslr-seed deprecation
 * hw/net/msf2-emac: Don't modify descriptor in-place in emac_store_desc()
 * raspi, aspeed: Write bootloader code correctly on big-endian hosts
 * hw/intc/allwinner-a10-pic: Fix bug on big-endian hosts
 * Fix bug in A32 ERET on big-endian hosts that caused guest crash
 * hw/sd/allwinner-sdhost: Correctly byteswap descriptor fields
 * hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields

----------------------------------------------------------------
Claudio Fontana (1):
      target/arm: move cpu_tcg to tcg/cpu32.c

Cédric Le Goater (2):
      hw/arm/boot: Make write_bootloader() public as arm_write_bootloader()
      hw/arm/aspeed: Use arm_write_bootloader() to write the bootloader

Daniel Bertalan (1):
      hw/arm/bcm2835_property: Implement "get command line" message

Fabiano Rosas (11):
      target/arm: Move cortex sysregs into a separate file
      target/arm: Remove dead code from cpu_max_set_sve_max_vq
      target/arm: Extract TCG -cpu max code into a function
      target/arm: Do not expose all -cpu max features to qtests
      target/arm: Move 64-bit TCG CPUs into tcg/
      tests/qtest: Adjust and document query-cpu-model-expansion test for arm
      tests/qtest: Fix tests when no KVM or TCG are present
      tests/avocado: Pass parameters to migration test
      arm/Kconfig: Always select SEMIHOSTING when TCG is present
      arm/Kconfig: Do not build TCG-only boards on a KVM-only build
      tests/qtest: Restrict tpm-tis-i2c-test to CONFIG_TCG

Patrick Venture (1):
      hw/net: npcm7xx_emc: set MAC in register space

Peter Maydell (18):
      make one-insn-per-tb an accel option
      softmmu: Don't use 'singlestep' global in QMP and HMP commands
      accel/tcg: Use one_insn_per_tb global instead of old singlestep global
      linux-user: Add '-one-insn-per-tb' option equivalent to '-singlestep'
      bsd-user: Add '-one-insn-per-tb' option equivalent to '-singlestep'
      Document that -singlestep command line option is deprecated
      accel/tcg: Report one-insn-per-tb in 'info jit', not 'info status'
      hmp: Add 'one-insn-per-tb' command equivalent to 'singlestep'
      qapi/run-state.json: Fix missing newline at end of file
      qmp: Deprecate 'singlestep' member of StatusInfo
      docs/about/deprecated.rst: Add "since 7.1" tag to dtb-kaslr-seed deprecation
      hw/net/msf2-emac: Don't modify descriptor in-place in emac_store_desc()
      hw/arm/raspi: Use arm_write_bootloader() to write boot code
      hw/intc/allwinner-a10-pic: Don't use set_bit()/clear_bit()
      target/arm: Define and use new load_cpu_field_low32()
      target/arm: Add compile time asserts to load/store_cpu_field macros
      hw/sd/allwinner-sdhost: Correctly byteswap descriptor fields
      hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields

Philippe Mathieu-Daudé (1):
      gitlab-ci: Check building KVM-only aarch64 target

 docs/about/deprecated.rst                          |  43 +-
 docs/user/main.rst                                 |  14 +-
 configs/devices/aarch64-softmmu/default.mak        |   4 -
 configs/devices/arm-softmmu/default.mak            |  39 --
 qapi/run-state.json                                |  16 +-
 accel/tcg/internal.h                               |   2 +
 include/exec/cpu-common.h                          |   2 -
 include/hw/arm/boot.h                              |  49 ++
 include/hw/misc/bcm2835_property.h                 |   1 +
 include/monitor/hmp.h                              |   2 +-
 target/arm/cpregs.h                                |   6 +
 target/arm/internals.h                             |  10 +-
 target/arm/translate-a32.h                         |  24 +-
 accel/tcg/cpu-exec.c                               |   2 +-
 accel/tcg/monitor.c                                |  14 +
 accel/tcg/tcg-all.c                                |  23 +
 bsd-user/main.c                                    |  14 +-
 hw/arm/aspeed.c                                    |  38 +-
 hw/arm/bcm2835_peripherals.c                       |   2 +
 hw/arm/bcm2836.c                                   |   2 +
 hw/arm/boot.c                                      |  35 +-
 hw/arm/raspi.c                                     |  66 +-
 hw/arm/virt.c                                      |   6 +-
 hw/intc/allwinner-a10-pic.c                        |   7 +-
 hw/misc/bcm2835_property.c                         |  13 +-
 hw/net/allwinner-sun8i-emac.c                      |  22 +-
 hw/net/msf2-emac.c                                 |  16 +-
 hw/net/npcm7xx_emc.c                               |  32 +-
 hw/sd/allwinner-sdhost.c                           |  31 +-
 linux-user/main.c                                  |  18 +-
 softmmu/globals.c                                  |   1 -
 softmmu/runstate-hmp-cmds.c                        |  25 +-
 softmmu/runstate.c                                 |  10 +-
 softmmu/vl.c                                       |  17 +-
 target/arm/cortex-regs.c                           |  69 ++
 target/arm/cpu64.c                                 | 702 +-------------------
 target/arm/{cpu_tcg.c => tcg/cpu32.c}              |  72 +-
 target/arm/tcg/cpu64.c                             | 723 +++++++++++++++++++++
 target/arm/tcg/translate.c                         |   4 +-
 tests/qtest/arm-cpu-features.c                     |  20 +-
 tests/qtest/bios-tables-test.c                     |  11 +-
 tests/qtest/boot-serial-test.c                     |   5 +
 tests/qtest/migration-test.c                       |   9 +-
 tests/qtest/pxe-test.c                             |   8 +-
 tests/qtest/test-hmp.c                             |   1 +
 tests/qtest/vmgenid-test.c                         |   9 +-
 .gitlab-ci.d/crossbuilds.yml                       |  11 +
 .../custom-runners/ubuntu-22.04-aarch64.yml        |   4 -
 hmp-commands.hx                                    |  25 +-
 hw/arm/Kconfig                                     |  43 +-
 qemu-options.hx                                    |  12 +-
 target/arm/Kconfig                                 |   7 +
 target/arm/meson.build                             |   2 +-
 target/arm/tcg/meson.build                         |   2 +
 tcg/tci/README                                     |   2 +-
 tests/avocado/migration.py                         |  83 ++-
 tests/qtest/meson.build                            |   3 +-
 57 files changed, 1449 insertions(+), 984 deletions(-)
 create mode 100644 target/arm/cortex-regs.c
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (93%)
 create mode 100644 target/arm/tcg/cpu64.c

