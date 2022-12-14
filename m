Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFCE964C524
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Dec 2022 09:37:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5MWH-0005Ay-Im; Wed, 14 Dec 2022 02:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MVu-0004sk-Rw
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:49:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1p5MVq-0003t7-Cw
 for qemu-devel@nongnu.org; Wed, 14 Dec 2022 02:49:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671004149;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZZRwhE1xKN0CA/F1JsARn3W6nBLiCdT0U9+UWX3WYC8=;
 b=CKKl4cnLVjJ52RHRbAsjQkdTuhZbEegXOEBgeJulnU99VZ5RrrjUqTC1x1ppb8sGYKomhe
 fe/VPN5bnzLSNqo8wPEJZ724NMhHqZR/x9TwfBBIKxO4DGWE7WafNehRsP0eH4Ima1Il6c
 qJ6eUNSRPluNvhPHoy1YRJndJ1XPTRE=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-uDt7JTzCM7OKtHGVkYc6yQ-1; Wed, 14 Dec 2022 02:47:29 -0500
X-MC-Unique: uDt7JTzCM7OKtHGVkYc6yQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A49323C0252D;
 Wed, 14 Dec 2022 07:47:28 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 03B97492C14;
 Wed, 14 Dec 2022 07:47:28 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6569B21E649B; Wed, 14 Dec 2022 08:47:21 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Cc: Eric Blake <eblake@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-block@nongnu.org
Subject: [PULL 09/30] nbd/server: Clean up abuse of BlockExportOptionsNbd
 member @arg
Date: Wed, 14 Dec 2022 08:47:00 +0100
Message-Id: <20221214074721.731441-12-armbru@redhat.com>
In-Reply-To: <20221214074721.731441-1-armbru@redhat.com>
References: <20221214074721.731441-1-armbru@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
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
Message-Id: <20221104160712.3005652-10-armbru@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
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


