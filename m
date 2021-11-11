Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EC444D1CF
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 07:09:52 +0100 (CET)
Received: from localhost ([::1]:51066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ml3HT-0002Ph-Gw
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 01:09:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml39c-0004S3-WB; Thu, 11 Nov 2021 01:01:45 -0500
Received: from out28-221.mail.aliyun.com ([115.124.28.221]:45563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1ml39Z-0003dO-PW; Thu, 11 Nov 2021 01:01:44 -0500
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.09586921|-1; CH=green;
 DM=|CONTINUE|false|; DS=CONTINUE|ham_alarm|0.00303542-0.000152183-0.996812;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047209; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.Lr0rn9S_1636610497; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.Lr0rn9S_1636610497)
 by smtp.aliyun-inc.com(10.147.42.197);
 Thu, 11 Nov 2021 14:01:37 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 07/20] target/riscv: Adjust csr write mask with XLEN
Date: Thu, 11 Nov 2021 13:57:47 +0800
Message-Id: <20211111055800.42672-8-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
References: <20211111055800.42672-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=115.124.28.221; envelope-from=zhiwei_liu@c-sky.com;
 helo=out28-221.mail.aliyun.com
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

Write mask is representing the bits we care about.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/insn_trans/trans_rvi.c.inc | 4 ++--
 target/riscv/op_helper.c                | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/target/riscv/insn_trans/trans_rvi.c.inc b/target/riscv/insn_trans/trans_rvi.c.inc
index e51dbc41c5..40c81421f2 100644
--- a/target/riscv/insn_trans/trans_rvi.c.inc
+++ b/target/riscv/insn_trans/trans_rvi.c.inc
@@ -486,7 +486,7 @@ static bool trans_csrrw(DisasContext *ctx, arg_csrrw *a)
         return do_csrw(ctx, a->csr, src);
     }
 
-    TCGv mask = tcg_constant_tl(-1);
+    TCGv mask = tcg_constant_tl(get_xl(ctx) == MXL_RV32 ? UINT32_MAX : -1);
     return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
@@ -537,7 +537,7 @@ static bool trans_csrrwi(DisasContext *ctx, arg_csrrwi *a)
         return do_csrw(ctx, a->csr, src);
     }
 
-    TCGv mask = tcg_constant_tl(-1);
+    TCGv mask = tcg_constant_tl(get_xl(ctx) == MXL_RV32 ? UINT32_MAX : -1);
     return do_csrrw(ctx, a->rd, a->csr, src, mask);
 }
 
diff --git a/target/riscv/op_helper.c b/target/riscv/op_helper.c
index 095d39671b..561e156bec 100644
--- a/target/riscv/op_helper.c
+++ b/target/riscv/op_helper.c
@@ -50,7 +50,8 @@ target_ulong helper_csrr(CPURISCVState *env, int csr)
 
 void helper_csrw(CPURISCVState *env, int csr, target_ulong src)
 {
-    RISCVException ret = riscv_csrrw(env, csr, NULL, src, -1);
+    target_ulong mask = cpu_get_xl(env) == MXL_RV32 ? UINT32_MAX : -1;
+    RISCVException ret = riscv_csrrw(env, csr, NULL, src, mask);
 
     if (ret != RISCV_EXCP_NONE) {
         riscv_raise_exception(env, ret, GETPC());
-- 
2.25.1


