Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F78257B17F
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 09:15:28 +0200 (CEST)
Received: from localhost ([::1]:36630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE3vb-0002vE-8a
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 03:15:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3hK-0000Uk-IU
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37862)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oE3hI-0006eq-Ve
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:00:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658300440;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDb4WlB9U3LZTsK+iYIH4uzAe5CzuBAHWuBovgW4p/s=;
 b=CPKKO5QpAf5m8o3KfGgiePQLn8Dywyha3T6xMS2yn/fXD40JuCbzWdJX6KD+VG1ppCM+w2
 hs3o9KctuYEhNQ6mioJ0xGKOxraA/YBi7tFnsRqHnaKM8vzhiWsV0tPoRSJm0KEQ3XhesE
 SYDVzYEFaJLBN7DmHQjRgUC90iTvJnc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-635-KGKGFXkLORm5YAc7KRLvBg-1; Wed, 20 Jul 2022 03:00:34 -0400
X-MC-Unique: KGKGFXkLORm5YAc7KRLvBg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 64CF81C0514A;
 Wed, 20 Jul 2022 07:00:33 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7823B18EA8;
 Wed, 20 Jul 2022 07:00:30 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cornelia Huck <cohuck@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>,
 Eric Blake <eblake@redhat.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Jason Wang <jasowang@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Parav Pandit <parav@mellanox.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v6 12/21] vhost: Expose vhost_svq_add
Date: Wed, 20 Jul 2022 08:59:37 +0200
Message-Id: <20220720065946.3122611-13-eperezma@redhat.com>
In-Reply-To: <20220720065946.3122611-1-eperezma@redhat.com>
References: <20220720065946.3122611-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This allows external parts of SVQ to forward custom buffers to the
device.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-shadow-virtqueue.h | 3 +++
 hw/virtio/vhost-shadow-virtqueue.c | 6 +++---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/hw/virtio/vhost-shadow-virtqueue.h b/hw/virtio/vhost-shadow-virtqueue.h
index d9fc1f1799..dd78f4bec2 100644
--- a/hw/virtio/vhost-shadow-virtqueue.h
+++ b/hw/virtio/vhost-shadow-virtqueue.h
@@ -86,6 +86,9 @@ bool vhost_svq_valid_features(uint64_t features, Error **errp);
 
 void vhost_svq_push_elem(VhostShadowVirtqueue *svq,
                          const VirtQueueElement *elem, uint32_t len);
+int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
+                  size_t out_num, const struct iovec *in_sg, size_t in_num,
+                  VirtQueueElement *elem);
 
 void vhost_svq_set_svq_kick_fd(VhostShadowVirtqueue *svq, int svq_kick_fd);
 void vhost_svq_set_svq_call_fd(VhostShadowVirtqueue *svq, int call_fd);
diff --git a/hw/virtio/vhost-shadow-virtqueue.c b/hw/virtio/vhost-shadow-virtqueue.c
index 1669b1fcd1..c3a75ca89e 100644
--- a/hw/virtio/vhost-shadow-virtqueue.c
+++ b/hw/virtio/vhost-shadow-virtqueue.c
@@ -238,9 +238,9 @@ static void vhost_svq_kick(VhostShadowVirtqueue *svq)
  *
  * Return -EINVAL if element is invalid, -ENOSPC if dev queue is full
  */
-static int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
-                          size_t out_num, const struct iovec *in_sg,
-                          size_t in_num, VirtQueueElement *elem)
+int vhost_svq_add(VhostShadowVirtqueue *svq, const struct iovec *out_sg,
+                  size_t out_num, const struct iovec *in_sg, size_t in_num,
+                  VirtQueueElement *elem)
 {
     unsigned qemu_head;
     unsigned ndescs = in_num + out_num;
-- 
2.31.1


