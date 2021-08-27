Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE243F93D9
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:57:55 +0200 (CEST)
Received: from localhost ([::1]:46822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTwA-0005UN-St
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:57:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpT-0008Qt-UX
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50908)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpQ-0000xj-6D
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630039855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uMhKGLRAjuCGCEMJgfc2pOzJ0dST3KYaQ58TtBd+RDA=;
 b=PpRr1IwoYroGAfisZqBS0yP/UmGq0gWPeKHFygFtqtBLzFcB1qYoEdMQiwQB0BlJECE9wZ
 2nrVWAXgW1h4ywhB/3Sula4cY8zV0V3Ot9Wqs18O+tBepChrTS1BnKEwPF+8qdQELMXtiA
 7B3bRF5NGb+cJ/HGgMOoI47r2lkgLYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-ft_FYJHwOgyYC8bhIzhsUQ-1; Fri, 27 Aug 2021 00:50:53 -0400
X-MC-Unique: ft_FYJHwOgyYC8bhIzhsUQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B984C6409B;
 Fri, 27 Aug 2021 04:50:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 870F45D9C6;
 Fri, 27 Aug 2021 04:50:52 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A85D411380D5; Fri, 27 Aug 2021 06:50:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 13/15] vhost: Clean up how VhostOpts method
 vhost_backend_init() fails
Date: Fri, 27 Aug 2021 06:50:42 +0200
Message-Id: <20210827045044.388748-14-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-1-armbru@redhat.com>
References: <20210827045044.388748-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.742,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost_user_backend_init() can fail without setting an error.  Unclean.
Its caller vhost_dev_init() compensates by substituting a generic
error then.  Goes back to commit 28770ff935 "vhost: Distinguish errors
in vhost_backend_init()".

Clean up by moving the generic error from vhost_dev_init() to all the
failure paths that neglect to set an error.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210720125408.387910-14-armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/virtio/vhost-user.c | 6 ++++++
 hw/virtio/vhost.c      | 4 ----
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 229c114a19..2407836fac 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1876,6 +1876,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
 
     err = vhost_user_get_features(dev, &features);
     if (err < 0) {
+        error_setg_errno(errp, -err, "vhost_backend_init failed");
         return err;
     }
 
@@ -1885,6 +1886,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
         err = vhost_user_get_u64(dev, VHOST_USER_GET_PROTOCOL_FEATURES,
                                  &protocol_features);
         if (err < 0) {
+            error_setg_errno(errp, EPROTO, "vhost_backend_init failed");
             return -EPROTO;
         }
 
@@ -1903,6 +1905,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
 
         err = vhost_user_set_protocol_features(dev, dev->protocol_features);
         if (err < 0) {
+            error_setg_errno(errp, EPROTO, "vhost_backend_init failed");
             return -EPROTO;
         }
 
@@ -1911,6 +1914,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
             err = vhost_user_get_u64(dev, VHOST_USER_GET_QUEUE_NUM,
                                      &dev->max_queues);
             if (err < 0) {
+                error_setg_errno(errp, EPROTO, "vhost_backend_init failed");
                 return -EPROTO;
             }
         } else {
@@ -1940,6 +1944,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
         } else {
             err = vhost_user_get_max_memslots(dev, &ram_slots);
             if (err < 0) {
+                error_setg_errno(errp, EPROTO, "vhost_backend_init failed");
                 return -EPROTO;
             }
 
@@ -1966,6 +1971,7 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque,
     if (dev->vq_index == 0) {
         err = vhost_setup_slave_channel(dev);
         if (err < 0) {
+            error_setg_errno(errp, EPROTO, "vhost_backend_init failed");
             return -EPROTO;
         }
     }
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 88f8a397dc..3c0b537f89 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1289,7 +1289,6 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
                    VhostBackendType backend_type, uint32_t busyloop_timeout,
                    Error **errp)
 {
-    ERRP_GUARD();
     uint64_t features;
     int i, r, n_initialized_vqs = 0;
 
@@ -1301,9 +1300,6 @@ int vhost_dev_init(struct vhost_dev *hdev, void *opaque,
 
     r = hdev->vhost_ops->vhost_backend_init(hdev, opaque, errp);
     if (r < 0) {
-        if (!*errp) {
-            error_setg_errno(errp, -r, "vhost_backend_init failed");
-        }
         goto fail;
     }
 
-- 
2.31.1


