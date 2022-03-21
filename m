Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD4DB4E2CD9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:52:26 +0100 (CET)
Received: from localhost ([::1]:40858 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKKX-00034o-SQ
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:52:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nWK2t-0007Wo-MQ; Mon, 21 Mar 2022 11:34:11 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:59018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nWK2r-0006xw-B8; Mon, 21 Mar 2022 11:34:11 -0400
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22LDUBib024805; 
 Mon, 21 Mar 2022 15:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=ch3JUIFaC5U1zGaJfJVww21xjDrf8gh4RT7w5mO1zEc=;
 b=PvkjjNW04mGHL0Ip9gDTdBb0c3NlGehUj70dPzJ1Q9paJBiA7xFlzfhMYeVIqm+t9jBP
 0nejS+wko7YWR2IgoSIOEeTtWnDqSGKw0ycC2wSslWkQrkHl9Yii9rWHtt/sBdj3Arj9
 IqyPGUMu+L5TUh+MQ0fWmbsBv7OTtI4nnckZg6yKpYsoN4zH+HpYcIMvmxl4ID/iLcII
 hH6jLwWp7IRzlWjG5nhQPU6w8ukZ+fUvXqbWyXVp2MsbMJ+NrQ4Ht3+MERKxVxzAqzS0
 J6eAj9fg1/wXCBKZ28CnLsFyX2a+xHfQ8468z+4FhCN/XVuMny2oFNUhxGtCIaUCQwK/ PQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exmwkj919-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 15:34:03 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22LEnc1W009153;
 Mon, 21 Mar 2022 15:34:03 GMT
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3exmwkj906-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 15:34:03 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22LFWrXm015293;
 Mon, 21 Mar 2022 15:34:01 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 3ew6t8knrj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 15:34:00 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 22LFMJcN36110714
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 15:22:19 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 945C111C052;
 Mon, 21 Mar 2022 15:33:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49EFC11C04C;
 Mon, 21 Mar 2022 15:33:58 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.101.4.17])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Mar 2022 15:33:58 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/2] pcie: Don't try triggering a LSI when not defined
Date: Mon, 21 Mar 2022 16:33:56 +0100
Message-Id: <20220321153357.165775-2-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321153357.165775-1-fbarrat@linux.ibm.com>
References: <20220321153357.165775-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: vjjoLgdcqgx7_ZNf2n4G69yxP9Q7uT5L
X-Proofpoint-GUID: B5r8XPJoaMQg_zLUhRSnmLJbx3jCJ42C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_06,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 suspectscore=0 adultscore=0 mlxlogscore=605 spamscore=0 malwarescore=0
 mlxscore=0 clxscore=1015 bulkscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210098
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
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

This patch skips [de]asserting a LSI interrupt if the device doesn't
have any LSI defined. Doing so would trigger an assert in
pci_irq_handler().

The PCIE root port implementation in qemu requests a LSI (INTA), but a
subclass may want to change that behavior since it's a valid
configuration. For example on the POWER8/POWER9/POWER10 systems, the
root bridge doesn't request any LSI.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci/pcie.c     | 8 ++++++--
 hw/pci/pcie_aer.c | 4 +++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 67a5d67372..71c5194b80 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -354,7 +354,9 @@ static void hotplug_event_notify(PCIDevice *dev)
     } else if (msi_enabled(dev)) {
         msi_notify(dev, pcie_cap_flags_get_vector(dev));
     } else {
-        pci_set_irq(dev, dev->exp.hpev_notified);
+        if (pci_intx(dev) != -1) {
+            pci_set_irq(dev, dev->exp.hpev_notified);
+        }
     }
 }
 
@@ -362,7 +364,9 @@ static void hotplug_event_clear(PCIDevice *dev)
 {
     hotplug_event_update_event_status(dev);
     if (!msix_enabled(dev) && !msi_enabled(dev) && !dev->exp.hpev_notified) {
-        pci_irq_deassert(dev);
+        if (pci_intx(dev) != -1) {
+            pci_irq_deassert(dev);
+        }
     }
 }
 
diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index e1a8a88c8c..d936bfca20 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -291,7 +291,9 @@ static void pcie_aer_root_notify(PCIDevice *dev)
     } else if (msi_enabled(dev)) {
         msi_notify(dev, pcie_aer_root_get_vector(dev));
     } else {
-        pci_irq_assert(dev);
+        if (pci_intx(dev) != -1) {
+            pci_irq_assert(dev);
+        }
     }
 }
 
-- 
2.35.1


