Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13BB11994A4
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Mar 2020 13:03:11 +0200 (CEST)
Received: from localhost ([::1]:35974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jJEfm-0005SQ-4h
	for lists+qemu-devel@lfdr.de; Tue, 31 Mar 2020 07:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54298)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jJEek-00050R-65
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 07:02:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jJEej-0007dL-3p
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 07:02:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:50000
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jJEei-0007cb-W1
 for qemu-devel@nongnu.org; Tue, 31 Mar 2020 07:02:05 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02VAis0V017310
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 07:02:02 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3044cg8bvg-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 31 Mar 2020 07:02:02 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Tue, 31 Mar 2020 12:01:23 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 31 Mar 2020 12:01:20 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02VB0So645351220
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 31 Mar 2020 11:00:28 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DD0ECA407B;
 Tue, 31 Mar 2020 11:01:31 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D2E2AA4055;
 Tue, 31 Mar 2020 11:01:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.158.226])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 31 Mar 2020 11:01:30 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] s390x: kvm: Fix number of cpu reports for stsi 3.2.2
Date: Tue, 31 Mar 2020 07:01:23 -0400
X-Mailer: git-send-email 2.25.1
In-Reply-To: <f6b26b2c-23c2-6622-2f58-1e74f335842e@redhat.com>
References: <f6b26b2c-23c2-6622-2f58-1e74f335842e@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20033111-0016-0000-0000-000002FB9792
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033111-0017-0000-0000-0000335F5643
Message-Id: <20200331110123.3774-1-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-31_03:2020-03-30,
 2020-03-31 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 mlxlogscore=999
 malwarescore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003310091
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The cpu number reporting is handled by KVM and QEMU only fills in the
VM name, uuid and other values.

Unfortunately KVM doesn't report reserved cpus and doesn't even know
they exist until the are created via the ioctl.

So let's fix up the cpu values after KVM has written its values to the
3.2.2 sysib. To be consistent We use the same code to retrieve the cpu
numbers as the STSI TCG code in target/s390x/misc_helper.c:HELPER(stsi).

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---

* Fixed commit message and add rev-by
* Calculating total_cpus from configured + reserved

---
 target/s390x/kvm.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 3630c15f45a48864..69881a0da0b31f72 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -1819,8 +1819,10 @@ static int handle_tsch(S390CPU *cpu)
 
 static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
 {
+    const MachineState *ms = MACHINE(qdev_get_machine());
+    uint16_t conf_cpus = 0, reserved_cpus = 0;
     SysIB_322 sysib;
-    int del;
+    int del, i;
 
     if (s390_is_pv()) {
         s390_cpu_pv_mem_read(cpu, 0, &sysib, sizeof(sysib));
@@ -1842,6 +1844,19 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
         memset(sysib.ext_names[del], 0,
                sizeof(sysib.ext_names[0]) * (sysib.count - del));
     }
+
+    /* count the cpus and split them into configured and reserved ones */
+    for (i = 0; i < ms->possible_cpus->len; i++) {
+        if (ms->possible_cpus->cpus[i].cpu) {
+            conf_cpus++;
+        } else {
+            reserved_cpus++;
+        }
+    }
+    sysib.vm[0].total_cpus = conf_cpus + reserved_cpus;
+    sysib.vm[0].conf_cpus = conf_cpus;
+    sysib.vm[0].reserved_cpus = reserved_cpus;
+
     /* Insert short machine name in EBCDIC, padded with blanks */
     if (qemu_name) {
         memset(sysib.vm[0].name, 0x40, sizeof(sysib.vm[0].name));
-- 
2.25.1


