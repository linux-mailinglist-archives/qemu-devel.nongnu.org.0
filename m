Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3804D64DA56
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 12:33:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5mTM-0002Wc-JB; Thu, 15 Dec 2022 06:32:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p5mT4-0002W0-7E
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 06:32:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p5mT2-0006iJ-Bm
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 06:32:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671103919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=F+8Ig73/fLUeRTg3onTKDE4DpjNQE7LZwNbUPhE0FNg=;
 b=W1J4vilILSJykEZAoLN0+o+yKteXj3JLwgWobzPgdSGOmkxyX8VHxVN0dR3vwJQrtpc8zP
 Lv+RMt9puQuJskK/mRGaFk978RZt5nadCoKSvu+wZ2wH38xVXp8b3JElu5GdsYd4PjpbSr
 ibaphc/jL5j8O7/21UDKkVSDuGuJH4Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653--72wctfgMv6qNDfHg0Fkbg-1; Thu, 15 Dec 2022 06:31:56 -0500
X-MC-Unique: -72wctfgMv6qNDfHg0Fkbg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DE5E51C09B70;
 Thu, 15 Dec 2022 11:31:55 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.137])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B69502166B26;
 Thu, 15 Dec 2022 11:31:52 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Liuxiangdong <liuxiangdong5@huawei.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Laurent Vivier <lvivier@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Longpeng <longpeng2@huawei.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Parav Pandit <parav@mellanox.com>, kvm@vger.kernel.org,
 virtualization@lists.linux-foundation.org
Subject: [PATCH v9 01/12] vdpa: use v->shadow_vqs_enabled in
 vhost_vdpa_svqs_start & stop
Date: Thu, 15 Dec 2022 12:31:33 +0100
Message-Id: <20221215113144.322011-2-eperezma@redhat.com>
In-Reply-To: <20221215113144.322011-1-eperezma@redhat.com>
References: <20221215113144.322011-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
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

This function used to trust in v->shadow_vqs != NULL to know if it must
start svq or not.

This is not going to be valid anymore, as qemu is going to allocate svq
array unconditionally (but it will only start them conditionally).

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 hw/virtio/vhost-vdpa.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/virtio/vhost-vdpa.c b/hw/virtio/vhost-vdpa.c
index 7468e44b87..7f0ff4df5b 100644
--- a/hw/virtio/vhost-vdpa.c
+++ b/hw/virtio/vhost-vdpa.c
@@ -1029,7 +1029,7 @@ static bool vhost_vdpa_svqs_start(struct vhost_dev *dev)
     Error *err = NULL;
     unsigned i;
 
-    if (!v->shadow_vqs) {
+    if (!v->shadow_vqs_enabled) {
         return true;
     }
 
@@ -1082,7 +1082,7 @@ static void vhost_vdpa_svqs_stop(struct vhost_dev *dev)
 {
     struct vhost_vdpa *v = dev->opaque;
 
-    if (!v->shadow_vqs) {
+    if (!v->shadow_vqs_enabled) {
         return;
     }
 
-- 
2.31.1


