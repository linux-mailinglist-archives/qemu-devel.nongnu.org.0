Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 727831D1118
	for <lists+qemu-devel@lfdr.de>; Wed, 13 May 2020 13:20:29 +0200 (CEST)
Received: from localhost ([::1]:39340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jYpR6-0008Hm-CT
	for lists+qemu-devel@lfdr.de; Wed, 13 May 2020 07:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDW-0001am-OL
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:26 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:56298
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1jYpDV-0003QW-OO
 for qemu-devel@nongnu.org; Wed, 13 May 2020 07:06:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1589367982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v5WNtmHOMdyZtbQeumzDr9tvsp9J88i78XbEMFrEX5M=;
 b=h/oFMOaO94d1J25G1ckvd5CrJ6tJIPVemqUUrm+dMTqoOwp0WuP5/pO6FPd6LdwX8SFPHC
 fExCIB4wSrUrChDz/e0BvCV3of4uoKskjrPI7PlyZGiq47SmExmFpkcf55GWHRBJ/nbtev
 GXkroEDwJw4bzCcyQgt/UwD5AXydySo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-455-blDQpC8JPaKruqlLnJfMAA-1; Wed, 13 May 2020 07:06:19 -0400
X-MC-Unique: blDQpC8JPaKruqlLnJfMAA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1362819200C0;
 Wed, 13 May 2020 11:06:18 +0000 (UTC)
Received: from localhost (unknown [10.40.193.218])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9A9431002382;
 Wed, 13 May 2020 11:06:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 11/34] block: Use bdrv_inherited_options()
Date: Wed, 13 May 2020 13:05:21 +0200
Message-Id: <20200513110544.176672-12-mreitz@redhat.com>
In-Reply-To: <20200513110544.176672-1-mreitz@redhat.com>
References: <20200513110544.176672-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/13 04:17:42
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Let child_file's, child_format's, and child_backing's .inherit_options()
implementations fall back to bdrv_inherited_options() to show that it
would really work for all of these cases, if only the parents passed the
appropriate BdrvChildRole and parent_is_format values.

(Also, make bdrv_open_inherit(), the only place to explicitly call
bdrv_backing_options(), call bdrv_inherited_options() instead.)

This patch should incur only two visible changes, both for child_format
children, both of which are effectively bug fixes:

First, they no longer have discard=unmap set by default.  This reason it
was set is because bdrv_inherited_fmt_options() fell through to
bdrv_protocol_options(), and that set it because "format drivers take
care to send flushes and respect unmap policy".  None of the drivers
that use child_format for their children (quorum and blkverify) are
format drivers, though, so this reasoning does not apply here.

Second, they no longer have BDRV_O_NO_IO force-cleared.  child_format
was used solely for children that do not store any metadata and as such
will not be accessed by their parents as long as those parents do not
receive I/O themselves.  Thus, such children should inherit
BDRV_O_NO_IO.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block.c | 71 +++++++++++++++------------------------------------------
 1 file changed, 19 insertions(+), 52 deletions(-)

diff --git a/block.c b/block.c
index 9b0e13d537..b3b978a092 100644
--- a/block.c
+++ b/block.c
@@ -80,6 +80,11 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                            BdrvChildRole child_role,
                                            Error **errp);
 
+/* TODO: Remove when no longer needed */
+static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
+                                   int *child_flags, QDict *child_options,
+                                   int parent_flags, QDict *parent_options);
+
 /* If non-zero, use only whitelisted block drivers */
 static int use_bdrv_whitelist;
 
