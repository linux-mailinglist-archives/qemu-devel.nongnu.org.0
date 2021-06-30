Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6231C3B8713
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 18:29:27 +0200 (CEST)
Received: from localhost ([::1]:52754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyd5a-0001C1-Fn
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 12:29:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycgH-0003J2-JH
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49315)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lycfu-0007DO-Tr
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 12:03:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625068973;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WgIVAzybn4sBLVdmGsnWr0e6+AwqrdPF9mwTWyWpiVU=;
 b=d8oqhk61XSIC14e8pXwfogCGGA/hPRMzzlwm431kJF2xEQV+QeAxQDh2Z+W48Vl7N+Ml+x
 oxYBLxGFQC26EjzCXY/vHIf9/QbXGL0CBzMwThtOPBTmpURqVojucq3XkgnP8syYr3tgF4
 /NJay5X0JvDvquyDmxnrBu8WheoybdY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-123-AWCQ4mqKPACx8Z9_1xzZiQ-1; Wed, 30 Jun 2021 12:02:42 -0400
X-MC-Unique: AWCQ4mqKPACx8Z9_1xzZiQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4B7DB10C1ADC;
 Wed, 30 Jun 2021 16:02:41 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-114.ams2.redhat.com [10.36.114.114])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 59C7518AAB;
 Wed, 30 Jun 2021 16:02:40 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 24/24] vhost-user-blk: Implement reconnection during realize
Date: Wed, 30 Jun 2021 18:02:06 +0200
Message-Id: <20210630160206.276439-25-kwolf@redhat.com>
In-Reply-To: <20210630160206.276439-1-kwolf@redhat.com>
References: <20210630160206.276439-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
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
Message-Id: <20210609154658.350308-8-kwolf@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 hw/block/vhost-user-blk.c | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index e49d2e4c83..ba13cb87e5 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -31,6 +31,8 @@
 #include "sysemu/sysemu.h"
 #include "sysemu/runstate.h"
 
+#define REALIZE_CONNECTION_RETRIES 3
+
 static const int user_feature_bits[] = {
     VIRTIO_BLK_F_SIZE_MAX,
     VIRTIO_BLK_F_SEG_MAX,
@@ -455,8 +457,10 @@ static int vhost_user_blk_realize_connect(VHostUserBlk *s, Error **errp)
 
 static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
 {
+    ERRP_GUARD();
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VHostUserBlk *s = VHOST_USER_BLK(vdev);
+    int retries;
     int i, ret;
 
     if (!s->chardev.chr) {
@@ -498,7 +502,17 @@ static void vhost_user_blk_device_realize(DeviceState *dev, Error **errp)
     s->inflight = g_new0(struct vhost_inflight, 1);
     s->vhost_vqs = g_new0(struct vhost_virtqueue, s->num_queues);
 
-    ret = vhost_user_blk_realize_connect(s, errp);
+    retries = REALIZE_CONNECTION_RETRIES;
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
2.31.1


