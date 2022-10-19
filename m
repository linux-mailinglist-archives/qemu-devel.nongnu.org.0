Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00852604665
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 15:09:27 +0200 (CEST)
Received: from localhost ([::1]:52998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol8p4-0007cq-U4
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 09:09:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ol8Yj-00069W-UH
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47839)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1ol8Yh-0002H9-4j
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 08:52:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666183950;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HQqvvXt2mnDRPwk4MtdkOd7P1aVjVbus7fcouF/Xkqk=;
 b=PUfhklVD88cJrWUFiKhKVUJbG+os4b63jnzv6bwZ6Y10o38/puBi3WtVOpVjVqP0Glqpyi
 ZEIKYT/OzQlKSxGZYrYS85lXxM1iUfPXJ4BwleMB4GLt8OWXUMAO/5gqEvJdmHlu90Fx1+
 Pbn95bZx40pFUFk2XN4gfs9MFvrIDqo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-343-lK_47yIgOyeIbFsMlW1N5A-1; Wed, 19 Oct 2022 08:52:21 -0400
X-MC-Unique: lK_47yIgOyeIbFsMlW1N5A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 81C9385A59D;
 Wed, 19 Oct 2022 12:52:20 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.14])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2936D4081B60;
 Wed, 19 Oct 2022 12:52:18 +0000 (UTC)
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
Subject: [RFC PATCH v2 1/8] vdpa: Delete duplicated vdpa_feature_bits entry
Date: Wed, 19 Oct 2022 14:52:03 +0200
Message-Id: <20221019125210.226291-2-eperezma@redhat.com>
In-Reply-To: <20221019125210.226291-1-eperezma@redhat.com>
References: <20221019125210.226291-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This entry was duplicated on referenced commit. Removing it.

Fixes: 402378407dbd ("vhost-vdpa: multiqueue support")
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 4bc3fd01a8..eebf29f5c1 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -63,7 +63,6 @@ const int vdpa_feature_bits[] = {
     VIRTIO_NET_F_CTRL_RX,
     VIRTIO_NET_F_CTRL_RX_EXTRA,
     VIRTIO_NET_F_CTRL_VLAN,
-    VIRTIO_NET_F_GUEST_ANNOUNCE,
     VIRTIO_NET_F_CTRL_MAC_ADDR,
     VIRTIO_NET_F_RSS,
     VIRTIO_NET_F_MQ,
-- 
2.31.1


