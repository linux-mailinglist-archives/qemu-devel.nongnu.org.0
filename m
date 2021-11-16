Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B808F453845
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 18:07:12 +0100 (CET)
Received: from localhost ([::1]:36156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn1vL-0001Ea-ID
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 12:07:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mn1q9-0002OZ-7T; Tue, 16 Nov 2021 12:01:49 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26190
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1mn1q7-0001Aq-9s; Tue, 16 Nov 2021 12:01:48 -0500
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AGGJhiv013546; 
 Tue, 16 Nov 2021 17:01:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=YFysD9HSrEHHcMMXePgaiu0/qu+JjRVbXlEtz+LhC3Y=;
 b=IoP7X6vg5MZP/hKJ8kPg3FECdZ7mZnx6u4WKNSwfH1K9gYQ7P82J7AoN0I3JnDt0819e
 Jenc+CUui+h0Z+mvzDXrTLrQvGU4vjfPsNo8tskpne+fCg1nrvJNWzXryjlXXcIweR2h
 TOmMITymAMNfzBr6Q6S7IIVMRAWbYx0vwOhFikB8IplGfUYGlCm7yW9V3ZvXzhIg3tMx
 W7HcpH1cN+CPj8hzvEktDAWnIasPbZcLytsTuOK1QsMvTtd1cOzn40E4VjgTWJqy9Qqh
 PZ0R2WyWe8ziArGH/16udVDogyCfHvpTl/Ce5GCivOd/vsQhrXbIy4C2T3eWNpUEUJph aQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ccg2h0ymf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:39 +0000
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1AGGucXd026325;
 Tue, 16 Nov 2021 17:01:38 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3ccg2h0ykj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:38 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1AGGrAel015907;
 Tue, 16 Nov 2021 17:01:37 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma03ams.nl.ibm.com with ESMTP id 3ca50a251d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 Nov 2021 17:01:36 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1AGH1YpQ19268004
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Nov 2021 17:01:34 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 80799AE061;
 Tue, 16 Nov 2021 17:01:34 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3D3A4AE04D;
 Tue, 16 Nov 2021 17:01:34 +0000 (GMT)
Received: from localhost.ibm.com (unknown [9.101.4.17])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Nov 2021 17:01:34 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, mst@redhat.com, marcel.apfelbaum@gmail.com,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/3] ppc/pnv: Tune the POWER9 PCIe Host bridge model
Date: Tue, 16 Nov 2021 18:01:31 +0100
Message-Id: <20211116170133.724751-2-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211116170133.724751-1-fbarrat@linux.ibm.com>
References: <20211116170133.724751-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: XF9oviiHWsCIbO_cXWR9ZwxwL0HHEmtf
X-Proofpoint-GUID: ChdkTULQdsjnbgplLCUHIhl2vlRLIWEA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-16_03,2021-11-16_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 mlxlogscore=999 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111160084
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

The PHB v4 found on POWER9 doesn't request any LSI, so let's clear the
Interrupt Pin register in the config space so that the model matches
the hardware.

If we don't, then we inherit from the default pcie root bridge, which
requests a LSI. And because we don't map it correctly in the device
tree, all PHBs allocate the same bogus hw interrupt. We end up with
inconsistent interrupt controller (xive) data. The problem goes away
if we don't allocate the LSI in the first place.

Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 hw/pci-host/pnv_phb4.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/hw/pci-host/pnv_phb4.c b/hw/pci-host/pnv_phb4.c
index 5c375a9f28..1659d55b4f 100644
--- a/hw/pci-host/pnv_phb4.c
+++ b/hw/pci-host/pnv_phb4.c
@@ -1234,10 +1234,13 @@ static void pnv_phb4_reset(DeviceState *dev)
     PCIDevice *root_dev = PCI_DEVICE(&phb->root);
 
     /*
-     * Configure PCI device id at reset using a property.
+     * Configure the PCI device at reset:
+     *   - set the Vendor and Device ID to for the root bridge
+     *   - no LSI
      */
     pci_config_set_vendor_id(root_dev->config, PCI_VENDOR_ID_IBM);
     pci_config_set_device_id(root_dev->config, phb->device_id);
+    pci_config_set_interrupt_pin(root_dev->config, 0);
 }
 
 static const char *pnv_phb4_root_bus_path(PCIHostState *host_bridge,
-- 
2.33.1


