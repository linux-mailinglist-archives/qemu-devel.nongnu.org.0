Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EDC757E28D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jul 2022 15:49:08 +0200 (CEST)
Received: from localhost ([::1]:35934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEt1f-0006Bv-6W
	for lists+qemu-devel@lfdr.de; Fri, 22 Jul 2022 09:49:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEswS-00057E-H3
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:43:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:51545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1oEswR-0004JU-0Q
 for qemu-devel@nongnu.org; Fri, 22 Jul 2022 09:43:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658497422;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Le7Hgc2vUuS2ywF+v5z7y32fvz0IBUd34jg+USfjtsQ=;
 b=ItNAQ00HhxEGIleQxubfm6vctN8PrksAWEsjukZ6Vwzu8yb6NfMhplL2Mxus0uoIkkegQv
 R2xMO09dyawy5smNoY1bR7hEu2/EorsOwsBWN8dxZIwLoM41O974DkPTGemSdrW9/6FAE3
 OgeeK3bWxe6YIbN9nS9dmMcMFAaZ4Ak=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-5_yV2SY8NqqwuRFwdi8PIg-1; Fri, 22 Jul 2022 09:43:41 -0400
X-MC-Unique: 5_yV2SY8NqqwuRFwdi8PIg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72D80811E7A;
 Fri, 22 Jul 2022 13:43:40 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.161])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A426E401E7B;
 Fri, 22 Jul 2022 13:43:37 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Cc: Jason Wang <jasowang@redhat.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Cindy Lu <lulu@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, Parav Pandit <parav@mellanox.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Gautam Dawar <gdawar@xilinx.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Stefano Garzarella <sgarzare@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Laurent Vivier <lvivier@redhat.com>
Subject: [PATCH v2 6/7] vhost_net: Add NetClientInfo prepare callback
Date: Fri, 22 Jul 2022 15:43:17 +0200
Message-Id: <20220722134318.3430667-7-eperezma@redhat.com>
In-Reply-To: <20220722134318.3430667-1-eperezma@redhat.com>
References: <20220722134318.3430667-1-eperezma@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
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

This is used by the backend to perform actions before the device is
started.

In particular, vdpa will use it to isolate CVQ in its own ASID if
possible, and start SVQ unconditionally only in CVQ.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/net/net.h  | 2 ++
 hw/net/vhost_net.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index ad9e80083a..37aecff8f7 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -44,6 +44,7 @@ typedef struct NICConf {
 
 typedef void (NetPoll)(NetClientState *, bool enable);
 typedef bool (NetCanReceive)(NetClientState *);
+typedef void (NetPrepare)(NetClientState *);
 typedef int (NetStart)(NetClientState *);
 typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t);
 typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *, int);
@@ -72,6 +73,7 @@ typedef struct NetClientInfo {
     NetReceive *receive_raw;
     NetReceiveIOV *receive_iov;
     NetCanReceive *can_receive;
+    NetPrepare *prepare;
     NetStart *start;
     NetCleanup *cleanup;
     LinkStatusChanged *link_status_changed;
diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index ddd9ee0441..0fc892c22b 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -244,6 +244,10 @@ static int vhost_net_start_one(struct vhost_net *net,
     struct vhost_vring_file file = { };
     int r;
 
+    if (net->nc->info->prepare) {
+        net->nc->info->prepare(net->nc);
+    }
+
     r = vhost_dev_enable_notifiers(&net->dev, dev);
     if (r < 0) {
         goto fail_notifiers;
-- 
2.31.1


