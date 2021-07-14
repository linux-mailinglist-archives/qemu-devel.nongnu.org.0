Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86BF33C8918
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 18:54:52 +0200 (CEST)
Received: from localhost ([::1]:34226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3i9r-0001Kg-HB
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 12:54:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8Z-0007Ou-LG; Wed, 14 Jul 2021 12:53:31 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19764
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pmorel@linux.ibm.com>)
 id 1m3i8X-00011H-RE; Wed, 14 Jul 2021 12:53:31 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 16EGYLBM193632; Wed, 14 Jul 2021 12:53:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=ugVOCFbwjQpGZRUCLPA5aZGaiv83BUWsG94PJxRt1ZI=;
 b=f/IrjmKa78pJLNCyu3gUW0NuFbLSo40bGWudULAFiAYYUHPhE3UG4s4FnkT50uwzu3Bo
 vtbdbrmuJLPUaAosZHSi32wcI7thSsdWpw5h7wsrqEiGm+l4GMSA8cPEndtja+Ztl0Mt
 l3GjPcTkY/7C2yOA6/GV/+s4Dx9npl2M2QW4mx+psHK5356mO4XovlpkIIgZkyS8ptGt
 opWL2HDs/1L0wtZ5epF94Um0rJ3RZzqHoJLwJ9cWWrgv6NGcYEym6RfNW4HUuWIbzfti
 19XgEpLQhhmp585RRZt5YP5k4YbGQA3QK31FP8BbiW2HrgGHrz4S1BvCjyCUfZpT6CjS 6g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39sugtyhm4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:28 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 16EGZcJE001188;
 Wed, 14 Jul 2021 12:53:28 -0400
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39sugtyhkh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 12:53:27 -0400
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 16EGqXjU028998;
 Wed, 14 Jul 2021 16:53:26 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 39q2th9vnh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Jul 2021 16:53:26 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 16EGrNG635193316
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Jul 2021 16:53:23 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 278A3A405F;
 Wed, 14 Jul 2021 16:53:23 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7F8A0A405C;
 Wed, 14 Jul 2021 16:53:22 +0000 (GMT)
Received: from oc3016276355.ibm.com (unknown [9.145.181.132])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 14 Jul 2021 16:53:22 +0000 (GMT)
From: Pierre Morel <pmorel@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v1 7/9] s390x: SCLP: reporting the maximum nested topology
 entries
Date: Wed, 14 Jul 2021 18:53:14 +0200
Message-Id: <1626281596-31061-8-git-send-email-pmorel@linux.ibm.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
References: <1626281596-31061-1-git-send-email-pmorel@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: abynO9lKjpH2z3ywcZTCS56hlZRAf4sK
X-Proofpoint-ORIG-GUID: LSMQ_RWoQUS7C9m278LQnsiqHASARsfc
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-14_10:2021-07-14,
 2021-07-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=999 bulkscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107140099
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

The maximum nested topology entries is used by the guest to know
how many nested topology are available on the machine.

As we now implemented drawers and books above sockets and core
we can set the maximum nested topology reported by SCLP to 4.

Signed-off-by: Pierre Morel <pmorel@linux.ibm.com>
---
 hw/s390x/sclp.c         | 1 +
 include/hw/s390x/sclp.h | 4 +++-
 target/s390x/kvm/kvm.c  | 1 -
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/s390x/sclp.c b/hw/s390x/sclp.c
index edb6e3ea01..f5fe067ffb 100644
--- a/hw/s390x/sclp.c
+++ b/hw/s390x/sclp.c
@@ -125,6 +125,7 @@ static void read_SCP_info(SCLPDevice *sclp, SCCB *sccb)
 
     /* CPU information */
     prepare_cpu_entries(machine, entries_start, &cpu_count);
+    read_info->stsi_parm = SCLP_READ_SCP_INFO_MNEST;
     read_info->entries_cpu = cpu_to_be16(cpu_count);
     read_info->offset_cpu = cpu_to_be16(offset_cpu);
     read_info->highest_cpu = cpu_to_be16(machine->smp.max_cpus - 1);
diff --git a/include/hw/s390x/sclp.h b/include/hw/s390x/sclp.h
index d3ade40a5a..6ec1185f30 100644
--- a/include/hw/s390x/sclp.h
+++ b/include/hw/s390x/sclp.h
@@ -116,7 +116,9 @@ typedef struct ReadInfo {
     SCCBHeader h;
     uint16_t rnmax;
     uint8_t rnsize;
-    uint8_t  _reserved1[16 - 11];       /* 11-15 */
+    uint8_t  _reserved1[15 - 11];       /* 11-15 */
+#define SCLP_READ_SCP_INFO_MNEST 4
+    uint8_t  stsi_parm;
     uint16_t entries_cpu;               /* 16-17 */
     uint16_t offset_cpu;                /* 18-19 */
     uint8_t  _reserved2[24 - 20];       /* 20-23 */
diff --git a/target/s390x/kvm/kvm.c b/target/s390x/kvm/kvm.c
index 7c3594d793..bc8b392e69 100644
--- a/target/s390x/kvm/kvm.c
+++ b/target/s390x/kvm/kvm.c
@@ -2126,7 +2126,6 @@ static void insert_stsi_15_1_4(const MachineState *ms, void *p)
     sysib->length = len;
 }
 
-#define SCLP_READ_SCP_INFO_MNEST 2
 static void insert_stsi_15_1_x(S390CPU *cpu, int sel2, __u64 addr, uint8_t ar)
 {
     const MachineState *machine = MACHINE(qdev_get_machine());
-- 
2.25.1


