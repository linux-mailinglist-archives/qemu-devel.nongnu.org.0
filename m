Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09DC6C33C8
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:13:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecjF-0002Aj-Rk; Tue, 21 Mar 2023 10:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pecjE-0002AY-D1
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:12:44 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mliebel@quicinc.com>)
 id 1pecjA-0000ud-GI
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:12:44 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32L0b8Jv015839
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:12:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=AGhipZZJTjoc0QXCfEDOoSI0t/8ccuusUqXuKd90icU=;
 b=SHyu2Hi5XzX0q26rCpukGhTw52AxPQkLSRYkVexGHqqanPAwZNzWAI4hTFxSH1AZdex6
 eQ62Vhh5+ycWhb+As0t3/bR2FAzsV2ulVjcKuOHkBGoGanpQXcS1gEct9mF4RHNhO9HG
 zvDMCrsQJ22w7f2kP+giWwRIrWkcQiuEOKFddTu/Wquaqke6c4BaVoubAZch51/514vL
 jzy69GBzRC9v7edsKRF/nRAM6aq8G3kQAMxJMh3VzV5oJ6v70QSr3XOlPDHCCxFYwxvl
 SWu1onfwBzoQiwyU43hTXrQshZB8OMt4pF+nehSfQ6wuo1T16F2fTmWbuLfSkt3S7GH5 Fw== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pene1m0nt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:12:38 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32LECcBT009014
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:12:38 GMT
Received: from hu-mliebel-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Tue, 21 Mar 2023 07:12:37 -0700
From: Marco Liebel <quic_mliebel@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: Taylor Simpson <tsimpson@quicinc.com>, Matheus Bernardino
 <quic_mathbern@quicinc.com>, Marco Liebel <quic_mliebel@quicinc.com>
Subject: [PATCH 2/2] Add test for storing .new vector
Date: Tue, 21 Mar 2023 07:12:05 -0700
Message-ID: <20230321141206.751719-3-quic_mliebel@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230321141206.751719-1-quic_mliebel@quicinc.com>
References: <20230321141206.751719-1-quic_mliebel@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: nUM-axF8HShzokgZ4k__dnBEpK4YCXhW
X-Proofpoint-GUID: nUM-axF8HShzokgZ4k__dnBEpK4YCXhW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-21_10,2023-03-21_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=697
 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 lowpriorityscore=0 clxscore=1015 mlxscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303210111
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

Hexagon toolchain version 16.0.0 fixes a bug where the ecoding of
storing a .new vector was incorrect. This resulted in an incorrect
valued being stored. The test checks that the correct value is used.

Signed-off-by: Marco Liebel <quic_mliebel@quicinc.com>
---
 tests/tcg/hexagon/hvx_misc.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/tests/tcg/hexagon/hvx_misc.c b/tests/tcg/hexagon/hvx_misc.c
index 53d5c9b44f..657e556dd4 100644
--- a/tests/tcg/hexagon/hvx_misc.c
+++ b/tests/tcg/hexagon/hvx_misc.c
@@ -211,6 +211,34 @@ static void test_store_unaligned(void)
     check_output_w(__LINE__, 2);
 }
 
+static void test_store_new(void)
+{
+    asm volatile(
+        "r0 = #0x00000003\n\t"
+        "v0 = vsplat(r0)\n\t"
+        "r0 = #expect\n\t"
+        "vmem(r0+#0) = v0\n\t"
+
+        "r0 = #output\n\t"
+        "r1 = #0x00000001\n\t"
+        "r2 = #0x00000002\n\t"
+        "r3 = #0x00000004\n\t"
+
+        "v1 = vsplat(r1)\n\t"
+        "v2 = vsplat(r2)\n\t"
+        "v3 = vsplat(r3)\n\t"
+
+        "{"
+        "   v3.w,q0 = vadd(v1.w, v2.w):carry\n\t"
+        "   vmem(r0+#0) = v3.new\n\t"
+        "}"
+
+        ::: "r0", "r1", "r2", "r3", "v0", "v1", "v2", "v3", "q0", "memory"
+    );
+
+    check_output_w(__LINE__, 1);
+}
+
 static void test_masked_store(bool invert)
 {
     void *p0 = buffer0;
@@ -620,6 +648,7 @@ int main()
     test_load_unaligned();
     test_store_aligned();
     test_store_unaligned();
+    test_store_new();
     test_masked_store(false);
     test_masked_store(true);
     test_new_value_store();
-- 
2.25.1


