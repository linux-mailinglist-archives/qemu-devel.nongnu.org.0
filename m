Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F3332BB4EA
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 20:13:54 +0100 (CET)
Received: from localhost ([::1]:48284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgBqz-0006sT-9L
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 14:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBXW-0005Zd-T7
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:53:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28328)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1kgBXV-0007Nc-16
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 13:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605898421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=geMra6s2mk7qQGmiDf6FdjeAxAi7bQOlm3m+XgBp7eM=;
 b=doo1gPHiehCgbvYbC7n4JtUOXU1SKlYIGsMxxgpX762R/iLEILbNqI9kjY8c1bgFiF4fwF
 +GzH2SO2oJVefAWUhL2bKcJa41ENAj9X6S8wlaLDNZGqlmz/lF8BJZa6C59HJ5wXKALvuT
 WGkO28UOlo2LVEU2ocwgD49aklphrBE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-O0I0LkrQMrGPImdL7SOirQ-1; Fri, 20 Nov 2020 13:53:39 -0500
X-MC-Unique: O0I0LkrQMrGPImdL7SOirQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 437D1801AF1;
 Fri, 20 Nov 2020 18:53:36 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-112-88.ams2.redhat.com [10.36.112.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97F395C1D5;
 Fri, 20 Nov 2020 18:53:24 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 10/27] vhost: Allocate shadow vring
Date: Fri, 20 Nov 2020 19:50:48 +0100
Message-Id: <20201120185105.279030-11-eperezma@redhat.com>
In-Reply-To: <20201120185105.279030-1-eperezma@redhat.com>
References: <20201120185105.279030-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
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
Cc: kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Daniel Daly <dandaly0@gmail.com>,
 virtualization@lists.linux-foundation.org, Liran Alon <liralon@gmail.com>,
 Eli Cohen <eli@mellanox.com>, Nitin Shrivastav <nitin.shrivastav@broadcom.com>,
 Alex Barba <alex.barba@broadcom.com>,
 Christophe Fontaine <cfontain@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Lee Ballard <ballle98@gmail.com>, Lars Ganrot <lars.ganrot@gmail.com>,
 Rob Miller <rob.miller@broadcom.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Howard Cai <howard.cai@gmail.com>, Parav Pandit <parav@mellanox.com>,
 vm <vmireyno@marvell.com>, Salil Mehta <mehta.salil.lnk@gmail.com>,
 Stephen Finucane <stephenfin@redhat.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Sean Mooney <smooney@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Jim Harford <jim.harford@broadcom.com>,
 Dmytro Kazantsev <dmytro.kazantsev@gmail.com>, Siwei Liu <loseweigh@gmail.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Michael Lilja <ml@napatech.com>,
 Max Gurtovoy <maxgu14@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-sw-lm-ring.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-sw-lm-ring.c b/hw/virtio/vhost-sw-lm-ring.c
index cbf53965cd..cd7b5ba772 100644
--- a/hw/virtio/vhost-sw-lm-ring.c
+++ b/hw/virtio/vhost-sw-lm-ring.c
@@ -16,8 +16,11 @@
 #include "qemu/event_notifier.h"
 
 typedef struct VhostShadowVirtqueue {
+    struct vring vring;
     EventNotifier hdev_notifier;
     VirtQueue *vq;
+
+    vring_desc_t descs[];
 } VhostShadowVirtqueue;
 
 static inline bool vhost_vring_should_kick(VhostShadowVirtqueue *vq)
@@ -37,10 +40,12 @@ VhostShadowVirtqueue *vhost_sw_lm_shadow_vq(struct vhost_dev *dev, int idx)
         .index = idx
     };
     VirtQueue *vq = virtio_get_queue(dev->vdev, idx);
+    unsigned num = virtio_queue_get_num(dev->vdev, idx);
+    size_t ring_size = vring_size(num, VRING_DESC_ALIGN_SIZE);
     VhostShadowVirtqueue *svq;
     int r;
 
-    svq = g_new0(VhostShadowVirtqueue, 1);
+    svq = g_malloc0(sizeof(*svq) + ring_size);
     svq->vq = vq;
 
     r = event_notifier_init(&svq->hdev_notifier, 0);
-- 
2.18.4


