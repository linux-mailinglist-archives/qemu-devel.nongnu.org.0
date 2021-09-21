Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47793413B35
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 22:22:35 +0200 (CEST)
Received: from localhost ([::1]:47268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSmHh-0006zP-Rh
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 16:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmEr-000414-Qm
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:37 -0400
Received: from [115.28.160.31] (port=55952 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mSmEj-0000Hl-Um
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 16:19:37 -0400
Received: from ld50.lan (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id CB80A600FF;
 Wed, 22 Sep 2021 04:19:19 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632255559; bh=0npNsZVwT7L5a0aRXmQDpnUCeH65DDLYXSdGOzbfwAo=;
 h=From:To:Cc:Subject:Date:From;
 b=v65Dt0HJjui6dNXxM5GN3xAN7Mr7mib8WLwt2nX0jwG6AeMYKspYiRSjoYJdiVaS8
 0ghfo9ysQi5s/amlIh1IeJL/VQxKOL3NgvhYRwAbvbxf+ONFfHngBd8HZSzh/kIcq+
 1WfvdbCxcpgwe/tp6WaydsQXSRRsYbydLx4kr84Q=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 00/30] LoongArch64 port of QEMU TCG
Date: Wed, 22 Sep 2021 04:18:45 +0800
Message-Id: <20210921201915.601245-1-git@xen0n.name>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: WANG Xuerui <git@xen0n.name>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi all,

This is a port of QEMU TCG to the brand-new CPU architecture LoongArch,
introduced by Loongson with their 3A5000 chips. Test suite all passed
except one timeout that is test-crypto-tlssession, but this particular
case runs well when relatively few targets are enabled, so it may be
just a case of low performance (4C4T 2.5GHz). I also boot-tested x86_64
(Debian and Gentoo installation CDs) and install-tested aarch64 (Debian
netboot installer), and ran riscv64 linux-user emulation with a chroot;
everything seems fine so far.

## About the series

Only the LP64 ABI is supported, as this is the only one fully
implemented and supported by Loongson. 32-bit support is incomplete from
outset, and removed from the very latest upstream submissions, so you
can't even configure for that.

The architecture's documentation is already translated into English;
it can be browsed at https://loongson.github.io/LoongArch-Documentation/.
The LoongArch ELF psABI doc (version 1.00) could be found at [1];
if anything is missing there, it's most likely the same as RISC-V, but
you can always raise an issue over their issue tracker at [2].

[1]: https://loongson.github.io/LoongArch-Documentation/LoongArch-ELF-ABI-EN.html
[2]: https://github.com/loongson/LoongArch-Documentation/issues

In this series I made use of generated instruction encodings and
emitters from https://github.com/loongson-community/loongarch-opcodes
(a community project started by myself, something I must admit), as the
LoongArch encoding is highly irregular even for a fixed 32-bit ISA, and
I want to minimize the maintenance burden for future collaboration. This
is something not seen in any of the other TCG ports out there, so I'd
like to see if this is acceptable practice (and also maybe bikeshed the
file name).

This series touches some of the same files as Song Gao's previous
submission of LoongArch *target* support, which is a bit unfortunate;
one of us will have to rebase after either series gets in. Actual
conflict should only happen on build system bits and include/elf.h,
though, as we're working on entirely different areas.

## How to build and test this

Upstream support for LoongArch is largely WIP for now, which means you
must apply a lot of patches if you want to even cross-build for this arch.
The main sources I used are as follows:

* binutils: https://github.com/xen0n/binutils-gdb/tree/for-gentoo-2.37-v2
  based on https://github.com/loongson/binutils-gdb/tree/loongarch/upstream_v6_a1d65b3
* gcc: https://github.com/xen0n/gcc/tree/for-gentoo-gcc-12-v2
  based on https://github.com/loongson/gcc/tree/loongarch_upstream
* glibc: https://github.com/xen0n/glibc/tree/for-gentoo-glibc-2.34
  based on https://github.com/loongson/glibc/tree/loongarch_2_34_for_upstream
* Linux: https://github.com/xen0n/linux/tree/loongarch-playground
  based on https://github.com/loongson/linux/tree/loongarch-next
* Gentoo overlay: https://github.com/xen0n/loongson-overlay

I have made ready-to-use Gentoo stage3 tarballs, but they're served with
CDN off my personal cloud account, and I don't want the link to be
exposed so that my bills skyrocket; you can reach me off-list to get the
links if you're interested.

As for the hardware availability, the boards can already be bought in
China on Taobao, and I think some people at Loongson might be able to
arrange for testing environments, if testing on real hardware other than
mine is required before merging; they have their in-house Debian spin-off
from the early days of this architecture. Their kernel is
ABI-incompatible with the version being upstreamed and used by me, but
QEMU should work there regardless.

Lastly, I'm new to QEMU development and this is my first patch series
here; apologizes if I get anything wrong, and any help or suggestion is
certainly appreciated!

## Changelog

v2 -> v1:

- Addressed all review comments from v1
  - Use "loongarch64" everywhere, tcg directory renamed to "tcg/loongarch64"
  - Removed all redundant TCG_TARGET_REG_BITS conditional
  - Removed support for the neg op
  - Added support for eqv and bswap32_i64 ops
  - Added safe syscall handling for linux-user
  - Fixed everything else I could see
- Updated generated instruction definitions to latest
- Reordered the configure/meson.build changes to come last

v1: https://patchew.org/QEMU/20210920080451.408655-1-git@xen0n.name/

WANG Xuerui (30):
  elf: Add machine type value for LoongArch
  MAINTAINERS: Add tcg/loongarch64 entry with myself as maintainer
  tcg/loongarch64: Add the tcg-target.h file
  tcg/loongarch64: Add generated instruction opcodes and encoding
    helpers
  tcg/loongarch64: Add register names, allocation order and input/output
    sets
  tcg/loongarch64: Define the operand constraints
  tcg/loongarch64: Implement necessary relocation operations
  tcg/loongarch64: Implement the memory barrier op
  tcg/loongarch64: Implement tcg_out_mov and tcg_out_movi
  tcg/loongarch64: Implement goto_ptr
  tcg/loongarch64: Implement sign-/zero-extension ops
  tcg/loongarch64: Implement not/and/or/xor/nor/andc/orc/eqv ops
  tcg/loongarch64: Implement deposit/extract ops
  tcg/loongarch64: Implement bswap32_i32/bswap32_i64/bswap64_i64
  tcg/loongarch64: Implement clz/ctz ops
  tcg/loongarch64: Implement shl/shr/sar/rotl/rotr ops
  tcg/loongarch64: Implement add/sub ops
  tcg/loongarch64: Implement mul/mulsh/muluh/div/divu/rem/remu ops
  tcg/loongarch64: Implement br/brcond ops
  tcg/loongarch64: Implement setcond ops
  tcg/loongarch64: Implement tcg_out_call
  tcg/loongarch64: Implement simple load/store ops
  tcg/loongarch64: Add softmmu load/store helpers, implement
    qemu_ld/qemu_st ops
  tcg/loongarch64: Implement tcg_target_qemu_prologue
  tcg/loongarch64: Implement exit_tb/goto_tb
  tcg/loongarch64: Implement tcg_target_init
  tcg/loongarch64: Register the JIT
  linux-user: Add safe syscall handling for loongarch64 hosts
  accel/tcg/user-exec: Implement CPU-specific signal handler for
    loongarch64 hosts
  configure, meson.build: Mark support for loongarch64 hosts

 MAINTAINERS                                   |    5 +
 accel/tcg/user-exec.c                         |   78 +
 configure                                     |    7 +-
 include/elf.h                                 |    2 +
 linux-user/host/loongarch64/hostdep.h         |   34 +
 .../host/loongarch64/safe-syscall.inc.S       |   80 +
 meson.build                                   |    4 +-
 tcg/loongarch64/tcg-insn-defs.c.inc           |  873 +++++++++
 tcg/loongarch64/tcg-target-con-set.h          |   30 +
 tcg/loongarch64/tcg-target-con-str.h          |   28 +
 tcg/loongarch64/tcg-target.c.inc              | 1614 +++++++++++++++++
 tcg/loongarch64/tcg-target.h                  |  180 ++
 12 files changed, 2933 insertions(+), 2 deletions(-)
 create mode 100644 linux-user/host/loongarch64/hostdep.h
 create mode 100644 linux-user/host/loongarch64/safe-syscall.inc.S
 create mode 100644 tcg/loongarch64/tcg-insn-defs.c.inc
 create mode 100644 tcg/loongarch64/tcg-target-con-set.h
 create mode 100644 tcg/loongarch64/tcg-target-con-str.h
 create mode 100644 tcg/loongarch64/tcg-target.c.inc
 create mode 100644 tcg/loongarch64/tcg-target.h

-- 
2.33.0


