Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2B1B6E9481
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 14:34:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppTSS-0006ez-6X; Thu, 20 Apr 2023 08:32:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSI-0006ZC-21
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:13 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1ppTSF-0002rV-BO
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 08:32:04 -0400
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 33KAq55P010228; Thu, 20 Apr 2023 12:32:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=lDnPuVW+bt4qKT8tGkYwgTa6W5/3YdygFC4dQ7djZFM=;
 b=d81IunEI+lruPX767apuVUGTWobanyP2KMh/z5N+cVXulUcIceZVrVISx8LKpMQHJLIj
 JhUU+o9TluqxZC9ubtv9FTFjcuqHXdABnnB9kAtshFlQorPqBEzH3g1Ux9FHeaGT8Mlu
 5AquhWcSix67oGqKeYg5ITs1LHXcIlLuIvQVa0dUkLVm9/Hsmdla7EhcZrz9eduu1I0X
 vFi8agJP356ManTLuwlVuNCcau5lSBa6XPfbZeDlRlk+iM7Cwr9RnCUmPP8P3gc+whGW
 KuBuLRVO8hdCzwFRyQvwTAOAyfV2kbS90cgvJ6PHc6EowGiYBAnKLdnhsxzi6G19TKMZ 2w== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3q2xuhs0a8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:32:00 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 33KCVxGj015420
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 20 Apr 2023 12:31:59 GMT
Received: from NASANPPMTA03.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 20 Apr 2023 05:31:57 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <alex.bennee@linaro.org>, <bcain@quicinc.com>, <f4bug@amsat.org>,
 <peter.maydell@linaro.org>, <tsimpson@quicinc.com>, Sid Manning
 <sidneym@quicinc.com>
Subject: [PATCH v2 RESEND 5/7] Hexagon (gdbstub): fix p3:0 read and write via
 stub
Date: Thu, 20 Apr 2023 09:31:26 -0300
Message-ID: <47bea2e5047e942a5638757849c0b9834a3a8323.1681993775.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1681993775.git.quic_mathbern@quicinc.com>
References: <cover.1681993775.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: Opzurb29BRqNjxLW_4b6MpHyncMhnp5o
X-Proofpoint-GUID: Opzurb29BRqNjxLW_4b6MpHyncMhnp5o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-20_08,2023-04-20_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0
 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=675 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304200102
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0a-0031df01.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Brian Cain <bcain@quicinc.com>

Co-authored-by: Sid Manning <sidneym@quicinc.com>
Signed-off-by: Sid Manning <sidneym@quicinc.com>
Signed-off-by: Brian Cain <bcain@quicinc.com>
Co-authored-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Reviewed-by: Taylor Simpson <tsimpson@quicinc.com>
---
 target/hexagon/gdbstub.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c
index 46083da620..a06fed9f18 100644
--- a/target/hexagon/gdbstub.c
+++ b/target/hexagon/gdbstub.c
@@ -25,6 +25,14 @@ int hexagon_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     HexagonCPU *cpu = HEXAGON_CPU(cs);
     CPUHexagonState *env = &cpu->env;
 
+    if (n == HEX_REG_P3_0_ALIASED) {
+        uint32_t p3_0 = 0;
+        for (int i = 0; i < NUM_PREGS; i++) {
+            p3_0 = deposit32(p3_0, i * 8, 8, env->pred[i]);
+        }
+        return gdb_get_regl(mem_buf, p3_0);
+    }
+
     if (n < TOTAL_PER_THREAD_REGS) {
         return gdb_get_regl(mem_buf, env->gpr[n]);
     }
@@ -37,6 +45,14 @@ int hexagon_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
     HexagonCPU *cpu = HEXAGON_CPU(cs);
     CPUHexagonState *env = &cpu->env;
 
+    if (n == HEX_REG_P3_0_ALIASED) {
+        uint32_t p3_0 = ldtul_p(mem_buf);
+        for (int i = 0; i < NUM_PREGS; i++) {
+            env->pred[i] = extract32(p3_0, i * 8, 8);
+        }
+        return sizeof(target_ulong);
+    }
+
     if (n < TOTAL_PER_THREAD_REGS) {
         env->gpr[n] = ldtul_p(mem_buf);
         return sizeof(target_ulong);
-- 
2.39.1


