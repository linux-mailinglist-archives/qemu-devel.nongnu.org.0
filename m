Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 073C76DA14D
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Apr 2023 21:31:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pkVKN-0001KG-1D; Thu, 06 Apr 2023 15:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pkVKK-00018c-Qd
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 15:31:20 -0400
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quic_mathbern@quicinc.com>)
 id 1pkVKH-0002WQ-Qe
 for qemu-devel@nongnu.org; Thu, 06 Apr 2023 15:31:20 -0400
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 336C0562004077; Thu, 6 Apr 2023 19:31:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=Mtps1fz9KB5WjAS1S2MkhjPGT5pOYKykFU9pgzEBJI0=;
 b=FzSRBEWsFjX1Oum2rVrJTALDjDXXuPAyTvW5G0WCVVMJ62HJD0VPQS0i/1byW4o5uaeR
 YA2qwzW8eFceuIQBbfjHfPZRlOT77eCBc/3mUGBLCr1hlgcp2DuNvWgdVpN2l2pEASqZ
 ZgoRBX97p5C0MBALsFQRUOjqhbTd16n81DUluFwzm+Q103WAWCuOnhDXtmplN4uUgRkK
 13ANoGyqrMrMoBUpk66kyvyYfQ2WHw5Kv2NkrEiYnUsjSBDdTUI47eTXO/KaiQ1YKY8h
 xGD1LX7OfHWUWzymTlsfgMQAO5lnoAsJBNovChBZx+vvLYKvQ63IbcCuZbcHUuWNEIdN +A== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pss7e9nd7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 06 Apr 2023 19:31:15 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 336JUeQI026160
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 6 Apr 2023 19:30:40 GMT
Received: from NASANPPMTA02.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 6 Apr 2023 12:30:37 -0700
From: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
To: <qemu-devel@nongnu.org>
CC: <bcain@quicinc.com>, <tsimpson@quicinc.com>, <alex.bennee@linaro.org>,
 <f4bug@amsat.org>, <peter.maydell@linaro.org>
Subject: [PATCH 4/7] Hexagon: support qRegisterInfo at gdbstub
Date: Thu, 6 Apr 2023 16:29:46 -0300
Message-ID: <d97592a355bcccaabf16e395be71a0d48bb722b5.1680808943.git.quic_mathbern@quicinc.com>
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
X-Proofpoint-GUID: EDFFQXg_RAqPO3zY_eypeuj-ZMjjzm-q
X-Proofpoint-ORIG-GUID: EDFFQXg_RAqPO3zY_eypeuj-ZMjjzm-q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-04-06_11,2023-04-06_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 mlxlogscore=839
 adultscore=0 mlxscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2304060172
Received-SPF: pass client-ip=205.220.180.131;
 envelope-from=quic_mathbern@quicinc.com; helo=mx0b-0031df01.pphosted.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Signed-off-by: Brian Cain <bcain@quicinc.com>
Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
---
 target/hexagon/gdb_qreginfo.h | 124 ++++++++++++++++++++++++++++++++++
 target/hexagon/cpu.c          |   3 +
 2 files changed, 127 insertions(+)
 create mode 100644 target/hexagon/gdb_qreginfo.h

