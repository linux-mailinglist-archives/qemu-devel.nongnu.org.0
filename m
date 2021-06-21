Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B3D43AEB10
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:20:45 +0200 (CEST)
Received: from localhost ([::1]:57392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvKn6-00044K-8M
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1lvKhl-0006ir-BZ; Mon, 21 Jun 2021 10:15:13 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47304
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.albrecht@linux.vnet.ibm.com>)
 id 1lvKhj-00040Z-99; Mon, 21 Jun 2021 10:15:13 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 15LE3E9G100913; Mon, 21 Jun 2021 10:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=rFs04Pn/YReTGg3WTivx9G/avIjX6Mqrdm3F9G///pU=;
 b=RJlUru2Jw/lhofOQJVWMIAr2BOPyGVbxii/sZN7wJY7QRKrDG0qEVEnUlJWqPGDBkPpr
 +6+ihq47jf7YTk28nrdiKO6psCy7KcSbQ/hKX9HS0Srox2jsS9NNQ3gXv7d+QKZYnTKc
 q5MDG39EOgeZOmTLte30R6Ozgd6BLdHSWNiDtr+d+f7zmJEY8MPiAMp6dZWiQfc26Ypo
 PM85wYxNYQ0OTTWQqjDR6m6i+se5ylK2achgktIOYhX4RaXW0hNV8MAMdVmPzGIfDT1h
 5fIjYuEFBTD9+g3e+0vixKG1Eeyl44/JzJNuB5HlVTtdZ0l6XN7WR81LbA5TQO1RK1RH JQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39av0urvgt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 10:15:09 -0400
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 15LE3Cbb100535;
 Mon, 21 Jun 2021 10:15:09 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 39av0urvgd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 10:15:09 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 15LEBqHZ001120;
 Mon, 21 Jun 2021 14:15:08 GMT
Received: from b01cxnp22036.gho.pok.ibm.com (b01cxnp22036.gho.pok.ibm.com
 [9.57.198.26]) by ppma01wdc.us.ibm.com with ESMTP id 399878fr05-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Jun 2021 14:15:08 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22036.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 15LEF8Ca15401234
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Jun 2021 14:15:08 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D773112066;
 Mon, 21 Jun 2021 14:15:08 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 673FC112069;
 Mon, 21 Jun 2021 14:15:07 +0000 (GMT)
Received: from LAPTOP-K4LLPL5U.localdomain (unknown [9.65.229.155])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 21 Jun 2021 14:15:07 +0000 (GMT)
From: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] linux-user/s390x: signal with SIGFPE on compare-and-trap
Date: Mon, 21 Jun 2021 10:14:51 -0400
Message-Id: <20210621141452.2045-2-jonathan.albrecht@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>
References: <20210621141452.2045-1-jonathan.albrecht@linux.vnet.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: EYg3BEaC3GfCGbrDVDhroomOUy6W0_Kz
X-Proofpoint-ORIG-GUID: fzxWc5BnyoYtbfLeUZMvAWRA4-xe3sY5
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-06-21_06:2021-06-21,
 2021-06-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 adultscore=0 mlxlogscore=999 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106210084
Received-SPF: none client-ip=148.163.158.5;
 envelope-from=jonathan.albrecht@linux.vnet.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>, iii@linux.ibm.com,
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

When applied on 20210602002210.3144559-2-iii@linux.ibm.com, this fixes
crashes in the java jdk such as the linked bug.

Buglink: https://bugs.launchpad.net/qemu/+bug/1920913
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/319
Signed-off-by: Jonathan Albrecht <jonathan.albrecht@linux.vnet.ibm.com>
---
 linux-user/s390x/cpu_loop.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/linux-user/s390x/cpu_loop.c b/linux-user/s390x/cpu_loop.c
index 72ba9170ed..def5c046f7 100644
--- a/linux-user/s390x/cpu_loop.c
+++ b/linux-user/s390x/cpu_loop.c
@@ -117,11 +117,13 @@ void cpu_loop(CPUS390XState *env)
 
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
@@ -132,13 +134,12 @@ void cpu_loop(CPUS390XState *env)
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


