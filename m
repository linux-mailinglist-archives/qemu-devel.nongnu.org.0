Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F383933DA0B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:02:06 +0100 (CET)
Received: from localhost ([::1]:54272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMD53-0006AP-Rl
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:02:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCss-0002ii-HQ
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:49:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:58350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCsl-0006cf-Jb
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:49:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615913362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lt15PA6pMvEtulrp0TDrwo0W+Dcl0trz/vVC0ZoMpgk=;
 b=VjN9GLfnrv3UDzIrUuVYbnpUBczrPshIZBd9KtHzZSGSq/r/4UbkrOGvfodQrXqNxjONTq
 fIU4kc+PhReZ+KSpzVykbMGTp+dEIlLHVbJO1AqT+eluaFgfIrnW4q/+farfF8kz1f2cX/
 bUgjf2INdTI2X1x4U2bN/8DwnG1l3rA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-IUPmOvXWNnOeyRwq1sMk-g-1; Tue, 16 Mar 2021 12:49:17 -0400
X-MC-Unique: IUPmOvXWNnOeyRwq1sMk-g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD4C918D6A2A;
 Tue, 16 Mar 2021 16:49:15 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-185.ams2.redhat.com
 [10.36.115.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E35605C1A1;
 Tue, 16 Mar 2021 16:48:49 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/13] block: remove dirty bitmaps 'status' field
Date: Tue, 16 Mar 2021 16:43:53 +0000
Message-Id: <20210316164355.150519-12-berrange@redhat.com>
In-Reply-To: <20210316164355.150519-1-berrange@redhat.com>
References: <20210316164355.150519-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 libvir-list@redhat.com, Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Greg Kurz <groug@kaod.org>,
 Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Max Reitz <mreitz@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The same information is available via the 'recording' and 'busy' fields.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/dirty-bitmap.c             |  38 ----
 docs/system/deprecated.rst       |   7 -
 docs/system/removed-features.rst |   7 +
 include/block/dirty-bitmap.h     |   1 -
 qapi/block-core.json             |  45 ----
 tests/qemu-iotests/124           |   4 -
 tests/qemu-iotests/194.out       |   4 +-
 tests/qemu-iotests/236.out       |  42 ++--
 tests/qemu-iotests/246.out       |  66 ++----
 tests/qemu-iotests/254.out       |   9 +-
 tests/qemu-iotests/257.out       | 378 +++++++++++--------------------
 11 files changed, 174 insertions(+), 427 deletions(-)

diff --git a/block/dirty-bitmap.c b/block/dirty-bitmap.c
index a0eaa28785..68d295d6e3 100644
--- a/block/dirty-bitmap.c
+++ b/block/dirty-bitmap.c
@@ -166,43 +166,6 @@ bool bdrv_dirty_bitmap_enabled(BdrvDirtyBitmap *bitmap)
     return !bitmap->disabled;
 }
 
