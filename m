Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C1E3D2B5D
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 19:47:20 +0200 (CEST)
Received: from localhost ([::1]:39332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6cn1-0003wD-3j
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 13:47:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m6civ-0005jW-O8; Thu, 22 Jul 2021 13:43:05 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:31042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m6ciu-00044Z-1F; Thu, 22 Jul 2021 13:43:05 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16MHX6op080481; Thu, 22 Jul 2021 13:43:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=DMOuHB+5RRJLW0GQhCm2Uuv03jDW3b8LDWImei/+V8w=;
 b=LLZjdI49TtH0kg/OCSgo70+PAxXBmEUhcMX0CveWcfnw9hfyrknKF//Iy9dGrPqV3xMo
 pKIdJBOGBn2U6o8eS4jdysh4XptAt/iq38ijtjziw5X58pDklA88+moLHLht+B8NupdK
 Sjbm/AM3AmPiHg2uSMNjsKdLNjXHmzCp9P5fqdI3BqXMVxty8WMhlfZ19uP+GU9WrJW/
 yfvx8c82dR0XD00QJlZVVlboHgVY8WbtVkFSQ6vW62y5JSpAflqOGItPQKxRNlo+oZq+
 9PVXB+57zsmVJ/pTDTuEuhDhNg/pJsx2rXml8UEPn2Yi03+1BCxZYlI0tgXVom0qLazz 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ybu4us7a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 13:43:01 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16MHXDCc081033;
 Thu, 22 Jul 2021 13:43:01 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39ybu4us5j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 13:43:01 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16MHX6sW012174;
 Thu, 22 Jul 2021 17:42:58 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma06ams.nl.ibm.com with ESMTP id 39vng727yu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 22 Jul 2021 17:42:58 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 16MHeTT027525460
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 22 Jul 2021 17:40:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9880311C052;
 Thu, 22 Jul 2021 17:42:55 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3C92611C04C;
 Thu, 22 Jul 2021 17:42:55 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.18.177])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 22 Jul 2021 17:42:55 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v2 4/5] s390x: topology: Topology list entries and SYSIB 15.x.x
Date: Thu, 22 Jul 2021 19:42:43 +0200
Message-Id: <1626975764-22131-5-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
References: <1626975764-22131-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: v7YuVurU-kzusXYU4yO7eN-eS3Mpg6Hb
X-Proofpoint-GUID: 3l9IKYAej93h4x8tV0pbv6TuToHecdWV
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-22_12:2021-07-22,
 2021-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 clxscore=1015
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107220116
Received-SPF: pass client-ip=148.163.156.1; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: thuth@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We define the CPU type Topology List Entry and the
Container type Topology List Entry to implement SYSIB 15.1.x

This patch will be squatched with the next patch.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 target/s390x/cpu.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index b26ae8fff2..d573ba205e 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -564,6 +564,50 @@ typedef union SysIB {
 } SysIB;
 QEMU_BUILD_BUG_ON(sizeof(SysIB) != 4096);
 
+/* CPU type Topology List Entry */
+typedef struct SysIBTl_cpu {
+        uint8_t nl;
+        uint8_t reserved0[3];
+        uint8_t reserved1:5;
+        uint8_t dedicated:1;
+        uint8_t polarity:2;
+        uint8_t type;
+        uint16_t origin;
+        uint64_t mask;
+} QEMU_PACKED SysIBTl_cpu;
+
+/* Container type Topology List Entry */
+typedef struct SysIBTl_container {
+        uint8_t nl;
+        uint8_t reserved[6];
+        uint8_t id;
+} QEMU_PACKED SysIBTl_container;
+
+/* Generic Topology List Entry */
+typedef union SysIBTl_entry {
+        uint8_t nl;
+        SysIBTl_container container;
+        SysIBTl_cpu cpu;
+} QEMU_PACKED SysIBTl_entry;
+
+#define TOPOLOGY_NR_MAG  6
+#define TOPOLOGY_NR_MAG6 0
+#define TOPOLOGY_NR_MAG5 1
+#define TOPOLOGY_NR_MAG4 2
+#define TOPOLOGY_NR_MAG3 3
+#define TOPOLOGY_NR_MAG2 4
+#define TOPOLOGY_NR_MAG1 5
+/* Configuration topology */
+typedef struct SysIB_151x {
+    uint8_t  res0[2];
+    uint16_t length;
+    uint8_t  mag[TOPOLOGY_NR_MAG];
+    uint8_t  res1;
+    uint8_t  mnest;
+    uint32_t res2;
+    SysIBTl_entry tle[0];
+} QEMU_PACKED SysIB_151x;
+
 /* MMU defines */
 #define ASCE_ORIGIN           (~0xfffULL) /* segment table origin             */
 #define ASCE_SUBSPACE         0x200       /* subspace group control           */
-- 
2.25.1


