Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C5E43C2750
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 18:08:48 +0200 (CEST)
Received: from localhost ([::1]:46316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1t3X-0005m4-2D
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 12:08:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m1t0H-00088u-SP; Fri, 09 Jul 2021 12:05:26 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62620
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m1t0E-0007Ae-Ag; Fri, 09 Jul 2021 12:05:25 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 169G4adR005667; Fri, 9 Jul 2021 12:05:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=OlKnGTbExyAPlkcdvhEddg5rR0Pgn80tvH0fcNBE6U8=;
 b=tbM65petUavsuogicecBoYmJZl66soKb0tLpWCCHie/PSPn6jjGzzu+tRgmeVY1ET7nC
 4qFfSDvMDdeU+lkqVsYdgTYkCKp8mFqZ6R6VAV+l1TJ96XeqUe2hWPHayWS6g0dmjqwl
 ILD0sQLjnxfNLz70nlDcrqU4dpWi3pJ1OlqZBWg1oQrs3J+XZNIlo2kuaDXJQNF/haCi
 tCQcqC1gjyqUv2igSIw0dEQKMmyZz5p6UKtTLDpZdGuONKbN1285wDBaNzhgQG8Bqtko
 6QeasWt6Vh7oh51d26/h5xH/VU55F41I2HfIi/7dGxIh9ALOficZ71oltGvseI+NUNdx NA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39nwfd9afh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 12:05:20 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 169G59d4007054;
 Fri, 9 Jul 2021 12:05:20 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39nwfd9af4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 12:05:20 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 169FwAqq031942;
 Fri, 9 Jul 2021 16:05:19 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma04dal.us.ibm.com with ESMTP id 39jfhfjvb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 09 Jul 2021 16:05:19 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 169G5IeM14352852
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 9 Jul 2021 16:05:18 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3561428071;
 Fri,  9 Jul 2021 16:05:18 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A66CF2805A;
 Fri,  9 Jul 2021 16:05:17 +0000 (GMT)
Received: from LAPTOP-K4LLPL5U.localdomain (unknown [9.65.254.146])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Fri,  9 Jul 2021 16:05:17 +0000 (GMT)
From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
Date: Fri,  9 Jul 2021 12:04:58 -0400
Message-Id: <20210709160459.4962-2-jonathan.albrecht@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com>
References: <20210709160459.4962-1-jonathan.albrecht@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 3jNlQOHEdywFJ3aG1-BD4gpAZq112Fcy
X-Proofpoint-ORIG-GUID: Uh7JFRyen-iZkM0Fyw6u5oE43_0DVHxR
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-09_09:2021-07-09,
 2021-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 suspectscore=0
 spamscore=0 malwarescore=0 priorityscore=1501 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2107090081
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: ruixin.bao@ibm.com,
 Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>, iii@linux.ibm.com,
 david@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, borntraeger@de.ibm.com, qemu-s390x@nongnu.org,
 krebbel@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Currently when a compare-and-trap instruction is executed, qemu will
always raise a SIGILL signal. On real hardware, a SIGFPE is raised.

Change the PGM_DATA case in cpu_loop to follow the behavior in
linux kernel /arch/s390/kernel/traps.c.
 * Only raise SIGILL if DXC == 0
 * If DXC matches a non-simulated IEEE exception, raise SIGFPE with
   correct si_code
 * Raise SIGFPE with si_code == 0 for everything else

When applied on 20210705210434.45824-2-iii@linux.ibm.com, this fixes
crashes in the java jdk such as the linked bug.

Buglink: https://bugs.launchpad.net/qemu/+bug/1920913
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/319
Signed-off-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
---
 linux-user/s390x/cpu_loop.c | 54 +++++++++++++++++++++++--------------
 1 file changed, 34 insertions(+), 20 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 22f2e89c62..6a69a6dd26 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -25,6 +25,35 @@
 /* s390x masks the fault address it reports in si_addr for SIGSEGV and SIGBUS */
 #define S390X_FAIL_ADDR_MASK -4096LL
 
+static int get_pgm_data_si_code(int dxc_code)
+{
+    switch (dxc_code) {
+    /* Non-simulated IEEE exceptions */
+    case 0x80:
+        return TARGET_FPE_FLTINV;
+    case 0x40:
+        return TARGET_FPE_FLTDIV;
+    case 0x20:
+    case 0x28:
+    case 0x2c:
+        return TARGET_FPE_FLTOVF;
+    case 0x10:
+    case 0x18:
+    case 0x1c:
+        return TARGET_FPE_FLTUND;
+    case 0x08:
+    case 0x0c:
+        return TARGET_FPE_FLTRES;
+    }
+    /*
+     * Non-IEEE and simulated IEEE:
+     * Includes compare-and-trap, quantum exception, etc.
+     * Simulated IEEE are included here to match current
+     * s390x linux kernel.
+     */
+    return 0;
+}
+
 void cpu_loop(CPUS390XState *env)
 {
     CPUState *cs = env_cpu(env);
@@ -106,29 +135,14 @@ void cpu_loop(CPUS390XState *env)
 
             case PGM_DATA:
                 n = (env->fpc >> 8) & 0xff;
-                if (n == 0xff) {
-                    /* compare-and-trap */
+                if (n == 0) {
                     goto do_sigill_opn;
-                } else {
-                    /* An IEEE exception, simulated or otherwise.  */
-                    if (n & 0x80) {
-                        n = TARGET_FPE_FLTINV;
-                    } else if (n & 0x40) {
-                        n = TARGET_FPE_FLTDIV;
-                    } else if (n & 0x20) {
-                        n = TARGET_FPE_FLTOVF;
-                    } else if (n & 0x10) {
-                        n = TARGET_FPE_FLTUND;
-                    } else if (n & 0x08) {
-                        n = TARGET_FPE_FLTRES;
-                    } else {
-                        /* ??? Quantum exception; BFP, DFP error.  */
-                        goto do_sigill_opn;
-                    }
-                    sig = TARGET_SIGFPE;
-                    goto do_signal_pc;
                 }
 
+                sig = TARGET_SIGFPE;
+                n = get_pgm_data_si_code(n);
+                goto do_signal_pc;
+
             default:
                 fprintf(stderr, "Unhandled program exception: %#x\n", n);
                 cpu_dump_state(cs, stderr, 0);
-- 
2.31.1


