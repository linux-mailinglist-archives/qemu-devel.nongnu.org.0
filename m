Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A49B5AA8A0
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Sep 2022 09:16:43 +0200 (CEST)
Received: from localhost ([::1]:43420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oU0uv-00062i-QV
	for lists+qemu-devel@lfdr.de; Fri, 02 Sep 2022 03:16:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0O0-0007Zq-Mu
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oU0Nx-0004wF-AZ
 for qemu-devel@nongnu.org; Fri, 02 Sep 2022 02:42:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662100956;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O3PvhGKdwoknSbt99qtirFcte1LSvf6Bbljcr+M3oo8=;
 b=MSB59ktGwP+U50tqVvmz+1LJBcnV7grNABbTNMn6yINIBFw/NdegOwGGDWEBAkLIMu0t1m
 TLTL1ERdq68HW+JUUOqxPpGuDGoFdt2cxv6S4ZuOqejhdZm7A68rrgigMVUAu0kJFln4fh
 KC4xrK/o+6sEa2ldly1d/y59hCaJNjc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-49HmXTqNMR6F4Vo3gEg0gg-1; Fri, 02 Sep 2022 02:42:34 -0400
X-MC-Unique: 49HmXTqNMR6F4Vo3gEg0gg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5232E1857F0F;
 Fri,  2 Sep 2022 06:42:34 +0000 (UTC)
Received: from localhost.localdomain (ovpn-12-152.pek2.redhat.com
 [10.72.12.152])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3D6CE1415137;
 Fri,  2 Sep 2022 06:42:31 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 17/21] vhost_net: add NetClientState->load() callback
Date: Fri,  2 Sep 2022 14:41:34 +0800
Message-Id: <20220902064138.56468-18-jasowang@redhat.com>
In-Reply-To: <20220902064138.56468-1-jasowang@redhat.com>
References: <20220902064138.56468-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

It allows per-net client operations right after device's successful
start. In particular, to load the device status.

Vhost-vdpa net will use it to add the CVQ buffers to restore the device
status.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/vhost_net.c | 7 +++++++
 include/net/net.h  | 2 ++
 2 files changed, 9 insertions(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 9d4b334..d28f8b9 100644
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
diff --git a/include/net/net.h b/include/net/net.h
index 476ad45..81d0b21 100644
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
-- 
2.7.4


