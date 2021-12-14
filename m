Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891A9473DF1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 09:06:24 +0100 (CET)
Received: from localhost ([::1]:52820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mx2pL-0007ri-Df
	for lists+qemu-devel@lfdr.de; Tue, 14 Dec 2021 03:06:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2lu-00069B-03
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:02:50 -0500
Received: from mail.xen0n.name ([115.28.160.31]:48392
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <git@xen0n.name>) id 1mx2lq-0000Qr-2b
 for qemu-devel@nongnu.org; Tue, 14 Dec 2021 03:02:49 -0500
Received: from ld50.lan (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id E0982600B0;
 Tue, 14 Dec 2021 16:02:36 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1639468957; bh=tpnzwagM4ZY026i+e4Q7XkP7mlgVkqXapb2x5l/a1Co=;
 h=From:To:Cc:Subject:Date:From;
 b=nAAZNGFLOknsKwuIH07Ci0QfEDuqx6ZSGrIWu69MdBaF1iFQAWfPbSaH6232Cei1b
 LBUmLTo+DT/RsBCFZL61Ra/UCGElLXc9ixDFpKi7ZSCdgYGARTtte4nyFqmaotULKo
 eEzxthpyTySeMTk/0LU7X2KcyZRx9+ibRWnODOEU=
From: WANG Xuerui <git@xen0n.name>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 00/31] LoongArch64 port of QEMU TCG
Date: Tue, 14 Dec 2021 16:01:23 +0800
Message-Id: <20211214080154.196350-1-git@xen0n.name>
X-Mailer: git-send-email 2.34.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=git@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 XiaoJuan Yang <yangxiaojuan@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>, WANG Xuerui <git@xen0n.name>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Based-on: 20211214002604.161983-1-richard.henderson@linaro.org

Hi all,

This is a port of QEMU TCG to the brand-new CPU architecture LoongArch,
introduced by Loongson with their 3A5000 chips.

Patch 31 (adding Docker image and CI jobs) is still missing Reviewed-by,
and needs someone to take a look at.

Everything is tested on real 3A5000 board (system emulation, linux-user,
make check) and GitLab (CI jobs).

## About the series

Only the LP64D ABI is supported, as this is the only one fully
implemented and supported by Loongson so far. 32-bit support is incomplete
from outset, and removed from the very latest upstream submissions, so you
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
I want to minimize the maintenance burden for future collaboration.

This series touches some of the same files as Song Gao's previous
submission of LoongArch *target* support, which is a bit unfortunate;
one of us will have to rebase after either series gets in. Actual
conflict should only happen on build system bits and include/elf.h,
though, as we're working on entirely different areas.

## How to build and test this

Upstream support for LoongArch is largely WIP for now, which means you
must apply a lot of patches if you want to even cross-build for this arch.
The main sources I used are as follows:

* binutils: (already upstream as of November 2021)
* gcc: https://github.com/xen0n/gcc/tree/for-gentoo-gcc-12-v5
  based on https://github.com/loongson/gcc/tree/loongarch_upstream_v3
* glibc: https://github.com/xen0n/glibc/tree/for-gentoo-glibc-2.34-v3
  based on https://github.com/loongson/glibc/tree/loongarch_2_34_dev
* Linux: https://github.com/xen0n/linux/tree/loongarch-playground-v7
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

v9 -> v8:

- Rebased on top of Richard's lu-safesignal branch for eventual merge

v8 -> v7:

- Rebased to latest development branch
- Adjusted component field of Patch 29's subject line to say
  "linux-user" after rebase
- Adjusted Patch 31 slightly according to review (you can check out the
  Patchew diff between revisions for details)

v7 -> v6:

- Rebased to latest development branch
- Added Docker image for cross-compilation and cross-build CI jobs

v6 -> v5:

- Fixed many places using 0/1 to say false/true
- Tweaks to tcg_out_movi
  - Moved variable declarations to top of function, as per QEMU coding
    style
  - Added ASCII art to better explain names like `hi12` `hi32` and `hi52`
- Added example `uname -a` outputs to commit message of Patch 30 to help
  people make sense of the change

v5 -> v4:

- Updated generated instruction definition to latest (added ldx/stx
  family of indexed load/stores)
- Incorporated Richard's suggestion for tcg_out_movi, tested to cover
  the cases it's supposed to improve
- Fixed a "size == MO_64" occurrence to just say "type"
- Used indexed load/stores to optimize qemu_ld/st
- Fixed zero-extension of address register for qemu_ld/st on 32-bit
  targets

v4 -> v3:

- Addressed all review comments from v3
  - Made MAX_CODE_GEN_BUFFER_SIZE to be just SIZE_MAX (but kept
    TCG_TARGET_NB_REGS as macro definition)
  - Updated generated instruction definition, made it clear that the
    whole file is generated
  - Used deposit64 for hand-written relocation code
  - Reworked tcg_out_movi
    - Use pcalau12i + ori for PC-relative values whose offset fits in
      32-bit
    - Every individual insn in the slow path (lu12i.w + ori + cu32i.d +
      cu52i.d) can be suppressed if not needed
  - Fixed constraint of setcond ops, don't allow constant zero for 1st
    operand

v3 -> v2:

- Addressed all review comments from v2
  - Re-organized changes to tcg-target.h so that it's incrementally
    updated in each commit implementing ops
  - Removed support for the eqv op
  - Added support for bswap16_i{32,64} ops
  - Fixed and refactored various places as pointed out during review
- Updated generated instruction definitions to latest

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

v8: https://patchew.org/QEMU/20211124183231.1503090-1-git@xen0n.name/
v7: https://patchew.org/QEMU/20211122104201.112695-1-git@xen0n.name/
v6: https://patchew.org/QEMU/20210925173032.2434906-1-git@xen0n.name/
v5: https://patchew.org/QEMU/20210924172527.904294-1-git@xen0n.name/
v4: https://patchew.org/QEMU/20210923165939.729081-1-git@xen0n.name/
v3: https://patchew.org/QEMU/20210922180927.666273-1-git@xen0n.name/
v2: https://patchew.org/QEMU/20210921201915.601245-1-git@xen0n.name/
v1: https://patchew.org/QEMU/20210920080451.408655-1-git@xen0n.name/

WANG Xuerui (31):
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
  tcg/loongarch64: Implement not/and/or/xor/nor/andc/orc ops
  tcg/loongarch64: Implement deposit/extract ops
  tcg/loongarch64: Implement bswap{16,32,64} ops
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
  common-user: Add safe syscall handling for loongarch64 hosts
  linux-user: Implement CPU-specific signal handler for loongarch64
    hosts
  configure, meson.build: Mark support for loongarch64 hosts
  tests/docker: Add gentoo-loongarch64-cross image and run cross builds
    in GitLab

 .gitlab-ci.d/container-cross.yml              |   27 +
 .gitlab-ci.d/crossbuilds.yml                  |   19 +
 MAINTAINERS                                   |    7 +
 .../host/loongarch64/safe-syscall.inc.S       |   81 +
 configure                                     |    7 +-
 include/elf.h                                 |    2 +
 linux-user/host/loongarch64/host-signal.h     |   87 +
 meson.build                                   |    2 +-
 tcg/loongarch64/tcg-insn-defs.c.inc           |  979 ++++++++++
 tcg/loongarch64/tcg-target-con-set.h          |   31 +
 tcg/loongarch64/tcg-target-con-str.h          |   28 +
 tcg/loongarch64/tcg-target.c.inc              | 1677 +++++++++++++++++
 tcg/loongarch64/tcg-target.h                  |  180 ++
 tests/docker/Makefile.include                 |   21 +
 .../gentoo-loongarch64-cross.docker           |   19 +
 .../build-toolchain.sh                        |  125 ++
 16 files changed, 3290 insertions(+), 2 deletions(-)
 create mode 100644 common-user/host/loongarch64/safe-syscall.inc.S
 create mode 100644 linux-user/host/loongarch64/host-signal.h
 create mode 100644 tcg/loongarch64/tcg-insn-defs.c.inc
 create mode 100644 tcg/loongarch64/tcg-target-con-set.h
 create mode 100644 tcg/loongarch64/tcg-target-con-str.h
 create mode 100644 tcg/loongarch64/tcg-target.c.inc
 create mode 100644 tcg/loongarch64/tcg-target.h
 create mode 100644 tests/docker/dockerfiles/gentoo-loongarch64-cross.docker
 create mode 100755 tests/docker/dockerfiles/gentoo-loongarch64-cross.docker.d/build-toolchain.sh

-- 
2.34.0