-/**
- * bdrv_dirty_bitmap_status: This API is now deprecated.
- * Called with BQL taken.
- *
- * A BdrvDirtyBitmap can be in four possible user-visible states:
- * (1) Active:   successor is NULL, and disabled is false: full r/w mode
- * (2) Disabled: successor is NULL, and disabled is true: qualified r/w mode,
- *               guest writes are dropped, but monitor writes are possible,
- *               through commands like merge and clear.
- * (3) Frozen:   successor is not NULL.
- *               A frozen bitmap cannot be renamed, deleted, cleared, set,
- *               enabled, merged to, etc. A frozen bitmap can only abdicate()
- *               or reclaim().
- *               In this state, the anonymous successor bitmap may be either
- *               Active and recording writes from the guest (e.g. backup jobs),
- *               or it can be Disabled and not recording writes.
- * (4) Locked:   Whether Active or Disabled, the user cannot modify this bitmap
- *               in any way from the monitor.
- * (5) Inconsistent: This is a persistent bitmap whose "in use" bit is set, and
- *                   is unusable by QEMU. It can be deleted to remove it from
- *                   the qcow2.
- */
-DirtyBitmapStatus bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap)
-{
-    if (bdrv_dirty_bitmap_inconsistent(bitmap)) {
-        return DIRTY_BITMAP_STATUS_INCONSISTENT;
-    } else if (bdrv_dirty_bitmap_has_successor(bitmap)) {
-        return DIRTY_BITMAP_STATUS_FROZEN;
-    } else if (bdrv_dirty_bitmap_busy(bitmap)) {
-        return DIRTY_BITMAP_STATUS_LOCKED;
-    } else if (!bdrv_dirty_bitmap_enabled(bitmap)) {
-        return DIRTY_BITMAP_STATUS_DISABLED;
-    } else {
-        return DIRTY_BITMAP_STATUS_ACTIVE;
-    }
-}
-
 /* Called with BQL taken.  */
 static bool bdrv_dirty_bitmap_recording(BdrvDirtyBitmap *bitmap)
 {
@@ -582,7 +545,6 @@ BlockDirtyInfoList *bdrv_query_dirty_bitmaps(BlockDriverState *bs)
         info->granularity = bdrv_dirty_bitmap_granularity(bm);
         info->has_name = !!bm->name;
         info->name = g_strdup(bm->name);
-        info->status = bdrv_dirty_bitmap_status(bm);
         info->recording = bdrv_dirty_bitmap_recording(bm);
         info->busy = bdrv_dirty_bitmap_busy(bm);
         info->persistent = bm->persistent;
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 5e776fb4b0..b1b487256a 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -199,13 +199,6 @@ Use arguments ``base-node`` and ``top-node`` instead.
 
 Specify the properties for the object as top-level arguments instead.
 
-``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].status (since 4.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``status`` field of the ``BlockDirtyInfo`` structure, returned by
-these commands is deprecated. Two new boolean fields, ``recording`` and
-``busy`` effectively replace it.
-
 ``query-block`` result field ``dirty-bitmaps`` (Since 4.2)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 06d6540ad2..67526f1dd9 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -113,6 +113,13 @@ Removed with no replacement.
 
 Removed with no replacement.
 
+``query-named-block-nodes`` and ``query-block`` result dirty-bitmaps[i].status (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``status`` field of the ``BlockDirtyInfo`` structure, returned by
+these commands is removed. Two new boolean fields, ``recording`` and
+``busy`` effectively replace it.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/include/block/dirty-bitmap.h b/include/block/dirty-bitmap.h
index f581cf9fd7..40950ae3d5 100644
--- a/include/block/dirty-bitmap.h
+++ b/include/block/dirty-bitmap.h
@@ -46,7 +46,6 @@ bool bdrv_dirty_bitmap_enabled(BdrvDirtyBitmap *bitmap);
 bool bdrv_dirty_bitmap_has_successor(BdrvDirtyBitmap *bitmap);
 const char *bdrv_dirty_bitmap_name(const BdrvDirtyBitmap *bitmap);
 int64_t bdrv_dirty_bitmap_size(const BdrvDirtyBitmap *bitmap);
-DirtyBitmapStatus bdrv_dirty_bitmap_status(BdrvDirtyBitmap *bitmap);
 void bdrv_set_dirty_bitmap(BdrvDirtyBitmap *bitmap,
                            int64_t offset, int64_t bytes);
 void bdrv_reset_dirty_bitmap(BdrvDirtyBitmap *bitmap,
diff --git a/qapi/block-core.json b/qapi/block-core.json
index d256b7b776..2a0c345c2c 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -418,43 +418,6 @@
 ##
 { 'enum': 'BlockDeviceIoStatus', 'data': [ 'ok', 'failed', 'nospace' ] }
 
-##
-# @DirtyBitmapStatus:
-#
-# An enumeration of possible states that a dirty bitmap can report to the user.
-#
-# @frozen: The bitmap is currently in-use by some operation and is immutable.
-#          If the bitmap was @active prior to the operation, new writes by the
-#          guest are being recorded in a temporary buffer, and will not be lost.
-#          Generally, bitmaps are cleared on successful use in an operation and
-#          the temporary buffer is committed into the bitmap. On failure, the
-#          temporary buffer is merged back into the bitmap without first
-#          clearing it.
-#          Please refer to the documentation for each bitmap-using operation,
-#          See also @blockdev-backup, @drive-backup.
-#
-# @disabled: The bitmap is not currently recording new writes by the guest.
-#            This is requested explicitly via @block-dirty-bitmap-disable.
-#            It can still be cleared, deleted, or used for backup operations.
-#
-# @active: The bitmap is actively monitoring for new writes, and can be cleared,
-#          deleted, or used for backup operations.
-#
-# @locked: The bitmap is currently in-use by some operation and is immutable.
-#          If the bitmap was @active prior to the operation, it is still
-#          recording new writes. If the bitmap was @disabled, it is not
-#          recording new writes. (Since 2.12)
-#
-# @inconsistent: This is a persistent dirty bitmap that was marked in-use on
-#                disk, and is unusable by QEMU. It can only be deleted.
-#                Please rely on the inconsistent field in @BlockDirtyInfo
-#                instead, as the status field is deprecated. (Since 4.0)
-#
-# Since: 2.4
-##
-{ 'enum': 'DirtyBitmapStatus',
-  'data': ['active', 'disabled', 'frozen', 'locked', 'inconsistent'] }
-
 ##
 # @BlockDirtyInfo:
 #
@@ -466,8 +429,6 @@
 #
 # @granularity: granularity of the dirty bitmap in bytes (since 1.4)
 #
-# @status: current status of the dirty bitmap (since 2.4)
-#
 # @recording: true if the bitmap is recording new writes from the guest.
 #             Replaces `active` and `disabled` statuses. (since 4.0)
 #
@@ -483,17 +444,11 @@
 #                @busy to be false. This bitmap cannot be used. To remove
 #                it, use @block-dirty-bitmap-remove. (Since 4.0)
 #
-# Features:
-# @deprecated: Member @status is deprecated.  Use @recording and
-#              @locked instead.
-#
 # Since: 1.3
 ##
 { 'struct': 'BlockDirtyInfo',
   'data': {'*name': 'str', 'count': 'int', 'granularity': 'uint32',
            'recording': 'bool', 'busy': 'bool',
-           'status': { 'type': 'DirtyBitmapStatus',
-                       'features': [ 'deprecated' ] },
            'persistent': 'bool', '*inconsistent': 'bool' } }
 
 ##
diff --git a/tests/qemu-iotests/124 b/tests/qemu-iotests/124
index 90cdbd8e24..845ab5303c 100755
--- a/tests/qemu-iotests/124
+++ b/tests/qemu-iotests/124
@@ -348,7 +348,6 @@ class TestIncrementalBackup(TestIncrementalBackupBase):
                 'name': 'bitmap0',
                 'count': 458752,
                 'granularity': 65536,
-                'status': 'active',
                 'persistent': False
             }))
 
