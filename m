Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A80408D78
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 15:25:17 +0200 (CEST)
Received: from localhost ([::1]:56736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPlxU-00067D-Ni
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 09:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51544)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFX-0000Jw-Ku
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58030)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mPlFT-0000iV-6I
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 08:39:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631536784;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OzWFqba3ChIj6kZtFj0igVf6keUieisQMci0dxHlOqQ=;
 b=TH0uNTDUsM9Qkxnhk1pLErjQ2glQUa8goEf6N8p+6mvax/KPXtdlPhVWeLWxUe0pMJTrn4
 G6ExydxW2xlugrefY2BVY02I1bVV+JgZPW1LV1MCyewSdXdCTzIArmhqQQTZQt8JFWLlVg
 GRLpWYEeF6rwCtmkjqx+kRKo/baJLaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-KMm3Go8aO3au-OpjTL5TCg-1; Mon, 13 Sep 2021 08:39:43 -0400
X-MC-Unique: KMm3Go8aO3au-OpjTL5TCg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA5CD835DE3
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 12:39:42 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12C5A5D9DD;
 Mon, 13 Sep 2021 12:39:42 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 2CB601138467; Mon, 13 Sep 2021 14:39:32 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/22] qapi: Convert simple union TransactionAction to flat one
Date: Mon, 13 Sep 2021 14:39:20 +0200
Message-Id: <20210913123932.3306639-11-armbru@redhat.com>
In-Reply-To: <20210913123932.3306639-1-armbru@redhat.com>
References: <20210913123932.3306639-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, jsnow@redhat.com,
 Hanna Reitz <hreitz@redhat.com>, eblake@redhat.com,
 marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simple unions predate flat unions.  Having both complicates the QAPI
schema language and the QAPI generator.  We haven't been using simple
unions in new code for a long time, because they are less flexible and
somewhat awkward on the wire.

To prepare for their removal, convert simple union TransactionAction
to an equivalent flat one.  Adds some boilerplate to the schema, which
is a bit ugly, but a lot easier to maintain than the simple union
feature.

Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Hanna Reitz <hreitz@redhat.com>
Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 qapi/transaction.json | 111 +++++++++++++++++++++++++++++++++++++-----
 1 file changed, 99 insertions(+), 12 deletions(-)

diff --git a/qapi/transaction.json b/qapi/transaction.json
index 894258d9e2..d7fc73d7df 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -38,6 +38,91 @@
 { 'enum': 'ActionCompletionMode',
   'data': [ 'individual', 'grouped' ] }
 
+##
+# @TransactionActionKind:
+#
+# Since: 6.1
+##
+{ 'enum': 'TransactionActionKind',
+  'data': [ 'abort', 'block-dirty-bitmap-add', 'block-dirty-bitmap-remove',
+            'block-dirty-bitmap-clear', 'block-dirty-bitmap-enable',
+            'block-dirty-bitmap-disable', 'block-dirty-bitmap-merge',
+            'blockdev-backup', 'blockdev-snapshot',
+            'blockdev-snapshot-internal-sync', 'blockdev-snapshot-sync',
+            'drive-backup' ] }
+
+##
+# @AbortWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'AbortWrapper',
+  'data': { 'data': 'Abort' } }
+
+##
+# @BlockDirtyBitmapAddWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'BlockDirtyBitmapAddWrapper',
+  'data': { 'data': 'BlockDirtyBitmapAdd' } }
+
+##
+# @BlockDirtyBitmapWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'BlockDirtyBitmapWrapper',
+  'data': { 'data': 'BlockDirtyBitmap' } }
+
+##
+# @BlockDirtyBitmapMergeWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'BlockDirtyBitmapMergeWrapper',
+  'data': { 'data': 'BlockDirtyBitmapMerge' } }
+
+##
+# @BlockdevBackupWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'BlockdevBackupWrapper',
+  'data': { 'data': 'BlockdevBackup' } }
+
+##
+# @BlockdevSnapshotWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'BlockdevSnapshotWrapper',
+  'data': { 'data': 'BlockdevSnapshot' } }
+
+##
+# @BlockdevSnapshotInternalWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'BlockdevSnapshotInternalWrapper',
+  'data': { 'data': 'BlockdevSnapshotInternal' } }
+
+##
+# @BlockdevSnapshotSyncWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'BlockdevSnapshotSyncWrapper',
+  'data': { 'data': 'BlockdevSnapshotSync' } }
+
+##
+# @DriveBackupWrapper:
+#
+# Since: 6.1
+##
+{ 'struct': 'DriveBackupWrapper',
+  'data': { 'data': 'DriveBackup' } }
+
 ##
 # @TransactionAction:
 #
@@ -60,19 +145,21 @@
 # Since: 1.1
 ##
 { 'union': 'TransactionAction',
+  'base': { 'type': 'TransactionActionKind' },
+  'discriminator': 'type',
   'data': {
-       'abort': 'Abort',
-       'block-dirty-bitmap-add': 'BlockDirtyBitmapAdd',
-       'block-dirty-bitmap-remove': 'BlockDirtyBitmap',
-       'block-dirty-bitmap-clear': 'BlockDirtyBitmap',
-       'block-dirty-bitmap-enable': 'BlockDirtyBitmap',
-       'block-dirty-bitmap-disable': 'BlockDirtyBitmap',
-       'block-dirty-bitmap-merge': 'BlockDirtyBitmapMerge',
-       'blockdev-backup': 'BlockdevBackup',
-       'blockdev-snapshot': 'BlockdevSnapshot',
-       'blockdev-snapshot-internal-sync': 'BlockdevSnapshotInternal',
-       'blockdev-snapshot-sync': 'BlockdevSnapshotSync',
-       'drive-backup': 'DriveBackup'
+       'abort': 'AbortWrapper',
+       'block-dirty-bitmap-add': 'BlockDirtyBitmapAddWrapper',
+       'block-dirty-bitmap-remove': 'BlockDirtyBitmapWrapper',
+       'block-dirty-bitmap-clear': 'BlockDirtyBitmapWrapper',
+       'block-dirty-bitmap-enable': 'BlockDirtyBitmapWrapper',
+       'block-dirty-bitmap-disable': 'BlockDirtyBitmapWrapper',
+       'block-dirty-bitmap-merge': 'BlockDirtyBitmapMergeWrapper',
+       'blockdev-backup': 'BlockdevBackupWrapper',
+       'blockdev-snapshot': 'BlockdevSnapshotWrapper',
+       'blockdev-snapshot-internal-sync': 'BlockdevSnapshotInternalWrapper',
+       'blockdev-snapshot-sync': 'BlockdevSnapshotSyncWrapper',
+       'drive-backup': 'DriveBackupWrapper'
    } }
 
 ##
-- 
2.31.1


