Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37820223BD1
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jul 2020 14:59:45 +0200 (CEST)
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jwPxo-0001rj-8t
	for lists+qemu-devel@lfdr.de; Fri, 17 Jul 2020 08:59:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jwPtw-0005AQ-Q9
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 08:55:44 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23222
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jwPtv-0008Qc-8B
 for qemu-devel@nongnu.org; Fri, 17 Jul 2020 08:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594990542;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=l5LtfD+inHy3GTRqmhWnchn/ZoZZ/m+lo0JW9SbCS6I=;
 b=NPRG16y2ogSb2gcyUS4IBw7vnLzFDkT3PBTVrEUrY7sQsI2PMIgnJ7Nonn6/lXS+wiWYIA
 XoTej5DSFaG17ub5oBZOQ8T0kVJqbs0P8ccxHkVvmZgeqWPFTR8Mw+mmqgDXvbhSPf/qG/
 sIVNAJpOvF1lSgnRjoTXsLpv64vD4wQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-3HalbDrzPOiY9kufjK50zA-1; Fri, 17 Jul 2020 08:55:38 -0400
X-MC-Unique: 3HalbDrzPOiY9kufjK50zA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D7345803129;
 Fri, 17 Jul 2020 12:55:29 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-113-80.ams2.redhat.com [10.36.113.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E53EE710B1;
 Fri, 17 Jul 2020 12:55:28 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 10/12] file-posix: Move check_hdev_writable() up
Date: Fri, 17 Jul 2020 14:55:08 +0200
Message-Id: <20200717125510.238374-11-kwolf@redhat.com>
In-Reply-To: <20200717125510.238374-1-kwolf@redhat.com>
References: <20200717125510.238374-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/17 03:33:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

We'll need to call it in raw_open_common(), so move the function to
avoid a forward declaration.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20200717105426.51134-2-kwolf@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/file-posix.c | 66 +++++++++++++++++++++++-----------------------
 1 file changed, 33 insertions(+), 33 deletions(-)

diff --git a/block/file-posix.c b/block/file-posix.c
index ae8190edab..dd7dab07d6 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -425,6 +425,39 @@ static void raw_probe_alignment(BlockDriverState *bs, int fd, Error **errp)
     }
 }
 
+static int check_hdev_writable(BDRVRawState *s)
+{
+#if defined(BLKROGET)
+    /* Linux block devices can be configured "read-only" using blockdev(8).
+     * This is independent of device node permissions and therefore open(2)
+     * with O_RDWR succeeds.  Actual writes fail with EPERM.
+     *
+     * bdrv_open() is supposed to fail if the disk is read-only.  Explicitly
+     * check for read-only block devices so that Linux block devices behave
+     * properly.
+     */
+    struct stat st;
+    int readonly = 0;
+
+    if (fstat(s->fd, &st)) {
+        return -errno;
+    }
+
+    if (!S_ISBLK(st.st_mode)) {
+        return 0;
+    }
+
+    if (ioctl(s->fd, BLKROGET, &readonly) < 0) {
+        return -errno;
+    }
+
+    if (readonly) {
+        return -EACCES;
+    }
+#endif /* defined(BLKROGET) */
+    return 0;
+}
+
 static void raw_parse_flags(int bdrv_flags, int *open_flags, bool has_writers)
 {
     bool read_write = false;
@@ -3323,39 +3356,6 @@ static int hdev_probe_device(const char *filename)
     return 0;
 }
 
-static int check_hdev_writable(BDRVRawState *s)
-{
-#if defined(BLKROGET)
-    /* Linux block devices can be configured "read-only" using blockdev(8).
-     * This is independent of device node permissions and therefore open(2)
-     * with O_RDWR succeeds.  Actual writes fail with EPERM.
-     *
-     * bdrv_open() is supposed to fail if the disk is read-only.  Explicitly
-     * check for read-only block devices so that Linux block devices behave
-     * properly.
-     */
-    struct stat st;
-    int readonly = 0;
-
-    if (fstat(s->fd, &st)) {
-        return -errno;
-    }
-
-    if (!S_ISBLK(st.st_mode)) {
-        return 0;
-    }
-
-    if (ioctl(s->fd, BLKROGET, &readonly) < 0) {
-        return -errno;
-    }
-
-    if (readonly) {
-        return -EACCES;
-    }
-#endif /* defined(BLKROGET) */
-    return 0;
-}
-
 static void hdev_parse_filename(const char *filename, QDict *options,
                                 Error **errp)
 {
-- 
2.25.4


