Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BCCA397FB5
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 05:51:57 +0200 (CEST)
Received: from localhost ([::1]:56252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loHvA-0007z0-Lf
	for lists+qemu-devel@lfdr.de; Tue, 01 Jun 2021 23:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHri-0006tJ-SG
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60445)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1loHrh-0006bW-Dp
 for qemu-devel@nongnu.org; Tue, 01 Jun 2021 23:48:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622605700;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kw6z1lUROEKfKAxyZ8WCWyKpnQI1wyMhijlHPO4FqJ0=;
 b=jIln1P5bSl8YeJNXcwq6xSZCbO5Zg73Ww7JCwltWMxvFYzrYxYUddpWPD98rlInffAgJKl
 59zPxIbNC8Hfwk4cwMf5pKovROE7cIW4SyOISFg/Q4zjSxKaTw/rdW2jfa1YDuKCVho+kG
 jR7gfb1zZ5cmKmyIVc+7Pz03CMJVDv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-62-vfmYo2TeMm-z9DW_QX-NXQ-1; Tue, 01 Jun 2021 23:48:18 -0400
X-MC-Unique: vfmYo2TeMm-z9DW_QX-NXQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C049D180FD70
 for <qemu-devel@nongnu.org>; Wed,  2 Jun 2021 03:48:17 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-13-199.pek2.redhat.com [10.72.13.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EF6B75D6D5;
 Wed,  2 Jun 2021 03:48:12 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com, mst@redhat.com, jasowang@redhat.com, qemu-devel@nongnu.org
Subject: [PATCH v7 04/10] vhost: add new call back function for config
 interrupt
Date: Wed,  2 Jun 2021 11:47:44 +0800
Message-Id: <20210602034750.23377-5-lulu@redhat.com>
In-Reply-To: <20210602034750.23377-1-lulu@redhat.com>
References: <20210602034750.23377-1-lulu@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lulu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

To support configure interrupt, we need to
add a new call back function for config interrupt.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 include/hw/virtio/vhost-backend.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/virtio/vhost-backend.h b/include/hw/virtio/vhost-backend.h
index 8a6f8e2a7a..adaf6982d2 100644
--- a/include/hw/virtio/vhost-backend.h
+++ b/include/hw/virtio/vhost-backend.h
@@ -125,6 +125,8 @@ typedef int (*vhost_get_device_id_op)(struct vhost_dev *dev, uint32_t *dev_id);
 
 typedef bool (*vhost_force_iommu_op)(struct vhost_dev *dev);
 
+typedef int (*vhost_set_config_call_op)(struct vhost_dev *dev,
+                                       int *fd);
 typedef struct VhostOps {
     VhostBackendType backend_type;
     vhost_backend_init vhost_backend_init;
@@ -170,6 +172,7 @@ typedef struct VhostOps {
     vhost_vq_get_addr_op  vhost_vq_get_addr;
     vhost_get_device_id_op vhost_get_device_id;
     vhost_force_iommu_op vhost_force_iommu;
+    vhost_set_config_call_op vhost_set_config_call;
 } VhostOps;
 
 extern const VhostOps user_ops;
-- 
2.21.3


