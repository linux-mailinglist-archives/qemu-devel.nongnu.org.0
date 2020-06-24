Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 209F5206879
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Jun 2020 01:33:36 +0200 (CEST)
Received: from localhost ([::1]:57492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnsQ3-00008d-5G
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 19:33:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnsP4-00086h-48; Tue, 23 Jun 2020 19:32:34 -0400
Received: from smtp2200-217.mail.aliyun.com ([121.197.200.217]:39510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhiwei_liu@c-sky.com>)
 id 1jnsP1-0007ZH-HB; Tue, 23 Jun 2020 19:32:33 -0400
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.1243398|-1; CH=blue; DM=|OVERLOAD|false|;
 DS=CONTINUE|ham_system_inform|0.432005-0.000103955-0.567891;
 FP=0|0|0|0|0|-1|-1|-1; HT=e01a16367; MF=zhiwei_liu@c-sky.com; NM=1; PH=DS;
 RN=9; RT=8; SR=0; TI=SMTPD_---.HrTKnQG_1592955146; 
Received: from L-PF1D6DP4-1208.hz.ali.com(mailfrom:zhiwei_liu@c-sky.com
 fp:SMTPD_---.HrTKnQG_1592955146)
 by smtp.aliyun-inc.com(10.147.42.198);
 Wed, 24 Jun 2020 07:32:26 +0800
From: LIU Zhiwei <zhiwei_liu@c-sky.com>
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [PATCH v11 46/61] target/riscv: vector wideing integer reduction
 instructions
Date: Wed, 24 Jun 2020 05:59:05 +0800
Message-Id: <20200623215920.2594-47-zhiwei_liu@c-sky.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200623215920.2594-1-zhiwei_liu@c-sky.com>
References: <20200623215920.2594-1-zhiwei_liu@c-sky.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=121.197.200.217;
 envelope-from=zhiwei_liu@c-sky.com; helo=smtp2200-217.mail.aliyun.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 17:32:41
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, UNPARSEABLE_RELAY=0.001 autolearn=_AUTOLEARN
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
 wenmeng_zhang@c-sky.com, Alistair Francis <alistair.francis@wdc.com>,
 palmer@dabbelt.com, LIU Zhiwei <zhiwei_liu@c-sky.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: LIU Zhiwei <zhiwei_liu@c-sky.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/helper.h                   |  7 +++++++
 target/riscv/insn32.decode              |  2 ++
 target/riscv/insn_trans/trans_rvv.inc.c |  4 ++++
 target/riscv/vector_helper.c            | 11 +++++++++++
 4 files changed, 24 insertions(+)

diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index a7fe4443e4..1c1277c0d1 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -1072,3 +1072,10 @@ DEF_HELPER_6(vredxor_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vredxor_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vredxor_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
 DEF_HELPER_6(vredxor_vs_d, void, ptr, ptr, ptr, ptr, env, i32)
+
+DEF_HELPER_6(vwredsumu_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwredsumu_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwredsumu_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwredsum_vs_b, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwredsum_vs_h, void, ptr, ptr, ptr, ptr, env, i32)
+DEF_HELPER_6(vwredsum_vs_w, void, ptr, ptr, ptr, ptr, env, i32)
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 878eeecb7e..b78fd8bc04 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -539,6 +539,8 @@ vredminu_vs     000100 . ..... ..... 010 ..... 1010111 @r_vm
 vredmin_vs      000101 . ..... ..... 010 ..... 1010111 @r_vm
 vredmaxu_vs     000110 . ..... ..... 010 ..... 1010111 @r_vm
 vredmax_vs      000111 . ..... ..... 010 ..... 1010111 @r_vm
+vwredsumu_vs    110000 . ..... ..... 000 ..... 1010111 @r_vm
+vwredsum_vs     110001 . ..... ..... 000 ..... 1010111 @r_vm
 
 vsetvli         0 ........... ..... 111 ..... 1010111  @r2_zimm
 vsetvl          1000000 ..... ..... 111 ..... 1010111  @r
diff --git a/target/riscv/insn_trans/trans_rvv.inc.c b/target/riscv/insn_trans/trans_rvv.inc.c
index b4e3f904d3..91fc1fd059 100644
--- a/target/riscv/insn_trans/trans_rvv.inc.c
+++ b/target/riscv/insn_trans/trans_rvv.inc.c
@@ -2342,3 +2342,7 @@ GEN_OPIVV_TRANS(vredmin_vs, reduction_check)
 GEN_OPIVV_TRANS(vredand_vs, reduction_check)
 GEN_OPIVV_TRANS(vredor_vs, reduction_check)
 GEN_OPIVV_TRANS(vredxor_vs, reduction_check)
+
+/* Vector Widening Integer Reduction Instructions */
+GEN_OPIVV_WIDEN_TRANS(vwredsum_vs, reduction_check)
+GEN_OPIVV_WIDEN_TRANS(vwredsumu_vs, reduction_check)
diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index 1bf3c870d3..bc7624eba3 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4406,3 +4406,14 @@ GEN_VEXT_RED(vredxor_vs_b, int8_t, int8_t, H1, H1, DO_XOR, clearb)
 GEN_VEXT_RED(vredxor_vs_h, int16_t, int16_t, H2, H2, DO_XOR, clearh)
 GEN_VEXT_RED(vredxor_vs_w, int32_t, int32_t, H4, H4, DO_XOR, clearl)
 GEN_VEXT_RED(vredxor_vs_d, int64_t, int64_t, H8, H8, DO_XOR, clearq)
+
+/* Vector Widening Integer Reduction Instructions */
+/* signed sum reduction into double-width accumulator */
+GEN_VEXT_RED(vwredsum_vs_b, int16_t, int8_t, H2, H1, DO_ADD, clearh)
+GEN_VEXT_RED(vwredsum_vs_h, int32_t, int16_t, H4, H2, DO_ADD, clearl)
+GEN_VEXT_RED(vwredsum_vs_w, int64_t, int32_t, H8, H4, DO_ADD, clearq)
+
+/* Unsigned sum reduction into double-width accumulator */
+GEN_VEXT_RED(vwredsumu_vs_b, uint16_t, uint8_t, H2, H1, DO_ADD, clearh)
+GEN_VEXT_RED(vwredsumu_vs_h, uint32_t, uint16_t, H4, H2, DO_ADD, clearl)
+GEN_VEXT_RED(vwredsumu_vs_w, uint64_t, uint32_t, H8, H4, DO_ADD, clearq)
-- 
2.23.0


