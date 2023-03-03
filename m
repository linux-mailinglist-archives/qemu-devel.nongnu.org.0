Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EE86A9D9B
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:26:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY9AQ-0001p1-93; Fri, 03 Mar 2023 12:26:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY9A1-0000y1-KG
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:25:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1pY9A0-0005kZ-7t
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:25:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677864335;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kpmXqZz3ODPWDj7MKkO2OC81CrDXTX2V7aX2M28sKqc=;
 b=TPUpsS2q1c2sJUYenO5/dPmwgmhaJqvAd32pyBJfSiLpk4feT3aSuI9DHW7UXqx5uj95Wz
 X6EZ5kuyDUf7W8MffGzZt97aJk8UPooYlkK0ZPawmSAh6tjcrLzCAcaIVe93PCFRH8DPoF
 EcUNNtYd90LTezpj13jS1BFWDSbfOBA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-524-unRLVchJMg-exbyBdMw0cA-1; Fri, 03 Mar 2023 12:25:32 -0500
X-MC-Unique: unRLVchJMg-exbyBdMw0cA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 82D94802D2F;
 Fri,  3 Mar 2023 17:25:31 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.107])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97C56440D8;
 Fri,  3 Mar 2023 17:25:28 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Lei Yang <leiyang@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 Shannon Nelson <snelson@pensando.io>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 virtualization@lists.linux-foundation.org, Eli Cohen <eli@mellanox.com>,
 si-wei.liu@oracle.com, longpeng2@huawei.com,
 Jason Wang <jasowang@redhat.com>, alvaro.karsz@solid-run.com,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v5 13/14] vdpa net: allow VHOST_F_LOG_ALL
Date: Fri,  3 Mar 2023 18:24:44 +0100
Message-Id: <20230303172445.1089785-14-eperezma@redhat.com>
In-Reply-To: <20230303172445.1089785-1-eperezma@redhat.com>
References: <20230303172445.1089785-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
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

Since some actions move to the start function instead of init, the
device features may not be the parent vdpa device's, but the one
returned by vhost backend.  If transition to SVQ is supported, the vhost
backend will return _F_LOG_ALL to signal the device is migratable.

Add VHOST_F_LOG_ALL.  HW dirty page tracking can be added on top of this
change if the device supports it in the future.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 net/vhost-vdpa.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 1089c35959..99904a0da7 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -101,6 +101,8 @@ static const uint64_t vdpa_svq_device_features =
     BIT_ULL(VIRTIO_NET_F_MQ) |
     BIT_ULL(VIRTIO_F_ANY_LAYOUT) |
     BIT_ULL(VIRTIO_NET_F_CTRL_MAC_ADDR) |
+    /* VHOST_F_LOG_ALL is exposed by SVQ */
+    BIT_ULL(VHOST_F_LOG_ALL) |
     BIT_ULL(VIRTIO_NET_F_RSC_EXT) |
     BIT_ULL(VIRTIO_NET_F_STANDBY);
 
-- 
2.31.1


