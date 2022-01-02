Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72143482C14
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jan 2022 17:29:40 +0100 (CET)
Received: from localhost ([::1]:41418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n43jn-0000te-Hd
	for lists+qemu-devel@lfdr.de; Sun, 02 Jan 2022 11:29:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n43P3-0006av-3F
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 11:08:14 -0500
Received: from david.siemens.de ([192.35.17.14]:35007)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <konrad.schwarz@siemens.com>)
 id 1n43Oz-0004CI-OQ
 for qemu-devel@nongnu.org; Sun, 02 Jan 2022 11:08:11 -0500
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
 by david.siemens.de (8.15.2/8.15.2) with ESMTPS id 202G83Gt006120
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sun, 2 Jan 2022 17:08:03 +0100
Received: from fedora.vmnet8.md1wgtfc ([144.145.220.57])
 by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id 202G82US030977;
 Sun, 2 Jan 2022 17:08:02 +0100
From: Konrad Schwarz <konrad.schwarz@siemens.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 0/5] Improve RISC-V debugging support.
Date: Sun,  2 Jan 2022 17:06:07 +0100
Message-Id: <cover.1641137349.git.konrad.schwarz@siemens.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.35.17.14;
 envelope-from=konrad.schwarz@siemens.com; helo=david.siemens.de
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sun, 02 Jan 2022 11:21:53 -0500
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
Cc: Konrad Schwarz <konrad.schwarz@siemens.com>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1) Make the QEMU monitor `info registers' command more informative
2) Implement the QEMU monitor `print $register'
3) Introduce a new command `info gmem' to the QEMU monitor, which displays
   a RISC-V hypervisor's guest's 2nd level paging tables similarly to the
   existing `info mem' command.
4) Improve QEMU RISC-V target descriptions for GDB. In particular, add
   type information for many control and status registers.
5) Extend the virtual `priv' register with hypervisor virtualization status.

Konrad Schwarz (5):
  RISC-V: larger and more consistent register set for 'info registers'
  RISC-V: monitor's print register functionality
  RISC-V: 'info gmem' to show hypervisor guest -> physical address
    translations
  RISC-V: Typed CSRs in gdbserver
  RISC-V: Add `v' (virtualization mode) bit to the `priv' virtual debug
    register

 gdb-xml/riscv-32bit-virtual.xml   |  30 ++-
 gdb-xml/riscv-64bit-virtual.xml   |  30 ++-
 hmp-commands-info.hx              |  16 ++
 include/monitor/hmp-target.h      |   2 +
 target/riscv/cpu.c                | 327 ++++++++++++++++++++++++++---
 target/riscv/csr.c                |   2 +
 target/riscv/csr32-op-gdbserver.h | 109 ++++++++++
 target/riscv/csr64-op-gdbserver.h |  76 +++++++
 target/riscv/gdb_csr_types.c      | 333 ++++++++++++++++++++++++++++++
 target/riscv/gdb_csr_types.h      |   3 +
 target/riscv/gdbstub.c            |  31 ++-
 target/riscv/meson.build          |   4 +-
 target/riscv/monitor.c            | 204 ++++++++++++++----
 13 files changed, 1096 insertions(+), 71 deletions(-)
 create mode 100644 target/riscv/csr32-op-gdbserver.h
 create mode 100644 target/riscv/csr64-op-gdbserver.h
 create mode 100644 target/riscv/gdb_csr_types.c
 create mode 100644 target/riscv/gdb_csr_types.h


base-commit: 8627edfb3f1fca24a96a0954148885c3241c10f8
-- 
Konrad Schwarz


