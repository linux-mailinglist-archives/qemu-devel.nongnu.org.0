Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05E836C3421
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:25:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pecu4-00026h-F9; Tue, 21 Mar 2023 10:23:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pects-00025j-Pv
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:23:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lulu@redhat.com>) id 1pectr-00009D-DY
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:23:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679408622;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=daL2F8vI5WYXi9WJ2wV3aB/xfnG8SJevtn6y3oTOgWs=;
 b=C+wV4ocSFWc2Q9GIrrkyPBeD/OXwJLy3bWFYYJ8Mcw9nFN4FesonDlWUavsT+2l+A8vpY3
 sFkBNqb/Q/17bFYNWq+Lt0xbif0Hd+9pjXNDv4UeTF5qiwCCmOnx2S4SEYuv3e0YxeLTRf
 QcT11ec2274f/JCCS2MgOB5okBW6nJQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-245-y6bDIuzEO6WvKE0TqARCqQ-1; Tue, 21 Mar 2023 10:23:41 -0400
X-MC-Unique: y6bDIuzEO6WvKE0TqARCqQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 26B553813F31
 for <qemu-devel@nongnu.org>; Tue, 21 Mar 2023 14:23:41 +0000 (UTC)
Received: from server.redhat.com (ovpn-13-215.pek2.redhat.com [10.72.13.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 39A52C15BA0;
 Tue, 21 Mar 2023 14:23:38 +0000 (UTC)
From: Cindy Lu <lulu@redhat.com>
To: lulu@redhat.com,
	jasowang@redhat.com,
	mst@redhat.com
Cc: qemu-devel@nongnu.org
Subject: [PATCH v15 3/4] vhost-vdpa: Add check for full 64-bit in region delete
Date: Tue, 21 Mar 2023 22:23:26 +0800
Message-Id: <20230321142327.749980-4-lulu@redhat.com>
In-Reply-To: <20230321142327.749980-1-lulu@redhat.com>
References: <20230321142327.749980-1-lulu@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=lulu@redhat.com;
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

The unmap ioctl doesn't accept a full 64-bit span. So need to
add check for the section's size in vhost_vdpa_listener_region_del().

Signed-off-by: Cindy Lu <lulu@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 92c2413c76..0c8c37e786 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -316,10 +316,28 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,
         vhost_iova_tree_remove(v->iova_tree, *result);
     }
     vhost_vdpa_iotlb_batch_begin_once(v);
+    /*
+     * The unmap ioctl doesn't accept a full 64-bit. need to check it
+     */
+    if (int128_eq(llsize, int128_2_64())) {
+        llsize = int128_rshift(llsize, 1);
+        ret = vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
+                                   int128_get64(llsize));
+
+        if (ret) {
+            error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
+                         "0x%" HWADDR_PRIx ") = %d (%m)",
+                         v, iova, int128_get64(llsize), ret);
+        }
+        iova += int128_get64(llsize);
+    }
     ret = vhost_vdpa_dma_unmap(v, VHOST_VDPA_GUEST_PA_ASID, iova,
                                int128_get64(llsize));
+
     if (ret) {
-        error_report("vhost_vdpa dma unmap error!");
+        error_report("vhost_vdpa_dma_unmap(%p, 0x%" HWADDR_PRIx ", "
+                     "0x%" HWADDR_PRIx ") = %d (%m)",
+                     v, iova, int128_get64(llsize), ret);
     }
 
     memory_region_unref(section->mr);
-- 
2.34.3