diff --git a/target/hexagon/gdb_qreginfo.h b/target/hexagon/gdb_qreginfo.h
new file mode 100644
index 0000000000..64631ddd58
--- /dev/null
+++ b/target/hexagon/gdb_qreginfo.h
@@ -0,0 +1,124 @@
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
+#ifndef HEXAGON_GDB_QREGINFO_H
+#define HEXAGON_GDB_QREGINFO_H
+
+const char * const hexagon_qreg_descs[] = {
+    "name:r00;alt-name:r0;bitsize:32;offset=0;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:0;generic:r00;",
+    "name:r01;alt-name:r1;bitsize:32;offset=4;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:1;generic:r01;",
+    "name:r02;alt-name:r2;bitsize:32;offset=8;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:2;generic:r02;",
+    "name:r03;alt-name:r3;bitsize:32;offset=12;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:3;generic:r03;",
+    "name:r04;alt-name:r4;bitsize:32;offset=16;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:4;generic:r04;",
+    "name:r05;alt-name:r5;bitsize:32;offset=20;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:5;generic:r05;",
+    "name:r06;alt-name:r6;bitsize:32;offset=24;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:6;generic:r06;",
+    "name:r07;alt-name:r7;bitsize:32;offset=28;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:7;generic:r07;",
+    "name:r08;alt-name:r8;bitsize:32;offset=32;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:8;generic:r08;",
+    "name:r09;alt-name:r9;bitsize:32;offset=36;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:9;generic:r09;",
+    "name:r10;alt-name:;bitsize:32;offset=40;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:10;generic:;",
+    "name:r11;alt-name:;bitsize:32;offset=44;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:11;generic:;",
+    "name:r12;alt-name:;bitsize:32;offset=48;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:12;generic:;",
+    "name:r13;alt-name:;bitsize:32;offset=52;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:13;generic:;",
+    "name:r14;alt-name:;bitsize:32;offset=56;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:14;generic:;",
+    "name:r15;alt-name:;bitsize:32;offset=60;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:15;generic:;",
+    "name:r16;alt-name:;bitsize:32;offset=64;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:16;generic:;",
+    "name:r17;alt-name:;bitsize:32;offset=68;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:17;generic:;",
+    "name:r18;alt-name:;bitsize:32;offset=72;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:18;generic:;",
+    "name:r19;alt-name:;bitsize:32;offset=76;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:19;generic:;",
+    "name:r20;alt-name:;bitsize:32;offset=80;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:20;generic:;",
+    "name:r21;alt-name:;bitsize:32;offset=84;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:21;generic:;",
+    "name:r22;alt-name:;bitsize:32;offset=88;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:22;generic:;",
+    "name:r23;alt-name:;bitsize:32;offset=92;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:23;generic:;",
+    "name:r24;alt-name:;bitsize:32;offset=96;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:24;generic:;",
+    "name:r25;alt-name:;bitsize:32;offset=100;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:25;generic:;",
+    "name:r26;alt-name:;bitsize:32;offset=104;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:26;generic:;",
+    "name:r27;alt-name:;bitsize:32;offset=108;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:27;generic:;",
+    "name:r28;alt-name:;bitsize:32;offset=112;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:28;generic:;",
+    "name:r29;alt-name:sp;bitsize:32;offset=116;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:29;generic:sp;",
+    "name:r30;alt-name:fp;bitsize:32;offset=120;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:30;generic:fp;",
+    "name:r31;alt-name:ra;bitsize:32;offset=124;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:31;generic:ra;",
+    "name:sa0;alt-name:;bitsize:32;offset=128;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:32;generic:;",
+    "name:lc0;alt-name:;bitsize:32;offset=132;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:33;generic:;",
+    "name:sa1;alt-name:;bitsize:32;offset=136;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:34;generic:;",
+    "name:lc1;alt-name:;bitsize:32;offset=140;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:35;generic:;",
+    "name:p3_0;alt-name:;bitsize:32;offset=144;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:36;generic:;",
+    "name:c5;alt-name:;bitsize:32;offset=148;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:37;generic:;",
+    "name:m0;alt-name:;bitsize:32;offset=152;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:38;generic:;",
+    "name:m1;alt-name:;bitsize:32;offset=156;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:39;generic:;",
+    "name:usr;alt-name:;bitsize:32;offset=160;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:40;generic:;",
+    "name:pc;alt-name:pc;bitsize:32;offset=164;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:41;generic:pc;",
+    "name:ugp;alt-name:;bitsize:32;offset=168;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:42;generic:;",
+    "name:gp;alt-name:;bitsize:32;offset=172;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:43;generic:;",
+    "name:cs0;alt-name:;bitsize:32;offset=176;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:44;generic:;",
+    "name:cs1;alt-name:;bitsize:32;offset=180;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:45;generic:;",
+    "name:upcyclelo;alt-name:;bitsize:32;offset=184;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:46;generic:;",
+    "name:upcyclehi;alt-name:;bitsize:32;offset=188;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:47;generic:;",
+    "name:framelimit;alt-name:;bitsize:32;offset=192;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:48;generic:;",
+    "name:framekey;alt-name:;bitsize:32;offset=196;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:49;generic:;",
+    "name:pktcountlo;alt-name:;bitsize:32;offset=200;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:50;generic:;",
+    "name:pktcounthi;alt-name:;bitsize:32;offset=204;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:51;generic:;",
+    "name:pkt_cnt;alt-name:;bitsize:32;offset=208;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:52;generic:;",
+    "name:insn_cnt;alt-name:;bitsize:32;offset=212;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:53;generic:;",
+    "name:hvx_cnt;alt-name:;bitsize:32;offset=216;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:54;generic:;",
+    "name:c23;alt-name:;bitsize:32;offset=220;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:55;generic:;",
+    "name:c24;alt-name:;bitsize:32;offset=224;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:56;generic:;",
+    "name:c25;alt-name:;bitsize:32;offset=228;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:57;generic:;",
+    "name:c26;alt-name:;bitsize:32;offset=232;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:58;generic:;",
+    "name:c27;alt-name:;bitsize:32;offset=236;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:59;generic:;",
+    "name:c28;alt-name:;bitsize:32;offset=240;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:60;generic:;",
+    "name:c29;alt-name:;bitsize:32;offset=244;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:61;generic:;",
+    "name:utimerlo;alt-name:;bitsize:32;offset=248;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:62;generic:;",
+    "name:utimerhi;alt-name:;bitsize:32;offset=252;variable-size:0;encoding:uint;format:hex;set:Thread Registers;dwarf:63;generic:;",
+    "name:v0;alt-name:;bitsize:1024;offset=256;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:88;generic:;",
+    "name:v1;alt-name:;bitsize:1024;offset=384;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:89;generic:;",
+    "name:v2;alt-name:;bitsize:1024;offset=512;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:90;generic:;",
+    "name:v3;alt-name:;bitsize:1024;offset=640;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:91;generic:;",
+    "name:v4;alt-name:;bitsize:1024;offset=768;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:92;generic:;",
+    "name:v5;alt-name:;bitsize:1024;offset=896;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:93;generic:;",
+    "name:v6;alt-name:;bitsize:1024;offset=1024;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:94;generic:;",
+    "name:v7;alt-name:;bitsize:1024;offset=1152;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:95;generic:;",
+    "name:v8;alt-name:;bitsize:1024;offset=1280;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:96;generic:;",
+    "name:v9;alt-name:;bitsize:1024;offset=1408;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:97;generic:;",
+    "name:v10;alt-name:;bitsize:1024;offset=1536;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:98;generic:;",
+    "name:v11;alt-name:;bitsize:1024;offset=1664;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:99;generic:;",
+    "name:v12;alt-name:;bitsize:1024;offset=1792;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:100;generic:;",
+    "name:v13;alt-name:;bitsize:1024;offset=1920;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:101;generic:;",
+    "name:v14;alt-name:;bitsize:1024;offset=2048;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:102;generic:;",
+    "name:v15;alt-name:;bitsize:1024;offset=2176;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:103;generic:;",
+    "name:v16;alt-name:;bitsize:1024;offset=2304;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:104;generic:;",
+    "name:v17;alt-name:;bitsize:1024;offset=2432;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:105;generic:;",
+    "name:v18;alt-name:;bitsize:1024;offset=2560;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:106;generic:;",
+    "name:v19;alt-name:;bitsize:1024;offset=2688;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:107;generic:;",
+    "name:v20;alt-name:;bitsize:1024;offset=2816;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:108;generic:;",
+    "name:v21;alt-name:;bitsize:1024;offset=2944;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:109;generic:;",
+    "name:v22;alt-name:;bitsize:1024;offset=3072;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:110;generic:;",
+    "name:v23;alt-name:;bitsize:1024;offset=3200;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:111;generic:;",
+    "name:v24;alt-name:;bitsize:1024;offset=3328;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:112;generic:;",
+    "name:v25;alt-name:;bitsize:1024;offset=3456;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:113;generic:;",
+    "name:v26;alt-name:;bitsize:1024;offset=3584;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:114;generic:;",
+    "name:v27;alt-name:;bitsize:1024;offset=3712;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:115;generic:;",
+    "name:v28;alt-name:;bitsize:1024;offset=3840;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:116;generic:;",
+    "name:v29;alt-name:;bitsize:1024;offset=3968;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:117;generic:;",
+    "name:v30;alt-name:;bitsize:1024;offset=4096;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:118;generic:;",
+    "name:v31;alt-name:;bitsize:1024;offset=4224;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:119;generic:;",
+    "name:q0;alt-name:;bitsize:128;offset=4352;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:120;generic:;",
+    "name:q1;alt-name:;bitsize:128;offset=4368;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:121;generic:;",
+    "name:q2;alt-name:;bitsize:128;offset=4384;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:122;generic:;",
+    "name:q3;alt-name:;bitsize:128;offset=4400;variable-size:1;encoding:vector;format:hex;set:HVX Vector Registers;dwarf:123;generic:;",
+};
+
+#endif /* HEXAGON_GDB_QREGINFO_H */
diff --git a/target/hexagon/cpu.c b/target/hexagon/cpu.c
index ab40cfc283..aa470d9ee4 100644
--- a/target/hexagon/cpu.c
+++ b/target/hexagon/cpu.c
@@ -19,6 +19,7 @@
 #include "qemu/qemu-print.h"
 #include "cpu.h"
 #include "internal.h"
+#include "gdb_qreginfo.h"
 #include "exec/exec-all.h"
 #include "qapi/error.h"
 #include "hw/qdev-properties.h"
@@ -358,6 +359,8 @@ static void hexagon_cpu_class_init(ObjectClass *c, void *data)
     cc->get_pc = hexagon_cpu_get_pc;
     cc->gdb_read_register = hexagon_gdb_read_register;
     cc->gdb_write_register = hexagon_gdb_write_register;
+    cc->gdb_qreg_info_lines = (const char **)hexagon_qreg_descs;
+    cc->gdb_qreg_info_line_count = ARRAY_SIZE(hexagon_qreg_descs);
     cc->gdb_num_core_regs = TOTAL_PER_THREAD_REGS + NUM_VREGS + NUM_QREGS;
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = hexagon_cpu_disas_set_info;
-- 
2.39.1


