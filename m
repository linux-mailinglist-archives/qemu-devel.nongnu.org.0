Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E95577FC7
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 12:36:18 +0200 (CEST)
Received: from localhost ([::1]:37410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDO6r-0003AL-Qh
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 06:36:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO18-0000MT-DH
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oDO14-0001PN-E5
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:30:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658140216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90R/ykNmYemsZUIo8Txp8n7gclp9lHJx8ek2yyJR/wY=;
 b=ORrp/xpo68+fc+rLVjHGqIyNBvVoiV0gVEgAYDazQZuzFZABpSjiOgMKSb/tN6u2Alr7iP
 wCV+FA9L1dVD5gKHuXh27h7RLLqgPP3X2f1cH4chLfm+SwovKYER/f4uruY7xBIQYQp0vo
 CTTcSHFYH/UhaM004s5NqxzlEcnsFLA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-450-fX6F-giGMYaXzKF_eTOcKA-1; Mon, 18 Jul 2022 06:30:05 -0400
X-MC-Unique: fX6F-giGMYaXzKF_eTOcKA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 554A4802D1C;
 Mon, 18 Jul 2022 10:30:05 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.86])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 862C02166B29;
 Mon, 18 Jul 2022 10:30:00 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Cindy Lu <lulu@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Jason Wang <jasowang@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Harpreet Singh Anand <hanand@xilinx.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Parav Pandit <parav@mellanox.com>
Subject: [PATCH v4 02/19] virtio-net: Expose MAC_TABLE_ENTRIES
Date: Mon, 18 Jul 2022 12:29:32 +0200
Message-Id: <20220718102949.2868267-3-eperezma@redhat.com>
In-Reply-To: <20220718102949.2868267-1-eperezma@redhat.com>
References: <20220718102949.2868267-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

vhost-vdpa control virtqueue needs to know the maximum entries supported
by the virtio-net device, so we know if it is possible to apply the
filter.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/hw/virtio/virtio-net.h | 3 +++
 hw/net/virtio-net.c            | 1 -
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/include/hw/virtio/virtio-net.h b/include/hw/virtio/virtio-net.h
index eb87032627..cce1c554f7 100644
--- a/include/hw/virtio/virtio-net.h
+++ b/include/hw/virtio/virtio-net.h
@@ -35,6 +35,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(VirtIONet, VIRTIO_NET)
  * and latency. */
 #define TX_BURST 256
 
+/* Maximum VIRTIO_NET_CTRL_MAC_TABLE_SET unicast + multicast entries. */
+#define MAC_TABLE_ENTRIES    64
+
 typedef struct virtio_net_conf
 {
     uint32_t txtimer;
diff --git a/hw/net/virtio-net.c b/hw/net/virtio-net.c
index 7ad948ee7c..f83e96e4ce 100644
--- a/hw/net/virtio-net.c
+++ b/hw/net/virtio-net.c
@@ -49,7 +49,6 @@
 
 #define VIRTIO_NET_VM_VERSION    11
 
-#define MAC_TABLE_ENTRIES    64
 #define MAX_VLAN    (1 << 12)   /* Per 802.1Q definition */
 
 /* previously fixed value */
-- 
2.31.1


