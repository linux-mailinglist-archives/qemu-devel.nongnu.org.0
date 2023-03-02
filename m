Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D03A86A8712
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:43:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlvx-0006eh-Cw; Thu, 02 Mar 2023 11:37:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pXlvs-0006MA-Oq; Thu, 02 Mar 2023 11:37:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1pXlvq-0000g1-Rx; Thu, 02 Mar 2023 11:37:28 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 322GVWjm018024; Thu, 2 Mar 2023 16:37:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=CdYuQ8h4T6zIhbp5VPhp7GcSaH32zpaUltZ7wXoX93k=;
 b=O3Kd68rVJrDFbgZlvcZ08IcSxozPTLAWr3Aa+FH0RQsaAnnenx1lfND30wPALZ7V6uxE
 7/fL7edOwZgaxMStnL1eN1DM6RRbQrN6OXoUojiltMd2eSObMJ5EB0bjkwo1MM94QID8
 TEzQ4FDrIC+dCzJphYbTXGVOg5l1eSkvCgv9MwY5rnpe+rxFNEyOzSbXTPZDoCV7CXFn
 y3jNHsYqwxBVGh9sbWHdbo84tGNOpGPS3EvqUdItF5F4yM43QSO2plk0f1u8ZPxm3hyr
 73b1Ko4l4CLwinmAz0ANppN0ZSiMrQDyvBb0wiL2JMXHOu1s/p8WUThZObTTSRRS83gK tw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2xw1sdym-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:22 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 322GWsjE032043;
 Thu, 2 Mar 2023 16:37:21 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3p2xw1sdxb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:21 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 321NG5CQ015479;
 Thu, 2 Mar 2023 16:37:19 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma06fra.de.ibm.com (PPS) with ESMTPS id 3nybdbmfq2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Mar 2023 16:37:19 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com
 [10.20.54.101])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 322GbHVG63701456
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Mar 2023 16:37:17 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F396820043;
 Thu,  2 Mar 2023 16:37:16 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9AABC20040;
 Thu,  2 Mar 2023 16:37:16 +0000 (GMT)
Received: from borneo.ibmuc.com (unknown [9.171.65.81])
 by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Thu,  2 Mar 2023 16:37:16 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH 2/4] pnv_phb4_pec: Only export existing PHBs to the device tree
Date: Thu,  2 Mar 2023 17:37:13 +0100
Message-Id: <20230302163715.129635-3-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230302163715.129635-1-fbarrat@linux.ibm.com>
References: <20230302163715.129635-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: fuZ-0Q6r-8tqPn1DYeuFa0dlJOs_3d3x
X-Proofpoint-ORIG-GUID: 1Z2kjGYw6RtbfoDlBy1WnIXMsoQLg0C7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-02_09,2023-03-02_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 phishscore=0
 clxscore=1015 adultscore=0 priorityscore=1501 lowpriorityscore=0
 mlxscore=0 impostorscore=0 spamscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303020139
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

So far, we were always exporting all possible PHBs to the device
tree. It works well when using the default config but it potentially
adds non-existing devices when using '-nodefaults' and user-created
PHBs, causing the firmware (skiboot) to report errors when probing
those PHBs. This patch only exports PHBs which have been realized to
the device tree.

Fixes: d786be3fe746 ("ppc/pnv: enable user created pnv-phb for powernv9")
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci-host/pnv_phb4_pec.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/pnv_phb4_pec.c b/hw/pci-host/pnv_phb4_pec.c
index 97c06bb0a0..6c9b386069 100644
--- a/hw/pci-host/pnv_phb4_pec.c
+++ b/hw/pci-host/pnv_phb4_pec.c
@@ -199,9 +199,12 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
                       pecc->compat_size)));
 
     for (i = 0; i < pec->num_phbs; i++) {
-        int phb_id = pnv_phb4_pec_get_phb_id(pec, i);
         int stk_offset;
 
+        if (!pec->phbs[i]) {
+            continue;
+        }
+
         name = g_strdup_printf("stack@%x", i);
         stk_offset = fdt_add_subnode(fdt, offset, name);
         _FDT(stk_offset);
@@ -209,7 +212,8 @@ static int pnv_pec_dt_xscom(PnvXScomInterface *dev, void *fdt,
         _FDT((fdt_setprop(fdt, stk_offset, "compatible", pecc->stk_compat,
                           pecc->stk_compat_size)));
         _FDT((fdt_setprop_cell(fdt, stk_offset, "reg", i)));
-        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index", phb_id)));
+        _FDT((fdt_setprop_cell(fdt, stk_offset, "ibm,phb-index",
+                               pec->phbs[i]->phb_id)));
     }
 
     return 0;
-- 
2.39.2


