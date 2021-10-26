Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5017E43A935
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 02:27:09 +0200 (CEST)
Received: from localhost ([::1]:33738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfAIu-0004Xm-Ou
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 20:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mfAFy-0002Xa-Lm
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 20:23:59 -0400
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a]:40947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <sjg@chromium.org>) id 1mfAFv-0008Li-H5
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 20:23:58 -0400
Received: by mail-oi1-x22a.google.com with SMTP id n63so18003458oif.7
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 17:23:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dDOi2F4iW7Ye80jF0wATVD9cXgtBPuntD9upyDhxx6A=;
 b=IHqcbN6JaErq0O+tTp5eBCqAmdP7sPN1jiVEvcznKZcOqjJugF7bBdWpEHqhdysfIz
 2CHyo2n+mPAO+lpdfAiqBPoIhDn+g59aNHcEEw1+KZMyqTpU4NIOfu9lrwZ2woxB0gHg
 2fI4t74gIbmR/9fjfnZFyME7paeGQGDynbVYM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dDOi2F4iW7Ye80jF0wATVD9cXgtBPuntD9upyDhxx6A=;
 b=VJ0jXw73Zf0o6IljCi1QoX5oHkEfeiEbJtfgz+UaXcnRVaJikXqQ/naMV05N3rCSV6
 g1l0M16EC+90a4AOg2pKLxvtS3vrdaPkM/vIIM+cJe8nMCKF0o56LaXip7Nijmd8xDfa
 HvyPnN6GZgBgzxTEvZoIN36HO423qJAa11ds3njJoNRGieYHgiGGy3tHWm5tMIL/tQuc
 Q7y3poeX50Yk64AqmcyGGpDz4OHmyOit+kiNXvvmP93tohbtEyBt+qwd8CG23uOmqIHD
 Bskevzn105sl+FTwm3sqD7hplOhDrMAAvOJuHV2UsDvSgROPY3bRVlF3RAVCDs8p3Tu+
 vTIg==
X-Gm-Message-State: AOAM533YnGe+J6pzmaCaHZXTJ3JVo4fIhUcnQ7t/OrMiSCWEQZx6K1MH
 Lcutk1AjcEGwHtGNt/DW1gYAOQ==
X-Google-Smtp-Source: ABdhPJzWagX9tCJ+JgzT/LVZ03SgAjfBYa8UA9K/9+oTwiOFdxK2vUFSv2oW1J8RtZTopW7Cp0HNrQ==
X-Received: by 2002:aca:ac01:: with SMTP id v1mr14688872oie.34.1635207832434; 
 Mon, 25 Oct 2021 17:23:52 -0700 (PDT)
Received: from kiwi.bld.corp.google.com (c-67-190-101-114.hsd1.co.comcast.net.
 [67.190.101.114])
 by smtp.gmail.com with ESMTPSA id v24sm3331926oou.45.2021.10.25.17.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Oct 2021 17:23:51 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: U-Boot Mailing List <u-boot@lists.denx.de>
Subject: [PATCH v5 00/26] fdt: Make OF_BOARD a boolean option
Date: Mon, 25 Oct 2021 18:23:18 -0600
Message-Id: <20211026002344.405160-1-sjg@chromium.org>
X-Mailer: git-send-email 2.33.0.1079.g6e70778dc9-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22a;
 envelope-from=sjg@chromium.org; helo=mail-oi1-x22a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Linus Walleij <linus.walleij@linaro.org>,
 Thomas Fitzsimmons <fitzsim@fitzsim.org>, qemu-devel@nongnu.org,
 Sean Anderson <seanga2@gmail.com>, Mark Kettenis <mark.kettenis@xs4all.nl>,
 Tom Rini <trini@konsulko.com>, Stephen Warren <swarren@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>,
 Michal Simek <michal.simek@xilinx.com>, Jerry Van Baren <vanbaren@cideas.com>,
 Stephen Warren <swarren@wwwdotorg.org>,
 Andre Przywara <andre.przywara@arm.com>, Alexander Graf <agraf@csgraf.de>,
 Anastasiia Lukianenko <anastasiia_lukianenko@epam.com>,
 Albert Aribaud <albert.u.boot@aribaud.net>,
 Matthias Brugger <mbrugger@suse.com>, Simon Glass <sjg@chromium.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Aaron Williams <awilliams@marvell.com>,
 Tuomas Tynkkynen <tuomas.tynkkynen@iki.fi>, Bin Meng <bmeng.cn@gmail.com>
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

