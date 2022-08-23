Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 593DD59EB33
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Aug 2022 20:39:29 +0200 (CEST)
Received: from localhost ([::1]:58656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQYoB-0005zf-5x
	for lists+qemu-devel@lfdr.de; Tue, 23 Aug 2022 14:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYgK-0000Jq-8f
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:31:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oQYgE-0004UA-HK
 for qemu-devel@nongnu.org; Tue, 23 Aug 2022 14:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661279472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WlpLoJjbF+OwV7CNK6PkYjMOGlAsT4R2CbMa+M7daEg=;
 b=fCUHZfpv7GMsFfuswcYm8KXSsMgKSzuqcRWzs/H3nBs+eFZYJANmocodeMV+Y0lOQrWBTz
 uJbXQ8gKPPtJgL2qw/8F3Ia5UKXaoWGuTB3o+lzcFlj6lCnouBmwrYPNImQ+d2DKU4Cld/
 G/kzvzWEKGJA3TO1HgGG2Q6RtkGubgI=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-crfgc7fXN_-h95uhe3maQA-1; Tue, 23 Aug 2022 14:31:08 -0400
X-MC-Unique: crfgc7fXN_-h95uhe3maQA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 71ED13806723;
 Tue, 23 Aug 2022 18:31:07 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.195.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 10960C15BB3;
 Tue, 23 Aug 2022 18:31:03 +0000 (UTC)
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
Subject: [PATCH v10 06/12] vhost_net: Add NetClientInfo stop callback
Date: Tue, 23 Aug 2022 20:30:31 +0200
Message-Id: <20220823183037.98470-7-eperezma@redhat.com>
In-Reply-To: <20220823183037.98470-1-eperezma@redhat.com>
References: <20220823183037.98470-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Used by the backend to perform actions after the device is stopped.

In particular, vdpa net use it to unmap CVQ buffers to the device,
cleaning the actions performed in prepare().

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
v9: Replace performend by performed in patch message
---
 include/net/net.h  | 2 ++
 hw/net/vhost_net.c | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index ad9e80083a..476ad45b9a 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -45,6 +45,7 @@ typedef struct NICConf {
 typedef void (NetPoll)(NetClientState *, bool enable);
 typedef bool (NetCanReceive)(NetClientState *);
 typedef int (NetStart)(NetClientState *);
+typedef void (NetStop)(NetClientState *);
 typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t);
 typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *, int);
 typedef void (NetCleanup) (NetClientState *);
@@ -73,6 +74,7 @@ typedef struct NetClientInfo {
     NetReceiveIOV *receive_iov;
     NetCanReceive *can_receive;
     NetStart *start;
+    NetStop *stop;
     NetCleanup *cleanup;
     LinkStatusChanged *link_status_changed;
     QueryRxFilter *query_rx_filter;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 2e0baeba26..9d4b334453 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -320,6 +320,9 @@ static void vhost_net_stop_one(struct vhost_net *net,
         net->nc->info->poll(net->nc, true);
     }
     vhost_dev_stop(&net->dev, dev);
+    if (net->nc->info->stop) {
+        net->nc->info->stop(net->nc);
+    }
     vhost_dev_disable_notifiers(&net->dev, dev);
 }
 
-- 
2.31.1


