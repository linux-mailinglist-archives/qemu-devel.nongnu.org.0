Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B67B604660
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:08:59 +0200 (CEST)
Received: from localhost ([::1]:51480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol8oc-0006jk-0U
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ol8Z1-0006WF-Oe
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:52:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38023)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ol8Ym-0002Hf-DS
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:52:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666183954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SoTz4WrSj/6TG264UMdH3uDpSJqGlI8R2/aF+QLXIAc=;
 b=jLdjtrxGSaQK2XsjCmN58zByY4+hHJYHNd/y3uIlH4BwUozBsiP+aubsYE9txmeKcqFNaz
 1Jg4Kj/KWyzSBByQU0yudoTvnAKxZWElBAEuuTF92P0NRi5ay4XM5SypYf3Ds4RPWl2M1s
 qFbS9ymOq7YuGTV1fcSJhVXzTzOncZo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-500-0lIn7BriPhCe4vF0G8BOxQ-1; Wed, 19 Oct 2022 08:52:28 -0400
X-MC-Unique: 0lIn7BriPhCe4vF0G8BOxQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6B822857FB0;
 Wed, 19 Oct 2022 12:52:28 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16E664081B60;
 Wed, 19 Oct 2022 12:52:25 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Zhu Lingshan <lingshan.zhu@intel.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Si-Wei Liu <si-wei.liu@oracle.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cindy Lu <lulu@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Gautam Dawar <gdawar@xilinx.com>
Subject: [RFC PATCH v2 4/8] vdpa: Expose VIRTIO_NET_F_STATUS unconditionally
Date: Wed, 19 Oct 2022 14:52:06 +0200
Message-Id: <20221019125210.226291-5-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-1-eperezma@redhat.com>
References: <20221019125210.226291-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Now that qemu can handle and emulate it if the vdpa backend does not
support it we can offer it always.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 3803452800..fca21d5b79 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -602,6 +602,9 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
     if (svq) {
         /* Add SVQ logging capabilities */
         s->vhost_vdpa.added_features |= BIT_ULL(VHOST_F_LOG_ALL);
+
+        /* VIRTIO_NET_F_STATUS is mandatory for _F_GUEST_ANNOUNCE. */
+        s->vhost_vdpa.added_features |= BIT_ULL(VIRTIO_NET_F_STATUS);
     }
     if (!is_datapath) {
         s->cvq_cmd_out_buffer = qemu_memalign(qemu_real_host_page_size(),
-- 
2.31.1


