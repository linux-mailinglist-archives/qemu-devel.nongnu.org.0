Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90586DA14C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 21:31:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkVKF-0000Vu-3w; Thu, 06 Apr 2023 15:31:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pkVJp-0008EL-SP
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 15:30:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pkVJn-0002KS-3f
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 15:30:49 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336HjAA8020277; Thu, 6 Apr 2023 19:30:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=hEfqexmGOCBPDiChjWLJ/94Ej8FabRepKjvVwNuAL0k=;
 b=lEMVC/Z/1WDLcXDLLRnx/ko/B9HhhOxi8APBD/17i9YAfNEbzdl/nJ5LwfOF5d2+uFze
 y3rxypOGWxFard37M02xixxxcgnbZiHqInACTQz3i3o+ab6hkIqGb1U2gXeH8QfWv76x
 kN5PzxWZTfl1ls7SGaB5ICZ/huJ50AJzsrwJagbvzP/wKIooJNWfvBHAT81xJeNpuNFN
 oClDkDmz6wC+UuS5H4fkIsfInzsHoTrCQfX7JpjIIOo3Fo1nDxFAX6tINyXlutj6wxf7
 dWq3lpblORbTiMNw/T4VA9cdaeAX+qTQ0ydA4e36PrMkCHjrAxLNEHn145nb2Drlw0j6 rw== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3psnmj26cw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 19:30:43 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 336JUgFR019070
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Apr 2023 19:30:42 GMT
Received: from NASANPPMTA02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 6 Apr 2023 12:30:40 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <bcain@quicinc.com>, <tsimpson@quicinc.com>, <alex.bennee@linaro.org>,
 <f4bug@amsat.org>, <peter.maydell@linaro.org>, Sid Manning
 <sidneym@quicinc.com>
Subject: [PATCH 5/7] Hexagon (gdbstub): fix p3:0 read and write via stub
Date: Thu, 6 Apr 2023 16:29:47 -0300
Message-ID: <7ea9a493960213e35b61906f86001bb9aade2b99.1680808943.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <cover.1680808943.git.quic_mathbern@quicinc.com>
References: <cover.1680808943.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: 2KU5T9sNKiqA7Sdx2XGYGcNubQGKpNVA
X-Proofpoint-ORIG-GUID: 2KU5T9sNKiqA7Sdx2XGYGcNubQGKpNVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_11,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=633 adultscore=0 malwarescore=0 spamscore=0
 bulkscore=0 phishscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2304060172
Received-SPF: pass client-ip=205.220.168.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0a-0031df01.pphosted.com
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

From: Brian Cain <bcain@quicinc.com>

Co-authored-by: Sid Manning <sidneym@quicinc.com>
Signed-off-by: Sid Manning <sidneym@quicinc.com>
Signed-off-by: Brian Cain <bcain@quicinc.com>
Co-authored-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
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


