Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D52B57D8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 04:27:38 +0100 (CET)
Received: from localhost ([::1]:50456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kerea-0000vd-Mt
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 22:27:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kerdK-0008Qd-34; Mon, 16 Nov 2020 22:26:18 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:63568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1kerdH-0007ys-VU; Mon, 16 Nov 2020 22:26:17 -0500
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0AH31khP183435; Mon, 16 Nov 2020 22:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references; s=pp1;
 bh=LLDg9M17rvfyUJ3mF0ORdVIDv9Yuo1rSpK51HGiOziA=;
 b=U+8A63rN+4Hrz5WtKwb0pnJUikTe7GgmyKw0S3Y8PTve3GfyWf88eFF2EqaTKtAaoflL
 g8qJoLADPl5kAWMYIlwsMmr8aVVSkps0vdRzRK/VkOOWgiw/9E3bW4kYd7ivXkeAtjdK
 q4tIttDj3SsW2W09Z0UfLkXmv8z8YNauNAHi3I5WBct8Ctn8w2bs6vZfZoYthUrrzi9q
 NBAsMzuvlnSuEwtoekJD+BFIF+7Hof7ErFomv262Z/975rrm6QNX1nWteibvzX9TJHtQ
 nFYk93UgHwsuYuEpWa5VwPWdgkQMSCrG8U4Z7P7InNIwVyzoYa9DfYgC2fK1o9B6O9qu +w== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34v3w9kbcf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 22:26:12 -0500
Received: from m0187473.ppops.net (m0187473.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 0AH31l6s183470;
 Mon, 16 Nov 2020 22:26:12 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0a-001b2d01.pphosted.com with ESMTP id 34v3w9kbby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 16 Nov 2020 22:26:12 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 0AH3Msax025902;
 Tue, 17 Nov 2020 03:26:09 GMT
Received: from b06avi18878370.portsmouth.uk.ibm.com
 (b06avi18878370.portsmouth.uk.ibm.com [9.149.26.194])
 by ppma06fra.de.ibm.com with ESMTP id 34t6gh9ck0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Nov 2020 03:26:09 +0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 0AH3Q7j458065320
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Nov 2020 03:26:07 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7146E4C058;
 Tue, 17 Nov 2020 03:26:07 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 59B494C05A;
 Tue, 17 Nov 2020 03:26:07 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Tue, 17 Nov 2020 03:26:07 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 1A8CEE14DC; Tue, 17 Nov 2020 04:26:07 +0100 (CET)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>
Subject: [RFC PATCH 2/2] vfio-ccw: Connect the device request notifier
Date: Tue, 17 Nov 2020 04:26:05 +0100
Message-Id: <20201117032605.56831-3-farman@linux.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117032605.56831-1-farman@linux.ibm.com>
References: <20201117032605.56831-1-farman@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312, 18.0.737
 definitions=2020-11-16_13:2020-11-13,
 2020-11-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 suspectscore=0 impostorscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 malwarescore=0 mlxscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2011170020
Received-SPF: pass client-ip=148.163.156.1; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/16 22:26:13
X-ACL-Warn: Detected OS   = Linux 3.x [generic] [fuzzy]
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
Cc: Eric Farman <farman@linux.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that the vfio-ccw code has a notifier interface to request that
a device be unplugged, let's wire that together.

Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 hw/vfio/ccw.c | 40 ++++++++++++++++++++++++++++++++++++----
 1 file changed, 36 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index d2755d7fc5..bc78a0ad76 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -49,6 +49,7 @@ struct VFIOCCWDevice {
     struct ccw_crw_region *crw_region;
     EventNotifier io_notifier;
     EventNotifier crw_notifier;
+    EventNotifier req_notifier;
     bool force_orb_pfch;
     bool warned_orb_pfch;
 };
@@ -287,6 +288,21 @@ static void vfio_ccw_crw_read(VFIOCCWDevice *vcdev)
     } while (1);
 }
 
+static void vfio_ccw_req_notifier_handler(void *opaque)
+{
+    VFIOCCWDevice *vcdev = opaque;
+    Error *err = NULL;
+
+    if (!event_notifier_test_and_clear(&vcdev->req_notifier)) {
+        return;
+    }
+
+    qdev_unplug(DEVICE(vcdev), &err);
+    if (err) {
+        warn_reportf_err(err, VFIO_MSG_PREFIX, vcdev->vdev.name);
+    }
+}
+
 static void vfio_ccw_crw_notifier_handler(void *opaque)
 {
     VFIOCCWDevice *vcdev = opaque;
@@ -386,6 +402,10 @@ static void vfio_ccw_register_irq_notifier(VFIOCCWDevice *vcdev,
         notifier = &vcdev->crw_notifier;
         fd_read = vfio_ccw_crw_notifier_handler;
         break;
+    case VFIO_CCW_REQ_IRQ_INDEX:
+        notifier = &vcdev->req_notifier;
+        fd_read = vfio_ccw_req_notifier_handler;
+        break;
     default:
         error_setg(errp, "vfio: Unsupported device irq(%d)", irq);
         return;
@@ -440,6 +460,9 @@ static void vfio_ccw_unregister_irq_notifier(VFIOCCWDevice *vcdev,
     case VFIO_CCW_CRW_IRQ_INDEX:
         notifier = &vcdev->crw_notifier;
         break;
+    case VFIO_CCW_REQ_IRQ_INDEX:
+        notifier = &vcdev->req_notifier;
+        break;
     default:
         error_report("vfio: Unsupported device irq(%d)", irq);
         return;
@@ -661,20 +684,28 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
 
     vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX, &err);
     if (err) {
-        goto out_notifier_err;
+        goto out_io_notifier_err;
     }
 
     if (vcdev->crw_region) {
         vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX, &err);
         if (err) {
-            vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
-            goto out_notifier_err;
+            goto out_crw_notifier_err;
         }
     }
 
+    vfio_ccw_register_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX, &err);
+    if (err) {
+        goto out_req_notifier_err;
+    }
+
     return;
 
-out_notifier_err:
+out_req_notifier_err:
+    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
+out_crw_notifier_err:
+    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
+out_io_notifier_err:
     vfio_ccw_put_region(vcdev);
 out_region_err:
     vfio_ccw_put_device(vcdev);
@@ -696,6 +727,7 @@ static void vfio_ccw_unrealize(DeviceState *dev)
     S390CCWDeviceClass *cdc = S390_CCW_DEVICE_GET_CLASS(cdev);
     VFIOGroup *group = vcdev->vdev.group;
 
+    vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_REQ_IRQ_INDEX);
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_CRW_IRQ_INDEX);
     vfio_ccw_unregister_irq_notifier(vcdev, VFIO_CCW_IO_IRQ_INDEX);
     vfio_ccw_put_region(vcdev);
-- 
2.17.1


