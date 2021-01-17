Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 055C32F95A3
	for <lists+qemu-devel@lfdr.de>; Sun, 17 Jan 2021 22:55:42 +0100 (CET)
Received: from localhost ([::1]:42798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1G1M-0007HO-Gv
	for lists+qemu-devel@lfdr.de; Sun, 17 Jan 2021 16:55:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzu-0005dX-GN
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:10 -0500
Received: from esa5.hgst.iphmx.com ([216.71.153.144]:21685)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=64494dccb=alistair.francis@wdc.com>)
 id 1l1Fzs-0005UE-8N
 for qemu-devel@nongnu.org; Sun, 17 Jan 2021 16:54:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610920448; x=1642456448;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/NUraJuwALU3et2WWDshPaN7o1IjIklJQ//folpGy4Y=;
 b=qrmkdwpLq017wTDpm6fycUjlFduY5QCCKbaeBOjUhTXoCwu5e/MOIsrS
 Ol/Wsx+I6lXJGSnBh8v9L69Hc2vB0i0pH3HUa5gc7zuXP0kDNI688XusW
 JsCI/uubxr51jvBogUQekjf2fXhZH0GQbfBN8zouJuHPQ8jxQIAX/vds3
 IXgxweWO2xf+jYXBVUWN1fX3plCEZbpUS0SPW29h8PB34UjXtwRlT6m1m
 OKvL5aIxaWoaPOJkw03ihMi8ndtPeKbTjdHW5KLXCrPYAIjt6Fe0URri/
 tGNWjvBgYHl3RivNrP3L+//lkCb9xSiMQFVKb2HWXNOMes+8QD6I8By/4 g==;
IronPort-SDR: 5yojTRu39K0fz86MYFZ/Y3136ptrl6A4fHwbTUeOJD9Vnebd4CfHXsgy53Y9/h5K8lbThMrgRz
 b0fY+VYobeawXHxtawDkV9RyB8Vv9L43MMYCBxUDf8c/0ggx2c+rjkijZxXZHCVAARwEKtHlPL
 0sQcHe5WV5rCsV9PHVhslol/nAbgYVXwr0cbNJZk2Wbi9Q2v2gC4seNNIK7OtmFqCeDDhtB7J+
 FOZwC1j5+xlcG+0PCCgq+LzALcfvGil2Qt2YovoLf/T8YLu0r0msUsVQGGr1Ma3BUiry4KJWhf
 Xsw=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="157645957"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 05:54:05 +0800
IronPort-SDR: im3J+WkhP1Fq770CtvcCURmndDR2ccXteZL2UA3YK143Ho4FLr+XVtRZKcX0Bck7JrZFHrc1gL
 tvkYUnbZDsLTvNIwzpDGdCHWcv7mMM9r/Kj2C3dWWLgMP8qUBjeMjRkHeMx6s80heBfLmfF0Gn
 7JLsZIah88aMj0FPx9yY8lZj5zmaWUJ/nlKMsLVdTNS3ntI1DSYgrOdYxH27CsBzy7rp3nQycd
 jWVbQJI9msnAfFURpq9EFOAJR//01xIGkeS8VbMG72LEMa/n1+SgGwlMnKpqEqZsdVUWwQLEaf
 mD9XkRActGtK7FsfONYbvxli
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 13:38:44 -0800
IronPort-SDR: KTirKQuQX7efOyGqQp9hIdXLwEuievoWRSYIXyrpsel6USbusHjNCd9MLjoJOor2YxW6lnfx4j
 s98Vqyw/x269VBBVgPyxXumNZviPbE9s5njCqvnFJST2ArUP1CPGeK+CVXJwkmlJgwf0snyFSZ
 J4aFbUW5+01CQn11RlzicBhdF13g31hiheCs/pnu61vq6NZEZmgJPUMA5uFasEIDvQTXiX56hu
 pveNaE2czo6QNxR6QUhKLcnlhMH37cY5XvDOnSQotxKuNiwjiyXZ9o7kMCkMXjf1tXVGRQHZxH
 x/M=
WDCIronportException: Internal
Received: from 7l95g12.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.62.251])
 by uls-op-cesaip01.wdc.com with ESMTP; 17 Jan 2021 13:54:05 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 00/12] riscv-to-apply queue
Date: Sun, 17 Jan 2021 13:53:51 -0800
Message-Id: <20210117215403.2277103-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.153.144;
 envelope-from=prvs=64494dccb=alistair.francis@wdc.com;
 helo=esa5.hgst.iphmx.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 825a215c003cd028e26c7d19aa5049d957345f43:

  Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210115-pull-request' into staging (2021-01-15 22:21:21 +0000)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210117-3

for you to fetch changes up to a8259b53230782f5e0a0d66013655c4ed5d71b7e:

  riscv: Pass RISCVHartArrayState by pointer (2021-01-16 14:34:46 -0800)

----------------------------------------------------------------
First RISC-V PR for 6.0

This PR:
 - Fixes some issues with the m25p80
 - Improves GDB support for RISC-V
 - Fixes some Linux boot issues, specifiaclly 32-bit boot failures
 - Enforces PMP exceptions correctly
 - Fixes some Coverity issues

----------------------------------------------------------------
Alistair Francis (1):
      riscv: Pass RISCVHartArrayState by pointer

Atish Patra (2):
      RISC-V: Place DTB at 3GB boundary instead of 4GB
      target/riscv/pmp: Raise exception if no PMP entry is configured

Bin Meng (6):
      hw/block: m25p80: Don't write to flash if write is disabled
      hw/riscv: sifive_u: Use SIFIVE_U_CPU for mc->default_cpu_type
      target/riscv: Make csr_ops[CSR_TABLE_SIZE] external
      target/riscv: Add CSR name in the CSR function table
      target/riscv: Generate the GDB XML file for CSR registers dynamically
      target/riscv: Remove built-in GDB XML files for CSRs

Green Wan (1):
      hw/misc/sifive_u_otp: handling the fails of blk_pread and blk_pwrite

Sylvain Pelissier (1):
      gdb: riscv: Add target description

Xuzhou Cheng (1):
      hw/block: m25p80: Implement AAI-WP command support for SST flashes

 default-configs/targets/riscv32-linux-user.mak |   2 +-
 default-configs/targets/riscv32-softmmu.mak    |   2 +-
 default-configs/targets/riscv64-linux-user.mak |   2 +-
 default-configs/targets/riscv64-softmmu.mak    |   2 +-
 include/hw/riscv/boot.h                        |   6 +-
 target/riscv/cpu.h                             |  11 +
 target/riscv/pmp.h                             |   1 +
 hw/block/m25p80.c                              |  74 ++++++
 hw/misc/sifive_u_otp.c                         |  31 ++-
 hw/riscv/boot.c                                |  18 +-
 hw/riscv/sifive_u.c                            |  16 +-
 hw/riscv/spike.c                               |   8 +-
 hw/riscv/virt.c                                |   8 +-
 target/riscv/cpu.c                             |  25 ++
 target/riscv/csr.c                             | 342 ++++++++++++++++++-------
 target/riscv/gdbstub.c                         | 308 ++++------------------
 target/riscv/op_helper.c                       |   5 +
 target/riscv/pmp.c                             |   4 +-
 gdb-xml/riscv-32bit-csr.xml                    | 250 ------------------
 gdb-xml/riscv-64bit-csr.xml                    | 250 ------------------
 20 files changed, 463 insertions(+), 902 deletions(-)
 delete mode 100644 gdb-xml/riscv-32bit-csr.xml
 delete mode 100644 gdb-xml/riscv-64bit-csr.xml

