Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F87A442463
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 00:54:58 +0100 (CET)
Received: from localhost ([::1]:59784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhh8j-0007NH-A3
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 19:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyg-0001zM-Tu
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35536)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mhgyd-0004Ev-Nz
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 19:44:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635810271;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=A3LGy7m0a6Lv9FilCkeTDw+UTCQZG+QwE+4p+n4BnOY=;
 b=Bcz0dtDIUul7U5F9voDcaYf7NCcI2ugWtOjyfaPO1D2/Vu+jcZ1QNxZ1A0v5kP8ka5Zfe/
 7xP1B3iHJ+UWqTsp0QWBQXcsoi0RKcEavU1cP6uefcpPAn4UAYDUreJw72hxsjBM+Jz9Dw
 Gf07MngO+OE7F0aBMcuwdVrxlZf2UWA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-59-eruyulRXNO-l4wVPWfQA-g-1; Mon, 01 Nov 2021 19:44:30 -0400
X-MC-Unique: eruyulRXNO-l4wVPWfQA-g-1
Received: by mail-ed1-f72.google.com with SMTP id
 i9-20020a508709000000b003dd4b55a3caso17100645edb.19
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 16:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=A3LGy7m0a6Lv9FilCkeTDw+UTCQZG+QwE+4p+n4BnOY=;
 b=gT7MhWMvaSXC6L1GRg0Yac6H8BDOg1jnjr4pqOgJ2GfX6CViFE7LHfIzwE7vto9HKu
 LabAS+S7WuaJno8nYYibL7S13BKlaXT80I1kt3qSkm/tOb6AIJt6iqk71LJSYE+K5UL6
 273wZQh1yXLXmSQKeCXrFYA1H9jWIOVm+it9VDeDXcm1SDwqAU1GlqEihsXXqFJZI0do
 r8JxQhrMdCMlM+Mjn3bwnlvh7OSMxL9YcOcPFQP1sYJK1xtLhKU/nKeFctzFSG6db1pQ
 rna0jyT2w2XI8pm38q26ORIldJ4B5GG8CKN191g5UyEKErAUUrhP4qMl+2CxS3nI5fDx
 VW1Q==
X-Gm-Message-State: AOAM533wTU7u4UQgxz0kcN9+tbiWGKCQBHvorUepyZY/R4Mo9Yy+76fW
 +o3VURev4fk0+7WAse2ue79PDUO7+8kDohMy2ldq/L+gLvZn0kndA0ZY5WyWm+7xhBk5yMFyzxi
 AY9EyR1aNthLNmDoBa/LL+mrOqR21vk9MAmMzhZ357Xp64WWEdVDLUhfnBQcc
X-Received: by 2002:a05:6402:42ce:: with SMTP id
 i14mr44798271edc.276.1635810268870; 
 Mon, 01 Nov 2021 16:44:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwq6JVtK2VavkmWztazy2cxKb37xep+Q3FtrzQ7fkjn3xyZ+wDOBX+5X9jnzB42xCGFbWjStA==
X-Received: by 2002:a05:6402:42ce:: with SMTP id
 i14mr44798249edc.276.1635810268736; 
 Mon, 01 Nov 2021 16:44:28 -0700 (PDT)
Received: from redhat.com ([2.55.156.42])
 by smtp.gmail.com with ESMTPSA id j3sm7431963ejo.2.2021.11.01.16.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 16:44:28 -0700 (PDT)
Date: Mon, 1 Nov 2021 19:44:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] vhost-vdpa: Set discarding of RAM broken when
 initializing the backend
Message-ID: <20211101234358.582487-3-mst@redhat.com>
References: <20211101234358.582487-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211101234358.582487-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Cindy Lu <lulu@redhat.com>,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: David Hildenbrand <david@redhat.com>

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
Message-Id: <20211027130324.59791-1-david@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
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
MST


