Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9500E487EED
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jan 2022 23:30:51 +0100 (CET)
Received: from localhost ([::1]:58620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n5xl4-0005Yb-E0
	for lists+qemu-devel@lfdr.de; Fri, 07 Jan 2022 17:30:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49828)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xgu-0002XA-9h; Fri, 07 Jan 2022 17:26:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:18176
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n5xgr-0006hF-Fd; Fri, 07 Jan 2022 17:26:31 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 207JbUb7029596; 
 Fri, 7 Jan 2022 22:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=pp1;
 bh=kMglLtl49hDotSN4jXFCr5n3/sRDxQKmMnpZ6LX8W50=;
 b=MwhIj36pwSwZMZEhJp2Yxyk0Qk39KG8w0vQb3prpovfosI+eUBCqKyL4vTKUsW6NEuFI
 lhjgGe5LVccSc7IcCbqNNYX5W7ytIL4qcsO5eE+umHzqIP6AX4JZFNRaedZxZGrnhHHx
 PVqS1/ZYz7Qj1iW3V5NG9F62jQjhuq0qvlLGR9D6VrSEaRzh7sMg8HVUg0db0K1fB6L+
 orKbdB9Jvxkr16+sis9PGRrkZPHjKRfPUuIw0ePdHawX4xOlFBuZNeeN+8Q5lgipvwUZ
 FAI02OF6M1tnCqOYc/UwyLQVs6akn8MGzRjdKY7hJacrICo7BLM1Eech/R/m0voPEgUB bw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3depqvrxys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:18 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 207MKJxi031111;
 Fri, 7 Jan 2022 22:26:18 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3depqvrxyk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:18 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 207MIFlC010136;
 Fri, 7 Jan 2022 22:26:17 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma01dal.us.ibm.com with ESMTP id 3de5fqdyd3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 07 Jan 2022 22:26:17 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 207MQFmq27066748
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 7 Jan 2022 22:26:15 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 83392BE063;
 Fri,  7 Jan 2022 22:26:15 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CB6D2BE05B;
 Fri,  7 Jan 2022 22:26:13 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.59.174])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  7 Jan 2022 22:26:13 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/8] target/ppc: powerpc_excp: Group unimplemented
 exceptions
Date: Fri,  7 Jan 2022 19:25:56 -0300
Message-Id: <20220107222601.4101511-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220107222601.4101511-1-farosas@linux.ibm.com>
References: <20220107222601.4101511-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jThrWLeVEPoNWu-SA6IxV0TQ7qTo6l2s
X-Proofpoint-GUID: wwgdih_SafBmbleD5BAAMvX-6PzVBF8d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-07_10,2022-01-07_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxlogscore=999 clxscore=1015 malwarescore=0 suspectscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201070130
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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
Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/excp_helper.c | 77 +++++-----------------------------------
 1 file changed, 8 insertions(+), 69 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a12ed14c30..a52340ac0a 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -700,23 +700,6 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
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
@@ -781,19 +764,6 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
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
@@ -820,56 +790,25 @@ static void powerpc_excp(PowerPCCPU *cpu, int excp)
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


