Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D9453844
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:07:08 +0100 (CET)
Received: from localhost ([::1]:35750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1vG-0000wV-9v
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:07:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mn1q8-0002OL-C7; Tue, 16 Nov 2021 12:01:49 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:12514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mn1q5-00018g-Bd; Tue, 16 Nov 2021 12:01:48 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AGFnrnv009626; 
 Tue, 16 Nov 2021 17:01:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sfAiGh5RWuDu0R0TM3TWHz0YYzWKtxCUrtolU2NOLVs=;
 b=HFzKUnC2SbRo/fYCZOQjvgh/m28sxT4/9d93jpsNwzIywetwVhWc25IOdmyk9QOkIKef
 p8ibd8Y/OI4vB19bg2ADSWHKHmlGvsP2lh5/kCMWt4DKArnuxKzscXqqmimEKVCNOnOP
 lEypBtipxthupwfxo06ZH/NCN9jBXwScH8yPbKL8kMW5I+P9NMYM/7DtOPKclSYwqVu6
 h/QpH9IlUtaOwtmB66K1+Z+X9Sa754q+xDoit0kIAGvzHUmsAm7g8tXY91z5SBTECFJh
 HaXiUTl/0aG3V5+JuMc60LQgljmxHUbnX2BoN+GbRtG59cV5RKb3Hp3O2SwGSActLIUb Yw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccfmqhsqa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:40 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AGGmWxv014748;
 Tue, 16 Nov 2021 17:01:39 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3ccfmqhsp0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:39 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AGGrALk015905;
 Tue, 16 Nov 2021 17:01:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ca50a251g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:37 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AGH1YTe12517752
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 17:01:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D3254AE061;
 Tue, 16 Nov 2021 17:01:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90938AE045;
 Tue, 16 Nov 2021 17:01:34 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.101.4.17])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Nov 2021 17:01:34 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/3] pci: Export the pci_intx() function
Date: Tue, 16 Nov 2021 18:01:32 +0100
Message-Id: <20211116170133.724751-3-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211116170133.724751-1-fbarrat@linux.ibm.com>
References: <20211116170133.724751-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 60lEgr0wdnrOmqiq2rzGn8jqofmwQVuZ
X-Proofpoint-GUID: 1q5uNGtb-2hqTdBpRXpVo4-m6GveS_9r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_03,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0
 spamscore=0 priorityscore=1501 mlxscore=0 impostorscore=0 suspectscore=0
 mlxlogscore=915 malwarescore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111160084
Received-SPF: pass client-ip=148.163.156.1; envelope-from=fbarrat@linux.ibm.com;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move the pci_intx() definition to the PCI header file, so that it can
be called from other PCI files. It is used by the next patch.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci/pci.c         | 5 -----
 include/hw/pci/pci.h | 5 +++++
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e5993c1ef5..249d7e4cf6 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -1497,11 +1497,6 @@ static void pci_irq_handler(void *opaque, int irq_num, int level)
     pci_change_irq_level(pci_dev, irq_num, change);
 }
 
-static inline int pci_intx(PCIDevice *pci_dev)
-{
-    return pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
-}
-
 qemu_irq pci_allocate_irq(PCIDevice *pci_dev)
 {
     int intx = pci_intx(pci_dev);
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index e7cdf2d5ec..35f8eb67bd 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -735,6 +735,11 @@ void lsi53c8xx_handle_legacy_cmdline(DeviceState *lsi_dev);
 qemu_irq pci_allocate_irq(PCIDevice *pci_dev);
 void pci_set_irq(PCIDevice *pci_dev, int level);
 
+static inline int pci_intx(PCIDevice *pci_dev)
+{
+    return pci_get_byte(pci_dev->config + PCI_INTERRUPT_PIN) - 1;
+}
+
 static inline void pci_irq_assert(PCIDevice *pci_dev)
 {
     pci_set_irq(pci_dev, 1);
-- 
2.33.1


