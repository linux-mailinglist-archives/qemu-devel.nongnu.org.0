Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 160296C341B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:25:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecu4-00026i-O7; Tue, 21 Mar 2023 10:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pectq-00025b-Pw
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:23:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pecto-00007r-QZ
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:23:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679408618;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nHc5K8ecg/Ku686Rv6/nnOa24qMbEoZx2bSCskCcpRM=;
 b=Lt18ETrlzARbzik/GnwznpXVLojaMRP6KQnnR8mou7wFfDyu3/F9k4lwYwNaG/y47M0Vws
 vTjbXmNYLt7rruMZOcHUuZQ2AVpP4D8RBlrnQZFfenr014CHfUjSSilELVxzKhm1NtmP/9
 MfqlmkUzWydMgx4AAi4VQT7WhxU+wSM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-vxiIA-SUNeO94if0qsctYw-1; Tue, 21 Mar 2023 10:23:36 -0400
X-MC-Unique: vxiIA-SUNeO94if0qsctYw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1076A858297
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:23:36 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-215.pek2.redhat.com [10.72.13.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22FE4C15BA0;
 Tue, 21 Mar 2023 14:23:33 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	jasowang@redhat.com,
	mst@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v15 1/4] vhost: expose function vhost_dev_has_iommu()
Date: Tue, 21 Mar 2023 22:23:24 +0800
Message-Id: <20230321142327.749980-2-lulu@redhat.com>
In-Reply-To: <20230321142327.749980-1-lulu@redhat.com>
References: <20230321142327.749980-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=lulu@redhat.com;
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

To support vIOMMU in vdpa, need to exposed the function
vhost_dev_has_iommu, vdpa will use this function to check
if vIOMMU enable.

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost.c         | 2 +-
 include/hw/virtio/vhost.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost.c b/hw/virtio/vhost.c
index a266396576..fd746b085b 100644
--- a/hw/virtio/vhost.c
+++ b/hw/virtio/vhost.c
@@ -107,7 +107,7 @@ static void vhost_dev_sync_region(struct vhost_dev *dev,
     }
 }
 
-static bool vhost_dev_has_iommu(struct vhost_dev *dev)
+bool vhost_dev_has_iommu(struct vhost_dev *dev)
 {
     VirtIODevice *vdev = dev->vdev;
 
diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index a52f273347..f7f10c8fb7 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -336,4 +336,5 @@ int vhost_dev_set_inflight(struct vhost_dev *dev,
                            struct vhost_inflight *inflight);
 int vhost_dev_get_inflight(struct vhost_dev *dev, uint16_t queue_size,
                            struct vhost_inflight *inflight);
+bool vhost_dev_has_iommu(struct vhost_dev *dev);
 #endif
-- 
2.34.3


