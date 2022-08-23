Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D48B259EB37
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:39:47 +0200 (CEST)
Received: from localhost ([::1]:34176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQYoT-00069k-Ut
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYgG-0000Jk-Fn
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:31:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYgB-0004U2-I3
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:31:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661279470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FRxq8ciCEMSnJTweqk0QLYXUY8mWdYiCDr7lk4zv7tU=;
 b=ECb36pRcDluT3K/V/m8H4KLJVxKDOQkV5O+JDHuPYhelhrZSInNspOzi8hjTimxFLsWU/X
 oc+xNJRybbA6F6roye8OteVShoYF85L/LvFzEQV4AVteBO0YpBX3ozQsUJ3b0LcF61aMZU
 K5E42OwKlCqT4cLuNH8hoz8MYxVjFcc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-9-naAhz8acNga_5s9fQJELzw-1; Tue, 23 Aug 2022 14:31:04 -0400
X-MC-Unique: naAhz8acNga_5s9fQJELzw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C2B4285A589;
 Tue, 23 Aug 2022 18:31:03 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D77DAC15BBA;
 Tue, 23 Aug 2022 18:31:00 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Eli Cohen <eli@mellanox.com>,
 Cornelia Huck <cohuck@redhat.com>, Gautam Dawar <gdawar@xilinx.com>,
 Jason Wang <jasowang@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>, Cindy Lu <lulu@redhat.com>
Subject: [PATCH v10 05/12] vhost_net: Add NetClientInfo start callback
Date: Tue, 23 Aug 2022 20:30:30 +0200
Message-Id: <20220823183037.98470-6-eperezma@redhat.com>
In-Reply-To: <20220823183037.98470-1-eperezma@redhat.com>
References: <20220823183037.98470-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

This is used by the backend to perform actions before the device is
started.

In particular, vdpa net use it to map CVQ buffers to the device, so it
can send control commands using them.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
v9: Rename also in patch message
v8: Rename NetClientInfo prepare callback to start, so it aligns with
    future "stop"
---
 include/net/net.h  | 2 ++
 hw/net/vhost_net.c | 7 +++++++
 2 files changed, 9 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index 523136c7ac..ad9e80083a 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -44,6 +44,7 @@ typedef struct NICConf {
 
 typedef void (NetPoll)(NetClientState *, bool enable);
 typedef bool (NetCanReceive)(NetClientState *);
+typedef int (NetStart)(NetClientState *);
 typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t);
 typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *, int);
 typedef void (NetCleanup) (NetClientState *);
@@ -71,6 +72,7 @@ typedef struct NetClientInfo {
     NetReceive *receive_raw;
     NetReceiveIOV *receive_iov;
     NetCanReceive *can_receive;
+    NetStart *start;
     NetCleanup *cleanup;
     LinkStatusChanged *link_status_changed;
     QueryRxFilter *query_rx_filter;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index ccac5b7a64..2e0baeba26 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -244,6 +244,13 @@ static int vhost_net_start_one(struct vhost_net *net,
     struct vhost_vring_file file = { };
     int r;
 
+    if (net->nc->info->start) {
+        r = net->nc->info->start(net->nc);
+        if (r < 0) {
+            return r;
+        }
+    }
+
     r = vhost_dev_enable_notifiers(&net->dev, dev);
     if (r < 0) {
         goto fail_notifiers;
-- 
2.31.1


