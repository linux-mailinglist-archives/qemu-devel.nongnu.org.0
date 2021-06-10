Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 292F73A2744
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:39:18 +0200 (CEST)
Received: from localhost ([::1]:59932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrGDd-0001mS-7H
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFsV-0007nW-BX; Thu, 10 Jun 2021 04:17:27 -0400
Received: from mail142-26.mail.alibaba.com ([198.11.142.26]:6494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lrFsP-0007rr-Dw; Thu, 10 Jun 2021 04:17:27 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1340529|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.238603-0.00565254-0.755744;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=7; RT=7; SR=0; TI=SMTPD_---.KQNWif8_1623313021; 
Received: from localhost.localdomain(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KQNWif8_1623313021)
 by smtp.aliyun-inc.com(10.147.44.145);
 Thu, 10 Jun 2021 16:17:01 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v2 35/37] target/riscv: RV64 Only Non-SIMD 32-bit Shift
 Instructions
Date: Thu, 10 Jun 2021 15:59:06 +0800
Message-Id: <20210610075908.3305506-36-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
References: <20210610075908.3305506-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=198.11.142.26; envelope-from=zhiwei_liu@c-sky.com;
 helo=mail142-26.mail.alibaba.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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

32-bit rounding arithmetic shift right immediate.

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
---
 target/riscv/helper.h                   |  2 ++
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvp.c.inc |  3 +++
 target/riscv/packed_helper.c            | 13 +++++++++++++
 4 files changed, 20 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index aa80095e1d..b998c86abf 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1472,3 +1472,5 @@ DEF_HELPER_4(kmsxda32, tl, env, tl, tl, tl)
 DEF_HELPER_3(smds32, i64, env, i64, i64)
 DEF_HELPER_3(smdrs32, i64, env, i64, i64)
 DEF_HELPER_3(smxds32, i64, env, i64, i64)
+
+DEF_HELPER_3(sraiw_u, i64, env, i64, i64)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index b9eeb57ca7..8e8aca4ea1 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -1095,3 +1095,5 @@ kmsxda32   0100111  ..... ..... 010 ..... 1110111 @r
 smds32     0101100  ..... ..... 010 ..... 1110111 @r
 smdrs32    0110100  ..... ..... 010 ..... 1110111 @r
 smxds32    0111100  ..... ..... 010 ..... 1110111 @r
+
+sraiw_u    0011010  ..... ..... 001 ..... 1110111 @sh5
diff --git a/target/riscv/insn_trans/trans_rvp.c.inc b/target/riscv/insn_trans/trans_rvp.c.inc
index 48bcf37e36..68c1ef9f48 100644
--- a/target/riscv/insn_trans/trans_rvp.c.inc
+++ b/target/riscv/insn_trans/trans_rvp.c.inc
@@ -1144,3 +1144,6 @@ GEN_RVP64_R_ACC_OOL(kmsxda32);
 GEN_RVP64_R_OOL(smds32);
 GEN_RVP64_R_OOL(smdrs32);
 GEN_RVP64_R_OOL(smxds32);
+
+/* (RV64 Only) Non-SIMD 32-bit Shift Instructions */
+GEN_RVP64_SHIFTI(sraiw_u, gen_helper_sraiw_u);
diff --git a/target/riscv/packed_helper.c b/target/riscv/packed_helper.c
index 834e7dbebb..42f1d96fa5 100644
--- a/target/riscv/packed_helper.c
+++ b/target/riscv/packed_helper.c
@@ -3795,3 +3795,16 @@ static inline void do_smxds32(CPURISCVState *env, void *vd, void *va,
 }
 
 RVPR64_64_64(smxds32, 1, 8);
+
+/* (RV64 Only) Non-SIMD 32-bit Shift Instructions */
+static inline void do_sraiw_u(CPURISCVState *env, void *vd, void *va,
+                              void *vb, uint8_t i)
+{
+    int64_t *d = vd;
+    int32_t *a = va;
+    uint8_t shift = *(uint8_t *)vb;
+
+    *d = vssra32(env, 0, a[H4(i)], shift);
+}
+
+RVPR64_64_64(sraiw_u, 1, 8);
-- 
2.25.1


