Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 447051819BF
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Mar 2020 14:30:17 +0100 (CET)
Received: from localhost ([::1]:51914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jC1RA-0000kf-8K
	for lists+qemu-devel@lfdr.de; Wed, 11 Mar 2020 09:30:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58394)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jC1Ln-00088g-IE
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 09:24:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jC1Lm-0007H7-Di
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 09:24:43 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19972
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jC1Lm-0007GA-8m
 for qemu-devel@nongnu.org; Wed, 11 Mar 2020 09:24:42 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02BDOFk9010663
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 09:24:41 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yq04bt2mj-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 11 Mar 2020 09:24:35 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 11 Mar 2020 13:22:23 -0000
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Mar 2020 13:22:19 -0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02BDMILA47513702
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2020 13:22:19 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D9CA95204F;
 Wed, 11 Mar 2020 13:22:18 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.36.208])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 962105204E;
 Wed, 11 Mar 2020 13:22:17 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 07/15] s390x: protvirt: Move STSI data over SIDAD
Date: Wed, 11 Mar 2020 09:21:43 -0400
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200311132151.172389-1-frankja@linux.ibm.com>
References: <20200311132151.172389-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031113-0012-0000-0000-0000038F6882
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031113-0013-0000-0000-000021CC3735
Message-Id: <20200311132151.172389-8-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-11_05:2020-03-11,
 2020-03-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 mlxlogscore=999 spamscore=0
 suspectscore=1 priorityscore=1501 adultscore=0 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003110085
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

For protected guests, we need to put the STSI emulation results into
the SIDA, so SIE will write them into the guest at the next entry.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/kvm.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/target/s390x/kvm.c b/target/s390x/kvm.c
index cdcd538b4f7fb318..8085d5030e7c6454 100644
--- a/target/s390x/kvm.c
+++ b/target/s390x/kvm.c
@@ -50,6 +50,7 @@
 #include "exec/memattrs.h"
 #include "hw/s390x/s390-virtio-ccw.h"
 #include "hw/s390x/s390-virtio-hcall.h"
+#include "hw/s390x/pv.h"
 
 #ifndef DEBUG_KVM
 #define DEBUG_KVM  0
@@ -1800,7 +1801,9 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
     SysIB_322 sysib;
     int del;
 
-    if (s390_cpu_virt_mem_read(cpu, addr, ar, &sysib, sizeof(sysib))) {
+    if (s390_is_pv()) {
+        s390_cpu_pv_mem_read(cpu, 0, &sysib, sizeof(sysib));
+    } else if (s390_cpu_virt_mem_read(cpu, addr, ar, &sysib, sizeof(sysib))) {
         return;
     }
     /* Shift the stack of Extended Names to prepare for our own data */
@@ -1840,7 +1843,11 @@ static void insert_stsi_3_2_2(S390CPU *cpu, __u64 addr, uint8_t ar)
     /* Insert UUID */
     memcpy(sysib.vm[0].uuid, &qemu_uuid, sizeof(sysib.vm[0].uuid));
 
-    s390_cpu_virt_mem_write(cpu, addr, ar, &sysib, sizeof(sysib));
+    if (s390_is_pv()) {
+        s390_cpu_pv_mem_write(cpu, 0, &sysib, sizeof(sysib));
+    } else {
+        s390_cpu_virt_mem_write(cpu, addr, ar, &sysib, sizeof(sysib));
+    }
 }
 
 static int handle_stsi(S390CPU *cpu)
-- 
2.25.1


