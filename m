Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A326210FF03
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Dec 2019 14:42:40 +0100 (CET)
Received: from localhost ([::1]:53786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ic8Rr-000414-Ns
	for lists+qemu-devel@lfdr.de; Tue, 03 Dec 2019 08:42:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43488)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1ic8EH-000624-UE
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 08:28:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1ic8EF-0001EC-G7
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 08:28:36 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:65388
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1ic8ED-00018j-1I
 for qemu-devel@nongnu.org; Tue, 03 Dec 2019 08:28:34 -0500
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 xB3DMNaC080812
 for <qemu-devel@nongnu.org>; Tue, 3 Dec 2019 08:28:30 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2wm6rrpcrx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 03 Dec 2019 08:28:30 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Tue, 3 Dec 2019 13:28:28 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 3 Dec 2019 13:28:25 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 xB3DSOZq29556990
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 3 Dec 2019 13:28:24 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4300DA4055;
 Tue,  3 Dec 2019 13:28:24 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 448E5A4057;
 Tue,  3 Dec 2019 13:28:23 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.18.156])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  3 Dec 2019 13:28:23 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] s390x: Fix cpu normal reset ri clearing
Date: Tue,  3 Dec 2019 08:28:12 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191203132813.2734-1-frankja@linux.ibm.com>
References: <20191203132813.2734-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19120313-0008-0000-0000-0000033C5A33
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19120313-0009-0000-0000-00004A5B74FA
Message-Id: <20191203132813.2734-4-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2019-12-03_03:2019-12-02,2019-12-03 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=1 adultscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 mlxlogscore=999
 lowpriorityscore=0 impostorscore=0 phishscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-1912030105
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, mihajlov@linux.ibm.com,
 cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As it turns out we need to clear the ri controls and PSW enablement
bit to be architecture compliant.

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 target/s390x/cpu.c | 7 ++++++-
 target/s390x/cpu.h | 7 ++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 4973365d6c..c282c36b69 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -108,7 +108,7 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
     case S390_CPU_RESET_INITIAL:
         /* initial reset does not clear everything! */
         memset(&env->start_initial_reset_fields, 0,
-               offsetof(CPUS390XState, end_reset_fields) -
+               offsetof(CPUS390XState, start_normal_reset_fields) -
                offsetof(CPUS390XState, start_initial_reset_fields));
 
         /* architectured initial value for Breaking-Event-Address register */
@@ -131,6 +131,11 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
                                   &env->fpu_status);
        /* fall through */
     case S390_CPU_RESET_NORMAL:
+        env->psw.mask &= ~PSW_MASK_RI;
+        memset(&env->start_normal_reset_fields, 0,
+               offsetof(CPUS390XState, end_reset_fields) -
+               offsetof(CPUS390XState, start_normal_reset_fields));
+
         env->pfault_token = -1UL;
         env->bpbc = false;
         break;
diff --git a/target/s390x/cpu.h b/target/s390x/cpu.h
index d5e18b096e..7f5fa1d35b 100644
--- a/target/s390x/cpu.h
+++ b/target/s390x/cpu.h
@@ -58,7 +58,6 @@ struct CPUS390XState {
      */
     uint64_t vregs[32][2] QEMU_ALIGNED(16);  /* vector registers */
     uint32_t aregs[16];    /* access registers */
-    uint8_t riccb[64];     /* runtime instrumentation control */
     uint64_t gscb[4];      /* guarded storage control */
     uint64_t etoken;       /* etoken */
     uint64_t etoken_extension; /* etoken extension */
@@ -114,6 +113,10 @@ struct CPUS390XState {
     uint64_t gbea;
     uint64_t pp;
 
+    /* Fields up to this point are not cleared by normal CPU reset */
+    struct {} start_normal_reset_fields;
+    uint8_t riccb[64];     /* runtime instrumentation control */
+
     /* Fields up to this point are cleared by a CPU reset */
     struct {} end_reset_fields;
 
@@ -252,6 +255,7 @@ extern const VMStateDescription vmstate_s390_cpu;
 #undef PSW_SHIFT_ASC
 #undef PSW_MASK_CC
 #undef PSW_MASK_PM
+#undef PSW_MASK_RI
 #undef PSW_SHIFT_MASK_PM
 #undef PSW_MASK_64
 #undef PSW_MASK_32
@@ -274,6 +278,7 @@ extern const VMStateDescription vmstate_s390_cpu;
 #define PSW_MASK_CC             0x0000300000000000ULL
 #define PSW_MASK_PM             0x00000F0000000000ULL
 #define PSW_SHIFT_MASK_PM       40
+#define PSW_MASK_RI             0x0000008000000000ULL
 #define PSW_MASK_64             0x0000000100000000ULL
 #define PSW_MASK_32             0x0000000080000000ULL
 #define PSW_MASK_ESA_ADDR       0x000000007fffffffULL
-- 
2.20.1


