Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 456F028D77B
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Oct 2020 02:31:01 +0200 (CEST)
Received: from localhost ([::1]:60266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kSUh2-0001mB-Av
	for lists+qemu-devel@lfdr.de; Tue, 13 Oct 2020 20:31:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=549b5cc2b=alistair.francis@wdc.com>)
 id 1kSUeo-0000Ls-Dz; Tue, 13 Oct 2020 20:28:44 -0400
Received: from esa1.hgst.iphmx.com ([68.232.141.245]:47540)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=549b5cc2b=alistair.francis@wdc.com>)
 id 1kSUek-0003yq-9r; Tue, 13 Oct 2020 20:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1602635318; x=1634171318;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Y9uCuQAV8k/TTIl06remNd53GOz8LPRtW4uDnWkWZ9I=;
 b=MiCtNoUaLwrNsm5L7KSv7ZqjMD1tgo6RrTQsg4KjYhNIes3rrR+Li8nM
 gDLjxeQigxrZEGl99VX9Iye/Ev0gMsyAcMCGB2W9l1iQfLjxABm1LGQfr
 upQmOyHKLE2pq9lFmwu33KlnVH7hWFpLnmyHHjGPu5xFStp07ZnBxZ2Rr
 hlbXIyB5oMBniNhIirKQJ+MxFsjcViw2pS9tFjWuGIVAJXuqlONH870SO
 7UHIquHNbMs0aHx8axhvGgOh+BMDZCSgM+drMHe652FGKgakxkTN5q0ji
 5duLL53XXvvWN2NUIyEudp6VO1ENzgaFedyZevb0lxEU2kciBxkfCXPkq Q==;
IronPort-SDR: FVxJSIHURUK/YoCkNZAisicxsYx/TRVtD2I/fibRKBFda1CSafg32e4zZKVCcPPL+Em/cbCO+r
 xBN5Lc5PHatD0MvWXzxPfJYRHCTKGPOj5rRD8/XDQ/hJoo6wkFqtpQcggPTLC2P9Wqll+IxqZQ
 obhvs/DJK+yq1l+e9YUBw3rivF6kemSeHAIkxXu2IF2Jw0aD1/fKnEP52HjyJdLN0mzmJsji1E
 gXr3QSbjjUvI+300nSNHBtcUMWEoLpwrleKBSeAubDY0L8uX4BJLV1EAQqXAeZUKcQ0pSXQ4FN
 eKA=
X-IronPort-AV: E=Sophos;i="5.77,372,1596470400"; d="scan'208";a="259612079"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 14 Oct 2020 08:28:33 +0800
IronPort-SDR: z1hoIkKFC+ND08+pJ4Ox+VM4KEdm5Vlipdie0Was/SkBb0UrYwFsKk1a1jZDHw9PShVid3u/ho
 vLM0HK1bva3rB2Qf92YlabXC/WVW8Ue9L4+9d8de4LFOdoQnDqLG52jyoPJeHFyZOcZme7+NZY
 c2bv+lq7XUSYnzi571Qgjpmm7ormlhA/eXHnbktS2MUdQozrLIqJlbwiJTMy/tl3mM1GpVeHtN
 Wgcj3LL1yqllgxX87EqHdRsJ0BJDy1pexYQBw/qBzNfzk4CFnh6bHz/ARIzsSzcNAhfWJruJvg
 3Np3G2fb4/KviXnWwrfaeDnP
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2020 17:15:07 -0700
IronPort-SDR: zKNu6hGjRo7kSvl8ye2lg22qC6YsVVgkTlWggQlwr6QuStjs/WlLwMLqsJQBztil/zsSF9D9tm
 XtGLG9rNbyUPUdd1HhZvv+M9uKvtdL3yEHDhi1sB+ERRGzLoUecIMs4DEL3k+NJnN0v/vwaeCK
 u/AK8mtBoL7BzFXUug1+VGD3SpS/RmX+fRRMXTucRZEhsa+WeRZPJsf2cYXBnvN/7YA8NKNw6J
 w12lVe0CJ56nBWX3wQY8V3DhIiu5RuEuQGYCf+N+pu/lffQFT3hN8x7j7nnCuh89fpzBkGIE0f
 TBA=
WDCIronportException: Internal
Received: from cnf006900.ad.shared (HELO risc6-mainframe.hgst.com)
 ([10.86.60.55])
 by uls-op-cesaip02.wdc.com with ESMTP; 13 Oct 2020 17:28:33 -0700
From: Alistair Francis <alistair.francis@wdc.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 0/4]  Allow loading a no MMU kernel
Date: Tue, 13 Oct 2020 17:17:22 -0700
Message-Id: <cover.1602634524.git.alistair.francis@wdc.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=68.232.141.245;
 envelope-from=prvs=549b5cc2b=alistair.francis@wdc.com;
 helo=esa1.hgst.iphmx.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/13 20:28:34
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series allows loading a noMMU kernel using the -kernel option.
Currently if using -kernel QEMU assumes you also have firmware and loads
the kernel at a hardcoded offset. This series changes that so we only
load the kernel at an offset if a firmware (-bios) was loaded.

This series also adds a function to check if the CPU is 32-bit. This is
a step towards running 32-bit and 64-bit CPUs on the 64-bit RISC-V build
by using run time checks instead of compile time checks. We also allow
the user to sepcify a CPU for the sifive_u machine.

Alistair Francis (4):
  hw/riscv: sifive_u: Allow specifying the CPU
  hw/riscv: Return the end address of the loaded firmware
  hw/riscv: Add a riscv_is_32_bit() function
  hw/riscv: Load the kernel after the firmware

 include/hw/riscv/boot.h     | 13 ++++++---
 include/hw/riscv/sifive_u.h |  1 +
 hw/riscv/boot.c             | 56 ++++++++++++++++++++++++++-----------
 hw/riscv/opentitan.c        |  3 +-
 hw/riscv/sifive_e.c         |  3 +-
 hw/riscv/sifive_u.c         | 28 ++++++++++++++-----
 hw/riscv/spike.c            | 11 ++++++--
 hw/riscv/virt.c             | 11 ++++++--
 8 files changed, 91 insertions(+), 35 deletions(-)

-- 
2.28.0


