Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5853D0B9A
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:55:19 +0200 (CEST)
Received: from localhost ([::1]:54588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68wg-0004RA-EA
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:55:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68uv-0002Cn-Kh
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:29 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49376 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68us-00022F-Ge
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:29 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S2; 
 Wed, 21 Jul 2021 17:53:18 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/22] Add LoongArch linux-user emulation support
Date: Wed, 21 Jul 2021 17:52:56 +0800
Message-Id: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S2
X-Coremail-Antispam: 1UD129KBjvJXoWxKr1kCrykZF1fKrW8AF4Utwb_yoW7Xr18pr
 W3ur1rKa18JrZrJr4kXa45Xrn5Xw4xGr4293WSqry8CrWSyryxZFn7K3sIgFy3X3W8Wry0
 qF1vkw1UWF4UXaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

This series only adds linux-user emulation support for LoongArch.
So there is no introduction of system in docs/system directory,
We'll add that in a future series.

Changes for v1:
  * Patch 1, remove unnecessary introduction;
  * Patch 3, follow the ARM/AVR pattern to add new CPU features;
  * Patch 6, remove decode_lsx(); 
  * Patches 7-18, delete opcode definition, modify translation function;
  * Patches 20-22, split V1 patch20 to V2 patch20-22. 

In the next series, we will add privileged instruction emulation, 
board emulation and TCG test. Please review.

Regards
Song Gao

Song Gao (22):
  target/loongarch: Add README
  target/loongarch: Add CSR registers definition
  target/loongarch: Add core definition
  target/loongarch: Add interrupt handling support
  target/loongarch: Add memory management support
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
  LoongArch Linux User Emulation
  configs: Add loongarch linux-user config
  target/loongarch: Add target build suport

 MAINTAINERS                                |    7 +
 configs/targets/loongarch64-linux-user.mak |    3 +
 disas/loongarch.c                          | 2511 +++++++++++++
 disas/meson.build                          |    1 +
 include/disas/dis-asm.h                    |    2 +
 include/elf.h                              |    2 +
 linux-user/elfload.c                       |   58 +
 linux-user/loongarch64/cpu_loop.c          |  177 +
 linux-user/loongarch64/signal.c            |  193 +
 linux-user/loongarch64/sockbits.h          |    1 +
 linux-user/loongarch64/syscall_nr.h        |  307 ++
 linux-user/loongarch64/target_cpu.h        |   36 +
 linux-user/loongarch64/target_elf.h        |   14 +
 linux-user/loongarch64/target_fcntl.h      |   12 +
 linux-user/loongarch64/target_signal.h     |   28 +
 linux-user/loongarch64/target_structs.h    |   49 +
 linux-user/loongarch64/target_syscall.h    |   46 +
 linux-user/loongarch64/termbits.h          |  229 ++
 linux-user/syscall_defs.h                  |   10 +-
 meson.build                                |    1 +
 target/loongarch/README                    |    5 +
 target/loongarch/cpu-csr.h                 |  724 ++++
 target/loongarch/cpu-param.h               |   21 +
 target/loongarch/cpu-qom.h                 |   40 +
 target/loongarch/cpu.c                     |  319 ++
 target/loongarch/cpu.h                     |  299 ++
 target/loongarch/fpu_helper.c              | 1435 +++++++
 target/loongarch/fpu_helper.h              |   34 +
 target/loongarch/helper.h                  |  158 +
 target/loongarch/insns.decode              |  480 +++
 target/loongarch/meson.build               |   19 +
 target/loongarch/op_helper.c               |  230 ++
 target/loongarch/tlb_helper.c              |  103 +
 target/loongarch/trans.inc.c               | 5536 ++++++++++++++++++++++++++++
 target/loongarch/translate.c               |  558 +++
 target/loongarch/translate.h               |   50 +
 target/meson.build                         |    1 +
 37 files changed, 13695 insertions(+), 4 deletions(-)
 create mode 100644 configs/targets/loongarch64-linux-user.mak
 create mode 100644 disas/loongarch.c
 create mode 100644 linux-user/loongarch64/cpu_loop.c
 create mode 100644 linux-user/loongarch64/signal.c
 create mode 100644 linux-user/loongarch64/sockbits.h
 create mode 100644 linux-user/loongarch64/syscall_nr.h
 create mode 100644 linux-user/loongarch64/target_cpu.h
 create mode 100644 linux-user/loongarch64/target_elf.h
 create mode 100644 linux-user/loongarch64/target_fcntl.h
 create mode 100644 linux-user/loongarch64/target_signal.h
 create mode 100644 linux-user/loongarch64/target_structs.h
 create mode 100644 linux-user/loongarch64/target_syscall.h
 create mode 100644 linux-user/loongarch64/termbits.h
 create mode 100644 target/loongarch/README
 create mode 100644 target/loongarch/cpu-csr.h
 create mode 100644 target/loongarch/cpu-param.h
 create mode 100644 target/loongarch/cpu-qom.h
 create mode 100644 target/loongarch/cpu.c
 create mode 100644 target/loongarch/cpu.h
 create mode 100644 target/loongarch/fpu_helper.c
 create mode 100644 target/loongarch/fpu_helper.h
 create mode 100644 target/loongarch/helper.h
 create mode 100644 target/loongarch/insns.decode
 create mode 100644 target/loongarch/meson.build
 create mode 100644 target/loongarch/op_helper.c
 create mode 100644 target/loongarch/tlb_helper.c
 create mode 100644 target/loongarch/trans.inc.c
 create mode 100644 target/loongarch/translate.c
 create mode 100644 target/loongarch/translate.h

-- 
1.8.3.1


