Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4A34580F75
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 10:58:14 +0200 (CEST)
Received: from localhost ([::1]:44708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGGOL-0005bS-Ni
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 04:58:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGGHb-0007NU-S0
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:51:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57518)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGGHY-0000ve-Qd
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 04:51:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658825471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bwF+3AqHIKREkP09rCefxZAy405jzgNGdbpbJGxpBd0=;
 b=Cc0umOg7LKpuPTcVSQASwUYowiWPpGc8qp98dDBqO1xikZNaN8qNnzCOsdH5Je4JaHpNPw
 FnlaqWKscWYc36iymPV+bwLRZGLBgcTuAtERduQE2lvtZMcdX6V7RZmKhLiWEw8x8OMafE
 417LXmfWUhuBnU2EYuO1vvSngoIfPMg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-Q7k3upM-MEGQCJdUDiPmWw-1; Tue, 26 Jul 2022 04:51:08 -0400
X-MC-Unique: Q7k3upM-MEGQCJdUDiPmWw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2FAFA811E75;
 Tue, 26 Jul 2022 08:51:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-201.pek2.redhat.com
 [10.72.12.201])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7CAE492CA2;
 Tue, 26 Jul 2022 08:51:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Lei Yang <leiyang@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 3/3] vdpa: Fix memory listener deletions of iova tree
Date: Tue, 26 Jul 2022 16:50:55 +0800
Message-Id: <20220726085055.17239-4-jasowang@redhat.com>
In-Reply-To: <20220726085055.17239-1-jasowang@redhat.com>
References: <20220726085055.17239-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

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
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index bce64f4..3ff9ce3 100644
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
2.7.4


