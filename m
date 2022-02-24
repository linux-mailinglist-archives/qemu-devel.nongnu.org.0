Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B42754C3585
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Feb 2022 20:15:36 +0100 (CET)
Received: from localhost ([::1]:43658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nNJaR-0002Bw-MP
	for lists+qemu-devel@lfdr.de; Thu, 24 Feb 2022 14:15:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNJKA-0005jE-E8; Thu, 24 Feb 2022 13:58:46 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15666
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nNJK8-0006Rd-Rq; Thu, 24 Feb 2022 13:58:46 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21OHjhhc015271; 
 Thu, 24 Feb 2022 18:58:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=c06R9rhorprusNcGnTAXki4aKSw3B+gv2z7d7ctL11A=;
 b=kAHO829l+Wtyh9/0gjbw/R+abG/GD8oNIXUXGynZbse+yNPxV4NXW7qKfRgK+CH7m0mu
 pUUCVkkz5MLKi/XNd37VRqM0p5lveGhEQDpipF5vRnQylNR7vLveVIECkYR0hp3crUFV
 fJCdAf/3joKEtxTPadPbCyMgibQpyX3sbFnw6UjIPZWlvXszSILUkvSPdcUACGUQnmoI
 kQ4D9zj4mSI+5sYachPz/QajyT9XOQVMxbRJcjdSowBTQPTcevG+vaZvL7rh19XeH819
 ZjHSy2zY+iKndWwToNwjM5l91qdHm7PkyJFtPJeh36lQTwSAeNbexHDThyyzsIvuFyeA vQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edw51qpy7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:33 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21OIrF0h015429;
 Thu, 24 Feb 2022 18:58:33 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3edw51qpy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:33 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21OIcY4j017180;
 Thu, 24 Feb 2022 18:58:33 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma05wdc.us.ibm.com with ESMTP id 3edr92v7xc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 24 Feb 2022 18:58:32 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21OIwWJk29491538
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 24 Feb 2022 18:58:32 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1C4A0C605F;
 Thu, 24 Feb 2022 18:58:32 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2928EC6057;
 Thu, 24 Feb 2022 18:58:30 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.135.43])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 24 Feb 2022 18:58:29 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 3/4] hw/ppc: Take nested guest into account when saving
 timebase
Date: Thu, 24 Feb 2022 15:58:16 -0300
Message-Id: <20220224185817.2207228-4-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224185817.2207228-1-farosas@linux.ibm.com>
References: <20220224185817.2207228-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: skjoQof9lLVBf7CDYVTp76dVhvVN3rru
X-Proofpoint-ORIG-GUID: 5k4RBRVCMLsGKhwInqWUa3BbSSM6KU0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-02-24_04,2022-02-24_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 mlxscore=0 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0
 impostorscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2201110000 definitions=main-2202240102
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
Cc: aik@ozlabs.ru, danielhb413@gmail.com, npiggin@gmail.com,
 qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When saving the guest "timebase" we look to the first_cpu for its
tb_offset. If that CPU happens to be running a nested guest at this
time, the tb_offset will have the nested guest value.

This was caught by code inspection.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 hw/ppc/ppc.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 9e99625ea9..093cd87014 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -36,6 +36,7 @@
 #include "kvm_ppc.h"
 #include "migration/vmstate.h"
 #include "trace.h"
+#include "hw/ppc/spapr_cpu_core.h"
 
 static void cpu_ppc_tb_stop (CPUPPCState *env);
 static void cpu_ppc_tb_start (CPUPPCState *env);
@@ -961,19 +962,33 @@ static void timebase_save(PPCTimebase *tb)
 {
     uint64_t ticks = cpu_get_host_ticks();
     PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
+    int64_t tb_offset;
 
     if (!first_ppc_cpu->env.tb_env) {
         error_report("No timebase object");
         return;
     }
 
+    tb_offset = first_ppc_cpu->env.tb_env->tb_offset;
+
+    if (first_ppc_cpu->vhyp && vhyp_cpu_in_nested(first_ppc_cpu)) {
+        SpaprCpuState *spapr_cpu = spapr_cpu_state(first_ppc_cpu);
+
+        /*
+         * If the first_cpu happens to be running a nested guest at
+         * this time, tb_env->tb_offset will contain the nested guest
+         * offset.
+         */
+        tb_offset -= spapr_cpu->nested_tb_offset;
+    }
+
     /* not used anymore, we keep it for compatibility */
     tb->time_of_the_day_ns = qemu_clock_get_ns(QEMU_CLOCK_HOST);
     /*
      * tb_offset is only expected to be changed by QEMU so
      * there is no need to update it from KVM here
      */
-    tb->guest_timebase = ticks + first_ppc_cpu->env.tb_env->tb_offset;
+    tb->guest_timebase = ticks + tb_offset;
 
     tb->runstate_paused =
         runstate_check(RUN_STATE_PAUSED) || runstate_check(RUN_STATE_SAVE_VM);
-- 
2.34.1


