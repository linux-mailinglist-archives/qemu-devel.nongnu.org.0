Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37BA838B4F8
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:11:13 +0200 (CEST)
Received: from localhost ([::1]:39912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmCW-0005Cx-AN
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:11:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm7Q-0001lF-Cz
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35947)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm7C-0005cV-QH
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621530341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rbiqi95N3t0FvUT2LJ86516tFEPkNtui8jyogJ6FhZU=;
 b=b24hn0N8Pk3ZFMmlfydUqgOkcCipnqMykvCc9cz1Lqxu2C+QQluG6ae58qu8xsA2kbNaNJ
 G7uget0uIgduU4E1FBQtA7m0mZ4ZFneTPaQNOCqEh2B4T6/qhp7ez4GP5ubAT5uBsh34F/
 KJAwivxS/MpVDmvdKw9juL3MWnMl3QY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-Egqz84dQMPuk6jo6wJJKcQ-1; Thu, 20 May 2021 13:05:38 -0400
X-MC-Unique: Egqz84dQMPuk6jo6wJJKcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AC79B1020C2E;
 Thu, 20 May 2021 17:05:37 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-166.ams2.redhat.com
 [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8844D5D6D5;
 Thu, 20 May 2021 17:05:36 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 5/9] vfio-ccw: Permit missing IRQs
Date: Thu, 20 May 2021 19:05:15 +0200
Message-Id: <20210520170519.300951-6-cohuck@redhat.com>
In-Reply-To: <20210520170519.300951-1-cohuck@redhat.com>
References: <20210520170519.300951-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric Farman <farman@linux.ibm.com>

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
Message-Id: <20210421152053.2379873-1-farman@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 hw/vfio/ccw.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/hw/vfio/ccw.c b/hw/vfio/ccw.c
index e752c845e9e4..7c058d13e8ce 100644
--- a/hw/vfio/ccw.c
+++ b/hw/vfio/ccw.c
@@ -411,8 +411,8 @@ static void vfio_ccw_register_irq_notifier(VFIOCCWDevice *vcdev,
     }
 
     if (vdev->num_irqs < irq + 1) {
-        error_setg(errp, "vfio: unexpected number of irqs %u",
-                   vdev->num_irqs);
+        error_setg(errp, "vfio: IRQ %u not available (number of irqs %u)",
+                   irq, vdev->num_irqs);
         return;
     }
 
@@ -695,13 +695,15 @@ static void vfio_ccw_realize(DeviceState *dev, Error **errp)
 
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
2.31.1


