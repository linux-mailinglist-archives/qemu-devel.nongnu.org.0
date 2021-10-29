Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 856244402B6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 21:01:54 +0200 (CEST)
Received: from localhost ([::1]:51092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgX8T-0003W6-KF
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 15:01:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWpK-0000go-1Q
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:42:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38361)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1mgWpI-0001u7-Hd
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 14:42:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635532924;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NCXt7DCFCorau/0NjCbZt7WxBnJRF287pNQ5VjnhGA=;
 b=WDX1EiV3iJZdNAI6mj8p5Q7gGmf/PRgn8kxHSlP5CyOMuEv4LO+oPvRmZEwvFuzuqKN8w/
 NOgtzp11FdUh1JHot533DsLKifbPIRg1TJiuF3H+oWpXAgPgZAdDeBbS/sbzFEXLLVa5P4
 CiwVSSF1F6viFH4PRW/mtZpq5FXIr3o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-842dOc8tOpi2zVcmDFnv_w-1; Fri, 29 Oct 2021 14:42:01 -0400
X-MC-Unique: 842dOc8tOpi2zVcmDFnv_w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AB9C28066F9;
 Fri, 29 Oct 2021 18:41:59 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF3255D6CF;
 Fri, 29 Oct 2021 18:41:39 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 16/26] vhost-vdpa: Take into account SVQ in
 vhost_vdpa_set_vring_call
Date: Fri, 29 Oct 2021 20:35:15 +0200
Message-Id: <20211029183525.1776416-17-eperezma@redhat.com>
In-Reply-To: <20211029183525.1776416-1-eperezma@redhat.com>
References: <20211029183525.1776416-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 64f71bd51b..89d77f3452 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -758,16 +758,27 @@ static int vhost_vdpa_set_vring_kick(struct vhost_dev *dev,
     }
 }
 
+static int vhost_vdpa_set_vring_dev_call(struct vhost_dev *dev,
+                                         struct vhost_vring_file *file)
+{
+    trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
+    return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
+}
+
 static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
                                        struct vhost_vring_file *file)
 {
     struct vhost_vdpa *v = dev->opaque;
     int vdpa_idx = vhost_vdpa_get_vq_index(dev, file->index);
 
-    trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
-
     v->call_fd[vdpa_idx] = file->fd;
-    return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
+    if (v->shadow_vqs_enabled) {
+        VhostShadowVirtqueue *svq = g_ptr_array_index(v->shadow_vqs, vdpa_idx);
+        vhost_svq_set_guest_call_notifier(svq, file->fd);
+        return 0;
+    } else {
+        return vhost_vdpa_set_vring_dev_call(dev, file);
+    }
 }
 
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
-- 
2.27.0


