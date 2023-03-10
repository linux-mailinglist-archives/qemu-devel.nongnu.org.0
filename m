Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9166B4BEB
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 17:05:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pafE6-0002rV-RT; Fri, 10 Mar 2023 11:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafDr-0002f2-2D
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:03:59 -0500
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lawrence.hunter@codethink.co.uk>)
 id 1pafDn-0006at-7H
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 11:03:58 -0500
Received: from [167.98.27.226] (helo=lawrence-thinkpad.office.codethink.co.uk)
 by imap5.colo.codethink.co.uk with esmtpsa (Exim 4.94.2 #2 (Debian))
 id 1pafDh-00H4ad-0S; Fri, 10 Mar 2023 16:03:49 +0000
From: Lawrence Hunter <lawrence.hunter@codethink.co.uk>
To: qemu-devel@nongnu.org
Cc: dickon.hood@codethink.co.uk, nazar.kazakov@codethink.co.uk,
 kiran.ostrolenk@codethink.co.uk, frank.chang@sifive.com,
 palmer@dabbelt.com, alistair.francis@wdc.com, bin.meng@windriver.com,
 pbonzini@redhat.com, philipp.tomsich@vrull.eu, kvm@vger.kernel.org,
 Lawrence Hunter <lawrence.hunter@codethink.co.uk>
Subject: [PATCH 00/45] Add RISC-V vector cryptographic instruction set support
Date: Fri, 10 Mar 2023 16:03:01 +0000
Message-Id: <20230310160346.1193597-1-lawrence.hunter@codethink.co.uk>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=78.40.148.171;
 envelope-from=lawrence.hunter@codethink.co.uk; helo=imap5.colo.codethink.co.uk
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

NB: this is an update over the patch series submitted today (2023/03/10) at 09:11. It fixes some accidental mangling of commits 02, 04 and 08/45.

This patchset provides an implementation for Zvkb, Zvkned, Zvknh, Zvksh, Zvkg, and Zvksed of the draft RISC-V vector cryptography extensions as per the 20230303 version of the specification(1) (1fcbb30). Please note that the Zvkt data-independent execution latency extension has not been implemented, and we would recommend not using these patches in an environment where timing attacks are an issue.

Work performed by Dickon, Lawrence, Nazar, Kiran, and William from Codethink sponsored by SiFive, as well as Max Chou and Frank Chang from SiFive.

For convenience we have created a git repo with our patches on top of a recent master. https://github.com/CodethinkLabs/qemu-ct

1. https://github.com/riscv/riscv-crypto/releases

Dickon Hood (2):
  qemu/bitops.h: Limit rotate amounts
  target/riscv: Add vrol.[vv,vx] and vror.[vv,vx,vi] decoding,
    translation and execution support

Kiran Ostrolenk (7):
  target/riscv: Refactor some of the generic vector functionality
  target/riscv: Refactor some of the generic vector functionality
  target/riscv: Refactor some of the generic vector functionality
  target/riscv: Add vsha2ms.vv decoding, translation and execution
    support
  target/riscv: Add zvksh cpu property
  target/riscv: Add vsm3c.vi decoding, translation and execution support
  target/riscv: Expose zvksh cpu property

Lawrence Hunter (17):
  target/riscv: Add vclmul.vv decoding, translation and execution
    support
  target/riscv: Add vclmul.vx decoding, translation and execution
    support
  target/riscv: Add vclmulh.vv decoding, translation and execution
    support
  target/riscv: Add vclmulh.vx decoding, translation and execution
    support
  target/riscv: Add vaesef.vv decoding, translation and execution
    support
  target/riscv: Add vaesef.vs decoding, translation and execution
    support
  target/riscv: Add vaesdf.vv decoding, translation and execution
    support
  target/riscv: Add vaesdf.vs decoding, translation and execution
    support
  target/riscv: Add vaesdm.vv decoding, translation and execution
    support
  target/riscv: Add vaesdm.vs decoding, translation and execution
    support
  target/riscv: Add vaesz.vs decoding, translation and execution support
  target/riscv: Add vsha2c[hl].vv decoding, translation and execution
    support
  target/riscv: Add vsm3me.vv decoding, translation and execution
    support
  target/riscv: Add zvkg cpu property
  target/riscv: Add vgmul.vv decoding, translation and execution support
  target/riscv: Add vghsh.vv decoding, translation and execution support
  target/riscv: Expose zvkg cpu property

Max Chou (5):
  crypto: Create sm4_subword
  crypto: Add SM4 constant parameter CK
  target/riscv: Add zvksed cfg property
  target/riscv: Add Zvksed support
  target/riscv: Expose Zvksed property

Nazar Kazakov (11):
  target/riscv: Add zvkb cpu property
  target/riscv: Refactor some of the generic vector functionality
  target/riscv: Add vrev8.v decoding, translation and execution support
  target/riscv: Add vandn.[vv,vx] decoding, translation and execution
    support
  target/riscv: Expose zvkb cpu property
  target/riscv: Add zvkned cpu property
  target/riscv: Add vaeskf1.vi decoding, translation and execution
    support
  target/riscv: Add vaeskf2.vi decoding, translation and execution
    support
  target/riscv: Expose zvkned cpu property
  target/riscv: Add zvknh cpu properties
  target/riscv: Expose zvknh cpu properties

William Salmon (3):
  target/riscv: Add vbrev8.v decoding, translation and execution support
  target/riscv: Add vaesem.vv decoding, translation and execution
    support
  target/riscv: Add vaesem.vs decoding, translation and execution
    support

 accel/tcg/tcg-runtime-gvec.c                 |   11 +
 accel/tcg/tcg-runtime.h                      |    1 +
 crypto/sm4.c                                 |   10 +
 include/crypto/sm4.h                         |    9 +
 include/qemu/bitops.h                        |   24 +-
 target/arm/tcg/crypto_helper.c               |   10 +-
 target/riscv/cpu.c                           |   36 +
 target/riscv/cpu.h                           |    7 +
 target/riscv/helper.h                        |   71 ++
 target/riscv/insn32.decode                   |   49 +
 target/riscv/insn_trans/trans_rvv.c.inc      |   93 +-
 target/riscv/insn_trans/trans_rvzvkb.c.inc   |  220 ++++
 target/riscv/insn_trans/trans_rvzvkg.c.inc   |   40 +
 target/riscv/insn_trans/trans_rvzvkned.c.inc |  170 +++
 target/riscv/insn_trans/trans_rvzvknh.c.inc  |   84 ++
 target/riscv/insn_trans/trans_rvzvksed.c.inc |   57 +
 target/riscv/insn_trans/trans_rvzvksh.c.inc  |   43 +
 target/riscv/meson.build                     |    4 +-
 target/riscv/op_helper.c                     |    5 +
 target/riscv/translate.c                     |    6 +
 target/riscv/vcrypto_helper.c                | 1001 ++++++++++++++++++
 target/riscv/vector_helper.c                 |  240 +----
 target/riscv/vector_internals.c              |   81 ++
 target/riscv/vector_internals.h              |  222 ++++
 24 files changed, 2192 insertions(+), 302 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvzvkb.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvkg.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvkned.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvknh.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvksed.c.inc
 create mode 100644 target/riscv/insn_trans/trans_rvzvksh.c.inc
 create mode 100644 target/riscv/vcrypto_helper.c
 create mode 100644 target/riscv/vector_internals.c
 create mode 100644 target/riscv/vector_internals.h

-- 
2.39.2


