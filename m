Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015B144D997
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:53:27 +0100 (CET)
Received: from localhost ([::1]:46062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCOD-0003eq-LN
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:53:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCMs-0001xL-VI; Thu, 11 Nov 2021 10:52:03 -0500
Received: from out28-76.mail.aliyun.com ([115.124.28.76]:34287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1mlCMp-0007Yh-MQ; Thu, 11 Nov 2021 10:52:02 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.07610238|-1; CH=green;
 DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0442204-0.000510888-0.955269;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047198; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.LrJAD8d_1636645911; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.LrJAD8d_1636645911)
 by smtp.aliyun-inc.com(10.147.44.145);
 Thu, 11 Nov 2021 23:51:52 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v4 00/20] Support UXL filed in xstatus
Date: Thu, 11 Nov 2021 23:51:29 +0800
Message-Id: <20211111155149.58172-1-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.76; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-76.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

The patch set v4 mainly address Richard comments on v3.
Patch 8, 18, 19, 20 have not been reviewed. Others have been reviewed or acked.

v4:
  Support SSTATUS64_UXL write
  Bump vmstate version for vill split

v3:
  Merge gen_pm_adjust_address into a canonical address function
  Adjust address for RVA with XLEN
  Split pm_enabled into pm_mask_enabled and pm_base_enabled
  Replace array of pm tcg globals with one scalar tcg global
  Split and change patch sequence

v2:
  Split out vill from vtype
  Remove context switch when xlen changes at exception
  Use XL instead of OL in many places
  Use pointer masking and XLEN for vector address
  Define an common fuction to calculate address for ldst


LIU Zhiwei (20):
  target/riscv: Don't save pc when exception return
  target/riscv: Sign extend pc for different XLEN
  target/riscv: Ignore the pc bits above XLEN
  target/riscv: Extend pc for runtime pc write
  target/riscv: Use gdb xml according to max mxlen
  target/riscv: Relax debug check for pm write
  target/riscv: Adjust csr write mask with XLEN
  target/riscv: Create current pm fields in env
  target/riscv: Alloc tcg global for cur_pm[mask|base]
  target/riscv: Calculate address according to XLEN
  target/riscv: Split pm_enabled into mask and base
  target/riscv: Split out the vill from vtype
  target/riscv: Fix RESERVED field length in VTYPE
  target/riscv: Adjust vsetvl according to XLEN
  target/riscv: Remove VILL field in VTYPE
  target/riscv: Ajdust vector atomic check with XLEN
  target/riscv: Fix check range for first fault only
  target/riscv: Adjust vector address with mask
  target/riscv: Adjust scalar reg in vector with XLEN
  target/riscv: Enable uxl field write

 target/riscv/cpu.c                            | 23 +++++-
 target/riscv/cpu.h                            | 13 +++-
 target/riscv/cpu_bits.h                       |  2 +
 target/riscv/cpu_helper.c                     | 66 ++++++++++++----
 target/riscv/csr.c                            | 43 ++++++++++-
 target/riscv/gdbstub.c                        | 71 ++++++++++++-----
 target/riscv/helper.h                         |  6 +-
 .../riscv/insn_trans/trans_privileged.c.inc   |  7 +-
 target/riscv/insn_trans/trans_rva.c.inc       |  9 +--
 target/riscv/insn_trans/trans_rvd.c.inc       | 19 +----
 target/riscv/insn_trans/trans_rvf.c.inc       | 19 +----
 target/riscv/insn_trans/trans_rvi.c.inc       | 22 +-----
 target/riscv/insn_trans/trans_rvv.c.inc       | 51 ++++++++----
 target/riscv/machine.c                        | 15 +++-
 target/riscv/op_helper.c                      |  7 +-
 target/riscv/translate.c                      | 77 +++++++++----------
 target/riscv/vector_helper.c                  | 38 +++++----
 17 files changed, 300 insertions(+), 188 deletions(-)

-- 
2.25.1


