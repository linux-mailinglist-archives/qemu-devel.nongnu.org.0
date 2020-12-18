Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A97C2DE664
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 16:19:37 +0100 (CET)
Received: from localhost ([::1]:52280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqHXc-0007xq-JK
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 10:19:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRo-0002Up-1T
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:59494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kqHRd-0005Nl-PK
 for qemu-devel@nongnu.org; Fri, 18 Dec 2020 10:13:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608304405;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BuUBGlzQeQc562DDY6TzCsCi51Tehdy4f8SYetPcnqw=;
 b=FwAv3IYenCQy4XryZ73OpZDtddvURYh8nS1vwR+sjKZ0MohYr306wPPLFCh7qPESU5kW4P
 knBmYILnCdLYRTr73l6s0bcin4v8XdyOgBExCfseTpujf50V5SxhvVFfCIUzD/TpXHDzdV
 D6PTWu6k9js+eiTzt+qSx0vIlKv0HXo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-134-sGP-4R8KN2uPwdMAkSlqSw-1; Fri, 18 Dec 2020 10:13:22 -0500
X-MC-Unique: sGP-4R8KN2uPwdMAkSlqSw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D94FD107ACE6;
 Fri, 18 Dec 2020 15:13:21 +0000 (UTC)
Received: from localhost (ovpn-114-84.ams2.redhat.com [10.36.114.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7B82F60CED;
 Fri, 18 Dec 2020 15:13:21 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/30] qemu-io: add preallocate mode parameter for truncate
 command
Date: Fri, 18 Dec 2020 16:12:32 +0100
Message-Id: <20201218151249.715731-14-mreitz@redhat.com>
In-Reply-To: <20201218151249.715731-1-mreitz@redhat.com>
References: <20201218151249.715731-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

This will be used in further test.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20201021145859.11201-10-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qemu-io-cmds.c | 46 ++++++++++++++++++++++++++++++++--------------
 1 file changed, 32 insertions(+), 14 deletions(-)

diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 4153f1c0b0..97611969cb 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -1698,13 +1698,42 @@ static const cmdinfo_t flush_cmd = {
     .oneline    = "flush all in-core file state to disk",
 };
 
+static int truncate_f(BlockBackend *blk, int argc, char **argv);
+static const cmdinfo_t truncate_cmd = {
+    .name       = "truncate",
+    .altname    = "t",
+    .cfunc      = truncate_f,
+    .perm       = BLK_PERM_WRITE | BLK_PERM_RESIZE,
+    .argmin     = 1,
+    .argmax     = 3,
+    .args       = "[-m prealloc_mode] off",
+    .oneline    = "truncates the current file at the given offset",
+};
+
 static int truncate_f(BlockBackend *blk, int argc, char **argv)
 {
     Error *local_err = NULL;
     int64_t offset;
-    int ret;
+    int c, ret;
+    PreallocMode prealloc = PREALLOC_MODE_OFF;
 
-    offset = cvtnum(argv[1]);
+    while ((c = getopt(argc, argv, "m:")) != -1) {
+        switch (c) {
+        case 'm':
+            prealloc = qapi_enum_parse(&PreallocMode_lookup, optarg,
+                                       PREALLOC_MODE__MAX, NULL);
+            if (prealloc == PREALLOC_MODE__MAX) {
+                error_report("Invalid preallocation mode '%s'", optarg);
+                return -EINVAL;
+            }
+            break;
+        default:
+            qemuio_command_usage(&truncate_cmd);
+            return -EINVAL;
+        }
+    }
+
+    offset = cvtnum(argv[optind]);
     if (offset < 0) {
         print_cvtnum_err(offset, argv[1]);
         return offset;
@@ -1715,7 +1744,7 @@ static int truncate_f(BlockBackend *blk, int argc, char **argv)
      * exact=true.  It is better to err on the "emit more errors" side
      * than to be overly permissive.
      */
-    ret = blk_truncate(blk, offset, false, PREALLOC_MODE_OFF, 0, &local_err);
+    ret = blk_truncate(blk, offset, false, prealloc, 0, &local_err);
     if (ret < 0) {
         error_report_err(local_err);
         return ret;
@@ -1724,17 +1753,6 @@ static int truncate_f(BlockBackend *blk, int argc, char **argv)
     return 0;
 }
 
-static const cmdinfo_t truncate_cmd = {
-    .name       = "truncate",
-    .altname    = "t",
-    .cfunc      = truncate_f,
-    .perm       = BLK_PERM_WRITE | BLK_PERM_RESIZE,
-    .argmin     = 1,
-    .argmax     = 1,
-    .args       = "off",
-    .oneline    = "truncates the current file at the given offset",
-};
-
 static int length_f(BlockBackend *blk, int argc, char **argv)
 {
     int64_t size;
-- 
2.29.2


