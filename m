Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 81BBF64F2E5
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 22:03:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6HqY-0001FD-GF; Fri, 16 Dec 2022 16:02:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1p6Gwl-0006Jh-BH
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:04:50 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1p6Gwg-0002Pf-PL
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 15:04:41 -0500
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 2BGGl1Ep030251
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 20:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=z23c8IwHUAysmUxER0tJCN9UvUouDyXYKclEPkrlsc4=;
 b=nveApzPhmmcQuDOXq4qvpmb+ioDmY9BzMmJZn5MIqsA5LRMrrm+6z2XnUL6LLruQQQC1
 8rVSPt19j9aj5IfCDV5lOs9FxDPgGm0M0nfOF5iiiehHYkdi4DQlBP0zl55GXtdBqCwA
 Ieo3GEvCtI4XwRGgzoaxjBlOonxZrcqo42PSEl8eAunVh9nWV9ZDTZCtunuK+uz8Tn7Y
 PiQQdZlACeoguHwmyKfxO63/EQfxbVVBK8d3MyP3kdAKHmOfmkHWWSQJjt700c5qAh7O
 LV9tlQxSMvhbN95DmpyBXAxFtPD2eUBruinLUM5Xy7DTkDoe6P1LqXVn1Ylxe5507cOT Mw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mg3f8w146-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 20:04:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BGK4Yxs008778
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 20:04:34 GMT
Received: from hu-mliebel-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Fri, 16 Dec 2022 12:04:34 -0800
From: Marco Liebel <quic_mliebel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <bcain@quicinc.com>, <tsimpson@quicinc.com>, Marco Liebel
 <quic_mliebel@quicinc.com>
Subject: [PATCH v2] Hexagon (target/hexagon) implement mutability mask for GPRs
Date: Fri, 16 Dec 2022 12:03:45 -0800
Message-ID: <20221216200345.831816-1-quic_mliebel@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: Hw4pwfW8TB-BTFhogNDLGqWIfKUsZRWa
X-Proofpoint-ORIG-GUID: Hw4pwfW8TB-BTFhogNDLGqWIfKUsZRWa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-16_14,2022-12-15_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1011
 lowpriorityscore=0 spamscore=0 impostorscore=0 mlxlogscore=966
 adultscore=0 phishscore=0 bulkscore=0 mlxscore=0 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2212160177
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mliebel@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 16 Dec 2022 16:01:58 -0500
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

Some registers are defined to have immutable bits, this commit
will implement that behavior.

Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
---
This incorporates the feedback given on Brian's patch

 target/hexagon/genptr.c           |  43 ++++-
 tests/tcg/hexagon/Makefile.target |   3 +
 tests/tcg/hexagon/reg_mut.c       | 307 ++++++++++++++++++++++++++++++
 3 files changed, 351 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/hexagon/reg_mut.c

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 806d0974ff..a91db8c76d 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -30,6 +30,32 @@
 #include "gen_tcg.h"
 #include "gen_tcg_hvx.h"
 
