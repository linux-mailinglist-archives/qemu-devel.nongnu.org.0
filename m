Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C19929A3E8
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Oct 2020 06:15:25 +0100 (CET)
Received: from localhost ([::1]:56416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kXHKO-0004l0-Dk
	for lists+qemu-devel@lfdr.de; Tue, 27 Oct 2020 01:15:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kXHBf-0003l6-4O
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 01:06:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36340)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kXHBZ-0003cy-5J
 for qemu-devel@nongnu.org; Tue, 27 Oct 2020 01:06:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603775175;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zwBP9HjsGxV5iraIIjZ56i2ALzjA/r7kkxOclK2kfv4=;
 b=CAdHtupqQAAL9ESWfZPKUcnbDrxBFQZQaVzF+JxT2+xYUJO8uTnhlri3bn6jQttLFLNlDo
 o8yhFehzG6cPFj95vKICXEBDCBphULA4VJ8qdPlBqF+d+t3DLxVZyodTf06ZP32B/PKq3J
 /XaiCIDaEi29zBoDBQP1Hdo29qRbwi4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-_EgDuB2oNIyoXKjK_CPP4w-1; Tue, 27 Oct 2020 01:06:10 -0400
X-MC-Unique: _EgDuB2oNIyoXKjK_CPP4w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BE5328030A9;
 Tue, 27 Oct 2020 05:06:09 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-145.phx2.redhat.com [10.3.112.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1FA5510013C4;
 Tue, 27 Oct 2020 05:06:09 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 05/11] nbd: Simplify qemu bitmap context name
Date: Tue, 27 Oct 2020 00:05:50 -0500
Message-Id: <20201027050556.269064-6-eblake@redhat.com>
In-Reply-To: <20201027050556.269064-1-eblake@redhat.com>
References: <20201027050556.269064-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/27 01:06:06
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, pkrempa@redhat.com, qemu-block@nongnu.org,
 armbru@redhat.com, rjones@redhat.com, vsementsov@virtuozzo.com,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Each dirty bitmap already knows its name; by reducing the scope of the
places where we construct "qemu:dirty-bitmap:NAME" strings, tracking
the name is more localized, and there are fewer per-export fields to
worry about.  This in turn will make it easier for an upcoming patch
to export more than one bitmap at once.

Signed-off-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 nbd/server.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 8d01662b4511..77fdecdf9dec 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -95,7 +95,6 @@ struct NBDExport {
     Notifier eject_notifier;

     BdrvDirtyBitmap *export_bitmap;
-    char *export_bitmap_context;
 };

 static QTAILQ_HEAD(, NBDExport) exports = QTAILQ_HEAD_INITIALIZER(exports);
@@ -871,14 +870,15 @@ static bool nbd_meta_qemu_query(NBDClient *client, NBDExportMetaContexts *meta,
     }

     if (nbd_strshift(&query, "dirty-bitmap:")) {
+        const char *bm_name;
+
         trace_nbd_negotiate_meta_query_parse("dirty-bitmap:");
         if (!meta->exp->export_bitmap) {
             trace_nbd_negotiate_meta_query_skip("no dirty-bitmap exported");
             return true;
         }
-        if (nbd_meta_empty_or_pattern(client,
-                                      meta->exp->export_bitmap_context +
-                                      strlen("qemu:dirty-bitmap:"), query)) {
+        bm_name = bdrv_dirty_bitmap_name(meta->exp->export_bitmap);
+        if (nbd_meta_empty_or_pattern(client, bm_name, query)) {
             meta->bitmap = true;
         }
         return true;
@@ -1004,8 +1004,11 @@ static int nbd_negotiate_meta_queries(NBDClient *client,
     }

     if (meta->bitmap) {
-        ret = nbd_negotiate_send_meta_context(client,
-                                              meta->exp->export_bitmap_context,
+        const char *bm_name = bdrv_dirty_bitmap_name(meta->exp->export_bitmap);
+        g_autofree char *context = g_strdup_printf("qemu:dirty-bitmap:%s",
+                                                   bm_name);
+
+        ret = nbd_negotiate_send_meta_context(client, context,
                                               NBD_META_ID_DIRTY_BITMAP,
                                               errp);
         if (ret < 0) {
@@ -1576,9 +1579,6 @@ static int nbd_export_create(BlockExport *blk_exp, BlockExportOptions *exp_args,
         bdrv_dirty_bitmap_set_busy(bm, true);
         exp->export_bitmap = bm;
         assert(strlen(bitmap) <= BDRV_BITMAP_MAX_NAME_SIZE);
-        exp->export_bitmap_context = g_strdup_printf("qemu:dirty-bitmap:%s",
-                                                     bitmap);
-        assert(strlen(exp->export_bitmap_context) < NBD_MAX_STRING_SIZE);
     }

     blk_add_aio_context_notifier(blk, blk_aio_attached, blk_aio_detach, exp);
@@ -1656,7 +1656,6 @@ static void nbd_export_delete(BlockExport *blk_exp)

     if (exp->export_bitmap) {
         bdrv_dirty_bitmap_set_busy(exp->export_bitmap, false);
-        g_free(exp->export_bitmap_context);
     }
 }

-- 
2.29.0


