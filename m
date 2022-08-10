Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 105F958F286
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 20:49:27 +0200 (CEST)
Received: from localhost ([::1]:53244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLqle-0007pp-LA
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 14:49:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfG-00028w-Gi
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oLqfC-0006iZ-1K
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 14:42:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660156961;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JIy294Nk8MMn2A5k68elxAY+jDuXdJrJI/yT3QsTNOo=;
 b=S8w6MCj0IIaGRJI3drYS2NwRdkvx4uBIOAhsPqot0ZZETD25vnwkKKT4UmQUU9Lnm2zkta
 sR6LH9PrEEHBlJhN9cyb+vYH3E84IQvc9Z2RokrTFpidcZUbx8qoBP0pXZIyVZz87dBce0
 9T+EEtyz+8ArcpvZk5bTKQBlErZbUJg=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-616-j1rJP7exM_uCUuxEyiNgfA-1; Wed, 10 Aug 2022 14:42:37 -0400
X-MC-Unique: j1rJP7exM_uCUuxEyiNgfA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EFD253800C34;
 Wed, 10 Aug 2022 18:42:36 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.193.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 690B0C15BA3;
 Wed, 10 Aug 2022 18:42:34 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>, Cindy Lu <lulu@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Parav Pandit <parav@mellanox.com>, Zhu Lingshan <lingshan.zhu@intel.com>,
 Gautam Dawar <gdawar@xilinx.com>, Liuxiangdong <liuxiangdong5@huawei.com>,
 Jason Wang <jasowang@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, Stefano Garzarella <sgarzare@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Harpreet Singh Anand <hanand@xilinx.com>
Subject: [RFC 4/8] vdpa: Add log_enabled to VhostVDPAState
Date: Wed, 10 Aug 2022 20:42:16 +0200
Message-Id: <20220810184220.2362292-5-eperezma@redhat.com>
In-Reply-To: <20220810184220.2362292-1-eperezma@redhat.com>
References: <20220810184220.2362292-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
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

This enables VhostVDPAState to track the logging of the memory.

It cannot be merged with s->always_svq because always_svq is immutable
from the moment the device is parsed, and log_enabled must be enabled or
disabled depending on the log state.

Apart from that, they will affect the same to vhost vdpa device,
enabling the shadow virtqueue unconditionally.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 net/vhost-vdpa.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 85b10799bd..a035c89c34 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -42,6 +42,10 @@ typedef struct VhostVDPAState {
 
     /* The device always have SVQ enabled */
     bool always_svq;
+
+    /* Device log enabled */
+    bool log_enabled;
+
     bool started;
 } VhostVDPAState;
 
@@ -346,15 +350,15 @@ static int vhost_vdpa_net_cvq_start(NetClientState *nc)
     cvq_group.index = v->dev->vq_index_end - 1;
 
     /* Default values */
-    v->listener_shadow_vq = s->always_svq;
-    v->shadow_vqs_enabled = s->always_svq;
+    v->listener_shadow_vq = s->always_svq || s->log_enabled;
+    v->shadow_vqs_enabled = s->always_svq || s->log_enabled;
     s->vhost_vdpa.address_space_id = VHOST_VDPA_NET_CVQ_PASSTHROUGH;
 
     if (s->address_space_num < 2) {
         return 0;
     }
 
-    if (s->always_svq) {
+    if (s->always_svq || s->log_enabled) {
         goto out;
     }
 
-- 
2.31.1


