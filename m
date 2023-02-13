Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B57B5694ED9
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:08:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdF6-0000Sj-8K; Mon, 13 Feb 2023 13:07:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdEx-0000Qn-E0; Mon, 13 Feb 2023 13:07:48 -0500
Received: from bg4.exmail.qq.com ([43.154.221.58])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng@tinylab.org>)
 id 1pRdEs-00024w-Kn; Mon, 13 Feb 2023 13:07:47 -0500
X-QQ-Spam: true
X-QQ-mid: bizesmtp62t1676311384t21qd7k6
Received: from pek-vx-bsp2.wrs.com ( [60.247.85.88])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Tue, 14 Feb 2023 02:03:03 +0800 (CST)
X-QQ-SSF: 01200000000000C0D000000A0000000
From: Bin Meng <bmeng@tinylab.org>
To: qemu-devel@nongnu.org
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 qemu-riscv@nongnu.org
Subject: [PATCH 07/18] target/riscv: Simplify {read,
 write}_pmpcfg() a little bit
Date: Tue, 14 Feb 2023 02:02:03 +0800
Message-Id: <20230213180215.1524938-8-bmeng@tinylab.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230213180215.1524938-1-bmeng@tinylab.org>
References: <20230213180215.1524938-1-bmeng@tinylab.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvr:qybglogicsvr3
Received-SPF: pass client-ip=43.154.221.58; envelope-from=bmeng@tinylab.org;
 helo=bg4.exmail.qq.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Use the register index that has already been calculated in the
pmpcfg_csr_{read,write} call.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
---

 target/riscv/csr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/target/riscv/csr.c b/target/riscv/csr.c
index 8bbc75cbfa..da3b770894 100644
--- a/target/riscv/csr.c
+++ b/target/riscv/csr.c
@@ -3363,7 +3363,7 @@ static RISCVException read_pmpcfg(CPURISCVState *env, int csrno,
     if (!check_pmp_reg_index(env, reg_index)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    *val = pmpcfg_csr_read(env, csrno - CSR_PMPCFG0);
+    *val = pmpcfg_csr_read(env, reg_index);
     return RISCV_EXCP_NONE;
 }
 
@@ -3375,7 +3375,7 @@ static RISCVException write_pmpcfg(CPURISCVState *env, int csrno,
     if (!check_pmp_reg_index(env, reg_index)) {
         return RISCV_EXCP_ILLEGAL_INST;
     }
-    pmpcfg_csr_write(env, csrno - CSR_PMPCFG0, val);
+    pmpcfg_csr_write(env, reg_index, val);
     return RISCV_EXCP_NONE;
 }
 
-- 
2.25.1


