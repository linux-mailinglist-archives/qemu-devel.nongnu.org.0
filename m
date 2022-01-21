Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DCC4963E0
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 18:26:10 +0100 (CET)
Received: from localhost ([::1]:35070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAxfs-0006d0-Nr
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 12:26:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxN7-0007kn-E2
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAxN1-0000Kv-5a
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 12:06:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642784798;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aVUhdFpQe2xu5bQwAqRpgnYHWE6j/3TLH0+BvrTp3no=;
 b=EhYpcxLLho5jhFqGujc0+UapMSYvZtmRadOBKZ5QaVYEj7dXA4aJNGObuxV2xRbaa7BYka
 2jQHkQmKOKpefKX8zqJDOjfyRnZ+h03C/GuPXrnJgjmuDYAN7NPNa/B62a2Yn81GCySLD5
 bsX58+WdIoluit1QDLIBchfQjWMKN2Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-VH_g_XSvNZm5THVUzh08yw-1; Fri, 21 Jan 2022 12:06:35 -0500
X-MC-Unique: VH_g_XSvNZm5THVUzh08yw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 417E8190B2A0;
 Fri, 21 Jan 2022 17:06:33 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9EFAB7EBCA;
 Fri, 21 Jan 2022 17:06:31 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v6 19/33] block: introduce bdrv_activate
Date: Fri, 21 Jan 2022 12:05:30 -0500
Message-Id: <20220121170544.2049944-20-eesposit@redhat.com>
In-Reply-To: <20220121170544.2049944-1-eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>, Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Markus Armbruster <armbru@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This function is currently just a wrapper for bdrv_invalidate_cache(),
but in future will contain the code of bdrv_co_invalidate_cache() that
has to always be protected by BQL, and leave the rest in the I/O
coroutine.

Replace all bdrv_invalidate_cache() invokations with bdrv_activate().

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block.c                            | 7 ++++++-
 block/block-backend.c              | 2 +-
 block/export/export.c              | 2 +-
 block/parallels.c                  | 2 +-
 include/block/block-global-state.h | 2 +-
 tests/unit/test-block-iothread.c   | 2 +-
 6 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/block.c b/block.c
index 0e119a0860..73c4e0a5a5 100644
--- a/block.c
+++ b/block.c
@@ -6549,6 +6549,11 @@ void bdrv_init_with_whitelist(void)
     bdrv_init();
 }
 
+int bdrv_activate(BlockDriverState *bs, Error **errp)
+{
+    return bdrv_invalidate_cache(bs, errp);
+}
+
 int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
 {
     BdrvChild *child, *parent;
@@ -6636,7 +6641,7 @@ void bdrv_invalidate_cache_all(Error **errp)
         int ret;
 
         aio_context_acquire(aio_context);
-        ret = bdrv_invalidate_cache(bs, errp);
+        ret = bdrv_activate(bs, errp);
         aio_context_release(aio_context);
         if (ret < 0) {
             bdrv_next_cleanup(&it);
diff --git a/block/block-backend.c b/block/block-backend.c
index 048ba83f37..a962fc407a 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1940,7 +1940,7 @@ void blk_invalidate_cache(BlockBackend *blk, Error **errp)
         return;
     }
 
-    bdrv_invalidate_cache(bs, errp);
+    bdrv_activate(bs, errp);
 }
 
 bool blk_is_inserted(BlockBackend *blk)
diff --git a/block/export/export.c b/block/export/export.c
index 6d3b9964c8..7253af3bc3 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -139,7 +139,7 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
      * access since the export could be available before migration handover.
      * ctx was acquired in the caller.
      */
-    bdrv_invalidate_cache(bs, NULL);
+    bdrv_activate(bs, NULL);
 
     perm = BLK_PERM_CONSISTENT_READ;
     if (export->writable) {
diff --git a/block/parallels.c b/block/parallels.c
index 6ebad2a2bb..e58c828422 100644
--- a/block/parallels.c
+++ b/block/parallels.c
@@ -873,7 +873,7 @@ static int parallels_open(BlockDriverState *bs, QDict *options, int flags,
     s->bat_dirty_bmap =
         bitmap_new(DIV_ROUND_UP(s->header_size, s->bat_dirty_block));
 
-    /* Disable migration until bdrv_invalidate_cache method is added */
+    /* Disable migration until bdrv_activate method is added */
     error_setg(&s->migration_blocker, "The Parallels format used by node '%s' "
                "does not support live migration",
                bdrv_get_device_or_node_name(bs));
diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 419fe8427f..a98113189e 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -143,8 +143,8 @@ BlockDriverState *check_to_replace_node(BlockDriverState *parent_bs,
 
 /* async block I/O */
 void bdrv_aio_cancel(BlockAIOCB *acb);
+int bdrv_activate(BlockDriverState *bs, Error **errp);
 void bdrv_invalidate_cache_all(Error **errp);
-
 int bdrv_inactivate_all(void);
 
 int bdrv_flush_all(void);
diff --git a/tests/unit/test-block-iothread.c b/tests/unit/test-block-iothread.c
index aea660aeed..378a7b7869 100644
--- a/tests/unit/test-block-iothread.c
+++ b/tests/unit/test-block-iothread.c
@@ -282,7 +282,7 @@ static void test_sync_op_check(BdrvChild *c)
 static void test_sync_op_invalidate_cache(BdrvChild *c)
 {
     /* Early success: Image is not inactive */
-    bdrv_invalidate_cache(c->bs, NULL);
+    bdrv_activate(c->bs, NULL);
 }
 
 
-- 
2.31.1


