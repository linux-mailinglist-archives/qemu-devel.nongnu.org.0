Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D553209F0A
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jun 2020 14:59:38 +0200 (CEST)
Received: from localhost ([::1]:53956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1joRTd-0000jp-81
	for lists+qemu-devel@lfdr.de; Thu, 25 Jun 2020 08:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joRQX-0003M9-Il
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:56:25 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:39269
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1joRQU-0003If-Le
 for qemu-devel@nongnu.org; Thu, 25 Jun 2020 08:56:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593089782;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0s7PIFpwKJzAeMYCEDW5l1CJcqt2ghjNiVNPqlVX5c=;
 b=euvNxXImDn37xun9fgMJHZZrWBemyOg3WGzKn7/wcj8JjL7jAZJwtZH1TjOQzJsUT15g34
 0mZ/5F5LhioYo2dM0/bdVIW1GvBsb3RNwYfUVo8LX+1d04ARah0LG+vPv23cPEkQZ+a2x+
 U9mtC2c6xbWTV8KdH4MShSmLWouQEOM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-154-mS6BTh83NT68-WVmmCtMhg-1; Thu, 25 Jun 2020 08:56:18 -0400
X-MC-Unique: mS6BTh83NT68-WVmmCtMhg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B464A804002;
 Thu, 25 Jun 2020 12:56:16 +0000 (UTC)
Received: from localhost (ovpn-113-182.ams2.redhat.com [10.36.113.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 530BF71660;
 Thu, 25 Jun 2020 12:56:16 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 09/19] block/amend: add 'force' option
Date: Thu, 25 Jun 2020 14:55:38 +0200
Message-Id: <20200625125548.870061-10-mreitz@redhat.com>
In-Reply-To: <20200625125548.870061-1-mreitz@redhat.com>
References: <20200625125548.870061-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/25 00:45:15
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Kevin Wolf <kwolf@redhat.com>, Maxim Levitsky <mlevitsk@redhat.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Maxim Levitsky <mlevitsk@redhat.com>

'force' option will be used for some unsafe amend operations.

This includes things like erasing last keyslot in luks based formats
(which destroys the data, unless the master key is backed up
by external means), but that _might_ be desired result.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200608094030.670121-4-mlevitsk@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 docs/tools/qemu-img.rst   | 5 ++++-
 include/block/block.h     | 1 +
 include/block/block_int.h | 1 +
 block.c                   | 4 +++-
 block/qcow2.c             | 1 +
 qemu-img.c                | 8 +++++++-
 qemu-img-cmds.hx          | 4 ++--
 7 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/docs/tools/qemu-img.rst b/docs/tools/qemu-img.rst
index 7f0737488a..e33f5575e3 100644
--- a/docs/tools/qemu-img.rst
+++ b/docs/tools/qemu-img.rst
@@ -253,11 +253,14 @@ Command description:
 
 .. program:: qemu-img-commands
 
-.. option:: amend [--object OBJECTDEF] [--image-opts] [-p] [-q] [-f FMT] [-t CACHE] -o OPTIONS FILENAME
+.. option:: amend [--object OBJECTDEF] [--image-opts] [-p] [-q] [-f FMT] [-t CACHE] [--force] -o OPTIONS FILENAME
 
   Amends the image format specific *OPTIONS* for the image file
   *FILENAME*. Not all file formats support this operation.
 
+  --force allows some unsafe operations. Currently for -f luks, it allows to
+  erase the last encryption key, and to overwrite an active encryption key.
+
 .. option:: bench [-c COUNT] [-d DEPTH] [-f FMT] [--flush-interval=FLUSH_INTERVAL] [-i AIO] [-n] [--no-drain] [-o OFFSET] [--pattern=PATTERN] [-q] [-s BUFFER_SIZE] [-S STEP_SIZE] [-t CACHE] [-w] [-U] FILENAME
 
   Run a simple sequential I/O benchmark on the specified image. If ``-w`` is
diff --git a/include/block/block.h b/include/block/block.h
index 25e299605e..86f9728f00 100644
--- a/include/block/block.h
+++ b/include/block/block.h
@@ -450,6 +450,7 @@ typedef void BlockDriverAmendStatusCB(BlockDriverState *bs, int64_t offset,
                                       int64_t total_work_size, void *opaque);
 int bdrv_amend_options(BlockDriverState *bs_new, QemuOpts *opts,
                        BlockDriverAmendStatusCB *status_cb, void *cb_opaque,
+                       bool force,
                        Error **errp);
 
 /* check if a named node can be replaced when doing drive-mirror */
diff --git a/include/block/block_int.h b/include/block/block_int.h
index 791de6a59c..066b9eaa40 100644
--- a/include/block/block_int.h
+++ b/include/block/block_int.h
@@ -440,6 +440,7 @@ struct BlockDriver {
     int (*bdrv_amend_options)(BlockDriverState *bs, QemuOpts *opts,
                               BlockDriverAmendStatusCB *status_cb,
                               void *cb_opaque,
+                              bool force,
                               Error **errp);
 
     void (*bdrv_debug_event)(BlockDriverState *bs, BlkdebugEvent event);
diff --git a/block.c b/block.c
index 6dbcb7e083..144f52e413 100644
--- a/block.c
+++ b/block.c
@@ -6482,6 +6482,7 @@ void bdrv_remove_aio_context_notifier(BlockDriverState *bs,
 
 int bdrv_amend_options(BlockDriverState *bs, QemuOpts *opts,
                        BlockDriverAmendStatusCB *status_cb, void *cb_opaque,
+                       bool force,
                        Error **errp)
 {
     if (!bs->drv) {
@@ -6493,7 +6494,8 @@ int bdrv_amend_options(BlockDriverState *bs, QemuOpts *opts,
                    bs->drv->format_name);
         return -ENOTSUP;
     }
-    return bs->drv->bdrv_amend_options(bs, opts, status_cb, cb_opaque, errp);
+    return bs->drv->bdrv_amend_options(bs, opts, status_cb,
+                                       cb_opaque, force, errp);
 }
 
 /*
diff --git a/block/qcow2.c b/block/qcow2.c
index 0cd2e6757e..2ab0c382f7 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -5340,6 +5340,7 @@ static void qcow2_amend_helper_cb(BlockDriverState *bs,
 static int qcow2_amend_options(BlockDriverState *bs, QemuOpts *opts,
                                BlockDriverAmendStatusCB *status_cb,
                                void *cb_opaque,
+                               bool force,
                                Error **errp)
 {
     BDRVQcow2State *s = bs->opaque;
diff --git a/qemu-img.c b/qemu-img.c
index d7e846e607..10d81f09db 100644
--- a/qemu-img.c
+++ b/qemu-img.c
@@ -79,6 +79,7 @@ enum {
     OPTION_DISABLE = 273,
     OPTION_MERGE = 274,
     OPTION_BITMAPS = 275,
+    OPTION_FORCE = 276,
 };
 
 typedef enum OutputFormat {
@@ -4099,6 +4100,7 @@ static int img_amend(int argc, char **argv)
     BlockBackend *blk = NULL;
     BlockDriverState *bs = NULL;
     bool image_opts = false;
+    bool force = false;
 
     cache = BDRV_DEFAULT_CACHE;
     for (;;) {
@@ -4106,6 +4108,7 @@ static int img_amend(int argc, char **argv)
             {"help", no_argument, 0, 'h'},
             {"object", required_argument, 0, OPTION_OBJECT},
             {"image-opts", no_argument, 0, OPTION_IMAGE_OPTS},
+            {"force", no_argument, 0, OPTION_FORCE},
             {0, 0, 0, 0}
         };
         c = getopt_long(argc, argv, ":ho:f:t:pq",
@@ -4153,6 +4156,9 @@ static int img_amend(int argc, char **argv)
         case OPTION_IMAGE_OPTS:
             image_opts = true;
             break;
+        case OPTION_FORCE:
+            force = true;
+            break;
         }
     }
 
@@ -4230,7 +4236,7 @@ static int img_amend(int argc, char **argv)
 
     /* In case the driver does not call amend_status_cb() */
     qemu_progress_print(0.f, 0);
-    ret = bdrv_amend_options(bs, opts, &amend_status_cb, NULL, &err);
+    ret = bdrv_amend_options(bs, opts, &amend_status_cb, NULL, force, &err);
     qemu_progress_print(100.f, 0);
     if (ret < 0) {
         error_report_err(err);
diff --git a/qemu-img-cmds.hx b/qemu-img-cmds.hx
index 10b910b67c..b89c019b76 100644
--- a/qemu-img-cmds.hx
+++ b/qemu-img-cmds.hx
@@ -10,9 +10,9 @@ HXCOMM When amending the rST sections, please remember to copy the usage
 HXCOMM over to the per-command sections in docs/tools/qemu-img.rst.
 
 DEF("amend", img_amend,
-    "amend [--object objectdef] [--image-opts] [-p] [-q] [-f fmt] [-t cache] -o options filename")
+    "amend [--object objectdef] [--image-opts] [-p] [-q] [-f fmt] [-t cache] [--force] -o options filename")
 SRST
-.. option:: amend [--object OBJECTDEF] [--image-opts] [-p] [-q] [-f FMT] [-t CACHE] -o OPTIONS FILENAME
+.. option:: amend [--object OBJECTDEF] [--image-opts] [-p] [-q] [-f FMT] [-t CACHE] [--force] -o OPTIONS FILENAME
 ERST
 
 DEF("bench", img_bench,
-- 
2.26.2


