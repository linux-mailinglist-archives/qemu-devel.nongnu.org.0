Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C500B3F93DF
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Aug 2021 06:59:58 +0200 (CEST)
Received: from localhost ([::1]:53642 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJTxp-0001aI-Rs
	for lists+qemu-devel@lfdr.de; Fri, 27 Aug 2021 00:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpV-0008SI-Py
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mJTpP-0000x4-SU
 for qemu-devel@nongnu.org; Fri, 27 Aug 2021 00:51:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630039855;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbP8ehGUI+ZOMO7IyFP6ePTXBQRiVQ0KsBAVyiE8Yz0=;
 b=HsBCKK+TgqfaJKWk+13vMGWgbO57dre3uy8dntANH/maw25Fcez5PLJop21f1lZz4cY1IJ
 m8ZwfXnfDNdvpuphFRUf2ohYkjCUR6bV35hD2QOe9AIROJeZGA0zGl+bwrZCA0ML9xA6CH
 6G/KIS8u2Vw76d/LSaJ3KH1OtPQAWRc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-187-7xo7t6cfMlykd4Fu1J4kqQ-1; Fri, 27 Aug 2021 00:50:53 -0400
X-MC-Unique: 7xo7t6cfMlykd4Fu1J4kqQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C3C81008066;
 Fri, 27 Aug 2021 04:50:52 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-4.ams2.redhat.com [10.36.112.4])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DDC261002F12;
 Fri, 27 Aug 2021 04:50:51 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id A50FC11380D0; Fri, 27 Aug 2021 06:50:44 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/15] vhost: Clean up how VhostOpts method vhost_get_config()
 fails
Date: Fri, 27 Aug 2021 06:50:41 +0200
Message-Id: <20210827045044.388748-13-armbru@redhat.com>
In-Reply-To: <20210827045044.388748-1-armbru@redhat.com>
References: <20210827045044.388748-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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

vhost_user_get_config() can fail without setting an error.  Unclean.
Its caller vhost_dev_get_config() compensates by substituting a
generic error then.  Goes back to commit 50de51387f "vhost:
Distinguish errors in vhost_dev_get_config()".

Clean up by moving the generic error from vhost_dev_get_config() to
all the failure paths that neglect to set an error.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
Message-Id: <20210720125408.387910-13-armbru@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
[Sign of error_setg_errno()'s second argument fixed in both calls]
---
 hw/virtio/vhost-user.c |  2 ++
 hw/virtio/vhost.c      | 10 ++--------
 2 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index aec6cc1990..229c114a19 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -2139,10 +2139,12 @@ static int vhost_user_get_config(struct vhost_dev *dev, uint8_t *config,
     msg.payload.config.offset = 0;
     msg.payload.config.size = config_len;
     if (vhost_user_write(dev, &msg, NULL, 0) < 0) {
+        error_setg_errno(errp, EPROTO, "vhost_get_config failed");
         return -EPROTO;
     }
 
     if (vhost_user_read(dev, &msg) < 0) {
+        error_setg_errno(errp, EPROTO, "vhost_get_config failed");
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


