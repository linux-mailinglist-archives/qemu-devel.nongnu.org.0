Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E34D8D89
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Mar 2022 20:56:51 +0100 (CET)
Received: from localhost ([::1]:54656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTqoE-0005Rk-Ru
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 15:56:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nTqhi-0001kx-AE; Mon, 14 Mar 2022 15:50:06 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:51806
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1nTqhg-0003EH-Oc; Mon, 14 Mar 2022 15:50:06 -0400
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 22EJlVm4006438; 
 Mon, 14 Mar 2022 19:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2A3XmtF8yBiCyYbhFlRyNB3L4makRDlvj61mHEDhGuM=;
 b=Dqxvf19to0inb+tkUcZ46kEvQsQYKtTpeX/VOGp6lKvDQXcW2W/a11ir376dHbWVh8Kw
 JpcWgnsFKE6EIbUsQR0pTjYGZxW1/EDhD8j5qOWpR6TxDGlAk/oad2wDe9bijopsY7rT
 HbiEm6HLg8i/ZSTTG2ZI0D9z0MC+dHx0eHvfe+HpXf7VdH/Moe1SeSUeB9X0QnXChMrH
 +kauU283DMS7/1uq6ajwKwrX8pKWhBBMnl7zBfTiDdfffDvO0AyfIuEA3F8386wl/Ycz
 twQJWLBhxrUAjlkZHPj5CWhGKMoegBAK33MCchCwfbs2HMI1MpDO31/ZaIxCVyLec+cw cg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6d6rjyq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:50:03 +0000
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 22EJlpfX007669;
 Mon, 14 Mar 2022 19:50:02 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3et6d6rjyg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:50:02 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 22EJl8Bm005348;
 Mon, 14 Mar 2022 19:50:02 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma01wdc.us.ibm.com with ESMTP id 3erk5989j6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 14 Mar 2022 19:50:01 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 22EJo0lP16974268
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 14 Mar 2022 19:50:00 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 70963112062;
 Mon, 14 Mar 2022 19:50:00 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E8543112071;
 Mon, 14 Mar 2022 19:49:54 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.32.184]) by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 14 Mar 2022 19:49:54 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: qemu-s390x@nongnu.org
Subject: [PATCH v4 06/11] s390x/pci: don't fence interpreted devices without
 MSI-X
Date: Mon, 14 Mar 2022 15:49:15 -0400
Message-Id: <20220314194920.58888-7-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220314194920.58888-1-mjrosato@linux.ibm.com>
References: <20220314194920.58888-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Pyd90NFSpvzFBZZSF6gW_LESCgrUMJSe
X-Proofpoint-ORIG-GUID: UHz3beWOtkHxJg1U9iUOzPDvCLeOIRZC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.850,Hydra:6.0.425,FMLib:17.11.64.514
 definitions=2022-03-14_13,2022-03-14_02,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0
 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2202240000 definitions=main-2203140116
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: farman@linux.ibm.com, kvm@vger.kernel.org, pmorel@linux.ibm.com,
 schnelle@linux.ibm.com, cohuck@redhat.com, richard.henderson@linaro.org,
 thuth@redhat.com, qemu-devel@nongnu.org, pasic@linux.ibm.com,
 alex.williamson@redhat.com, mst@redhat.com, pbonzini@redhat.com,
 david@redhat.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Lack of MSI-X support is not an issue for interpreted passthrough
devices, so let's let these in.  This will allow, for example, ISM
devices to be passed through -- but only when interpretation is
available and being used.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 hw/s390x/s390-pci-bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/s390x/s390-pci-bus.c b/hw/s390x/s390-pci-bus.c
index 7ce7bda26d..acc91af64c 100644
--- a/hw/s390x/s390-pci-bus.c
+++ b/hw/s390x/s390-pci-bus.c
@@ -1087,7 +1087,7 @@ static void s390_pcihost_plug(HotplugHandler *hotplug_dev, DeviceState *dev,
             pbdev->interp = false;
         }
 
-        if (s390_pci_msix_init(pbdev)) {
+        if (s390_pci_msix_init(pbdev) && !pbdev->interp) {
             error_setg(errp, "MSI-X support is mandatory "
                        "in the S390 architecture");
             return;
-- 
2.27.0


