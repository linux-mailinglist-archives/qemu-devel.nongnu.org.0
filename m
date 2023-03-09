Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73BAD6B23E8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 13:17:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paFBU-0004Cy-1r; Thu, 09 Mar 2023 07:15:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1paFBJ-00047F-KG; Thu, 09 Mar 2023 07:15:38 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1paFBG-0003tj-Nh; Thu, 09 Mar 2023 07:15:36 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 329AY1ME029627; Thu, 9 Mar 2023 12:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3eu0zFICVookgj1YRxiGpwqJlzDHo02+NaMVsBUQU+k=;
 b=Ek7CwJ0DUrWRBrY/2sre3qczNbHba5yfKgSkrDTvxgUpGOnuX3CdRNbLts7rd9+L9a0F
 yY6fZhQLqjQPyYBXIkSUE27lApq6m/I+TQANb/CI6ZND5bRN//9oUrfpTToBBEBXjas1
 vNO+Ujsv6qDHbw8S00m/fk5GyGMGclFPtoE/6slu+TWmqgVJCajtuJUveg+agD83dNNh
 Rbu2P/O2IZ0NfSD/YRWTh1v90l/G6D4GUgVmZImWZujbryvzL1F/90b7UeT2cDrdAT9k
 UNSd4rpeCD2FZAwPI3lhgPOd0LwoXQBH2FqPRMDHQu0HGMUqYXHQHxgxLejxFtPEa561 FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6t3br5x9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 12:15:26 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 329C9Y5w023851;
 Thu, 9 Mar 2023 12:15:25 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p6t3br5vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 12:15:25 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3294CC5K023163;
 Thu, 9 Mar 2023 12:15:23 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
 by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3p6fystaed-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Mar 2023 12:15:23 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com
 [10.20.54.106])
 by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 329CFK6537552410
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Mar 2023 12:15:20 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EBD9C20043;
 Thu,  9 Mar 2023 12:15:19 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CEA112004E;
 Thu,  9 Mar 2023 12:15:18 +0000 (GMT)
Received: from li-c6ac47cc-293c-11b2-a85c-d421c8e4747b.ibm.com.com (unknown
 [9.171.28.223]) by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  9 Mar 2023 12:15:18 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: qemu-devel@nongnu.org, borntraeger@de.ibm.com, pasic@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, thuth@redhat.com,
 cohuck@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 kvm@vger.kernel.org, ehabkost@redhat.com, marcel.apfelbaum@gmail.com,
 eblake@redhat.com, armbru@redhat.com, seiden@linux.ibm.com,
 nrb@linux.ibm.com, nsg@linux.ibm.com, frankja@linux.ibm.com,
 berrange@redhat.com, clg@kaod.org
Subject: [PATCH v17 04/12] s390x/sclp: reporting the maximum nested topology
 entries
Date: Thu,  9 Mar 2023 13:15:03 +0100
Message-Id: <20230309121511.139152-5-pmorel@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230309121511.139152-1-pmorel@linux.ibm.com>
References: <20230309121511.139152-1-pmorel@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GPmlWU1aYv-oG4YH2CMerfGzPBzYjj8U
X-Proofpoint-ORIG-GUID: L5XcxwE1ewLGhZ1CqCcy6b8UrVsLccDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-09_06,2023-03-08_03,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 malwarescore=0 bulkscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 impostorscore=0 phishscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303090097
Received-SPF: pass client-ip=148.163.158.5; envelope-from=pmorel@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The maximum nested topology entries is used by the guest to
know how many nested topology are available on the machine.

Let change the MNEST value from 2 to 4 in the SCLP READ INFO
structure now that we support books and drawers.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
Reviewed-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/s390x/sclp.h | 5 +++--
 hw/s390x/sclp.c         | 5 +++++
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
index 712fd68123..902252b319 100644
--- a/include/hw/s390x/sclp.h
+++ b/include/hw/s390x/sclp.h
@@ -112,12 +112,13 @@ typedef struct CPUEntry {
 } QEMU_PACKED CPUEntry;
 
 #define SCLP_READ_SCP_INFO_FIXED_CPU_OFFSET     128
-#define SCLP_READ_SCP_INFO_MNEST                2
+#define SCLP_READ_SCP_INFO_MNEST                4
 typedef struct ReadInfo {
     SCCBHeader h;
     uint16_t rnmax;
     uint8_t rnsize;
-    uint8_t  _reserved1[16 - 11];       /* 11-15 */
+    uint8_t  _reserved1[15 - 11];       /* 11-14 */
+    uint8_t stsi_parm;                  /* 15-15 */
     uint16_t entries_cpu;               /* 16-17 */
     uint16_t offset_cpu;                /* 18-19 */
     uint8_t  _reserved2[24 - 20];       /* 20-23 */
diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index eff74479f4..d339cbb7e4 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -20,6 +20,7 @@
 #include "hw/s390x/event-facility.h"
 #include "hw/s390x/s390-pci-bus.h"
 #include "hw/s390x/ipl.h"
+#include "hw/s390x/cpu-topology.h"
 
 static inline SCLPDevice *get_sclp_device(void)
 {
@@ -123,6 +124,10 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
         return;
     }
 
+    if (s390_has_topology()) {
+        read_info->stsi_parm = SCLP_READ_SCP_INFO_MNEST;
+    }
+
     /* CPU information */
     prepare_cpu_entries(machine, entries_start, &cpu_count);
     read_info->entries_cpu = cpu_to_be16(cpu_count);
-- 
2.31.1


