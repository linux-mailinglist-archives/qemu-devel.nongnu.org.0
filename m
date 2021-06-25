Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9A33B45E9
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:39:18 +0200 (CEST)
Received: from localhost ([::1]:52622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmzF-00074O-TE
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwmjz-0006LI-1w
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:23:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55415)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lwmjv-0005Ue-DB
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:23:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624631006;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N7bXEwLOGLduU7SST018UwYyfBiZXovGsR+TNrzwZhk=;
 b=OoeKIa/O9axtsadzwd5ugSy62qSY0di5YVACCeVE+KK6b3D0T30qJJRJaERyO6206UuhR3
 bdIttGxnsegEbQE6bNWgzXiKUg3PtUJYjYvWI3I7Ilg8duOW1qL3Ac3n+UDwX5YDIQ4K4a
 TZZq435L3pfvU1JsZnp/p2Cd2ljvLtY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-v8BZRlpkNxatUqeUm5WiMw-1; Fri, 25 Jun 2021 10:23:25 -0400
X-MC-Unique: v8BZRlpkNxatUqeUm5WiMw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3E8CB800C78;
 Fri, 25 Jun 2021 14:23:24 +0000 (UTC)
Received: from localhost (ovpn-113-54.ams2.redhat.com [10.36.113.54])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AE1C017C5F;
 Fri, 25 Jun 2021 14:23:23 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 2/6] export/fuse: Add allow-other option
Date: Fri, 25 Jun 2021 16:23:13 +0200
Message-Id: <20210625142317.271673-3-mreitz@redhat.com>
In-Reply-To: <20210625142317.271673-1-mreitz@redhat.com>
References: <20210625142317.271673-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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

While allow_other is probably what users want, we cannot make it an
unconditional default, because passing it is only possible (for non-root
users) if the global fuse.conf configuration file allows it.  Thus, the
default is an 'auto' mode, in which we first try with allow_other, and
then fall back to without.

FuseExport.allow_other reports whether allow_other was actually used as
a mount option or not.  Currently, this information is not used, but a
future patch will let this field decide whether e.g. an export's UID and
GID can be changed through chmod.

One notable thing about 'auto' mode is that libfuse may print error
messages directly to stderr, and so may fusermount (which it executes).
Our export code cannot really filter or hide them.  Therefore, if 'auto'
fails its first attempt and has to fall back, fusermount will print an
error message that mounting with allow_other failed.

This behavior necessitates a change to iotest 308, namely we need to
filter out this error message (because if the first attempt at mounting
with allow_other succeeds, there will be no such message).

Furthermore, common.rc's _make_test_img should use allow-other=off for
FUSE exports, because iotests generally do not need to access images
from other users, so allow-other=on or allow-other=auto have no
advantage.  OTOH, allow-other=on will not work on systems where
user_allow_other is disabled, and with allow-other=auto, we get said
error message that we would need to filter out again.  Just disabling
allow-other is simplest.

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 qapi/block-export.json       | 33 ++++++++++++++++++++++++++++++++-
 block/export/fuse.c          | 28 +++++++++++++++++++++++-----
 tests/qemu-iotests/308       |  6 +++++-
 tests/qemu-iotests/common.rc |  6 +++++-
 4 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index e819e70cac..0ed63442a8 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -120,6 +120,23 @@
 	    '*logical-block-size': 'size',
             '*num-queues': 'uint16'} }
 
+##
+# @FuseExportAllowOther:
+#
+# Possible allow_other modes for FUSE exports.
+#
+# @off: Do not pass allow_other as a mount option.
+#
+# @on: Pass allow_other as a mount option.
+#
+# @auto: Try mounting with allow_other first, and if that fails, retry
+#        without allow_other.
+#
+# Since: 6.1
+##
+{ 'enum': 'FuseExportAllowOther',
+  'data': ['off', 'on', 'auto'] }
+
 ##
 # @BlockExportOptionsFuse:
 #
@@ -132,11 +149,25 @@
 # @growable: Whether writes beyond the EOF should grow the block node
 #            accordingly. (default: false)
 #
+# @allow-other: If this is off, only qemu's user is allowed access to
+#               this export.  That cannot be changed even with chmod or
+#               chown.
+#               Enabling this option will allow other users access to
+#               the export with the FUSE mount option "allow_other".
+#               Note that using allow_other as a non-root user requires
+#               user_allow_other to be enabled in the global fuse.conf
+#               configuration file.
+#               In auto mode (the default), the FUSE export driver will
+#               first attempt to mount the export with allow_other, and
+#               if that fails, try again without.
+#               (since 6.1; default: auto)
+#
 # Since: 6.0
 ##
 { 'struct': 'BlockExportOptionsFuse',
   'data': { 'mountpoint': 'str',
-            '*growable': 'bool' },
+            '*growable': 'bool',
+            '*allow-other': 'FuseExportAllowOther' },
   'if': 'defined(CONFIG_FUSE)' }
 
 ##
