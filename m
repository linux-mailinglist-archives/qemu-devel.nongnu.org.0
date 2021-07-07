Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B7C3BE8F9
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 15:45:24 +0200 (CEST)
Received: from localhost ([::1]:37012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m17rf-0002a0-P7
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 09:45:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m17pb-0007H3-CI; Wed, 07 Jul 2021 09:43:15 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:19278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1m17pZ-00064i-IQ; Wed, 07 Jul 2021 09:43:15 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 167DXLrl149449; Wed, 7 Jul 2021 09:43:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=nqcs/NsggCxxFDjE6owXYXZXYVHv5F5+XWeYeJFBfso=;
 b=kTt6tE40AckPUub9TWeS/5X1urLDST3G+UHKB/Sg14k5GiABec/s3eI1esD1C4rP5ZRD
 E+j8hMJB8r96iqkus/HO+y8mlasLzecD4qx2Ao4zNrykOw451tdinoevC/MQdhzkk7tJ
 yO3cCpUwllN01wtO8TfCHspyWKxDvUv+Mi5j2LDSIzCaS5ikr3cRahIHHEbUMCF/hezz
 Ab/EgcLoNQsvispnscmPNH2sfZfZzJT/P93C64XjjXtxX/hAlTcb+4GmoSkLno4gxksS
 shbfVFCVo9q/Y9VFZRbg4k37jzLEQvPsQcnac8gMreuVlDxALOw4oTpAeb6wb1Yj3UFa ug== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m8bn8bbd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 09:43:10 -0400
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 167DZi31159527;
 Wed, 7 Jul 2021 09:43:10 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 39m8bn8bar-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 09:43:10 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 167DXw3D014477;
 Wed, 7 Jul 2021 13:43:09 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03wdc.us.ibm.com with ESMTP id 39jfhc3m1p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 07 Jul 2021 13:43:09 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 167Dh7om31064528
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 7 Jul 2021 13:43:08 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id DBE1628064;
 Wed,  7 Jul 2021 13:43:07 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2ECF02805C;
 Wed,  7 Jul 2021 13:43:07 +0000 (GMT)
Received: from LAPTOP-K4LLPL5U.localdomain (unknown [9.77.134.179])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed,  7 Jul 2021 13:43:07 +0000 (GMT)
From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] linux-user/s390x: signal with SIGFPE on
 compare-and-trap
Date: Wed,  7 Jul 2021 09:42:30 -0400
Message-Id: <20210707134231.1835-2-jonathan.albrecht@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210707134231.1835-1-jonathan.albrecht@linux.vnet.ibm.com>
References: <20210707134231.1835-1-jonathan.albrecht@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Dz4ERQ12hgzdSoPZGScvyMrNmmiWF254
X-Proofpoint-ORIG-GUID: UkTCqfLzxQgQIJIfluJt5TB2q7jiQ18U
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-07-07_06:2021-07-06,
 2021-07-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 phishscore=0 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999 adultscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2107070081
Received-SPF: none client-ip=148.163.156.1;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
 * If DXC matches an IEEE exception, raise SIGFPE with correct si_code
 * Raise SIGFPE with si_code == 0 for everything else

When applied on 20210705210434.45824-2-iii@linux.ibm.com, this fixes
crashes in the java jdk such as the linked bug.

Buglink: https://bugs.launchpad.net/qemu/+bug/1920913
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/319
Signed-off-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
---
 linux-user/s390x/cpu_loop.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 22f2e89c62..6e7dfb290a 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -106,11 +106,13 @@ void cpu_loop(CPUS390XState *env)
 
             case PGM_DATA:
                 n = (env->fpc >> 8) & 0xff;
-                if (n == 0xff) {
-                    /* compare-and-trap */
+                if (n == 0) {
                     goto do_sigill_opn;
-                } else {
-                    /* An IEEE exception, simulated or otherwise.  */
+                }
+
+                sig = TARGET_SIGFPE;
+                if ((n & 0x03) == 0) {
+                    /* An IEEE exception, simulated or otherwise. */
                     if (n & 0x80) {
                         n = TARGET_FPE_FLTINV;
                     } else if (n & 0x40) {
@@ -121,13 +123,12 @@ void cpu_loop(CPUS390XState *env)
                         n = TARGET_FPE_FLTUND;
                     } else if (n & 0x08) {
                         n = TARGET_FPE_FLTRES;
-                    } else {
-                        /* ??? Quantum exception; BFP, DFP error.  */
-                        goto do_sigill_opn;
                     }
-                    sig = TARGET_SIGFPE;
-                    goto do_signal_pc;
+                } else {
+                    /* compare-and-trap */
+                    n = 0;
                 }
+                goto do_signal_pc;
 
             default:
                 fprintf(stderr, "Unhandled program exception: %#x\n", n);
-- 
2.31.1


