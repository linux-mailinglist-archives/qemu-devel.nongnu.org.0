Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 964A46B2342
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 12:41:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paEcs-00042C-H6; Thu, 09 Mar 2023 06:40:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1paEcp-00041B-KB
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:39:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1paEco-0005Gi-1Z
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 06:39:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678361997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/2eNJqhHI3gfR9mUY5qVgRSvfJMgxuSQ5FJtMSTV8iA=;
 b=L5YuxtJxG7hyb036uzvPPYwzgg9Uvu8qAXj/ONqiuTql1oCt6CPLFnkWizYGEXKf/DzUUD
 aAyFGZX7gkXHC/j05foYxhanH/pQUaJ+nYVVXLa0GBiRhsUmi2s7XJzwsJSazyiPv31Ixl
 W7lpjcG6LxVdAKRoYjEYpsEm+vhGaII=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-WzI4WbdqMQekZsJ1YmiNjQ-1; Thu, 09 Mar 2023 06:39:56 -0500
X-MC-Unique: WzI4WbdqMQekZsJ1YmiNjQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E07E71C02D4A;
 Thu,  9 Mar 2023 11:39:55 +0000 (UTC)
Received: from pick.home.annexia.org (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0429940AE20A;
 Thu,  9 Mar 2023 11:39:54 +0000 (UTC)
From: "Richard W.M. Jones" <rjones@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, vsementsov@yandex-team.ru, eblake@redhat.com,
 hreitz@redhat.com, kwolf@redhat.com
Subject: [PATCH nbd 1/4] nbd: Add multi-conn option
Date: Thu,  9 Mar 2023 11:39:43 +0000
Message-Id: <20230309113946.1528247-2-rjones@redhat.com>
In-Reply-To: <20230309113946.1528247-1-rjones@redhat.com>
References: <20230309113946.1528247-1-rjones@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add multi-conn option to the NBD client.  This commit just adds the
option, it is not functional.

Setting this to a value > 1 permits multiple connections to the NBD
server; a typical value might be 4.  The default is 1, meaning only a
single connection is made.  If the NBD server does not advertise that
it is safe for multi-conn then this setting is forced to 1.

Signed-off-by: Richard W.M. Jones <rjones@redhat.com>
---
 block/nbd.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index bf2894ad5c..5ffae0b798 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -49,6 +49,7 @@
 
 #define EN_OPTSTR ":exportname="
 #define MAX_NBD_REQUESTS    16
+#define MAX_MULTI_CONN      16
 
 #define HANDLE_TO_INDEX(bs, handle) ((handle) ^ (uint64_t)(intptr_t)(bs))
 #define INDEX_TO_HANDLE(bs, index)  ((index)  ^ (uint64_t)(intptr_t)(bs))
@@ -98,6 +99,7 @@ typedef struct BDRVNBDState {
     /* Connection parameters */
     uint32_t reconnect_delay;
     uint32_t open_timeout;
+    uint32_t multi_conn;
     SocketAddress *saddr;
     char *export;
     char *tlscredsid;
@@ -1803,6 +1805,15 @@ static QemuOptsList nbd_runtime_opts = {
                     "attempts until successful or until @open-timeout seconds "
                     "have elapsed. Default 0",
         },
+        {
+            .name = "multi-conn",
+            .type = QEMU_OPT_NUMBER,
+            .help = "If > 1 permit up to this number of connections to the "
+                    "server. The server must also advertise multi-conn "
+                    "support.  If <= 1, only a single connection is made "
+                    "to the server even if the server advertises multi-conn. "
+                    "Default 1",
+        },
         { /* end of list */ }
     },
 };
@@ -1858,6 +1869,10 @@ static int nbd_process_options(BlockDriverState *bs, QDict *options,
 
     s->reconnect_delay = qemu_opt_get_number(opts, "reconnect-delay", 0);
     s->open_timeout = qemu_opt_get_number(opts, "open-timeout", 0);
+    s->multi_conn = qemu_opt_get_number(opts, "multi-conn", 1);
+    if (s->multi_conn > MAX_MULTI_CONN) {
+        s->multi_conn = MAX_MULTI_CONN;
+    }
 
     ret = 0;
 
@@ -1912,6 +1927,15 @@ static int nbd_open(BlockDriverState *bs, QDict *options, int flags,
 
     nbd_client_connection_enable_retry(s->conn);
 
+    /*
+     * We set s->multi_conn in nbd_process_options above, but now that
+     * we have connected if the server doesn't advertise that it is
+     * safe for multi-conn, force it to 1.
+     */
+    if (!(s->info.flags & NBD_FLAG_CAN_MULTI_CONN)) {
+        s->multi_conn = 1;
+    }
+
     return 0;
 
 fail:
-- 
2.39.2


