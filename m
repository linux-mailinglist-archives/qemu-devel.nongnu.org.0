Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E758741D193
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 04:44:52 +0200 (CEST)
Received: from localhost ([::1]:58692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVm44-00010d-0s
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 22:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVlxO-00085t-6N
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 22:37:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1mVlxM-0006Gn-Pk
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 22:37:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632969476;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R+QeX03gV8fWcUX3l3FSr8yfbz6NKfaRdJdskDKvFmY=;
 b=XRtXENtrveyv5egeBXIrt5wMbTtfDjyPct0UPTV/2+/yY2+t0KASstmuisKMvkejJC5v2V
 a7hF5KnQwNOlMmTQROEcLvlM6sl/y4xvOe8pEbzs5Td9BEHkckV/nRBQ0roAGYWQ+zqHpG
 yw9ObYHh+6MyGFE7Uo4UbkXkwQyALA8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-131-G_QPBJuqNge0IJ8Hx9ABqw-1; Wed, 29 Sep 2021 22:37:55 -0400
X-MC-Unique: G_QPBJuqNge0IJ8Hx9ABqw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 168B75074B;
 Thu, 30 Sep 2021 02:37:54 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-12-120.pek2.redhat.com [10.72.12.120])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9819010016F4;
 Thu, 30 Sep 2021 02:37:10 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com
Subject: [PATCH v9 05/10] vhost-vdpa: add support for config interrupt call
 back
Date: Thu, 30 Sep 2021 10:33:43 +0800
Message-Id: <20210930023348.17770-6-lulu@redhat.com>
In-Reply-To: <20210930023348.17770-1-lulu@redhat.com>
References: <20210930023348.17770-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lulu@redhat.com;
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add new call back function in vhost-vdpa, this call back function will
set the fb number to hardware.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/trace-events | 2 ++
 hw/virtio/vhost-vdpa.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/hw/virtio/trace-events b/hw/virtio/trace-events
index 8ed19e9d0c..836e73d1f7 100644
--- a/hw/virtio/trace-events
+++ b/hw/virtio/trace-events
@@ -52,6 +52,8 @@ vhost_vdpa_set_vring_call(void *dev, unsigned int index, int fd) "dev: %p index:
 vhost_vdpa_get_features(void *dev, uint64_t features) "dev: %p features: 0x%"PRIx64
 vhost_vdpa_set_owner(void *dev) "dev: %p"
 vhost_vdpa_vq_get_addr(void *dev, void *vq, uint64_t desc_user_addr, uint64_t avail_user_addr, uint64_t used_user_addr) "dev: %p vq: %p desc_user_addr: 0x%"PRIx64" avail_user_addr: 0x%"PRIx64" used_user_addr: 0x%"PRIx64
+vhost_vdpa_set_config_call(void *dev, int fd)"dev: %p fd: %d"
+
 
 # virtio.c
 virtqueue_alloc_element(void *elem, size_t sz, unsigned in_num, unsigned out_num) "elem %p size %zd in_num %u out_num %u"
diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 4fa414feea..73764afc61 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -622,6 +622,12 @@ static int vhost_vdpa_set_vring_call(struct vhost_dev *dev,
     trace_vhost_vdpa_set_vring_call(dev, file->index, file->fd);
     return vhost_vdpa_call(dev, VHOST_SET_VRING_CALL, file);
 }
+static int vhost_vdpa_set_config_call(struct vhost_dev *dev,
+                                       int fd)
+{
+    trace_vhost_vdpa_set_config_call(dev, fd);
+    return vhost_vdpa_call(dev, VHOST_VDPA_SET_CONFIG_CALL, &fd);
+}
 
 static int vhost_vdpa_get_features(struct vhost_dev *dev,
                                      uint64_t *features)
@@ -688,4 +694,5 @@ const VhostOps vdpa_ops = {
         .vhost_get_device_id = vhost_vdpa_get_device_id,
         .vhost_vq_get_addr = vhost_vdpa_vq_get_addr,
         .vhost_force_iommu = vhost_vdpa_force_iommu,
+        .vhost_set_config_call = vhost_vdpa_set_config_call,
 };
-- 
2.21.3


