Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93D1810B523
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Nov 2019 19:06:57 +0100 (CET)
Received: from localhost ([::1]:41260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ia1iK-0002vW-43
	for lists+qemu-devel@lfdr.de; Wed, 27 Nov 2019 13:06:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47048)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1ia1TA-00089U-33
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:51:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1ia1T8-0003Pf-1n
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:51:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:63942
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1ia1T6-0003Nv-1S
 for qemu-devel@nongnu.org; Wed, 27 Nov 2019 12:51:12 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xARHkW3u068028
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 12:51:11 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2whcy82ha9-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Wed, 27 Nov 2019 12:51:10 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Wed, 27 Nov 2019 17:51:09 -0000
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 27 Nov 2019 17:51:06 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xARHp4rE17367212
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Nov 2019 17:51:04 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B1D87A4053;
 Wed, 27 Nov 2019 17:51:04 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 21FACA406D;
 Wed, 27 Nov 2019 17:51:02 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.82.185])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 27 Nov 2019 17:51:01 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 5/6] s390x: Beautify diag308 handling
Date: Wed, 27 Nov 2019 12:50:45 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191127175046.4911-1-frankja@linux.ibm.com>
References: <20191127175046.4911-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19112717-0016-0000-0000-000002CD1056
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19112717-0017-0000-0000-0000332EF1A3
Message-Id: <20191127175046.4911-6-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-11-27_04:2019-11-27,2019-11-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 spamscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 adultscore=0
 priorityscore=1501 phishscore=0 suspectscore=3 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1911270145
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
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
Cc: thuth@redhat.com, pmorel@linux.ibm.com, david@redhat.com, cohuck@redhat.com,
 borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let's improve readability by:
* Using constants for the subcodes
* Moving parameter checking into a function
* Removing subcode > 6 check as the default case catches that

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
---
 target/s390x/diag.c | 54 +++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 53c2f81f2a..b5aec06d6b 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -53,6 +53,29 @@ int handle_diag_288(CPUS390XState *env, uint64_t r1, uint64_t r3)
 #define DIAG_308_RC_NO_CONF         0x0102
 #define DIAG_308_RC_INVALID         0x0402
 
+#define DIAG308_RESET_MOD_CLR       0
+#define DIAG308_RESET_LOAD_NORM     1
+#define DIAG308_LOAD_CLEAR          3
+#define DIAG308_LOAD_NORMAL_DUMP    4
+#define DIAG308_SET                 5
+#define DIAG308_STORE               6
+
+static int diag308_parm_check(CPUS390XState *env, uint64_t r1, uint64_t addr,
+                              uintptr_t ra, bool write)
+{
+    if ((r1 & 1) || (addr & ~TARGET_PAGE_MASK)) {
+        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+        return -1;
+    }
+    if (!address_space_access_valid(&address_space_memory, addr,
+                                    sizeof(IplParameterBlock), write,
+                                    MEMTXATTRS_UNSPECIFIED)) {
+        s390_program_interrupt(env, PGM_ADDRESSING, ra);
+        return -1;
+    }
+    return 0;
+}
+
 void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
@@ -65,30 +88,24 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
         return;
     }
 
-    if ((subcode & ~0x0ffffULL) || (subcode > 6)) {
+    if (subcode & ~0x0ffffULL) {
         s390_program_interrupt(env, PGM_SPECIFICATION, ra);
         return;
     }
 
     switch (subcode) {
-    case 0:
+    case DIAG308_RESET_MOD_CLR:
         s390_ipl_reset_request(cs, S390_RESET_MODIFIED_CLEAR);
         break;
-    case 1:
+    case DIAG308_RESET_LOAD_NORM:
         s390_ipl_reset_request(cs, S390_RESET_LOAD_NORMAL);
         break;
-    case 3:
+    case DIAG308_LOAD_CLEAR:
+        /* Well we still lack the clearing bit... */
         s390_ipl_reset_request(cs, S390_RESET_REIPL);
         break;
-    case 5:
-        if ((r1 & 1) || (addr & 0x0fffULL)) {
-            s390_program_interrupt(env, PGM_SPECIFICATION, ra);
-            return;
-        }
-        if (!address_space_access_valid(&address_space_memory, addr,
-                                        sizeof(IplParameterBlock), false,
-                                        MEMTXATTRS_UNSPECIFIED)) {
-            s390_program_interrupt(env, PGM_ADDRESSING, ra);
+    case DIAG308_SET:
+        if (diag308_parm_check(env, r1, addr, ra, false)) {
             return;
         }
         iplb = g_new0(IplParameterBlock, 1);
@@ -110,15 +127,8 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
 out:
         g_free(iplb);
         return;
-    case 6:
-        if ((r1 & 1) || (addr & 0x0fffULL)) {
-            s390_program_interrupt(env, PGM_SPECIFICATION, ra);
-            return;
-        }
-        if (!address_space_access_valid(&address_space_memory, addr,
-                                        sizeof(IplParameterBlock), true,
-                                        MEMTXATTRS_UNSPECIFIED)) {
-            s390_program_interrupt(env, PGM_ADDRESSING, ra);
+    case DIAG308_STORE:
+        if (diag308_parm_check(env, r1, addr, ra, true)) {
             return;
         }
         iplb = s390_ipl_get_iplb();
-- 
2.20.1


