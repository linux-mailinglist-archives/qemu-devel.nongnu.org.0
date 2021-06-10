Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D43743A25FE
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:00:48 +0200 (CEST)
Received: from localhost ([::1]:37562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrFcN-0004Xd-TG
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:00:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40080)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFb1-0002r3-G8; Thu, 10 Jun 2021 03:59:23 -0400
Received: from out28-195.mail.aliyun.com ([115.124.28.195]:49203)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFay-0005gf-32; Thu, 10 Jun 2021 03:59:23 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1083409|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0310271-0.000305969-0.968667;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047208; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQMiwz0_1623311954; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQMiwz0_1623311954)
 by smtp.aliyun-inc.com(10.147.41.143);
 Thu, 10 Jun 2021 15:59:14 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 00/37] target/riscv: support packed extension v0.9.4
Date: Thu, 10 Jun 2021 15:58:31 +0800
Message-Id: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.195; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-195.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, richard.henderson@linaro.org, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patchset implements the packed extension for RISC-V on QEMU.

This patchset have passed all my direct Linux user mode cases(RV64) on
X86-64 Ubuntu host machine. You can also find this patch set on my
repo(https://github.com/romanheros/qemu.git branch:packed-upstream-v2).

I have ported packed extension on RISU, but I can't compare with SPIKE 
because the SPIKE PK lacks of socket and signal process syscalls. Neither
with RISCOF, as its P extension is not complete. If anyone has random
test method, please let me know.

Features:
* support specification packed extension 
  v0.9.4(https://github.com/riscv/riscv-p-spec/)
* support basic packed extension.
* support Zpsoperand.

v2:
* remove all the TARGET_RISCV64 macro.
* use tcg_gen_vec_* to accelabrate.
* update specficication to latest v0.9.4
* fix kmsxda32, kmsda32,kslra32,smal

LIU Zhiwei (37):
  target/riscv: implementation-defined constant parameters
  target/riscv: Make the vector helper functions public
  target/riscv: 16-bit Addition & Subtraction Instructions
  target/riscv: 8-bit Addition & Subtraction Instruction
  target/riscv: SIMD 16-bit Shift Instructions
  target/riscv: SIMD 8-bit Shift Instructions
  target/riscv: SIMD 16-bit Compare Instructions
  target/riscv: SIMD 8-bit Compare Instructions
  target/riscv: SIMD 16-bit Multiply Instructions
  target/riscv: SIMD 8-bit Multiply Instructions
  target/riscv: SIMD 16-bit Miscellaneous Instructions
  target/riscv: SIMD 8-bit Miscellaneous Instructions
  target/riscv: 8-bit Unpacking Instructions
  target/riscv: 16-bit Packing Instructions
  target/riscv: Signed MSW 32x32 Multiply and Add Instructions
  target/riscv: Signed MSW 32x16 Multiply and Add Instructions
  target/riscv: Signed 16-bit Multiply 32-bit Add/Subtract Instructions
  target/riscv: Signed 16-bit Multiply 64-bit Add/Subtract Instructions
  target/riscv: Partial-SIMD Miscellaneous Instructions
  target/riscv: 8-bit Multiply with 32-bit Add Instructions
  target/riscv: 64-bit Add/Subtract Instructions
  target/riscv: 32-bit Multiply 64-bit Add/Subtract Instructions
  target/riscv: Signed 16-bit Multiply with 64-bit Add/Subtract
    Instructions
  target/riscv: Non-SIMD Q15 saturation ALU Instructions
  target/riscv: Non-SIMD Q31 saturation ALU Instructions
  target/riscv: 32-bit Computation Instructions
  target/riscv: Non-SIMD Miscellaneous Instructions
  target/riscv: RV64 Only SIMD 32-bit Add/Subtract Instructions
  target/riscv: RV64 Only SIMD 32-bit Shift Instructions
  target/riscv: RV64 Only SIMD 32-bit Miscellaneous Instructions
  target/riscv: RV64 Only SIMD Q15 saturating Multiply Instructions
  target/riscv: RV64 Only 32-bit Multiply Instructions
  target/riscv: RV64 Only 32-bit Multiply & Add Instructions
  target/riscv: RV64 Only 32-bit Parallel Multiply & Add Instructions
  target/riscv: RV64 Only Non-SIMD 32-bit Shift Instructions
  target/riscv: RV64 Only 32-bit Packing Instructions
  target/riscv: configure and turn on packed extension from command line

 include/tcg/tcg-op-gvec.h               |   38 +
 target/riscv/cpu.c                      |   34 +
 target/riscv/cpu.h                      |    6 +
 target/riscv/helper.h                   |  330 ++
 target/riscv/insn32.decode              |  370 +++
 target/riscv/insn_trans/trans_rvp.c.inc | 1155 +++++++
 target/riscv/internals.h                |   50 +
 target/riscv/meson.build                |    1 +
 target/riscv/packed_helper.c            | 3851 +++++++++++++++++++++++
 target/riscv/translate.c                |    3 +
 target/riscv/vector_helper.c            |   82 +-
 tcg/tcg-op-gvec.c                       |  131 +
 12 files changed, 5993 insertions(+), 58 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvp.c.inc
 create mode 100644 target/riscv/packed_helper.c

-- 
2.25.1


