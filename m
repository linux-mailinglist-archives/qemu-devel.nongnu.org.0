Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5A3380EB0
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:17:50 +0200 (CEST)
Received: from localhost ([::1]:46692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbRd-0007bm-GP
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:17:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajq-0000Zz-OT
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lhajd-0001GO-8V
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:32:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621009935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GgUrS2r3awA/KFO6TXGB+76W7/u50x+SntjQdlilQyQ=;
 b=RQ6b6Gn5eMD7LMP0GWL14/JRrMA05N6NgaNmBU4qPzzLF9GgwCH5J2TdzIPlAODrHCDuhN
 xeHxlc+mimyZXWQcJya1pm7lErsVk6jy2QnSmberch0KSp+LPs48Po5GOf4JNn6L+6Q2zZ
 DgvGwBB4fslnHrMheFYmMCTxUdzwra8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-O-8sJUM1McaV00swQb-beg-1; Fri, 14 May 2021 12:32:13 -0400
X-MC-Unique: O-8sJUM1McaV00swQb-beg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC8171009446;
 Fri, 14 May 2021 16:32:12 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-116.ams2.redhat.com [10.36.114.116])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CBDF41971B;
 Fri, 14 May 2021 16:32:11 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 14/14] vhost-user-blk: Check that num-queues is supported by
 backend
Date: Fri, 14 May 2021 18:31:24 +0200
Message-Id: <20210514163124.251741-15-kwolf@redhat.com>
In-Reply-To: <20210514163124.251741-1-kwolf@redhat.com>
References: <20210514163124.251741-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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

Creating a device with a number of queues that isn't supported by the
backend is pointless, the device won't work properly and the error
messages are rather confusing.

Just fail to create the device if num-queues is higher than what the
backend supports.

Since the relationship between num-queues and the number of virtqueues
depends on the specific device, this is an additional value that needs
to be initialised by the device. For convenience, allow leaving it 0 if
the check should be skipped. This makes sense for vhost-user-net where
separate vhost devices are used for the queues and custom initialisation
code is needed to perform the check.

Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=1935031
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
Message-Id: <20210429171316.162022-7-kwolf@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/hw/virtio/vhost.h | 2 ++
 hw/block/vhost-user-blk.c | 1 +
 hw/virtio/vhost-user.c    | 5 +++++
 3 files changed, 8 insertions(+)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 4a8bc75415..21a9a52088 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -74,6 +74,8 @@ struct vhost_dev {
     int nvqs;
     /* the first virtqueue which would be used by this vhost dev */
     int vq_index;
+    /* if non-zero, minimum required value for max_queues */
+    int num_queues;
     uint64_t features;
     uint64_t acked_features;
     uint64_t backend_features;
diff --git a/hw/block/vhost-user-blk.c b/hw/block/vhost-user-blk.c
index c7e502f4c7..c6210fad0c 100644
--- a/hw/block/vhost-user-blk.c
+++ b/hw/block/vhost-user-blk.c
@@ -324,6 +324,7 @@ static int vhost_user_blk_connect(DeviceState *dev, Error **errp)
     }
     s->connected = true;
 
+    s->dev.num_queues = s->num_queues;
     s->dev.nvqs = s->num_queues;
     s->dev.vqs = s->vhost_vqs;
     s->dev.vq_index = 0;
diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index ded0c10453..ee57abe045 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1909,6 +1909,11 @@ static int vhost_user_backend_init(struct vhost_dev *dev, void *opaque)
                 return err;
             }
         }
+        if (dev->num_queues && dev->max_queues < dev->num_queues) {
+            error_report("The maximum number of queues supported by the "
+                         "backend is %" PRIu64, dev->max_queues);
+            return -EINVAL;
+        }
 
         if (virtio_has_feature(features, VIRTIO_F_IOMMU_PLATFORM) &&
                 !(virtio_has_feature(dev->protocol_features,
-- 
2.30.2


