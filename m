Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE024365ED
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 17:22:03 +0200 (CEST)
Received: from localhost ([::1]:49820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdZtK-00073d-Ef
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 11:22:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54812)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZpM-0004Lu-Oa; Thu, 21 Oct 2021 11:17:57 -0400
Received: from atcsqr.andestech.com ([60.248.187.195]:14453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ruinland@andestech.com>)
 id 1mdZpK-0002cH-2L; Thu, 21 Oct 2021 11:17:56 -0400
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id 19LFHQYn090085;
 Thu, 21 Oct 2021 23:17:26 +0800 (GMT-8)
 (envelope-from ruinland@andestech.com)
Received: from APC301.andestech.com (10.0.12.120) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Thu, 21 Oct 2021
 23:17:26 +0800
From: Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>
To: <alistair23@gmail.com>, <wangjunqiang@iscas.ac.cn>, <bmeng.cn@gmail.com>
Subject: [RFC PATCH v1 0/2] riscv: Add preliminary custom instruction support
Date: Thu, 21 Oct 2021 23:13:41 +0800
Message-ID: <20211021151341.721815-1-ruinland@andestech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.0.12.120]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com 19LFHQYn090085
Received-SPF: pass client-ip=60.248.187.195;
 envelope-from=ruinland@andestech.com; helo=ATCSQR.andestech.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: ycliang@andestech.com, alankao@andestech.com, dylan@andestech.com,
 qemu-devel@nongnu.org, Ruinland Chuan-Tzu Tsai <ruinland@andestech.com>,
 qemu-riscv@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Alistair, Bin and all,

This patchset is based on the V5 patch of custom CSR support.
It demonstrates how Andes intends to use custom CSR by revealing how
Andes CoDense Extension(c), exec.it, uses a custom CSR, uitb, to
execute an instruction mapped by either user code or firmware.

To accomplish such features, we bumped into obstacles which lead us
to expose DisasContext and we feel the urge to reuse riscv_csrrw() as
a "general" API to access either custom or standard CSR.

Furthermore, since Andes Performance Extension(c) instructions, e.g.
bfoz/bfos has the same opcode with different encoding of bitfields on
RV32 and RV64, also, it's highly likely that some custom instruction
might only appear in either RV32 or RV64 (e.g. PULP is RV32 only),
we'd suggest to give some leeway to use `when: TARGET_RISCV32/64`
directive to toggle custom decoder in `target/riscv/meson.build`.

= = = =

How to test - -

/* payload.S */
addi t1,zero,1
.word 0x0013235b # bfoz t1,t1,0,1
addi t1,zero,-1
.word 0x0413335b # bfos t1,t1,1,1

/* test.c */
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/mman.h>

int main(int ac, char *av[]) {

    int efd = open("./payload.bin", O_RDONLY);
    void* exec_heap = mmap(0, 1024, PROT_READ | PROT_WRITE | PROT_EXEC, MAP_PRIVATE, efd, 0);

    __asm__("csrrw x0, 0x800, %0"::"r" (exec_heap));
    __asm__(".hword 0x8000"); // exec.it exec_heap
    __asm__(".hword 0x8010"); // exec.it exec_heap+4
    __asm__("csrrw x0, 0x800, %0"::"r" ((char *)exec_heap+0x8));
    __asm__(".hword 0x8000"); // exec.it exec_heap+0x8
    __asm__(".hword 0x8010"); // exec.it exec_heap+0x12

    close(efd);

    return 0;
    }

= = = =

$ riscv64-linux-gcc -g3 -O0 -fno-builtin -static ./test.c -o ./test
$ riscv64-linux-as ./payload.S -o ./payload.o
$ riscv64-linux-objcopy -O binary ./payload.o ./payload.bin
$ qemu-riscv64 -g 1234 ./test &
$ gdb-multiarch ./test -ex 'target remote localhost:1234' -ex 'b main' -ex 'c'
# You can single step through the custom instructions and witness the
change on $t1.

Cordially yours,
Ruinland Chuan-Tzu Tsai

Ruinland Chuan-Tzu Tsai (2):
  riscv: Add preliminary infra for custom instrcution handling
  Enable custom instruction suport for Andes A25 and AX25 CPU model

 target/riscv/andes_codense.decode         |  23 +++++
 target/riscv/andes_custom_rv32.decode     |  27 +++++
 target/riscv/andes_custom_rv64.decode     |  27 +++++
 target/riscv/andes_helper.c               |  49 +++++++++
 target/riscv/andes_helper.h               |   1 +
 target/riscv/cpu.c                        |  33 ++++++-
 target/riscv/helper.h                     |   2 +
 target/riscv/insn_trans/trans_andes.c.inc | 115 ++++++++++++++++++++++
 target/riscv/meson.build                  |  13 +++
 target/riscv/translate.c                  |  90 ++++++++++++++---
 10 files changed, 362 insertions(+), 18 deletions(-)
 create mode 100644 target/riscv/andes_codense.decode
 create mode 100644 target/riscv/andes_custom_rv32.decode
 create mode 100644 target/riscv/andes_custom_rv64.decode
 create mode 100644 target/riscv/andes_helper.c
 create mode 100644 target/riscv/andes_helper.h
 create mode 100644 target/riscv/insn_trans/trans_andes.c.inc

-- 
2.25.1


