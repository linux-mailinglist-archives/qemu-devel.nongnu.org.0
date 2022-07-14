Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8DD5752F6
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 18:39:10 +0200 (CEST)
Received: from localhost ([::1]:45914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oC1rq-0001Nm-4V
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 12:39:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1lA-0007Am-NP
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oC1l3-0003JS-Bj
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 12:32:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657816328;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=90R/ykNmYemsZUIo8Txp8n7gclp9lHJx8ek2yyJR/wY=;
 b=UIUSplaxtPdLwB3O8k8XEJSzUThQyIOg4Qwl2l3yd3r8tQ/m/KvpJV3N7CMfNeIDqaZ3m3
 DJSMGx9wSFeVFYxScf5qdQ+CNd+QR7yfMwgR00b4HCeZ5n2hiygKq27UOZQiNw7Jl8b41Y
 c+nJrpTxYb+ga4mJG4hRl+AXpXhvMUg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-LiiVDhwVNaymhn4l3Wxlzw-1; Thu, 14 Jul 2022 12:32:02 -0400
X-MC-Unique: LiiVDhwVNaymhn4l3Wxlzw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0E76D1C05AC3;
 Thu, 14 Jul 2022 16:32:02 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.102])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 22FF01121314;
 Thu, 14 Jul 2022 16:31:59 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Gautam Dawar <gdawar@xilinx.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Laurent Vivier <lvivier@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Jason Wang <jasowang@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>
Subject: [PATCH v2 02/19] virtio-net: Expose MAC_TABLE_ENTRIES
Date: Thu, 14 Jul 2022 18:31:33 +0200
Message-Id: <20220714163150.2536327-3-eperezma@redhat.com>
In-Reply-To: <20220714163150.2536327-1-eperezma@redhat.com>
References: <20220714163150.2536327-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
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


