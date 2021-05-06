Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 965AD3757EB
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 17:51:16 +0200 (CEST)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1legHT-0000Jm-L7
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 11:51:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legBH-0002Da-Ph
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1legBA-0002tp-0G
 for qemu-devel@nongnu.org; Thu, 06 May 2021 11:44:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620315883;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eVgkP3k3sudJ8fikseFDD2xu+M6/fUwSZ2poOjDjCGw=;
 b=BQSL+Z7hM8TBOWHFMCwjyWFtUaG3EGEEm8TTB4w4hMESQrvcLnLQ5WowVCxf16Caw6pBvK
 yob7pWLzFscZK2iI8Whqt5vfeQ97f6L1AG3AH8fHHZ/97gxCamsEAP89chUeRx3XmKsA1Z
 Hm0YkUa27ecj8/CHBoslT0yvue6zMS4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-ouxsr9EVPfaPNCOegDN1HQ-1; Thu, 06 May 2021 11:44:41 -0400
X-MC-Unique: ouxsr9EVPfaPNCOegDN1HQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 60300801B12;
 Thu,  6 May 2021 15:44:40 +0000 (UTC)
Received: from gondolin.redhat.com (ovpn-113-111.ams2.redhat.com
 [10.36.113.111])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 37A36620DE;
 Thu,  6 May 2021 15:44:39 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 5/7] vfio-ccw: Permit missing IRQs
Date: Thu,  6 May 2021 17:44:21 +0200
Message-Id: <20210506154423.459930-6-cohuck@redhat.com>
In-Reply-To: <20210506154423.459930-1-cohuck@redhat.com>
References: <20210506154423.459930-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
2.30.2