The problems with this approach are documented in another patch in this
series: "doc: Add documentation about devicetree usage"

In practice, OF_BOARD is not really distinct from OF_SEPARATE. Any board
can obtain its devicetree at runtime, even it is has a devicetree built
in U-Boot. This is because U-Boot may be a second-stage bootloader and its
caller may have a better idea about the hardware available in the machine.
This is the case with a few QEMU boards, for example.

So it makes no sense to have OF_BOARD as a 'choice'. It should be an
option, available with either OF_SEPARATE or OF_EMBED.

This series makes this change, adding various missing devicetree files
(and placeholders) to make the build work.

Note: If board maintainers are able to add their own patch to add the
files, some patches in this series can be dropped.

It also provides a few qemu clean-ups discovered along the way.

Note: This breaks the qemu-riscv64_spl test, which still needs
investigation.

[1] https://patchwork.ozlabs.org/project/uboot/patch/20210919215111.3830278-3-sjg@chromium.org/

Changes in v5:
- Bring into the OF_BOARD series
- Rebase to master and drop mention of OF_PRIOR_STAGE, since removed
- Refer to the 'control' DTB in the first paragraph
- Use QEMU instead of qemu
- Merge RISC-V and ARM patches since they are similar
- Add new patches to clean up fdtdec_setup() and surrounds

Changes in v3:
- Clarify the 'bug' refered to at the top
- Reword 'This means that there' paragraph to explain U-Boot-specific things
- Move to doc/develop/devicetree now that OF_CONTROL is in the docs

Changes in v2:
- Fix typos per Sean (thank you!) and a few others
- Add a 'Use of U-Boot /config node' section
- Drop mention of dm-verity since that actually uses the kernel cmdline
- Explain that OF_BOARD will still work after these changes (in
  'Once this bug is fixed...' paragraph)
- Expand a bit on the reason why the 'Current situation' is bad
- Clarify in a second place that Linux and U-Boot use the same devicetree
  in 'To be clear, while U-Boot...'
- Expand on why we should have rules for other projects in
  'Devicetree in another project'
- Add a comment as to why devicetree in U-Boot is not 'bad design'
- Reword 'in-tree U-Boot devicetree' to 'devicetree source in U-Boot'
- Rewrite 'Devicetree generated on-the-fly in another project' to cover
  points raised on v1
- Add 'Why does U-Boot have its nodes and properties?'
- Add 'Why not have two devicetrees?'

Ilias Apalodimas (1):
  sandbox: Remove OF_HOSTFILE

