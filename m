Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A851D4E85
	for <lists+qemu-devel@lfdr.de>; Fri, 15 May 2020 15:11:48 +0200 (CEST)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZa7v-00084w-I3
	for lists+qemu-devel@lfdr.de; Fri, 15 May 2020 09:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZjJ-0003AE-HZ
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:46:21 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:45533
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jZZjI-0002OT-6c
 for qemu-devel@nongnu.org; Fri, 15 May 2020 08:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589546779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+fNuQV4hGWz58pDqojWEjpoo53PoevCTwyj+pmS+U2g=;
 b=B1m/GfmVR79sAM1rZPNK9rGv0dgi0hRRJyfNCWZQhDT62DDFFpeaX2H705cU7qMN6fw02/
 dt8pDl7Y+b1yi3udQS0ayeK0PHV/ypGrgy4JPQvr8hfICRMXbFio5qc279pePg0b3iDS36
 Tr7Zpi0d428ugw/9Hj7Zdc/mtDNkJXs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-507--jzLnZAzPMiBV09CwPGKSw-1; Fri, 15 May 2020 08:46:17 -0400
X-MC-Unique: -jzLnZAzPMiBV09CwPGKSw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B815D460;
 Fri, 15 May 2020 12:46:16 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-110.ams2.redhat.com
 [10.36.113.110])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BEC1F2E166;
 Fri, 15 May 2020 12:46:15 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 32/51] raw-format: Split raw_read_options()
Date: Fri, 15 May 2020 14:45:02 +0200
Message-Id: <20200515124521.335403-33-kwolf@redhat.com>
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

Split raw_read_options() into one function that actually just reads the
options, and another that applies them.  This will allow us to detect
whether the user has specified any options before attaching the file
child (so we can decide on its role based on the options).

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Message-Id: <20200513110544.176672-21-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/raw-format.c | 110 ++++++++++++++++++++++++++-------------------
 1 file changed, 65 insertions(+), 45 deletions(-)

diff --git a/block/raw-format.c b/block/raw-format.c
index 4b8d4ce8be..824fe70686 100644
--- a/block/raw-format.c
+++ b/block/raw-format.c
@@ -71,20 +71,13 @@ static QemuOptsList raw_create_opts = {
     }
 };
 
