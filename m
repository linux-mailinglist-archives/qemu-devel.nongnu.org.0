Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B67E7189E14
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Mar 2020 15:41:33 +0100 (CET)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEZsy-0000jE-Pp
	for lists+qemu-devel@lfdr.de; Wed, 18 Mar 2020 10:41:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58838)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1jEZjS-00037R-F5
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 10:31:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1jEZjQ-0002Dr-SU
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 10:31:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:53150
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1jEZjQ-0001qw-MY
 for qemu-devel@nongnu.org; Wed, 18 Mar 2020 10:31:40 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02IE42Y4007230
 for <qemu-devel@nongnu.org>; Wed, 18 Mar 2020 10:31:30 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu7frvv1g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 18 Mar 2020 10:31:29 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 18 Mar 2020 14:31:28 -0000
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 18 Mar 2020 14:31:25 -0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 02IEVOI535586346
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2020 14:31:24 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A7A7E4203F;
 Wed, 18 Mar 2020 14:31:24 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8B1D942047;
 Wed, 18 Mar 2020 14:31:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.78.199])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 18 Mar 2020 14:31:23 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 13/16] s390x: protvirt: Move IO control structures over
 SIDA
Date: Wed, 18 Mar 2020 10:30:44 -0400
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200318143047.2335-1-frankja@linux.ibm.com>
References: <20200318143047.2335-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20031814-0020-0000-0000-000003B68A0A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20031814-0021-0000-0000-0000220EF3F4
Message-Id: <20200318143047.2335-14-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_06:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 mlxlogscore=833 suspectscore=1 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003180066
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

For protected guests, we need to put the IO emulation results into the
SIDA, so SIE will write them into the guest at the next entry.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/ioinst.c | 61 +++++++++++++++++++++++++++++++------------
 1 file changed, 45 insertions(+), 16 deletions(-)

diff --git a/target/s390x/ioinst.c b/target/s390x/ioinst.c
index 8828482eec306a2b..7a14c52c123b842b 100644
--- a/target/s390x/ioinst.c
+++ b/target/s390x/ioinst.c
@@ -138,7 +138,9 @@ void ioinst_handle_msch(S390CPU *cpu, uint64_t reg1, uint32_t ipb, uintptr_t ra)
         s390_program_interrupt(env, PGM_SPECIFICATION, ra);
         return;
     }
-    if (s390_cpu_virt_mem_read(cpu, addr, ar, &schib, sizeof(schib))) {
+    if (s390_is_pv()) {
+        s390_cpu_pv_mem_read(cpu, addr, &schib, sizeof(schib));
+    } else if (s390_cpu_virt_mem_read(cpu, addr, ar, &schib, sizeof(schib))) {
         s390_cpu_virt_mem_handle_exc(cpu, ra);
         return;
     }
@@ -195,7 +197,9 @@ void ioinst_handle_ssch(S390CPU *cpu, uint64_t reg1, uint32_t ipb, uintptr_t ra)
         s390_program_interrupt(env, PGM_SPECIFICATION, ra);
         return;
     }
