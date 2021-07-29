Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A30A3DABCA
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Jul 2021 21:22:55 +0200 (CEST)
Received: from localhost ([::1]:60988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9BcM-0001wd-2o
	for lists+qemu-devel@lfdr.de; Thu, 29 Jul 2021 15:22:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m9BZ3-0006Dn-G1
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:19:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32804)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lvivier@redhat.com>)
 id 1m9BZ2-0005ad-1t
 for qemu-devel@nongnu.org; Thu, 29 Jul 2021 15:19:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627586366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BxJIOvxN6/904s3i8r5luoZt/VaoWyeQ9KkEYOJWTPk=;
 b=hehKNgnc+1vJIAcCB4ieKMZ+QgiO7OEO+2OEHdSEPsAy8di8sckdmgd61INyhGVewXdFW4
 4U5FmNchY5P4JvXztDwVJZbieDBbJMOQ02AbcF/vQvi/HcPanxXv2DgvRJ1N7Ahqja3q1E
 zkv1lkmcwEd0ewTqci2A1Z+HPXUh5KY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-qo7vUl55M5OYccKxVEeEuw-1; Thu, 29 Jul 2021 15:19:22 -0400
X-MC-Unique: qo7vUl55M5OYccKxVEeEuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D11BF1015184
 for <qemu-devel@nongnu.org>; Thu, 29 Jul 2021 19:19:21 +0000 (UTC)
Received: from thinkpad.redhat.com (unknown [10.39.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 88D5E6E0B7;
 Thu, 29 Jul 2021 19:19:20 +0000 (UTC)
From: Laurent Vivier <lvivier@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] virtio: add a way to disable a queue
Date: Thu, 29 Jul 2021 21:19:09 +0200
Message-Id: <20210729191910.317114-2-lvivier@redhat.com>
In-Reply-To: <20210729191910.317114-1-lvivier@redhat.com>
References: <20210729191910.317114-1-lvivier@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lvivier@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=lvivier@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Juan Quintela <quintela@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Jens Freimann <jfreimann@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add virtio_queue_disable()/virtio_queue_enable() to disable/enable a queue
by setting vring.num to 0 (or num_default).
This is needed to be able to disable a guest driver from the host side

Signed-off-by: Laurent Vivier <lvivier@redhat.com>
---
 include/hw/virtio/virtio.h |  2 ++
 hw/virtio/virtio.c         | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
index 8bab9cfb7507..6a3f71b4cd88 100644
--- a/include/hw/virtio/virtio.h
+++ b/include/hw/virtio/virtio.h
@@ -251,6 +251,8 @@ void virtio_config_modern_writel(VirtIODevice *vdev,
                                  uint32_t addr, uint32_t data);
 void virtio_queue_set_addr(VirtIODevice *vdev, int n, hwaddr addr);
 hwaddr virtio_queue_get_addr(VirtIODevice *vdev, int n);
+void virtio_queue_enable(VirtIODevice *vdev, int n);
+void virtio_queue_disable(VirtIODevice *vdev, int n);
 void virtio_queue_set_num(VirtIODevice *vdev, int n, int num);
 int virtio_queue_get_num(VirtIODevice *vdev, int n);
 int virtio_queue_get_max_num(VirtIODevice *vdev, int n);
diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
index 874377f37a70..fa5228c1a2d6 100644
--- a/hw/virtio/virtio.c
+++ b/hw/virtio/virtio.c
@@ -2244,6 +2244,16 @@ void virtio_queue_set_rings(VirtIODevice *vdev, int n, hwaddr desc,
     virtio_init_region_cache(vdev, n);
 }
 
+void virtio_queue_disable(VirtIODevice *vdev, int n)
+{
+    vdev->vq[n].vring.num = 0;
+}
+
+void virtio_queue_enable(VirtIODevice *vdev, int n)
+{
+    vdev->vq[n].vring.num = vdev->vq[n].vring.num_default;
+}
+
 void virtio_queue_set_num(VirtIODevice *vdev, int n, int num)
 {
     /* Don't allow guest to flip queue between existent and
-- 
2.31.1


