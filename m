Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97429174796
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Feb 2020 16:09:30 +0100 (CET)
Received: from localhost ([::1]:33052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j83k9-0005Yu-NV
	for lists+qemu-devel@lfdr.de; Sat, 29 Feb 2020 10:09:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46211)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j83hm-00027h-9h
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 10:07:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1j83hl-0006aN-7G
 for qemu-devel@nongnu.org; Sat, 29 Feb 2020 10:07:02 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:43006)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1j83hk-0006Ur-NS; Sat, 29 Feb 2020 10:07:01 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1036667|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.143762-0.0303341-0.825904;
 DS=CONTINUE|ham_system_inform|0.0467761-0.00184495-0.951379;
 FP=0|0|0|0|0|-1|-1|-1; HT=e02c03278; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=10; RT=10; SR=0; TI=SMTPD_---.GuBq59D_1582988809; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GuBq59D_1582988809)
 by smtp.aliyun-inc.com(10.147.40.200);
 Sat, 29 Feb 2020 23:06:49 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: richard.henderson@linaro.org, alistair23@gmail.com,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v6 0/4] target-riscv: support vector extension part 1 
Date: Sat, 29 Feb 2020 23:04:09 +0800
Message-Id: <20200229150413.24950-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 121.197.200.217
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
Cc: qemu-riscv@nongnu.org, qemu-devel@nongnu.org, linux-csky@vger.kernel.org,
 wenmeng_zhang@c-sky.com, wxy194768@alibaba-inc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the first part of v6 patchset. The changelog of v6 is only coverd
the part1.

Features:
  * support specification riscv-v-spec-0.7.1.
  * support basic vector extension.
  * support Zvlsseg.
  * support Zvamo.
  * not support Zvediv as it is changing.
  * SLEN always equals VLEN.
  * element width support 8bit, 16bit, 32bit, 64bit.

Changelog:
v6
  * keep vector CSR in read/write order
  * define fields name of VTYPE just like specification.
v5
  * vector registers as direct fields in RISCVCPUState.
  * mov the properties to last patch.
  * check RVV in vs().
  * check if rs1 is x0 in vsetvl/vsetvli.
  * check VILL, EDIV, RESERVED fileds in vsetvl.
v4
  * adjust max vlen to 512 bits.
  * check maximum on elen(64bits).
  * check minimum on vlen(128bits).
  * check if rs1 is x0 in vsetvl/vsetvli.
  * use gen_goto_tb in vsetvli instead of exit_tb.
  * fixup fetch vlmax from rs2, not env->vext.type.
v3
  * support VLEN configure from qemu command line.
  * support ELEN configure from qemu command line.
  * support vector specification version configure from qemu command line.
  * only default on for "any" cpu, others turn on from command line.
  * use a continous memory block for vector register description.
V2
  * use float16_compare{_quiet}
  * only use GETPC() in outer most helper
  * add ctx.ext_v Property

LIU Zhiwei (4):
  target/riscv: add vector extension field in CPURISCVState
  target/riscv: implementation-defined constant parameters
  target/riscv: support vector extension csr
  target/riscv: add vector configure instruction

 target/riscv/Makefile.objs              |  2 +-
 target/riscv/cpu.c                      |  7 +++
 target/riscv/cpu.h                      | 78 ++++++++++++++++++++++---
 target/riscv/cpu_bits.h                 | 15 +++++
 target/riscv/csr.c                      | 75 +++++++++++++++++++++++-
 target/riscv/helper.h                   |  2 +
 target/riscv/insn32.decode              |  5 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 69 ++++++++++++++++++++++
 target/riscv/translate.c                | 17 +++++-
 target/riscv/vector_helper.c            | 53 +++++++++++++++++
 10 files changed, 311 insertions(+), 12 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvv.inc.c
 create mode 100644 target/riscv/vector_helper.c

-- 
2.23.0


