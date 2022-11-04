Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E90E619CC2
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 17:14:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqzF6-00010M-PM; Fri, 04 Nov 2022 12:08:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzEP-0008Hf-FW
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oqzE9-0007do-4A
 for qemu-devel@nongnu.org; Fri, 04 Nov 2022 12:07:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667578038;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PZ4YO+4nzUkO+2zB3AgiXLxWXC/C0COaEQchV0GHDuE=;
 b=JViI0panXnMuhyF+ujRKKr6Wc+O+sMZ65/YWluhRJ2KQOurMhyi29SwazUNkqBrqv1yGLj
 dngyMkkDULY44vHBvlIoI6Z9gjP7D66XY4gbo40WTlsba2miD/GW8eXPqCq0wsh8DjPo7q
 Kok0HcGHsfNmcaUImQlZh3kv9bHHhHE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-26-aXdfVZfxMsme1yC5BjhNWA-1; Fri, 04 Nov 2022 12:07:15 -0400
X-MC-Unique: aXdfVZfxMsme1yC5BjhNWA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CB15D85A59D;
 Fri,  4 Nov 2022 16:07:14 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 868D140C6EE9;
 Fri,  4 Nov 2022 16:07:14 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 49FE821E649C; Fri,  4 Nov 2022 17:07:12 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, eblake@redhat.com, michael.roth@amd.com,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Subject: [PATCH v3 09/30] nbd/server: Clean up abuse of BlockExportOptionsNbd
 member @arg
Date: Fri,  4 Nov 2022 17:06:51 +0100
Message-Id: <20221104160712.3005652-10-armbru@redhat.com>
In-Reply-To: <20221104160712.3005652-1-armbru@redhat.com>
References: <20221104160712.3005652-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

block-export-add argument @name defaults to the value of argument
@node-name.

nbd_export_create() implements this by copying @node_name to @name.
It leaves @has_node_name false, violating the "has_node_name ==
!!node_name" invariant.  Unclean.  Falls apart when we elide
@has_node_name (next commit): then QAPI frees the same value twice,
once for @node_name and once @name.  iotest 307 duly explodes.

Goes back to commit c62d24e906 "blockdev-nbd: Boxed argument type for
nbd-server-add" (v5.0.0).  Got moved from qmp_nbd_server_add() to
nbd_export_create() (commit 56ee86261e), then copied back (commit
b6076afcab).  Commit 8675cbd68b "nbd: Utilize QAPI_CLONE for type
conversion" (v5.2.0) cleaned up the copy in qmp_nbd_server_add()
noting

    Second, our assignment to arg->name is fishy: the generated QAPI code
    for qapi_free_NbdServerAddOptions does not visit arg->name if
    arg->has_name is false, but if it DID visit it, we would have
    introduced a double-free situation when arg is finally freed.

Exactly.  However, the copy in nbd_export_create() remained dirty.

Clean it up.  Since the value stored in member @name is not actually
used outside this function, use a local variable instead of modifying
the QAPI object.

Signed-off-by: Markus Armbruster <armbru@redhat.com>
Cc: Eric Blake <eblake@redhat.com>
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Cc: qemu-block@nongnu.org
---
 nbd/server.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index ada16089f3..0570596312 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1638,6 +1638,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
 {
     NBDExport *exp = container_of(blk_exp, NBDExport, common);
     BlockExportOptionsNbd *arg = &exp_args->u.nbd;
+    const char *name = arg->name ?: exp_args->node_name;
     BlockBackend *blk = blk_exp->blk;
     int64_t size;
     uint64_t perm, shared_perm;
@@ -1653,12 +1654,8 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
         return -EINVAL;
     }
 
-    if (!arg->has_name) {
-        arg->name = exp_args->node_name;
-    }
-
-    if (strlen(arg->name) > NBD_MAX_STRING_SIZE) {
-        error_setg(errp, "export name '%s' too long", arg->name);
+    if (strlen(name) > NBD_MAX_STRING_SIZE) {
+        error_setg(errp, "export name '%s' too long", name);
         return -EINVAL;
     }
 
@@ -1667,8 +1664,8 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
         return -EINVAL;
     }
 
-    if (nbd_export_find(arg->name)) {
-        error_setg(errp, "NBD server already has export named '%s'", arg->name);
+    if (nbd_export_find(name)) {
+        error_setg(errp, "NBD server already has export named '%s'", name);
         return -EEXIST;
     }
 
@@ -1688,7 +1685,7 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
     }
 
     QTAILQ_INIT(&exp->clients);
-    exp->name = g_strdup(arg->name);
+    exp->name = g_strdup(name);
     exp->description = g_strdup(arg->description);
     exp->nbdflags = (NBD_FLAG_HAS_FLAGS | NBD_FLAG_SEND_FLUSH |
                      NBD_FLAG_SEND_FUA | NBD_FLAG_SEND_CACHE);
-- 
2.37.3


