Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C58B042B1C1
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 03:03:11 +0200 (CEST)
Received: from localhost ([::1]:42168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maSfl-0001IC-9m
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 21:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1maSeC-0007sd-Be
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:01:32 -0400
Received: from mail-ot1-x32c.google.com ([2607:f8b0:4864:20::32c]:43664)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1maSeA-0004sZ-4m
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 21:01:32 -0400
Received: by mail-ot1-x32c.google.com with SMTP id
 x33-20020a9d37a4000000b0054733a85462so1517726otb.10
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 18:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ctubsMlmpQ2ReH/eTvK49QXjo2Yo+isOsZBUADLxZ1A=;
 b=Zc6a+9fOkcVEgk7w8vT27kHE1dmGOThzlKr4BfUox+6yS4HXr76xDMHc0+k2qDKIaA
 Z+zNyp7+UPvf4xS9h6q8rAPTqrSc8NAXWZAQF2add+hImgo/T2+wpi1CXQVUvmg64Fyi
 KH6U8oORNWHCAiQPA1F4reNbTM+AKmth/fSb0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ctubsMlmpQ2ReH/eTvK49QXjo2Yo+isOsZBUADLxZ1A=;
 b=M9YEng5UDrOGLgZMxqrageSTNgBFK2gk/v/3dm326oaZ1DNByuUkynu/zsF66i2oot
 mGb1YjES+zmQCnX6E2SBF6NuG7QFiLM+Hdlz0PjBP1H2do3Ad7EWWcfdB18cKk9y3lq5
 c8YroiiijrXk9iNs3nSuLKDbSf0mcpK03PFJDT1GgOKae6YyWi+hfmZiIMD4DQfVe9fL
 COMCa2ITq7I6Dct9I/enSHZkBulA9o6EXSPoEo79q6Yrsb6CWRxLAomH7Nvv9StlKjOR
 3RaII3PPCeOuj8dC+E5I9ARhPjcse6+qZTiBdLzkiAYdMjVyjkNqLu029S9SKN23yNeg
 uMnQ==
X-Gm-Message-State: AOAM530HjGiwGZDv1TRjA7zsb7KRv5s6z23+T1zjd29hdW+CQhFZDHTd
 n2R/O5O81hnzWIVgP2yGVrUucQ==
X-Google-Smtp-Source: ABdhPJyu1rlzdGNORd6ABOW9mwRHBoYLlkLmg8qCaCAinJHUg0ERts+5LQ5D9rDKrjDzytBGm+D0Rg==
X-Received: by 2002:a9d:6143:: with SMTP id c3mr29117929otk.124.1634086888198; 
 Tue, 12 Oct 2021 18:01:28 -0700 (PDT)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id a10sm238107otb.7.2021.10.12.18.01.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 18:01:27 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH 00/16] fdt: Make OF_BOARD a boolean option
Date: Tue, 12 Oct 2021 19:01:04 -0600
Message-Id: <20211013010120.96851-1-sjg@chromium.org>
X-Mailer: git-send-email 2.33.0.882.g93a45727a2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32c;
 envelope-from=sjg@chromium.org; helo=mail-ot1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Liviu Dudau <liviu.dudau@foss.arm.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Linus Walleij <linus.walleij@linaro.org>, Bin Meng <bin.meng@windriver.com>,
 Kever Yang <kever.yang@rock-chips.com>, Sean Anderson <seanga2@gmail.com>,
 Atish Patra <atish.patra@wdc.com>, Zong Li <zong.li@sifive.com>,
 Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>,
 Rainer Boschung <rainer.boschung@hitachi-powergrids.com>,
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Niel Fourie <lusus@denx.de>,
 Michal Simek <michal.simek@xilinx.com>,
 =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
 Jerry Van Baren <vanbaren@cideas.com>, Ramon Fried <rfried.dev@gmail.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Valentin Longchamp <valentin.longchamp@hitachi-powergrids.com>,
 Heiko Schocher <hs@denx.de>, Peter Robinson <pbrobinson@gmail.com>,
 Sinan Akman <sinan@writeme.com>, Thomas Fitzsimmons <fitzsim@fitzsim.org>,
 Wolfgang Denk <wd@denx.de>, Stephen Warren <swarren@wwwdotorg.org>,
 qemu-devel@nongnu.org, Andre Przywara <andre.przywara@arm.com>,
 Tim Harvey <tharvey@gateworks.com>,
 Ashok Reddy Soma <ashok.reddy.soma@xilinx.com>, Rick Chen <rick@andestech.com>,
 Alexander Graf <agraf@csgraf.de>, Green Wan <green.wan@sifive.com>,
 T Karthik Reddy <t.karthik.reddy@xilinx.com>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>, Michal Simek <monstr@monstr.eu>,
 Matthias Brugger <mbrugger@suse.com>, Leo <ycliang@andestech.com>,
 Tero Kristo <kristo@kernel.org>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Priyanka Jain <priyanka.jain@nxp.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Christian Hewitt <christianshewitt@gmail.com>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Tianrui Wei <tianrui-wei@outlook.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 Dimitri John Ledkov <dimitri.ledkov@canonical.com>,
 Padmarao Begari <padmarao.begari@microchip.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With Ilias' efforts we have dropped OF_PRIOR_STAGE and OF_HOSTFILE so
there are only three ways to obtain a devicetree:

   - OF_SEPARATE - the normal way, where the devicetree is built and
      appended to U-Boot
   - OF_EMBED - for development purposes, the devicetree is embedded in
      the ELF file (also used for EFI)
   - OF_BOARD - the board figures it out on its own

