Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7641C36D9AE
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 16:38:02 +0200 (CEST)
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lblKD-00061T-Hf
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 10:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lblJL-0005Yn-1N; Wed, 28 Apr 2021 10:37:07 -0400
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:53512)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lblJJ-0006xL-4g; Wed, 28 Apr 2021 10:37:06 -0400
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13SEYDmD043444; Wed, 28 Apr 2021 10:37:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=mo5PgRqeWkO+EDqT5TkTfcMCTbKnxOsEwzVKiQ+JjhQ=;
 b=HJO9Bfl7OIYHJ2DKXBgzIqXnYbsuy7Jw1rXURUcShyhzbDadkHIzs56hp5iIGJeql4d2
 xEvtwKyPR26Pwa+W0mNLojDmj2J+J2ls5CZ/B7RP/zwn76FxG6nJhZplMurlZas8e3CH
 AT3kVhleh7dixiXOq7jeQ98DS82nlLLN/so4V3vpEz6UxVB9T/NKodsHRNKLVqmnIIsb
 2uDTw4swa+j6sKhlkeXiW2zRj7BeWgAzA+pzHqEqidYmDaxqRBFQa2u81LQ/HpoNpzsA
 VdoeMyreQSv9vt+hric1yGS9o+5mrLcJHy0TlTQNU5NaF7/Z+57JzoJRQ99WTm6qjf1z UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3878w9swv9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 10:37:01 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13SEZ4Yl047305;
 Wed, 28 Apr 2021 10:37:00 -0400
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3878w9swta-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 10:37:00 -0400
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13SEIW5K030160;
 Wed, 28 Apr 2021 14:36:58 GMT
Received: from b06cxnps4075.portsmouth.uk.ibm.com
 (d06relay12.portsmouth.uk.ibm.com [9.149.109.197])
 by ppma06fra.de.ibm.com with ESMTP id 384akh93aw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 28 Apr 2021 14:36:57 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
 [9.149.105.62])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13SEasZw44630396
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 28 Apr 2021 14:36:54 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34480AE051;
 Wed, 28 Apr 2021 14:36:54 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 225F0AE045;
 Wed, 28 Apr 2021 14:36:54 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Wed, 28 Apr 2021 14:36:54 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id AE05DE12F7; Wed, 28 Apr 2021 16:36:53 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: [PATCH v2] vfio-ccw: Attempt to clean up all IRQs on error
Date: Wed, 28 Apr 2021 16:36:52 +0200
Message-Id: <20210428143652.1571487-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: B_c3NydqMyz-fLRZGI_smM2XEYg1gSj8
X-Proofpoint-GUID: Eb7MXcbqjX8AGb_VcSNG1y_Abci4xRzU
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-28_09:2021-04-28,
 2021-04-28 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999
 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 lowpriorityscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104280098
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

And regarding those messages, let's change it to a warning instead of
an error, to better reflect their severity. The existing code in both
paths handles everything anyway.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---

Notes:
    v1->v2:
     - Downgrade unregister IRQ message from error to warning [CH]
    
    v1: https://lore.kernel.org/qemu-devel/20210427142511.2125733-1-farman@linux.ibm.com/

 hw/vfio/ccw.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index 400bc07fe2..f64dd850db 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -470,7 +470,7 @@ static void vfio_ccw_unregister_irq_notifier(VFIOCCWDevice *vcdev,
 
     if (vfio_set_irq_signaling(&vcdev->vdev, irq, 0,
                                VFIO_IRQ_SET_ACTION_TRIGGER, -1, &err)) {
-        error_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
+        warn_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
     }
 
     qemu_set_fd_handler(event_notifier_get_fd(notifier),
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


