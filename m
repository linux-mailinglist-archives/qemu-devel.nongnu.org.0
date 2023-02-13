Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A45A695084
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 20:20:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pReMg-0003VF-1S; Mon, 13 Feb 2023 14:19:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pReMZ-0003Uf-UK
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:19:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pReMU-00061e-Uj
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 14:19:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676315977;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ug4ekzcm50hXY6tkRDWzelLEtq9iqOrvykLFVg+HpX4=;
 b=XitXYwx4e67PlyRlhRUy+Aqf6Bi4RO7ZjW8FYPf+655tU0guVuuH9vROU5fwFI/t3IrqBm
 56d8FckGllxBMlSBZCKPqwStlqlgN/w+7XWocgP1Rp4/MZbZbf8aNl1pAWFgl4UvT9wg71
 VE3nv6pyuK4XTFc9FjIcavelMaVryao=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-uH8UPIqnMWqY6i1S0lQoPQ-1; Mon, 13 Feb 2023 14:19:34 -0500
X-MC-Unique: uH8UPIqnMWqY6i1S0lQoPQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A6B0418ABF89;
 Mon, 13 Feb 2023 19:19:33 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.11])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5F963C16022;
 Mon, 13 Feb 2023 19:19:31 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org,
	mst@redhat.com
Cc: Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, longpeng2@huawei.com,
 Eli Cohen <eli@mellanox.com>, alvaro.karsz@solid-run.com,
 Lei Yang <leiyang@redhat.com>, Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH] vhost: accept VIRTIO_F_ORDER_PLATFORM as a valid SVQ feature
Date: Mon, 13 Feb 2023 20:19:29 +0100
Message-Id: <20230213191929.1547497-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

VIRTIO_F_ORDER_PLATFORM indicates that memory accesses by the driver and
the device are ordered in a way described by the platform.  Since vDPA
devices may be backed by a hardware devices, let's allow
VIRTIO_F_ORDER_PLATFORM.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 4307296358..6bb1998f12 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -34,6 +34,7 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp)
         switch (b) {
         case VIRTIO_F_ANY_LAYOUT:
         case VIRTIO_RING_F_EVENT_IDX:
+        case VIRTIO_F_ORDER_PLATFORM:
             continue;
 
         case VIRTIO_F_ACCESS_PLATFORM:
-- 
2.31.1