@@ -705,7 +704,6 @@ class TestIncrementalBackupBlkdebug(TestIncrementalBackupBase):
             drive0['id'], bitmap.name, {
                 'count': 458752,
                 'granularity': 65536,
-                'status': 'active',
                 'busy': False,
                 'recording': True
             }))
@@ -736,7 +734,6 @@ class TestIncrementalBackupBlkdebug(TestIncrementalBackupBase):
             drive0['id'], bitmap.name, {
                 'count': 458752,
                 'granularity': 65536,
-                'status': 'frozen',
                 'busy': True,
                 'recording': True
             }))
@@ -751,7 +748,6 @@ class TestIncrementalBackupBlkdebug(TestIncrementalBackupBase):
             drive0['id'], bitmap.name, {
                 'count': 0,
                 'granularity': 65536,
-                'status': 'active',
                 'busy': False,
                 'recording': True
             }))
diff --git a/tests/qemu-iotests/194.out b/tests/qemu-iotests/194.out
index a51bdb2d4f..4e6df1565a 100644
--- a/tests/qemu-iotests/194.out
+++ b/tests/qemu-iotests/194.out
@@ -24,6 +24,6 @@ Stopping the NBD server on destination...
 Wait for migration completion on target...
 {"data": {"status": "completed"}, "event": "MIGRATION", "timestamp": {"microseconds": "USECS", "seconds": "SECS"}}
 Check bitmaps on source:
-[{"busy": false, "count": 0, "granularity": 65536, "name": "bitmap0", "persistent": false, "recording": true, "status": "active"}]
+[{"busy": false, "count": 0, "granularity": 65536, "name": "bitmap0", "persistent": false, "recording": true}]
 Check bitmaps on target:
-[{"busy": false, "count": 0, "granularity": 65536, "name": "bitmap0", "persistent": false, "recording": true, "status": "active"}]
+[{"busy": false, "count": 0, "granularity": 65536, "name": "bitmap0", "persistent": false, "recording": true}]
diff --git a/tests/qemu-iotests/236.out b/tests/qemu-iotests/236.out
index 815cd053f0..7448ceea02 100644
--- a/tests/qemu-iotests/236.out
+++ b/tests/qemu-iotests/236.out
@@ -27,8 +27,7 @@ write -P0xcd 0x3ff0000 64k
         "granularity": 65536,
         "name": "bitmapB",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -36,8 +35,7 @@ write -P0xcd 0x3ff0000 64k
         "granularity": 65536,
         "name": "bitmapA",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -93,8 +91,7 @@ write -P0xcd 0x3ff0000 64k
         "granularity": 65536,
         "name": "bitmapB",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -102,8 +99,7 @@ write -P0xcd 0x3ff0000 64k
         "granularity": 65536,
         "name": "bitmapA",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -197,8 +193,7 @@ write -P0xea 0x3fe0000 64k
         "granularity": 65536,
         "name": "bitmapC",
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
@@ -206,8 +201,7 @@ write -P0xea 0x3fe0000 64k
         "granularity": 65536,
         "name": "bitmapB",
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
@@ -215,8 +209,7 @@ write -P0xea 0x3fe0000 64k
         "granularity": 65536,
         "name": "bitmapA",
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       }
     ]
   }
@@ -270,8 +263,7 @@ write -P0xea 0x3fe0000 64k
         "granularity": 65536,
         "name": "bitmapC",
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
@@ -279,8 +271,7 @@ write -P0xea 0x3fe0000 64k
         "granularity": 65536,
         "name": "bitmapB",
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
@@ -288,8 +279,7 @@ write -P0xea 0x3fe0000 64k
         "granularity": 65536,
         "name": "bitmapA",
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       }
     ]
   }
@@ -336,8 +326,7 @@ write -P0xea 0x3fe0000 64k
         "granularity": 65536,
         "name": "bitmapD",
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
@@ -345,8 +334,7 @@ write -P0xea 0x3fe0000 64k
         "granularity": 65536,
         "name": "bitmapC",
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
@@ -354,8 +342,7 @@ write -P0xea 0x3fe0000 64k
         "granularity": 65536,
         "name": "bitmapB",
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
@@ -363,8 +350,7 @@ write -P0xea 0x3fe0000 64k
         "granularity": 65536,
         "name": "bitmapA",
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       }
     ]
   }
