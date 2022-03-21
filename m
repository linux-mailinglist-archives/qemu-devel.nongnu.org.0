Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C02604E2D02
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 16:58:03 +0100 (CET)
Received: from localhost ([::1]:57714 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWKPy-0004dU-Sz
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 11:58:02 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nWK2s-0007U7-5Q; Mon, 21 Mar 2022 11:34:10 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:59458
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1nWK2q-0006xo-Es; Mon, 21 Mar 2022 11:34:09 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22LDqfh5005763; 
 Mon, 21 Mar 2022 15:34:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Z+N4Ro+fomzI/YRaHs7Y3py/LM4xJmW6r7WCrzT9nmQ=;
 b=CqJqm7umlqKuCEncwSf7R1O+C/QFScL3hGut47y0o7Uy9J7zEixGefbrTH5gDZgmyHaK
 D3hNswNXfRjRONKWG2Biy01qoD+t/Pw1mdklzU21TFovPsoC07hjhmqinRfTyof/z1nj
 oHYFwagWs37sdWuzP6+KFM/zVlNHUTQImkB40DMNqBziR+8DirIn0hmWkbhAGCskZN8T
 TIXJsjTselZ4kMdr4mx74USbspHqklttKoND962icYatooqHW07BsMh4bT1MVbEgYB9T
 L8MFHcETi03llXcweVqYO5H+U9T8NFRI420TFV3NuOWdYcRqt9dukoOihfdH4p1V7axA zA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exr9edpb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 15:34:03 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22LEiuDF017796;
 Mon, 21 Mar 2022 15:34:03 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3exr9edpae-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 15:34:03 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22LFXYZT025161;
 Mon, 21 Mar 2022 15:34:01 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3ew6t8v91t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 21 Mar 2022 15:34:01 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22LFXxAs34079116
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 21 Mar 2022 15:33:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id F02BD11C054;
 Mon, 21 Mar 2022 15:33:58 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A584611C04C;
 Mon, 21 Mar 2022 15:33:58 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.101.4.17])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Mon, 21 Mar 2022 15:33:58 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 2/2] ppc/pnv: Remove LSI on the PCIE host bridge
Date: Mon, 21 Mar 2022 16:33:57 +0100
Message-Id: <20220321153357.165775-3-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220321153357.165775-1-fbarrat@linux.ibm.com>
References: <20220321153357.165775-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: LOsQqPtY7JnwOUq5NNmeRnwnAuHviVN4
X-Proofpoint-ORIG-GUID: sQiTU_wnilz2eVIm0qLLLEegXh0gOiP3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-21_07,2022-03-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0
 mlxlogscore=999 clxscore=1015 phishscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 adultscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2203210098
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
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

The phb3/phb4/phb5 root ports inherit from the default PCIE root port
implementation, which requests a LSI interrupt (#INTA). On real
hardware (POWER8/POWER9/POWER10), there is no such LSI. This patch
corrects it so that it matches the hardware.

As a consequence, the device tree previously generated was bogus, as
the root bridge LSI was not properly mapped. On some
implementation (powernv9), it was leading to inconsistent interrupt
controller (xive) data. With this patch, it is now clean.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci-host/pnv_phb3.c | 1 +
 hw/pci-host/pnv_phb4.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/hw/pci-host/pnv_phb3.c b/hw/pci-host/pnv_phb3.c
index ac801ac835..0d18c96117 100644
--- a/hw/pci-host/pnv_phb3.c
+++ b/hw/pci-host/pnv_phb3.c
@@ -1162,6 +1162,7 @@ static void pnv_phb3_root_port_realize(DeviceState *dev, Error **errp)
         error_propagate(errp, local_err);
         return;
     }
+    pci_config_set_interrupt_pin(pci->config, 0);
 }
 
 static void pnv_phb3_root_port_class_init(ObjectClass *klass, void *data)
diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index b301762093..b66b75d4d7 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1772,6 +1772,7 @@ static void pnv_phb4_root_port_reset(DeviceState *dev)
     pci_set_word(conf + PCI_PREF_MEMORY_LIMIT, 0xfff1);
     pci_set_long(conf + PCI_PREF_BASE_UPPER32, 0x1); /* Hack */
     pci_set_long(conf + PCI_PREF_LIMIT_UPPER32, 0xffffffff);
+    pci_config_set_interrupt_pin(conf, 0);
 }
 
 static void pnv_phb4_root_port_realize(DeviceState *dev, Error **errp)
-- 
2.35.1


