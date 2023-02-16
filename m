Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E84B699AD6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 18:12:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pShn9-0007ru-GK; Thu, 16 Feb 2023 12:11:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShn7-0007pN-ES
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:29 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pShn5-0007o5-CC
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 12:11:29 -0500
Received: by mail-wr1-x42d.google.com with SMTP id v30so1349249wrv.3
 for <qemu-devel@nongnu.org>; Thu, 16 Feb 2023 09:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=PH7GxR3y5f0vo2OY7LMyUMaIpf67fNxRcGkk2t/6PU0=;
 b=mAudssyeST5hAqzDHk2PRhPb30aR6KwgAC6Hak1gcH//VOtUlqBusUKMMmtZHtOSK3
 2bkgc/dYTr3B7K36m94uYdH0q6kII7AIDTAhfMnCFKAmxQ9g2dddL1idf/FM7uqREz4o
 aAhyPibA9lBVoFnv2Og6+C0hMSQEvwXElc7u3OoqFWtZJIhTmSiNhWo5qHNrWJBXHRiB
 qxuNYakSXRFENlaNJK+VHtkLCEqhAhfyKa1rqJw0eCR1wNkkuGMUhX3sbldBS/2wmimr
 2/cezeTFnhlxbHdycqtZ8Rv31w9hqSRjNEx34XtDYjgyNCbeMBieLqylayC/0WZmRXrm
 Xccg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PH7GxR3y5f0vo2OY7LMyUMaIpf67fNxRcGkk2t/6PU0=;
 b=psgoNPYOEbATGM+ry5hvaRmMHT24C+VPJDtgjkX4iPDvaSdTEQhUVa2/PqArtHS9Tz
 Kt2+6k6c/d0lUnRh3MiD/IfY5h9uga5wNwM+Se+9oZjgAwQxjVl8vYLwM5Aqj0FjGOOW
 sstpEUf1wRvloeZ9vw39BJbsJtOguuAY8zFP0kws2eOJbsY8a39WXyUYgGwZ0MQGtFCS
 TqTNdZkCj1CkL33KAs0kcETeiiz9GU09yERq77pXVj8JdYSLYv8xMsK3wGDFGJVZk2Lz
 6SEJRz6OQlSF3WStNyCcqmFeGeLOU4zTXZjE0wjcMTVgpY4+kgFKyTNmCNJUbnKzHYv8
 s3bg==
X-Gm-Message-State: AO0yUKUdc89N08uBbi2gDZyWwUISZHj6EjmrmnC2Y8cRfWYHIbp8iewW
 KXkfvAp/KKTTYppz8BJCC5Mtq7BAb58syaqL
X-Google-Smtp-Source: AK7set8QSXn9//q9Y9Opd4vEoeS/V3ZClKT7kNFDZu9Q9+UThWeAOsrymyrUZP/Sxjt0JHtX5B+I+Q==
X-Received: by 2002:a5d:6d0e:0:b0:2c3:f0a6:43ee with SMTP id
 e14-20020a5d6d0e000000b002c3f0a643eemr2819476wrq.20.1676567485618; 
 Thu, 16 Feb 2023 09:11:25 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a5d4dcc000000b002c556a4f1casm2049107wru.42.2023.02.16.09.11.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Feb 2023 09:11:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/30] target-arm queue
Date: Thu, 16 Feb 2023 17:10:53 +0000
Message-Id: <20230216171123.2518285-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

The following changes since commit 003ba52a8b327180e284630b289c6ece5a3e08b9:

  Merge tag 'for-upstream' of https://gitlab.com/bonzini/qemu into staging (2023-02-16 11:16:39 +0000)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230216

for you to fetch changes up to caf01d6a435d9f4a95aeae2f9fc6cb8b889b1fb8:

  tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG (2023-02-16 16:28:53 +0000)

----------------------------------------------------------------
target-arm queue:
 * Some mostly M-profile-related code cleanups
 * avocado: Retire the boot_linux.py AArch64 TCG tests
 * hw/arm/smmuv3: Add GBPA register
 * arm/virt: don't try to spell out the accelerator
 * hw/arm: Attach PSPI module to NPCM7XX SoC
 * Some cleanup/refactoring patches aiming towards
   allowing building Arm targets without CONFIG_TCG

----------------------------------------------------------------
Alex Bennée (1):
      tests/avocado: retire the Aarch64 TCG tests from boot_linux.py

