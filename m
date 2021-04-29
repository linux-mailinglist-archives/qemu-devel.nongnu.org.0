Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835DF36EEBB
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 19:18:55 +0200 (CEST)
Received: from localhost ([::1]:46176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcAJS-00039V-5G
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 13:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcAEY-00015L-8c
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:13:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lcAEP-0001KE-O3
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 13:13:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619716411;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iTF805gQyPbAOYxQZa1iU/505AMVspiWfaW8wvd1fpc=;
 b=O8UW1tPIc/orh6z2sz70eVVAKykgXD0Le7oLedePx22wo1dSiRKtaa83Br2CUiv7qvrk8T
 mbHUZcDb8eeHNbzvrsF4Kqmof0Cgd3CNZALz2hFhb/ODAuL+2q/AelxBxWGMzPKUHP4ibI
 6lgblp8dHLhs9IlQMW7ED1tfD2m3gWg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-fgtgrMO8MbGemIZh2L3qew-1; Thu, 29 Apr 2021 13:13:29 -0400
X-MC-Unique: fgtgrMO8MbGemIZh2L3qew-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C801681871A;
 Thu, 29 Apr 2021 17:13:28 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-217.ams2.redhat.com [10.36.114.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85BCB100763C;
 Thu, 29 Apr 2021 17:13:27 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 6/6] vhost-user-blk: Check that num-queues is supported by
 backend
Date: Thu, 29 Apr 2021 19:13:16 +0200
Message-Id: <20210429171316.162022-7-kwolf@redhat.com>
In-Reply-To: <20210429171316.162022-1-kwolf@redhat.com>
References: <20210429171316.162022-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, den-plotnikov@yandex-team.ru, mst@redhat.com,
 qemu-devel@nongnu.org, raphael.norwitz@nutanix.com
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


