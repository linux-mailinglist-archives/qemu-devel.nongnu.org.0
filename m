Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 652F83A693B
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 16:47:08 +0200 (CEST)
Received: from localhost ([::1]:57304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsnrn-0007Kk-Bo
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 10:47:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lsnp5-0003Te-QX
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:44:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lsnp0-0004LN-Eu
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 10:44:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623681853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GOv2BksM8x4dMeNvR9zCKUb2BTpLzL1tb4ggsZt9BAM=;
 b=FcEydytHloUChfFyeqNxAt6UvpLgu/4tuYWhuCg+9qbJYY4rY8IeOieSDDcCEWG+KpvZIV
 kqY9vMc5ORhAnsj/EDw7oOA1dp6Rb8RNeLdUG8EdOIYT4yGzIJWWcrGQoflg7qnq6IAvpd
 mZOTHr6sN/wP7Fpf6Xv2uwYw2uZjPJE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-1eh4TlhLM2GU8y9N04t1xQ-1; Mon, 14 Jun 2021 10:44:12 -0400
X-MC-Unique: 1eh4TlhLM2GU8y9N04t1xQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3897800D55;
 Mon, 14 Jun 2021 14:44:11 +0000 (UTC)
Received: from localhost (ovpn-114-163.ams2.redhat.com [10.36.114.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C00A5D6A8;
 Mon, 14 Jun 2021 14:44:11 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH 1/4] export/fuse: Add allow-other option
Date: Mon, 14 Jun 2021 16:44:04 +0200
Message-Id: <20210614144407.134243-2-mreitz@redhat.com>
In-Reply-To: <20210614144407.134243-1-mreitz@redhat.com>
References: <20210614144407.134243-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Without the allow_other mount option, no user (not even root) but the
one who started qemu/the storage daemon can access the export.  Allow
users to configure the export such that such accesses are possible.

When we do pass allow_other, we should also pass default_permissions,
because our export code performs no permission checks.  With
default_permissions, we can just let the kernel do it.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-export.json | 11 ++++++++++-
 block/export/fuse.c    | 17 +++++++++++++++--
 2 files changed, 25 insertions(+), 3 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index e819e70cac..5d1cc04ac4 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -132,11 +132,20 @@
 # @growable: Whether writes beyond the EOF should grow the block node
 #            accordingly. (default: false)
 #
+# @allow-other: By default (if this is false), only qemu's user is allowed
+#               access to this export.  That cannot be changed even with
+#               chmod or chown.
+#               This option will allow other users access to the export with the
+#               FUSE mount options "allow_other,default_permissions".
+#               (default_permissions enables standard UNIX permission checks.)
+#               (since 6.1; default: false)
+#
 # Since: 6.0
 ##
 { 'struct': 'BlockExportOptionsFuse',
   'data': { 'mountpoint': 'str',
-            '*growable': 'bool' },
+            '*growable': 'bool',
+            '*allow-other': 'bool' },
   'if': 'defined(CONFIG_FUSE)' }
 
 ##
diff --git a/block/export/fuse.c b/block/export/fuse.c
index 38f74c94da..34a5836ece 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -46,6 +46,7 @@ typedef struct FuseExport {
     char *mountpoint;
     bool writable;
     bool growable;
+    bool allow_other;
 } FuseExport;
 
 static GHashTable *exports;
@@ -117,6 +118,7 @@ static int fuse_export_create(BlockExport *blk_exp,
     exp->mountpoint = g_strdup(args->mountpoint);
     exp->writable = blk_exp_args->writable;
     exp->growable = args->growable;
+    exp->allow_other = args->allow_other;
 
     ret = setup_fuse_export(exp, args->mountpoint, errp);
     if (ret < 0) {
@@ -150,11 +152,22 @@ static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
 {
     const char *fuse_argv[4];
     char *mount_opts;
+    const char *allow_other;
     struct fuse_args fuse_args;
     int ret;
 
-    /* Needs to match what fuse_init() sets.  Only max_read must be supplied. */
-    mount_opts = g_strdup_printf("max_read=%zu", FUSE_MAX_BOUNCE_BYTES);
+    if (exp->allow_other) {
+        allow_other = ",allow_other,default_permissions";
+    } else {
+        allow_other = "";
+    }
+
+    /*
+     * max_read needs to match what fuse_init() sets.
+     * max_write need not be supplied.
+     */
+    mount_opts = g_strdup_printf("max_read=%zu%s", FUSE_MAX_BOUNCE_BYTES,
+                                 allow_other);
 
     fuse_argv[0] = ""; /* Dummy program name */
     fuse_argv[1] = "-o";
-- 
2.31.1


