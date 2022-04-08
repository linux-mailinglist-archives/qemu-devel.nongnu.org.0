Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2BC94F9685
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 15:15:58 +0200 (CEST)
Received: from localhost ([::1]:45718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncoSz-0002tQ-R8
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 09:15:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1ncoQY-0000kk-JQ; Fri, 08 Apr 2022 09:13:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:24604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1ncoQS-000833-O1; Fri, 08 Apr 2022 09:13:25 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 238CRCrp011812; 
 Fri, 8 Apr 2022 13:13:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=usCOWDGTjgIhw/0a7vWSIF2Ww+QS+m9lE1Ha1wY0cV0=;
 b=EgNkKFhfcX7qS30TeygmIdkHlGRTB/ahBUIwYOely9n6b3xwoCv91MEfyqW9ouzziQ55
 JJTcftJ9G86a9+9nn0ESWMDC1fhLTklrP127AtaiL5rXVnnDycR3jz/nrI3Eo0branqG
 0gfAOkQu24HHerZKXBdj9u6VrKGGOWRlJ3F+7yGsIQGWuFBscMtU5iHRt2VBeiDbMxp+
 sWdshEKpiJJjk1FV83Fua/UoKkHAAcoIYIaPZfgDPBSXYYy5hSGBHXuxbbLpP9PdOC95
 SGkKDyI5BdfJd+1p6pwtPBQmmrBNsm7MUfRdkQuHaSd0F5y8Ia+4EHHTNt1gMzTHn0uk Xw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3faessraug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 13:13:09 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 238BrmcN027702;
 Fri, 8 Apr 2022 13:13:08 GMT
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.102])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3faessrau1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 13:13:08 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
 by ppma06ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 238CvEm7031198;
 Fri, 8 Apr 2022 13:13:06 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06ams.nl.ibm.com with ESMTP id 3f6drhute8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 13:13:06 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 238DD4vB36438288
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Apr 2022 13:13:04 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34956A405B;
 Fri,  8 Apr 2022 13:13:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6E95A4060;
 Fri,  8 Apr 2022 13:13:03 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.145.202])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  8 Apr 2022 13:13:03 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] pcie: Don't try triggering a LSI when not defined
Date: Fri,  8 Apr 2022 15:13:02 +0200
Message-Id: <20220408131303.147840-2-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408131303.147840-1-fbarrat@linux.ibm.com>
References: <20220408131303.147840-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xBUf1XDwVvAVDgIiFmo3D5a0I9xXHU8d
X-Proofpoint-GUID: gREDzRddZxQmSDRknk0fviy9-jjprRPx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_04,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=615 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204080067
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H4=0.001,
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
 hw/pci/pcie.c     | 5 +++--
 hw/pci/pcie_aer.c | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 67a5d67372..68a62da0b5 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -353,7 +353,7 @@ static void hotplug_event_notify(PCIDevice *dev)
         msix_notify(dev, pcie_cap_flags_get_vector(dev));
     } else if (msi_enabled(dev)) {
         msi_notify(dev, pcie_cap_flags_get_vector(dev));
-    } else {
+    } else if (pci_intx(dev) != -1) {
         pci_set_irq(dev, dev->exp.hpev_notified);
     }
 }
@@ -361,7 +361,8 @@ static void hotplug_event_notify(PCIDevice *dev)
 static void hotplug_event_clear(PCIDevice *dev)
 {
     hotplug_event_update_event_status(dev);
-    if (!msix_enabled(dev) && !msi_enabled(dev) && !dev->exp.hpev_notified) {
+    if (!msix_enabled(dev) && !msi_enabled(dev) && pci_intx(dev) != -1 &&
+        !dev->exp.hpev_notified) {
         pci_irq_deassert(dev);
     }
 }
diff --git a/hw/pci/pcie_aer.c b/hw/pci/pcie_aer.c
index e1a8a88c8c..92bd0530dd 100644
--- a/hw/pci/pcie_aer.c
+++ b/hw/pci/pcie_aer.c
@@ -290,7 +290,7 @@ static void pcie_aer_root_notify(PCIDevice *dev)
         msix_notify(dev, pcie_aer_root_get_vector(dev));
     } else if (msi_enabled(dev)) {
         msi_notify(dev, pcie_aer_root_get_vector(dev));
-    } else {
+    } else if (pci_intx(dev) != -1) {
         pci_irq_assert(dev);
     }
 }
-- 
2.35.1


