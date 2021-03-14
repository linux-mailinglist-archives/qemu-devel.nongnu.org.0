Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C433A4AB
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Mar 2021 13:17:53 +0100 (CET)
Received: from localhost ([::1]:34240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLPgu-0006QY-4k
	for lists+qemu-devel@lfdr.de; Sun, 14 Mar 2021 08:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLPeS-0005js-RL; Sun, 14 Mar 2021 08:15:21 -0400
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430]:40208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lLPeP-0000I2-Tc; Sun, 14 Mar 2021 08:15:20 -0400
Received: by mail-pf1-x430.google.com with SMTP id x7so4891924pfi.7;
 Sun, 14 Mar 2021 05:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rZu4vpTh9NoTxVoxVN/E4D4MkaDNpkTF4Bi9p4UznfQ=;
 b=RQ5/Vdy5DuCMkFPky6wLNQRT9IWGYefZCHN7B5UsURg5rOrbDQQRGzryecawJK2q2O
 igmRUzVLSTipGBLDOjJ7BvDlpzRxw37MKSe30k/rAKBIQ0lS3jbpqx1se+in7CudSLjG
 lwDFRFfT0FbVoHk8Y/cBZt9l9KMHKp00TcnjbtNHhdd/AVMC8FcUeOWAFJoBXOHVHZHx
 2y0TmSjkgHghnGGEKpLNcokwasTD0+AElLzbsRHTgxTq4zEQ6pG+I2k1cmPUy8Rl3Ou7
 dFKsljsZzaErdN9uNLcix7AgdI39SM7DJdY04H3ruDG1Ic2zC/VD+mmh9QOnG1NOwZQR
 muBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rZu4vpTh9NoTxVoxVN/E4D4MkaDNpkTF4Bi9p4UznfQ=;
 b=S38fJS1+MaoscVPHGcxMuZ1qudwwxe2K5jgZfiLIFf6DjuiDSXVaeAtUsVGFT2MRFW
 /dW1dv972IODFW+/EBr7cXyn1LTVnleE5W3/d5vjzWqymr0UaYlrYljaenlEpT3Jpb/g
 o4hSjDCURJFlqRiNmo5849ZMKi0gsqz47sI8SmlWyG8qbzSB1zYe9tMNXEq1L1HAD0ao
 Xa58NaY9DQa+i4+2yeQiWvCG6yfxC35+++1+X2xJGLHGZE5dCrAcdxtIOd9X/3QLpBEw
 0iDH6UNML7F56sqPVSkAxMDqLfnnXYdar9QXY6ujTA5N8BHEHs44soDWq9NCUI8Q40h5
 NWfw==
X-Gm-Message-State: AOAM5302h6bDKvzhQQpcWbuJlgV9noezY+egtFKAvuBo9ycXqvt14Qyz
 C9dpxrIcNxKpQmgKvfLjkvE=
X-Google-Smtp-Source: ABdhPJxF2wEHaWtYmyGTyCC5A1K7wGknAc/k7VignlsZVHe4TrFsz64u2SRj3AZ7EdG1WpcVlFnv8Q==
X-Received: by 2002:a62:27c7:0:b029:204:7b11:3222 with SMTP id
 n190-20020a6227c70000b02902047b113222mr5358753pfn.34.1615724116063; 
 Sun, 14 Mar 2021 05:15:16 -0700 (PDT)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id 2sm10504325pfi.116.2021.03.14.05.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 14 Mar 2021 05:15:15 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: Priyanka Jain <priyanka.jain@nxp.com>, Ramon Fried <rfried.dev@gmail.com>,
 Simon Glass <sjg@chromium.org>, u-boot@lists.denx.de
Subject: [PATCH v4 00/22] ppc: qemu: Add eTSEC support
Date: Sun, 14 Mar 2021 20:14:44 +0800
Message-Id: <20210314121506.18303-1-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::430;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pf1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Tom Rini <trini@konsulko.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 Vladimir Oltean <vladimir.oltean@nxp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU ppce500 machine can dynamically instantiate an eTSEC device
if "-device eTSEC" is given to QEMU.

This series updates the fixed-link ethernet PHY driver as well as
the Freescale eTSEC driver to support the QEMU ppce500 board.

3 patches related to fixed phy in v1 are dropped in v2 as the changes
were done by Vladimir's fixed phy & Sandbox DSA series [1]. Vladimir's
series is now included in v2 to avoid dependencies.

This cover letter is cc'ed to QEMU mailing list for a heads-up.
A future patch will be sent to QEMU mailing list to bring its in-tree
U-Boot source codes up-to-date.

Azure results: PASS
https://dev.azure.com/bmeng/GitHub/_build/results?buildId=343&view=results

This series is avaiable at u-boot-x86/eTSEC for testing.

[1] https://patchwork.ozlabs.org/project/uboot/patch/20210216224804.3355044-2-olteanv@gmail.com/

