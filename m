Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A0E4F9687
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 15:17:47 +0200 (CEST)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncoUk-0006Ab-UM
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 09:17:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1ncoQY-0000kj-Jf; Fri, 08 Apr 2022 09:13:28 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:37578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1ncoQS-000832-Pl; Fri, 08 Apr 2022 09:13:25 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 238CQidR012421; 
 Fri, 8 Apr 2022 13:13:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=m63OjdoAjp8K05grcyXU9ZzauZ4dunD18zdOjQ90ffY=;
 b=LwFbTPGl2tIQTz4f7yCR1r4+sfq447PVji5WD26vW7o1ziEVEJFlkBuG499kZMfuV69O
 6CLLFeZ/EeQAFleduLSOsYaSTfule9XzxV2DlngMctuPteCYPM+/4zm3ahDiTmrKkq5k
 XMay6Ct5p6lZlwKT6ego48/c2D557KkuqdUPDI4j2Qd2tx6yJA/QPR0k10wE41WotHk0
 UyKm/LYYRfjDc5k4aYX0cFzI7hrRRExYuERPAsOHFT75fKBjTjMtBAsPlIHuWl6MvLY0
 iWU6e0keU5qn+xcvzmGJX8NHSdVQr506ktjEGdgqPGSYYMiuodbMXJLjoUoA5jwrd/B/ GA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3faessraus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 13:13:10 +0000
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 238D7aMU014173;
 Fri, 8 Apr 2022 13:13:09 GMT
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3faessrau6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 13:13:09 +0000
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 238Cx3Cd027807;
 Fri, 8 Apr 2022 13:13:07 GMT
Received: from b06cxnps3074.portsmouth.uk.ibm.com
 (d06relay09.portsmouth.uk.ibm.com [9.149.109.194])
 by ppma06fra.de.ibm.com with ESMTP id 3f6drhsqxk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 08 Apr 2022 13:13:07 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 238DD49B36438292
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 8 Apr 2022 13:13:04 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 82B70A405B;
 Fri,  8 Apr 2022 13:13:04 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4281DA405C;
 Fri,  8 Apr 2022 13:13:04 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.145.202])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  8 Apr 2022 13:13:04 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, mst@redhat.com,
 marcel.apfelbaum@gmail.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] ppc/pnv: Remove LSI on the PCIE host bridge
Date: Fri,  8 Apr 2022 15:13:03 +0200
Message-Id: <20220408131303.147840-3-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220408131303.147840-1-fbarrat@linux.ibm.com>
References: <20220408131303.147840-1-fbarrat@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: -6wd_X_hHW9h0ojQLSR0VZu2shxHiV_k
X-Proofpoint-GUID: Gp6wf3I0zIa2BG8Oh0-NY293luS4nDoB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-08_04,2022-04-08_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0
 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0 impostorscore=0
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
index 6e9aa9d6ac..6a884833a8 100644
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
index 11c97e27eb..dd81e940b7 100644
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