diff --git a/tests/qemu-iotests/246.out b/tests/qemu-iotests/246.out
index 6671a11fdd..eeb98ab37c 100644
--- a/tests/qemu-iotests/246.out
+++ b/tests/qemu-iotests/246.out
@@ -24,8 +24,7 @@
         "granularity": 65536,
         "name": "Transient",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -33,8 +32,7 @@
         "granularity": 131072,
         "name": "Large",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -42,8 +40,7 @@
         "granularity": 65536,
         "name": "Medium",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -51,8 +48,7 @@
         "granularity": 32768,
         "name": "Small",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -68,8 +64,7 @@
         "granularity": 32768,
         "name": "Small",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -77,8 +72,7 @@
         "granularity": 65536,
         "name": "Medium",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -86,8 +80,7 @@
         "granularity": 131072,
         "name": "Large",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -108,8 +101,7 @@
         "granularity": 65536,
         "name": "Newtwo",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -117,8 +109,7 @@
         "granularity": 65536,
         "name": "New",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -126,8 +117,7 @@
         "granularity": 32768,
         "name": "Small",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -135,8 +125,7 @@
         "granularity": 65536,
         "name": "Medium",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -144,8 +133,7 @@
         "granularity": 131072,
         "name": "Large",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -163,8 +151,7 @@
         "granularity": 65536,
         "name": "New",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -172,8 +159,7 @@
         "granularity": 65536,
         "name": "Newtwo",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -181,8 +167,7 @@
         "granularity": 32768,
         "name": "Small",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -190,8 +175,7 @@
         "granularity": 65536,
         "name": "Medium",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -199,8 +183,7 @@
         "granularity": 131072,
         "name": "Large",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -232,8 +215,7 @@
         "granularity": 65536,
         "name": "NewB",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -241,8 +223,7 @@
         "granularity": 65536,
         "name": "NewC",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -250,8 +231,7 @@
         "granularity": 32768,
         "name": "Small",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -259,8 +239,7 @@
         "granularity": 65536,
         "name": "Medium",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": false,
@@ -268,8 +247,7 @@
         "granularity": 131072,
         "name": "Large",
         "persistent": true,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
diff --git a/tests/qemu-iotests/254.out b/tests/qemu-iotests/254.out
index d185c0532f..fe52da9338 100644
--- a/tests/qemu-iotests/254.out
+++ b/tests/qemu-iotests/254.out
@@ -99,8 +99,7 @@ query-block: device = drive0, node-name = snap, dirty-bitmaps:
     "granularity": 65536,
     "name": "bitmap2",
     "persistent": true,
-    "recording": true,
-    "status": "active"
+    "recording": true
   },
   {
     "busy": false,
@@ -108,8 +107,7 @@ query-block: device = drive0, node-name = snap, dirty-bitmaps:
     "granularity": 65536,
     "name": "bitmap1",
     "persistent": true,
-    "recording": true,
-    "status": "active"
+    "recording": true
   },
   {
     "busy": false,
@@ -117,8 +115,7 @@ query-block: device = drive0, node-name = snap, dirty-bitmaps:
     "granularity": 65536,
     "name": "bitmap0",
     "persistent": false,
-    "recording": true,
-    "status": "active"
+    "recording": true
   }
 ]
 
