Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B89255764D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jun 2022 11:08:10 +0200 (CEST)
Received: from localhost ([::1]:38512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o4Ioq-00035q-7Z
	for lists+qemu-devel@lfdr.de; Thu, 23 Jun 2022 05:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1o4Icn-0005pw-45
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:55:41 -0400
Received: from mail.loongson.cn ([114.242.206.163]:52186 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1o4Icj-0008QY-2X
 for qemu-devel@nongnu.org; Thu, 23 Jun 2022 04:55:40 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP0x_KrRiTjVWAA--.30922S2; 
 Thu, 23 Jun 2022 16:55:27 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	laurent@vivier.eu,
	gaosong@loongson.cn
Subject: [PATCH v19 00/13] Add LoongArch linux-user emulation support
Date: Thu, 23 Jun 2022 16:55:13 +0800
Message-Id: <20220623085526.1678168-1-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9DxP0x_KrRiTjVWAA--.30922S2
X-Coremail-Antispam: 1UD129KBjvJXoWxCry7CF1UXw43Kw1fWw45Jrb_yoWrXF43pr
 Wfur1fGw48GrZ7Jr1qqa45uFn5X3W7Wr4a93WSqry8CryIyry8uwn3GF9xWa43Z3WrKryj
 qrykAw1UWF4UXFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi All,

This series adds support linux-user emulation.
As the LoongArch kernel had merged into 5.19-rc1,
you can see the latest kernel at https://kernel.org

Need review patch:

  0002-linux-user-Add-LoongArch-signal-support.patch

V19:
  - Update signal.c, add fpu info, fpu_context and end info to
    target_rt_sigframe.

V18:
  - Update signal.c, add set fpu_context'magic, update parse_extcontext()
    and remove some cast.

V17:
  - Split v16 patch7 to  patch7-11, and fix some bugs for system-mode;
  - Update signal.c, add parse_extcontext();
  - Add get_elf_hwcap(), and ELF_PLATFORM.

V16:
  - Update signal.c;
  - Update helper_rdtime_d();
  - Update scripts/gensyscalls.sh, fixed a warning.

v15:
  - Rebase;
  - Update README;
  - Adjust some functions and structure to support user-mode;
  - Update syscall;
  - Update target_sigcontext;

Old series:
   - https://patchew.org/QEMU/20220620093401.3727352-1-gaosong@loongson.cn/

Test:
   make check  && make check-tcg  &&  run LoongArch bash

Thanks.
Song Gao


Song Gao (13):
  linux-user: Add LoongArch generic header files
  linux-user: Add LoongArch signal support
  linux-user: Add LoongArch elf support
  linux-user: Add LoongArch syscall support
  linux-user: Add LoongArch cpu_loop support
  scripts: add loongarch64 binfmt config
  target/loongarch: remove badaddr from CPULoongArch
  target/loongarch: Fix missing update CSR_BADV
  target/loongarch: Fix helper_asrtle_d/asrtgt_d raise wrong exception
  target/loongarch: remove unused include hw/loader.h
  target/loongarch: Adjust functions and structure to support user-mode
  default-configs: Add loongarch linux-user support
  target/loongarch: Update README

 configs/targets/loongarch64-linux-user.mak    |   3 +
 linux-user/elfload.c                          |  91 +++++
 linux-user/loongarch64/cpu_loop.c             |  96 +++++
 linux-user/loongarch64/signal.c               | 331 ++++++++++++++++++
 linux-user/loongarch64/sockbits.h             |  11 +
 linux-user/loongarch64/syscall_nr.h           | 312 +++++++++++++++++
 linux-user/loongarch64/target_cpu.h           |  34 ++
 linux-user/loongarch64/target_elf.h           |  12 +
 linux-user/loongarch64/target_errno_defs.h    |  12 +
 linux-user/loongarch64/target_fcntl.h         |  11 +
 linux-user/loongarch64/target_prctl.h         |   1 +
 linux-user/loongarch64/target_resource.h      |  11 +
 linux-user/loongarch64/target_signal.h        |  13 +
 linux-user/loongarch64/target_structs.h       |  11 +
 linux-user/loongarch64/target_syscall.h       |  48 +++
 linux-user/loongarch64/termbits.h             |  11 +
 linux-user/syscall_defs.h                     |   6 +-
 scripts/gensyscalls.sh                        |   2 +
 scripts/qemu-binfmt-conf.sh                   |   6 +-
 target/loongarch/README                       |  39 ++-
 target/loongarch/cpu.c                        |  34 +-
 target/loongarch/cpu.h                        |   8 +-
 target/loongarch/gdbstub.c                    |   2 +-
 target/loongarch/helper.h                     |   2 +
 .../insn_trans/trans_privileged.c.inc         |  36 ++
 target/loongarch/internals.h                  |   2 +
 target/loongarch/op_helper.c                  |  10 +-
 27 files changed, 1140 insertions(+), 15 deletions(-)
 create mode 100644 configs/targets/loongarch64-linux-user.mak
 create mode 100644 linux-user/loongarch64/cpu_loop.c
 create mode 100644 linux-user/loongarch64/signal.c
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/syscall_nr.h
 create mode 100644 linux-user/loongarch64/target_cpu.h
 create mode 100644 linux-user/loongarch64/target_elf.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_prctl.h
 create mode 100644 linux-user/loongarch64/target_resource.h
 create mode 100644 linux-user/loongarch64/target_signal.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/target_syscall.h
 create mode 100644 linux-user/loongarch64/termbits.h

-- 
2.31.1


