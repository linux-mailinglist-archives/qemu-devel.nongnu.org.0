Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86EC0197FDB
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Mar 2020 17:39:47 +0200 (CEST)
Received: from localhost ([::1]:51492 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jIwVu-0002Fa-L0
	for lists+qemu-devel@lfdr.de; Mon, 30 Mar 2020 11:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40395)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jIwUo-0001p0-R4
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 11:38:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jIwUn-0006di-Jz
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 11:38:38 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:17752
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jIwUn-0006bN-Fa
 for qemu-devel@nongnu.org; Mon, 30 Mar 2020 11:38:37 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02UFYMOB038588
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 11:38:36 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 301ygv1x0q-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Mon, 30 Mar 2020 11:38:36 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Mon, 30 Mar 2020 16:38:21 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 30 Mar 2020 16:38:19 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02UFbSMm34013636
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 30 Mar 2020 15:37:28 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 580CCA4054;
 Mon, 30 Mar 2020 15:38:31 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 326BFA4068;
 Mon, 30 Mar 2020 15:38:30 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.43.209])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 30 Mar 2020 15:38:29 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] s390x: kvm: Fix number of cpu reports for stsi 3.2.2
Date: Mon, 30 Mar 2020 11:38:28 -0400
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20033015-0020-0000-0000-000003BE572D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20033015-0021-0000-0000-00002216F38D
Message-Id: <20200330153828.8265-1-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-03-30_06:2020-03-30,
 2020-03-30 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 suspectscore=1 clxscore=1015
 priorityscore=1501 impostorscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2003020000 definitions=main-2003300142
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

Unfortuantely KVM doesn't report reserved cpus and doesn't even know
they exist until the are created via the ioctl.

So let's fix up the cpu values after KVM has written its values to the
3.2.2 sysib.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 target/s390x/kvm.c | 18 +++++++++++++++++-
 1 file changed, 17 insertions(+), 1 deletion(-)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index 3630c15f45a48864..a1c4890bdf0c65e4 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -1819,8 +1819,10 @@ static int handle_tsch(S390CPU *cpu)
 
 static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
 {
+    const MachineState *ms = MACHINE(qdev_get_machine());
+    uint16_t total_cpus = 0, conf_cpus = 0, reserved_cpus = 0;
     SysIB_322 sysib;
-    int del;
+    int del, i;
 
     if (s390_is_pv()) {
         s390_cpu_pv_mem_read(cpu, 0, &sysib, sizeof(sysib));
@@ -1842,6 +1844,20 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
         memset(sysib.ext_names[del], 0,
                sizeof(sysib.ext_names[0]) * (sysib.count - del));
     }
+
+    /* count the cpus and split them into configured and reserved ones */
+    for (i = 0; i < ms->possible_cpus->len; i++) {
+        total_cpus++;
+        if (ms->possible_cpus->cpus[i].cpu) {
+            conf_cpus++;
+        } else {
+            reserved_cpus++;
+        }
+    }
+    sysib.vm[0].total_cpus = total_cpus;
+    sysib.vm[0].conf_cpus = conf_cpus;
+    sysib.vm[0].reserved_cpus = reserved_cpus;
+
     /* Insert short machine name in EBCDIC, padded with blanks */
     if (qemu_name) {
         memset(sysib.vm[0].name, 0x40, sizeof(sysib.vm[0].name));
-- 
2.25.1


