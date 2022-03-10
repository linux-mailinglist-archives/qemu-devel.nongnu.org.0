Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D5794D4DA6
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 16:53:45 +0100 (CET)
Received: from localhost ([::1]:50044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSL6m-00051M-7S
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 10:53:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nSL4M-0002LL-Oc; Thu, 10 Mar 2022 10:51:15 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:60190
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nSL4K-0006q4-T3; Thu, 10 Mar 2022 10:51:14 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22AFTxTt017081; 
 Thu, 10 Mar 2022 15:51:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=uBFUU312UyCIEWuVnrWJrovLMk8ykbCCoq/voHmmoo0=;
 b=jeKtcGijEN8rTyYCNQFPp7a2jZSwrDLBPdWbx0F33M3Q28mp+U5ULsnsm3CvwH6TC2a9
 6k4TX6dvLlxx/8aXlAoRAX7dr0SR6U6fb0F8YVaWtWpS1lzn4Zs2fPcVKX8eMXQ04jlv
 ivegpldL2YihfKBgQYb5x4L/A97RIChnlDOnlDKsFIEeyWicqEuBWVYyHuzkoR9YFzxN
 PhjFHR+Ps0vh2Fsobt0NGNUw20bI5RqZ0oyICbM/ReFp4dtmXZOd1pxux+42dnnv0yiA
 RQ+x/2iARri9ycDZT6QKojap7LkpoVZ1nogppJFee1l7I30FOcPsnt6jgGIg0x2ni/QY OA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eqm1agfnn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:07 +0000
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22AFUCbi017991;
 Thu, 10 Mar 2022 15:51:06 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3eqm1agfn6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:06 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22AFeH5G021841;
 Thu, 10 Mar 2022 15:51:04 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma04ams.nl.ibm.com with ESMTP id 3enqgnqnaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 10 Mar 2022 15:51:04 +0000
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22AFp2N816580878
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 10 Mar 2022 15:51:02 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7CC375204F;
 Thu, 10 Mar 2022 15:51:02 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.101.4.17])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 426CE52050;
 Thu, 10 Mar 2022 15:51:02 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 2/3] ppc/pnv: Fixes for user-created pnv-phb5 devices
Date: Thu, 10 Mar 2022 16:51:00 +0100
Message-Id: <20220310155101.294568-3-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220310155101.294568-1-fbarrat@linux.ibm.com>
References: <20220310155101.294568-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: qFm9z31BBvxGTB3J6sxWr60AKuUhUFWC
X-Proofpoint-GUID: D2oGwTBaYqP6rhmwZRPYqPxs6jyg_2x_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-10_03,2022-03-09_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 clxscore=1011 suspectscore=0 impostorscore=0 priorityscore=1501
 adultscore=0 mlxscore=0 bulkscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203100084
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two small fixes to fix user-created devices for POWER10:
- always create the PECs (PCI Express Controller) for the system. The
PECs host the PHBs and we try to find the matching PEC when creating a
PHB, so it must exist. It also matches what we do on POWER9
- the machine class must allow dynamically allocated system bus

Fixes: 623575e16cd5 ("ppc/pnv: Add model for POWER10 PHB5 PCIe Host bridge")
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/ppc/pnv.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/ppc/pnv.c b/hw/ppc/pnv.c
index 0ac86e104f..df58403a3a 100644
--- a/hw/ppc/pnv.c
+++ b/hw/ppc/pnv.c
@@ -1600,9 +1600,7 @@ static void pnv_chip_power10_instance_init(Object *obj)
     object_initialize_child(obj, "occ",  &chip10->occ, TYPE_PNV10_OCC);
     object_initialize_child(obj, "homer", &chip10->homer, TYPE_PNV10_HOMER);
 
-    if (defaults_enabled()) {
-        chip->num_pecs = pcc->num_pecs;
-    }
+    chip->num_pecs = pcc->num_pecs;
 
     for (i = 0; i < chip->num_pecs; i++) {
         object_initialize_child(obj, "pec[*]", &chip10->pecs[i],
@@ -2171,6 +2169,8 @@ static void pnv_machine_power10_class_init(ObjectClass *oc, void *data)
     pmc->dt_power_mgt = pnv_dt_power_mgt;
 
     xfc->match_nvt = pnv10_xive_match_nvt;
+
+    machine_class_allow_dynamic_sysbus_dev(mc, TYPE_PNV_PHB5);
 }
 
 static bool pnv_machine_get_hb(Object *obj, Error **errp)
-- 
2.35.1


