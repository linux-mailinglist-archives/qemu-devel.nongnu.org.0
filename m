Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0ECC34023A
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 10:38:51 +0100 (CET)
Received: from localhost ([::1]:37710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMp7C-00007h-Ok
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 05:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMozu-0007cR-8a
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49470)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMozr-0003Nu-4g
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 05:31:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616059874;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tZjK5InZ3EXD0maVDHC9kQTXNLmEi/MZBQqAomULPJc=;
 b=C7KYWJ6lAKJoeXsIlrb5j36qE83mTKWTMey6TvhP6+XUfwRG/Di0P2QMv+0RKGfW1ufaxV
 YvEfXsmdJRm2MY7+AuB2wOOYo+k16CR2d+XOrBBvN/rBQVhBvgQoRrle0jWBIcWIPpoYXa
 +KOtwryfpom/VsB0pTA9K5pJgxFDKnM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-112-5HCe5s9GPfGDx31XzAhl-A-1; Thu, 18 Mar 2021 05:31:13 -0400
X-MC-Unique: 5HCe5s9GPfGDx31XzAhl-A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4E6B987A83F;
 Thu, 18 Mar 2021 09:31:11 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-61.ams2.redhat.com
 [10.36.115.61])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1E46862951;
 Thu, 18 Mar 2021 09:30:48 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/13] block: remove 'dirty-bitmaps' field from 'BlockInfo'
 struct
Date: Thu, 18 Mar 2021 09:25:11 +0000
Message-Id: <20210318092512.250725-13-berrange@redhat.com>
In-Reply-To: <20210318092512.250725-1-berrange@redhat.com>
References: <20210318092512.250725-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

The same data is available in the 'BlockDeviceInfo' struct.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/qapi.c                                        |  5 -----
 docs/system/deprecated.rst                          | 13 -------------
 docs/system/removed-features.rst                    |  9 +++++++++
 qapi/block-core.json                                | 11 +----------
 tests/qemu-iotests/194                              |  4 ++--
 tests/qemu-iotests/236                              |  2 +-
 tests/qemu-iotests/246                              |  3 ++-
 tests/qemu-iotests/254                              |  2 +-
 tests/qemu-iotests/260                              |  5 +++--
 .../tests/migrate-bitmaps-postcopy-test             |  6 ++++--
 10 files changed, 23 insertions(+), 37 deletions(-)

diff --git a/block/qapi.c b/block/qapi.c
index 3acc118c44..943e7b15ad 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -383,11 +383,6 @@ static void bdrv_query_info(BlockBackend *blk, BlockInfo **p_info,
         info->io_status = blk_iostatus(blk);
     }
 
-    if (bs && !QLIST_EMPTY(&bs->dirty_bitmaps)) {
-        info->has_dirty_bitmaps = true;
-        info->dirty_bitmaps = bdrv_query_dirty_bitmaps(bs);
-    }
-
     if (bs && bs->drv) {
         info->has_inserted = true;
         info->inserted = bdrv_block_device_info(blk, bs, false, errp);
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index eadba0f288..c7e80fa731 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -198,19 +198,6 @@ Use arguments ``base-node`` and ``top-node`` instead.
 
 Specify the properties for the object as top-level arguments instead.
 
-``query-block`` result field ``dirty-bitmaps`` (Since 4.2)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-The ``dirty-bitmaps`` field of the ``BlockInfo`` structure, returned by
-the query-block command is itself now deprecated. The ``dirty-bitmaps``
-field of the ``BlockDeviceInfo`` struct should be used instead, which is the
-type of the ``inserted`` field in query-block replies, as well as the
-type of array items in query-named-block-nodes.
-
-Since the ``dirty-bitmaps`` field is optionally present in both the old and
-new locations, clients must use introspection to learn where to anticipate
-the field if/when it does appear in command output.
-
 ``nbd-server-add`` and ``nbd-server-remove`` (since 5.2)
 ''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 47fdfe6f72..d164d3f290 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -127,6 +127,15 @@ The ``status`` field of the ``BlockDirtyInfo`` structure, returned by
 these commands is removed. Two new boolean fields, ``recording`` and
 ``busy`` effectively replace it.
 
+``query-block`` result field ``dirty-bitmaps`` (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+The ``dirty-bitmaps`` field of the ``BlockInfo`` structure, returned by
+the query-block command is itself now removed. The ``dirty-bitmaps``
+field of the ``BlockDeviceInfo`` struct should be used instead, which is the
+type of the ``inserted`` field in query-block replies, as well as the
+type of array items in query-named-block-nodes.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 2a0c345c2c..0399449e13 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -539,9 +539,6 @@
 # @tray_open: True if the device's tray is open
 #             (only present if it has a tray)
 #
-# @dirty-bitmaps: dirty bitmaps information (only present if the
-#                 driver has one or more dirty bitmaps) (Since 2.0)
-#
 # @io-status: @BlockDeviceIoStatus. Only present if the device
 #             supports it and the VM is configured to stop on errors
 #             (supported device models: virtio-blk, IDE, SCSI except
@@ -550,18 +547,12 @@
 # @inserted: @BlockDeviceInfo describing the device if media is
 #            present
 #
-# Features:
-# @deprecated: Member @dirty-bitmaps is deprecated.  Use @inserted
-#              member @dirty-bitmaps instead.
-#
 # Since:  0.14
 ##
 { 'struct': 'BlockInfo',
   'data': {'device': 'str', '*qdev': 'str', 'type': 'str', 'removable': 'bool',
            'locked': 'bool', '*inserted': 'BlockDeviceInfo',
-           '*tray_open': 'bool', '*io-status': 'BlockDeviceIoStatus',
-           '*dirty-bitmaps': { 'type': ['BlockDirtyInfo'],
-                               'features': [ 'deprecated' ] } } }
+           '*tray_open': 'bool', '*io-status': 'BlockDeviceIoStatus' } }
 
 ##
 # @BlockMeasureInfo:
diff --git a/tests/qemu-iotests/194 b/tests/qemu-iotests/194
index 3889266afa..e44b8df728 100755
--- a/tests/qemu-iotests/194
+++ b/tests/qemu-iotests/194
@@ -95,7 +95,7 @@ with iotests.FilePath('source.img') as source_img_path, \
     iotests.log(event, filters=[iotests.filter_qmp_event])
 
     iotests.log('Check bitmaps on source:')
-    iotests.log(source_vm.qmp('query-block')['return'][0]['dirty-bitmaps'])
+    iotests.log(source_vm.qmp('query-block')['return'][0]['inserted']['dirty-bitmaps'])
 
     iotests.log('Check bitmaps on target:')
-    iotests.log(dest_vm.qmp('query-block')['return'][0]['dirty-bitmaps'])
+    iotests.log(dest_vm.qmp('query-block')['return'][0]['inserted']['dirty-bitmaps'])
diff --git a/tests/qemu-iotests/236 b/tests/qemu-iotests/236
index f6c44517d6..20419bbb9e 100755
--- a/tests/qemu-iotests/236
+++ b/tests/qemu-iotests/236
@@ -39,7 +39,7 @@ overwrite = [("0xab", "0",         "64k"), # Full overwrite
 
 def query_bitmaps(vm):
     res = vm.qmp("query-block")
-    return { "bitmaps": { device['device']: device.get('dirty-bitmaps', []) for
+    return { "bitmaps": { device['device']: device.get('inserted', {}).get('dirty-bitmaps', []) for
                           device in res['return'] } }
 
 with iotests.FilePath('img') as img_path, \
diff --git a/tests/qemu-iotests/246 b/tests/qemu-iotests/246
index fa3102c546..5932a0e8a9 100755
--- a/tests/qemu-iotests/246
+++ b/tests/qemu-iotests/246
@@ -30,7 +30,8 @@ gran_large = 128 * 1024
 
 def query_bitmaps(vm):
     res = vm.qmp("query-block")
-    return { "bitmaps": { device['device']: device.get('dirty-bitmaps', []) for
+    return { "bitmaps": { device['device']: device.get('inserted', {})
+                          .get('dirty-bitmaps', []) for
                           device in res['return'] } }
 
 with iotests.FilePath('img') as img_path, \
diff --git a/tests/qemu-iotests/254 b/tests/qemu-iotests/254
index 49da948407..108bf5f894 100755
--- a/tests/qemu-iotests/254
+++ b/tests/qemu-iotests/254
@@ -73,7 +73,7 @@ vm.qmp_log('transaction', indent=2, actions=[
 result = vm.qmp('query-block')['return'][0]
 log("query-block: device = {}, node-name = {}, dirty-bitmaps:".format(
     result['device'], result['inserted']['node-name']))
-log(result['dirty-bitmaps'], indent=2)
+log(result['inserted']['dirty-bitmaps'], indent=2)
 log("\nbitmaps in backing image:")
 log(result['inserted']['image']['backing-image']['format-specific'] \
     ['data']['bitmaps'], indent=2)
diff --git a/tests/qemu-iotests/260 b/tests/qemu-iotests/260
index a35cb7b61f..2ec64a9b99 100755
--- a/tests/qemu-iotests/260
+++ b/tests/qemu-iotests/260
@@ -32,8 +32,9 @@ size = 64 * 1024 * 3
 
 def print_bitmap(msg, vm):
     result = vm.qmp('query-block')['return'][0]
-    if 'dirty-bitmaps' in result:
-        bitmap = result['dirty-bitmaps'][0]
+    info = result.get("inserted", {})
+    if 'dirty-bitmaps' in info:
+        bitmap = info['dirty-bitmaps'][0]
         log('{}: name={} dirty-clusters={}'.format(msg, bitmap['name'],
             bitmap['count'] // 64 // 1024))
     else:
diff --git a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
index dbf10e58d3..d046ebeb94 100755
--- a/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
+++ b/tests/qemu-iotests/tests/migrate-bitmaps-postcopy-test
@@ -67,10 +67,12 @@ def event_dist(e1, e2):
 def check_bitmaps(vm, count):
     result = vm.qmp('query-block')
 
+    info = result['return'][0].get('inserted', {})
+
     if count == 0:
-        assert 'dirty-bitmaps' not in result['return'][0]
+        assert 'dirty-bitmaps' not in info
     else:
-        assert len(result['return'][0]['dirty-bitmaps']) == count
+        assert len(info['dirty-bitmaps']) == count
 
 
 class TestDirtyBitmapPostcopyMigration(iotests.QMPTestCase):
-- 
2.30.2