-    if (s390_cpu_virt_mem_read(cpu, addr, ar, &orig_orb, sizeof(orb))) {
+    if (s390_is_pv()) {
+        s390_cpu_pv_mem_read(cpu, addr, &orig_orb, sizeof(orb));
+    } else if (s390_cpu_virt_mem_read(cpu, addr, ar, &orig_orb, sizeof(orb))) {
         s390_cpu_virt_mem_handle_exc(cpu, ra);
         return;
     }
@@ -231,14 +235,19 @@ void ioinst_handle_stcrw(S390CPU *cpu, uint32_t ipb, uintptr_t ra)
     cc = css_do_stcrw(&crw);
     /* 0 - crw stored, 1 - zeroes stored */
 
-    if (s390_cpu_virt_mem_write(cpu, addr, ar, &crw, sizeof(crw)) == 0) {
+    if (s390_is_pv()) {
+        s390_cpu_pv_mem_write(cpu, addr, &crw, sizeof(crw));
         setcc(cpu, cc);
     } else {
-        if (cc == 0) {
-            /* Write failed: requeue CRW since STCRW is suppressing */
-            css_undo_stcrw(&crw);
+        if (s390_cpu_virt_mem_write(cpu, addr, ar, &crw, sizeof(crw)) == 0) {
+            setcc(cpu, cc);
+        } else {
+            if (cc == 0) {
+                /* Write failed: requeue CRW since STCRW is suppressing */
+                css_undo_stcrw(&crw);
+            }
+            s390_cpu_virt_mem_handle_exc(cpu, ra);
         }
-        s390_cpu_virt_mem_handle_exc(cpu, ra);
     }
 }
 
@@ -260,6 +269,13 @@ void ioinst_handle_stsch(S390CPU *cpu, uint64_t reg1, uint32_t ipb,
     }
 
     if (ioinst_disassemble_sch_ident(reg1, &m, &cssid, &ssid, &schid)) {
+        /*
+         * The Ultravisor checks schid bit 16 to be one and bits 0-12
+         * to be 0 and injects a operand exception itself.
+         *
+         * Hence we should never end up here.
+         */
+        g_assert(!s390_is_pv());
         /*
          * As operand exceptions have a lower priority than access exceptions,
          * we check whether the memory area is writeable (injecting the
@@ -292,14 +308,17 @@ void ioinst_handle_stsch(S390CPU *cpu, uint64_t reg1, uint32_t ipb,
         }
     }
     if (cc != 3) {
-        if (s390_cpu_virt_mem_write(cpu, addr, ar, &schib,
-                                    sizeof(schib)) != 0) {
+        if (s390_is_pv()) {
+            s390_cpu_pv_mem_write(cpu, addr, &schib, sizeof(schib));
+        } else if (s390_cpu_virt_mem_write(cpu, addr, ar, &schib,
+                                           sizeof(schib)) != 0) {
             s390_cpu_virt_mem_handle_exc(cpu, ra);
             return;
         }
     } else {
         /* Access exceptions have a higher priority than cc3 */
-        if (s390_cpu_virt_mem_check_write(cpu, addr, ar, sizeof(schib)) != 0) {
+        if (!s390_is_pv() &&
+            s390_cpu_virt_mem_check_write(cpu, addr, ar, sizeof(schib)) != 0) {
             s390_cpu_virt_mem_handle_exc(cpu, ra);
             return;
         }
@@ -336,7 +355,9 @@ int ioinst_handle_tsch(S390CPU *cpu, uint64_t reg1, uint32_t ipb, uintptr_t ra)
     }
     /* 0 - status pending, 1 - not status pending, 3 - not operational */
     if (cc != 3) {
-        if (s390_cpu_virt_mem_write(cpu, addr, ar, &irb, irb_len) != 0) {
+        if (s390_is_pv()) {
+            s390_cpu_pv_mem_write(cpu, addr, &irb, irb_len);
+        } else if (s390_cpu_virt_mem_write(cpu, addr, ar, &irb, irb_len) != 0) {
             s390_cpu_virt_mem_handle_exc(cpu, ra);
             return -EFAULT;
         }
@@ -344,7 +365,8 @@ int ioinst_handle_tsch(S390CPU *cpu, uint64_t reg1, uint32_t ipb, uintptr_t ra)
     } else {
         irb_len = sizeof(irb) - sizeof(irb.emw);
         /* Access exceptions have a higher priority than cc3 */
-        if (s390_cpu_virt_mem_check_write(cpu, addr, ar, irb_len) != 0) {
+        if (!s390_is_pv() &&
+            s390_cpu_virt_mem_check_write(cpu, addr, ar, irb_len) != 0) {
             s390_cpu_virt_mem_handle_exc(cpu, ra);
             return -EFAULT;
         }
@@ -642,7 +664,9 @@ void ioinst_handle_chsc(S390CPU *cpu, uint32_t ipb, uintptr_t ra)
      * present CHSC sub-handlers ... if we ever need more, we should take
      * care of req->len here first.
      */
-    if (s390_cpu_virt_mem_read(cpu, addr, reg, buf, sizeof(ChscReq))) {
+    if (s390_is_pv()) {
+        s390_cpu_pv_mem_read(cpu, addr, buf, sizeof(ChscReq));
+    } else if (s390_cpu_virt_mem_read(cpu, addr, reg, buf, sizeof(ChscReq))) {
         s390_cpu_virt_mem_handle_exc(cpu, ra);
         return;
     }
@@ -675,11 +699,16 @@ void ioinst_handle_chsc(S390CPU *cpu, uint32_t ipb, uintptr_t ra)
         break;
     }
 
-    if (!s390_cpu_virt_mem_write(cpu, addr + len, reg, res,
-                                 be16_to_cpu(res->len))) {
+    if (s390_is_pv()) {
+        s390_cpu_pv_mem_write(cpu, addr + len, res, be16_to_cpu(res->len));
         setcc(cpu, 0);    /* Command execution complete */
     } else {
-        s390_cpu_virt_mem_handle_exc(cpu, ra);
+        if (!s390_cpu_virt_mem_write(cpu, addr + len, reg, res,
+                                     be16_to_cpu(res->len))) {
+            setcc(cpu, 0);    /* Command execution complete */
+        } else {
+            s390_cpu_virt_mem_handle_exc(cpu, ra);
+        }
     }
 }
 
-- 
2.25.1


