Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E18536109E9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 07:54:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooIFE-0007EJ-9p; Fri, 28 Oct 2022 01:49:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEj-0006x5-Kr
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:48:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1ooIEi-0007I2-22
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 01:48:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666936135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8S3xOwXFbS/Vxh1C9hImxitawWC5RgZsL+vHkuEbDU=;
 b=aTWfEa3togywz0WYK0beSG9bw1N6/3kafhQUXJQPUOf1ipesq222XjyFAm7JWuuMmeqKpY
 qq9f9WsNn2Pig75CxPQ2/qYfyTnxm+hObeJ5JdLcdYB5PRUsjKAehvQsYKze4Vgka0EQZi
 btG7M3M50oJbusX8UTeja3XRN9ix/3g=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-MhbmaCVcOreDsuQXcvcOcA-1; Fri, 28 Oct 2022 01:48:53 -0400
X-MC-Unique: MhbmaCVcOreDsuQXcvcOcA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6D893800B23
 for <qemu-devel@nongnu.org>; Fri, 28 Oct 2022 05:48:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-50.pek2.redhat.com [10.72.13.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 04779C15BA8;
 Fri, 28 Oct 2022 05:48:50 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: stefanha@redhat.com,
	qemu-devel@nongnu.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 04/26] vdpa: Remove shadow CVQ command check
Date: Fri, 28 Oct 2022 13:48:13 +0800
Message-Id: <20221028054835.29674-5-jasowang@redhat.com>
In-Reply-To: <20221028054835.29674-1-jasowang@redhat.com>
References: <20221028054835.29674-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.515,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Eugenio Pérez <eperezma@redhat.com>

The guest will see undefined behavior if it issue not negotiate
commands, bit it is expected somehow.

Simplify code deleting this check.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 48 ------------------------------------------------
 1 file changed, 48 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index eebf29f..6d64000 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -462,48 +462,6 @@ static NetClientInfo net_vhost_vdpa_cvq_info = {
 };
 
 /**
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
-/**
  * Validate and copy control virtqueue commands.
  *
  * Following QEMU guidelines, we offer a copy of the buffers to the device to
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
2.7.4


