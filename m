Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AAE65E8FF
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 11:26:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDNR3-00007E-H7; Thu, 05 Jan 2023 05:25:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pDNR1-00006X-N2
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 05:25:19 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pDNQz-0001I7-Ip
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 05:25:19 -0500
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3059FxlN032355
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 10:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=AcDOdl/cJ1tVc7v8muoGt2ROSbI20XN9k004dqW2UeQ=;
 b=ZpFbRGyHVUY/536fazmo4uittw4UkOkotsFBmc1qNxCpMkt3wDh4NJn6T4oiyEMHwbRQ
 6Vp+hhqgLTHd4jCHevzuh6bZP+zj0YfCLz9PRZvCaupwXI2barLKWwhi3+fMiPvtPnus
 PCVqZmcJCIx2Wsx4F4Vh/DrH12G8yA64KQuxsc3YQKMmTvMEqO0EO82iCjceAsef35ep
 J3gCFATn7bsBn71TxHQWJBi65/tEqXQQNalHM9XmEZAdlZdY6U3J3+6EH3xHk+jDGCuF
 CQQKjZK+lL70WdWhiKOvVh8xKj+VuMzXKqBjJC9ZMWI6K1vuFF5VcCtWASIlR6IXB4zU 1A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mvsvf40rd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 10:25:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 305APCSN002842
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 5 Jan 2023 10:25:12 GMT
Received: from hu-mliebel-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 5 Jan 2023 02:25:12 -0800
From: Marco Liebel <quic_mliebel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <tsimpson@quicinc.com>, <bcain@quicinc.com>, Marco Liebel
 <quic_mliebel@quicinc.com>
Subject: [PATCH v3] Hexagon (target/hexagon) implement mutability mask for GPRs
Date: Thu, 5 Jan 2023 02:23:49 -0800
Message-ID: <20230105102349.2181856-1-quic_mliebel@quicinc.com>
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
X-Proofpoint-ORIG-GUID: nyToXUhHJkSBfo3fvVkFuMIzZgb9PYfY
X-Proofpoint-GUID: nyToXUhHJkSBfo3fvVkFuMIzZgb9PYfY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-05_04,2023-01-04_02,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 mlxscore=0 bulkscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301050085
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
 target/hexagon/genptr.c           |  44 ++++++++-
 tests/tcg/hexagon/Makefile.target |   1 +
 tests/tcg/hexagon/reg_mut.c       | 152 ++++++++++++++++++++++++++++++
 3 files changed, 195 insertions(+), 2 deletions(-)
 create mode 100644 tests/tcg/hexagon/reg_mut.c

diff --git a/target/hexagon/genptr.c b/target/hexagon/genptr.c
index 6cf2e0ed43..94420d9e5a 100644
--- a/target/hexagon/genptr.c
+++ b/target/hexagon/genptr.c
@@ -43,6 +43,33 @@ TCGv gen_read_preg(TCGv pred, uint8_t num)
     return pred;
 }
 
