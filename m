Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C859201FF1
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Jun 2020 04:57:08 +0200 (CEST)
Received: from localhost ([::1]:34894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jmTgp-0000UV-1r
	for lists+qemu-devel@lfdr.de; Fri, 19 Jun 2020 22:57:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jmTfo-0008S8-1T; Fri, 19 Jun 2020 22:56:04 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:52590)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jmTfj-00067K-Dj; Fri, 19 Jun 2020 22:56:03 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07441942|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.015081-0.000550396-0.984369;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16367; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=8; RT=8; SR=0; TI=SMTPD_---.HpV3V17_1592621748; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HpV3V17_1592621748)
 by smtp.aliyun-inc.com(10.147.42.198);
 Sat, 20 Jun 2020 10:55:49 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v10 00/61] target/riscv: support vector extension v0.7.1
Date: Sat, 20 Jun 2020 10:54:39 +0800
Message-Id: <20200620025540.1109-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/19 21:09:48
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: richard.henderson@linaro.org, wxy194768@alibaba-inc.com,
 wenmeng_zhang@c-sky.com, Alistair.Francis@wdc.com, palmer@dabbelt.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset implements the vector extension for RISC-V on QEMU.

You can also find the patchset and all *test cases* in
my repo(https://github.com/romanheros/qemu.git branch:vector-upstream-v10).
All the test cases are in the directory qemu/tests/riscv/vector/. They are
riscv64 linux user mode programs.

You can test the patchset by the script qemu/tests/riscv/vector/runcase.sh.

Features:
  * support specification riscv-v-spec-0.7.1.(https://github.com/riscv/riscv-v-spec/releases/tag/0.7.1/)
  * support basic vector extension.
  * support Zvlsseg.
  * support Zvamo.
  * not support Zvediv as it is changing.
  * SLEN always equals VLEN.
  * element width support 8bit, 16bit, 32bit, 64bit.

Changelog:
v10
  * rebase to https://github.com/alistair23/qemu/tree/riscv-to-apply.next.
  * fix compile error in patch 57/61.
  * fix review tag typo.

v9
  * always set dynamic rounding mode for vector float insns.
  * bug fix atomic implementation.
  * bug fix first-only-fault.
  * some small tidy up.

v8
  * support different float rounding modes for vector instructions.
  * use lastest released TCG GVEC DUP IR.
  * set RV_VLEN_MAX to 256 bits, as GVEC IR uses simd_desc.

v7
  * move vl == 0 check to translation time by add a global cpu_vl.
  * implement vector element inline load and store function by TCG IR.
  * based on vec_element_load(store), implement some permutation instructions.
  * implement rsubs GVEC IR.
  * fixup vsmul, vmfne, vfmerge, vslidedown.
  * some other small bugs and indentation errors.

v6
  * use gvec_dup Gvec IR to accellerate move and merge.
  * a better way to implement fixed point instructions.
  * a global check when vl == 0.
  * limit some macros to only one inline function call.
  * fixup sew error when use Gvec IR.
  * fixup bugs for corner cases.

v5
  * fixup a bug in tb flags.

v4
  * no change

v3
  * move check code from execution-time to translation-time
  * use a continous memory block for vector register description.
  * vector registers as direct fields in RISCVCPUState.
  * support VLEN configure from qemu command line.
  * support ELEN configure from qemu command line.
  * support vector specification version configure from qemu command line.
  * probe pages before real load or store access.
  * use probe_page_check for no-fault operations in linux user mode.
  * generation atomic exit exception when in parallel environment.
  * fixup a lot of concrete bugs.

V2
  * use float16_compare{_quiet}
  * only use GETPC() in outer most helper
  * add ctx.ext_v Property



LIU Zhiwei (61):
  target/riscv: add vector extension field in CPURISCVState
  target/riscv: implementation-defined constant parameters
  target/riscv: support vector extension csr
  target/riscv: add vector configure instruction
  target/riscv: add an internals.h header
  target/riscv: add vector stride load and store instructions
  target/riscv: add vector index load and store instructions
  target/riscv: add fault-only-first unit stride load
  target/riscv: add vector amo operations
  target/riscv: vector single-width integer add and subtract
  target/riscv: vector widening integer add and subtract
  target/riscv: vector integer add-with-carry / subtract-with-borrow
    instructions
  target/riscv: vector bitwise logical instructions
  target/riscv: vector single-width bit shift instructions
  target/riscv: vector narrowing integer right shift instructions
  target/riscv: vector integer comparison instructions
  target/riscv: vector integer min/max instructions
  target/riscv: vector single-width integer multiply instructions
  target/riscv: vector integer divide instructions
  target/riscv: vector widening integer multiply instructions
  target/riscv: vector single-width integer multiply-add instructions
  target/riscv: vector widening integer multiply-add instructions
  target/riscv: vector integer merge and move instructions
  target/riscv: vector single-width saturating add and subtract
  target/riscv: vector single-width averaging add and subtract
  target/riscv: vector single-width fractional multiply with rounding
    and saturation
  target/riscv: vector widening saturating scaled multiply-add
  target/riscv: vector single-width scaling shift instructions
  target/riscv: vector narrowing fixed-point clip instructions
  target/riscv: vector single-width floating-point add/subtract
    instructions
  target/riscv: vector widening floating-point add/subtract instructions
  target/riscv: vector single-width floating-point multiply/divide
    instructions
  target/riscv: vector widening floating-point multiply
  target/riscv: vector single-width floating-point fused multiply-add
    instructions
  target/riscv: vector widening floating-point fused multiply-add
    instructions
  target/riscv: vector floating-point square-root instruction
  target/riscv: vector floating-point min/max instructions
  target/riscv: vector floating-point sign-injection instructions
  target/riscv: vector floating-point compare instructions
  target/riscv: vector floating-point classify instructions
  target/riscv: vector floating-point merge instructions
  target/riscv: vector floating-point/integer type-convert instructions
  target/riscv: widening floating-point/integer type-convert
    instructions
  target/riscv: narrowing floating-point/integer type-convert
    instructions
  target/riscv: vector single-width integer reduction instructions
  target/riscv: vector wideing integer reduction instructions
  target/riscv: vector single-width floating-point reduction
    instructions
  target/riscv: vector widening floating-point reduction instructions
  target/riscv: vector mask-register logical instructions
  target/riscv: vector mask population count vmpopc
  target/riscv: vmfirst find-first-set mask bit
  target/riscv: set-X-first mask bit
  target/riscv: vector iota instruction
  target/riscv: vector element index instruction
  target/riscv: integer extract instruction
  target/riscv: integer scalar move instruction
  target/riscv: floating-point scalar move instructions
  target/riscv: vector slide instructions
  target/riscv: vector register gather instruction
  target/riscv: vector compress instruction
  target/riscv: configure and turn on vector extension from command line

 target/riscv/Makefile.objs              |    2 +-
 target/riscv/cpu.c                      |   50 +
 target/riscv/cpu.h                      |   82 +-
 target/riscv/cpu_bits.h                 |   15 +
 target/riscv/csr.c                      |   75 +-
 target/riscv/fpu_helper.c               |   33 +-
 target/riscv/helper.h                   | 1069 +++++
 target/riscv/insn32-64.decode           |   11 +
 target/riscv/insn32.decode              |  372 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 2888 +++++++++++++
 target/riscv/internals.h                |   41 +
 target/riscv/translate.c                |   27 +-
 target/riscv/vector_helper.c            | 4899 +++++++++++++++++++++++
 13 files changed, 9520 insertions(+), 44 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvv.inc.c
 create mode 100644 target/riscv/internals.h
 create mode 100644 target/riscv/vector_helper.c

-- 
2.23.0


