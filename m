Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A64C059A2E2
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 19:27:38 +0200 (CEST)
Received: from localhost ([::1]:52974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oP5mT-0005Kr-PR
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 13:27:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5NZ-0008Fy-Lb
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:02:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oP5NJ-0001xF-8a
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 13:01:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660928496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PdIb3W14cumQFNdhDPoV8yUwQEomsAtIsjTleyRBfc4=;
 b=QBEwdz/seEGM+0XfuJbMs3b/x8ElfWzMmqPfUZu8tQj4cixbeT0KvMEDpFycZ7qnnyk+7a
 zaDI6600fKiQKo80/IRiihp+vk+Q1CFvdTpHDdJkeb3pHWtSPRxRu3kfwTdWGxeLaXtdLH
 SeAmKcw/VesYqRdWx4ET7khl1nZ55dc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-249-HX5arSe3OHmMZbRbBZ4L9Q-1; Fri, 19 Aug 2022 13:01:33 -0400
X-MC-Unique: HX5arSe3OHmMZbRbBZ4L9Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E1C321C08977;
 Fri, 19 Aug 2022 17:01:32 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1C0FA40D2827;
 Fri, 19 Aug 2022 17:01:28 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Harpreet Singh Anand <hanand@xilinx.com>,
 Laurent Vivier <lvivier@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Jason Wang <jasowang@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eric Blake <eblake@redhat.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v9 10/12] vhost_net: add NetClientState->load() callback
Date: Fri, 19 Aug 2022 19:00:46 +0200
Message-Id: <20220819170048.3593487-11-eperezma@redhat.com>
In-Reply-To: <20220819170048.3593487-1-eperezma@redhat.com>
References: <20220819170048.3593487-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Acked-by: Jason Wang <jasowang@redhat.com>
---
v5: Rename start / load, naming it more specifically.
---
 include/net/net.h  | 2 ++
 hw/net/vhost_net.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index 476ad45b9a..81d0b21def 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -45,6 +45,7 @@ typedef struct NICConf {
 typedef void (NetPoll)(NetClientState *, bool enable);
 typedef bool (NetCanReceive)(NetClientState *);
 typedef int (NetStart)(NetClientState *);
+typedef int (NetLoad)(NetClientState *);
 typedef void (NetStop)(NetClientState *);
 typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t);
 typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *, int);
@@ -74,6 +75,7 @@ typedef struct NetClientInfo {
     NetReceiveIOV *receive_iov;
     NetCanReceive *can_receive;
     NetStart *start;
+    NetLoad *load;
     NetStop *stop;
     NetCleanup *cleanup;
     LinkStatusChanged *link_status_changed;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 9d4b334453..d28f8b974b 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -281,6 +281,13 @@ static int vhost_net_start_one(struct vhost_net *net,
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