diff --git a/tests/qemu-iotests/257.out b/tests/qemu-iotests/257.out
index a7ba512f4c..50cbd8e882 100644
--- a/tests/qemu-iotests/257.out
+++ b/tests/qemu-iotests/257.out
@@ -58,8 +58,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -113,16 +112,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -130,8 +127,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -156,8 +152,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -185,8 +180,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -234,8 +228,7 @@ expecting 15 dirty sectors; have 15. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -318,8 +311,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -367,8 +359,7 @@ expecting 6 dirty sectors; have 6. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -396,8 +387,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -445,8 +435,7 @@ expecting 14 dirty sectors; have 14. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -529,8 +518,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -584,16 +572,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -601,8 +587,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -627,8 +612,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -656,8 +640,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -705,8 +688,7 @@ expecting 15 dirty sectors; have 15. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -789,8 +771,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -844,16 +825,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -861,8 +840,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -887,8 +865,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -916,8 +893,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -965,8 +941,7 @@ expecting 15 dirty sectors; have 15. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1049,8 +1024,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1098,8 +1072,7 @@ expecting 6 dirty sectors; have 6. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1127,8 +1100,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1176,8 +1148,7 @@ expecting 14 dirty sectors; have 14. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1260,8 +1231,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1315,16 +1285,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -1332,8 +1300,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -1358,8 +1325,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1387,8 +1353,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1436,8 +1401,7 @@ expecting 12 dirty sectors; have 12. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1520,8 +1484,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1575,16 +1538,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -1592,8 +1553,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -1618,8 +1578,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1647,8 +1606,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1696,8 +1654,7 @@ expecting 12 dirty sectors; have 12. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1780,8 +1737,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1829,8 +1785,7 @@ expecting 6 dirty sectors; have 6. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1858,8 +1813,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1907,8 +1861,7 @@ expecting 13 dirty sectors; have 13. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -1991,8 +1944,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2046,16 +1998,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -2063,8 +2013,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -2089,8 +2038,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2118,8 +2066,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2167,8 +2114,7 @@ expecting 12 dirty sectors; have 12. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2251,8 +2197,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2306,16 +2251,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -2323,8 +2266,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -2349,8 +2291,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2378,8 +2319,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2427,8 +2367,7 @@ expecting 15 dirty sectors; have 15. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2511,8 +2450,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2560,8 +2498,7 @@ expecting 6 dirty sectors; have 6. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2589,8 +2526,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2638,8 +2574,7 @@ expecting 14 dirty sectors; have 14. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2722,8 +2657,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2777,16 +2711,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -2794,8 +2726,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -2820,8 +2751,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2849,8 +2779,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2898,8 +2827,7 @@ expecting 12 dirty sectors; have 12. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -2982,8 +2910,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3037,16 +2964,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -3054,8 +2979,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -3080,8 +3004,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3109,8 +3032,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3158,8 +3080,7 @@ expecting 12 dirty sectors; have 12. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3242,8 +3163,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3291,8 +3211,7 @@ expecting 6 dirty sectors; have 6. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3320,8 +3239,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3369,8 +3287,7 @@ expecting 1014 dirty sectors; have 1014. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3453,8 +3370,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3508,16 +3424,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -3525,8 +3439,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -3551,8 +3464,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3580,8 +3492,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3629,8 +3540,7 @@ expecting 12 dirty sectors; have 12. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3713,8 +3623,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3768,16 +3677,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -3785,8 +3692,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -3811,8 +3717,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3840,8 +3745,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3889,8 +3793,7 @@ expecting 15 dirty sectors; have 15. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -3973,8 +3876,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4022,8 +3924,7 @@ expecting 6 dirty sectors; have 6. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4051,8 +3952,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4100,8 +4000,7 @@ expecting 14 dirty sectors; have 14. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4184,8 +4083,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4239,16 +4137,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -4256,8 +4152,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -4282,8 +4177,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4311,8 +4205,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4360,8 +4253,7 @@ expecting 12 dirty sectors; have 12. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4444,8 +4336,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4499,16 +4390,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -4516,8 +4405,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -4542,8 +4430,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4571,8 +4458,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4620,8 +4506,7 @@ expecting 12 dirty sectors; have 12. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4704,8 +4589,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4753,8 +4637,7 @@ expecting 6 dirty sectors; have 6. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4782,8 +4665,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4831,8 +4713,7 @@ expecting 14 dirty sectors; have 14. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4915,8 +4796,7 @@ write -P0x69 0x3fe0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -4970,16 +4850,14 @@ write -P0x67 0x3fe0000 0x20000
         "count": 0,
         "granularity": 65536,
         "persistent": false,
-        "recording": false,
-        "status": "disabled"
+        "recording": false
       },
       {
         "busy": false,
         "count": 458752,
         "granularity": 65536,
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       },
       {
         "busy": true,
@@ -4987,8 +4865,7 @@ write -P0x67 0x3fe0000 0x20000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "frozen"
+        "recording": true
       }
     ]
   }
@@ -5013,8 +4890,7 @@ expecting 7 dirty sectors; have 7. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -5042,8 +4918,7 @@ write -P0xdd 0x3fc0000 0x10000
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
@@ -5091,8 +4966,7 @@ expecting 12 dirty sectors; have 12. OK!
         "granularity": 65536,
         "name": "bitmap0",
         "persistent": false,
-        "recording": true,
-        "status": "active"
+        "recording": true
       }
     ]
   }
-- 
2.30.2


