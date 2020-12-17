Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78BD42DD475
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 16:43:21 +0100 (CET)
Received: from localhost ([::1]:46550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpvR2-0001Eh-Hc
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 10:43:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpumA-0004LW-6Q
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:01:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kpulz-0007ra-8i
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 10:01:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608217251;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gxMQKtmTiYrrnOK3gDk/IeCeokmQ4smxQbGkg4S2Lbg=;
 b=P8SLBn1o0Pt+pnLj7ZzAoCWEBqvW09//xAKM9Je0hTWREz4Ie1ZlBvohqapdkk3KQUpS8O
 tmb6kIJdIsb+52VUKGUvfDbDbkxMGf+C7FL8cmNMFCoYkbdUVfl8ooGuBwzRIKpdLH59x8
 wT5cy6y+ZOPW9sFViWSjRGyX0myZbWY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-489-hR3LRnEkMm6XIfax-5vrMA-1; Thu, 17 Dec 2020 10:00:49 -0500
X-MC-Unique: hR3LRnEkMm6XIfax-5vrMA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9028A107ACF7;
 Thu, 17 Dec 2020 15:00:48 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.35.206.213])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0535A5D9CD;
 Thu, 17 Dec 2020 15:00:46 +0000 (UTC)
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] scsi: virtio-scsi: don't process IO on fenced dataplane
Date: Thu, 17 Dec 2020 17:00:38 +0200
Message-Id: <20201217150040.906961-2-mlevitsk@redhat.com>
In-Reply-To: <20201217150040.906961-1-mlevitsk@redhat.com>
References: <20201217150040.906961-1-mlevitsk@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Maxim Levitsky <mlevitsk@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If virtio_scsi_dataplane_start fails, there is a small window when it drops the
aio lock (in aio_wait_bh_oneshot) and the dataplane's AIO handler can
still run during that window.

This is done after the dataplane was marked as fenced, thus we use this flag
to avoid it doing any IO.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
---
 hw/scsi/virtio-scsi-dataplane.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/hw/scsi/virtio-scsi-dataplane.c b/hw/scsi/virtio-scsi-dataplane.c
index b995bab3a2..2824a25b65 100644
--- a/hw/scsi/virtio-scsi-dataplane.c
+++ b/hw/scsi/virtio-scsi-dataplane.c
@@ -56,8 +56,10 @@ static bool virtio_scsi_data_plane_handle_cmd(VirtIODevice *vdev,
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
-    assert(s->ctx && s->dataplane_started);
-    progress = virtio_scsi_handle_cmd_vq(s, vq);
+    if (!s->dataplane_fenced) {
+        assert(s->ctx && s->dataplane_started);
+        progress = virtio_scsi_handle_cmd_vq(s, vq);
+    }
     virtio_scsi_release(s);
     return progress;
 }
@@ -69,8 +71,10 @@ static bool virtio_scsi_data_plane_handle_ctrl(VirtIODevice *vdev,
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
-    assert(s->ctx && s->dataplane_started);
-    progress = virtio_scsi_handle_ctrl_vq(s, vq);
+    if (!s->dataplane_fenced) {
+        assert(s->ctx && s->dataplane_started);
+        progress = virtio_scsi_handle_ctrl_vq(s, vq);
+    }
     virtio_scsi_release(s);
     return progress;
 }
@@ -82,8 +86,10 @@ static bool virtio_scsi_data_plane_handle_event(VirtIODevice *vdev,
     VirtIOSCSI *s = VIRTIO_SCSI(vdev);
 
     virtio_scsi_acquire(s);
-    assert(s->ctx && s->dataplane_started);
-    progress = virtio_scsi_handle_event_vq(s, vq);
+    if (!s->dataplane_fenced) {
+        assert(s->ctx && s->dataplane_started);
+        progress = virtio_scsi_handle_event_vq(s, vq);
+    }
     virtio_scsi_release(s);
     return progress;
 }
-- 
2.26.2