@@ -1158,31 +1163,9 @@ static void bdrv_protocol_options(BdrvChildRole role, bool parent_is_format,
                                   int *child_flags, QDict *child_options,
                                   int parent_flags, QDict *parent_options)
 {
-    int flags = parent_flags;
-
-    /* Enable protocol handling, disable format probing for bs->file */
-    flags |= BDRV_O_PROTOCOL;
-
-    /* If the cache mode isn't explicitly set, inherit direct and no-flush from
-     * the parent. */
-    qdict_copy_default(child_options, parent_options, BDRV_OPT_CACHE_DIRECT);
-    qdict_copy_default(child_options, parent_options, BDRV_OPT_CACHE_NO_FLUSH);
-    qdict_copy_default(child_options, parent_options, BDRV_OPT_FORCE_SHARE);
-
-    /* Inherit the read-only option from the parent if it's not set */
-    qdict_copy_default(child_options, parent_options, BDRV_OPT_READ_ONLY);
-    qdict_copy_default(child_options, parent_options, BDRV_OPT_AUTO_READ_ONLY);
-
-    /* Our block drivers take care to send flushes and respect unmap policy,
-     * so we can default to enable both on lower layers regardless of the
-     * corresponding parent options. */
-    qdict_set_default_str(child_options, BDRV_OPT_DISCARD, "unmap");
-
-    /* Clear flags that only apply to the top layer */
-    flags &= ~(BDRV_O_SNAPSHOT | BDRV_O_NO_BACKING | BDRV_O_COPY_ON_READ |
-               BDRV_O_NO_IO);
-
-    *child_flags = flags;
+    bdrv_inherited_options(BDRV_CHILD_IMAGE, true,
+                           child_flags, child_options,
+                           parent_flags, parent_options);
 }
 
 const BdrvChildClass child_file = {
@@ -1209,11 +1192,9 @@ static void bdrv_inherited_fmt_options(BdrvChildRole role,
                                        int *child_flags, QDict *child_options,
                                        int parent_flags, QDict *parent_options)
 {
-    child_file.inherit_options(role, parent_is_format,
-                               child_flags, child_options,
-                               parent_flags, parent_options);
-
-    *child_flags &= ~(BDRV_O_PROTOCOL | BDRV_O_NO_IO);
+    bdrv_inherited_options(BDRV_CHILD_DATA, false,
+                           child_flags, child_options,
+                           parent_flags, parent_options);
 }
 
 const BdrvChildClass child_format = {
@@ -1295,23 +1276,9 @@ static void bdrv_backing_options(BdrvChildRole role, bool parent_is_format,
                                  int *child_flags, QDict *child_options,
                                  int parent_flags, QDict *parent_options)
 {
-    int flags = parent_flags;
-
-    /* The cache mode is inherited unmodified for backing files; except WCE,
-     * which is only applied on the top level (BlockBackend) */
-    qdict_copy_default(child_options, parent_options, BDRV_OPT_CACHE_DIRECT);
-    qdict_copy_default(child_options, parent_options, BDRV_OPT_CACHE_NO_FLUSH);
-    qdict_copy_default(child_options, parent_options, BDRV_OPT_FORCE_SHARE);
-
-    /* backing files always opened read-only */
-    qdict_set_default_str(child_options, BDRV_OPT_READ_ONLY, "on");
-    qdict_set_default_str(child_options, BDRV_OPT_AUTO_READ_ONLY, "off");
-    flags &= ~BDRV_O_COPY_ON_READ;
-
-    /* snapshot=on is handled on the top layer */
-    flags &= ~(BDRV_O_SNAPSHOT | BDRV_O_TEMPORARY);
-
-    *child_flags = flags;
+    bdrv_inherited_options(BDRV_CHILD_COW, true,
+                           child_flags, child_options,
+                           parent_flags, parent_options);
 }
 
 static int bdrv_backing_update_filename(BdrvChild *c, BlockDriverState *base,
@@ -1360,10 +1327,9 @@ const BdrvChildClass child_backing = {
  * Returns the options and flags that a generic child of a BDS should
  * get, based on the given options and flags for the parent BDS.
  */
-static void __attribute__((unused))
-    bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
-                           int *child_flags, QDict *child_options,
-                           int parent_flags, QDict *parent_options)
+static void bdrv_inherited_options(BdrvChildRole role, bool parent_is_format,
+                                   int *child_flags, QDict *child_options,
+                                   int parent_flags, QDict *parent_options)
 {
     int flags = parent_flags;
 
@@ -3300,7 +3266,8 @@ static BlockDriverState *bdrv_open_inherit(const char *filename,
                                    flags, options);
         /* Let bdrv_backing_options() override "read-only" */
         qdict_del(options, BDRV_OPT_READ_ONLY);
-        bdrv_backing_options(0, true, &flags, options, flags, options);
+        bdrv_inherited_options(BDRV_CHILD_COW, true,
+                               &flags, options, flags, options);
     }
 
     bs->open_flags = flags;
-- 
2.26.2


