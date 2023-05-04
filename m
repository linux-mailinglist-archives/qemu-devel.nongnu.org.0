Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BE3D6F7124
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:37:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpO-0000L0-U6; Thu, 04 May 2023 13:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pub1k-0003w1-Nb
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:37:52 -0400
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mathbern@qualcomm.com>)
 id 1pub1f-0001DI-Sx
 for qemu-devel@nongnu.org; Thu, 04 May 2023 11:37:52 -0400
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 344DZilY027881; Thu, 4 May 2023 15:37:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=zb/Y8vvgGoXx6tTaWc0rxAYhjCOq8GkORd7G3xujDzI=;
 b=D+qLASGtYpi4A+d69+XHuVqe7Rbi1TXWHlXe2b98P4YAm449fwRHmp1g6u3Nxef7rpb2
 Tb9BbSzBwhG8yQikzcl+XA1gbKzF2DytSj8GGEXjjcKyf2eTAN3xLv3nInCIo48va0i7
 /8csH6VkYMJ7TMLzESsG3e1f6FgfJNl94+munJ6M2mKO81uYw4ijCnjxaNRxNeLXLMPg
 gJVGzml8Dk+eY+p1jdFgT5L4Ub8l14CJiWPCfyGctsBRUaItxscMQZgOU+e3mUY3nqTx
 aWO8h1WgMH7gfsp4/mQgrha426x+wuNLthdn06ExN+ilcFDnIWL9GgVuM7K3joyw4DCd vA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qc5bn1j20-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:39 +0000
