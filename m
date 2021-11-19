Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DCD4456A25
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 07:19:13 +0100 (CET)
Received: from localhost ([::1]:46288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnxEu-0006f3-7q
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 01:19:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mnx9c-0003qW-HU
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:13:44 -0500
Received: from mail.loongson.cn ([114.242.206.163]:46506 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mnx9Y-0004WW-VI
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:13:44 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj8+KQJdhSG0AAA--.1952S2;
 Fri, 19 Nov 2021 14:13:31 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 00/26] Add LoongArch linux-user emulation support
Date: Fri, 19 Nov 2021 14:13:04 +0800
Message-Id: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxj8+KQJdhSG0AAA--.1952S2
X-Coremail-Antispam: 1UD129KBjvJXoW3Ww45Ar15Gw45tF17GFyfZwb_yoW3Zw4xpr
 W3ur15Kr48JrZ7Jrsaga45ZryrXa1xGr42g3WSq3s5ArWxZryfZF1kK3sxKFy3X3W0gry0
 qFnYkw1UWF4UXa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: richard.henderson@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This series only support linux-user emulation.
More about LoongArch at: https://github.com/loongson/

The latest kernel:
  * https://github.com/loongson/linux/tree/loongarch-next

Patches need review:
  * 0016-target-loongarch-Add-disassembler.patch
  * 0017-linux-user-Add-LoongArch-generic-header-files.patch
  * 0018-linux-user-Add-LoongArch-specific-structures.patch
  * 0019-linux-user-Add-LoongArch-signal-support.patch
  * 0020-linux-user-Add-LoongArch-elf-support.patch
  * 0021-linux-user-Add-LoongArch-syscall-support.patch
  * 0022-linux-user-Add-LoongArch-cpu_loop-support.patch

Changes for v11:
  * Clean up insns.decode.  

Changes for v10:
  * Delete format_insn(), use output_XXX.

Changes for v9:
  * Use GPL-2.0+ SPDX license identifier.
  * Move set_loongarch_cpucfg() in loongarch_3a5000_initfn().
  * target/loongarch/insn_trans/trans_xxx.c rename to
    target/loongarch/insn_trans/trans_xxx.c.inc.
  * Split host_signal_pc and host_signal_write out of user-exec.c.

Changes for v8:
  * Use the FIELD functions to define cpucfg[i].
  * Re-use the decodetree to disassembler description.
  * Split v7 patch(0017-LoongArch-Linux-User-Emulation.patch).

Changes for v7:
  * scripts/gensyscalls.sh support loongarch64
    if we use gensyscalls.sh, we need disable __BITS_PER_LONG at arch/loongarch/include/uapi/asm/bitsperlong.h

V10:https://patchew.org/QEMU/1636700049-24381-1-git-send-email-gaosong@loongson.cn/
V9: https://patchew.org/QEMU/1636340895-5255-1-git-send-email-gaosong@loongson.cn/
V8: https://patchew.org/QEMU/1635760311-20015-1-git-send-email-gaosong@loongson.cn/
V7: https://patchew.org/QEMU/1634561247-25499-1-git-send-email-gaosong@loongson.cn/

Please review!

Thanks.


Song Gao (26):
  target/loongarch: Add README
  target/loongarch: Add core definition
  target/loongarch: Add main translation routines
  target/loongarch: Add fixed point arithmetic instruction translation
  target/loongarch: Add fixed point shift instruction translation
  target/loongarch: Add fixed point bit instruction translation
  target/loongarch: Add fixed point load/store instruction translation
  target/loongarch: Add fixed point atomic instruction translation
  target/loongarch: Add fixed point extra instruction translation
  target/loongarch: Add floating point arithmetic instruction
    translation
  target/loongarch: Add floating point comparison instruction
    translation
  target/loongarch: Add floating point conversion instruction
    translation
  target/loongarch: Add floating point move instruction translation
  target/loongarch: Add floating point load/store instruction
    translation
  target/loongarch: Add branch instruction translation
  target/loongarch: Add disassembler
  linux-user: Add LoongArch generic header files
  linux-user: Add LoongArch specific structures
  linux-user: Add LoongArch signal support
  linux-user: Add LoongArch elf support
  linux-user: Add LoongArch syscall support
  linux-user: Add LoongArch cpu_loop support
  default-configs: Add loongarch linux-user support
  target/loongarch: Add target build suport
  target/loongarch: 'make check-tcg' support
  scripts: add loongarch64 binfmt config

 MAINTAINERS                                     |   5 +
 configs/targets/loongarch64-linux-user.mak      |   3 +
 configure                                       |   5 +
 include/disas/dis-asm.h                         |   2 +
 include/elf.h                                   |   2 +
 linux-user/elfload.c                            |  58 ++
 linux-user/loongarch64/cpu_loop.c               |  97 +++
 linux-user/loongarch64/signal.c                 | 162 +++++
 linux-user/loongarch64/sockbits.h               |  11 +
 linux-user/loongarch64/syscall_nr.h             | 312 +++++++++
 linux-user/loongarch64/target_cpu.h             |  34 +
 linux-user/loongarch64/target_elf.h             |  12 +
 linux-user/loongarch64/target_errno_defs.h      |  12 +
 linux-user/loongarch64/target_fcntl.h           |  11 +
 linux-user/loongarch64/target_signal.h          |  29 +
 linux-user/loongarch64/target_structs.h         |  48 ++
 linux-user/loongarch64/target_syscall.h         |  45 ++
 linux-user/loongarch64/termbits.h               |  11 +
 linux-user/syscall_defs.h                       |  10 +-
 meson.build                                     |   3 +-
 scripts/gensyscalls.sh                          |   1 +
 scripts/qemu-binfmt-conf.sh                     |   6 +-
 target/loongarch/README                         |  76 +++
 target/loongarch/cpu-param.h                    |  18 +
 target/loongarch/cpu.c                          | 315 +++++++++
 target/loongarch/cpu.h                          | 253 +++++++
 target/loongarch/disas.c                        | 625 +++++++++++++++++
 target/loongarch/fpu_helper.c                   | 864 ++++++++++++++++++++++++
 target/loongarch/helper.h                       |  94 +++
 target/loongarch/insn_trans/trans_arith.c.inc   | 309 +++++++++
 target/loongarch/insn_trans/trans_atomic.c.inc  | 130 ++++
 target/loongarch/insn_trans/trans_bit.c.inc     | 252 +++++++
 target/loongarch/insn_trans/trans_branch.c.inc  |  82 +++
 target/loongarch/insn_trans/trans_extra.c.inc   |  84 +++
 target/loongarch/insn_trans/trans_farith.c.inc  | 105 +++
 target/loongarch/insn_trans/trans_fcmp.c.inc    |  56 ++
 target/loongarch/insn_trans/trans_fcnv.c.inc    |  33 +
 target/loongarch/insn_trans/trans_fmemory.c.inc | 184 +++++
 target/loongarch/insn_trans/trans_fmov.c.inc    | 150 ++++
 target/loongarch/insn_trans/trans_memory.c.inc  | 232 +++++++
 target/loongarch/insn_trans/trans_shift.c.inc   | 128 ++++
 target/loongarch/insns.decode                   | 444 ++++++++++++
 target/loongarch/internals.h                    |  28 +
 target/loongarch/meson.build                    |  19 +
 target/loongarch/op_helper.c                    |  84 +++
 target/loongarch/translate.c                    | 297 ++++++++
 target/loongarch/translate.h                    |  45 ++
 target/meson.build                              |   1 +
 tests/tcg/configure.sh                          |   1 +
 49 files changed, 5782 insertions(+), 6 deletions(-)
 create mode 100644 configs/targets/loongarch64-linux-user.mak
 create mode 100644 linux-user/loongarch64/cpu_loop.c
 create mode 100644 linux-user/loongarch64/signal.c
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/syscall_nr.h
 create mode 100644 linux-user/loongarch64/target_cpu.h
 create mode 100644 linux-user/loongarch64/target_elf.h
 create mode 100644 linux-user/loongarch64/target_errno_defs.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_signal.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/target_syscall.h
 create mode 100644 linux-user/loongarch64/termbits.h
 create mode 100644 target/loongarch/README
 create mode 100644 target/loongarch/cpu-param.h
 create mode 100644 target/loongarch/cpu.c
 create mode 100644 target/loongarch/cpu.h
 create mode 100644 target/loongarch/disas.c
 create mode 100644 target/loongarch/fpu_helper.c
 create mode 100644 target/loongarch/helper.h
 create mode 100644 target/loongarch/insn_trans/trans_arith.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_atomic.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_bit.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_branch.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_extra.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_farith.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fcmp.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fcnv.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fmemory.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_fmov.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_memory.c.inc
 create mode 100644 target/loongarch/insn_trans/trans_shift.c.inc
 create mode 100644 target/loongarch/insns.decode
 create mode 100644 target/loongarch/internals.h
 create mode 100644 target/loongarch/meson.build
 create mode 100644 target/loongarch/op_helper.c
 create mode 100644 target/loongarch/translate.c
 create mode 100644 target/loongarch/translate.h

-- 
1.8.3.1


