Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACDE6F716E
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:47:16 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoh-0007Fx-R8; Thu, 04 May 2023 13:32:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pub1h-0003vT-LI
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:37:49 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pub1e-0001D8-Vk
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:37:49 -0400
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344CbaYg012221; Thu, 4 May 2023 15:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=zqY4jEfpScuXhvVc/NYdHLu6iOFIxiigs3Ujai++2G8=;
 b=NjedxQlswg1w1vzMdn9lEryB4OzAZdDd+szFsQ+bbnYDGCjpDAgFq6nCU2GVLXAsvsCh
 gP+F5AbWbR1zQ/9wIOunVHYnbqBcd7eLlcQHNeVN2GoD5h3mbGw4qse48A3g0lEaxJlT
 CLBIzbUNOsFYj7hctVW2MnHD0ZM67W+uby4vfApXMOOTEc37qKBB0g59PdHva+NQoA43
 PR8antQKh7Oa/eZVBCgf0wlcMiqaPVQDrRX5cXJUsHN91uYF8YZMm4xq9eqxH5lbzMS5
 5PfPDPc5HF4tan8j/75OjdwyypNgHk1mDxdl5zMeaYwbiyGPwbeEloTsKARSt5AAfww8 Ww== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qbvghjfjn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:39 +0000
Received: from pps.filterd (NALASPPMTA02.qualcomm.com [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 344FbcDj009680; 
 Thu, 4 May 2023 15:37:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 3q8vamegyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:38 +0000
Received: from NALASPPMTA02.qualcomm.com (NALASPPMTA02.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 344Fbc3x009673;
 Thu, 4 May 2023 15:37:38 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA02.qualcomm.com (PPS) with ESMTPS id 344FbbU4009667
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:38 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id D931970F5; Thu,  4 May 2023 12:37:37 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com, philmd@linaro.org,
 richard.henderson@linaro.org, Sid Manning <sidneym@quicinc.com>
Subject: [PATCH v3 4/6] Hexagon (gdbstub): fix p3:0 read and write via stub
Date: Thu,  4 May 2023 12:37:34 -0300
Message-Id: <32e7de567cdae184a6781644454bbb19916c955b.1683214375.git.quic_mathbern@quicinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1683214375.git.quic_mathbern@quicinc.com>
References: <cover.1683214375.git.quic_mathbern@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: lLODkwdO6Jg88xkQR26l93zWD6Q6HFMJ
X-Proofpoint-GUID: lLODkwdO6Jg88xkQR26l93zWD6Q6HFMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_10,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=490
 lowpriorityscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0 adultscore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2303200000 definitions=main-2305040127
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

From: Brian Cain <bcain@quicinc.com>

Signed-off-by: Brian Cain <bcain@quicinc.com>
Co-authored-by: Sid Manning <sidneym@quicinc.com>
Signed-off-by: Sid Manning <sidneym@quicinc.com>
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
2.37.2