Received: from pps.filterd (NALASPPMTA03.qualcomm.com [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 344Fa6oI006525; 
 Thu, 4 May 2023 15:37:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 3qbe38tv82-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:38 +0000
Received: from NALASPPMTA03.qualcomm.com (NALASPPMTA03.qualcomm.com
 [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 344FUDTT029377;
 Thu, 4 May 2023 15:37:38 GMT
Received: from hu-devc-sd-u20-a-1.qualcomm.com (hu-mathbern-lv.qualcomm.com
 [10.47.235.147])
 by NALASPPMTA03.qualcomm.com (PPS) with ESMTPS id 344FbbHY007856
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 04 May 2023 15:37:38 +0000
Received: by hu-devc-sd-u20-a-1.qualcomm.com (Postfix, from userid 4229910)
 id CAC6770F2; Thu,  4 May 2023 12:37:37 -0300 (-03)
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com, philmd@linaro.org,
 richard.henderson@linaro.org, Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v3 3/6] Hexagon: add core gdbstub xml data for LLDB
Date: Thu,  4 May 2023 12:37:33 -0300
Message-Id: <d25a3a79334d81f0e1ecfb438b6ee82585d02dc4.1683214375.git.quic_mathbern@quicinc.com>
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
X-Proofpoint-ORIG-GUID: u4kKhaZ2SRmu1jIbywi31McqZspTOYhl
X-Proofpoint-GUID: u4kKhaZ2SRmu1jIbywi31McqZspTOYhl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_10,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0
 suspectscore=0 mlxlogscore=514 clxscore=1015 priorityscore=1501
 malwarescore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305040127
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

Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 MAINTAINERS                            |  1 +
 configs/targets/hexagon-linux-user.mak |  1 +
 target/hexagon/cpu.c                   |  3 +-
 gdb-xml/hexagon-core.xml               | 84 ++++++++++++++++++++++++++
 4 files changed, 88 insertions(+), 1 deletion(-)
 create mode 100644 gdb-xml/hexagon-core.xml

diff --git a/MAINTAINERS b/MAINTAINERS
index b22b85bc3a..95037d9f34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -225,6 +225,7 @@ F: tests/tcg/hexagon/
 F: disas/hexagon.c
 F: configs/targets/hexagon-linux-user/default.mak
 F: docker/dockerfiles/debian-hexagon-cross.docker
+F: gdb-xml/hexagon*.xml
 
 Hexagon idef-parser
 M: Alessandro Di Federico <ale@rev.ng>
diff --git a/configs/targets/hexagon-linux-user.mak b/configs/targets/hexagon-linux-user.mak
index 003ed0a408..fd5e222d4f 100644
--- a/configs/targets/hexagon-linux-user.mak
+++ b/configs/targets/hexagon-linux-user.mak
@@ -1 +1,2 @@
 TARGET_ARCH=hexagon
+TARGET_XML_FILES=gdb-xml/hexagon-core.xml
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index ab40cfc283..a59d964574 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -358,8 +358,9 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     cc->get_pc = hexagon_cpu_get_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
     cc->gdb_write_register = hexagon_gdb_write_register;
-    cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS + NUM_VREGS + NUM_QREGS;
+    cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS;
     cc->gdb_stop_before_watchpoint = true;
+    cc->gdb_core_xml_file = "hexagon-core.xml";
     cc->disas_set_info = hexagon_cpu_disas_set_info;
     cc->tcg_ops = &hexagon_tcg_ops;
 }
diff --git a/gdb-xml/hexagon-core.xml b/gdb-xml/hexagon-core.xml
new file mode 100644
index 0000000000..e181163cff
--- /dev/null
+++ b/gdb-xml/hexagon-core.xml
@@ -0,0 +1,84 @@
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
+<feature name="org.gnu.gdb.hexagon.core">
+
+  <reg name="r00" altname="r0" bitsize="32" offset="0"   encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="0" generic="r00"/>
+  <reg name="r01" altname="r1" bitsize="32" offset="4"   encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="1" generic="r01"/>
+  <reg name="r02" altname="r2" bitsize="32" offset="8"   encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="2" generic="r02"/>
+  <reg name="r03" altname="r3" bitsize="32" offset="12"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="3" generic="r03"/>
+  <reg name="r04" altname="r4" bitsize="32" offset="16"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="4" generic="r04"/>
+  <reg name="r05" altname="r5" bitsize="32" offset="20"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="5" generic="r05"/>
+  <reg name="r06" altname="r6" bitsize="32" offset="24"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="6" generic="r06"/>
+  <reg name="r07" altname="r7" bitsize="32" offset="28"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="7" generic="r07"/>
+  <reg name="r08" altname="r8" bitsize="32" offset="32"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="8" generic="r08"/>
+  <reg name="r09" altname="r9" bitsize="32" offset="36"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="9" generic="r09"/>
+  <reg name="r10"              bitsize="32" offset="40"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="10"/>
+  <reg name="r11"              bitsize="32" offset="44"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="11"/>
+  <reg name="r12"              bitsize="32" offset="48"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="12"/>
+  <reg name="r13"              bitsize="32" offset="52"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="13"/>
+  <reg name="r14"              bitsize="32" offset="56"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="14"/>
+  <reg name="r15"              bitsize="32" offset="60"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="15"/>
+  <reg name="r16"              bitsize="32" offset="64"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="16"/>
+  <reg name="r17"              bitsize="32" offset="68"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="17"/>
+  <reg name="r18"              bitsize="32" offset="72"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="18"/>
+  <reg name="r19"              bitsize="32" offset="76"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="19"/>
+  <reg name="r20"              bitsize="32" offset="80"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="20"/>
+  <reg name="r21"              bitsize="32" offset="84"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="21"/>
+  <reg name="r22"              bitsize="32" offset="88"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="22"/>
+  <reg name="r23"              bitsize="32" offset="92"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="23"/>
+  <reg name="r24"              bitsize="32" offset="96"  encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="24"/>
+  <reg name="r25"              bitsize="32" offset="100" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="25"/>
+  <reg name="r26"              bitsize="32" offset="104" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="26"/>
+  <reg name="r27"              bitsize="32" offset="108" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="27"/>
+  <reg name="r28"              bitsize="32" offset="112" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="28"/>
+  <reg name="r29" altname="sp" bitsize="32" offset="116" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="29" generic="sp"/>
+  <reg name="r30" altname="fp" bitsize="32" offset="120" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="30" generic="fp"/>
+  <reg name="r31" altname="ra" bitsize="32" offset="124" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="31" generic="ra"/>
+  <reg name="sa0"              bitsize="32" offset="128" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="32"/>
+  <reg name="lc0"              bitsize="32" offset="132" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="33"/>
+  <reg name="sa1"              bitsize="32" offset="136" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="34"/>
+  <reg name="lc1"              bitsize="32" offset="140" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="35"/>
+  <reg name="p3_0"             bitsize="32" offset="144" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="36"/>
+  <reg name="c5"               bitsize="32" offset="148" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="37"/>
+  <reg name="m0"               bitsize="32" offset="152" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="38"/>
+  <reg name="m1"               bitsize="32" offset="156" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="39"/>
+  <reg name="usr"              bitsize="32" offset="160" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="40"/>
+  <reg name="pc"               bitsize="32" offset="164" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="41" generic="pc"/>
+  <reg name="ugp"              bitsize="32" offset="168" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="42"/>
+  <reg name="gp"               bitsize="32" offset="172" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="43"/>
+  <reg name="cs0"              bitsize="32" offset="176" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="44"/>
+  <reg name="cs1"              bitsize="32" offset="180" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="45"/>
+  <reg name="upcyclelo"        bitsize="32" offset="184" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="46"/>
+  <reg name="upcyclehi"        bitsize="32" offset="188" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="47"/>
+  <reg name="framelimit"       bitsize="32" offset="192" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="48"/>
+  <reg name="framekey"         bitsize="32" offset="196" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="49"/>
+  <reg name="pktcountlo"       bitsize="32" offset="200" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="50"/>
+  <reg name="pktcounthi"       bitsize="32" offset="204" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="51"/>
+  <reg name="pkt_cnt"          bitsize="32" offset="208" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="52"/>
+  <reg name="insn_cnt"         bitsize="32" offset="212" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="53"/>
+  <reg name="hvx_cnt"          bitsize="32" offset="216" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="54"/>
+  <reg name="c23"              bitsize="32" offset="220" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="55"/>
+  <reg name="c24"              bitsize="32" offset="224" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="56"/>
+  <reg name="c25"              bitsize="32" offset="228" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="57"/>
+  <reg name="c26"              bitsize="32" offset="232" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="58"/>
+  <reg name="c27"              bitsize="32" offset="236" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="59"/>
+  <reg name="c28"              bitsize="32" offset="240" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="60"/>
+  <reg name="c29"              bitsize="32" offset="244" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="61"/>
+  <reg name="utimerlo"         bitsize="32" offset="248" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="62"/>
+  <reg name="utimerhi"         bitsize="32" offset="252" encoding="uint" format="hex" group="Thread Registers" dwarf_regnum="63"/>
+
+</feature>
-- 
2.37.2


