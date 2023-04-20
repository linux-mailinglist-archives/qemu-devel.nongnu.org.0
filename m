Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504DF6E8EDF
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 12:05:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppRA9-0000Y8-GN; Thu, 20 Apr 2023 06:05:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppRA1-0000Wx-2u
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:05 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ppR9w-0003e4-UX
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 06:05:03 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3f1738d0d4cso3383635e9.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 03:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681985099; x=1684577099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=j7riButP1gHs5uHb0xhMf8FaCPVwVxsVkZWqebcDPK8=;
 b=f0MH+JDaB1YlcShwQkP08zS+HulznP/y+TDh+pSBznbzYeVNGJ08PvC0Vt1ZErY+pc
 xWNseEezklV1/EyiFUuyX/4MaNrnsdp/E6fiiNexHlEaKVSFsfBwBEfK03t99+aEtePH
 PNlZ4z/PcRDmqpZTFhSPKer3x1zfFif1OydCSZ0h0P4jXKsi5PPuRut2plX52hXwAJno
 B+/TVd7UmShQr7C50bAqODqHmXJExBC7bZsnCrqAp2lbncN+2g5hRjZO/vCHhlW+oHQ4
 kniaVyttsuId7fvED1wVJAHDoS/XMVRn20Hrp+JNhOMcKA6eXDp2R2+uTZxuC+mM3wjO
 dY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681985099; x=1684577099;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j7riButP1gHs5uHb0xhMf8FaCPVwVxsVkZWqebcDPK8=;
 b=lOpRZ2wyJLgfMjvo14lif+s+5a6NG58+XdxKwjLGOoPffaD3jpzlwdqm7x+9kZiMkI
 ydGzvKmGw5teZb/clu+1b8H5KM8ICdAIRsmnqH9+eZCj553vIUu8VJRu4LXoGYZH39hU
 kxtGzJANoqOIXaNOM3k4xA6qQrd+2hlvNf9jxGzlJ0vepAwvxVBIcNeb6JX6dEV33DgW
 /DtcvXGK6th8ySiBLyD2hBca/3U/T9B6LbXrAAGE77u+FwzsM44VUyyaGVPrMiCcuqYi
 bvGT3dOVmmW4Ax7WyXHwitC9Zs8vF7NO1Ioq5HzRtUeg8/mrIovoGBF1/kDSUqhK71pC
 wwuA==
X-Gm-Message-State: AAQBX9fNWI6Mp/bvkvkwLdhQ+LPrzpSxmihNG5gPjN7K6pkeWRQGSRUG
 N84dW2HrN+4+sOKXgOQcl26LneNJTkYTDBB6hzk=
X-Google-Smtp-Source: AKy350aB3chFsg/r4r+ZUIGfxQsBJlJ+UPWTXMMCTpfqPhsagXtJTQHaYzb6YHrIYLxeQX6MUilzWQ==
X-Received: by 2002:a05:6000:1211:b0:2ef:399c:1051 with SMTP id
 e17-20020a056000121100b002ef399c1051mr747335wrx.20.1681985099383; 
 Thu, 20 Apr 2023 03:04:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d58c2000000b002fe522117fdsm1556388wrf.36.2023.04.20.03.04.58
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 03:04:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 00/21] target-arm queue
Date: Thu, 20 Apr 2023 11:04:35 +0100
Message-Id: <20230420100456.944969-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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

Hi; here's the first target-arm pullreq for the 8.1 cycle.
Nothing particularly huge in here, just the various things
that had accumulated during the freeze.

thanks
-- PMM

The following changes since commit 2d82c32b2ceaca3dc3da5e36e10976f34bfcb598:

  Open 8.1 development tree (2023-04-20 10:05:25 +0100)

are available in the Git repository at:

  https://git.linaro.org/people/pmaydell/qemu-arm.git tags/pull-target-arm-20230420

for you to fetch changes up to 1ed1f338520cda0574b7e04f5e8e85e049740548:

  arm/mcimx7d-sabre: Set fec2-phy-connected property to false (2023-04-20 10:46:43 +0100)

----------------------------------------------------------------
target-arm queue:
 * hw/arm: Fix some typos in comments (most found by codespell)
 * exynos: Fix out-of-bounds access in exynos4210_gcomp_find debug printf
 * Orangepi-PC, Cubieboard: add Allwinner WDT watchdog emulation
 * tests/avocado: Add reboot tests to Cubieboard
 * hw/timer/imx_epit: Fix bugs in timer limit checking
 * target/arm: Remove KVM AArch32 CPU definitions
 * hw/arm/virt: Restrict Cortex-A7 check to TCG
 * target/arm: Initialize debug capabilities only once
 * target/arm: Implement FEAT_PAN3
 * docs/devel/kconfig.rst: Fix incorrect markup
 * target/arm: Report pauth information to gdb as 'pauth_v2'
 * mcimxd7-sabre, mcimx6ul-evk: Correctly model the way the PHY
   on the second ethernet device must be configured via the
   first one

