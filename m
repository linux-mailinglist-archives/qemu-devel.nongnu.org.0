Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B419366F07
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 17:22:33 +0200 (CEST)
Received: from localhost ([::1]:35110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZEgR-0004Co-7E
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 11:22:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lZEf2-0003kI-Sa; Wed, 21 Apr 2021 11:21:04 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:25358)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lZEf1-0004AJ-1H; Wed, 21 Apr 2021 11:21:04 -0400
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13LF3Lma102265; Wed, 21 Apr 2021 11:21:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=NogGd3dCWMg14/OIATk7T7Jbi0S+mk5gE+0+vmO2INs=;
 b=gO9RBna6CwyVe2Bmqf+/PuL5DJD2FJm+kVkh+AIQ4DaNID0Mtd0D1aQL8QFQUugDXkV/
 UlmgoxV9wY9yQarxRyL6gA15l1CSF5xMqdRjtPqS2XCxjE5rwbVADZL8VHun8Au+bwNe
 qNaYIXaSny62nvqyhsd5hqyAU0l84L/y6t8rznpwN90KlKtnqkg2HjdYiqJGO2U6St2E
 vgrpTjG+m/eIP7k78BOeEN1Vv+fQI408fT/rsYKoVTvPpacpcJY4i+07C9PMhmUP9cEG
 N6V5Jzy9qTLS+JWxNwxwvZTABzV82cPhIo1NK0jIB2X3GNpC3If8XQxwnzVdfljIKg9Q ew== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382gc63qa8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 11:21:00 -0400
Received: from m0127361.ppops.net (m0127361.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13LF5F1t112917;
 Wed, 21 Apr 2021 11:21:00 -0400
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 382gc63q9m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 11:21:00 -0400
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13LFINb6032641;
 Wed, 21 Apr 2021 15:20:58 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma03ams.nl.ibm.com with ESMTP id 37yqa8jcg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 21 Apr 2021 15:20:58 +0000
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13LFKWqM36962664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 21 Apr 2021 15:20:32 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 650554203F;
 Wed, 21 Apr 2021 15:20:55 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 505C84204B;
 Wed, 21 Apr 2021 15:20:55 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 21 Apr 2021 15:20:55 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id F1FFFE07F0; Wed, 21 Apr 2021 17:20:54 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2] vfio-ccw: Permit missing IRQs
Date: Wed, 21 Apr 2021 17:20:53 +0200
Message-Id: <20210421152053.2379873-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: jgLOH9a93muSODfbY2IYyIC2vE1gjAtU
X-Proofpoint-GUID: aO4_gleoIBTaQTjKhE7LIgGJRZyKhM69
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-21_05:2021-04-21,
 2021-04-21 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 bulkscore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104210115
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-s390x@nongnu.org, Alex Williamson <alex.williamson@redhat.com>,
 qemu-devel@nongnu.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 690e29b91102 ("vfio-ccw: Refactor ccw irq handler") changed
one of the checks for the IRQ notifier registration from saying
"the host needs to recognize the only IRQ that exists" to saying
"the host needs to recognize ANY IRQ that exists."

And this worked fine, because the subsequent change to support the
CRW IRQ notifier doesn't get into this code when running on an older
kernel, thanks to a guard by a capability region. The later addition
of the REQ(uest) IRQ by commit b2f96f9e4f5f ("vfio-ccw: Connect the
device request notifier") broke this assumption because there is no
matching capability region. Thus, running new QEMU on an older
kernel fails with:

  vfio: unexpected number of irqs 2

Let's adapt the message here so that there's a better clue of what
IRQ is missing.

Furthermore, let's make the REQ(uest) IRQ not fail when attempting
to register it, to permit running vfio-ccw on a newer QEMU with an
older kernel.

Fixes: b2f96f9e4f5f ("vfio-ccw: Connect the device request notifier")
Signed-off-by: Eric Farman <farman@linux.ibm.com>
---

Notes:
    v1->v2:
     - Keep existing "invalid number of IRQs" message with adapted text [CH]
     - Move the "is this an error" test to the registration of the IRQ in
       question, rather than making it allowable for any IRQ mismatch [CH]
     - Drop Fixes tag for initial commit [EF]
    
    v1: https://lore.kernel.org/qemu-devel/20210419184906.2847283-1-farman@linux.ibm.com/

 hw/vfio/ccw.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index b2df708e4b..400bc07fe2 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -412,8 +412,8 @@ static void vfio_ccw_register_irq_notifier(VFIOCCWDevice *vcdev,
     }
 
     if (vdev->num_irqs < irq + 1) {
-        error_setg(errp, "vfio: unexpected number of irqs %u",
-                   vdev->num_irqs);
+        error_setg(errp, "vfio: IRQ %u not available (number of irqs %u)",
+                   irq, vdev->num_irqs);
         return;
     }
 
@@ -696,13 +696,15 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
 
     vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX, &err);
     if (err) {
-        goto out_req_notifier_err;
+        /*
+         * Report this error, but do not make it a failing condition.
+         * Lack of this IRQ in the host does not prevent normal operation.
+         */
+        error_report_err(err);
     }
 
     return;
 
-out_req_notifier_err:
-    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
 out_crw_notifier_err:
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
 out_io_notifier_err:
-- 
2.25.1


