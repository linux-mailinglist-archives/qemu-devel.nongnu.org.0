Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3919419506
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Sep 2021 15:24:37 +0200 (CEST)
Received: from localhost ([::1]:55474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mUqcW-00040u-Iw
	for lists+qemu-devel@lfdr.de; Mon, 27 Sep 2021 09:24:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLb-0003N4-Kb
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1mUqLP-0003jc-TR
 for qemu-devel@nongnu.org; Mon, 27 Sep 2021 09:07:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632748015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nH2PT1yKeJg+fJFFcmXZqwNh8bl3WMfEN+zyuo2foWM=;
 b=dp0eu3WOWnIg7Hof1l0KID3yfD7Sp8Ha4Be404eYoeAfg2rVigu46VjkfdSzB4vzQlHZmG
 bf4mQrSs1b+ooxcU9salb95AVQzel+jcp9/LiD4vscMzR6IgyieEGuSCHREHTz/EYS6Wo+
 VuzR+SJa5rK32a1bvStjcNa7GTaYbEM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-OD3WTtvjPRS_zw6CDx1QTA-1; Mon, 27 Sep 2021 09:06:51 -0400
X-MC-Unique: OD3WTtvjPRS_zw6CDx1QTA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3E721927834;
 Mon, 27 Sep 2021 13:06:50 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-14.ams2.redhat.com
 [10.36.112.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 92CC160C81;
 Mon, 27 Sep 2021 13:06:50 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 977C61138467; Mon, 27 Sep 2021 15:06:47 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 10/25] qapi: Convert simple union TransactionAction to flat
 one
Date: Mon, 27 Sep 2021 15:06:32 +0200
Message-Id: <20210927130647.1271533-11-armbru@redhat.com>
In-Reply-To: <20210927130647.1271533-1-armbru@redhat.com>
References: <20210927130647.1271533-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, peter.maydell@linaro.org,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
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
Reviewed-by: Eric Blake <eblake@redhat.com>
Acked-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20210917143134.412106-11-armbru@redhat.com>
---
 qapi/transaction.json | 139 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 113 insertions(+), 26 deletions(-)

diff --git a/qapi/transaction.json b/qapi/transaction.json
index 894258d9e2..d175b5f863 100644
--- a/qapi/transaction.json
+++ b/qapi/transaction.json
@@ -38,41 +38,128 @@
 { 'enum': 'ActionCompletionMode',
   'data': [ 'individual', 'grouped' ] }
 
+##
+# @TransactionActionKind:
+#
+# @abort: Since 1.6
+# @block-dirty-bitmap-add: Since 2.5
+# @block-dirty-bitmap-remove: Since 4.2
+# @block-dirty-bitmap-clear: Since 2.5
+# @block-dirty-bitmap-enable: Since 4.0
+# @block-dirty-bitmap-disable: Since 4.0
+# @block-dirty-bitmap-merge: Since 4.0
+# @blockdev-backup: Since 2.3
+# @blockdev-snapshot: Since 2.5
+# @blockdev-snapshot-internal-sync: Since 1.7
+# @blockdev-snapshot-sync: since 1.1
+# @drive-backup: Since 1.6
+#
+# Since: 1.1
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
+# Since: 1.6
+##
+{ 'struct': 'AbortWrapper',
+  'data': { 'data': 'Abort' } }
+
+##
+# @BlockDirtyBitmapAddWrapper:
+#
+# Since: 2.5
+##
+{ 'struct': 'BlockDirtyBitmapAddWrapper',
+  'data': { 'data': 'BlockDirtyBitmapAdd' } }
+
+##
+# @BlockDirtyBitmapWrapper:
+#
+# Since: 2.5
+##
+{ 'struct': 'BlockDirtyBitmapWrapper',
+  'data': { 'data': 'BlockDirtyBitmap' } }
+
+##
+# @BlockDirtyBitmapMergeWrapper:
+#
+# Since: 4.0
+##
+{ 'struct': 'BlockDirtyBitmapMergeWrapper',
+  'data': { 'data': 'BlockDirtyBitmapMerge' } }
+
+##
+# @BlockdevBackupWrapper:
+#
+# Since: 2.3
+##
+{ 'struct': 'BlockdevBackupWrapper',
+  'data': { 'data': 'BlockdevBackup' } }
+
+##
+# @BlockdevSnapshotWrapper:
+#
+# Since: 2.5
+##
+{ 'struct': 'BlockdevSnapshotWrapper',
+  'data': { 'data': 'BlockdevSnapshot' } }
+
+##
+# @BlockdevSnapshotInternalWrapper:
+#
+# Since: 1.7
+##
+{ 'struct': 'BlockdevSnapshotInternalWrapper',
+  'data': { 'data': 'BlockdevSnapshotInternal' } }
+
+##
+# @BlockdevSnapshotSyncWrapper:
+#
+# Since: 1.1
+##
+{ 'struct': 'BlockdevSnapshotSyncWrapper',
+  'data': { 'data': 'BlockdevSnapshotSync' } }
+
+##
+# @DriveBackupWrapper:
+#
+# Since: 1.6
+##
+{ 'struct': 'DriveBackupWrapper',
+  'data': { 'data': 'DriveBackup' } }
+
 ##
 # @TransactionAction:
 #
 # A discriminated record of operations that can be performed with
-# @transaction. Action @type can be:
-#
-# - @abort: since 1.6
-# - @block-dirty-bitmap-add: since 2.5
-# - @block-dirty-bitmap-remove: since 4.2
-# - @block-dirty-bitmap-clear: since 2.5
-# - @block-dirty-bitmap-enable: since 4.0
-# - @block-dirty-bitmap-disable: since 4.0
-# - @block-dirty-bitmap-merge: since 4.0
-# - @blockdev-backup: since 2.3
-# - @blockdev-snapshot: since 2.5
-# - @blockdev-snapshot-internal-sync: since 1.7
-# - @blockdev-snapshot-sync: since 1.1
-# - @drive-backup: since 1.6
+# @transaction.
 #
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


