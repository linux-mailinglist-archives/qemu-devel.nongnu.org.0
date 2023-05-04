Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 580456F7231
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 20:56:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pue86-0007Tj-MS; Thu, 04 May 2023 14:56:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pue85-0007TV-EH
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:56:37 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pue83-00079w-E8
 for qemu-devel@nongnu.org; Thu, 04 May 2023 14:56:37 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344IoCpf027997
 for <qemu-devel@nongnu.org>; Thu, 4 May 2023 18:56:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=gP7P2juMA5HKKMjzr8te/5E8HYKXK7Ov2con65+YIaQ=;
 b=WXD12jxlbiO2FuKyedtRK/844KfLKomnvNT8MEVCrq5SLnJSZ3mt7I98fopADMaOT7JQ
 2f5HpHStKlduvKzjfU3uG6NVu0QSD4ILkcvEEzF4DAkDQinEY0j3BfF66wPb1jnU5Fw1
 VqcD0tvMqsozp2u14cRAWuAQZJWtI7c7NEhyuZI1acKDNZEu+GF33rTJGWqjwdsN+fSX
 cOlrz39cgzWu6N9KYz89+1NOCNboiW71jg87XhQJqmPhNiX6y0x3uQaDvfD2ZA0tjkXa
 pWbnc0NE8lGx2lyufRTfdFwBpx79V+BEopOImHl/mxIjxKvKX/YSlivVpz7lIEZQoyfn nw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbvghjwk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:56:33 +0000
Received: from pps.filterd (NALASPPMTA05.qualcomm.com [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 344InSqF023891
 for <qemu-devel@nongnu.org>; Thu, 4 May 2023 18:56:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 3qbe39bstr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 18:56:32 +0000
Received: from NALASPPMTA05.qualcomm.com (NALASPPMTA05.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 344IuWZj031177
 for <qemu-devel@nongnu.org>; Thu, 4 May 2023 18:56:32 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA05.qualcomm.com (PPS) with ESMTPS id 344IuWl9031175
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 18:56:32 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 1692370ED; Thu,  4 May 2023 15:56:32 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: tsimpson@quicinc.com
Subject: [PATCH] Hexagon (decode): look for pkts with multiple insns at the
 same slot
Date: Thu,  4 May 2023 15:56:30 -0300
Message-Id: <7a90f0925f182e56cf49ec3ec01484739fa2f174.1683226473.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Ta9PbnwsZu0V5DFydXD4zvX82Y8boRXQ
X-Proofpoint-GUID: Ta9PbnwsZu0V5DFydXD4zvX82Y8boRXQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_13,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2305040152
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
I extracted this patch from [1]. There are more changes needed to
support v73 in qemu, so the first patch in that series doesn't make
sense to be incorporated yet. This one is useful nonetheless.

[1]: https://lore.kernel.org/qemu-devel/cover.1673616964.git.quic_mathbern@quicinc.com/

 target/hexagon/decode.c           | 30 +++++++++++++++++++++++++++---
 tests/tcg/hexagon/invalid-slots.c | 29 +++++++++++++++++++++++++++++
 tests/tcg/hexagon/Makefile.target | 11 +++++++++++
 3 files changed, 67 insertions(+), 3 deletions(-)
 create mode 100644 tests/tcg/hexagon/invalid-slots.c

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
diff --git a/tests/tcg/hexagon/invalid-slots.c b/tests/tcg/hexagon/invalid-slots.c
new file mode 100644
index 0000000000..366ce4f42f
--- /dev/null
+++ b/tests/tcg/hexagon/invalid-slots.c
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
diff --git a/tests/tcg/hexagon/Makefile.target b/tests/tcg/hexagon/Makefile.target
index 7c94db4bc4..0c69216c6c 100644
--- a/tests/tcg/hexagon/Makefile.target
+++ b/tests/tcg/hexagon/Makefile.target
@@ -49,6 +49,17 @@ HEX_TESTS += vector_add_int
 HEX_TESTS += scatter_gather
 HEX_TESTS += hvx_misc
 HEX_TESTS += hvx_histogram
+HEX_TESTS += invalid-slots
+
+run-and-check-exception = $(call run-test,$2,$3 2>$2.stderr; \
+	test $$? -eq 1 && grep -q "exception $(strip $1)" $2.stderr)
+
+run-invalid-slots: invalid-slots
+	$(call run-and-check-exception, 0x15, $@, $(QEMU) $(QEMU_OPTS) $<)
+
+run-plugin-invalid-slots-with-%: invalid-slots
+	$(call run-and-check-exception, 0x15, $@, $(QEMU) $(QEMU_OPTS) \
+	-plugin $(PLUGIN_LIB)/$(call extract-plugin,$@) $(call strip-plugin,$<))
 
 HEX_TESTS += test_abs
 HEX_TESTS += test_bitcnt
-- 
2.37.2