diff --git a/block/export/fuse.c b/block/export/fuse.c
index d0b88e8f80..4068250241 100644
--- a/block/export/fuse.c
+++ b/block/export/fuse.c
@@ -46,6 +46,8 @@ typedef struct FuseExport {
     char *mountpoint;
     bool writable;
     bool growable;
+    /* Whether allow_other was used as a mount option or not */
+    bool allow_other;
 } FuseExport;
 
 static GHashTable *exports;
@@ -57,7 +59,7 @@ static void fuse_export_delete(BlockExport *exp);
 static void init_exports_table(void);
 
 static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
-                             Error **errp);
+                             bool allow_other, Error **errp);
 static void read_from_fuse_export(void *opaque);
 
 static bool is_regular_file(const char *path, Error **errp);
@@ -118,7 +120,22 @@ static int fuse_export_create(BlockExport *blk_exp,
     exp->writable = blk_exp_args->writable;
     exp->growable = args->growable;
 
-    ret = setup_fuse_export(exp, args->mountpoint, errp);
+    /* set default */
+    if (!args->has_allow_other) {
+        args->allow_other = FUSE_EXPORT_ALLOW_OTHER_AUTO;
+    }
+
+    if (args->allow_other == FUSE_EXPORT_ALLOW_OTHER_AUTO) {
+        /* Ignore errors on our first attempt */
+        ret = setup_fuse_export(exp, args->mountpoint, true, NULL);
+        exp->allow_other = ret == 0;
+        if (ret < 0) {
+            ret = setup_fuse_export(exp, args->mountpoint, false, errp);
+        }
+    } else {
+        exp->allow_other = args->allow_other == FUSE_EXPORT_ALLOW_OTHER_ON;
+        ret = setup_fuse_export(exp, args->mountpoint, exp->allow_other, errp);
+    }
     if (ret < 0) {
         goto fail;
     }
@@ -146,7 +163,7 @@ static void init_exports_table(void)
  * Create exp->fuse_session and mount it.
  */
 static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
-                             Error **errp)
+                             bool allow_other, Error **errp)
 {
     const char *fuse_argv[4];
     char *mount_opts;
@@ -157,8 +174,9 @@ static int setup_fuse_export(FuseExport *exp, const char *mountpoint,
      * max_read needs to match what fuse_init() sets.
      * max_write need not be supplied.
      */
-    mount_opts = g_strdup_printf("max_read=%zu,default_permissions",
-                                 FUSE_MAX_BOUNCE_BYTES);
+    mount_opts = g_strdup_printf("max_read=%zu,default_permissions%s",
+                                 FUSE_MAX_BOUNCE_BYTES,
+                                 allow_other ? ",allow_other" : "");
 
     fuse_argv[0] = ""; /* Dummy program name */
     fuse_argv[1] = "-o";
diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
index 11c28a75f2..d13a9a969c 100755
--- a/tests/qemu-iotests/308
+++ b/tests/qemu-iotests/308
@@ -58,6 +58,9 @@ _supported_os Linux # We need /dev/urandom
 # $4: Node to export (defaults to 'node-format')
 fuse_export_add()
 {
+    # The grep -v is a filter for errors when /etc/fuse.conf does not contain
+    # user_allow_other.  (The error is benign, but it is printed by fusermount
+    # on the first mount attempt, so our export code cannot hide it.)
     _send_qemu_cmd $QEMU_HANDLE \
         "{'execute': 'block-export-add',
           'arguments': {
@@ -67,7 +70,8 @@ fuse_export_add()
               $2
           } }" \
         "${3:-return}" \
-        | _filter_imgfmt
+        | _filter_imgfmt \
+        | grep -v 'option allow_other only allowed if'
 }
 
 # $1: Export ID
diff --git a/tests/qemu-iotests/common.rc b/tests/qemu-iotests/common.rc
index cbbf6d7c7f..609d82de89 100644
--- a/tests/qemu-iotests/common.rc
+++ b/tests/qemu-iotests/common.rc
@@ -512,9 +512,13 @@ _make_test_img()
         # Usually, users would export formatted nodes.  But we present fuse as a
         # protocol-level driver here, so we have to leave the format to the
         # client.
+        # Switch off allow-other, because in general we do not need it for
+        # iotests.  The default allow-other=auto has the downside of printing a
+        # fusermount error on its first attempt if allow_other is not
+        # permissible, which we would need to filter.
         QSD_NEED_PID=y $QSD \
               --blockdev file,node-name=export-node,filename=$img_name,discard=unmap \
-              --export fuse,id=fuse-export,node-name=export-node,mountpoint="$export_mp",writable=on,growable=on \
+              --export fuse,id=fuse-export,node-name=export-node,mountpoint="$export_mp",writable=on,growable=on,allow-other=off \
               &
 
         pidfile="$QEMU_TEST_DIR/qemu-storage-daemon.pid"
-- 
2.31.1


