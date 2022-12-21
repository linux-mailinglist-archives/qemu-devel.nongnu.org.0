Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D3965306C
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 12:52:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7xcW-0001Az-0e; Wed, 21 Dec 2022 06:50:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p7xcO-00019U-89
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:50:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p7xcM-00075E-9L
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:50:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671623436;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NEGiWila+ehSegfW6BTL7ZnoiH8dQE36x5C3HeXiBFQ=;
 b=cNOMbiPsTo/5IZ84D58YQnqSDGlFaLbU5RUEgzKn7Uc8StegGYNRVaXTZGjn+/JZpl/L/d
 hIXVRsK8OzTU9x5iaN+DJ73RvIxrwMLNBx7C+FHZpz3Ge6NlPrYMnz9VqDJ58+XuXqNgnD
 hmbC+wiYxkzr3gBVY1TF8BZ5JwoAlDQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-578-1gKPgm1HPiS7WilNoMBCdQ-1; Wed, 21 Dec 2022 06:50:35 -0500
X-MC-Unique: 1gKPgm1HPiS7WilNoMBCdQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D7B2385A588;
 Wed, 21 Dec 2022 11:50:34 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3062C492C14;
 Wed, 21 Dec 2022 11:50:32 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>, Lei Yang <leiyang@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH v3 3/4] vdpa: handle VIRTIO_NET_CTRL_ANNOUNCE in
 vhost_vdpa_net_handle_ctrl_avail
Date: Wed, 21 Dec 2022 12:50:14 +0100
Message-Id: <20221221115015.1400889-4-eperezma@redhat.com>
In-Reply-To: <20221221115015.1400889-1-eperezma@redhat.com>
References: <20221221115015.1400889-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

Since this capability is emulated by qemu shadowed CVQ cannot forward it
to the device. Process all that command within qemu.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 260e474863..0b0712cd8a 100644
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
+         * Guest announce capability is emulated by qemu, so don't forward to
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


