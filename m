Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC0A6DA153
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 21:32:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkVKD-0000NT-PH; Thu, 06 Apr 2023 15:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pkVJr-0008Fh-E5
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 15:30:51 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pkVJp-0002L8-Ci
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 15:30:51 -0400
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336IN2VP023851; Thu, 6 Apr 2023 19:30:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=RrqJDb68COrmEDpVxeUL/BjMz3Co6Gpvkr0HbSwIGXQ=;
 b=D0kV8y4/WZq0nU+eywHxxOAXubOmoo6ogTPCjUEJM1/qFej8tx7+EuuH9TEsH65aujkB
 mIZwFmwnzT6njS6QUsfuVcoroIdpUrOGQvxhWsB2nFCa+s/wbl782MahviR2ioM14XmZ
 i1EzePx3O3ntAIDrp2p7554/FqQzD5vvv2f+soKJU8Lr0scWvgjn3Dg3Yubvmly2UzIU
 ffrBG74SzYFkggPT5aJnutM9UMgT0qWADVgnyRGu30/dg8umdPJxK4nfeCDf2xucKgLB
 GOApYBW/HWReNfrpVQUVaCcTxO24x1FrnDaV6fFfYBMR+EYETX/kyd9C+40ZWv8G9xNo aQ== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3psnmj26d1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 19:30:45 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 336JUjYR019087
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Apr 2023 19:30:45 GMT
Received: from NASANPPMTA02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 6 Apr 2023 12:30:42 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <bcain@quicinc.com>, <tsimpson@quicinc.com>, <alex.bennee@linaro.org>,
 <f4bug@amsat.org>, <peter.maydell@linaro.org>
Subject: [PATCH 6/7] Hexagon (gdbstub): add HVX support
Date: Thu, 6 Apr 2023 16:29:48 -0300
Message-ID: <993c65e6b8c5625243dc185cfdb1c941e9e6e511.1680808943.git.quic_mathbern@quicinc.com>
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
X-Proofpoint-GUID: UIcMMlpXPf9A9l9CqEr0MCWOu8_GX_s_
X-Proofpoint-ORIG-GUID: UIcMMlpXPf9A9l9CqEr0MCWOu8_GX_s_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_11,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=521 adultscore=0 malwarescore=0 spamscore=0
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

From: Taylor Simpson <tsimpson@quicinc.com>

Co-authored-by: Brian Cain <bcain@quicinc.com>
Signed-off-by: Brian Cain <bcain@quicinc.com>
Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Co-authored-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 target/hexagon/gdbstub.c | 60 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c
index a06fed9f18..6c5a15da68 100644
--- a/target/hexagon/gdbstub.c
+++ b/target/hexagon/gdbstub.c
@@ -20,6 +20,26 @@
 #include "cpu.h"
 #include "internal.h"
 
+static int gdb_get_vreg(CPUHexagonState *env, GByteArray *mem_buf, int n)
+{
+    int total = 0;
+    int i;
+    for (i = 0; i < ARRAY_SIZE(env->VRegs[n].uw); i++) {
+        total += gdb_get_regl(mem_buf, env->VRegs[n].uw[i]);
+    }
+    return total;
+}
+
+static int gdb_get_qreg(CPUHexagonState *env, GByteArray *mem_buf, int n)
+{
+    int total = 0;
+    int i;
+    for (i = 0; i < ARRAY_SIZE(env->QRegs[n].uw); i++) {
+        total += gdb_get_regl(mem_buf, env->QRegs[n].uw[i]);
+    }
+    return total;
+}
+
 int hexagon_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
 {
     HexagonCPU *cpu = HEXAGON_CPU(cs);
@@ -36,10 +56,40 @@ int hexagon_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n)
     if (n < TOTAL_PER_THREAD_REGS) {
         return gdb_get_regl(mem_buf, env->gpr[n]);
     }
+    n -= TOTAL_PER_THREAD_REGS;
+
+    if (n < NUM_VREGS) {
+        return gdb_get_vreg(env, mem_buf, n);
+    }
+    n -= NUM_VREGS;
+
+    if (n < NUM_QREGS) {
+        return gdb_get_qreg(env, mem_buf, n);
+    }
 
     g_assert_not_reached();
 }
 
+static int gdb_put_vreg(CPUHexagonState *env, uint8_t *mem_buf, int n)
+{
+    int i;
+    for (i = 0; i < ARRAY_SIZE(env->VRegs[n].uw); i++) {
+        env->VRegs[n].uw[i] = ldtul_p(mem_buf);
+        mem_buf += 4;
+    }
+    return MAX_VEC_SIZE_BYTES;
+}
+
+static int gdb_put_qreg(CPUHexagonState *env, uint8_t *mem_buf, int n)
+{
+    int i;
+    for (i = 0; i < ARRAY_SIZE(env->QRegs[n].uw); i++) {
+        env->QRegs[n].uw[i] = ldtul_p(mem_buf);
+        mem_buf += 4;
+    }
+    return MAX_VEC_SIZE_BYTES / 8;
+}
+
 int hexagon_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 {
     HexagonCPU *cpu = HEXAGON_CPU(cs);
@@ -57,6 +107,16 @@ int hexagon_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
         env->gpr[n] = ldtul_p(mem_buf);
         return sizeof(target_ulong);
     }
+    n -= TOTAL_PER_THREAD_REGS;
+
+    if (n < NUM_VREGS) {
+        return gdb_put_vreg(env, mem_buf, n);
+    }
+    n -= NUM_VREGS;
+
+    if (n < NUM_QREGS) {
+        return gdb_put_qreg(env, mem_buf, n);
+    }
 
     g_assert_not_reached();
 }
-- 
2.39.1