Simon Glass (25):
  doc: Add documentation about devicetree usage
  arm: qemu: Mention -nographic in the docs
  arm: riscv: qemu: Explain how to extract the generated dt
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
  doc: Update info on devicetree update
  fdt: Move MULTI_DTB_FIT handling out of fdtdec_setup()
  fdt: Drop #ifdefs with MULTI_DTB_FIT
  fdt: Drop CONFIG_SPL_BUILD check in fdtdec_setup()
  fdt: Drop #ifdef around board_fdt_blob_setup()
  fdt: Use if() for fdtcontroladdr check
  fdt: Drop OF_CONTROL check in fdtdec_setup()
  fdt: Drop remaining preprocessor macros in fdtdec_setup()
  fdt: Don't call board_fdt_blob_setup() without OF_BOARD

 Makefile                                  |    7 +-
 arch/arm/dts/Makefile                     |   20 +-
 arch/arm/dts/bcm2711-rpi-4-b.dts          | 1958 +++++++++++++++++++++
 arch/arm/dts/bcm7xxx.dts                  |   15 +
 arch/arm/dts/highbank.dts                 |   14 +
 arch/arm/dts/juno-r2.dts                  | 1038 +++++++++++
 arch/arm/dts/octeontx.dts                 |   14 +
 arch/arm/dts/qemu-arm.dts                 |  402 +++++
 arch/arm/dts/qemu-arm64.dts               |  381 ++++
 arch/arm/dts/xenguest-arm64.dts           |   15 +
 arch/arm/dts/xilinx-versal-virt.dts       |  307 ++++
 arch/powerpc/dts/Makefile                 |    1 +
 arch/powerpc/dts/qemu-ppce500.dts         |  264 +++
 arch/riscv/dts/Makefile                   |    2 +-
 arch/riscv/dts/qemu-virt.dts              |    8 -
 arch/riscv/dts/qemu-virt32.dts            |  217 +++
 arch/riscv/dts/qemu-virt64.dts            |  217 +++
 arch/sandbox/cpu/cpu.c                    |   21 +-
 arch/sandbox/include/asm/u-boot-sandbox.h |    8 -
 configs/bcm7260_defconfig                 |    1 +
 configs/bcm7445_defconfig                 |    1 +
 configs/highbank_defconfig                |    2 +-
 configs/octeontx2_95xx_defconfig          |    1 +
 configs/octeontx2_96xx_defconfig          |    1 +
 configs/octeontx_81xx_defconfig           |    1 +
 configs/octeontx_83xx_defconfig           |    1 +
 configs/qemu-ppce500_defconfig            |    2 +
 configs/qemu-riscv32_defconfig            |    1 +
 configs/qemu-riscv32_smode_defconfig      |    1 +
 configs/qemu-riscv32_spl_defconfig        |    4 +-
 configs/qemu-riscv64_defconfig            |    1 +
 configs/qemu-riscv64_smode_defconfig      |    1 +
 configs/qemu-riscv64_spl_defconfig        |    3 +-
 configs/qemu_arm64_defconfig              |    1 +
 configs/qemu_arm_defconfig                |    1 +
 configs/rpi_4_32b_defconfig               |    1 +
 configs/rpi_4_defconfig                   |    1 +
 configs/rpi_arm64_defconfig               |    1 +
 configs/sandbox64_defconfig               |    2 +-
 configs/sandbox_defconfig                 |    2 +-
 configs/sandbox_flattree_defconfig        |    2 +-
 configs/sandbox_noinst_defconfig          |    2 +-
 configs/sandbox_spl_defconfig             |    2 +-
 configs/tools-only_defconfig              |    2 +-
 configs/vexpress_aemv8a_juno_defconfig    |    1 +
 configs/xenguest_arm64_defconfig          |    1 +
 configs/xilinx_versal_virt_defconfig      |    1 +
 doc/board/emulation/qemu-arm.rst          |   10 +-
 doc/board/emulation/qemu-riscv.rst        |    3 +
 doc/develop/devicetree/control.rst        |    7 +-
 doc/develop/devicetree/dt_qemu.rst        |   48 +
 doc/develop/devicetree/dt_update.rst      |  498 ++++++
 doc/develop/devicetree/index.rst          |    2 +
 dts/Kconfig                               |   37 +-
 include/asm-generic/global_data.h         |    8 +
 include/fdtdec.h                          |   21 +-
 lib/fdtdec.c                              |  116 +-
 scripts/Makefile.spl                      |    4 +-
 tools/binman/binman.rst                   |   20 -
 59 files changed, 5560 insertions(+), 164 deletions(-)
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
 create mode 100644 doc/develop/devicetree/dt_qemu.rst
 create mode 100644 doc/develop/devicetree/dt_update.rst

-- 
2.33.0.1079.g6e70778dc9-goog


