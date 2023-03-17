Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 227C76BEBF6
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Mar 2023 15:57:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pdBVA-0000S1-Th; Fri, 17 Mar 2023 10:56:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pdBV7-0000R4-Iq
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:56:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pdBV5-0007L2-7K
 for qemu-devel@nongnu.org; Fri, 17 Mar 2023 10:56:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679064962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F1cnkhgtsZ7wT+NckoMu50SXggVHBW0DZRluBDN1IOc=;
 b=GmWIW5nvB3l/Gs2f1bn3hkluovPKstKDnTZVBOw/1/Zx2Zhwp618hQQbwGb2Ft7AABmVoL
 0uabGHMGhs1YwrTk6uWvQIXZexb//fQa3S+bE2nZFSd18nQaaoNZXzxR9Yh6Y2Se9RYlAN
 uYvX1PDzWLONp20nd0GtOgTjB64q5fc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-tUg2bhmuPN6_aknyJnHwfA-1; Fri, 17 Mar 2023 10:55:58 -0400
X-MC-Unique: tUg2bhmuPN6_aknyJnHwfA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 21AD038221CF;
 Fri, 17 Mar 2023 14:55:58 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 777C843FBE;
 Fri, 17 Mar 2023 14:55:55 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: alvaro.karsz@solid-run.com, Laurent Vivier <lvivier@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, Stefano Garzarella <sgarzare@redhat.com>,
 longpeng2@huawei.com, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Lei Yang <leiyang@redhat.com>
Subject: [RFC PATCH for 8.1 4/6] vdpa: return errno in
 vhost_vdpa_get_vring_group error
Date: Fri, 17 Mar 2023 15:55:40 +0100
Message-Id: <20230317145542.347368-5-eperezma@redhat.com>
In-Reply-To: <20230317145542.347368-1-eperezma@redhat.com>
References: <20230317145542.347368-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

We need to tell in the caller, as some errors are expected in a normal
workflow.  In particular, parent drivers in recent kernels with
VHOST_BACKEND_F_IOTLB_ASID may not support vring groups.  In that case,
-ENOTSUP is returned.

This is the case of vp_vdpa in Linux 6.2.

Next patches in this series will use that information to know if it must
abort or not.

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


