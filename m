Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CBC467968
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 15:30:12 +0100 (CET)
Received: from localhost ([::1]:60264 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mt9Zj-000085-67
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 09:30:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50512)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt9Wz-0005zH-Ps; Fri, 03 Dec 2021 09:27:21 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:21192)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1mt9Wx-0004pj-Pq; Fri, 03 Dec 2021 09:27:21 -0500
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B3CmZ4B002410; 
 Fri, 3 Dec 2021 14:27:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=6RpY75ZP3cCWRNfgc+A/YuYK4UkB5oOiEZCyKfk0RFs=;
 b=rGqrrnmICAAjJ3BtFMy1c4GiFd7WB+s3cLlmhF+2M12jbquyyGviqVyxrBTi64TLX7Lf
 R6hok+TIZG1kiaD7dXBcXnzYjUarvGjKEHiUsdNVAfb+upsIYjyG76QGwr8I89vVA3wa
 lW74y3irfhJxxfPDbBtZFqINk6kvOcJtALNhI/NK6TBsOINft4esbUDWP2S1bbP3zAVp
 fXUyhV9v7x+SbhIyb6L55b48IHL8CCcv20AWtD3WLHw5T418i1r4Bu0lIWD757qyRqQd
 0kQR2GGyf2IN0hvYlmjFcOP39WjcaIiEhZqtF//3T1qexiit66AL7wmxQ8vxtfZ+e3CY 8A== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqkjra6s2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:16 +0000
Received: from m0098404.ppops.net (m0098404.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B3Dmxi6029451;
 Fri, 3 Dec 2021 14:27:16 GMT
Received: from ppma05wdc.us.ibm.com (1b.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.27])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cqkjra6rk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:16 +0000
Received: from pps.filterd (ppma05wdc.us.ibm.com [127.0.0.1])
 by ppma05wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B3ENUdo014985;
 Fri, 3 Dec 2021 14:27:15 GMT
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])
 by ppma05wdc.us.ibm.com with ESMTP id 3ckcad59uc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 03 Dec 2021 14:27:15 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B3ERDlN24183394
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 3 Dec 2021 14:27:13 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C12216E059;
 Fri,  3 Dec 2021 14:27:13 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6D8E56E052;
 Fri,  3 Dec 2021 14:27:12 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.96.25])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri,  3 Dec 2021 14:27:12 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH v3 1/4] s390x/pci: use a reserved ID for the default PCI group
Date: Fri,  3 Dec 2021 09:27:03 -0500
Message-Id: <20211203142706.427279-2-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211203142706.427279-1-mjrosato@linux.ibm.com>
References: <20211203142706.427279-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 51hAod69tCt_5L81yl_z07jWVzavonxl
X-Proofpoint-ORIG-GUID: uB1WREr8Eb4BOaD_HNGcHtB91ACTk5i6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-03_07,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112030088
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current default PCI group being used can technically collide with a
real group ID passed from a hostdev.  Let's instead use a group ID that
comes from a special pool (0xF0-0xFF) that is architected to be reserved
for simulated devices.

Fixes: 28dc86a072 ("s390x/pci: use a PCI Group structure")
Reviewed-by: Eric Farman <farman@linux.ibm.com>
Reviewed-by: Pierre Morel <pmorel@linux.ibm.com>
Signed-off-by: Matthew Rosato <mjrosato@linux.ibm.com>
---
 include/hw/s390x/s390-pci-bus.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/s390x/s390-pci-bus.h b/include/hw/s390x/s390-pci-bus.h
index aa891c178d..2727e7bdef 100644
--- a/include/hw/s390x/s390-pci-bus.h
+++ b/include/hw/s390x/s390-pci-bus.h
@@ -313,7 +313,7 @@ typedef struct ZpciFmb {
 } ZpciFmb;
 QEMU_BUILD_BUG_MSG(offsetof(ZpciFmb, fmt0) != 48, "padding in ZpciFmb");
 
-#define ZPCI_DEFAULT_FN_GRP 0x20
+#define ZPCI_DEFAULT_FN_GRP 0xFF
 typedef struct S390PCIGroup {
     ClpRspQueryPciGrp zpci_group;
     int id;
-- 
2.27.0


