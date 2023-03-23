Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A776C7161
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 20:55:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfR13-0003GT-Gt; Thu, 23 Mar 2023 15:54:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pfR11-0003GJ-3G
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 15:54:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pfR0z-0007RK-Jv
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 15:54:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679601265;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FJ/a51ubUh29zjleAZFiNilZ6DElrWQ6ax23K4vEkh4=;
 b=P/bE5D5xawf1vLhKMqrqgBZKg8uCIDZX5oWIy0z2y57nLT70HSGqRedjCTRPdfYQ1yt0VA
 KaSj6VQNnxVzazyVdrpu2uHqHP7Bl0zalRjvqpVBylf5nwZw9YmuNY3NeB1LPNDHLgSTvH
 oH63LvXOsyBo0RUQQrGB5uQpOgl7MXs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-atdARaRgMjiLEmCh82KuMQ-1; Thu, 23 Mar 2023 15:54:21 -0400
X-MC-Unique: atdARaRgMjiLEmCh82KuMQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D5AC93C0ED70;
 Thu, 23 Mar 2023 19:54:20 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 323DD44002;
 Thu, 23 Mar 2023 19:54:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, alvaro.karsz@solid-run.com,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Lei Yang <leiyang@redhat.com>,
 si-wei.liu@oracle.com, Eli Cohen <eli@mellanox.com>,
 Shannon Nelson <snelson@pensando.io>, Laurent Vivier <lvivier@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Cindy Lu <lulu@redhat.com>, longpeng2@huawei.com,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [PATCH for 8.1 v2 4/6] vdpa: return errno in
 vhost_vdpa_get_vring_group error
Date: Thu, 23 Mar 2023 20:54:02 +0100
Message-Id: <20230323195404.1247326-5-eperezma@redhat.com>
In-Reply-To: <20230323195404.1247326-1-eperezma@redhat.com>
References: <20230323195404.1247326-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

We need to tell in the caller, as some errors are expected in a normal
workflow.  In particular, parent drivers in recent kernels with
VHOST_BACKEND_F_IOTLB_ASID may not support vring groups.  In that case,
-ENOTSUP is returned.

This is the case of vp_vdpa in Linux 6.2.

Next patches in this series will use that information to know if it must
abort or not.  Also, next patches return properly an errp instead of
printing with error_report.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 99904a0da7..4397c0d4b3 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -361,6 +361,14 @@ static NetClientInfo net_vhost_vdpa_info = {
         .check_peer_type = vhost_vdpa_check_peer_type,
 };
 
+/**
+ * Get vring virtqueue group
+ *
+ * @device_fd  vdpa device fd
+ * @vq_index   Virtqueue index
+ *
+ * Return -errno in case of error, or vq group if success.
+ */
 static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
 {
     struct vhost_vring_state state = {
@@ -369,6 +377,7 @@ static int64_t vhost_vdpa_get_vring_group(int device_fd, unsigned vq_index)
     int r = ioctl(device_fd, VHOST_VDPA_GET_VRING_GROUP, &state);
 
     if (unlikely(r < 0)) {
+        r = -errno;
         error_report("Cannot get VQ %u group: %s", vq_index,
                      g_strerror(errno));
         return r;
-- 
2.31.1


