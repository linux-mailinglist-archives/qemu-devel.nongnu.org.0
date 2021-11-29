Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 446BF460D5C
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Nov 2021 04:40:48 +0100 (CET)
Received: from localhost ([::1]:54250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mrXX5-00089s-1p
	for lists+qemu-devel@lfdr.de; Sun, 28 Nov 2021 22:40:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mrX2Y-0003Iy-F2
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:09:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55335)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mrX2H-0000oM-R5
 for qemu-devel@nongnu.org; Sun, 28 Nov 2021 22:09:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638155336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=y0kGTazpC1hjqZJ3ZITfcdKvTgElW1SKcXtZziw7R4Y=;
 b=ibqB2zbEExuo4LCkWvcNEt30m4jaytWN19AQyFan37eOF79ftpXxqjkBGFO5+URb9P6G/8
 9/2RE9e6sBMzkSUs+XbXQtdCpX1PUohd5IqlV4WaqLL6MvX5NaezOmw1UejeXWKstlwoYm
 Z6PR08J+RmY80Sp/IX6M8nojoZEbbYc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-231-3o_YLv-1O8G_mUtYqh37mw-1; Sun, 28 Nov 2021 22:08:54 -0500
X-MC-Unique: 3o_YLv-1O8G_mUtYqh37mw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CCCF1101AFA7;
 Mon, 29 Nov 2021 03:08:53 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-14.pek2.redhat.com [10.72.13.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3A3460BF1;
 Mon, 29 Nov 2021 03:08:43 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: mst@redhat.com,
	david@redhat.com
Subject: [PATCH V2 1/2] virtio-balloon: process all in sgs for free_page_vq
Date: Mon, 29 Nov 2021 11:08:40 +0800
Message-Id: <20211129030841.3611-1-jasowang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Jason Wang <jasowang@redhat.com>, wei.w.wang@intel.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We only process the first in sg which may lead to the bitmap of the
pages belongs to following sgs were not cleared. This may result more
pages to be migrated. Fixing this by process all in sgs for
free_page_vq.

Acked-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
Changes since V1:
- fix typo in the subject
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


