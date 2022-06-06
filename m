Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2704153F066
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 22:45:45 +0200 (CEST)
Received: from localhost ([::1]:54440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyJbW-0001TT-Pg
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 16:45:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nyJT5-00010u-Om; Mon, 06 Jun 2022 16:36:55 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:21916
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nyJT4-0006dC-3Y; Mon, 06 Jun 2022 16:36:55 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 256KV7NS021524;
 Mon, 6 Jun 2022 20:36:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=S0gLAmoUWqwEiTjFI6x4W+nFp1JcD8rWrh7o6GQOkf0=;
 b=dwi4KAYnej6TCT71AzX7CbOkcovBWUiSBp3D25EUeN1veOroMOT7l4EU5hgJJhOzhd14
 +/0y5LjgNhRmWz5hcZ0v0JMUATOhpEefvwoU6yKOCw+/lT9I7pEH7XUW0zhPoYxUYqv9
 SA0OM1hQ+cfxl/lNX2B5VNj2TLq9hSpHsn7jHY3gQbZ/7DHdvw6lwAXAv/8zBK3BpTGv
 ek247qLMz4qToEm5jrfASIBQ2MSBP4/LVOqWyt6YGkA2jABBvuIHw7kJZbTbOovp9GxE
 Cd8wVl63RkIljNDXTn3l1fUU//utG4NwGeImRO1kIyfjD+OOuHAuHxnw6CqxFHZEEBxi 1Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gghf7rff2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jun 2022 20:36:52 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 256KV9b3021807;
 Mon, 6 Jun 2022 20:36:52 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3gghf7rfes-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jun 2022 20:36:52 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 256KKU8R024180;
 Mon, 6 Jun 2022 20:36:51 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma01dal.us.ibm.com with ESMTP id 3gfy19uu3h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 06 Jun 2022 20:36:51 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 256KanRU43188734
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 6 Jun 2022 20:36:50 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E0A3728059;
 Mon,  6 Jun 2022 20:36:49 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 473BE28058;
 Mon,  6 Jun 2022 20:36:47 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.163.20.188]) by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  6 Jun 2022 20:36:47 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Cc: alex.williamson@redhat.com, schnelle@linux.ibm.com, cohuck@redhat.com,
 thuth@redhat.com, farman@linux.ibm.com, pmorel@linux.ibm.com,
 richard.henderson@linaro.org, david@redhat.com, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com, mst@redhat.com, pbonzini@redhat.com,
 qemu-devel@nongnu.org, kvm@vger.kernel.org
Subject: [PATCH v7 7/8] s390x/pci: reflect proper maxstbl for groups of
 interpreted devices
Date: Mon,  6 Jun 2022 16:36:13 -0400
Message-Id: <20220606203614.110928-8-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220606203614.110928-1-mjrosato@linux.ibm.com>
References: <20220606203614.110928-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: QkWmjwLxfkhJfXGfwZ32rHWeklESdrIF
X-Proofpoint-ORIG-GUID: M_6otRQ4_NU4ZNLcq5ug7zntOYY7O6bh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.874,Hydra:6.0.517,FMLib:17.11.64.514
 definitions=2022-06-06_06,2022-06-03_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 suspectscore=0 phishscore=0 clxscore=1015 adultscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2204290000 definitions=main-2206060081
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

The maximum supported store block length might be different depending
on whether the instruction is interpretively executed (firmware-reported
maximum) or handled via userspace intercept (host kernel API maximum).
Choose the best available value during group creation.

Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-vfio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-vfio.c b/hw/s390x/s390-pci-vfio.c
index 985980f021..212dd053f7 100644
--- a/hw/s390x/s390-pci-vfio.c
+++ b/hw/s390x/s390-pci-vfio.c
@@ -213,7 +213,11 @@ static void s390_pci_read_group(S390PCIBusDevice *pbdev,
         resgrp->msia = cap->msi_addr;
         resgrp->mui = cap->mui;
         resgrp->i = cap->noi;
-        resgrp->maxstbl = cap->maxstbl;
+        if (pbdev->interp && hdr->version >= 2) {
+            resgrp->maxstbl = cap->imaxstbl;
+        } else {
+            resgrp->maxstbl = cap->maxstbl;
+        }
         resgrp->version = cap->version;
         resgrp->dtsm = ZPCI_DTSM;
     }
-- 
2.27.0


