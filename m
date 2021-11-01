Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1117F44199D
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 11:13:44 +0100 (CET)
Received: from localhost ([::1]:49364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhUJz-00034r-0K
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 06:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8f-0001Uy-9v; Mon, 01 Nov 2021 06:02:01 -0400
Received: from out28-1.mail.aliyun.com ([115.124.28.1]:40546)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mhU8a-0001Te-DW; Mon, 01 Nov 2021 06:02:00 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1456845|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.00722336-0.00039027-0.992386;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047187; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LlcGtUT_1635760905; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LlcGtUT_1635760905)
 by smtp.aliyun-inc.com(10.147.43.230);
 Mon, 01 Nov 2021 18:01:46 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH 00/13] Support UXL filed in xstatus.  
Date: Mon,  1 Nov 2021 18:01:30 +0800
Message-Id: <20211101100143.44356-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.1; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-1.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: palmer@dabbelt.com, richard.henderson@linaro.org, bin.meng@windriver.com,
 Alistair.Francis@wdc.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In this patch set, we process the pc reigsters writes,
gdb reads and writes, and address calculation under
different UXLEN settings.

LIU Zhiwei (13):
  target/riscv: Sign extend pc for different ol
  target/riscv: Extend pc for runtime pc write
  target/riscv: Ignore the pc bits above XLEN
  target/riscv: Use gdb xml according to max mxlen
  target/riscv: Calculate address according to ol
  target/riscv: Adjust vsetvl according to ol
  target/riscv: Ajdust vector atomic check with ol
  target/riscv: Fix check range for first fault only
  target/riscv: Adjust vector address with ol
  target/riscv: Adjust scalar reg in vector with ol
  target/riscv: Switch context in exception return
  target/riscv: Don't save pc when exception return
  target/riscv: Enable uxl field write

 target/riscv/cpu.c                            | 20 ++++-
 target/riscv/cpu.h                            |  4 +
 target/riscv/cpu_helper.c                     |  4 +-
 target/riscv/csr.c                            |  6 +-
 target/riscv/gdbstub.c                        | 73 ++++++++++++-----
 target/riscv/helper.h                         |  7 +-
 target/riscv/insn_trans/trans_privileged.c.inc|  9 +--
 target/riscv/insn_trans/trans_rvd.c.inc       | 20 ++---
 target/riscv/insn_trans/trans_rvf.c.inc       | 21 ++---
 target/riscv/insn_trans/trans_rvi.c.inc       | 23 +++---
 target/riscv/insn_trans/trans_rvv.c.inc       | 19 +++--
 target/riscv/internals.h                      |  1 +
 target/riscv/op_helper.c                      | 30 ++++++-
 target/riscv/translate.c                      | 23 +++++-
 target/riscv/vector_helper.c                  | 81 +++++++++++++------
 15 files changed, 233 insertions(+), 108 deletions(-)

-- 
2.25.1