+static const target_ulong reg_immut_masks[TOTAL_PER_THREAD_REGS] = {
+    [HEX_REG_USR] = 0xc13000c0,
+    [HEX_REG_PC] = UINT32_MAX,
+    [HEX_REG_GP] = 0x3f,
+    [HEX_REG_UPCYCLELO] = UINT32_MAX,
+    [HEX_REG_UPCYCLEHI] = UINT32_MAX,
+    [HEX_REG_UTIMERLO] = UINT32_MAX,
+    [HEX_REG_UTIMERHI] = UINT32_MAX,
+};
+
+static inline void gen_masked_reg_write(TCGv result, TCGv new_val, TCGv cur_val,
+                                        target_ulong reg_mask)
+{
+    if (reg_mask) {
+        TCGv tmp = tcg_temp_new();
+
+        /* out_val = (in_val & reg_mask) | (cur_val & ~reg_mask) */
+        /* result is used to avoid creating a second temporary variable */
+        tcg_gen_andi_tl(result, new_val, ~reg_mask);
+        tcg_gen_andi_tl(tmp, cur_val, reg_mask);
+        tcg_gen_or_tl(result, result, tmp);
+
+        tcg_temp_free(tmp);
+    }
+}
+
 static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
 {
     TCGv zero = tcg_constant_tl(0);
@@ -55,6 +81,9 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val, int slot)
 
 static inline void gen_log_reg_write(int rnum, TCGv val)
 {
+    const target_ulong reg_mask = reg_immut_masks[rnum];
+
+    gen_masked_reg_write(val, val, hex_gpr[rnum], reg_mask);
     tcg_gen_mov_tl(hex_new_value[rnum], val);
     if (HEX_DEBUG) {
         /* Do this so HELPER(debug_commit_end) will know */
@@ -99,19 +128,29 @@ static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val, int slot)
 
 static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
 {
+    const target_ulong reg_mask_low = reg_immut_masks[rnum];
+    const target_ulong reg_mask_high = reg_immut_masks[rnum + 1];
+    TCGv val32 = tcg_temp_new();
+
     /* Low word */
-    tcg_gen_extrl_i64_i32(hex_new_value[rnum], val);
+    tcg_gen_extrl_i64_i32(val32, val);
+    gen_masked_reg_write(val32, val32, hex_gpr[rnum], reg_mask_low);
+    tcg_gen_mov_tl(hex_new_value[rnum], val32);
     if (HEX_DEBUG) {
         /* Do this so HELPER(debug_commit_end) will know */
         tcg_gen_movi_tl(hex_reg_written[rnum], 1);
     }
 
     /* High word */
-    tcg_gen_extrh_i64_i32(hex_new_value[rnum + 1], val);
+    tcg_gen_extrh_i64_i32(val32, val);
+    gen_masked_reg_write(val32, val32, hex_gpr[rnum + 1], reg_mask_high);
+    tcg_gen_mov_tl(hex_new_value[rnum + 1], val32);
     if (HEX_DEBUG) {
         /* Do this so HELPER(debug_commit_end) will know */
         tcg_gen_movi_tl(hex_reg_written[rnum + 1], 1);
     }
+
+    tcg_temp_free(val32);
 }
 
 static inline void gen_log_pred_write(DisasContext *ctx, int pnum, TCGv val)
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 96a4d7a614..4e9a20960b 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -43,9 +43,12 @@ HEX_TESTS += load_align
 HEX_TESTS += atomics
 HEX_TESTS += fpstuff
 HEX_TESTS += overflow
+HEX_TESTS += reg_mut
 
 TESTS += $(HEX_TESTS)
 
+reg_mut: CFLAGS += -I$(SRC_PATH)/target/hexagon/
+
 # This test has to be compiled for the -mv67t target
 usr: usr.c
 	$(CC) $(CFLAGS) -mv67t -O2 -Wno-inline-asm -Wno-expansion-to-defined $< -o $@ $(LDFLAGS)
diff --git a/tests/tcg/hexagon/reg_mut.c b/tests/tcg/hexagon/reg_mut.c
new file mode 100644
index 0000000000..8bbc1559dd
--- /dev/null
+++ b/tests/tcg/hexagon/reg_mut.c
@@ -0,0 +1,307 @@
+
+/*
+ *  Copyright(c) 2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *
+ *  This program is free software; you can redistribute it and/or modify
+ *  it under the terms of the GNU General Public License as published by
+ *  the Free Software Foundation; either version 2 of the License, or
+ *  (at your option) any later version.
+ *
+ *  This program is distributed in the hope that it will be useful,
+ *  but WITHOUT ANY WARRANTY; without even the implied warranty of
+ *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ *  GNU General Public License for more details.
+ *
+ *  You should have received a copy of the GNU General Public License
+ *  along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include <stdio.h>
+#include <stdint.h>
+
+#include "hex_regs.h"
+
+static int err;
+
+enum {
+    HEX_REG_PAIR_C9_8,
+    HEX_REG_PAIR_C11_10,
+    HEX_REG_PAIR_C15_14,
+    HEX_REG_PAIR_C31_30,
+};
+
+#define check(N, EXPECT) \
+    do { \
+        uint64_t value = N; \
+        uint64_t expect = EXPECT; \
+        if (value != EXPECT) { \
+            printf("ERROR: \"%s\" 0x%04llx != 0x%04llx at %s:%d\n", #N, value, \
+                   expect, __FILE__, __LINE__); \
+            err++; \
+        } \
+    } while (0)
+
+#define check_ne(N, EXPECT) \
+    do { \
+        uint64_t value = N; \
+        uint64_t expect = EXPECT; \
+        if (value == EXPECT) { \
+            printf("ERROR: \"%s\" 0x%04llx == 0x%04llx at %s:%d\n", #N, value, \
+                   expect, __FILE__, __LINE__); \
+            err++; \
+        } \
+    } while (0)
+
+#define WRITE_REG(reg_name, output, input) \
+    asm volatile(reg_name " = %1\n\t" \
+                 "%0 = " reg_name "\n\t" \
+                 : "=r"(output) \
+                 : "r"(input) \
+                 : reg_name);
+
+#define WRITE_REG_IN_PACKET(reg_name, output, input) \
+    asm volatile("{ " reg_name " = %1 }\n\t" \
+                 "%0 = " reg_name "\n\t" \
+                 : "=r"(output) \
+                 : "r"(input) \
+                 : reg_name);
+
+#define WRITE_REG_ENCODED(reg_name, encoding, output, input) \
+    asm volatile("r0 = %1\n\t" \
+                 encoding \
+                 "%0 = " reg_name "\n\t" \
+                 : "=r"(output) \
+                 : "r"(input) \
+                 : "r0");
+
+#define WRITE_REG_ENCODED_IN_PACKET(reg_name, encoding, output, input) \
+    asm volatile("{ r0 = %1 }\n\t" \
+                 encoding \
+                 "%0 = " reg_name "\n\t" \
+                 : "=r"(output) \
+                 : "r"(input) \
+                 : "r0");
+
+#define WRITE_REG_PAIR_ENCODED(reg_name, encoding, output, input) \
+    asm volatile("r1:0 = %1\n\t" \
+                 encoding \
+                 "%0 = " reg_name "\n\t" \
+                 : "=r"(output) \
+                 : "r"(input) \
+                 : "r1:0");
+
+#define WRITE_REG_PAIR_ENCODED_IN_PACKET(reg_name, encoding, output, input) \
+    asm volatile("{ r1:0 = %1 }\n\t" \
+                 encoding \
+                 "%0 = " reg_name "\n\t" \
+                 : "=r"(output) \
+                 : "r"(input) \
+                 : "r1:0");
+
+/*
+ * Instruction word: { pc = r0 }
+ *
+ * This instruction is barred by the assembler.
+ *
+ *    3                   2                   1
+ *  1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0 9 8 7 6 5 4 3 2 1 0
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ * |    Opc[A2_tfrrcr]   | Src[R0] |P P|                 |  C9/PC  |
+ * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
+ */
+#define PC_EQ_R0        ".word 0x6220c009\n\t"
+#define GP_EQ_R0        ".word 0x6220c00b\n\t"
+#define UPCYCLELO_EQ_R0 ".word 0x6220c00e\n\t"
+#define UPCYCLEHI_EQ_R0 ".word 0x6220c00f\n\t"
+#define UTIMERLO_EQ_R0  ".word 0x6220c01e\n\t"
+#define UTIMERHI_EQ_R0  ".word 0x6220c01f\n\t"
+
+#define C9_8_EQ_R1_0    ".word 0x6320c008\n\t"
+#define C11_10_EQ_R1_0  ".word 0x6320c00a\n\t"
+#define C15_14_EQ_R1_0  ".word 0x6320c00e\n\t"
+#define C31_30_EQ_R1_0  ".word 0x6320c01e\n\t"
+
+static inline uint32_t write_reg(int rnum, uint32_t val)
+{
+    uint32_t result;
+    switch (rnum) {
+    case HEX_REG_USR:
+        WRITE_REG("usr", result, val);
+        break;
+    case HEX_REG_PC:
+        WRITE_REG_ENCODED("pc", PC_EQ_R0, result, val);
+        break;
+    case HEX_REG_GP:
+        WRITE_REG_ENCODED("gp", GP_EQ_R0, result, val);
+        break;
+    case HEX_REG_UPCYCLELO:
+        WRITE_REG_ENCODED("upcyclelo", UPCYCLELO_EQ_R0, result, val);
+        break;
+    case HEX_REG_UPCYCLEHI:
+        WRITE_REG_ENCODED("upcyclehi", UPCYCLEHI_EQ_R0, result, val);
+        break;
+    case HEX_REG_UTIMERLO:
+        WRITE_REG_ENCODED("utimerlo", UTIMERLO_EQ_R0, result, val);
+        break;
+    case HEX_REG_UTIMERHI:
+        WRITE_REG_ENCODED("utimerhi", UTIMERHI_EQ_R0, result, val);
+        break;
+    }
+    return result;
+}
+
+static inline uint32_t write_reg_in_packet(int rnum, uint32_t val)
+{
+    uint32_t result;
+    switch (rnum) {
+    case HEX_REG_USR:
+        WRITE_REG_IN_PACKET("usr", result, val);
+        break;
+    case HEX_REG_PC:
+        WRITE_REG_ENCODED_IN_PACKET("pc", PC_EQ_R0, result, val);
+        break;
+    case HEX_REG_GP:
+        WRITE_REG_ENCODED_IN_PACKET("gp", GP_EQ_R0, result, val);
+        break;
+    case HEX_REG_UPCYCLELO:
+        WRITE_REG_ENCODED_IN_PACKET("upcyclelo", UPCYCLELO_EQ_R0, result, val);
+        break;
+    case HEX_REG_UPCYCLEHI:
+        WRITE_REG_ENCODED_IN_PACKET("upcyclehi", UPCYCLEHI_EQ_R0, result, val);
+        break;
+    case HEX_REG_UTIMERLO:
+        WRITE_REG_ENCODED_IN_PACKET("utimerlo", UTIMERLO_EQ_R0, result, val);
+        break;
+    case HEX_REG_UTIMERHI:
+        WRITE_REG_ENCODED_IN_PACKET("utimerhi", UTIMERHI_EQ_R0, result, val);
+        break;
+    }
+    return result;
+}
+
+static inline uint64_t write_reg_pair(int rnum, uint32_t val_hi,
+                                      uint32_t val_lo)
+{
+    uint64_t val = (uint64_t) val_hi << 32 | val_lo;
+    uint64_t result;
+    switch (rnum) {
+    case HEX_REG_PAIR_C9_8:
+        WRITE_REG_PAIR_ENCODED("c9:8", C9_8_EQ_R1_0, result, val);
+        break;
+    case HEX_REG_PAIR_C11_10:
+        WRITE_REG_PAIR_ENCODED("c11:10", C11_10_EQ_R1_0, result, val);
+        break;
+    case HEX_REG_PAIR_C15_14:
+        WRITE_REG_PAIR_ENCODED("c15:14", C15_14_EQ_R1_0, result, val);
+        break;
+    case HEX_REG_PAIR_C31_30:
+        WRITE_REG_PAIR_ENCODED("c31:30", C31_30_EQ_R1_0, result, val);
+        break;
+    }
+    return result;
+}
+
+static inline uint64_t write_reg_pair_in_packet(int rnum, uint32_t val_hi,
+                                                uint32_t val_lo)
+{
+    uint64_t val = (uint64_t) val_hi << 32 | val_lo;
+    uint64_t result;
+    switch (rnum) {
+    case HEX_REG_PAIR_C9_8:
+        WRITE_REG_PAIR_ENCODED_IN_PACKET("c9:8", C9_8_EQ_R1_0, result, val);
+        break;
+    case HEX_REG_PAIR_C11_10:
+        WRITE_REG_PAIR_ENCODED_IN_PACKET("c11:10", C11_10_EQ_R1_0, result, val);
+        break;
+    case HEX_REG_PAIR_C15_14:
+        WRITE_REG_PAIR_ENCODED_IN_PACKET("c15:14", C15_14_EQ_R1_0, result, val);
+        break;
+    case HEX_REG_PAIR_C31_30:
+        WRITE_REG_PAIR_ENCODED_IN_PACKET("c31:30", C31_30_EQ_R1_0, result, val);
+        break;
+    }
+    return result;
+}
+
+static inline void write_control_registers(void)
+{
+    check(write_reg(HEX_REG_USR,        0xffffffff), 0x3ecfff3f);
+    check(write_reg(HEX_REG_GP,         0xffffffff), 0xffffffc0);
+    check(write_reg(HEX_REG_UPCYCLELO,  0xffffffff),        0x0);
+    check(write_reg(HEX_REG_UPCYCLEHI,  0xffffffff),        0x0);
+    check(write_reg(HEX_REG_UTIMERLO,   0xffffffff),        0x0);
+    check(write_reg(HEX_REG_UTIMERHI,   0xffffffff),        0x0);
+
+    /*
+     * PC is special.  Setting it to these values
+     * should cause a catastrophic failure.
+     */
+    check_ne(write_reg(HEX_REG_PC, 0x00000000), 0x00000000);
+    check_ne(write_reg(HEX_REG_PC, 0x00000000), 0x00000001);
+    check_ne(write_reg(HEX_REG_PC, 0xffffffff), 0xffffffff);
+    check_ne(write_reg(HEX_REG_PC, 0x00000000), 0x00000000);
+}
+
+static inline void write_control_registers_in_packets(void)
+{
+    check(write_reg_in_packet(HEX_REG_USR,        0xffffffff), 0x3ecfff3f);
+    check(write_reg_in_packet(HEX_REG_GP,         0xffffffff), 0xffffffc0);
+    check(write_reg_in_packet(HEX_REG_UPCYCLELO,  0xffffffff),        0x0);
+    check(write_reg_in_packet(HEX_REG_UPCYCLEHI,  0xffffffff),        0x0);
+    check(write_reg_in_packet(HEX_REG_UTIMERLO,   0xffffffff),        0x0);
+    check(write_reg_in_packet(HEX_REG_UTIMERHI,   0xffffffff),        0x0);
+
+    check_ne(write_reg_in_packet(HEX_REG_PC, 0x00000000), 0x00000000);
+    check_ne(write_reg_in_packet(HEX_REG_PC, 0x00000001), 0x00000001);
+    check_ne(write_reg_in_packet(HEX_REG_PC, 0xffffffff), 0xffffffff);
+    check_ne(write_reg_in_packet(HEX_REG_PC, 0x00000000), 0x00000000);
+}
+
+static inline void write_control_register_pairs(void)
+{
+    check(write_reg_pair(HEX_REG_PAIR_C11_10, 0xffffffff, 0xffffffff),
+          0xffffffc0ffffffff);
+    check(write_reg_pair(HEX_REG_PAIR_C15_14, 0xffffffff, 0xffffffff), 0x0);
+    check(write_reg_pair(HEX_REG_PAIR_C31_30, 0xffffffff, 0xffffffff), 0x0);
+
+    check_ne(write_reg_pair(HEX_REG_PAIR_C9_8, 0x00000000, 0x00000000),
+             0x0000000000000000);
+    check_ne(write_reg_pair(HEX_REG_PAIR_C9_8, 0x00000001, 0x00000000),
+             0x0000000100000000);
+    check_ne(write_reg_pair(HEX_REG_PAIR_C9_8, 0xffffffff, 0xffffffff),
+             0xffffffffffffffff);
+    check_ne(write_reg_pair(HEX_REG_PAIR_C9_8, 0x00000000, 0x00000000),
+             0x0000000000000000);
+}
+
+static inline void write_control_register_pairs_in_packets(void)
+{
+    check(write_reg_pair_in_packet(HEX_REG_PAIR_C11_10, 0xffffffff, 0xffffffff),
+          0xffffffc0ffffffff);
+    check(write_reg_pair_in_packet(HEX_REG_PAIR_C15_14, 0xffffffff, 0xffffffff),
+          0x0);
+    check(write_reg_pair_in_packet(HEX_REG_PAIR_C31_30, 0xffffffff, 0xffffffff),
+          0x0);
+
+    check_ne(write_reg_pair_in_packet(HEX_REG_PAIR_C9_8, 0x00000000,
+             0x00000000), 0x0000000000000000);
+    check_ne(write_reg_pair_in_packet(HEX_REG_PAIR_C9_8, 0x00000001,
+             0x00000000), 0x0000000100000000);
+    check_ne(write_reg_pair_in_packet(HEX_REG_PAIR_C9_8, 0xffffffff,
+             0xffffffff), 0xffffffffffffffff);
+    check_ne(write_reg_pair_in_packet(HEX_REG_PAIR_C9_8, 0x00000000,
+             0x00000000), 0x0000000000000000);
+}
+
+int main()
+{
+    err = 0;
+
+    write_control_registers();
+    write_control_registers_in_packets();
+    write_control_register_pairs();
+    write_control_register_pairs_in_packets();
+
+    puts(err ? "FAIL" : "PASS");
+    return err;
+}
-- 
2.25.1


