Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920BD36C7B7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 16:27:00 +0200 (CEST)
Received: from localhost ([::1]:60474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbOfz-0006qk-Df
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 10:26:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43826)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lbOeS-0006Ie-Av; Tue, 27 Apr 2021 10:25:24 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:49084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lbOeQ-0001Ix-EL; Tue, 27 Apr 2021 10:25:24 -0400
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13RE3wRC039361; Tue, 27 Apr 2021 10:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=oOeve1qMeClMT89xdT+HkZBxpxBQrG7CoeOjXP5K9KQ=;
 b=WlDJnHmemqLi89LJHCI96xu9fOV8aGc0w8bUT+KLxTDOYHEBAF5xQg12iRMmemkp3i52
 4ab1DYAzk7vK06yL6XUZHbyYOXNd947byvzA2vn9uhabhrTE20747Tr03JK+Cu40l3zS
 I7k9Gpm1QTWLAGtj5iHSKinuxn/kgrsiziZq5nUmceIRGSDxNI/z8rVXkodeI1Veua9s
 FNtqt5zH6l1zyk00wMYPccNBr2PSdL0T8sq+xk76j8l8mRWWEJKtgUSliAbKxVoDcJ9z
 djipGzTbPmCM4pQKhWr1juTwC/XqGJOES7Wpjn4RmXzC+tETmlLJsVGWNUwngUVSV5Nr uQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386kxmh0rq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 10:25:19 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13RE5Tjl046384;
 Tue, 27 Apr 2021 10:25:19 -0400
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 386kxmh0pw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 10:25:19 -0400
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13REMRaA012441;
 Tue, 27 Apr 2021 14:25:17 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma04ams.nl.ibm.com with ESMTP id 384ay8hd01-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 27 Apr 2021 14:25:17 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13REPD9q45613478
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 27 Apr 2021 14:25:13 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 90A64A4057;
 Tue, 27 Apr 2021 14:25:13 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DFBBA4055;
 Tue, 27 Apr 2021 14:25:13 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 27 Apr 2021 14:25:13 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 12182E028D; Tue, 27 Apr 2021 16:25:13 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH] vfio-ccw: Attempt to clean up all IRQs on error
Date: Tue, 27 Apr 2021 16:25:11 +0200
Message-Id: <20210427142511.2125733-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 3Z0fDXjOP2K50ja94mA4vO0uP1ND6BHw
X-Proofpoint-GUID: DOTlcfMpt4fhT0kwbJLeOxKmMaeEu-E6
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-27_08:2021-04-27,
 2021-04-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0 adultscore=0
 phishscore=0 mlxlogscore=937 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104270101
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The vfio_ccw_unrealize() routine makes an unconditional attempt to
unregister every IRQ notifier, though they may not have been registered
in the first place (when running on an older kernel, for example).

Let's mirror this behavior in the error cleanups in vfio_ccw_realize()
so that if/when new IRQs are added, it is less confusing to recognize
the necessary procedures. The worst case scenario would be some extra
messages about an undefined IRQ, but since this is an error exit that
won't be the only thing to worry about.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 hw/vfio/ccw.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 400bc07fe2..169438c3b8 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -690,7 +690,7 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
     if (vcdev->crw_region) {
         vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX, &err);
         if (err) {
-            goto out_crw_notifier_err;
+            goto out_irq_notifier_err;
         }
     }
 
@@ -705,7 +705,9 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
 
     return;
 
-out_crw_notifier_err:
+out_irq_notifier_err:
+    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX);
+    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
 out_io_notifier_err:
     vfio_ccw_put_region(vcdev);
-- 
2.25.1


