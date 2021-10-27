Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9AE43CB14
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 15:47:05 +0200 (CEST)
Received: from localhost ([::1]:37068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfjGi-00056B-8r
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 09:47:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfib1-0005d7-M4
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:03:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35256)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mfib0-0002LM-25
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 09:03:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635339837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=RBEMVmzJLCl/uDr/sxGeHX51BWzMIYv266pzD0cw4ZI=;
 b=cXsK4tHv2xQhS8mResVIdc64AyN2mfR6NteeEKRkn78FAV7KwwR7WgYS/L84AHjPsH4v2r
 eIDGl5LerIO3jU52+IaV/rpk1sQCccZHarLPuDLpDMmlEcbYDNTMGQxD00bXF9CXSvqgfp
 Lv+yd0NsImMMzCga5lvuZxFwyVgVfB8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-66-A1YiwfBaNCWKR_bfI-4mHA-1; Wed, 27 Oct 2021 09:03:56 -0400
X-MC-Unique: A1YiwfBaNCWKR_bfI-4mHA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5144A100CCC0
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 13:03:55 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.176])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DFAA669214;
 Wed, 27 Oct 2021 13:03:25 +0000 (UTC)
From: David Hildenbrand <david@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] vhost-vdpa: Set discarding of RAM broken when initializing
 the backend
Date: Wed, 27 Oct 2021 15:03:24 +0200
Message-Id: <20211027130324.59791-1-david@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Cindy Lu <lulu@redhat.com>, David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to VFIO, vDPA will go ahead an map+pin all guest memory. Memory
that used to be discarded will get re-populated and if we
discard+re-access memory after mapping+pinning, the pages mapped into the
vDPA IOMMU will go out of sync with the actual pages mapped into the user
space page tables.

Set discarding of RAM broken such that:
- virtio-mem and vhost-vdpa run mutually exclusive
- virtio-balloon is inhibited and no memory discards will get issued

In the future, we might be able to support coordinated discarding of RAM
as used by virtio-mem and already supported by vfio via the
RamDiscardManager.

Acked-by: Jason Wang <jasowang@redhat.com>
Cc: Jason Wang <jasowang@redhat.com>
Cc: Michael S. Tsirkin <mst@redhat.com>
Cc: Cindy Lu <lulu@redhat.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---

Unfortuantely, v1 never got picked up no matter how "hard" I tried to
ping :)

v1 -> v2:
- Add ack from Jason
- Extend patch description now that RamDiscardManager is upstream.

---
 hw/virtio/vhost-vdpa.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 12661fd5b1..0d8051426c 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -331,6 +331,17 @@ static int vhost_vdpa_init(struct vhost_dev *dev, void *opaque, Error **errp)
     struct vhost_vdpa *v;
     assert(dev->vhost_ops->backend_type == VHOST_BACKEND_TYPE_VDPA);
     trace_vhost_vdpa_init(dev, opaque);
+    int ret;
+
+    /*
+     * Similar to VFIO, we end up pinning all guest memory and have to
+     * disable discarding of RAM.
+     */
+    ret = ram_block_discard_disable(true);
+    if (ret) {
+        error_report("Cannot set discarding of RAM broken");
+        return ret;
+    }
 
     v = opaque;
     v->dev = dev;
@@ -442,6 +453,8 @@ static int vhost_vdpa_cleanup(struct vhost_dev *dev)
     memory_listener_unregister(&v->listener);
 
     dev->opaque = NULL;
+    ram_block_discard_disable(false);
+
     return 0;
 }
 
-- 
2.31.1


