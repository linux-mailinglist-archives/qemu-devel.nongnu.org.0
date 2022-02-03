Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D674B4A90D8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 23:49:05 +0100 (CET)
Received: from localhost ([::1]:56392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFkuX-0004Os-0S
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 17:49:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkov-0000tS-7f; Thu, 03 Feb 2022 17:43:17 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:8984
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nFkos-0004Uy-0T; Thu, 03 Feb 2022 17:43:15 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 213MWYAJ008941; 
 Thu, 3 Feb 2022 22:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=K8WSHZmtfbSyzaGDdrpeMvHo/flX9sQD27AsntmbAFg=;
 b=CizYoMKUe6Zk1KzSq6FPPQ7n9OVsnJw5MVUck+sUO/eIJD5zG9jn1K03O0hqHFsj0+fe
 Tp4m1TgkFqJFdLDWcKspBKrc65ouhKGP43yLEFwiVY0GzhiLiqfrc0EAsWe18kYPsxnJ
 ZjRMks1cFdgILd24F5J3oxKvVkycdWr7KtCCtiW+TIQ7gikN5YCAy7LXZyRAnnC2tGwZ
 tNt41b7XKzOjUjNv2EctRzT9ZNTn1WEudhSudHWz0R7s/ijCJCre4bwIE7H6ByeabEd6
 /KM++nebgKtRgDDSDnhqD2om2GDgM6ZXgc7wIsBU5S+mPyZ/RQJYZSq2V3LZOSbue500 7g== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qxfg4e2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:08 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 213Mcssp009085;
 Thu, 3 Feb 2022 22:43:08 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e0qxfg4dx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:08 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 213MgW83011909;
 Thu, 3 Feb 2022 22:43:07 GMT
Received: from b03cxnp08027.gho.boulder.ibm.com
 (b03cxnp08027.gho.boulder.ibm.com [9.17.130.19])
 by ppma02wdc.us.ibm.com with ESMTP id 3e0r0jr2pq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 03 Feb 2022 22:43:07 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 213Mh6Yg14615072
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 3 Feb 2022 22:43:06 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A82CABE056;
 Thu,  3 Feb 2022 22:43:06 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 244D8BE053;
 Thu,  3 Feb 2022 22:43:05 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.67.28])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  3 Feb 2022 22:43:04 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/10] target/ppc: 7xx: System Call exception cleanup
Date: Thu,  3 Feb 2022 19:42:43 -0300
Message-Id: <20220203224246.1446652-8-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203224246.1446652-1-farosas@linux.ibm.com>
References: <20220203224246.1446652-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: MOUqmHdKBIUSZo_y5Hj5KnZn0uY8m3kB
X-Proofpoint-ORIG-GUID: 48rwybK0PUsq8Hon09wGm0aK20auzLQp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-03_07,2022-02-03_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0
 mlxlogscore=894 clxscore=1015 lowpriorityscore=0 adultscore=0 mlxscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202030132
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There is no Hypervisor mode in the 7xx, so no hypercalls.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 21 ++-------------------
 1 file changed, 2 insertions(+), 19 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 8f810f7de5..0bb577b75d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -747,7 +747,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     CPUPPCState *env = &cpu->env;
     int excp_model = env->excp_model;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1, lev = -1;
+    int srr0, srr1;
 
     if (excp <= POWERPC_EXCP_NONE || excp >= POWERPC_EXCP_NB) {
         cpu_abort(cs, "Invalid PowerPC exception %d. Aborting\n", excp);
@@ -860,30 +860,13 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
         }
         break;
     case POWERPC_EXCP_SYSCALL:   /* System call exception                    */
-        lev = env->error_code;
-
-        if ((lev == 1) && cpu->vhyp) {
-            dump_hcall(env);
-        } else {
-            dump_syscall(env);
-        }
+        dump_syscall(env);
 
         /*
          * We need to correct the NIP which in this case is supposed
          * to point to the next instruction
          */
         env->nip += 4;
-
-        /* "PAPR mode" built-in hypercall emulation */
-        if ((lev == 1) && cpu->vhyp) {
-            PPCVirtualHypervisorClass *vhc =
-                PPC_VIRTUAL_HYPERVISOR_GET_CLASS(cpu->vhyp);
-            vhc->hypercall(cpu->vhyp, cpu);
-            return;
-        }
-        if (lev == 1) {
-            new_msr |= (target_ulong)MSR_HVB;
-        }
         break;
     case POWERPC_EXCP_FPU:       /* Floating-point unavailable exception     */
     case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
-- 
2.34.1


