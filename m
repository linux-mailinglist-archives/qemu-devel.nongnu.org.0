Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92F03485A2C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jan 2022 21:43:57 +0100 (CET)
Received: from localhost ([::1]:39062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5D8W-00063q-NR
	for lists+qemu-devel@lfdr.de; Wed, 05 Jan 2022 15:43:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5h-0002l8-Am; Wed, 05 Jan 2022 15:41:01 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:38362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5D5f-00013x-4O; Wed, 05 Jan 2022 15:41:00 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 205ISOLs032208; 
 Wed, 5 Jan 2022 20:40:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=fwJtkuiGhXFwTtg+pLF4ZKoa0tolpVaoyvQ/qrS965w=;
 b=fYa9BPwHjTvTZXytJ40goGKHxjsP34ZculGA3ofL4AUtLHbxNJarnqJBxn6Bq74E9IqJ
 CNGA+Nq6d+6yj+sN5YWm0dzrItgHmguujD4F4/PkMd57wfXmDtRXxK3ygRztrPFkptp/
 BxDL2pqzHonyrqIBetvRbUd++BatgrIwtNIpJoZCdT8/FSRGS2CXhaVhnp7ftte+IOL9
 +aYpUtDQixTRetH+KhJON1ou4SQTE/m/GJBzvbvwrfkw6eg+fdhafnFZQPvzXXM1brfz
 hNaFwMVUcoeJSUqUk2AnRT5ZnEwyKu5cHEQAnt4+fLjDnoVI02EO0aCqFZPZXWidWRX/ Wg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcen8780a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:46 +0000
Received: from m0098421.ppops.net (m0098421.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 205KbtSd022794;
 Wed, 5 Jan 2022 20:40:45 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dcen87804-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:45 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 205KU2T1027036;
 Wed, 5 Jan 2022 20:40:44 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 3daekb5vwr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 05 Jan 2022 20:40:44 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 205KeiVS35127606
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 5 Jan 2022 20:40:44 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EA8D478063;
 Wed,  5 Jan 2022 20:40:43 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34C627805C;
 Wed,  5 Jan 2022 20:40:42 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.200])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  5 Jan 2022 20:40:41 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/7] target/ppc: powerpc_excp: Group unimplemented
 exceptions
Date: Wed,  5 Jan 2022 17:40:25 -0300
Message-Id: <20220105204029.4058500-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220105204029.4058500-1-farosas@linux.ibm.com>
References: <20220105204029.4058500-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: KP_XEY-zep5xICjm5_8maX0JUVugsRLf
X-Proofpoint-GUID: dCLhUR2H5ZAHtGI6-IrCd0_GPqlpRU9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-05_06,2022-01-04_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015
 lowpriorityscore=0 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 mlxlogscore=999 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2201050133
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: richard.henderson@linaro.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Reviewed-by: Cédric Le Goater <clg@kaod.org>
---
 target/ppc/excp_helper.c | 77 +++++-----------------------------------
 1 file changed, 8 insertions(+), 69 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index ce86b2ae37..fa41f8048d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -701,23 +701,6 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_SPEU:   /* SPE/embedded floating-point unavailable/VPU  */
         env->spr[SPR_BOOKE_ESR] = ESR_SPV;
         break;
-    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
-        /* XXX: TODO */
-        cpu_abort(cs, "Embedded floating point data exception "
-                  "is not implemented yet !\n");
-        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
-        break;
-    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
-        /* XXX: TODO */
-        cpu_abort(cs, "Embedded floating point round exception "
-                  "is not implemented yet !\n");
-        env->spr[SPR_BOOKE_ESR] = ESR_SPV;
-        break;
-    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "Performance counter exception is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_DOORI:     /* Embedded doorbell interrupt              */
         break;
     case POWERPC_EXCP_DOORCI:    /* Embedded doorbell critical interrupt     */
@@ -782,19 +765,6 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PIT:       /* Programmable interval timer interrupt    */
         trace_ppc_excp_print("PIT");
         break;
-    case POWERPC_EXCP_IO:        /* IO error exception                       */
-        /* XXX: TODO */
-        cpu_abort(cs, "601 IO error exception is not implemented yet !\n");
-        break;
-    case POWERPC_EXCP_RUNM:      /* Run mode exception                       */
-        /* XXX: TODO */
-        cpu_abort(cs, "601 run mode exception is not implemented yet !\n");
-        break;
-    case POWERPC_EXCP_EMUL:      /* Emulation trap exception                 */
-        /* XXX: TODO */
-        cpu_abort(cs, "602 emulation trap exception "
-                  "is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
@@ -821,56 +791,25 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
             break;
         }
         break;
+    case POWERPC_EXCP_EFPDI:     /* Embedded floating-point data interrupt   */
+    case POWERPC_EXCP_EFPRI:     /* Embedded floating-point round interrupt  */
+    case POWERPC_EXCP_EPERFM:    /* Embedded performance monitor interrupt   */
+    case POWERPC_EXCP_IO:        /* IO error exception                       */
+    case POWERPC_EXCP_RUNM:      /* Run mode exception                       */
+    case POWERPC_EXCP_EMUL:      /* Emulation trap exception                 */
     case POWERPC_EXCP_FPA:       /* Floating-point assist exception          */
-        /* XXX: TODO */
-        cpu_abort(cs, "Floating point assist exception "
-                  "is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_DABR:      /* Data address breakpoint                  */
-        /* XXX: TODO */
-        cpu_abort(cs, "DABR exception is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_IABR:      /* Instruction address breakpoint           */
-        /* XXX: TODO */
-        cpu_abort(cs, "IABR exception is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_SMI:       /* System management interrupt              */
-        /* XXX: TODO */
-        cpu_abort(cs, "SMI exception is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_THERM:     /* Thermal interrupt                        */
-        /* XXX: TODO */
-        cpu_abort(cs, "Thermal management exception "
-                  "is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_PERFM:     /* Embedded performance monitor interrupt   */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "Performance counter exception is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_VPUA:      /* Vector assist exception                  */
-        /* XXX: TODO */
-        cpu_abort(cs, "VPU assist exception is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_SOFTP:     /* Soft patch exception                     */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "970 soft-patch exception is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_MAINT:     /* Maintenance exception                    */
-        /* XXX: TODO */
-        cpu_abort(cs,
-                  "970 maintenance exception is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_MEXTBR:    /* Maskable external breakpoint             */
-        /* XXX: TODO */
-        cpu_abort(cs, "Maskable external exception "
-                  "is not implemented yet !\n");
-        break;
     case POWERPC_EXCP_NMEXTBR:   /* Non maskable external breakpoint         */
-        /* XXX: TODO */
-        cpu_abort(cs, "Non maskable external exception "
-                  "is not implemented yet !\n");
+        cpu_abort(cs, "%s exception not implemented\n",
+                  powerpc_excp_name(excp));
         break;
     default:
     excp_invalid:
-- 
2.33.1