-static int raw_read_options(QDict *options, BlockDriverState *bs,
-    BDRVRawState *s, Error **errp)
+static int raw_read_options(QDict *options, uint64_t *offset, bool *has_size,
+                            uint64_t *size, Error **errp)
 {
     Error *local_err = NULL;
     QemuOpts *opts = NULL;
-    int64_t real_size = 0;
     int ret;
 
-    real_size = bdrv_getlength(bs->file->bs);
-    if (real_size < 0) {
-        error_setg_errno(errp, -real_size, "Could not get image size");
-        return real_size;
-    }
-
     opts = qemu_opts_create(&raw_runtime_opts, NULL, 0, &error_abort);
     qemu_opts_absorb_qdict(opts, options, &local_err);
     if (local_err) {
@@ -93,64 +86,84 @@ static int raw_read_options(QDict *options, BlockDriverState *bs,
         goto end;
     }
 
-    s->offset = qemu_opt_get_size(opts, "offset", 0);
-    if (s->offset > real_size) {
-        error_setg(errp, "Offset (%" PRIu64 ") cannot be greater than "
-            "size of the containing file (%" PRId64 ")",
-            s->offset, real_size);
-        ret = -EINVAL;
-        goto end;
-    }
+    *offset = qemu_opt_get_size(opts, "offset", 0);
+    *has_size = qemu_opt_find(opts, "size");
+    *size = qemu_opt_get_size(opts, "size", 0);
 
-    if (qemu_opt_find(opts, "size") != NULL) {
-        s->size = qemu_opt_get_size(opts, "size", 0);
-        s->has_size = true;
-    } else {
-        s->has_size = false;
-        s->size = real_size - s->offset;
+    ret = 0;
+end:
+    qemu_opts_del(opts);
+    return ret;
+}
+
+static int raw_apply_options(BlockDriverState *bs, BDRVRawState *s,
+                             uint64_t offset, bool has_size, uint64_t size,
+                             Error **errp)
+{
+    int64_t real_size = 0;
+
+    real_size = bdrv_getlength(bs->file->bs);
+    if (real_size < 0) {
+        error_setg_errno(errp, -real_size, "Could not get image size");
+        return real_size;
     }
 
     /* Check size and offset */
-    if ((real_size - s->offset) < s->size) {
+    if (offset > real_size) {
+        error_setg(errp, "Offset (%" PRIu64 ") cannot be greater than "
+                   "size of the containing file (%" PRId64 ")",
+                   s->offset, real_size);
+        return -EINVAL;
+    }
+
+    if (has_size && (real_size - offset) < size) {
         error_setg(errp, "The sum of offset (%" PRIu64 ") and size "
-            "(%" PRIu64 ") has to be smaller or equal to the "
-            " actual size of the containing file (%" PRId64 ")",
-            s->offset, s->size, real_size);
-        ret = -EINVAL;
-        goto end;
+                   "(%" PRIu64 ") has to be smaller or equal to the "
+                   " actual size of the containing file (%" PRId64 ")",
+                   s->offset, s->size, real_size);
+        return -EINVAL;
     }
 
     /* Make sure size is multiple of BDRV_SECTOR_SIZE to prevent rounding
      * up and leaking out of the specified area. */
-    if (s->has_size && !QEMU_IS_ALIGNED(s->size, BDRV_SECTOR_SIZE)) {
+    if (has_size && !QEMU_IS_ALIGNED(size, BDRV_SECTOR_SIZE)) {
         error_setg(errp, "Specified size is not multiple of %llu",
-            BDRV_SECTOR_SIZE);
-        ret = -EINVAL;
-        goto end;
+                   BDRV_SECTOR_SIZE);
+        return -EINVAL;
     }
 
-    ret = 0;
-
-end:
+    s->offset = offset;
+    s->has_size = has_size;
+    s->size = has_size ? size : real_size - offset;
 
-    qemu_opts_del(opts);
-
-    return ret;
+    return 0;
 }
 
 static int raw_reopen_prepare(BDRVReopenState *reopen_state,
                               BlockReopenQueue *queue, Error **errp)
 {
+    bool has_size;
+    uint64_t offset, size;
+    int ret;
+
     assert(reopen_state != NULL);
     assert(reopen_state->bs != NULL);
 
     reopen_state->opaque = g_new0(BDRVRawState, 1);
 
-    return raw_read_options(
-        reopen_state->options,
-        reopen_state->bs,
-        reopen_state->opaque,
-        errp);
+    ret = raw_read_options(reopen_state->options, &offset, &has_size, &size,
+                           errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = raw_apply_options(reopen_state->bs, reopen_state->opaque,
+                            offset, has_size, size, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return 0;
 }
 
 static void raw_reopen_commit(BDRVReopenState *state)
@@ -426,8 +439,15 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
                     Error **errp)
 {
     BDRVRawState *s = bs->opaque;
+    bool has_size;
+    uint64_t offset, size;
     int ret;
 
+    ret = raw_read_options(options, &offset, &has_size, &size, errp);
+    if (ret < 0) {
+        return ret;
+    }
+
     bs->file = bdrv_open_child(NULL, options, "file", bs, &child_file, 0,
                                false, errp);
     if (!bs->file) {
@@ -455,7 +475,7 @@ static int raw_open(BlockDriverState *bs, QDict *options, int flags,
                 bs->file->bs->filename);
     }
 
-    ret = raw_read_options(options, bs, s, errp);
+    ret = raw_apply_options(bs, s, offset, has_size, size, errp);
     if (ret < 0) {
         return ret;
     }
-- 
2.25.4


