Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C28A6165E1D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 14:04:47 +0100 (CET)
Received: from localhost ([::1]:41092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4lVW-0001B7-TT
	for lists+qemu-devel@lfdr.de; Thu, 20 Feb 2020 08:04:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54302)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j4lP6-0006dA-AP
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:58:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j4lP5-0006ii-4N
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:58:08 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41770)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j4lP4-0006d1-Ru
 for qemu-devel@nongnu.org; Thu, 20 Feb 2020 07:58:07 -0500
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01KCsJkq066111
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 07:57:56 -0500
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2y8ubg885v-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 20 Feb 2020 07:57:55 -0500
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 20 Feb 2020 12:57:48 -0000
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 20 Feb 2020 12:57:46 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01KCvjEf44236950
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 20 Feb 2020 12:57:45 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88422AE04D;
 Thu, 20 Feb 2020 12:57:45 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 78EDDAE045;
 Thu, 20 Feb 2020 12:57:44 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.145.185.143])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu, 20 Feb 2020 12:57:44 +0000 (GMT)
From: Janosch Frank <frankja@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/16] s390x: protvirt: Move diag 308 data over SIDAD
Date: Thu, 20 Feb 2020 07:56:33 -0500
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200220125638.7241-1-frankja@linux.ibm.com>
References: <20200220125638.7241-1-frankja@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 20022012-4275-0000-0000-000003A3C7A9
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20022012-4276-0000-0000-000038B7D444
Message-Id: <20200220125638.7241-12-frankja@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-20_03:2020-02-19,
 2020-02-20 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 priorityscore=1501 suspectscore=3 mlxscore=0 mlxlogscore=784 bulkscore=0
 malwarescore=0 spamscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2002200097
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.156.1
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
Cc: qemu-s390x@nongnu.org, mihajlov@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For protected guests the IPIB is written/read to/from the satellite
block, so we need those accesses to go through
s390_cpu_pv_mem_read/write().

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
---
 target/s390x/diag.c | 30 +++++++++++++++++++++++-------
 1 file changed, 23 insertions(+), 7 deletions(-)

diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index aedc774695..be80c0367b 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -88,6 +88,7 @@ static int diag308_parm_check(CPUS390XState *env, uint64_t r1, uint64_t addr,
 void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
 {
     CPUState *cs = env_cpu(env);
+    S390CPU *cpu = S390_CPU(cs);
     uint64_t addr =  env->regs[r1];
     uint64_t subcode = env->regs[r3];
     IplParameterBlock *iplb;
@@ -119,13 +120,22 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
             return;
         }
         iplb = g_new0(IplParameterBlock, 1);
-        cpu_physical_memory_read(addr, iplb, sizeof(iplb->len));
+        if (!env->pv) {
+            cpu_physical_memory_read(addr, iplb, sizeof(iplb->len));
+        } else {
+            s390_cpu_pv_mem_read(cpu, 0, iplb, sizeof(iplb->len));
+        }
+
         if (!iplb_valid_len(iplb)) {
             env->regs[r1 + 1] = DIAG_308_RC_INVALID;
             goto out;
         }
 
-        cpu_physical_memory_read(addr, iplb, be32_to_cpu(iplb->len));
+        if (!env->pv) {
+            cpu_physical_memory_read(addr, iplb, be32_to_cpu(iplb->len));
+        } else {
+            s390_cpu_pv_mem_read(cpu, 0, iplb, be32_to_cpu(iplb->len));
+        }
 
         if (!iplb_valid_ccw(iplb) && !iplb_valid_fcp(iplb) &&
             !(iplb_valid_pv(iplb) && s390_ipl_pv_check_components(iplb) >= 0)) {
@@ -137,7 +147,7 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr_t ra)
         env->regs[r1 + 1] = DIAG_308_RC_OK;
 out:
         g_free(iplb);
-        return;
+        break;
     case DIAG308_STORE:
     case DIAG308_PV_STORE:
         if (diag308_parm_check(env, r1, addr, ra, true)) {
@@ -148,12 +158,18 @@ out:
         } else {
             iplb = s390_ipl_get_iplb();
         }
-        if (iplb) {
-            cpu_physical_memory_write(addr, iplb, be32_to_cpu(iplb->len));
-            env->regs[r1 + 1] = DIAG_308_RC_OK;
-        } else {
+        if (!iplb) {
             env->regs[r1 + 1] = DIAG_308_RC_NO_CONF;
+            return;
         }
+
+        if (!env->pv) {
+            cpu_physical_memory_write(addr, iplb, be32_to_cpu(iplb->len));
+        } else {
+            s390_cpu_pv_mem_write(cpu, 0, iplb, be32_to_cpu(iplb->len));
+        }
+
+        env->regs[r1 + 1] = DIAG_308_RC_OK;
         break;
     case DIAG308_PV_START:
         iplb = s390_ipl_get_iplb_secure();
-- 
2.20.1


