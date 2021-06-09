Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 811A43A1A46
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 17:57:48 +0200 (CEST)
Received: from localhost ([::1]:46120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr0aR-0005Mo-H4
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 11:57:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QW-0007mf-Ex
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lr0QR-0003b7-Jh
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 11:47:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623253647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sorXIMPWrawIKyHExPP4hkOJoQqX3bYITQsH4ecnDV0=;
 b=N2+LCiYE0f4ulvdQSanm6QrLnDhPy7tGJYr9X9jQz6Kowt6dVQaPpPrENX09pL7dhBDDNI
 HTJ5KN7f29lNjWZ9CROc1tQf82XwGT+z1rk5RqteDJPV+JpjJ8rrUbSv1Geyistj0XI41+
 /iWxTgVdm6V9tJbMuSBZ7GoVXcPUXE8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-592-65Us_LKMOSqtqUPFDMy_Uw-1; Wed, 09 Jun 2021 11:47:25 -0400
X-MC-Unique: 65Us_LKMOSqtqUPFDMy_Uw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C758A100A44B;
 Wed,  9 Jun 2021 15:47:24 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-230.ams2.redhat.com [10.36.114.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AB3F160C04;
 Wed,  9 Jun 2021 15:47:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 7/7] vhost-user-blk: Implement reconnection during realize
Date: Wed,  9 Jun 2021 17:46:58 +0200
Message-Id: <20210609154658.350308-8-kwolf@redhat.com>
In-Reply-To: <20210609154658.350308-1-kwolf@redhat.com>
References: <20210609154658.350308-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Cc: kwolf@redhat.com, raphael.norwitz@nutanix.com, qemu-devel@nongnu.org,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit dabefdd6 removed code that was supposed to try reconnecting
during .realize(), but actually just crashed and had several design
problems.

This adds the feature back without the crash in simple cases while also
fixing some design problems: Reconnection is now only tried if there was
a problem with the connection and not an error related to the content
(which would fail again the same way in the next attempt). Reconnection
is limited to three attempts (four with the initial attempt) so that we
won't end up in an infinite loop if a problem is permanent. If the
backend restarts three times in the very short time window of device
initialisation, we have bigger problems and erroring out is the right
course of action.

In the case that a connection error occurs and we reconnect, the error
message is printed using error_report_err(), but otherwise ignored.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/vhost-user-blk.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index e49d2e4c83..f75a42bc62 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -455,8 +455,10 @@ static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
 
 static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_GUARD();
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    int retries;
     int i, ret;
 
     if (!s->chardev.chr) {
@@ -498,7 +500,17 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
     s->inflight = g_new0(struct vhost_inflight, 1);
     s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
 
-    ret = vhost_user_blk_realize_connect(s, errp);
+    retries = 3;
+    assert(!*errp);
+    do {
+        if (*errp) {
+            error_prepend(errp, "Reconnecting after error: ");
+            error_report_err(*errp);
+            *errp = NULL;
+        }
+        ret = vhost_user_blk_realize_connect(s, errp);
+    } while (ret == -EPROTO && retries--);
+
     if (ret < 0) {
         goto virtio_err;
     }
-- 
2.30.2


