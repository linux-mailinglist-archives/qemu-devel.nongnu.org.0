Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B062391EBA
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 20:09:09 +0200 (CEST)
Received: from localhost ([::1]:45796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llxxs-0004T8-CI
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 14:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxcN-0003m8-DQ
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1llxcE-0000GG-6k
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:46:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622051205;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qVac0FKrE3OkbbvHYBHdw4eP77+uD9G/xjx5BqxLvLo=;
 b=C5fvocvrAEbZJGhyLnbuYxY9Wb3HCv4j65IJ8WeBykDmf8NiJJuZm5MUllZ7LeNXAzLebm
 Y037jobg6hWfvJPzUxXukKG5BSh14JpGLfx/kcv7X1rdELeqLS+hDOsCZIkfuedFsk0EWl
 hM8M7S4QaOcNQJ5TCl1iAvsy6NuurnQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-603-PkUxwOQ-PVCWozQfO998Qg-1; Wed, 26 May 2021 13:46:43 -0400
X-MC-Unique: PkUxwOQ-PVCWozQfO998Qg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E52651005D55;
 Wed, 26 May 2021 17:46:41 +0000 (UTC)
Received: from dgilbert-t580.localhost (ovpn-114-247.ams2.redhat.com
 [10.36.114.247])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CA3E05D9C6;
 Wed, 26 May 2021 17:46:37 +0000 (UTC)
From: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
To: qemu-devel@nongnu.org, kwolf@redhat.com, vgoyal@redhat.com,
 ma.mandourr@gmail.com, lizhijian@cn.fujitsu.com
Subject: [PULL 15/15] migration/rdma: source: poll cm_event from return path
Date: Wed, 26 May 2021 18:45:40 +0100
Message-Id: <20210526174540.290588-16-dgilbert@redhat.com>
In-Reply-To: <20210526174540.290588-1-dgilbert@redhat.com>
References: <20210526174540.290588-1-dgilbert@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peterx@redhat.com, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Li Zhijian <lizhijian@cn.fujitsu.com>

source side always blocks if postcopy is only enabled at source side.
users are not able to cancel this migration in this case.

Let source side have chance to cancel this migration

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
Message-Id: <20210525080552.28259-4-lizhijian@cn.fujitsu.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
  Typo fix
---
 migration/rdma.c | 42 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 4 deletions(-)

diff --git a/migration/rdma.c b/migration/rdma.c
index d829d08d07..1cdb4561f3 100644
--- a/migration/rdma.c
+++ b/migration/rdma.c
@@ -36,6 +36,7 @@
 #include <rdma/rdma_cma.h>
 #include "trace.h"
 #include "qom/object.h"
+#include <poll.h>
 
 /*
  * Print and error on both the Monitor and the Log file.
@@ -2460,7 +2461,36 @@ err_rdma_source_init:
     return -1;
 }
 
-static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
+static int qemu_get_cm_event_timeout(RDMAContext *rdma,
+                                     struct rdma_cm_event **cm_event,
+                                     long msec, Error **errp)
+{
+    int ret;
+    struct pollfd poll_fd = {
+                                .fd = rdma->channel->fd,
+                                .events = POLLIN,
+                                .revents = 0
+                            };
+
+    do {
+        ret = poll(&poll_fd, 1, msec);
+    } while (ret < 0 && errno == EINTR);
+
+    if (ret == 0) {
+        ERROR(errp, "poll cm event timeout");
+        return -1;
+    } else if (ret < 0) {
+        ERROR(errp, "failed to poll cm event, errno=%i", errno);
+        return -1;
+    } else if (poll_fd.revents & POLLIN) {
+        return rdma_get_cm_event(rdma->channel, cm_event);
+    } else {
+        ERROR(errp, "no POLLIN event, revent=%x", poll_fd.revents);
+        return -1;
+    }
+}
+
+static int qemu_rdma_connect(RDMAContext *rdma, Error **errp, bool return_path)
 {
     RDMACapabilities cap = {
                                 .version = RDMA_CONTROL_VERSION_CURRENT,
@@ -2498,7 +2528,11 @@ static int qemu_rdma_connect(RDMAContext *rdma, Error **errp)
         goto err_rdma_source_connect;
     }
 
-    ret = rdma_get_cm_event(rdma->channel, &cm_event);
+    if (return_path) {
+        ret = qemu_get_cm_event_timeout(rdma, &cm_event, 5000, errp);
+    } else {
+        ret = rdma_get_cm_event(rdma->channel, &cm_event);
+    }
     if (ret) {
         perror("rdma_get_cm_event after rdma_connect");
         ERROR(errp, "connecting to destination!");
@@ -4111,7 +4145,7 @@ void rdma_start_outgoing_migration(void *opaque,
     }
 
     trace_rdma_start_outgoing_migration_after_rdma_source_init();
-    ret = qemu_rdma_connect(rdma, errp);
+    ret = qemu_rdma_connect(rdma, errp, false);
 
     if (ret) {
         goto err;
@@ -4132,7 +4166,7 @@ void rdma_start_outgoing_migration(void *opaque,
             goto return_path_err;
         }
 
-        ret = qemu_rdma_connect(rdma_return_path, errp);
+        ret = qemu_rdma_connect(rdma_return_path, errp, true);
 
         if (ret) {
             goto return_path_err;
-- 
2.31.1


