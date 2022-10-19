Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD7C6046E7
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:23:11 +0200 (CEST)
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol92L-00066I-Is
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:23:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ol8Yp-0006LQ-3s
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:52:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ol8Yn-0002Hl-F6
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:52:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666183955;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WUoMSiMZQmcCwuUwdcYUEB/TvyEqvIQErNRynamLkig=;
 b=B46f6UCLJCOWyBL5wp8q5kqFgneQGbIoLjTiqqT4U4KMdzqVrYE+03HiSltG6T6UPPSHAY
 NAKICwl+/IOUPmKYrVdpwG5/2NQbR7HAO3LdtBe/kDPRbRWU60wxp2l8aEWy3S2Gj7l19h
 jRIfOEv4WHwZKDa3MbjU0ysE0m6eJuM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-n5Tms6KzObyeMKtJsu4qHg-1; Wed, 19 Oct 2022 08:52:31 -0400
X-MC-Unique: n5Tms6KzObyeMKtJsu4qHg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 182982932488;
 Wed, 19 Oct 2022 12:52:31 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3CC34081B60;
 Wed, 19 Oct 2022 12:52:28 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>
Subject: [RFC PATCH v2 5/8] vdpa: Remove shadow CVQ command check
Date: Wed, 19 Oct 2022 14:52:07 +0200
Message-Id: <20221019125210.226291-6-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-1-eperezma@redhat.com>
References: <20221019125210.226291-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The guest will see undefined behavior if it issue not negotiate
commands, bit it is expected somehow.

Simplify code deleting this check.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 48 ------------------------------------------------
 1 file changed, 48 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index fca21d5b79..3374c21b4d 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -461,48 +461,6 @@ static NetClientInfo net_vhost_vdpa_cvq_info = {
     .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
-/**
- * Do not forward commands not supported by SVQ. Otherwise, the device could
- * accept it and qemu would not know how to update the device model.
- */
-static bool vhost_vdpa_net_cvq_validate_cmd(const void *out_buf, size_t len)
-{
-    struct virtio_net_ctrl_hdr ctrl;
-
-    if (unlikely(len < sizeof(ctrl))) {
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "%s: invalid legnth of out buffer %zu\n", __func__, len);
-        return false;
-    }
-
-    memcpy(&ctrl, out_buf, sizeof(ctrl));
-    switch (ctrl.class) {
-    case VIRTIO_NET_CTRL_MAC:
-        switch (ctrl.cmd) {
-        case VIRTIO_NET_CTRL_MAC_ADDR_SET:
-            return true;
-        default:
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mac cmd %u\n",
-                          __func__, ctrl.cmd);
-        };
-        break;
-    case VIRTIO_NET_CTRL_MQ:
-        switch (ctrl.cmd) {
-        case VIRTIO_NET_CTRL_MQ_VQ_PAIRS_SET:
-            return true;
-        default:
-            qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid mq cmd %u\n",
-                          __func__, ctrl.cmd);
-        };
-        break;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid control class %u\n",
-                      __func__, ctrl.class);
-    };
-
-    return false;
-}
-
 /**
  * Validate and copy control virtqueue commands.
  *
@@ -526,16 +484,10 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
         .iov_len = sizeof(status),
     };
     ssize_t dev_written = -EINVAL;
-    bool ok;
 
     out.iov_len = iov_to_buf(elem->out_sg, elem->out_num, 0,
                              s->cvq_cmd_out_buffer,
                              vhost_vdpa_net_cvq_cmd_len());
-    ok = vhost_vdpa_net_cvq_validate_cmd(s->cvq_cmd_out_buffer, out.iov_len);
-    if (unlikely(!ok)) {
-        goto out;
-    }
-
     dev_written = vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status));
     if (unlikely(dev_written < 0)) {
         goto out;
-- 
2.31.1


