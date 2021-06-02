Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B23E7397FBB
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:53:32 +0200 (CEST)
Received: from localhost ([::1]:34868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHwh-0004Aw-P3
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:53:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHrk-0006wO-Sm
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:42871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHrj-0006dR-A8
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622605702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=66ooFVOEZPCuBXdtT4s29YoJngmWaYMIKA8vyw9SFeg=;
 b=Is+hj0ZCTxFn88YJHujGKWbfO7/b71DuO9P5K0ms/5iJ+7o5eZtpOgQvQXG2Q0Wm6yCKG4
 JyVf2AzdIFgEPZCnPQcZMo/K9/PMU+DOHlOwHE56D9oN1dPeWnAH9sBcVOJX7eTjCHhpMD
 PftPhFEfjSnHstQfKbriFp6NfNbI8ug=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-312-CwAs3gm6Od-l8D9Gs98AKQ-1; Tue, 01 Jun 2021 23:48:21 -0400
X-MC-Unique: CwAs3gm6Od-l8D9Gs98AKQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D6AF4180FD6D
 for <qemu-devel@nongnu.org>; Wed,  2 Jun 2021 03:48:20 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-199.pek2.redhat.com [10.72.13.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 46B1C5D6D5;
 Wed,  2 Jun 2021 03:48:19 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v7 05/10] vhost-vdpa: add support for config interrupt call
 back
Date: Wed,  2 Jun 2021 11:47:45 +0800
Message-Id: <20210602034750.23377-6-lulu@redhat.com>
In-Reply-To: <20210602034750.23377-1-lulu@redhat.com>
References: <20210602034750.23377-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new call back function in vhost-vdpa, this call back function only
supported in vhost-vdpa backend

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/trace-events | 2 ++
 hw/virtio/vhost-vdpa.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index c62727f879..60a15f0186 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
 vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
 vhost_vdpa_set_owner(void *dev) "dev: %p"
 vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
+vhost_vdpa_set_config_call(void *dev, int *fd)"dev: %p fd: %p"
+
 
 # virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 01d2101d09..9ba2a2bed4 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -545,6 +545,12 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
     trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
 }
+static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
+                                       int *fd)
+{
+    trace_vhost_vdpa_set_config_call(dev, fd);
+    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, fd);
+}
 
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
@@ -611,4 +617,5 @@ const VhostOps vdpa_ops = {
         .vhost_get_device_id = vhost_vdpa_get_device_id,
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
+        .vhost_set_config_call = vhost_vdpa_set_config_call,
 };
-- 
2.21.3