Claudio Fontana (3):
      target/arm: rename handle_semihosting to tcg_handle_semihosting
      target/arm: wrap psci call with tcg_enabled
      target/arm: wrap call to aarch64_sve_change_el in tcg_enabled()

Cornelia Huck (1):
      arm/virt: don't try to spell out the accelerator

Fabiano Rosas (7):
      target/arm: Move PC alignment check
      target/arm: Move cpregs code out of cpu.h
      tests/avocado: Skip tests that require a missing accelerator
      tests/avocado: Tag TCG tests with accel:tcg
      target/arm: Use "max" as default cpu for the virt machine with KVM
      tests/qtest: arm-cpu-features: Match tests to required accelerators
      tests/qtest: Restrict tpm-tis-devices-{swtpm}-test to CONFIG_TCG

Hao Wu (3):
      MAINTAINERS: Add myself to maintainers and remove Havard
      hw/ssi: Add Nuvoton PSPI Module
      hw/arm: Attach PSPI module to NPCM7XX SoC

Jean-Philippe Brucker (2):
      hw/arm/smmu-common: Support 64-bit addresses
      hw/arm/smmu-common: Fix TTB1 handling

Mostafa Saleh (1):
      hw/arm/smmuv3: Add GBPA register

Philippe Mathieu-Daudé (12):
      hw/intc/armv7m_nvic: Use OBJECT_DECLARE_SIMPLE_TYPE() macro
      target/arm: Simplify arm_v7m_mmu_idx_for_secstate() for user emulation
      target/arm: Reduce arm_v7m_mmu_idx_[all/for_secstate_and_priv]() scope
      target/arm: Constify ID_PFR1 on user emulation
      target/arm: Convert CPUARMState::eabi to boolean
      target/arm: Avoid resetting CPUARMState::eabi field
      target/arm: Restrict CPUARMState::gicv3state to sysemu
      target/arm: Restrict CPUARMState::arm_boot_info to sysemu
      target/arm: Restrict CPUARMState::nvic to sysemu
      target/arm: Store CPUARMState::nvic as NVICState*
      target/arm: Declare CPU <-> NVIC helpers in 'hw/intc/armv7m_nvic.h'
      hw/arm: Add missing XLNX_ZYNQMP_ARM -> USB_DWC3 Kconfig dependency

 MAINTAINERS                            |   8 +-
 docs/system/arm/nuvoton.rst            |   2 +-
 hw/arm/smmuv3-internal.h               |   7 +
 include/hw/arm/npcm7xx.h               |   2 +
 include/hw/arm/smmu-common.h           |   2 -
 include/hw/arm/smmuv3.h                |   1 +
 include/hw/intc/armv7m_nvic.h          | 128 +++++++++++++++++-
 include/hw/ssi/npcm_pspi.h             |  53 ++++++++
 linux-user/user-internals.h            |   2 +-
 target/arm/cpregs.h                    |  98 ++++++++++++++
 target/arm/cpu.h                       | 228 ++-------------------------------
 target/arm/internals.h                 |  14 --
 hw/arm/npcm7xx.c                       |  25 +++-
 hw/arm/smmu-common.c                   |   4 +-
 hw/arm/smmuv3.c                        |  43 ++++++-
 hw/arm/virt.c                          |  10 +-
 hw/intc/armv7m_nvic.c                  |  38 ++----
 hw/ssi/npcm_pspi.c                     | 221 ++++++++++++++++++++++++++++++++
 linux-user/arm/cpu_loop.c              |   4 +-
 target/arm/cpu.c                       |   5 +-
 target/arm/cpu_tcg.c                   |   3 +
 target/arm/helper.c                    |  31 +++--
 target/arm/m_helper.c                  |  86 +++++++------
 target/arm/machine.c                   |  18 +--
 tests/qtest/arm-cpu-features.c         |  28 ++--
 hw/arm/Kconfig                         |   1 +
 hw/ssi/meson.build                     |   2 +-
 hw/ssi/trace-events                    |   5 +
 tests/avocado/avocado_qemu/__init__.py |   4 +
 tests/avocado/boot_linux.py            |  48 ++-----
 tests/avocado/boot_linux_console.py    |   1 +
 tests/avocado/machine_aarch64_virt.py  |  63 ++++++++-
 tests/avocado/reverse_debugging.py     |   8 ++
 tests/qtest/meson.build                |   4 +-
 34 files changed, 798 insertions(+), 399 deletions(-)
 create mode 100644 include/hw/ssi/npcm_pspi.h
 create mode 100644 hw/ssi/npcm_pspi.c

