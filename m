Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B95F64EEA54
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 11:23:31 +0200 (CEST)
Received: from localhost ([::1]:46014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naDVC-0003Az-C6
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 05:23:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:57754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1naDRQ-0000G0-VN; Fri, 01 Apr 2022 05:19:42 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:19408
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fbarrat@linux.ibm.com>)
 id 1naDRP-0006sQ-3S; Fri, 01 Apr 2022 05:19:36 -0400
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 2318ZM2P016975; 
 Fri, 1 Apr 2022 09:19:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=N/6BhrfFBXSPFkgPn9e1pQM683hbiez1/lK1mJJnJgk=;
 b=I2V5err7RGoZ0PUdE/7wVpxLH2fFLmxmQhzl6om2Xp1+bZO4mms0m7RjNerZlCJGPp9O
 qJ1TEEYgopZmTrjO5lC8GeXFqZyG1BgrDrf+qC88UgP4+QVqSLOkA3LsdG2hpCRP5b4p
 5HnvV3buOyaHRsaMvY2M25vCCKQhQARmMtNpX9B9aIpRmpL6qbA+fKIGilPYLdpLe8r9
 BEw3ZmUllSYUOxN3wEyL56S6IEm5A2Fgq4BycjE6QZKYDqplkd7lB8bFv57K0ojDPOPf
 ZPCGj0cwo/55t8XEBpLAo+6Zd2g00i2NmlEfx/mN097OvCTIRnv7lz04pL/Zbt1f2oVj Mg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f57tpmqfh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 09:19:31 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 2319JUYO016294;
 Fri, 1 Apr 2022 09:19:30 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3f57tpmqeu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 09:19:30 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2319ChgM011834;
 Fri, 1 Apr 2022 09:19:28 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 3f1tf94nmp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 01 Apr 2022 09:19:28 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 2319JQ5346006590
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 1 Apr 2022 09:19:26 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 04688AE053;
 Fri,  1 Apr 2022 09:19:26 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B6BBEAE051;
 Fri,  1 Apr 2022 09:19:25 +0000 (GMT)
Received: from localhost.localdomain.com (unknown [9.145.170.142])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Fri,  1 Apr 2022 09:19:25 +0000 (GMT)
From: Frederic Barrat <fbarrat@linux.ibm.com>
To: clg@kaod.org, danielhb413@gmail.com, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Subject: [PATCH] ppc/pnv: Fix number of registers in the PCIe controller on
 POWER9
Date: Fri,  1 Apr 2022 11:19:25 +0200
Message-Id: <20220401091925.770803-1-fbarrat@linux.ibm.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GoIl_fSsBhkpPEPybsTHC2rzvFE6OQ4v
X-Proofpoint-ORIG-GUID: eOFaqdQQgU5q-rchkNLwgqBRCAO7FTmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-04-01_03,2022-03-31_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 lowpriorityscore=0
 mlxlogscore=927 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204010041
Received-SPF: pass client-ip=148.163.158.5; envelope-from=fbarrat@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H3=0.001,
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

The spec defines 3 registers, even though only index 0 and 2 are valid
on POWER9. The same model is used on POWER10. Register 1 is defined
there but we currently don't use it in skiboot. So we can keep
reporting an error on write.

Reported by Coverity (CID 1487176).

Fixes: 4f9924c4d4cf ("ppc/pnv: Add models for POWER9 PHB4 PCIe Host bridge")
Suggested-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Signed-off-by: Frederic Barrat <fbarrat@linux.ibm.com>
---
 include/hw/pci-host/pnv_phb4.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/pci-host/pnv_phb4.h b/include/hw/pci-host/pnv_phb4.h
index b02ecdceaa..19dcbd6f87 100644
--- a/include/hw/pci-host/pnv_phb4.h
+++ b/include/hw/pci-host/pnv_phb4.h
@@ -180,7 +180,7 @@ struct PnvPhb4PecState {
     MemoryRegion nest_regs_mr;
 
     /* PCI registers, excluding per-stack */
-#define PHB4_PEC_PCI_REGS_COUNT     0x2
+#define PHB4_PEC_PCI_REGS_COUNT     0x3
     uint64_t pci_regs[PHB4_PEC_PCI_REGS_COUNT];
     MemoryRegion pci_regs_mr;
 
-- 
2.35.1


