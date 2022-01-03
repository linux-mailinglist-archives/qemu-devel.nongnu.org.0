Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 036E24838BA
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 23:13:01 +0100 (CET)
Received: from localhost ([::1]:50424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4VZc-0004to-0c
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 17:13:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VUv-0004Se-Dj; Mon, 03 Jan 2022 17:08:09 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33856
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1n4VUt-00020Y-Nx; Mon, 03 Jan 2022 17:08:09 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 203KMhgj001472; 
 Mon, 3 Jan 2022 22:08:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xlXHKlmG5xosvNy5FUc+eR16VAUX5+iNlAWugVL7RKg=;
 b=lGnyulUJTU/JUR+4KKIfpQtkBKwubmd2FsvyXKfR+AQjS59h8YaS9PGnOd2QV+Ajl0T6
 XtbagP1H5QOY6y/ahgqh/Qc65F/+CUnASL5oGWsEWSBNkIb8D5xSJ/MLICrG82w1pFjW
 KAvsPXcKW7t4GinqDU8/SsZERTkcxJrwff6R4CDm1otYuUSrLrMGtql5lxqPod7ca7dP
 TbE9dUEbxT2Mm/q/1M29ipIvQti60ucho0G2/tjxIeOrfmFFcovcd5BQFxb8uO9nKTnq
 8xL9/anNLiMX7Ehwu3Nolrd/CsGdmLYhz2eAeE/EANawCoAA668ezRn/5+MBUmJEIUoZ VA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dc41bn13v-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:02 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 203M3BQX004037;
 Mon, 3 Jan 2022 22:08:01 GMT
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3dc41bn13m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:01 +0000
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 203LwUIq001137;
 Mon, 3 Jan 2022 22:08:01 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma04dal.us.ibm.com with ESMTP id 3daekar3um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 03 Jan 2022 22:08:01 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 203M7xQ024117712
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 3 Jan 2022 22:08:00 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D5D7F7805C;
 Mon,  3 Jan 2022 22:07:59 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2295378067;
 Mon,  3 Jan 2022 22:07:58 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.145.159])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon,  3 Jan 2022 22:07:57 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/9] target/ppc: powerpc_excp: Group unimplemented exceptions
Date: Mon,  3 Jan 2022 19:07:40 -0300
Message-Id: <20220103220746.3916246-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220103220746.3916246-1-farosas@linux.ibm.com>
References: <20220103220746.3916246-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GbueYg1p6Z62PM2wbT5KAk8vHwR50PWY
X-Proofpoint-ORIG-GUID: tOMCVYUQ_wL5mcjPJ9evkXKYBnN9rV5T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-03_09,2022-01-01_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2201030148
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farosas@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: 0
X-Spam_score: -0.1
X-Spam_bar: /
X-Spam_report: (-0.1 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

(I'll alter this to use powerpc_excp_name once it is merged)

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 target/ppc/excp_helper.c | 76 ++++------------------------------------
 1 file changed, 7 insertions(+), 69 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 4769abfb0c..160e06e3a3 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -628,23 +628,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
@@ -709,19 +692,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
@@ -748,56 +718,24 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp)
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
+        cpu_abort(cs, "Exception not implemented\n");
         break;
     default:
     excp_invalid:
-- 
2.33.1


