Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A42D516EAB
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 13:15:49 +0200 (CEST)
Received: from localhost ([::1]:35378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlU1r-0000j4-N0
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 07:15:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nlTyW-0006Ln-1U; Mon, 02 May 2022 07:12:21 -0400
Received: from mail-b.sr.ht ([173.195.146.151]:43514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <outgoing@sr.ht>)
 id 1nlTyO-0004PG-Gk; Mon, 02 May 2022 07:12:19 -0400
Authentication-Results: mail-b.sr.ht; dkim=none 
Received: from git.sr.ht (unknown [173.195.146.142])
 by mail-b.sr.ht (Postfix) with ESMTPSA id CE44F11EEDD;
 Mon,  2 May 2022 11:12:09 +0000 (UTC)
From: ~eopxd <eopxd@git.sr.ht>
Date: Mon, 02 May 2022 11:12:09 +0000
MIME-Version: 1.0
Subject: [PATCH qemu v13 00/15] Add tail agnostic behavior for rvv instructions
Message-ID: <165148992946.19543.7306630137674612238-0@git.sr.ht>
X-Mailer: git.sr.ht
To: qemu-devel@nongnu.org, qemu-riscv@nongnu.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=173.195.146.151; envelope-from=outgoing@sr.ht;
 helo=mail-b.sr.ht
X-Spam_score_int: 2
X-Spam_score: 0.2
X-Spam_bar: /
X-Spam_report: (0.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FORGED_REPLYTO=2.095,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-To: ~eopxd <yueh.ting.chen@gmail.com>
Cc: WeiWei Li <liweiwei@iscas.ac.cn>, Frank Chang <frank.chang@sifive.com>,
 eop Chen <eop.chen@sifive.com>, Bin Meng <bin.meng@windriver.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to v-spec, tail agnostic behavior can be either kept as
undisturbed or set elements' bits to all 1s. To distinguish the
difference of tail policies, QEMU should be able to simulate the tail
agnostic behavior as "set tail elements' bits to all 1s". An option
'rvv_ta_all_1s' is added to enable the behavior, it is default as
disabled.

There are multiple possibility for agnostic elements according to
v-spec. The main intent of this patch-set tries to add option that
can distinguish between tail policies. Setting agnostic elements to
all 1s makes things simple and allow QEMU to express this.

We may explore other possibility of agnostic behavior by adding
other options in the future. Please understand that this patch-set
is limited.

v2 updates:
- Addressed comments from Weiwei Li
- Added commit tail agnostic on load / store instructions (which
  I forgot to include into the patch-set)

v3 updates:
- Missed the very 1st commit, adding it back

v4 updates:
- Renamed vlmax to total_elems
- Deal with tail element when vl_eq_vlmax == true

v5 updates:
- Let `vext_get_total_elems` take `desc` and `esz`
- Utilize `simd_maxsz(desc)` to get `vlenb`
- Fix alignments to code

v6 updates:
- Fix `vext_get_total_elems`

v7 updates:
- Reuse `max_elems` for vector load / store helper functions. The
  translation sets desc's `lmul` to `min(1, lmul)`, making
  `vext_max_elems` equivalent to `vext_get_total_elems`.

v8 updates:
- Simplify `vext_set_elems_1s`, don't need `vext_set_elems_1s_fns`
- Fix `vext_get_total_elems`, it should derive upon EMUL instead
  of LMUL

v9 updates:
- Let instructions that is tail agnostic regardless of vta respect the
  option and not the vta.

v10 updates:
- Correct range to set element to 1s for load instructions

v11 updates:
- Separate addition of option 'rvv_ta_all_1s' as a new (last) commit
- Add description to show intent of the option in first commit for the
  optional tail agnostic behavior
- Tag WeiWei as Reviewed-by for all commits
- Tag Alistair as Reviewed-by for commit 01, 02
- Tag Alistair as Acked-by for commit 03

v12 updates:
- Add missing space in WeiWei's "Reviewed-by" tag

v13 updates:
- Fix tail agnostic for vext_ldst_us. The function operates on input
  parameter 'evl' rather than 'env->vl'.
- Fix tail elements for vector segment load / store instructions
  A vector segment load / store instruction may contain fractional
  lmul with nf * lmul > 1. The rest of the elements in the last
  register should be treated as tail elements.
- Fix tail agnostic length for instructions with mask destination
  register. Instructions with mask destination register should have
  'vlen - vl' tail elements.

eopXD (15):
  target/riscv: rvv: Prune redundant ESZ, DSZ parameter passed
  target/riscv: rvv: Rename ambiguous esz
  target/riscv: rvv: Early exit when vstart >= vl
  target/riscv: rvv: Add tail agnostic for vv instructions
  target/riscv: rvv: Add tail agnostic for vector load / store
    instructions
  target/riscv: rvv: Add tail agnostic for vx, vvm, vxm instructions
  target/riscv: rvv: Add tail agnostic for vector integer shift
    instructions
  target/riscv: rvv: Add tail agnostic for vector integer comparison
    instructions
  target/riscv: rvv: Add tail agnostic for vector integer merge and move
    instructions
  target/riscv: rvv: Add tail agnostic for vector fix-point arithmetic
    instructions
  target/riscv: rvv: Add tail agnostic for vector floating-point
    instructions
  target/riscv: rvv: Add tail agnostic for vector reduction instructions
  target/riscv: rvv: Add tail agnostic for vector mask instructions
  target/riscv: rvv: Add tail agnostic for vector permutation
    instructions
  target/riscv: rvv: Add option 'rvv_ta_all_1s' to enable optional tail
    agnostic behavior

 target/riscv/cpu.c                      |    1 +
 target/riscv/cpu.h                      |    2 +
 target/riscv/cpu_helper.c               |    2 +
 target/riscv/insn_trans/trans_rvv.c.inc |  176 +++
 target/riscv/internals.h                |    6 +-
 target/riscv/translate.c                |    4 +
 target/riscv/vector_helper.c            | 1558 ++++++++++++++---------
 7 files changed, 1132 insertions(+), 617 deletions(-)

-- 
2.34.2

