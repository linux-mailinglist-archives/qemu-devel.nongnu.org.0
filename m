Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 435003CFA06
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Jul 2021 15:02:44 +0200 (CEST)
Received: from localhost ([::1]:36320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5pOV-00028X-7B
	for lists+qemu-devel@lfdr.de; Tue, 20 Jul 2021 09:02:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGS-0004t3-Pw
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:56097)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1m5pGO-0008If-Jh
 for qemu-devel@nongnu.org; Tue, 20 Jul 2021 08:54:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626785660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5lcuUhLpFx5x66QANuw8RMIjKw5nsdw9ExuMGaIhc24=;
 b=MIA3R9y8Y72O9wWsMUS/P0HpbeF+HdOm5zoqUmNUTrvS+8XjlIIovGQL2dXLIPPDc72vPC
 ru9anzPe2X5x+CMVIlHLaQe9dKwPTRirNfds/164xai6XeJ7MGWeKUfew/mU9hNPyWFVbL
 ExbNl0A/P6YM/MXElqUuUt03JsUEUr0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-rOLH2m6hNRG-G4MxDYf4ig-1; Tue, 20 Jul 2021 08:54:18 -0400
X-MC-Unique: rOLH2m6hNRG-G4MxDYf4ig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B7A9D101F7A1
 for <qemu-devel@nongnu.org>; Tue, 20 Jul 2021 12:54:17 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-187.ams2.redhat.com
 [10.36.114.187])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 07F3F60C82;
 Tue, 20 Jul 2021 12:54:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 18B39112D850; Tue, 20 Jul 2021 14:54:09 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/16] vhost: Clean up how VhostOpts method vhost_get_config()
 fails
Date: Tue, 20 Jul 2021 14:54:04 +0200
Message-Id: <20210720125408.387910-13-armbru@redhat.com>
In-Reply-To: <20210720125408.387910-1-armbru@redhat.com>
References: <20210720125408.387910-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
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
Cc: Kevin Wolf <kwolf@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

vhost_user_get_config() can fail without setting an error.  Unclean.
Its caller vhost_dev_get_config() compensates by substituting a
generic error then.  Goes back to commit 50de51387f "vhost:
Distinguish errors in vhost_dev_get_config()".

Clean up by moving the generic error from vhost_dev_get_config() to
all the failure paths that neglect to set an error.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 hw/virtio/vhost-user.c |  2 ++
 hw/virtio/vhost.c      | 10 ++--------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 29ea2b4fce..dbbd6fbc25 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2139,10 +2139,12 @@ static int vhost_user_get_config(struct vhost_dev *dev, uint8_t *config,
     msg.payload.config.offset = 0;
     msg.payload.config.size = config_len;
     if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
+        error_setg_errno(errp, -EPROTO, "vhost_get_config failed");
         return -EPROTO;
     }
 
     if (vhost_user_read(dev, &msg) < 0) {
+        error_setg_errno(errp, -EPROTO, "vhost_get_config failed");
         return -EPROTO;
     }
 
diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index dbbc6b6915..88f8a397dc 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -1564,17 +1564,11 @@ void vhost_ack_features(struct vhost_dev *hdev, const int *feature_bits,
 int vhost_dev_get_config(struct vhost_dev *hdev, uint8_t *config,
                          uint32_t config_len, Error **errp)
 {
-    ERRP_GUARD();
-    int ret;
-
     assert(hdev->vhost_ops);
 
     if (hdev->vhost_ops->vhost_get_config) {
-        ret = hdev->vhost_ops->vhost_get_config(hdev, config, config_len, errp);
-        if (ret < 0 && !*errp) {
-            error_setg_errno(errp, -ret, "vhost_get_config failed");
-        }
-        return ret;
+        return hdev->vhost_ops->vhost_get_config(hdev, config, config_len,
+                                                 errp);
     }
 
     error_setg(errp, "vhost_get_config not implemented");
-- 
2.31.1


