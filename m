Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C967605E8E
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 13:14:43 +0200 (CEST)
Received: from localhost ([::1]:41216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTVY-0005f3-2C
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 07:14:41 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olTGn-0001HY-7q
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 06:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olSt8-0004Im-7f
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:34:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1olSt6-0001KC-Ne
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 06:34:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666262093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lq9PmOW1bmOoh8YADhBhNQUcNg2ahS9g2LKpGj28U4E=;
 b=HSqaA0M8ZXDd/trC3Arjmn6cYXyIrb0up/VEyo/h17uWmUSYhfeDjts6OAPWTC4yV/t2Bv
 VMEgHcPVSupmZHO0aNYFAxLSKeuBQZhmu+XF4JMm4yB4mGLHVpuXQXW+43RwCVRPv/RbT4
 yShc7reFdI46WQDqAWPQCPKW4QCNAlU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-13-nR4Xh9KdOnyV8Rf25gvwjA-1; Thu, 20 Oct 2022 06:34:50 -0400
X-MC-Unique: nR4Xh9KdOnyV8Rf25gvwjA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B53CE101A52A;
 Thu, 20 Oct 2022 10:34:49 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4DBB3C15BA5;
 Thu, 20 Oct 2022 10:34:47 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Zhu Lingshan <lingshan.zhu@intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Si-Wei Liu <si-wei.liu@oracle.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Jason Wang <jasowang@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Parav Pandit <parav@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH 6/7] virtio_net: copy VIRTIO_NET_S_ANNOUNCE if device model
 has it
Date: Thu, 20 Oct 2022 12:34:28 +0200
Message-Id: <20221020103429.347525-7-eperezma@redhat.com>
In-Reply-To: <20221020103429.347525-1-eperezma@redhat.com>
References: <20221020103429.347525-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
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

Status part of the emulated feature. It will follow device model, so we
must copy it as long as NIC device model has it set.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 hw/net/virtio-net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 51fe6d5c1a..49674dcf32 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -180,6 +180,7 @@ static void virtio_net_get_config(VirtIODevice *vdev, uint8_t *config)
             netcfg.status |= VIRTIO_NET_S_LINK_UP;
         }
 
+        netcfg.status |= (n->status & VIRTIO_NET_S_ANNOUNCE);
         memcpy(config, &netcfg, n->config_size);
     }
 }
-- 
2.31.1


