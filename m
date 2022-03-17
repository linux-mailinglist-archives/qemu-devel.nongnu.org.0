Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB07D4DCC4E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 18:22:52 +0100 (CET)
Received: from localhost ([::1]:57662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUtpr-0008V0-DH
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 13:22:51 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nUtoI-0006Z6-PS; Thu, 17 Mar 2022 13:21:14 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:15122)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farosas@linux.ibm.com>)
 id 1nUtoG-0004cd-Si; Thu, 17 Mar 2022 13:21:14 -0400
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22HGA7MT026248; 
 Thu, 17 Mar 2022 17:21:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=AJ5tqqZoX4POZ55tIo8USekXUD1H5RJyoGf+CGOvwNM=;
 b=eUEXFCcoEv1hyFRPg9PDIjmhBA+F656nnFDTSC+4UZCQwtDJyNveXvL3EmMeYpq6gPNr
 iKUhx3F2zYl/KvOCRPfDEHxrqepe0nGkRY/CbYC7ijEV4id+DhnlqySZjGyXisuDHqUG
 y4cYXpTDDIPhuunTo/RJYa6LtPZN/5G05nitXQ5K9Vm+aNow1OVf75MIdA5M+trGa6ck
 GRUdgXkUHhiVRHqNchrJTG3zrPvh5CvcYfIQ2zl29Z70Dfh9pT15s5xhSP9qAHmcNSiM
 Qt3ENRL1DtLxnxY+9jfuWc6JpZcO9Yi6EeP2leB1WCAgnB0JkbwFH3ASSNVuePdzQNgW FA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev10j32x1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:05 +0000
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22HGFURw004707;
 Thu, 17 Mar 2022 17:21:04 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ev10j32w1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:04 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22HHJDCQ004541;
 Thu, 17 Mar 2022 17:21:03 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma02wdc.us.ibm.com with ESMTP id 3erk5a4wt6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 17 Mar 2022 17:21:03 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22HHL2Uw16122318
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 17 Mar 2022 17:21:02 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4281EAC05E;
 Thu, 17 Mar 2022 17:21:02 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A3A4FAC059;
 Thu, 17 Mar 2022 17:20:59 +0000 (GMT)
Received: from farosas.linux.ibm.com.com (unknown [9.211.55.207])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 17 Mar 2022 17:20:59 +0000 (GMT)
From: Fabiano Rosas <farosas@linux.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] spapr: Ignore nested KVM hypercalls when not running TCG
Date: Thu, 17 Mar 2022 14:20:47 -0300
Message-Id: <20220317172049.2681740-2-farosas@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220317172049.2681740-1-farosas@linux.ibm.com>
References: <20220317172049.2681740-1-farosas@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: S1H_pd6iLpvJFETb8XY86fc-MtAZfY5R
X-Proofpoint-GUID: rZXk7U3ZGjMyyYaYDf0Mwg3kViZLFuEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-17_07,2022-03-15_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 spamscore=0 clxscore=1015 impostorscore=0 mlxscore=0 suspectscore=0
 mlxlogscore=869 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203170093
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farosas@linux.ibm.com;
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org, npiggin@gmail.com,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It is possible that nested KVM hypercalls reach QEMU while we're
running KVM. The spapr virtual hypervisor implementation of the nested
KVM API only works when the L1 is running under TCG. So return
H_FUNCTION if we are under KVM.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
---
 hw/ppc/spapr_hcall.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f008290787..119baa1d2d 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1508,7 +1508,7 @@ static target_ulong h_set_ptbl(PowerPCCPU *cpu,
 {
     target_ulong ptcr = args[0];
 
-    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV)) {
+    if (!spapr_get_cap(spapr, SPAPR_CAP_NESTED_KVM_HV) || !tcg_enabled()) {
         return H_FUNCTION;
     }
 
@@ -1532,6 +1532,10 @@ static target_ulong h_tlb_invalidate(PowerPCCPU *cpu,
      * across L1<->L2 transitions, so nothing is required here.
      */
 
+    if (!tcg_enabled()) {
+        return H_FUNCTION;
+    }
+
     return H_SUCCESS;
 }
 
@@ -1572,6 +1576,10 @@ static target_ulong h_enter_nested(PowerPCCPU *cpu,
     uint64_t cr;
     int i;
 
+    if (!tcg_enabled()) {
+        return H_FUNCTION;
+    }
+
     if (spapr->nested_ptcr == 0) {
         return H_NOT_AVAILABLE;
     }
-- 
2.34.1


