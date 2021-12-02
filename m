Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A0B466889
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Dec 2021 17:44:09 +0100 (CET)
Received: from localhost ([::1]:40754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mspBn-00014Z-Rn
	for lists+qemu-devel@lfdr.de; Thu, 02 Dec 2021 11:44:07 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1msp9E-0006kx-NE; Thu, 02 Dec 2021 11:41:28 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:26756
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjrosato@linux.ibm.com>)
 id 1msp9C-0002ti-0E; Thu, 02 Dec 2021 11:41:28 -0500
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B2GM5q2016796; 
 Thu, 2 Dec 2021 16:41:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=SyDAzz/sK41r42cfrtDAUyle0v37dVOREX4kAbVC964=;
 b=oVwHwhO6/QH0jTL+oRa41OXG9dpNDqv0lM+BpK7KuO9/GG6hl9wSy62K4QB/NicyvcgP
 +GBEKgbpNTv24vg6bi3mWJGfRRsp/phLdGst+wPAkI28OCPJmbhooern+cQFkr7s1Ls8
 egH/kJ5qIQlB6oj3cCV/WAGLJYK3GlNSBXQRx4GbuGFaW1GVd3BSQix2wEo/f2K0EIeO
 xS+U2P2ncJzAcOwiL9MUY9GosntGaosNJ4+aVeRU8WWWo1YmHTshkkDEgOdtT9uENZDL
 uH/kufCAGAxBvJ5oFXQAiZRYSRCLoXeHPOCYydEjwEcFi6Uy9lJGH1fuATitPiUMq0tM KA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq1krrcme-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 16:41:20 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1B2GPi8f030314;
 Thu, 2 Dec 2021 16:41:20 GMT
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cq1krrcm3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 16:41:20 +0000
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1B2GRi5o016182;
 Thu, 2 Dec 2021 16:41:19 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma01wdc.us.ibm.com with ESMTP id 3ckcacj3ww-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 02 Dec 2021 16:41:19 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1B2GfI9k49086798
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 2 Dec 2021 16:41:18 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31B9F13604F;
 Thu,  2 Dec 2021 16:41:18 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3793D136060;
 Thu,  2 Dec 2021 16:41:17 +0000 (GMT)
Received: from li-c92d2ccc-254b-11b2-a85c-a700b5bfb098.ibm.com.com (unknown
 [9.211.48.116])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  2 Dec 2021 16:41:17 +0000 (GMT)
From: Matthew Rosato <mjrosato@linux.ibm.com>
To: thuth@redhat.com, qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 1/4] s390x/pci: use a reserved ID for the default PCI group
Date: Thu,  2 Dec 2021 11:41:07 -0500
Message-Id: <20211202164110.326947-2-mjrosato@linux.ibm.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211202164110.326947-1-mjrosato@linux.ibm.com>
References: <20211202164110.326947-1-mjrosato@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 6XlviLvxhnCfFvGYqQnI6wd-yGhl-hGs
X-Proofpoint-GUID: fMFH_6aE9cntKzlpKNdSe1GwiXixuQDM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-02_10,2021-12-02_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 bulkscore=0 impostorscore=0 clxscore=1011 lowpriorityscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112020109
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=mjrosato@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
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
Cc: farman@linux.ibm.com, pmorel@linux.ibm.com, david@redhat.com,
 cohuck@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The current default PCI group being used can technically collide with a
real group ID passed from a hostdev.  Let's instead use a group ID that comes
from a special pool that is architected to be reserved for simulated devices.

Fixes: 28dc86a072 ("s390x/pci: use a PCI Group structure")
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


