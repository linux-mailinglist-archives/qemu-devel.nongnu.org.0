Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F07D2637D59
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Nov 2022 16:54:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oyEWv-0002dp-Ch; Thu, 24 Nov 2022 10:52:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyEWr-0002d9-VU
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:52:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oyEWq-0004Ha-Ki
 for qemu-devel@nongnu.org; Thu, 24 Nov 2022 10:52:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669305164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ySh46XbYk9VIs4uLkfJkTIjcH+z9Qv25PLQCXJV9doc=;
 b=IgasK/G8UqI6UcgM43a857oCMtwr68qMi0+kXOagdcKw83CGCZ7GU3FipzXyV/cYsvFJF0
 910rFQ6edebaWYbg8zkyIcVXKQbPm7vkJ8n8vo8nHA7YUiY1QE23QEBWNxUsUkB8GeJkqO
 1PY1FDcq0eZsir9Cl36ekhA6tQ2fCjw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-213-LBxWdrbqMHiyDE2LEqTnng-1; Thu, 24 Nov 2022 10:52:40 -0500
X-MC-Unique: LBxWdrbqMHiyDE2LEqTnng-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0CDC3800B23;
 Thu, 24 Nov 2022 15:52:40 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E6E5B111E3F8;
 Thu, 24 Nov 2022 15:52:36 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: kvm@vger.kernel.org, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Jason Wang <jasowang@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Subject: [PATCH for 8.0 v8 10/12] vdpa: store x-svq parameter in VhostVDPAState
Date: Thu, 24 Nov 2022 16:51:56 +0100
Message-Id: <20221124155158.2109884-11-eperezma@redhat.com>
In-Reply-To: <20221124155158.2109884-1-eperezma@redhat.com>
References: <20221124155158.2109884-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
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

CVQ can be shadowed two ways:
- Device has x-svq=on parameter (current way)
- The device can isolate CVQ in its own vq group

QEMU needs to check for the second condition dynamically, because CVQ
index is not known before the driver ack the features. Since this is
dynamic, the CVQ isolation could vary with different conditions, making
it possible to go from "not isolated group" to "isolated".

Saving the cmdline parameter in an extra field so we never disable CVQ
SVQ in case the device was started with x-svq cmdline.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index b40b1ddf0d..3ff149dfd9 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -38,6 +38,8 @@ typedef struct VhostVDPAState {
     void *cvq_cmd_out_buffer;
     virtio_net_ctrl_ack *status;
 
+    /* The device always have SVQ enabled */
+    bool always_svq;
     bool started;
 } VhostVDPAState;
 
@@ -583,6 +585,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
 
     s->vhost_vdpa.device_fd = vdpa_device_fd;
     s->vhost_vdpa.index = queue_pair_index;
+    s->always_svq = svq;
     s->vhost_vdpa.shadow_vqs_enabled = svq;
     s->vhost_vdpa.iova_tree = iova_tree;
     if (!is_datapath) {
-- 
2.31.1


