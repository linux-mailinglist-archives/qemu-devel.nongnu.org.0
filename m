Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 261EE6F7131
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:38:38 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucoT-00071q-QY; Thu, 04 May 2023 13:32:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pub1r-0003wd-Nk
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:37:59 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pub1e-0001DK-V1
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:37:59 -0400
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344CJ7WE000303; Thu, 4 May 2023 15:37:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=oax2UDbtWDuJ4cHQNwWuTpm0ronSeEr8qmMbeOqsvbo=;
 b=dsh2b6BcY0sVwIwpfcfXkuCdSMkA/6oA4T42K5qAFUVkb9tHS+CiktzUkAXKiLgLjuHx
 ounRjm9Nd0D/2eDdpi8fPBiFYrOyQ++2U5aWNmw6YRU4JiSl1bCDNq7f79BhWm0FLe0U
 qWc2IMweyjTz5OxnogsMACuq26OYnSZsTGOdyOyBVIqzZpkwG/xwPVnqrJu2hTnRC5+4
 VmaWYW1nWrjL2Cc/Tnt25JutYul3EeombCIrISWvdg/7pLQa3Rz4NS59QIZhCJ8K10Uv
 MiQ5iHEgOA399G127/rPRhZRofiKlxa9Fm6AlS+knwrUhYEng33vh0A9T/90/YDSASqM cw== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qc2aj1vdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:39 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 344Fbcs8007870; 
 Thu, 4 May 2023 15:37:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3qbe38tv85-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:38 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 344FbcNr007864;
 Thu, 4 May 2023 15:37:38 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 344FbcWr007859
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:38 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id 003F270F6; Thu,  4 May 2023 12:37:37 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com, philmd@linaro.org,
 richard.henderson@linaro.org, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v3 5/6] Hexagon (gdbstub): add HVX support
Date: Thu,  4 May 2023 12:37:35 -0300
Message-Id: <17cb32f34d469f705c3cc066a3583935352ee048.1683214375.git.quic_mathbern@quicinc.com>
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
X-Proofpoint-ORIG-GUID: onHNQqORpAN8DUziJuw1zziiIvF9Ssoy
X-Proofpoint-GUID: onHNQqORpAN8DUziJuw1zziiIvF9Ssoy
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_10,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0
 adultscore=0 mlxlogscore=566 impostorscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303200000
 definitions=main-2305040127
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=mathbern@qualcomm.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Co-authored-by: Brian Cain <bcain@quicinc.com>
Signed-off-by: Brian Cain <bcain@quicinc.com>
Co-authored-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 configs/targets/hexagon-linux-user.mak |  2 +-
 target/hexagon/internal.h              |  2 +
 target/hexagon/cpu.c                   |  6 ++
 target/hexagon/gdbstub.c               | 68 ++++++++++++++++++
 gdb-xml/hexagon-hvx.xml                | 96 ++++++++++++++++++++++++++
 5 files changed, 173 insertions(+), 1 deletion(-)
 create mode 100644 gdb-xml/hexagon-hvx.xml

diff --git a/configs/targets/hexagon-linux-user.mak b/configs/targets/hexagon-linux-user.mak
index fd5e222d4f..2765a4c563 100644
--- a/configs/targets/hexagon-linux-user.mak
+++ b/configs/targets/hexagon-linux-user.mak
@@ -1,2 +1,2 @@
 TARGET_ARCH=hexagon
-TARGET_XML_FILES=gdb-xml/hexagon-core.xml
+TARGET_XML_FILES=gdb-xml/hexagon-core.xml gdb-xml/hexagon-hvx.xml
diff --git a/target/hexagon/internal.h b/target/hexagon/internal.h
index b1bfadc3f5..d732b6bb3c 100644
--- a/target/hexagon/internal.h
+++ b/target/hexagon/internal.h
@@ -33,6 +33,8 @@
 
 int hexagon_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int hexagon_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
