Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B20D35E2BC
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 17:24:56 +0200 (CEST)
Received: from localhost ([::1]:43524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWKuN-00058T-KL
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 11:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWKsY-0003hl-VW
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:23:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lWKsX-0005VL-FR
 for qemu-devel@nongnu.org; Tue, 13 Apr 2021 11:23:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618327377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RbroG03p+BFPKzz6univLda0Lqb/qYdyuKjR0Hy0uck=;
 b=ZPAoDqXrub0fRZiuplB6TXF6APV/4dEq7xlAkTeiFBiZtO6cJxYNHDMyvpH/7tyAlTIVLb
 D0GW8iTDFsDAot3QJgNhTVooa3tRpYzstAPBmp7eWh5cSxph52bPvz/bSu/u/F5Nbw3PPQ
 DqqIML6Xn5DwHGAmvx/ZkJ7zS1iTMD8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-IcALQe-cNiGwrZNz17O4ew-1; Tue, 13 Apr 2021 11:22:55 -0400
X-MC-Unique: IcALQe-cNiGwrZNz17O4ew-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3EDC5107ACCD;
 Tue, 13 Apr 2021 15:22:54 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-115-31.ams2.redhat.com
 [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5DB2360C04;
 Tue, 13 Apr 2021 15:22:53 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org,
	antonkuchin@yandex-team.ru
Subject: [PULL 1/1] vhost-user-fs: fix features handling
Date: Tue, 13 Apr 2021 16:22:46 +0100
Message-Id: <20210413152246.72950-2-dgilbert@redhat.com>
In-Reply-To: <20210413152246.72950-1-dgilbert@redhat.com>
References: <20210413152246.72950-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Anton Kuchin <antonkuchin@yandex-team.ru>

Make virtio-fs take into account server capabilities.

Just returning requested features assumes they all of then are implemented
by server and results in setting unsupported configuration if some of them
are absent.

Signed-off-by: Anton Kuchin <antonkuchin@yandex-team.ru>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  With changes suggested by Stefan
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 hw/virtio/vhost-user-fs.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/hw/virtio/vhost-user-fs.c b/hw/virtio/vhost-user-fs.c
index ac4fc34b36..6f7f91533d 100644
--- a/hw/virtio/vhost-user-fs.c
+++ b/hw/virtio/vhost-user-fs.c
@@ -24,6 +24,17 @@
 #include "monitor/monitor.h"
 #include "sysemu/sysemu.h"
 
+static const int user_feature_bits[] = {
+    VIRTIO_F_VERSION_1,
+    VIRTIO_RING_F_INDIRECT_DESC,
+    VIRTIO_RING_F_EVENT_IDX,
+    VIRTIO_F_NOTIFY_ON_EMPTY,
+    VIRTIO_F_RING_PACKED,
+    VIRTIO_F_IOMMU_PLATFORM,
+
+    VHOST_INVALID_FEATURE_BIT
+};
+
 static void vuf_get_config(VirtIODevice *vdev, uint8_t *config)
 {
     VHostUserFS *fs = VHOST_USER_FS(vdev);
@@ -129,11 +140,12 @@ static void vuf_set_status(VirtIODevice *vdev, uint8_t status)
 }
 
 static uint64_t vuf_get_features(VirtIODevice *vdev,
-                                      uint64_t requested_features,
-                                      Error **errp)
+                                 uint64_t features,
+                                 Error **errp)
 {
-    /* No feature bits used yet */
-    return requested_features;
+    VHostUserFS *fs = VHOST_USER_FS(vdev);
+
+    return vhost_get_features(&fs->vhost_dev, user_feature_bits, features);
 }
 
 static void vuf_handle_output(VirtIODevice *vdev, VirtQueue *vq)
-- 
2.31.1


