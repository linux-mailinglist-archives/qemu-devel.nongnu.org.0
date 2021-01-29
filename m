Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15FA930873C
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 10:09:03 +0100 (CET)
Received: from localhost ([::1]:52050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Pm2-0000Rm-4v
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 04:09:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5Pkl-0007ch-T2
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:07:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1l5Pkk-0000LU-3k
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 04:07:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611911261;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=MGudSIfVs/xy3zcSGuk1VTaT157c1TvlfFimdkaVn5Q=;
 b=c/M67x8nLxVCCsAIg5ZJFYo6Ra7lOabaDHWP0+Li6PFmocH1vp+FqUhY37V5hsooQC9v2B
 +P3j1jTcixC7b3tRknnrI1yt0fsfTIIOQGjKCsjMe5+aKHVzY9jxz9RU6rOh6kInF2ZBA2
 AUKEQnU01dS603Iw6j+868OCs1cxfLQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-185-Dmr7q4J0Nf6IuBQ5oqEAgg-1; Fri, 29 Jan 2021 04:07:39 -0500
X-MC-Unique: Dmr7q4J0Nf6IuBQ5oqEAgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87ABD801817;
 Fri, 29 Jan 2021 09:07:38 +0000 (UTC)
Received: from eperezma.remote.csb (ovpn-113-53.ams2.redhat.com [10.36.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CF94F6A8F0;
 Fri, 29 Jan 2021 09:07:30 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] vhost: Check for valid vdev in vhost_backend_handle_iotlb_msg
Date: Fri, 29 Jan 2021 10:07:28 +0100
Message-Id: <20210129090728.831208-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: maxime.coquelin@redhat.com, Jason Wang <jasowang@redhat.com>,
 qemu-stable@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Not checking this can lead to invalid dev->vdev member access in
vhost_device_iotlb_miss if backend issue an iotlb message in a bad
timing, either maliciously or by a bug.

Reproduced rebooting a guest with testpmd in txonly forward mode.
 #0  0x0000559ffff94394 in vhost_device_iotlb_miss (
     dev=dev@entry=0x55a0012f6680, iova=10245279744, write=1)
     at ../hw/virtio/vhost.c:1013
 #1  0x0000559ffff9ac31 in vhost_backend_handle_iotlb_msg (
     imsg=0x7ffddcfd32c0, dev=0x55a0012f6680)
     at ../hw/virtio/vhost-backend.c:411
 #2  vhost_backend_handle_iotlb_msg (dev=dev@entry=0x55a0012f6680,
     imsg=imsg@entry=0x7ffddcfd32c0)
     at ../hw/virtio/vhost-backend.c:404
 #3  0x0000559fffeded7b in slave_read (opaque=0x55a0012f6680)
     at ../hw/virtio/vhost-user.c:1464
 #4  0x000055a0000c541b in aio_dispatch_handler (
     ctx=ctx@entry=0x55a0010a2120, node=0x55a0012d9e00)
     at ../util/aio-posix.c:329

Fixes: 6dcdd06e3b ("spec/vhost-user spec: Add IOMMU support")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-backend.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/hw/virtio/vhost-backend.c b/hw/virtio/vhost-backend.c
index 222bbcc62d..31b33bde37 100644
--- a/hw/virtio/vhost-backend.c
+++ b/hw/virtio/vhost-backend.c
@@ -406,6 +406,11 @@ int vhost_backend_handle_iotlb_msg(struct vhost_dev *dev,
 {
     int ret = 0;
 
+    if (unlikely(!dev->vdev)) {
+        error_report("Unexpected IOTLB message when virtio device is stopped");
+        return -EINVAL;
+    }
+
     switch (imsg->type) {
     case VHOST_IOTLB_MISS:
         ret = vhost_device_iotlb_miss(dev, imsg->iova,
-- 
2.27.0


