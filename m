Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 602FC3C9984
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Jul 2021 09:18:40 +0200 (CEST)
Received: from localhost ([::1]:37432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3vdn-0007Wv-7q
	for lists+qemu-devel@lfdr.de; Thu, 15 Jul 2021 03:18:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vc0-0005N9-QM
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:48 -0400
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:27200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=8230c157d=alistair.francis@wdc.com>)
 id 1m3vbx-0003UP-UU
 for qemu-devel@nongnu.org; Thu, 15 Jul 2021 03:16:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1626333406; x=1657869406;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CSXjQ2sCVzI8P7qtlOMGWl6Td3Wpm1u3woWkmb+g3XY=;
 b=P8l9qUIQo/jIOHtuOfh5MqpGGoI8XSQmEQ+DGbSpImyi85uTG6gbNXq8
 Jvb9buFygp+bjJUDsZKGQQW0y+Z6H3RtJSPaU14p6BI08gnzHZsKi/Gd2
 tyqbiGlaucmQ43bssIxeVr5ay9GlUFfp30gRAqI1+KDY/6EJvHEBHqf0x
 NoaJey/M5wjmbHU+6mYgbkAQmB9w/HAuIiGabMRS2Vis7232iDVNkD8L5
 1ohRpPWmRSQFsX/2rH12pZtRQ1aMpGMlP0qAXgUxuUcj2aUilfAv8qjYV
 O6UnAUyfcD8u+qqZGjX9AXkp4ExDnFjTD8HOyFsyO8izGAcwh2u1F4tiG g==;
IronPort-SDR: yrGMbpr1O9XNONNT6oWw78CVI/A8ke6pIfbjKcuSujk9ZYrL1xns4ylT47ECJyAjGa1FyDHAiI
 ZoLxrG0RPvBdnJ7ckyTWQDwkXbOg/sFSuNo5iJVSttzTUYMZkwgvNnts295egu2iHsbFjYlJ55
 RWAVpJD5DBa8cTuBqbpJZUn62c8W70HibEvQt/CpLdKGxJ93g7XWQMNnU5cQJggudia0Z/tzw/
 f00aVPMQOg2Emu7li/TzxMJVWmSneD/Xqs1bdjoSiJ1LQfA8P8KfNu/B+uH0EC2CBqXB9ixIbH
 ji8=
X-IronPort-AV: E=Sophos;i="5.84,240,1620662400"; d="scan'208";a="175212298"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jul 2021 15:16:42 +0800
IronPort-SDR: +u2Ic8hwhhWi1n3zSlLKlZ+qAn/tcN6pt4154+5EJu5bsVsGBTqN4AyxWFiTERGQ0wDy6oDVTG
 4l6rKT3TubXOXubM90v+MD9KTRAe8Ny7heZfyhbZ/YfuEcmk3l43WybtZkRUY0HJMnz8GWMwo6
 v6k2vcPA8F3r86LOh5040IfnOx34rAJ0fD5ya11cDRHuwrqE5rVm1bKewBlJ3rAIBnVtWqa2gK
 8TqowYWuzryob0/nfCG6uCAyZAdrnzvUnAcrHBDvtqVCzyRqmu1va6F5CHhcf0O5P0X2KBpcsK
 onx1K8AKlTX+xIBvI9FhQm9S
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jul 2021 23:54:44 -0700
IronPort-SDR: FJd6Ud4vdcwiCAMVEYXu//fVOuF2Fa+6E5l3V9fPInFXoJSaDZkGBJpcUQCSiH+wzYbgJzI1Hg
 Dn16KtAtaoJQHlJwX2Ex88htL1DojwzNQ9mNTtldwa2ErEek3VnIWKF/zju9lifUxKDaLTvIO1
 fhcR5LRZvvdMlD3/OyONW4h4R0KgpzT3/Uohnua6csXWKMrywlSfkdkaATl/fsnJV1eORIk6MG
 DeUIBp1GQEuevo+OFS8nnybXZeEw95aK5tAhZfUnenDxnDGO1t7fuJA2phYp6K9bwTNTh5bF7F
 exg=
WDCIronportException: Internal
Received: from risc6-mainframe.sdcorp.global.sandisk.com (HELO
 risc6-mainframe.int.fusionio.com) ([10.196.157.248])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jul 2021 00:16:42 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL v2 00/12] riscv-to-apply queue
Date: Thu, 15 Jul 2021 00:16:28 -0700
Message-Id: <20210715071640.232070-1-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=8230c157d=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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

The following changes since commit a9649a719a44894b81f38dc1c5c1888ee684acef:

  Merge remote-tracking branch 'remotes/cleber-gitlab/tags/python-next-pull-request' into staging (2021-07-14 18:09:09 +0100)

are available in the Git repository at:

  git@github.com:alistair23/qemu.git tags/pull-riscv-to-apply-20210715

for you to fetch changes up to b3d8aa20692b1baed299790f4a65d6b0cfb1a0bc:

  hw/riscv/boot: Check the error of fdt_pack() (2021-07-15 09:35:46 +1000)

----------------------------------------------------------------
Fourth RISC-V PR for 6.1 release

 - Code cleanups
 - Documentation improvements
 - Hypervisor extension improvements with hideleg and hedeleg
 - sifive_u fixes
 - OpenTitan register layout updates
 - Fix coverity issue

----------------------------------------------------------------
Alistair Francis (4):
      char: ibex_uart: Update the register layout
      hw/riscv: opentitan: Add the unimplement rv_core_ibex_peri
      hw/riscv: opentitan: Add the flash alias
      hw/riscv/boot: Check the error of fdt_pack()

Bin Meng (7):
      target/riscv: pmp: Fix some typos
      target/riscv: csr: Remove redundant check in fp csr read/write routines
      docs/system: riscv: Fix CLINT name in the sifive_u doc
      docs/system: riscv: Add documentation for virt machine
      docs/system: riscv: Update Microchip Icicle Kit for direct kernel boot
      hw/riscv: sifive_u: Correct the CLINT timebase frequency
      hw/riscv: sifive_u: Make sure firmware info is 8-byte aligned

Jose Martins (1):
      target/riscv: hardwire bits in hideleg and hedeleg

 docs/system/riscv/microchip-icicle-kit.rst |  54 +++++++++--
 docs/system/riscv/sifive_u.rst             |   2 +-
 docs/system/riscv/virt.rst                 | 138 +++++++++++++++++++++++++++++
 docs/system/target-riscv.rst               |   1 +
 include/hw/riscv/opentitan.h               |   3 +
 hw/char/ibex_uart.c                        |  19 ++--
 hw/riscv/boot.c                            |   6 +-
 hw/riscv/opentitan.c                       |   9 ++
 hw/riscv/sifive_u.c                        |  12 ++-
 target/riscv/csr.c                         |  78 +++++++---------
 target/riscv/pmp.c                         |  10 +--
 11 files changed, 257 insertions(+), 75 deletions(-)
 create mode 100644 docs/system/riscv/virt.rst

