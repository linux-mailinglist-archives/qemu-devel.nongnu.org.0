Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9860412F38F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jan 2020 04:35:52 +0100 (CET)
Received: from localhost ([::1]:48284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1inDkc-0006JZ-O1
	for lists+qemu-devel@lfdr.de; Thu, 02 Jan 2020 22:35:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43706)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1inDiz-0004zx-SM
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 22:34:10 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <zhiwei_liu@c-sky.com>) id 1inDiy-00037F-Qn
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 22:34:09 -0500
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:54790)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1inDiy-0002uH-Et
 for qemu-devel@nongnu.org; Thu, 02 Jan 2020 22:34:08 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.278808|-1; CH=green;
 DM=CONTINUE|CONTINUE|true|0.173433-0.0325199-0.794047; DS=||;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01l04364; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=9; SR=0; TI=SMTPD_---.GV9YvOJ_1578022440; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.GV9YvOJ_1578022440)
 by smtp.aliyun-inc.com(10.147.42.16); Fri, 03 Jan 2020 11:34:01 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: alistair23@gmail.com, richard.henderson@linaro.org,
 chihmin.chao@sifive.com, palmer@dabbelt.com
Subject: [PATCH v3 0/4] RISC-V: support vector extension part 1
Date: Fri,  3 Jan 2020 11:33:43 +0800
Message-Id: <20200103033347.20909-1-zhiwei_liu@c-sky.com>
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
Cc: wenmeng_zhang@c-sky.com, qemu-riscv@nongnu.org, qemu-devel@nongnu.org,
 wxy194768@alibaba-inc.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is the first part of v3 patchset. The changelog of v3 is only coverd
the part1.

Features:
  * support specification riscv-v-spec-0.7.1.
  * support basic vector extension.                                                
  * support Zvlsseg.                                                               
  * support Zvamo.                                                                 
  * not support Zvediv as it is changing.
  * fixed SLEN 128bit.
  * element width support 8bit, 16bit, 32bit, 64bit.

Changelog:
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
  RISC-V: add vector extension field in CPURISCVState
  RISC-V: configure and turn on vector extension from command line
  RISC-V: support vector extension csr
  RISC-V: add vector extension configure instruction

 target/riscv/Makefile.objs              |  2 +-
 target/riscv/cpu.c                      | 43 +++++++++++-
 target/riscv/cpu.h                      | 77 ++++++++++++++++++---
 target/riscv/cpu_bits.h                 | 15 ++++
 target/riscv/csr.c                      | 92 +++++++++++++++++--------
 target/riscv/helper.h                   |  2 +
 target/riscv/insn32.decode              |  5 ++
 target/riscv/insn_trans/trans_rvv.inc.c | 52 ++++++++++++++
 target/riscv/translate.c                | 17 ++++-
 target/riscv/vector_helper.c            | 51 ++++++++++++++
 10 files changed, 314 insertions(+), 42 deletions(-)
 create mode 100644 target/riscv/insn_trans/trans_rvv.inc.c
 create mode 100644 target/riscv/vector_helper.c

-- 
2.23.0


