Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6063E6F4654
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 16:49:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptrJh-0007Dr-8f; Tue, 02 May 2023 10:49:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptrJe-0007DQ-Pb
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:49:18 -0400
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ptrJb-0003Dq-Ik
 for qemu-devel@nongnu.org; Tue, 02 May 2023 10:49:18 -0400
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f315735514so172985925e9.1
 for <qemu-devel@nongnu.org>; Tue, 02 May 2023 07:49:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683038953; x=1685630953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jRExTv0m9MJ379HfuWLDoXaw1Snt07Cu+ypzDLK4Nbk=;
 b=VqeDL2TLqj+Q/yM6NtAK64nIgIWGSR4bZORsne6EQxwcYq86UYBoN5k6LkGEeMKmPN
 wt6+9pxM8edm2M2opay7ZczLrT33L2B0quAo/xhokjweLPsfy9NGUaFm8eK6WXvavHqt
 2lt+tX5X01G5HFYHBzX76idmUix1ylyrOGI69uJOyYEdTLNIZn/6OZjB9X4XJ3wSKre7
 IBYS3tMqzN/JcwxErSrBGySXtv+HWrYPPfDzw4lZFjJyviLU4839L6UwXlGtnt9sa+sq
 RorZY0iMqMHY59gqJqWPDAWqgS4hQ03HC4xJOHapdojR1tIjqkuDNbL1ffndQx5JLaBS
 /soA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683038953; x=1685630953;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jRExTv0m9MJ379HfuWLDoXaw1Snt07Cu+ypzDLK4Nbk=;
 b=dQMdkpjRah2yxSxZUG19IrtLfo/vlQyzYl4S7swBkm3kOC7GUy6vnqVv9FlbIDt3J6
 7GPe3/ud/YiF1DyegRsE58ffamnL0r3Dd7wpSqDCqYJWTPh0mp0wrO415qD43uZOkCxX
 y9iopiWBp7TDY1m25EznQo2PnINyUJRbESHdMkes/N/g9OGzHWZZ0k8WSu02zSOk1FR8
 ZXeYhkKKy8bSTgE4DbZBe7hyZm0Ol7RVXP+dgUh7+S61v0Yu4lLEx6i1O5RepygFZhBv
 6rNBEHJHabq42PDdbCUft7VeViFYwzIpGYISWN+F3rEuIXY2/56oIGfRmZxgqrsHxhNJ
 s8ww==
X-Gm-Message-State: AC+VfDxHi3Q+Vn2ZRvp51OBUd/ulv3yO1JpIVrMakd6irp/+pvJ/objC
 9Dyw2k+maE0s1n03Yl+vIQtlQ/VWczBahBRUmiA=
X-Google-Smtp-Source: ACHHUZ6Mw+IBNd+BxqbP5f5gxtUH++WNIX/aJS986aLzEMjf18C5PCDHwu3oxSy2Ty74vvWrXwzj5w==
X-Received: by 2002:a5d:5223:0:b0:2fe:c8b5:b5da with SMTP id
 i3-20020a5d5223000000b002fec8b5b5damr12282855wra.13.1683038952674; 
 Tue, 02 May 2023 07:49:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 t10-20020a05600001ca00b002fab755e10bsm31030062wrx.68.2023.05.02.07.49.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 07:49:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL v2 00/34] target-arm queue
Date: Tue,  2 May 2023 15:49:11 +0100
Message-Id: <20230502144911.2454625-1-peter.maydell@linaro.org>
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
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

v2 changes: dropped the patch that enables the new 'notcg' CI test:
it doesn't pass on our aarch64 runner because the CI runner doesn't
have access to /dev/kvm.

thanks
-- PMM

The following changes since commit 7c18f2d663521f1b31b821a13358ce38075eaf7d:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-04-29 23:07:17 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230502-2

for you to fetch changes up to a4ae17e5ec512862bf73e40dfbb1e7db71f2c1e7:

  hw/net/allwinner-sun8i-emac: Correctly byteswap descriptor fields (2023-05-02 15:47:41 +0100)

----------------------------------------------------------------
target-arm queue:
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

 docs/about/deprecated.rst                   |  43 +-
 docs/user/main.rst                          |  14 +-
 configs/devices/aarch64-softmmu/default.mak |   4 -
 configs/devices/arm-softmmu/default.mak     |  39 --
 qapi/run-state.json                         |  16 +-
 accel/tcg/internal.h                        |   2 +
 include/exec/cpu-common.h                   |   2 -
 include/hw/arm/boot.h                       |  49 ++
 include/hw/misc/bcm2835_property.h          |   1 +
 include/monitor/hmp.h                       |   2 +-
 target/arm/cpregs.h                         |   6 +
 target/arm/internals.h                      |  10 +-
 target/arm/translate-a32.h                  |  24 +-
 accel/tcg/cpu-exec.c                        |   2 +-
 accel/tcg/monitor.c                         |  14 +
 accel/tcg/tcg-all.c                         |  23 +
 bsd-user/main.c                             |  14 +-
 hw/arm/aspeed.c                             |  38 +-
 hw/arm/bcm2835_peripherals.c                |   2 +
 hw/arm/bcm2836.c                            |   2 +
 hw/arm/boot.c                               |  35 +-
 hw/arm/raspi.c                              |  66 +--
 hw/arm/virt.c                               |   6 +-
 hw/intc/allwinner-a10-pic.c                 |   7 +-
 hw/misc/bcm2835_property.c                  |  13 +-
 hw/net/allwinner-sun8i-emac.c               |  22 +-
 hw/net/msf2-emac.c                          |  16 +-
 hw/net/npcm7xx_emc.c                        |  32 +-
 hw/sd/allwinner-sdhost.c                    |  31 +-
 linux-user/main.c                           |  18 +-
 softmmu/globals.c                           |   1 -
 softmmu/runstate-hmp-cmds.c                 |  25 +-
 softmmu/runstate.c                          |  10 +-
 softmmu/vl.c                                |  17 +-
 target/arm/cortex-regs.c                    |  69 +++
 target/arm/cpu64.c                          | 702 +--------------------------
 target/arm/{cpu_tcg.c => tcg/cpu32.c}       |  72 +--
 target/arm/tcg/cpu64.c                      | 723 ++++++++++++++++++++++++++++
 target/arm/tcg/translate.c                  |   4 +-
 tests/qtest/arm-cpu-features.c              |  20 +-
 tests/qtest/bios-tables-test.c              |  11 +-
 tests/qtest/boot-serial-test.c              |   5 +
 tests/qtest/migration-test.c                |   9 +-
 tests/qtest/pxe-test.c                      |   8 +-
 tests/qtest/test-hmp.c                      |   1 +
 tests/qtest/vmgenid-test.c                  |   9 +-
 hmp-commands.hx                             |  25 +-
 hw/arm/Kconfig                              |  43 +-
 qemu-options.hx                             |  12 +-
 target/arm/Kconfig                          |   7 +
 target/arm/meson.build                      |   2 +-
 target/arm/tcg/meson.build                  |   2 +
 tcg/tci/README                              |   2 +-
 tests/avocado/migration.py                  |  83 +++-
 tests/qtest/meson.build                     |   3 +-
 55 files changed, 1438 insertions(+), 980 deletions(-)
 create mode 100644 target/arm/cortex-regs.c
 rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (93%)
 create mode 100644 target/arm/tcg/cpu64.c