Changes in v4:
- describe "ranges" is required fo the alternate description
- make platform_bus_map_region() return void

Changes in v3:
- mention that U-Boot deliberately ignores the 'phy_id' and
  unconditionally uses PHY_FIXED_ID
- update the code logic to prefer the new binding if both new and
  old bindings exist
- sort variable definitions by line length
- reuse the sandbox dsa nodes for the fixed-link testing
- new patch: net: tsec: Use map_physmem() directly instead of dev_remap_addr()
- add "ranges" in the alternate example
- keep the variable definitions sorted
- invert the strncmp logic to reduce the indentation level
- add a comment to mention only the first "queue-group" is used
- call the same map_physmem() in the common code path
- extract platform bus virtual memory mapping codes to a new routine
- add a "break" in case multiple "qemu,platform" nodes exist

Changes in v2:
- move device tree parsing from xilinxgmiitorgmii_probe() to
  xilinxgmiitorgmii_config() and use OF APIs
- new patch: split from <20210216224804.3355044-4-olteanv@gmail.com>
- include <asm/global_data.h>
- use a Kconfig option CONFIG_SIMPLE_BUS_CORRECT_RANGE to control the
  new behavior for boards that want this
- default y if SANDBOX for CONFIG_SIMPLE_BUS_CORRECT_RANGE
- turn on CONFIG_SIMPLE_BUS_CORRECT_RANGE in qemu-ppce500_defconfig

Bin Meng (18):
  dt-bindings: net: Add the old DT bindings for "fixed-link"
  of: extra: Introduce ofnode_phy_is_fixed_link() API
  dm: mdio: Use ofnode_phy_is_fixed_link() API
  net: phy: xilinx: Be compatible with live OF tree
  net: phy: xilinx: Drop #ifdef CONFIG_DM_ETH around
    phy_connect_gmii2rgmii()
  net: phy: Simplify the logic of phy_connect_fixed()
  net: phy: fixed: Make driver ops static
  net: phy: fixed: Add the missing ending newline
  net: phy: fixed: Support the old DT binding
  test: dm: Add a case to test ofnode_phy_is_fixed_link()
  net: tsec: Use map_physmem() directly instead of dev_remap_addr()
  dt-bindings: net: Update Freescale TSEC to support "queue-group"
  net: tsec: Support <reg> property from the subnode "queue-group"
  dm: core: Correctly read <ranges> of simple-bus
  test: dm: Add a test case for simple-bus <ranges>
  ppc: qemu: Create a virtual memory mapping of the platform bus
  ppc: qemu: Enable eTSEC support
  doc: board: qemu-ppce500: Document eTSEC usage

Claudiu Manoil (1):
  sandbox: Add a DSA sandbox driver and unit test

Vladimir Oltean (3):
  net: phy: fixed: Be compatible with live OF tree
  net: phy: fixed: Drop #ifdef CONFIG_DM_ETH around phy_connect_fixed
  net: tsec: Use dm_eth_phy_connect() directly for the DM case

 arch/Kconfig                                  |   2 +
 arch/sandbox/dts/test.dts                     |  44 +++++
 board/emulation/qemu-ppce500/Kconfig          |   6 +
 board/emulation/qemu-ppce500/qemu-ppce500.c   |  29 +++
 configs/qemu-ppce500_defconfig                |   5 +
 doc/board/emulation/qemu-ppce500.rst          |   5 +
 doc/device-tree-bindings/net/fixed-link.txt   |  48 +++--
 doc/device-tree-bindings/net/fsl-tsec-phy.txt |  19 +-
 drivers/core/Kconfig                          |  14 ++
 drivers/core/of_extra.c                       |  23 +++
 drivers/core/simple-bus.c                     |  32 +++-
 drivers/net/Kconfig                           |   9 +
 drivers/net/Makefile                          |   1 +
 drivers/net/dsa_sandbox.c                     | 179 ++++++++++++++++++
 drivers/net/phy/Kconfig                       |   1 +
 drivers/net/phy/fixed.c                       |  54 ++++--
 drivers/net/phy/phy.c                         |  63 +++---
 drivers/net/phy/xilinx_gmii2rgmii.c           |  61 +++---
 drivers/net/tsec.c                            |  36 +++-
 include/configs/sandbox.h                     |   2 +
 include/dm/of_extra.h                         |  20 ++
 include/dm/simple_bus.h                       |   6 +-
 net/mdio-uclass.c                             |   7 +-
 test/dm/Makefile                              |   2 +
 test/dm/dsa.c                                 |  82 ++++++++
 test/dm/eth.c                                 |  10 +-
 test/dm/of_extra.c                            |  18 ++
 test/dm/simple-bus.c                          |  33 ++++
 28 files changed, 691 insertions(+), 120 deletions(-)
 create mode 100644 drivers/net/dsa_sandbox.c
 create mode 100644 test/dm/dsa.c
 create mode 100644 test/dm/simple-bus.c

-- 
2.25.1