+int hexagon_hvx_gdb_read_register(CPUHexagonState *env, GByteArray *mem_buf, int n);
+int hexagon_hvx_gdb_write_register(CPUHexagonState *env, uint8_t *mem_buf, int n);
 
 void hexagon_debug_vreg(CPUHexagonState *env, int regnum);
 void hexagon_debug_qreg(CPUHexagonState *env, int regnum);
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index a59d964574..2e36903d9d 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -24,6 +24,7 @@
 #include "hw/qdev-properties.h"
 #include "fpu/softfloat-helpers.h"
 #include "tcg/tcg.h"
+#include "exec/gdbstub.h"
 
 static void hexagon_v67_cpu_init(Object *obj)
 {
@@ -315,6 +316,11 @@ static void hexagon_cpu_realize(DeviceState *dev, Error **errp)
         return;
     }
 
+    gdb_register_coprocessor(cs, hexagon_hvx_gdb_read_register,
+                             hexagon_hvx_gdb_write_register,
+                             NUM_VREGS + NUM_QREGS,
+                             "hexagon-hvx.xml", 0);
+
     qemu_init_vcpu(cs);
     cpu_reset(cs);
 
diff --git a/target/hexagon/gdbstub.c b/target/hexagon/gdbstub.c
index a06fed9f18..54d37e006e 100644
--- a/target/hexagon/gdbstub.c
+++ b/target/hexagon/gdbstub.c
@@ -60,3 +60,71 @@ int hexagon_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n)
 
     g_assert_not_reached();
 }
