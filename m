Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84C5575C52
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jul 2022 09:29:19 +0200 (CEST)
Received: from localhost ([::1]:36726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oCFlG-0003Al-Ma
	for lists+qemu-devel@lfdr.de; Fri, 15 Jul 2022 03:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55736)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCFhP-0007KE-Ex
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 03:25:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46585)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oCFhM-00010v-VK
 for qemu-devel@nongnu.org; Fri, 15 Jul 2022 03:25:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657869916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z+MoXENGTkhfESSUfSq/nhfoGvDVnmIdW2wYR+F4SKg=;
 b=dFA2yZWUCPiXWduqeE8vDRZkABjZV1iQCgpF2XnOlYXNxmZRYitsTY81yPWc89+qCD2VN8
 ZdvnMvvMBmbzCd2fhdmQNySDsSAPR0PaQH0DbBj4paiH8qfLiMg7E3joJq20P6YNJQJG19
 a5FogHBzkpMRP+9wsnwW8NNJbsCXDtg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-455-pLuNtR6NNXmIVfWXGdWJ_w-1; Fri, 15 Jul 2022 03:25:13 -0400
X-MC-Unique: pLuNtR6NNXmIVfWXGdWJ_w-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4B16C101A586
 for <qemu-devel@nongnu.org>; Fri, 15 Jul 2022 07:25:13 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.117])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7573B2166B26;
 Fri, 15 Jul 2022 07:25:12 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH 2/2] vhost: Move SVQ queue rewind to the destination
Date: Fri, 15 Jul 2022 09:25:07 +0200
Message-Id: <20220715072507.2600431-3-eperezma@redhat.com>
In-Reply-To: <20220715072507.2600431-1-eperezma@redhat.com>
References: <20220715072507.2600431-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Migration with SVQ already migrate the inflight descriptors, so the
destination can perform the work.

This makes easier to migrate between backends or to recover them in
vhost devices that support set in flight descriptors.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 18820498b3..4458c8d23e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1178,7 +1178,18 @@ static int vhost_vdpa_set_vring_base(struct vhost_dev *dev,
                                        struct vhost_vring_state *ring)
 {
     struct vhost_vdpa *v = dev->opaque;
+    VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
 
+    /*
+     * vhost-vdpa devices does not support in-flight requests. Set all of them
+     * as available.
+     *
+     * TODO: This is ok for networking, but other kinds of devices might
+     * have problems with these retransmissions.
+     */
+    while (virtqueue_rewind(vq, 1)) {
+        continue;
+    }
     if (v->shadow_vqs_enabled) {
         /*
          * Device vring base was set at device start. SVQ base is handled by
@@ -1197,19 +1208,6 @@ static int vhost_vdpa_get_vring_base(struct vhost_dev *dev,
     int ret;
 
     if (v->shadow_vqs_enabled) {
-        VirtQueue *vq = virtio_get_queue(dev->vdev, ring->index);
-
-        /*
-         * Setting base as last used idx, so destination will see as available
-         * all the entries that the device did not use, including the in-flight
-         * processing ones.
-         *
-         * TODO: This is ok for networking, but other kinds of devices might
-         * have problems with these retransmissions.
-         */
-        while (virtqueue_rewind(vq, 1)) {
-            continue;
-        }
         ring->num = virtio_queue_get_last_avail_idx(dev->vdev, ring->index);
         return 0;
     }
-- 
2.31.1