----------------------------------------------------------------
Akihiko Odaki (1):
      target/arm: Initialize debug capabilities only once

Axel Heider (2):
      hw/timer/imx_epit: don't shadow variable
      hw/timer/imx_epit: fix limit check

Feng Jiang (1):
      exynos: Fix out-of-bounds access in exynos4210_gcomp_find debug printf

Guenter Roeck (5):
      hw/net/imx_fec: Support two Ethernet interfaces connected to single MDIO bus
      fsl-imx6ul: Add fec[12]-phy-connected properties
      arm/mcimx6ul-evk: Set fec1-phy-connected property to false
      fsl-imx7: Add fec[12]-phy-connected properties
      arm/mcimx7d-sabre: Set fec2-phy-connected property to false

Peter Maydell (5):
      target/arm: Pass ARMMMUFaultInfo to merge_syn_data_abort()
      target/arm: Don't set ISV when reporting stage 1 faults in ESR_EL2
      target/arm: Implement FEAT_PAN3
      docs/devel/kconfig.rst: Fix incorrect markup
      target/arm: Report pauth information to gdb as 'pauth_v2'

Philippe Mathieu-Daudé (2):
      target/arm: Remove KVM AArch32 CPU definitions
      hw/arm/virt: Restrict Cortex-A7 check to TCG

Stefan Weil (1):
      hw/arm: Fix some typos in comments (most found by codespell)

Strahinja Jankovic (4):
      hw/watchdog: Allwinner WDT emulation for system reset
      hw/arm: Add WDT to Allwinner-A10 and Cubieboard
      hw/arm: Add WDT to Allwinner-H3 and Orangepi-PC
      tests/avocado: Add reboot tests to Cubieboard

 docs/devel/kconfig.rst              |   2 +-
 docs/system/arm/cubieboard.rst      |   1 +
 docs/system/arm/emulation.rst       |   1 +
 docs/system/arm/orangepi.rst        |   1 +
 include/hw/arm/allwinner-a10.h      |   2 +
 include/hw/arm/allwinner-h3.h       |   5 +-
 include/hw/arm/fsl-imx6ul.h         |   1 +
 include/hw/arm/fsl-imx7.h           |   1 +
 include/hw/net/imx_fec.h            |   2 +
 include/hw/watchdog/allwinner-wdt.h | 123 +++++++++++
 target/arm/cpu.h                    |   5 +
 target/arm/kvm-consts.h             |   9 +-
 target/arm/kvm_arm.h                |   8 +
 hw/arm/allwinner-a10.c              |   7 +
 hw/arm/allwinner-h3.c               |   8 +
 hw/arm/exynos4210.c                 |   4 +-
 hw/arm/fsl-imx6ul.c                 |  20 ++
 hw/arm/fsl-imx7.c                   |  20 ++
 hw/arm/mcimx6ul-evk.c               |   2 +
 hw/arm/mcimx7d-sabre.c              |   2 +
 hw/arm/musicpal.c                   |   2 +-
 hw/arm/omap1.c                      |   2 +-
 hw/arm/omap2.c                      |   2 +-
 hw/arm/virt-acpi-build.c            |   2 +-
 hw/arm/virt.c                       |   4 +-
 hw/arm/xlnx-versal-virt.c           |   2 +-
 hw/net/imx_fec.c                    |  27 ++-
 hw/timer/exynos4210_mct.c           |  13 +-
 hw/timer/imx_epit.c                 |   2 +-
 hw/watchdog/allwinner-wdt.c         | 416 ++++++++++++++++++++++++++++++++++++
 target/arm/cpu64.c                  |   2 +-
 target/arm/cpu_tcg.c                |   2 -
 target/arm/gdbstub.c                |   9 +-
 target/arm/kvm.c                    |   2 +
 target/arm/kvm64.c                  |  18 +-
 target/arm/ptw.c                    |  14 +-
 target/arm/tcg/tlb_helper.c         |  26 ++-
 gdb-xml/aarch64-pauth.xml           |   2 +-
 hw/arm/Kconfig                      |   4 +-
 hw/watchdog/Kconfig                 |   4 +
 hw/watchdog/meson.build             |   1 +
 hw/watchdog/trace-events            |   7 +
 tests/avocado/boot_linux_console.py |  15 +-
 43 files changed, 738 insertions(+), 64 deletions(-)
 create mode 100644 include/hw/watchdog/allwinner-wdt.h
 create mode 100644 hw/watchdog/allwinner-wdt.c

