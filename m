Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6866E6030AB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 18:21:03 +0200 (CEST)
Received: from localhost ([::1]:34056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okpKu-0007Ri-5a
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 12:21:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1okouz-0003yr-Uc
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:54:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40998)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1okout-00041r-Vb
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 11:54:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666108447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HPwQpVci9IU7QXwp1MCWX/Ouul7vSpTc4wb6OuBrmug=;
 b=CZRDitqlrwBMPObznbmFDi04jKeYgJfYL0Fa9MF/YHpFwy/Mnh1ObZZQ626nlV0OqgQXnH
 qvlSYN3f6fRcxZpPp7+2gJS3UeVflQn7AnU/cJpYWYrEDv52LIHJ3z0uyWyCLuxl4rNZJi
 zjnxlQmnmtoqtWWxWiCTiWaEJ7TeRLo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-389-9Q3LgzP8MzycUy5XOSurzg-1; Tue, 18 Oct 2022 11:54:04 -0400
X-MC-Unique: 9Q3LgzP8MzycUy5XOSurzg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5660A101A54E;
 Tue, 18 Oct 2022 15:53:53 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.178])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B446B2157F26;
 Tue, 18 Oct 2022 15:53:48 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Si-Wei Liu <si-wei.liu@oracle.com>, Laurent Vivier <lvivier@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Gautam Dawar <gdawar@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [RFC PATCH 3/5] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
Date: Tue, 18 Oct 2022 17:53:19 +0200
Message-Id: <20221018155321.145135-4-eperezma@redhat.com>
In-Reply-To: <20221018155321.145135-1-eperezma@redhat.com>
References: <20221018155321.145135-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Since this capability is emulated by qemu shadowed CVQ cannot forward it
to the device. Process all that command within qemu.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 19d4dbe94a..2a52672b44 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -489,9 +489,18 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
     out.iov_len = iov_to_buf(elem->out_sg, elem->out_num, 0,
                              s->cvq_cmd_out_buffer,
                              vhost_vdpa_net_cvq_cmd_len());
-    dev_written = vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status));
-    if (unlikely(dev_written < 0)) {
-        goto out;
+    if (*(uint8_t *)s->cvq_cmd_out_buffer == VIRTIO_NET_CTRL_ANNOUNCE) {
+        /*
+         * Guest announce capability is emulated by qemu, so dont forward to
+         * the device.
+         */
+        dev_written = sizeof(status);
+        *s->status = VIRTIO_NET_OK;
+    } else {
+        dev_written = vhost_vdpa_net_cvq_add(s, out.iov_len, sizeof(status));
+        if (unlikely(dev_written < 0)) {
+            goto out;
+        }
     }
 
     if (unlikely(dev_written < sizeof(status))) {
-- 
2.31.1


