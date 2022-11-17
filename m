Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3F3062E8DC
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Nov 2022 23:56:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovnnP-0001kb-GA; Thu, 17 Nov 2022 17:55:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1ovnnN-0001kK-Pr; Thu, 17 Nov 2022 17:55:45 -0500
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <conor@kernel.org>)
 id 1ovnnL-0001F0-SK; Thu, 17 Nov 2022 17:55:45 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 585AFB821FA;
 Thu, 17 Nov 2022 22:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E4ECC433C1;
 Thu, 17 Nov 2022 22:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1668725740;
 bh=E3al29BtMyefxqNER7R22B0f9ENoa8wya6Bqsj2TUX8=;
 h=From:To:Cc:Subject:Date:From;
 b=nxytlhLZvUHHVVHjMqXInor0C73so9Ykun0rFW1folpNCaYX+8Qcy2ic7e1bSzZul
 qscXDfk5FKANG6Fy6VQQsPXqDW8sq/BTr/O2iREgLOqWkmMV5FH6pozO0juNtks3fE
 G83UaQd0QRF6l9c+n2pvXFSfGjXMmmPnuwgY/BjHJ+h6jTBy8CuL2GrpZijeTPLpzT
 ga2Bh6HxkOQwJPhBH0y9+Fqe2fBSXxhaGRARv/KC7FaLus9/KnvNw15Ro7H1Oy7cO+
 hR7CRI5sn3E0u3XIEIdv+xtbDGcERyxQx4Y3Hxt+xgDihx5WlX3rP15EUlbtP+qYrK
 B3baof500KjgA==
From: Conor Dooley <conor@kernel.org>
To: Bin Meng <bin.meng@windriver.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 0/3] Add (more) missing PolarFire SoC io regions
Date: Thu, 17 Nov 2022 22:55:15 +0000
Message-Id: <20221117225518.4102575-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=conor@kernel.org; helo=ams.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

From: Conor Dooley <conor.dooley@microchip.com>

Hey all,
Apart from DDR (see [1]), these should be the last bits needed to get
recent Linux kernels booting again for Icicle/PolarFire SoC. Previously,
I had been disabling the hwrng and PCI but I keep forgetting that is
required and decided to fix that.

I'm not entirely sure if I have done some sort of no-no thing by
registering the same interrupt with both the IOSCB and SYSREG regions.
The interrupt is raised after the system controller handles a service
via the mailbox. The mailbox's status, control and mailbox registers
are all part of the IOSCB region. It's cleared by a write to a register
in the SYSREG region.
Since my goal here is to add the regions/peripherals without actually
implementing them so that Linux etc, I'm just raising an interrupt
once a guest requests a service & reporting a status indicating that the
service request failed.

Thanks,
Conor.

1 - https://lore.kernel.org/all/Y2+dUCpd8OP52%2FDJ@spud/

Changes since v2:
- fix the actual bits in the register used for the service return
  status
- remove a duplicate irq_lower() in the sysreg bits of patch 3
- move the irq raise to a write function, raising it in the read one was
  causing the irq to get raised twice by the linux driver that works
  properly with the actual hardware. oops.

Conor Dooley (3):
  hw/misc: pfsoc: add fabric clocks to ioscb
  hw/riscv: pfsoc: add missing FICs as unimplemented
  hw/{misc,riscv}: pfsoc: add system controller as unimplemented

 hw/misc/mchp_pfsoc_ioscb.c          |  78 +++++++++++++++++-
 hw/misc/mchp_pfsoc_sysreg.c         |  18 ++++-
 hw/riscv/microchip_pfsoc.c          | 121 ++++++++++++++++------------
 include/hw/misc/mchp_pfsoc_ioscb.h  |   4 +
 include/hw/misc/mchp_pfsoc_sysreg.h |   1 +
 include/hw/riscv/microchip_pfsoc.h  |   3 +
 6 files changed, 167 insertions(+), 58 deletions(-)

-- 
2.37.2


