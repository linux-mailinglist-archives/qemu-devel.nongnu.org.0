Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D68CA610BB8
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 09:57:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooKE7-00063O-QF; Fri, 28 Oct 2022 03:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1ooKDe-0005CB-Tl
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:56:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1ooKDY-0000U9-EW
 for qemu-devel@nongnu.org; Fri, 28 Oct 2022 03:55:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666943751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mYg1jvI6tjkFfFk0fOxA+wuPT1k9GhFHFQlHY8fqSCw=;
 b=bIq9bbSRq5hhCNlT1WJcIJ8bKDVY9fmEnd0ZNRVKu9SXmg4Ch69gyyrjP4GQOiVczPxcKG
 8LstZW4UCRvUlvoeloxPin2g6swETv+I6thA9cXHkxTngnmanXolfi9ibFLIj2ONnaf9Hu
 Y5n5VmVLoew0CHP1GbcaI7QsrgUvAiA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-286-R-hREJL7OzSMGw4ocjyN6g-1; Fri, 28 Oct 2022 03:55:50 -0400
X-MC-Unique: R-hREJL7OzSMGw4ocjyN6g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC0A2802527;
 Fri, 28 Oct 2022 07:55:49 +0000 (UTC)
Received: from server.redhat.com (ovpn-12-241.pek2.redhat.com [10.72.12.241])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F1B094B6782;
 Fri, 28 Oct 2022 07:55:45 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, kraxel@redhat.com,
 dgilbert@redhat.com, stefanha@redhat.com, arei.gonglei@huawei.com,
 marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v17 04/10] vhost: introduce new VhostOps vhost_set_config_call
Date: Fri, 28 Oct 2022 15:54:52 +0800
Message-Id: <20221028075458.1182340-5-lulu@redhat.com>
In-Reply-To: <20221028075458.1182340-1-lulu@redhat.com>
References: <20221028075458.1182340-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

This patch introduces new VhostOps vhost_set_config_call.
This function allows the qemu to set the config
event fd to kernel driver.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 include/hw/virtio/vhost-backend.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index eab46d7f0b..c5ab49051e 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -128,6 +128,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
 
 typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
+typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
+                                       int fd);
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -174,6 +176,7 @@ typedef struct VhostOps {
     vhost_vq_get_addr_op  vhost_vq_get_addr;
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
+    vhost_set_config_call_op vhost_set_config_call;
 } VhostOps;
 
 int vhost_backend_update_device_iotlb(struct vhost_dev *dev,
-- 
2.34.3


