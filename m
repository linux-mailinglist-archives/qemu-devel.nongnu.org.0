Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B153B2E14
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 13:45:38 +0200 (CEST)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwNnd-0006py-NP
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 07:45:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNJM-0000VP-QA; Thu, 24 Jun 2021 07:14:20 -0400
Received: from out29-99.mail.aliyun.com ([115.124.29.99]:49173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1lwNJK-0006QB-DV; Thu, 24 Jun 2021 07:14:20 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1296065|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.238603-0.00565254-0.755744;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047203; MF=zhiwei_liu@c-sky.com; NM=1;
 PH=DS; RN=6; RT=6; SR=0; TI=SMTPD_---.KXKY151_1624533253; 
Received: from roman-VirtualBox.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.KXKY151_1624533253)
 by smtp.aliyun-inc.com(10.147.41.138);
 Thu, 24 Jun 2021 19:14:14 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v3 35/37] target/riscv: RV64 Only Non-SIMD 32-bit Shift
 Instructions
Date: Thu, 24 Jun 2021 18:55:19 +0800
Message-Id: <20210624105521.3964-36-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
References: <20210624105521.3964-1-zhiwei_liu@c-sky.com>
Received-SPF: none client-ip=115.124.29.99; envelope-from=zhiwei_liu@c-sky.com;
 helo=out29-99.mail.aliyun.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: palmer@dabbelt.com, bin.meng@windriver.com, Alistair.Francis@wdc.com,
 LIU Zhiwei <zhiwei_liu@c-sky.com>
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
2.17.1


