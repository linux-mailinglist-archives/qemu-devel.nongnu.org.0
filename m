Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AA71D4E47
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 14:59:53 +0200 (CEST)
Received: from localhost ([::1]:39340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZZwO-00035t-45
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 08:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZjV-0003ev-9Y
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:46:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:36702
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZjS-0002RN-Rf
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:46:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589546790;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rXkWQF7zMNe9vRQ/O61J0ZGPPFhfb43UNePE/k2sSJA=;
 b=ZFnWykYeK/LpGfJCJ/zu8pxa1ZoXBz1C5Bptria+zFxAqYmM5SYnzx/Uvj6yLY7GrFqRxI
 3jEv4B2l76C8V0sG05RBzAcW3XJsSJzxKaEZSGIosrZAwwRcH8cfpUtBNdBq0IdFxd6emv
 1VCGa430+lxiQjlH1MwfDKWwc/lru68=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-87-se6z8eABMwGuutAc9L_vZg-1; Fri, 15 May 2020 08:46:25 -0400
X-MC-Unique: se6z8eABMwGuutAc9L_vZg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 625AE460;
 Fri, 15 May 2020 12:46:24 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-110.ams2.redhat.com
 [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A0BB2E024;
 Fri, 15 May 2020 12:46:23 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 38/51] block: Make filter drivers use child_of_bds
Date: Fri, 15 May 2020 14:45:08 +0200
Message-Id: <20200515124521.335403-39-kwolf@redhat.com>
In-Reply-To: <20200515124521.335403-1-kwolf@redhat.com>
References: <20200515124521.335403-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 22:56:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

From: Max Reitz <mreitz@redhat.com>

Note that some filters have secondary children, namely blkverify (the
image to be verified) and blklogwrites (the log).  This patch does not
touch those children.

Note that for blkverify, the filtered child should not be format-probed.
While there is nothing enforcing this here, in practice, it will not be:
blkverify implements .bdrv_file_open.  The block layer ensures (and in
fact, asserts) that BDRV_O_PROTOCOL is set for every BDS whose driver
implements .bdrv_file_open.  This flag will then be bequeathed to
blkverify's children, and they will thus (by default) not be probed
either.

("By default" refers to the fact that blkverify's other child (the
non-filtered one) will have BDRV_O_PROTOCOL force-unset, because that is
what happens for all non-filtered children of non-format drivers.)

Signed-off-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20200513110544.176672-27-mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/blkdebug.c        | 4 +++-
 block/blklogwrites.c    | 3 ++-
 block/blkreplay.c       | 5 +++--
 block/blkverify.c       | 4 +++-
 block/copy-on-read.c    | 5 +++--
 block/filter-compress.c | 5 +++--
 block/replication.c     | 3 ++-
 block/throttle.c        | 5 +++--
 8 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/block/blkdebug.c b/block/blkdebug.c
index 8dd8ed6055..b31fa40b0e 100644
--- a/block/blkdebug.c
+++ b/block/blkdebug.c
@@ -497,7 +497,9 @@ static int blkdebug_open(BlockDriverState *bs, QDict *options, int flags,
 
     /* Open the image file */
     bs->file = bdrv_open_child(qemu_opt_get(opts, "x-image"), options, "image",
-                               bs, &child_file, 0, false, &local_err);
+                               bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, &local_err);
     if (local_err) {
         ret = -EINVAL;
         error_propagate(errp, local_err);
diff --git a/block/blklogwrites.c b/block/blklogwrites.c
index 4faf912ef1..78b0c49460 100644
--- a/block/blklogwrites.c
+++ b/block/blklogwrites.c
@@ -157,7 +157,8 @@ static int blk_log_writes_open(BlockDriverState *bs, QDict *options, int flags,
     }
 
     /* Open the file */
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0, false,
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY, false,
                                &local_err);
     if (local_err) {
         ret = -EINVAL;
diff --git a/block/blkreplay.c b/block/blkreplay.c
index 9b2814fc58..20d6139baa 100644
--- a/block/blkreplay.c
+++ b/block/blkreplay.c
@@ -27,8 +27,9 @@ static int blkreplay_open(BlockDriverState *bs, QDict *options, int flags,
     int ret;
 
     /* Open the image file */
-    bs->file = bdrv_open_child(NULL, options, "image",
-                               bs, &child_file, 0, false, &local_err);
+    bs->file = bdrv_open_child(NULL, options, "image", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, &local_err);
     if (local_err) {
         ret = -EINVAL;
         error_propagate(errp, local_err);
diff --git a/block/blkverify.c b/block/blkverify.c
index 1684b7aa2e..5c3b29244a 100644
--- a/block/blkverify.c
+++ b/block/blkverify.c
@@ -125,7 +125,9 @@ static int blkverify_open(BlockDriverState *bs, QDict *options, int flags,
 
     /* Open the raw file */
     bs->file = bdrv_open_child(qemu_opt_get(opts, "x-raw"), options, "raw",
-                               bs, &child_file, 0, false, &local_err);
+                               bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, &local_err);
     if (local_err) {
         ret = -EINVAL;
         error_propagate(errp, local_err);
diff --git a/block/copy-on-read.c b/block/copy-on-read.c
index a2d92ac394..c857ea0da7 100644
--- a/block/copy-on-read.c
+++ b/block/copy-on-read.c
@@ -28,8 +28,9 @@
 static int cor_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0, false,
-                               errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/filter-compress.c b/block/filter-compress.c
index 4dc5f9fb8c..9edd937645 100644
--- a/block/filter-compress.c
+++ b/block/filter-compress.c
@@ -30,8 +30,9 @@
 static int compress_open(BlockDriverState *bs, QDict *options, int flags,
                          Error **errp)
 {
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0, false,
-                               errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
diff --git a/block/replication.c b/block/replication.c
index ea87b1a4f0..cc9c473ad1 100644
--- a/block/replication.c
+++ b/block/replication.c
@@ -90,7 +90,8 @@ static int replication_open(BlockDriverState *bs, QDict *options,
     const char *mode;
     const char *top_id;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
                                false, errp);
     if (!bs->file) {
         return -EINVAL;
diff --git a/block/throttle.c b/block/throttle.c
index 2dea913be7..47b0a3522d 100644
--- a/block/throttle.c
+++ b/block/throttle.c
@@ -81,8 +81,9 @@ static int throttle_open(BlockDriverState *bs, QDict *options,
     char *group;
     int ret;
 
-    bs->file = bdrv_open_child(NULL, options, "file", bs,
-                               &child_file, 0, false, errp);
+    bs->file = bdrv_open_child(NULL, options, "file", bs, &child_of_bds,
+                               BDRV_CHILD_FILTERED | BDRV_CHILD_PRIMARY,
+                               false, errp);
     if (!bs->file) {
         return -EINVAL;
     }
-- 
2.25.4


