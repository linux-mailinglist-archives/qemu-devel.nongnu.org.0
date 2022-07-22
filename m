Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDFC357DC6A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 10:33:46 +0200 (CEST)
Received: from localhost ([::1]:38458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEo6T-0001Y3-7I
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 04:33:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEnzb-0007KD-Nk
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:26:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEnzY-0004aR-FY
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 04:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658478395;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=9QLv+/qJ8f6j/mBEmoqOPGOKE98RmGOO3G3Scja4x6U=;
 b=GraOCun5GeaqA6JPsgNuz5WCqMrrLYqpzyKUxn6E26qKMvmt91RTk8erL2A4l7sJ0Luerp
 cYBh4q4MS5cMxb8tVh9Hfedspnsjea4NmGtfshlLEUaXsGQgOGFppHEsABPtBJEJh46Wjk
 UjFN8Dx0AMHXuLBunEOcjx07pzDqDDc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-LaI6-tYwNMCl0qxi6YI_Rg-1; Fri, 22 Jul 2022 04:26:33 -0400
X-MC-Unique: LaI6-tYwNMCl0qxi6YI_Rg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2D6EA2813D34
 for <qemu-devel@nongnu.org>; Fri, 22 Jul 2022 08:26:33 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7178340C141D;
 Fri, 22 Jul 2022 08:26:32 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH] vdpa: Fix memory listener deletions of iova tree
Date: Fri, 22 Jul 2022 10:26:30 +0200
Message-Id: <20220722082630.3371384-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

vhost_vdpa_listener_region_del is always deleting the first iova entry
of the tree, since it's using the needle iova instead of the result's
one.

This was detected using a vga virtual device in the VM using vdpa SVQ.
It makes some extra memory adding and deleting, so the wrong one was
mapped / unmapped. This was undetected before since all the memory was
mappend and unmapped totally without that device, but other conditions
could trigger it too:

* mem_region was with .iova = 0, .translated_addr = (correct GPA).
* iova_tree_find_iova returned right result, but does not update
  mem_region.
* iova_tree_remove always removed region with .iova = 0. Right iova were
  sent to the device.
* Next map will fill the first region with .iova = 0, causing a mapping
  with the same iova and device complains, if the next action is a map.
* Next unmap will cause to try to unmap again iova = 0, causing the
  device to complain that no region was mapped at iova = 0.

Fixes: 34e3c94edaef ("vdpa: Add custom IOTLB translations to SVQ")
Reported-by: Lei Yang <leiyang@redhat.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 291cd19054..00e990ea40 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -290,7 +290,7 @@ static void vhost_vdpa_listener_region_del(MemoryListener *listener,

         result = vhost_iova_tree_find_iova(v->iova_tree, &mem_region);
         iova = result->iova;
-        vhost_iova_tree_remove(v->iova_tree, &mem_region);
+        vhost_iova_tree_remove(v->iova_tree, result);
     }
     vhost_vdpa_iotlb_batch_begin_once(v);
     ret = vhost_vdpa_dma_unmap(v, iova, int128_get64(llsize));
--
2.31.1


