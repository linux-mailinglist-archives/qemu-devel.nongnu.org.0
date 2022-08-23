Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8724559EAE5
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:25:16 +0200 (CEST)
Received: from localhost ([::1]:46074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQYaR-0002MT-Ib
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:25:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYW3-0005Jr-Ji
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYVs-000332-DF
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:20:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661278825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CKtSgt7LhyQcdf+VJZwA77ZO1cebZdKFkWgMUA7YOXY=;
 b=dB+yhCf+kvj5/La/nRiuXmJDEm76mrwPh9O86VKabgynR2xZt/2saGcWqFws8KSKTC4feZ
 4FzlcWbb+QTHRUiq4ndh8tZL9VpWYJSlFtLY8jUEoZbUkfj77iYnlPYoqRBD+smLpsKOse
 i+95784a0SYcYVcdeMoqkDRQUvHMRI8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225--pBfUA6VNfC7Bk7eAgc9PA-1; Tue, 23 Aug 2022 14:20:21 -0400
X-MC-Unique: -pBfUA6VNfC7Bk7eAgc9PA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BB666811E83;
 Tue, 23 Aug 2022 18:20:20 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E82F840D2830;
 Tue, 23 Aug 2022 18:20:18 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Cindy Lu <lulu@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 4/7] vdpa: Remove SVQ vring from iova_tree at shutdown
Date: Tue, 23 Aug 2022 20:20:05 +0200
Message-Id: <20220823182008.97141-5-eperezma@redhat.com>
In-Reply-To: <20220823182008.97141-1-eperezma@redhat.com>
References: <20220823182008.97141-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Although the device will be reset before usage, the right thing to do is
to clean it.

Reported-by: Lei Yang <leiyang@redhat.com>
Fixes: 34e3c94eda ("vdpa: Add custom IOTLB translations to SVQ")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v2:
* Call vhost_iova_tree_remove with the map as value.
* report_error on vhost_vdpa_dma_unmap fail
---
 hw/virtio/vhost-vdpa.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 87e0ad393f..e16e0e222e 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -898,6 +898,12 @@ static bool vhost_vdpa_svq_unmap_ring(struct vhost_vdpa *v,
 
     size = ROUND_UP(result->size, qemu_real_host_page_size());
     r = vhost_vdpa_dma_unmap(v, result->iova, size);
+    if (unlikely(r < 0)) {
+        error_report("Unable to unmap SVQ vring: %s (%d)", g_strerror(-r), -r);
+        return false;
+    }
+
+    vhost_iova_tree_remove(v->iova_tree, *result);
     return r == 0;
 }
 
-- 
2.31.1


