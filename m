Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22A3C8921
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:57:02 +0200 (CEST)
Received: from localhost ([::1]:40334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3iBx-0005Tc-Aq
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:57:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8Y-0007Lr-Dk; Wed, 14 Jul 2021 12:53:30 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:30350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8W-0000zn-4X; Wed, 14 Jul 2021 12:53:30 -0400
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGZQv2071582; Wed, 14 Jul 2021 12:53:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=DMOuHB+5RRJLW0GQhCm2Uuv03jDW3b8LDWImei/+V8w=;
 b=I9m7sdbco8EtzVK2ug+VA0VxtEHdHmUeRsboJ5cHcRNecQMVx5QxLiSUk1vJS3vaL3VX
 0LvL28BXlBC7L8xTHyEdVzErcp43qTdDgOQCH8/ze/LLqAZjwekX9aL70VVr9jLv6rBT
 B2g8IQsnPGCrd6qKUUWYEiTES6y3NQHOhqL8z9yW8kvw0YDUNgoTKm/6tYIsCBKbqdz8
 MfgMssvREthIsBQSYLrufcZ3jKhweADclQUMlwLX1n2U1+5a4qQZch6s5UY8GbB4vYfu
 +p+Ag0MJTxIKDdWUU89TihtDwes9pYOsaFaZOw8aRut1VCiVZ++MRCepd4lDOOBahg3m LQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39stff9bqh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:26 -0400
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16EGhjRm101120;
 Wed, 14 Jul 2021 12:53:26 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39stff9bpu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:26 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16EGqgqw025740;
 Wed, 14 Jul 2021 16:53:24 GMT
Received: from b06cxnps3075.portsmouth.uk.ibm.com
 (d06relay10.portsmouth.uk.ibm.com [9.149.109.195])
 by ppma04ams.nl.ibm.com with ESMTP id 39q3689vg6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 16:53:24 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16EGrLFF31129900
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:53:21 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0BEE5A4054;
 Wed, 14 Jul 2021 16:53:21 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6C376A405C;
 Wed, 14 Jul 2021 16:53:20 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.181.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 16:53:20 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v1 4/9] s390x: Topology list entries and SYSIB 15.x.x
Date: Wed, 14 Jul 2021 18:53:11 +0200
Message-Id: <1626281596-31061-5-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bty2CsWQWcURFohpnlEqd2_0xzru9daP
X-Proofpoint-ORIG-GUID: UjesSB5VTjgmQcUY23GFoXEv0jVebbJG
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_10:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 mlxlogscore=999
 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140099
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, ehabkost@redhat.com, david@redhat.com, cohuck@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, pbonzini@redhat.com,
 eblake@redhat.com
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


