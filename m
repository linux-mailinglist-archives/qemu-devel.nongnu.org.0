Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E001714067E
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 10:42:31 +0100 (CET)
Received: from localhost ([::1]:54519 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isO98-00018Y-8e
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 04:42:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49675)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1isO6g-0007eK-Rn
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 04:40:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1isO6d-0007WR-82
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 04:39:58 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15412
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ganeshgr@linux.ibm.com>)
 id 1isO6d-0007W6-3x
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 04:39:55 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 00H9b497122214
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 04:39:54 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2xk0qvepgu-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 04:39:54 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <ganeshgr@linux.ibm.com>;
 Fri, 17 Jan 2020 09:39:52 -0000
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Fri, 17 Jan 2020 09:39:49 -0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 00H9dm9750331676
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 17 Jan 2020 09:39:48 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 62E7EAE055;
 Fri, 17 Jan 2020 09:39:48 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CD8C4AE056;
 Fri, 17 Jan 2020 09:39:46 +0000 (GMT)
Received: from localhost.in.ibm.com (unknown [9.124.35.97])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri, 17 Jan 2020 09:39:46 +0000 (GMT)
From: Ganesh Goudar <ganeshgr@linux.ibm.com>
To: aik@ozlabs.ru, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Subject: [PATCH v20 7/7] ppc: spapr: Activate the FWNMI functionality
Date: Fri, 17 Jan 2020 15:08:55 +0530
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20200117093855.19074-1-ganeshgr@linux.ibm.com>
References: <20200117093855.19074-1-ganeshgr@linux.ibm.com>
X-TM-AS-GCONF: 00
x-cbid: 20011709-0016-0000-0000-000002DE3303
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20011709-0017-0000-0000-00003340CE37
Message-Id: <20200117093855.19074-8-ganeshgr@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-01-17_02:2020-01-16,
 2020-01-17 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 phishscore=0 adultscore=0
 mlxlogscore=781 priorityscore=1501 spamscore=0 lowpriorityscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001170074
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: paulus@ozlabs.org, Ganesh Goudar <ganeshgr@linux.ibm.com>,
 Aravinda Prasad <arawinda.p@gmail.com>, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aravinda Prasad <arawinda.p@gmail.com>

This patch sets the default value of SPAPR_CAP_FWNMI_MCE
to SPAPR_CAP_ON for machine type 4.2.

Signed-off-by: Aravinda Prasad <arawinda.p@gmail.com>
Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
---
 hw/ppc/spapr.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c8bc2fa9f3..a81c18b6b6 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4454,7 +4454,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     smc->default_caps.caps[SPAPR_CAP_NESTED_KVM_HV] = SPAPR_CAP_OFF;
     smc->default_caps.caps[SPAPR_CAP_LARGE_DECREMENTER] = SPAPR_CAP_ON;
     smc->default_caps.caps[SPAPR_CAP_CCF_ASSIST] = SPAPR_CAP_OFF;
-    smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] = SPAPR_CAP_OFF;
+    smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] = SPAPR_CAP_ON;
     spapr_caps_add_properties(smc, &error_abort);
     smc->irq = &spapr_irq_dual;
     smc->dr_phb_enabled = true;
@@ -4544,6 +4544,7 @@ static void spapr_machine_4_1_class_options(MachineClass *mc)
     smc->smp_threads_vsmt = false;
     compat_props_add(mc->compat_props, hw_compat_4_1, hw_compat_4_1_len);
     compat_props_add(mc->compat_props, compat, G_N_ELEMENTS(compat));
+    smc->default_caps.caps[SPAPR_CAP_FWNMI_MCE] = SPAPR_CAP_OFF;
 }
 
 DEFINE_SPAPR_MACHINE(4_1, "4.1", false);
-- 
2.17.2


