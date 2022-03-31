Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43FD4EE067
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 20:27:48 +0200 (CEST)
Received: from localhost ([::1]:48488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZzWN-0001HW-Rv
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 14:27:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzAL-000558-2n
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:05:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36369)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eperezma@redhat.com>)
 id 1nZzAJ-0007RI-5Z
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 14:05:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648749898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uUR6TjwCWYCo3LuSdLeQzS9X+JAPaHgWLCnfsrZtvRs=;
 b=U/qYNAQXsvnRUXVKSOwhV9BjjqrBi7dE8Fb5tOheAX+qIWpvyLULoi6+VzufaDujee34Ll
 8IgQxkhild3VhOtx7gxwmLLliqLn3K5q2OtdrvmBSqt4gx5lpG8RoDcO/lPEWlp190o/0j
 Z82eK5t83C+lTTce/1t2S4q5XbsM2Js=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-261-x0Ubgxp4NtOm9Kki1I0unA-1; Thu, 31 Mar 2022 14:04:57 -0400
X-MC-Unique: x0Ubgxp4NtOm9Kki1I0unA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9C1C1811E76;
 Thu, 31 Mar 2022 18:04:56 +0000 (UTC)
Received: from eperezma.remote.csb (unknown [10.39.194.94])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 309B440CF8EB;
 Thu, 31 Mar 2022 18:04:54 +0000 (UTC)
From: =?UTF-8?q?Eugenio=20P=C3=A9rez?= <eperezma@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v4 16/20] vdpa: add NetClientState->start() callback
Date: Thu, 31 Mar 2022 20:04:06 +0200
Message-Id: <20220331180410.531837-17-eperezma@redhat.com>
In-Reply-To: <20220331180410.531837-1-eperezma@redhat.com>
References: <20220331180410.531837-1-eperezma@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eperezma@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eperezma@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Parav Pandit <parav@mellanox.com>,
 Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Gautam Dawar <gdawar@xilinx.com>, Harpreet Singh Anand <hanand@xilinx.com>,
 Peter Xu <peterx@redhat.com>, Eli Cohen <eli@mellanox.com>,
 Liuxiangdong <liuxiangdong5@huawei.com>, Zhu Lingshan <lingshan.zhu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It allows to inject custom code on device success start, right before
release lock.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
---
 include/net/net.h  | 2 ++
 hw/net/vhost_net.c | 4 ++++
 2 files changed, 6 insertions(+)

diff --git a/include/net/net.h b/include/net/net.h
index 523136c7ac..2fc3002ab4 100644
--- a/include/net/net.h
+++ b/include/net/net.h
@@ -44,6 +44,7 @@ typedef struct NICConf {
 
 typedef void (NetPoll)(NetClientState *, bool enable);
 typedef bool (NetCanReceive)(NetClientState *);
+typedef void (NetStart)(NetClientState *);
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
index 30379d2ca4..44a105ec29 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -274,6 +274,10 @@ static int vhost_net_start_one(struct vhost_net *net,
             }
         }
     }
+
+    if (net->nc->info->start) {
+        net->nc->info->start(net->nc);
+    }
     return 0;
 fail:
     file.fd = -1;
-- 
2.27.0


