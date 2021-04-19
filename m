Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CA5364A20
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Apr 2021 20:52:17 +0200 (CEST)
Received: from localhost ([::1]:51572 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYZ0K-0001Mq-LW
	for lists+qemu-devel@lfdr.de; Mon, 19 Apr 2021 14:52:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lYYxT-0000Ea-1K; Mon, 19 Apr 2021 14:49:19 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:46540
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <farman@linux.ibm.com>)
 id 1lYYxR-0005pw-Ca; Mon, 19 Apr 2021 14:49:18 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13JIdRaI080113; Mon, 19 Apr 2021 14:49:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=PzsiPkK52s725q9KGjJiyUBGWRbUM1QidncCc3FqZK8=;
 b=IDmO3cVtL607DNvTlf0lBhKSmKP/pHqlNbwJcOQASuek1lmMIR6/J0S45QtvHATds8vk
 FOvg3KzOcwIP/nvqVTUBPiMHaqgGRKGa6i5r7U1cI8bFXbZwh5F/tzKwfsy3kkXdVywp
 VOR+dh+07ZBI784zhO7FYPMz9FK3bz6FxRHwvGPwW9JygnUgcmi7SqbvnmdJd/NmPYHw
 fjF19Et8kIGUeAzHCY8gHnO8ZjgvEW37YkNQt/9Y4vgN1fss8Yzsz+HRfxuzgwWIkNY5
 lP9m/L8ReDD+3Qo42qAbC11KeSBbCJ5OrjX4YIObkJ3aoQgfSt4undxcZu4/QjFAzJGJ sw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 380d0b8jn0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 14:49:14 -0400
Received: from m0098414.ppops.net (m0098414.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13JIf3hv084826;
 Mon, 19 Apr 2021 14:49:13 -0400
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.70])
 by mx0b-001b2d01.pphosted.com with ESMTP id 380d0b8jmg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 14:49:13 -0400
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
 by ppma01fra.de.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13JIn70D029191;
 Mon, 19 Apr 2021 18:49:12 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com
 (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
 by ppma01fra.de.ibm.com with ESMTP id 37yqa88paa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 19 Apr 2021 18:49:11 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id 13JImj8e33292584
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 19 Apr 2021 18:48:45 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 924D6A405C;
 Mon, 19 Apr 2021 18:49:08 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7EAC0A405B;
 Mon, 19 Apr 2021 18:49:08 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Mon, 19 Apr 2021 18:49:08 +0000 (GMT)
Received: by tuxmaker.boeblingen.de.ibm.com (Postfix, from userid 4958)
 id 1E771E06B3; Mon, 19 Apr 2021 20:49:08 +0200 (CEST)
From: Eric Farman <farman@linux.ibm.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: [RFC PATCH] vfio-ccw: Permit missing IRQs
Date: Mon, 19 Apr 2021 20:49:06 +0200
Message-Id: <20210419184906.2847283-1-farman@linux.ibm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: UDe13bQ-bLfiHpAdV61twRP2vNW-zl-A
X-Proofpoint-ORIG-GUID: bBZEKg020HC-P_nAlcPGtPqsAZ22aaKN
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-19_11:2021-04-19,
 2021-04-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 clxscore=1011 mlxlogscore=999 lowpriorityscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104190126
Received-SPF: pass client-ip=148.163.158.5; envelope-from=farman@linux.ibm.com;
 helo=mx0a-001b2d01.pphosted.com
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

Let's simply remove the check (and the less-than-helpful message),
and make the VFIO_DEVICE_GET_IRQ_INFO ioctl request for the IRQ
being processed. If it returns with EINVAL, we can treat it as
an unfortunate mismatch but not a fatal error for the guest.

Fixes: 690e29b91102 ("vfio-ccw: Refactor ccw irq handler")
Fixes: b2f96f9e4f5f ("vfio-ccw: Connect the device request notifier")
Signed-off-by: Eric Farman <farman@linux.ibm.com>
---
 hw/vfio/ccw.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index b2df708e4b..cfbfc3d1a2 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -411,20 +411,19 @@ static void vfio_ccw_register_irq_notifier(VFIOCCWDevice *vcdev,
         return;
     }
 
-    if (vdev->num_irqs < irq + 1) {
-        error_setg(errp, "vfio: unexpected number of irqs %u",
-                   vdev->num_irqs);
-        return;
-    }
-
     argsz = sizeof(*irq_info);
     irq_info = g_malloc0(argsz);
     irq_info->index = irq;
     irq_info->argsz = argsz;
     if (ioctl(vdev->fd, VFIO_DEVICE_GET_IRQ_INFO,
               irq_info) < 0 || irq_info->count < 1) {
-        error_setg_errno(errp, errno, "vfio: Error getting irq info");
-        goto out_free_info;
+        if (errno == EINVAL) {
+            warn_report("Unable to get information about IRQ %u", irq);
+            goto out_free_info;
+        } else {
+            error_setg_errno(errp, errno, "vfio: Error getting irq info");
+            goto out_free_info;
+        }
     }
 
     if (event_notifier_init(notifier, 0)) {
-- 
2.25.1


