Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015B05881BA
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 20:11:35 +0200 (CEST)
Received: from localhost ([::1]:57594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIwMg-0002zg-5E
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 14:11:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9W-0001PO-Kd
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:57:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44837)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9U-0003gZ-P5
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659463076;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H0MEFEcFCR3nJf5Fpaw1GnXU3DYzE09pfSEcIvOnUoE=;
 b=HPsAWRtfJ/eaJSRO2YxgFerMNVJor0fhMwF9lrNdv6grdBxWCw4N/mDSGiZRuvIgjOyY7o
 ivl+M6XxwJihzCKqbhkMenT0Ue0moKibcnCHCBZ4Tdw+UL5O9XWI0rsrF+r1T9MZ/FkmBY
 4Lqh5elZ5Av/SqEnoGvkBi5jp9EoY9Y=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-615-ptabsn4CMoCBS6qoPscipg-1; Tue, 02 Aug 2022 13:57:54 -0400
X-MC-Unique: ptabsn4CMoCBS6qoPscipg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1E9D1801755;
 Tue,  2 Aug 2022 17:57:54 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 566C4492C3B;
 Tue,  2 Aug 2022 17:57:51 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>
Subject: [PATCH v5 06/10] vdpa: Make vhost_vdpa_net_cvq_map_elem accept any
 out sg
Date: Tue,  2 Aug 2022 19:57:27 +0200
Message-Id: <20220802175731.312115-7-eperezma@redhat.com>
In-Reply-To: <20220802175731.312115-1-eperezma@redhat.com>
References: <20220802175731.312115-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

So its generic enough to accept any out sg buffer and we can inject
NIC state messages.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v5: Accept out sg instead of dev_buffers[]
---
 net/vhost-vdpa.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 33bf3d6409..2421bca347 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -302,16 +302,16 @@ dma_map_err:
 }
 
 /**
- * Copy the guest element into a dedicated buffer suitable to be sent to NIC
+ * Maps out sg and in buffer into dedicated buffers suitable to be sent to NIC
  */
-static bool vhost_vdpa_net_cvq_map_elem(VhostVDPAState *s,
-                                        VirtQueueElement *elem,
-                                        size_t *out_len)
+static bool vhost_vdpa_net_cvq_map_sg(VhostVDPAState *s,
+                                      const struct iovec *out, size_t out_num,
+                                      size_t *out_len)
 {
     size_t in_copied;
     bool ok;
 
-    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, elem->out_sg, elem->out_num,
+    ok = vhost_vdpa_cvq_map_buf(&s->vhost_vdpa, out, out_num,
                                 vhost_vdpa_net_cvq_cmd_len(),
                                 s->cvq_cmd_out_buffer, out_len, false);
     if (unlikely(!ok)) {
@@ -435,7 +435,8 @@ static int vhost_vdpa_net_handle_ctrl_avail(VhostShadowVirtqueue *svq,
     };
     bool ok;
 
-    ok = vhost_vdpa_net_cvq_map_elem(s, elem, &dev_buffers[0].iov_len);
+    ok = vhost_vdpa_net_cvq_map_sg(s, elem->out_sg, elem->out_num,
+                                   &dev_buffers[0].iov_len);
     if (unlikely(!ok)) {
         goto out;
     }
-- 
2.31.1