+
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
+int hexagon_hvx_gdb_read_register(CPUHexagonState *env, GByteArray *mem_buf, int n)
+{
+    if (n < NUM_VREGS) {
+        return gdb_get_vreg(env, mem_buf, n);
+    }
+    n -= NUM_VREGS;
+
+    if (n < NUM_QREGS) {
+        return gdb_get_qreg(env, mem_buf, n);
+    }
+
+    g_assert_not_reached();
+}
+
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
+int hexagon_hvx_gdb_write_register(CPUHexagonState *env, uint8_t *mem_buf, int n)
+{
+   if (n < NUM_VREGS) {
+        return gdb_put_vreg(env, mem_buf, n);
+    }
+    n -= NUM_VREGS;
+
+    if (n < NUM_QREGS) {
+        return gdb_put_qreg(env, mem_buf, n);
+    }
+
+    g_assert_not_reached();
+}
diff --git a/gdb-xml/hexagon-hvx.xml b/gdb-xml/hexagon-hvx.xml
new file mode 100644
index 0000000000..5f2e220733
--- /dev/null
+++ b/gdb-xml/hexagon-hvx.xml
@@ -0,0 +1,96 @@
+<?xml version="1.0"?>
+<!--
+  Copyright(c) 2023 Qualcomm Innovation Center, Inc. All Rights Reserved.
+
+  This work is licensed under the terms of the GNU GPL, version 2 or
+  (at your option) any later version. See the COPYING file in the
+  top-level directory.
+
+  Note: this file is intended to be use with LLDB, so it contains fields
+  that may be unknown to GDB. For more information on such fields, please
+  see:
+  https://github.com/llvm/llvm-project/blob/287aa6c4536408413b860e61fca0318a27214cf3/lldb/docs/lldb-gdb-remote.txt#L738-L860
+  https://github.com/llvm/llvm-project/blob/287aa6c4536408413b860e61fca0318a27214cf3/lldb/source/Plugins/Process/gdb-remote/ProcessGDBRemote.cpp#L4275-L4335
+-->
+
+<!DOCTYPE feature SYSTEM "gdb-target.dtd">
+<feature name="org.gnu.gdb.hexagon.hvx">
+
+  <vector id="vud" type="uint64" count="16"/>
+  <vector id="vd" type="int64" count="16"/>
+  <vector id="vuw" type="uint32" count="32"/>
+  <vector id="vw" type="int32" count="32"/>
+  <vector id="vuh" type="uint16" count="64"/>
+  <vector id="vh" type="int16" count="64"/>
+  <vector id="vub" type="uint8" count="128"/>
+  <vector id="vb" type="int8" count="128"/>
+  <union id="hex_vec">
+    <field name="ud" type="vud"/>
+    <field name="d" type="vd"/>
+    <field name="uw" type="vuw"/>
+    <field name="w" type="vw"/>
+    <field name="uh" type="vuh"/>
+    <field name="h" type="vh"/>
+    <field name="ub" type="vub"/>
+    <field name="b" type="vb"/>
+  </union>
+
+  <flags id="ui2" size="1">
+    <field name="0" start="0" end="0"/>
+    <field name="1" start="1" end="1"/>
+  </flags>
+  <flags id="ui4" size="1">
+    <field name="0" start="0" end="0"/>
+    <field name="1" start="1" end="1"/>
+    <field name="2" start="2" end="2"/>
+    <field name="3" start="3" end="3"/>
+  </flags>
+  <vector id="vpd" type="uint8" count="16"/>
+  <vector id="vpw" type="ui4" count="32"/>
+  <vector id="vph" type="ui2" count="64"/>
+  <vector id="vpb" type="bool" count="128"/>
+  <union id="hex_vec_pred">
+    <field name="d" type="vpd"/>
+    <field name="w" type="vpw"/>
+    <field name="h" type="vph"/>
+    <field name="b" type="vpb"/>
+  </union>
+
+  <reg name="v0"  bitsize="1024" offset="256"  encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="88"/>
+  <reg name="v1"  bitsize="1024" offset="384"  encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="89"/>
+  <reg name="v2"  bitsize="1024" offset="512"  encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="90"/>
+  <reg name="v3"  bitsize="1024" offset="640"  encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="91"/>
+  <reg name="v4"  bitsize="1024" offset="768"  encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="92"/>
+  <reg name="v5"  bitsize="1024" offset="896"  encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="93"/>
+  <reg name="v6"  bitsize="1024" offset="1024" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="94"/>
+  <reg name="v7"  bitsize="1024" offset="1152" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="95"/>
+  <reg name="v8"  bitsize="1024" offset="1280" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="96"/>
+  <reg name="v9"  bitsize="1024" offset="1408" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="97"/>
+  <reg name="v10" bitsize="1024" offset="1536" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="98"/>
+  <reg name="v11" bitsize="1024" offset="1664" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="99"/>
+  <reg name="v12" bitsize="1024" offset="1792" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="100"/>
+  <reg name="v13" bitsize="1024" offset="1920" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="101"/>
+  <reg name="v14" bitsize="1024" offset="2048" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="102"/>
+  <reg name="v15" bitsize="1024" offset="2176" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="103"/>
+  <reg name="v16" bitsize="1024" offset="2304" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="104"/>
+  <reg name="v17" bitsize="1024" offset="2432" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="105"/>
+  <reg name="v18" bitsize="1024" offset="2560" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="106"/>
+  <reg name="v19" bitsize="1024" offset="2688" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="107"/>
+  <reg name="v20" bitsize="1024" offset="2816" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="108"/>
+  <reg name="v21" bitsize="1024" offset="2944" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="109"/>
+  <reg name="v22" bitsize="1024" offset="3072" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="110"/>
+  <reg name="v23" bitsize="1024" offset="3200" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="111"/>
+  <reg name="v24" bitsize="1024" offset="3328" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="112"/>
+  <reg name="v25" bitsize="1024" offset="3456" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="113"/>
+  <reg name="v26" bitsize="1024" offset="3584" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="114"/>
+  <reg name="v27" bitsize="1024" offset="3712" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="115"/>
+  <reg name="v28" bitsize="1024" offset="3840" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="116"/>
+  <reg name="v29" bitsize="1024" offset="3968" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="117"/>
+  <reg name="v30" bitsize="1024" offset="4096" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="118"/>
+  <reg name="v31" bitsize="1024" offset="4224" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="119"/>
+  <reg name="q0"  bitsize="128"  offset="4352" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="120"/>
+  <reg name="q1"  bitsize="128"  offset="4368" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="121"/>
+  <reg name="q2"  bitsize="128"  offset="4384" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="122"/>
+  <reg name="q3"  bitsize="128"  offset="4400" encoding="vector" format="hex" group="HVX Vector Registers" dwarf_regnum="123"/>
+
+</feature>
-- 
2.37.2


