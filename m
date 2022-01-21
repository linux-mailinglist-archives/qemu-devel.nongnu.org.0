Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 074C74966BA
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 22:03:06 +0100 (CET)
Received: from localhost ([::1]:46106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nB13o-0005w4-QC
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 16:03:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0b2-0007ip-Tx
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:33:22 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37651)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nB0b0-0004eJ-Vq
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 15:33:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642797187;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpVBSmi8b+5c9eY3V8MzBirBYLy/emMG/e8Cfu5oI5E=;
 b=A3TDvHC9vYsxyFUBHS0Mc5ok6A14lFa08WXiXYyg5bDc6ygOk6Bkuld8Fsduq5C/JIdBp/
 yEJ/EKb32XHNLnAsKh5OZOTcWmywcJexmRmuzSIZK2Xd0fkT1d2WsmXWylT3ppr+ZY4FGR
 +nh3eWnAmBiUKSBfCP4WxoSw/9py59s=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-636-AYuvous5O_CxpgDHr9DRww-1; Fri, 21 Jan 2022 15:33:02 -0500
X-MC-Unique: AYuvous5O_CxpgDHr9DRww-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33B308143F3;
 Fri, 21 Jan 2022 20:33:01 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC40F194B9;
 Fri, 21 Jan 2022 20:32:55 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/31] vhost: pass queue index to vhost_vq_get_addr
Date: Fri, 21 Jan 2022 21:27:18 +0100
Message-Id: <20220121202733.404989-17-eperezma@redhat.com>
In-Reply-To: <20220121202733.404989-1-eperezma@redhat.com>
References: <20220121202733.404989-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 virtualization@lists.linux-foundation.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Xiao W Wang <xiao.w.wang@intel.com>,
 Peter Xu <peterx@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eric Blake <eblake@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Doing that way allows vhost backend to know what address to return.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index 7b03efccec..64b955ba0c 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -798,9 +798,10 @@ static int vhost_virtqueue_set_addr(struct vhost_dev *dev,
                                     struct vhost_virtqueue *vq,
                                     unsigned idx, bool enable_log)
 {
-    struct vhost_vring_addr addr;
+    struct vhost_vring_addr addr = {
+        .index = idx,
+    };
     int r;
-    memset(&addr, 0, sizeof(struct vhost_vring_addr));
 
     if (dev->vhost_ops->vhost_vq_get_addr) {
         r = dev->vhost_ops->vhost_vq_get_addr(dev, &addr, vq);
@@ -813,7 +814,6 @@ static int vhost_virtqueue_set_addr(struct vhost_dev *dev,
         addr.avail_user_addr = (uint64_t)(unsigned long)vq->avail;
         addr.used_user_addr = (uint64_t)(unsigned long)vq->used;
     }
-    addr.index = idx;
     addr.log_guest_addr = vq->used_phys;
     addr.flags = enable_log ? (1 << VHOST_VRING_F_LOG) : 0;
     r = dev->vhost_ops->vhost_set_vring_addr(dev, &addr);
-- 
2.27.0


