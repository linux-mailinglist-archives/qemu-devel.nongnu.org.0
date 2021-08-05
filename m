Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D56CB3E0F4D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 09:34:57 +0200 (CEST)
Received: from localhost ([::1]:60354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBXu4-0003CF-Tp
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 03:34:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1mBXs1-0008AX-VZ; Thu, 05 Aug 2021 03:32:53 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:54204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bharata@linux.ibm.com>)
 id 1mBXrz-0005d2-DQ; Thu, 05 Aug 2021 03:32:49 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 17574CAd109913; Thu, 5 Aug 2021 03:32:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=3r1gFHcs1M8F9m6Y7swZnRinA+fQU7HkwpjzAIcdS10=;
 b=YxgKKTlcFc6HtJFDlKSp2WTmpLKEHXcAccamVyldaHE/4okSzG85JSXhnawNEL4cMttI
 BGlCJ0yomvKlD6ANpKLSPsoR1lQAHJP9Lr4AAa7n7rgPiB1odrCJE8pwgQh4oyP5vId2
 LXz0wM29jO8+qdJTMGfFixYHhWOhutEqmKreBB4xXNbDXROY30fBDU+jiOhqHyWvR/z0
 1vjjePPC9u3NlrkpCuj2Nf/5SfPFWWnET9bI86EAkROHVuYAr4Ot5uyWQmU7XAO6+hEn
 N7NZ6hKdBJPFVPp8Ug5xaelEPp4w2j2vcFjltlJXkYcdjt3gov9b7JLgYTex3MfVDkkr 6w== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3a846b25we-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 03:32:41 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1757RsPe026816;
 Thu, 5 Aug 2021 07:32:39 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma04ams.nl.ibm.com with ESMTP id 3a4x592rpe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Aug 2021 07:32:39 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1757Tdui46989706
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Aug 2021 07:29:39 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5008B52050;
 Thu,  5 Aug 2021 07:32:36 +0000 (GMT)
Received: from bharata.ibmuc.com (unknown [9.102.2.73])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 069435206B;
 Thu,  5 Aug 2021 07:32:34 +0000 (GMT)
From: Bharata B Rao <bharata@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v0 2/2] ppc,spapr: Handle KVM_EXIT_ESN
Date: Thu,  5 Aug 2021 13:02:28 +0530
Message-Id: <20210805073228.502292-3-bharata@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210805073228.502292-1-bharata@linux.ibm.com>
References: <20210805073228.502292-1-bharata@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: _F0OItefTQIUfhJqP1m8pUiVghUcfwn2
X-Proofpoint-GUID: _F0OItefTQIUfhJqP1m8pUiVghUcfwn2
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.790
 definitions=2021-08-05_02:2021-08-04,
 2021-08-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0
 suspectscore=0 priorityscore=1501 bulkscore=0 mlxlogscore=901
 malwarescore=0 adultscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2107140000 definitions=main-2108050041
Received-SPF: pass client-ip=148.163.158.5; envelope-from=bharata@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aneesh.kumar@linux.ibm.com, Bharata B Rao <bharata@linux.ibm.com>,
 qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Handle KVM_EXIT_ESN exit by issuing subvention notification
interrupt to the guest. Guests supporting async-pf feature
will need this interrupt to wake up tasks that are waiting
for the expropriated pages to be available.

Note: Updates to linux-headers/linux/kvm.h are temporary
pending headers update.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
---
 linux-headers/linux/kvm.h |  1 +
 target/ppc/kvm.c          | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

diff --git a/linux-headers/linux/kvm.h b/linux-headers/linux/kvm.h
index a76945fcbc..105c8b069a 100644
--- a/linux-headers/linux/kvm.h
+++ b/linux-headers/linux/kvm.h
@@ -269,6 +269,7 @@ struct kvm_xen_exit {
 #define KVM_EXIT_AP_RESET_HOLD    32
 #define KVM_EXIT_X86_BUS_LOCK     33
 #define KVM_EXIT_XEN              34
+#define KVM_EXIT_ESN              35
 
 /* For KVM_EXIT_INTERNAL_ERROR */
 /* Emulate instruction failed. */
diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index 330985c8a0..6bf3f06b88 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -38,6 +38,7 @@
 #include "hw/ppc/spapr_cpu_core.h"
 #include "hw/hw.h"
 #include "hw/ppc/ppc.h"
+#include "hw/irq.h"
 #include "migration/qemu-file-types.h"
 #include "sysemu/watchdog.h"
 #include "trace.h"
@@ -1657,6 +1658,16 @@ static int kvm_handle_debug(PowerPCCPU *cpu, struct kvm_run *run)
     return DEBUG_RETURN_GUEST;
 }
 
+#if defined(TARGET_PPC64)
+static void kvmppc_handle_esn(PowerPCCPU *cpu)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
+
+    fprintf(stderr, "%s: ESN exit\n", __func__);
+    qemu_irq_pulse(spapr_qirq(spapr, SPAPR_IRQ_SNS));
+}
+#endif
+
 int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -1687,6 +1698,11 @@ int kvm_arch_handle_exit(CPUState *cs, struct kvm_run *run)
                                               run->papr_hcall.args);
         ret = 0;
         break;
+
+    case KVM_EXIT_ESN:
+        kvmppc_handle_esn(cpu);
+        ret = 0;
+        break;
 #endif
     case KVM_EXIT_EPR:
         trace_kvm_handle_epr();
-- 
2.31.1


