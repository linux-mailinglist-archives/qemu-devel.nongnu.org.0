Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A04165306B
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Dec 2022 12:51:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7xcZ-0001Cz-UL; Wed, 21 Dec 2022 06:50:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p7xcQ-0001A2-4K
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:50:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1p7xcM-00075I-Uu
 for qemu-devel@nongnu.org; Wed, 21 Dec 2022 06:50:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671623437;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hTQxFFjHU/5hVdUjMJcQhhbiVvXHeK6QGCHBg+oW/kI=;
 b=FDBTUG+Vl1VmC7bBwDBQRf2cmmdqGiLoOIlq/s0KewhjLg5s0vxoK8vawSanPUQmjWHA3L
 ynPhQpHsxhwzbM1eTTDAVOygL2oltA+Gq4pr7aDmcO28AGiuBoNPCFRNRpVRTPD7fOeNnc
 gJLXw8qYHL8E1MTWXS40MC6Cp1Il4CA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-599-PtLs50JYND6_FvREpkQhEg-1; Wed, 21 Dec 2022 06:50:32 -0500
X-MC-Unique: PtLs50JYND6_FvREpkQhEg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D15D6811E9C;
 Wed, 21 Dec 2022 11:50:31 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.148])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 341FB492C1B;
 Wed, 21 Dec 2022 11:50:29 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Stefano Garzarella <sgarzare@redhat.com>, Lei Yang <leiyang@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Eli Cohen <eli@mellanox.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH v3 2/4] virtio_net: copy VIRTIO_NET_S_ANNOUNCE if device model
 has it
Date: Wed, 21 Dec 2022 12:50:13 +0100
Message-Id: <20221221115015.1400889-3-eperezma@redhat.com>
In-Reply-To: <20221221115015.1400889-1-eperezma@redhat.com>
References: <20221221115015.1400889-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

Status part of the emulated feature. It will follow device model, so we
must copy it as long as NIC device model has it set.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v3: Add virtio byte swapping writing net config status.
---
 hw/net/virtio-net.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index b30038d130..122eac25ee 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -183,6 +183,8 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
             memcpy(netcfg.mac, n->mac, ETH_ALEN);
         }
 
+        netcfg.status |= virtio_tswap16(vdev,
+                                        n->status & VIRTIO_NET_S_ANNOUNCE);
         memcpy(config, &netcfg, n->config_size);
     }
 }
-- 
2.31.1