The last one is currently set up so that no devicetree is needed at all
in the U-Boot tree. Most boards do provide one, but some don't. Some
don't even provide instructions on how to boot on the board.

The problems with this approach are documented at [1].

In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any board
can obtain its devicetree at runtime, even it is has a devicetree built
in U-Boot. This is because U-Boot may be a second-stage bootloader and its
caller may have a better idea about the hardware available in the machine.
This is the case with a few QEMU boards, for example.

So it makes no sense to have OF_BOARD as a 'choice'. It should be an
option, available with either OF_SEPARATE or OF_EMBED.

This series makes this change, adding various missing devicetree files
(and placeholders) to make the build work.

It also provides a few qemu clean-ups discovered along the way.

This series is based on Ilias' two series for OF_HOSTFILE and
OF_PRIOR_STAGE removal.

It is available at u-boot-dm/ofb-working

[1] https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@chromium.org/


Simon Glass (16):
  arm: qemu: Mention -nographic in the docs
  arm: qemu: Explain how to extract the generate devicetree
  riscv: qemu: Explain how to extract the generate devicetree
  arm: qemu: Add a devicetree file for qemu_arm
  arm: qemu: Add a devicetree file for qemu_arm64
  riscv: qemu: Add devicetree files for qemu_riscv32/64
  arm: rpi: Add a devicetree file for rpi_4
  arm: vexpress: Add a devicetree file for juno
  arm: xenguest_arm64: Add a fake devicetree file
  arm: octeontx: Add a fake devicetree file
  arm: xilinx_versal_virt: Add a devicetree file
  arm: bcm7xxx: Add a devicetree file
  arm: qemu-ppce500: Add a devicetree file
  arm: highbank: Add a fake devicetree file
  fdt: Make OF_BOARD a bool option
  Drop CONFIG_BINMAN_STANDALONE_FDT

 Makefile                               |    3 +-
 arch/arm/dts/Makefile                  |   20 +-
 arch/arm/dts/bcm2711-rpi-4-b.dts       | 1958 ++++++++++++++++++++++++
 arch/arm/dts/bcm7xxx.dts               |   15 +
 arch/arm/dts/highbank.dts              |   14 +
 arch/arm/dts/juno-r2.dts               | 1038 +++++++++++++
 arch/arm/dts/octeontx.dts              |   14 +
 arch/arm/dts/qemu-arm.dts              |  402 +++++
 arch/arm/dts/qemu-arm64.dts            |  381 +++++
 arch/arm/dts/xenguest-arm64.dts        |   15 +
 arch/arm/dts/xilinx-versal-virt.dts    |  307 ++++
 arch/powerpc/dts/Makefile              |    1 +
 arch/powerpc/dts/qemu-ppce500.dts      |  264 ++++
 arch/riscv/dts/Makefile                |    2 +-
 arch/riscv/dts/qemu-virt.dts           |    8 -
 arch/riscv/dts/qemu-virt32.dts         |  217 +++
 arch/riscv/dts/qemu-virt64.dts         |  217 +++
 configs/bcm7260_defconfig              |    1 +
 configs/bcm7445_defconfig              |    1 +
 configs/highbank_defconfig             |    2 +-
 configs/octeontx2_95xx_defconfig       |    1 +
 configs/octeontx2_96xx_defconfig       |    1 +
 configs/octeontx_81xx_defconfig        |    1 +
 configs/octeontx_83xx_defconfig        |    1 +
 configs/qemu-ppce500_defconfig         |    2 +
 configs/qemu-riscv32_defconfig         |    1 +
 configs/qemu-riscv32_smode_defconfig   |    1 +
 configs/qemu-riscv32_spl_defconfig     |    4 +-
 configs/qemu-riscv64_defconfig         |    1 +
 configs/qemu-riscv64_smode_defconfig   |    1 +
 configs/qemu-riscv64_spl_defconfig     |    3 +-
 configs/qemu_arm64_defconfig           |    1 +
 configs/qemu_arm_defconfig             |    1 +
 configs/rpi_4_32b_defconfig            |    1 +
 configs/rpi_4_defconfig                |    1 +
 configs/rpi_arm64_defconfig            |    1 +
 configs/vexpress_aemv8a_juno_defconfig |    1 +
 configs/xenguest_arm64_defconfig       |    1 +
 configs/xilinx_versal_virt_defconfig   |    1 +
 doc/board/emulation/qemu-arm.rst       |   19 +-
 doc/board/emulation/qemu-riscv.rst     |   12 +
 dts/Kconfig                            |   27 +-
 tools/binman/binman.rst                |   20 -
 43 files changed, 4922 insertions(+), 61 deletions(-)
 create mode 100644 arch/arm/dts/bcm2711-rpi-4-b.dts
 create mode 100644 arch/arm/dts/bcm7xxx.dts
 create mode 100644 arch/arm/dts/highbank.dts
 create mode 100644 arch/arm/dts/juno-r2.dts
 create mode 100644 arch/arm/dts/octeontx.dts
 create mode 100644 arch/arm/dts/qemu-arm.dts
 create mode 100644 arch/arm/dts/qemu-arm64.dts
 create mode 100644 arch/arm/dts/xenguest-arm64.dts
 create mode 100644 arch/arm/dts/xilinx-versal-virt.dts
 create mode 100644 arch/powerpc/dts/qemu-ppce500.dts
 delete mode 100644 arch/riscv/dts/qemu-virt.dts
 create mode 100644 arch/riscv/dts/qemu-virt32.dts
 create mode 100644 arch/riscv/dts/qemu-virt64.dts

-- 
2.33.0.882.g93a45727a2-goog


