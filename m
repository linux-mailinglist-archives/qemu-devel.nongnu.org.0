Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D518A34092D
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 16:50:37 +0100 (CET)
Received: from localhost ([::1]:37094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMuux-0003aI-K4
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 11:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lMusG-0002iF-Lt; Thu, 18 Mar 2021 11:47:49 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:3612
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <borntraeger@de.ibm.com>)
 id 1lMusE-0001Xe-Vl; Thu, 18 Mar 2021 11:47:48 -0400
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12IFYUCK105120; Thu, 18 Mar 2021 11:47:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=s0gLlBJoVf6477OJA1zTzebYykL2NkKmyZgrCxLfazU=;
 b=s0AGUt53IZvL9WRbaDxcBZ217Z7b+HxkBG845+dBAEYnt9IBPl3MSEadqXc9cz37Cw9C
 XGrK4AfSJFphjVErlQ2gnrnUgn+1mt2vG6l/I6f32yp2dVPQYRLKNYkk3QGrLJ4r0g65
 +ynnHzCIaBVCTAmW2X/9N62hYczSktltVly+AhUYMO/ezF9v45tXTJ9ZdPsC/JIAHyEF
 9ZV1T1hj0gL+465AEJ3ny2ro0eHM3zVWtAMwKAvGrN2Vn37CEH06d2mApTAjC3Vv7k2C
 IKOvfi5rygzQtPY8JxYWO9AC5oG4wdayB0qY4ZgMQ6QqUpg0aLXsJwHVoyGnoJsgCjo0 Dg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37by16brsr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 11:47:44 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12IFZ2Hj109306;
 Thu, 18 Mar 2021 11:47:44 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 37by16brrr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 11:47:43 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12IFWGht016183;
 Thu, 18 Mar 2021 15:47:41 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma03ams.nl.ibm.com with ESMTP id 378n18mwkj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 18 Mar 2021 15:47:41 +0000
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 12IFlMBl34406674
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Mar 2021 15:47:22 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 27C4B11C052;
 Thu, 18 Mar 2021 15:47:39 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 15F1211C04C;
 Thu, 18 Mar 2021 15:47:39 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Thu, 18 Mar 2021 15:47:39 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 25651)
 id AC451E165E; Thu, 18 Mar 2021 16:47:38 +0100 (CET)
From: Christian Borntraeger <borntraeger@de.ibm.com>
To: "Michael S . Tsirkin" <mst@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH] intc/i8259: avoid (false positive) gcc warning
Date: Thu, 18 Mar 2021 16:47:38 +0100
Message-Id: <20210318154738.27094-1-borntraeger@de.ibm.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-18_09:2021-03-17,
 2021-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0
 impostorscore=0 suspectscore=0 mlxlogscore=969 clxscore=1015 mlxscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103180111
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=borntraeger@de.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

some copiler versions are smart enough to detect a potentially
uninitialized variable, but are not smart enough to detect that this
cannot happen due to the code flow:

../hw/intc/i8259.c: In function ‘pic_read_irq’:
../hw/intc/i8259.c:203:13: error: ‘irq2’ may be used uninitialized in this function [-Werror=maybe-uninitialized]
   203 |         irq = irq2 + 8;
       |         ~~~~^~~~~~~~~~

Let us initialize irq2 to -1 to avoid this warning as the most simple
solution.

Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
---
 hw/intc/i8259.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/i8259.c b/hw/intc/i8259.c
index 344fd04db14d..ade6fb726faf 100644
--- a/hw/intc/i8259.c
+++ b/hw/intc/i8259.c
@@ -176,7 +176,7 @@ static void pic_intack(PICCommonState *s, int irq)
 int pic_read_irq(DeviceState *d)
 {
     PICCommonState *s = PIC_COMMON(d);
-    int irq, irq2, intno;
+    int irq, irq2 = -1, intno;
 
     irq = pic_get_irq(s);
     if (irq >= 0) {
-- 
2.30.2


