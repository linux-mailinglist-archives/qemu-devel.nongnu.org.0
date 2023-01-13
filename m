Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF5FB6698E4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 14:43:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKHR-0007tO-Lo; Fri, 13 Jan 2023 08:39:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pGKHP-0007se-9z
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:35 -0500
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pGKHN-000540-5p
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 08:39:34 -0500
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 30DBj5A5031087; Fri, 13 Jan 2023 13:39:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=1j/TK7PxWuBjKzi6WYm5CQ4zrqE6FNEoffcC+/IFeXI=;
 b=b1GQQGNDByrxeBrZcdsPOgFAw0NylC3K3JtClPUimo/zVWZNaKmM6AxfvDV3csCsWp/x
 /odFXnX9cl7pepqBnSVmF98TnGKd8NvRS9FSMreiFIzEz9V4dtWZqWJcX+o+O+0CcfjN
 gkJW4TbcSA9r8FnVnDZzxt6vHlSPIE2t0FexrkYrwKamHBn9g8kWjMHHQTsenSgHnPmB
 iHrpv8apTdcBtjkdxVJ/zz6CY2a6Cmgh359swCEMqmsZccYu85iNGH+xKNutBfMJ4A0X
 70/ScMgR6zDL6PLoKi58PR5mkv2PsrbhGJyNp38Alt4uNRzF2ku90aB1eUjTPyiGNWW5 8Q== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3n2k47jxfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 13:39:28 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 30DDdS2L004403; 
 Fri, 13 Jan 2023 13:39:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3my1tmts14-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 13:39:28 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 30DDars7001910;
 Fri, 13 Jan 2023 13:39:28 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 30DDdRe0004397
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 13 Jan 2023 13:39:28 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 6E5B05EA8; Fri, 13 Jan 2023 10:39:27 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: Taylor Simpson <tsimpson@quicinc.com>, Brian Cain <bcain@quicinc.com>,
 richard.henderson@linaro.org
Subject: [PATCH 2/2] Hexagon (decode): look for pkts with multiple insns at
 the same slot
Date: Fri, 13 Jan 2023 10:39:24 -0300
Message-Id: <b976c19578a6aae55bda9b4fe21f91d88d924eb0.1673616964.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1673616964.git.quic_mathbern@quicinc.com>
References: <cover.1673616964.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: fTbDYYT9ktPgUFQzNwYIwyA_W3OhAQoA
X-Proofpoint-ORIG-GUID: fTbDYYT9ktPgUFQzNwYIwyA_W3OhAQoA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-13_06,2023-01-13_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 clxscore=1011 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 impostorscore=0 lowpriorityscore=0 spamscore=0
 suspectscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2301130090
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: 9
X-Spam_score: 0.9
X-Spam_bar: /
X-Spam_report: (0.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Each slot in a packet can be assigned to at most one instruction.
Although the assembler generally ought to enforce this rule, we better
be safe than sorry and also do some check to properly throw an "invalid
packet" exception on wrong slot assignments.

This should also make it easier to debug possible future errors caused
by missing updates to `find_iclass_slots()` rules in
target/hexagon/iclass.c.

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 target/hexagon/decode.c           | 30 +++++++++++++++++++++++++++---
 tests/tcg/hexagon/Makefile.target | 10 ++++++++++
 tests/tcg/hexagon/invalid_slots.c | 29 +++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/hexagon/invalid_slots.c

diff --git a/target/hexagon/decode.c b/target/hexagon/decode.c
index 041c8de751..65ebf516a5 100644
--- a/target/hexagon/decode.c
+++ b/target/hexagon/decode.c
@@ -1,5 +1,5 @@
 /*
- *  Copyright(c) 2019-2022 Qualcomm Innovation Center, Inc. All Rights Reserved.
+ *  Copyright(c) 2019-2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
  *
  *  This program is free software; you can redistribute it and/or modify
  *  it under the terms of the GNU General Public License as published by
@@ -797,7 +797,26 @@ static bool decode_parsebits_is_loopend(uint32_t encoding32)
     return bits == 0x2;
 }
 
-static void
+static bool has_valid_slot_assignment(Packet *pkt)
+{
+    int used_slots = 0;
+    for (int i = 0; i < pkt->num_insns; i++) {
+        int slot_mask;
+        Insn *insn = &pkt->insn[i];
+        if (decode_opcode_ends_loop(insn->opcode)) {
+            /* We overload slot 0 for endloop. */
+            continue;
+        }
+        slot_mask = 1 << insn->slot;
+        if (used_slots & slot_mask) {
+            return false;
+        }
+        used_slots |= slot_mask;
+    }
+    return true;
+}
+
+static bool
 decode_set_slot_number(Packet *pkt)
 {
     int slot;
@@ -886,6 +905,8 @@ decode_set_slot_number(Packet *pkt)
         /* Then push it to slot0 */
         pkt->insn[slot1_iidx].slot = 0;
     }
+
+    return has_valid_slot_assignment(pkt);
 }
 
 /*
@@ -962,7 +983,10 @@ int decode_packet(int max_words, const uint32_t *words, Packet *pkt,
     if (!disas_only) {
         decode_remove_extenders(pkt);
     }
-    decode_set_slot_number(pkt);
+    if (!decode_set_slot_number(pkt)) {
+        /* Invalid packet */
+        return 0;
+    }
     decode_fill_newvalue_regno(pkt);
 
     if (pkt->pkt_has_hvx) {
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 18e6a5969e..062aef63c3 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -45,6 +45,16 @@ HEX_TESTS += fpstuff
 HEX_TESTS += overflow
 HEX_TESTS += signal_context
 HEX_TESTS += reg_mut
+HEX_TESTS += invalid_slots
+
+run-invalid_slots:
+	$(call run-test, $<, $(QEMU) $< 2> $<.stderr, $<); \
+	if [ $$? -ne 1 ] ; then \
+		return 1; \
+	fi
+	$(call quiet-command, \
+		grep -q "exception 0x15" $<.stderr, \
+		"GREP", "exception 0x15");
 
 HEX_TESTS += test_abs
 HEX_TESTS += test_bitcnt
diff --git a/tests/tcg/hexagon/invalid_slots.c b/tests/tcg/hexagon/invalid_slots.c
new file mode 100644
index 0000000000..366ce4f42f
--- /dev/null
+++ b/tests/tcg/hexagon/invalid_slots.c
@@ -0,0 +1,29 @@
+/*
+ *  Copyright(c) 2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
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
+char mem[8] __attribute__((aligned(8)));
+
+int main()
+{
+    asm volatile(
+        "r0 = #mem\n"
+        /* Invalid packet (2 instructions at slot 0): */
+        ".word 0xa1804100\n" /* { memw(r0) = r1;      */
+        ".word 0x28032804\n" /*   r3 = #0; r4 = #0 }  */
+        : : : "r0", "r3", "r4", "memory");
+    return 0;
+}
-- 
2.37.2


