Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5D63AE229
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 06:20:42 +0200 (CEST)
Received: from localhost ([::1]:34516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvBQP-0000fw-Hh
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 00:20:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBMz-00015U-N3
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30248)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lvBMy-0000oB-2c
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 00:17:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624249027;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ixafQWHJ4TGBqsfp6yh+kCLSjXYW53Cpp5dP+J2sPC4=;
 b=eGQH9HmGldZFTP93rzBsk+6HTb5FB1IzCEd7T4ceAs4POTWGZJ6t8J2lYGa0QYB3xHxu4B
 H+qOJp6MT8vGTlPYSJ9KMgvYuuzsNJdfz5xSVKI7UslHlzKBXJEY2TM2Vj0eAdD18O7Lxz
 KOxoK1luK2KdDgJZ7lmeFQ36u9scBcQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-116-_oR0flipPOOMmIM6OUEO1A-1; Mon, 21 Jun 2021 00:17:05 -0400
X-MC-Unique: _oR0flipPOOMmIM6OUEO1A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6415F802C87;
 Mon, 21 Jun 2021 04:17:04 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-217.pek2.redhat.com
 [10.72.12.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E898D60918;
 Mon, 21 Jun 2021 04:17:01 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 02/18] vhost: use unsigned int for nvqs
Date: Mon, 21 Jun 2021 12:16:34 +0800
Message-Id: <20210621041650.5826-3-jasowang@redhat.com>
In-Reply-To: <20210621041650.5826-1-jasowang@redhat.com>
References: <20210621041650.5826-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.299,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: eperezma@redhat.com, elic@nvidia.com, lingshan.zhu@intel.com,
 lulu@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Switch to use unsigned int for nvqs since it's not expected to be
negative.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 include/hw/virtio/vhost.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/virtio/vhost.h b/include/hw/virtio/vhost.h
index 21a9a52088..ddd7d3d594 100644
--- a/include/hw/virtio/vhost.h
+++ b/include/hw/virtio/vhost.h
@@ -71,7 +71,7 @@ struct vhost_dev {
     int n_tmp_sections;
     MemoryRegionSection *tmp_sections;
     struct vhost_virtqueue *vqs;
-    int nvqs;
+    unsigned int nvqs;
     /* the first virtqueue which would be used by this vhost dev */
     int vq_index;
     /* if non-zero, minimum required value for max_queues */
-- 
2.25.1


