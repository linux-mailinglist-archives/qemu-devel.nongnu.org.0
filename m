Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A33F45881A3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 20:04:52 +0200 (CEST)
Received: from localhost ([::1]:47002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIwGB-0003aB-GH
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 14:04:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9Z-0001Uf-4q
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oIw9X-0003is-ME
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 13:58:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659463079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TWR/iUsjkL9oIXTi+ICA5zH5FX+8+oEnrInycmxf6Yo=;
 b=QXDaDHA07keGfHPyyKysGfxLM8wSZTcP85fw/KehY5SuLKhHZVjZX0KgOIPwjpL2ryLEd4
 r5nOYAmsVkX2h5adI2gUviUsrhN/1lWVpbeLF5BfE0A/0ZlDAUhhhiUXJ9nwK7lpiUNuip
 DehFiQ3Ptc9biRvucXza9JBMGIJ2cGI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-90-GSO0P-J-MoKAiuQ-Lrx2UA-1; Tue, 02 Aug 2022 13:57:57 -0400
X-MC-Unique: GSO0P-J-MoKAiuQ-Lrx2UA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31A2A8041BE;
 Tue,  2 Aug 2022 17:57:57 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.192.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5EC17492C3B;
 Tue,  2 Aug 2022 17:57:54 +0000 (UTC)
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
Subject: [PATCH v5 07/10] vdpa: add NetClientState->load() callback
Date: Tue,  2 Aug 2022 19:57:28 +0200
Message-Id: <20220802175731.312115-8-eperezma@redhat.com>
In-Reply-To: <20220802175731.312115-1-eperezma@redhat.com>
References: <20220802175731.312115-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

It allows per-net client operations right after device's successful
start. In particular, to load the device status.

Vhost-vdpa net will use it to add the CVQ buffers to restore the device
status.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
v5: Rename start / load, naming it more specifically.
---
 include/net/net.h  | 2 ++
 hw/net/vhost_net.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index 523136c7ac..a8d47309cd 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -44,6 +44,7 @@ typedef struct NICConf {
 
 typedef void (NetPoll)(NetClientState *, bool enable);
 typedef bool (NetCanReceive)(NetClientState *);
+typedef int (NetLoad)(NetClientState *);
 typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t);
 typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *, int);
 typedef void (NetCleanup) (NetClientState *);
@@ -71,6 +72,7 @@ typedef struct NetClientInfo {
     NetReceive *receive_raw;
     NetReceiveIOV *receive_iov;
     NetCanReceive *can_receive;
+    NetLoad *load;
     NetCleanup *cleanup;
     LinkStatusChanged *link_status_changed;
     QueryRxFilter *query_rx_filter;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index ccac5b7a64..a9bf72dcda 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -274,6 +274,13 @@ static int vhost_net_start_one(struct vhost_net *net,
             }
         }
     }
+
+    if (net->nc->info->load) {
+        r = net->nc->info->load(net->nc);
+        if (r < 0) {
+            goto fail;
+        }
+    }
     return 0;
 fail:
     file.fd = -1;
-- 
2.31.1


