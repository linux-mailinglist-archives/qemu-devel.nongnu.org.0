Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF89453846
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:07:48 +0100 (CET)
Received: from localhost ([::1]:38928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1vv-0003Bo-HB
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:07:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mn1q9-0002Pq-QV; Tue, 16 Nov 2021 12:01:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46742
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mn1q5-00018e-Mg; Tue, 16 Nov 2021 12:01:49 -0500
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AGGHhRV011251; 
 Tue, 16 Nov 2021 17:01:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QS2k3Wv8Aw71MIEWq6KRvGeTCGVQ6z8Y/5vYgqNoq/Y=;
 b=PoTCg3cNbUvvsOYF3HPzHvKtTEsClt86WqC4ItnDgeUUpMRqYldwHbtwoIKonwujhfjR
 AEX+X004eX77Ve9EHgfdT6TKfK0KsmOTjzmLCQxwCHKDTDj+2M1sqPuryAhdrmNcSogm
 dy6mFouFopdthNnEIJb75IUM2M9pQeXsDDzxh1eHrGiDGDEPPmefsl77NXY7JXOZnl7Z
 09YaEPJQT7ihFGdVxYSfgUSrly9uZnyytFPDW+xyp6f+9DBj0Sf482zF1aILDJ6D169n
 NyCAY1ZuyZWUjrqcr/wW8gpIjbwbwJIa4hT00d1FjCeekzZGSfQ4GnGwgfQz52qWyG8L nw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ccg1rs27g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:40 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AGGxfji016052;
 Tue, 16 Nov 2021 17:01:40 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ccg1rs26w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:40 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AGGr0M3006921;
 Tue, 16 Nov 2021 17:01:38 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 3ca4mk12jn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:38 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 1AGGsdBN47710472
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 16:54:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3B1D5AE063;
 Tue, 16 Nov 2021 17:01:35 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3AACAE045;
 Tue, 16 Nov 2021 17:01:34 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.101.4.17])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Nov 2021 17:01:34 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 3/3] pcie_aer: Don't trigger a LSI if none are defined
Date: Tue, 16 Nov 2021 18:01:33 +0100
Message-Id: <20211116170133.724751-4-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211116170133.724751-1-fbarrat@linux.ibm.com>
References: <20211116170133.724751-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: hq6wcUsmk8Z7CZc3jY9S9O2IachMkK6w
X-Proofpoint-ORIG-GUID: tF2U1rJKwGmU_uQkPKq2Yq3N2UHE421k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_03,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0
 priorityscore=1501 suspectscore=0 impostorscore=0 adultscore=0
 clxscore=1015 malwarescore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160084
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Skip triggering an LSI when the AER root error status is updated if no
LSI is defined for the device. We can have a root bridge with no LSI,
MSI and MSI-X defined, for example on POWER systems.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci/pcie_aer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index 27f9cc56af..e1a8a88c8c 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -774,7 +774,9 @@ void pcie_aer_root_write_config(PCIDevice *dev,
     uint32_t root_cmd = pci_get_long(aer_cap + PCI_ERR_ROOT_COMMAND);
     /* 6.2.4.1.2 Interrupt Generation */
     if (!msix_enabled(dev) && !msi_enabled(dev)) {
-        pci_set_irq(dev, !!(root_cmd & enabled_cmd));
+        if (pci_intx(dev) != -1) {
+            pci_set_irq(dev, !!(root_cmd & enabled_cmd));
+        }
         return;
     }
 
-- 
2.33.1


