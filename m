Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DED59281621
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Oct 2020 17:09:40 +0200 (CEST)
Received: from localhost ([::1]:43404 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kOMgl-0008Cp-TA
	for lists+qemu-devel@lfdr.de; Fri, 02 Oct 2020 11:09:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34954)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMIU-0002Im-Vh
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:34 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kOMIS-0004dG-8P
 for qemu-devel@nongnu.org; Fri, 02 Oct 2020 10:44:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1601649871;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A44r1CCS4ubZLQqKx806Aj3gEpVh2/Kepa2KH9qfYC0=;
 b=cnkkk5LoYCPT5uwqCA8FL/D+uzIP6f409EdBl24itp6m6zH2fJm97GgEGO/mDu6rhW0ENo
 9M3brIAbSDDUMV4C3xODiNeS0sMnAAaRZYIdDPCjS9eJMyPiX4rDMbJkqPezBTgMbQWzim
 jIEWOmZwBMafrKGfSMuV9SoXAQQQvak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-70s494lyPuC_RNLMqp6LRQ-1; Fri, 02 Oct 2020 10:44:26 -0400
X-MC-Unique: 70s494lyPuC_RNLMqp6LRQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 72A9D8015B0;
 Fri,  2 Oct 2020 14:44:25 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-112-139.ams2.redhat.com
 [10.36.112.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7C1A65D9D3;
 Fri,  2 Oct 2020 14:44:24 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 23/37] block/export: Move strong user reference to block_exports
Date: Fri,  2 Oct 2020 16:43:31 +0200
Message-Id: <20201002144345.253865-24-kwolf@redhat.com>
In-Reply-To: <20201002144345.253865-1-kwolf@redhat.com>
References: <20201002144345.253865-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/01 23:37:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The reference owned by the user/monitor that is created when adding the
export and dropped when removing it was tied to the 'exports' list in
nbd/server.c. Every block export will have a user reference, so move it
to the block export level and tie it to the 'block_exports' list in
block/export/export.c instead. This is necessary for introducing a QMP
command for removing exports.

Note that exports are present in block_exports even after the user has
requested shutdown. This is different from NBD's exports where exports
are immediately removed on a shutdown request, even if they are still in
the process of shutting down. In order to avoid that the user still
interacts with an export that is shutting down (and possibly removes it
a second time), we need to remember if the user actually still owns it.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200924152717.287415-20-kwolf@redhat.com>
Acked-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/export.h | 8 ++++++++
 block/export/export.c  | 6 ++++++
 blockdev-nbd.c         | 5 -----
 nbd/server.c           | 2 --
 4 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/include/block/export.h b/include/block/export.h
index cdc6e161ea..4833947e89 100644
--- a/include/block/export.h
+++ b/include/block/export.h
@@ -60,6 +60,14 @@ struct BlockExport {
      */
     int refcount;
 
+    /*
+     * True if one of the references in refcount belongs to the user. After the
+     * user has dropped their reference, they may not e.g. remove the same
+     * export a second time (which would decrease the refcount without having
+     * it incremented first).
+     */
+    bool user_owned;
+
     /* The AioContext whose lock protects this BlockExport object. */
     AioContext *ctx;
 
diff --git a/block/export/export.c b/block/export/export.c
index 7a4a78449a..62699dfa05 100644
--- a/block/export/export.c
+++ b/block/export/export.c
@@ -80,6 +80,7 @@ BlockExport *blk_exp_add(BlockExportOptions *export, Error **errp)
     *exp = (BlockExport) {
         .drv        = drv,
         .refcount   = 1,
+        .user_owned = true,
         .id         = g_strdup(export->id),
     };
 
@@ -143,6 +144,11 @@ void blk_exp_request_shutdown(BlockExport *exp)
 
     aio_context_acquire(aio_context);
     exp->drv->request_shutdown(exp);
+
+    assert(exp->user_owned);
+    exp->user_owned = false;
+    blk_exp_unref(exp);
+
     aio_context_release(aio_context);
 }
 
diff --git a/blockdev-nbd.c b/blockdev-nbd.c
index 814554dd90..9efbaef8f7 100644
--- a/blockdev-nbd.c
+++ b/blockdev-nbd.c
@@ -235,11 +235,6 @@ int nbd_export_create(BlockExport *exp, BlockExportOptions *exp_args,
         goto out;
     }
 
-    /* The list of named exports has a strong reference to this export now and
-     * our only way of accessing it is through nbd_export_find(), so we can drop
-     * the strong reference that is @exp. */
-    blk_exp_unref(exp);
-
     ret = 0;
  out:
     aio_context_release(aio_context);
diff --git a/nbd/server.c b/nbd/server.c
index 32147e4871..22a1d66168 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -1616,7 +1616,6 @@ int nbd_export_new(BlockExport *blk_exp, BlockDriverState *bs,
 
     blk_add_aio_context_notifier(blk, blk_aio_attached, blk_aio_detach, exp);
 
-    blk_exp_ref(&exp->common);
     QTAILQ_INSERT_TAIL(&exports, exp, next);
 
     return 0;
@@ -1663,7 +1662,6 @@ static void nbd_export_request_shutdown(BlockExport *blk_exp)
         client_close(client, true);
     }
     if (exp->name) {
-        blk_exp_unref(&exp->common);
         g_free(exp->name);
         exp->name = NULL;
         QTAILQ_REMOVE(&exports, exp, next);
-- 
2.25.4


