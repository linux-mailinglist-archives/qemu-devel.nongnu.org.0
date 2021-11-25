Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B877E45D325
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 03:22:34 +0100 (CET)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq4PB-0006CZ-De
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 21:22:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mq4Nu-0004xZ-Ud
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 21:21:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mq4Nh-0001QV-O6
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 21:21:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637806861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=bheiQcYfpA+KiXypFeCZiNRxY3bfwSJ5ng2cDlhMTKM=;
 b=BYiJHcf1NT840iSsEK4Nq2Mi2fEDGx0NxI1kzGB+5SyDdxIuegnghBgMsfPdWcy4SP+prV
 pyVwo+eBRBf3LqSc3xi6yhCmZ8QLHwB/iT8zm3eo8cWz06GM7rCatMKaZbODnvuY4ZSITp
 nGtaBpy+9yi06OVDBfAKLjaHLxpm5h0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-600-yeiFcamkOg2kry4ho1qFwA-1; Wed, 24 Nov 2021 21:20:59 -0500
X-MC-Unique: yeiFcamkOg2kry4ho1qFwA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 080E31DDE0;
 Thu, 25 Nov 2021 02:20:59 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-40.pek2.redhat.com [10.72.13.40])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2606860C17;
 Thu, 25 Nov 2021 02:20:49 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	david@redhat.com
Subject: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
Date: Thu, 25 Nov 2021 10:20:45 +0800
Message-Id: <20211125022046.10433-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: mpe@ellerman.id.au, Jason Wang <jasowang@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We only process the first in sg which may lead to the bitmap of the
pages belongs to following sgs were not cleared. This may result more
pages to be migrated. Fixing this by process all in sgs for
free_page_vq.

Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/virtio-balloon.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
index c6962fcbfe..17de2558cb 100644
--- a/hw/virtio/virtio-balloon.c
+++ b/hw/virtio/virtio-balloon.c
@@ -510,6 +510,7 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
     VirtIODevice *vdev = VIRTIO_DEVICE(dev);
     VirtQueue *vq = dev->free_page_vq;
     bool ret = true;
+    int i;
 
     while (dev->block_iothread) {
         qemu_cond_wait(&dev->free_page_cond, &dev->free_page_lock);
@@ -544,8 +545,10 @@ static bool get_free_page_hints(VirtIOBalloon *dev)
     }
 
     if (elem->in_num && dev->free_page_hint_status == FREE_PAGE_HINT_S_START) {
-        qemu_guest_free_page_hint(elem->in_sg[0].iov_base,
-                                  elem->in_sg[0].iov_len);
+        for (i = 0; i < elem->in_num; i++) {
+            qemu_guest_free_page_hint(elem->in_sg[i].iov_base,
+                                      elem->in_sg[i].iov_len);
+        }
     }
 
 out:
-- 
2.25.1


