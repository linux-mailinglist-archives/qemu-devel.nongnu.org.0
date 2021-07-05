Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1383BC22B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Jul 2021 19:17:12 +0200 (CEST)
Received: from localhost ([::1]:39544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m0SDW-0006yu-WC
	for lists+qemu-devel@lfdr.de; Mon, 05 Jul 2021 13:17:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0SBQ-0005kY-2o
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 13:15:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1m0SBM-0000g9-Px
 for qemu-devel@nongnu.org; Mon, 05 Jul 2021 13:14:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625505295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XC52HEz7eSHR68EcN173gKQcfxMJVw6NwXfejWE9kwY=;
 b=IY2Zdk13y/hgDDu1kOxGlOc7s2eru/RBNBDcECmFtAGcxzUy2s3KcrRiQ2Hn13I3V+W2QV
 Mm/I4q2eAEPWsA6mzMMAWuatpn4lyFyirKM0eocrnk/If0x/6qHTNhOonK6MxEXbu6UZr6
 nh13uCtf/UJ4D7TQ79/IlBnvZA6U9hw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-144-Ij2Jhng5NWmt84jx8MilVQ-1; Mon, 05 Jul 2021 13:14:54 -0400
X-MC-Unique: Ij2Jhng5NWmt84jx8MilVQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5152E100C609;
 Mon,  5 Jul 2021 17:14:53 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-44.ams2.redhat.com [10.36.114.44])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF61E2EB07;
 Mon,  5 Jul 2021 17:14:48 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] vhost-user: Fix backends without multiqueue support
Date: Mon,  5 Jul 2021 19:14:29 +0200
Message-Id: <20210705171429.29286-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.442,
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
Cc: kwolf@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 raphael.norwitz@nutanix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

dev->max_queues was never initialised for backends that don't support
VHOST_USER_PROTOCOL_F_MQ, so it would use 0 as the maximum number of
queues to check against and consequently fail for any such backend.

Set it to 1 if the backend doesn't have multiqueue support.

Fixes: c90bd505a3e8210c23d69fecab9ee6f56ec4a161
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/virtio/vhost-user.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 1ac4a2ebec..29ea2b4fce 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1913,7 +1913,10 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
             if (err < 0) {
                 return -EPROTO;
             }
+        } else {
+            dev->max_queues = 1;
         }
+
         if (dev->num_queues && dev->max_queues < dev->num_queues) {
             error_setg(errp, "The maximum number of queues supported by the "
                        "backend is %" PRIu64, dev->max_queues);
-- 
2.31.1


