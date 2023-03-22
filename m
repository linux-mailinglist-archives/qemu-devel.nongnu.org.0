Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E0CB6C479F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 11:30:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pevjJ-0006KM-C6; Wed, 22 Mar 2023 06:30:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pevjH-0006Hq-57
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:30:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pevjF-0007NX-FQ
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 06:30:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679480999;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=XLIP2BnQKiI1dURIcTCFjUDwWXVD/PbeQFmVaMFRL8o=;
 b=PNntLFMyzWbEYJY7+0TBVB6+3/zGob4OhKBAq1CBI3QX5pfqpLuRG5mJchHNRRCCCzXAyR
 LkmZJ5N57+Va627W6w+OAkyE8HLEbO9frFBYJAs7HgVVlCqOh623NG1fkxSeZg+E/RDjlq
 t9yK0tUNKM7AzTs+9628gzDRVz232Ig=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-20-cZvf0tHTNCSIVvr-BhNNJQ-1; Wed, 22 Mar 2023 06:29:56 -0400
X-MC-Unique: cZvf0tHTNCSIVvr-BhNNJQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 083573C1022C;
 Wed, 22 Mar 2023 10:29:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 85A4340C6E67;
 Wed, 22 Mar 2023 10:29:54 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: si-wei.liu@oracle.com, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Lei Yang <leiyang@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, alvaro.karsz@solid-run.com,
 Jason Wang <jasowang@redhat.com>
Subject: [PATCH] vdpa: declare SVQ support for VIRTIO_NET_F_HOST_USO
Date: Wed, 22 Mar 2023 11:29:52 +0100
Message-Id: <20230322102952.819291-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
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

At the moment qemu block the migration as long as the vdpa device offers
features not supported by SVQ.  VIRTIO_NET_F_HOST_USO is not even
offered to the guest, since qemu emulated devices does not support it,
and we know for sure it will require no changes on SVQ code when
supported.  For that reason, lift the block on this feature.

In a future this blocker could be smarter, and ignore features that are
never offered to the guest either because is disabled in the cmdline
(like mq=off) or it is not even supported.

Tested-by: Alvaro Karsz <alvaro.karsz@solid-run.com>
Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 99904a0da7..ff67babd23 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -103,6 +103,7 @@ static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
     /* VHOST_F_LOG_ALL is exposed by SVQ */
     BIT_ULL(VHOST_F_LOG_ALL) |
+    BIT_ULL(VIRTIO_NET_F_HOST_USO) |
     BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
     BIT_ULL(VIRTIO_NET_F_STANDBY);
 
-- 
2.31.1