+#define IMMUTABLE (~0)
+
+static const target_ulong reg_immut_masks[TOTAL_PER_THREAD_REGS] = {
+    [HEX_REG_USR] = 0xc13000c0,
+    [HEX_REG_PC] = IMMUTABLE,
+    [HEX_REG_GP] = 0x3f,
+    [HEX_REG_UPCYCLELO] = IMMUTABLE,
+    [HEX_REG_UPCYCLEHI] = IMMUTABLE,
+    [HEX_REG_UTIMERLO] = IMMUTABLE,
+    [HEX_REG_UTIMERHI] = IMMUTABLE,
+};
+
+static inline void gen_masked_reg_write(TCGv new_val, TCGv cur_val,
+                                        target_ulong reg_mask)
+{
+    if (reg_mask) {
+        TCGv tmp = tcg_temp_new();
+
+        /* new_val = (new_val & ~reg_mask) | (cur_val & reg_mask) */
+        tcg_gen_andi_tl(new_val, new_val, ~reg_mask);
+        tcg_gen_andi_tl(tmp, cur_val, reg_mask);
+        tcg_gen_or_tl(new_val, new_val, tmp);
+
+        tcg_temp_free(tmp);
+    }
+}
+
 static inline void gen_log_predicated_reg_write(int rnum, TCGv val,
                                                 uint32_t slot)
 {
@@ -69,6 +96,9 @@ static inline void gen_log_predicated_reg_write(int rnum, TCGv val,
 
 void gen_log_reg_write(int rnum, TCGv val)
 {
+    const target_ulong reg_mask = reg_immut_masks[rnum];
+
+    gen_masked_reg_write(val, hex_gpr[rnum], reg_mask);
     tcg_gen_mov_tl(hex_new_value[rnum], val);
     if (HEX_DEBUG) {
         /* Do this so HELPER(debug_commit_end) will know */
@@ -114,19 +144,29 @@ static void gen_log_predicated_reg_write_pair(int rnum, TCGv_i64 val,
 
 static void gen_log_reg_write_pair(int rnum, TCGv_i64 val)
 {
+    const target_ulong reg_mask_low = reg_immut_masks[rnum];
+    const target_ulong reg_mask_high = reg_immut_masks[rnum + 1];
+    TCGv val32 = tcg_temp_new();
+
     /* Low word */
-    tcg_gen_extrl_i64_i32(hex_new_value[rnum], val);
+    tcg_gen_extrl_i64_i32(val32, val);
+    gen_masked_reg_write(val32, hex_gpr[rnum], reg_mask_low);
+    tcg_gen_mov_tl(hex_new_value[rnum], val32);
     if (HEX_DEBUG) {
         /* Do this so HELPER(debug_commit_end) will know */
         tcg_gen_movi_tl(hex_reg_written[rnum], 1);
     }
 
     /* High word */
-    tcg_gen_extrh_i64_i32(hex_new_value[rnum + 1], val);
+    tcg_gen_extrh_i64_i32(val32, val);
+    gen_masked_reg_write(val32, hex_gpr[rnum + 1], reg_mask_high);
+    tcg_gen_mov_tl(hex_new_value[rnum + 1], val32);
     if (HEX_DEBUG) {
         /* Do this so HELPER(debug_commit_end) will know */
         tcg_gen_movi_tl(hex_reg_written[rnum + 1], 1);
     }
+
+    tcg_temp_free(val32);
 }
 
 void gen_log_pred_write(DisasContext *ctx, int pnum, TCGv val)
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 9ee1faa1e1..e8a647d94e 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -43,6 +43,7 @@ HEX_TESTS += load_align
 HEX_TESTS += atomics
 HEX_TESTS += fpstuff
 HEX_TESTS += overflow
+HEX_TESTS += reg_mut
 
 HEX_TESTS += test_abs
 HEX_TESTS += test_bitcnt
diff --git a/tests/tcg/hexagon/reg_mut.c b/tests/tcg/hexagon/reg_mut.c
new file mode 100644
index 0000000000..910e663ace
--- /dev/null
+++ b/tests/tcg/hexagon/reg_mut.c
@@ -0,0 +1,152 @@
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
+static int err;
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
+#define WRITE_REG_NOCLOBBER(output, reg_name, input) \
+    asm volatile(reg_name " = %1\n\t" \
+                 "%0 = " reg_name "\n\t" \
+                 : "=r"(output) \
+                 : "r"(input) \
+                 : );
+
+#define WRITE_REG_ENCODED(output, reg_name, input, encoding) \
+    asm volatile("r0 = %1\n\t" \
+                 encoding "\n\t" \
+                 "%0 = " reg_name "\n\t" \
+                 : "=r"(output) \
+                 : "r"(input) \
+                 : "r0");
+
+#define WRITE_REG_PAIR_ENCODED(output, reg_name, input, encoding) \
+    asm volatile("r1:0 = %1\n\t" \
+                 encoding "\n\t" \
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
+#define PC_EQ_R0        ".word 0x6220c009"
+#define C9_8_EQ_R1_0    ".word 0x6320c008"
+
+static inline void write_control_registers(void)
+{
+    uint32_t result = 0;
+
+    WRITE_REG_NOCLOBBER(result, "usr", 0xffffffff);
+    check(result, 0x3ecfff3f);
+
+    WRITE_REG_NOCLOBBER(result, "gp", 0xffffffff);
+    check(result, 0xffffffc0);
+
+    WRITE_REG_NOCLOBBER(result, "upcyclelo", 0xffffffff);
+    check(result, 0x00000000);
+
+    WRITE_REG_NOCLOBBER(result, "upcyclehi", 0xffffffff);
+    check(result, 0x00000000);
+
+    WRITE_REG_NOCLOBBER(result, "utimerlo", 0xffffffff);
+    check(result, 0x00000000);
+
+    WRITE_REG_NOCLOBBER(result, "utimerhi", 0xffffffff);
+    check(result, 0x00000000);
+
+    /*
+     * PC is special.  Setting it to these values
+     * should cause a catastrophic failure.
+     */
+    WRITE_REG_ENCODED(result, "pc", 0x00000000, PC_EQ_R0);
+    check_ne(result, 0x00000000);
+
+    WRITE_REG_ENCODED(result, "pc", 0x00000001, PC_EQ_R0);
+    check_ne(result, 0x00000001);
+
+    WRITE_REG_ENCODED(result, "pc", 0xffffffff, PC_EQ_R0);
+    check_ne(result, 0xffffffff);
+}
+
+static inline void write_control_register_pairs(void)
+{
+    uint64_t result = 0;
+
+    WRITE_REG_NOCLOBBER(result, "c11:10", 0xffffffffffffffff);
+    check(result, 0xffffffc0ffffffff);
+
+    WRITE_REG_NOCLOBBER(result, "c15:14", 0xffffffffffffffff);
+    check(result, 0x0000000000000000);
+
+    WRITE_REG_NOCLOBBER(result, "c31:30", 0xffffffffffffffff);
+    check(result, 0x0000000000000000);
+
+    WRITE_REG_PAIR_ENCODED(result, "c9:8", (uint64_t) 0x0000000000000000,
+                           C9_8_EQ_R1_0);
+    check_ne(result, 0x000000000000000);
+
+    WRITE_REG_PAIR_ENCODED(result, "c9:8", 0x0000000100000000, C9_8_EQ_R1_0);
+    check_ne(result, 0x0000000100000000);
+
+    WRITE_REG_PAIR_ENCODED(result, "c9:8", 0xffffffffffffffff, C9_8_EQ_R1_0);
+    check_ne(result, 0xffffffffffffffff);
+}
+
+int main()
+{
+    err = 0;
+
+    write_control_registers();
+    write_control_register_pairs();
+
+    puts(err ? "FAIL" : "PASS");
+    return err;
+}
-- 
2.25.1


