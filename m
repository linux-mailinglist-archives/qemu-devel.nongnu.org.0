Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F3A33D9F2
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:58:45 +0100 (CET)
Received: from localhost ([::1]:45768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMD1o-0002Pl-Ex
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:58:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48608)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCsM-0002Mm-KN
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:49:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lMCsJ-0006PK-BL
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:48:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615913334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7avYVblgKBn57VL8mwjk9eCjz849Jo09KT48fWvXcHU=;
 b=GFAeB5dQ7Xjz05XZEt4JGVcEL4OBtn8ZAm0qzCob69a254UwwgHeIEF/1sZMqpmrKrOLoN
 YphdaexaZSCh1EeoQH1YvQwjGEMAjg3TswRJ7FC9mBLZmLHYTVzWD2unLJHp85MbPCclge
 9KhF/2ZsOdqrKbj8Lq+Jx2ZXi5MNrzE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-140-CFUwqXn8MwmD1j1klUDlcg-1; Tue, 16 Mar 2021 12:48:51 -0400
X-MC-Unique: CFUwqXn8MwmD1j1klUDlcg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89D6D18D6A2C;
 Tue, 16 Mar 2021 16:48:49 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-115-185.ams2.redhat.com
 [10.36.115.185])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 368495C1A1;
 Tue, 16 Mar 2021 16:48:28 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 10/13] block: remove 'encryption_key_missing' flag from QAPI
Date: Tue, 16 Mar 2021 16:43:52 +0000
Message-Id: <20210316164355.150519-11-berrange@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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

This has been hardcoded to "false" since 2.10.0, since secrets required
to unlock block devices are now always provided up front instead of using
interactive prompts.

Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 block/qapi.c                     |  1 -
 docs/system/deprecated.rst       | 10 -------
 docs/system/removed-features.rst | 10 +++++++
 qapi/block-core.json             |  8 ------
 tests/qemu-iotests/184.out       |  6 ++--
 tests/qemu-iotests/191.out       | 48 +++++++++++---------------------
 tests/qemu-iotests/273.out       | 15 ++++------
 7 files changed, 33 insertions(+), 65 deletions(-)

diff --git a/block/qapi.c b/block/qapi.c
index 84a0aadc09..3acc118c44 100644
--- a/block/qapi.c
+++ b/block/qapi.c
@@ -62,7 +62,6 @@ BlockDeviceInfo *bdrv_block_device_info(BlockBackend *blk,
     info->ro                     = bs->read_only;
     info->drv                    = g_strdup(bs->drv->format_name);
     info->encrypted              = bs->encrypted;
-    info->encryption_key_missing = false;
 
     info->cache = g_new(BlockdevCacheInfo, 1);
     *info->cache = (BlockdevCacheInfo) {
diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
index 9c8c62da44..5e776fb4b0 100644
--- a/docs/system/deprecated.rst
+++ b/docs/system/deprecated.rst
@@ -184,16 +184,6 @@ Use argument ``id`` instead.
 
 Use argument ``id`` instead.
 
-``query-named-block-nodes`` result ``encryption_key_missing`` (since 2.10.0)
-''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Always false.
-
-``query-block`` result ``inserted.encryption_key_missing`` (since 2.10.0)
-'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
-
-Always false.
-
 ``blockdev-add`` empty string argument ``backing`` (since 2.10.0)
 '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
 
diff --git a/docs/system/removed-features.rst b/docs/system/removed-features.rst
index 8ca51e1f7c..06d6540ad2 100644
--- a/docs/system/removed-features.rst
+++ b/docs/system/removed-features.rst
@@ -103,6 +103,16 @@ chardev client socket with ``wait`` option (removed in 6.0)
 Character devices creating sockets in client mode should not specify
 the 'wait' field, which is only applicable to sockets in server mode
 
+``query-named-block-nodes`` result ``encryption_key_missing`` (removed in 6.0)
+''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Removed with no replacement.
+
+``query-block`` result ``inserted.encryption_key_missing`` (removed in 6.0)
+'''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
+
+Removed with no replacement.
+
 Human Monitor Protocol (HMP) commands
 -------------------------------------
 
diff --git a/qapi/block-core.json b/qapi/block-core.json
index 9f555d5c1d..d256b7b776 100644
--- a/qapi/block-core.json
+++ b/qapi/block-core.json
@@ -319,8 +319,6 @@
 #
 # @encrypted: true if the backing device is encrypted
 #
-# @encryption_key_missing: always false
-#
 # @detect_zeroes: detect and optimize zero writes (Since 2.1)
 #
 # @bps: total throughput limit in bytes per second is specified
@@ -385,10 +383,6 @@
 # @dirty-bitmaps: dirty bitmaps information (only present if node
 #                 has one or more dirty bitmaps) (Since 4.2)
 #
-# Features:
-# @deprecated: Member @encryption_key_missing is deprecated.  It is
-#              always false.
-#
 # Since: 0.14
 #
 ##
@@ -396,8 +390,6 @@
   'data': { 'file': 'str', '*node-name': 'str', 'ro': 'bool', 'drv': 'str',
             '*backing_file': 'str', 'backing_file_depth': 'int',
             'encrypted': 'bool',
-            'encryption_key_missing': { 'type': 'bool',
-                                        'features': [ 'deprecated' ] },
             'detect_zeroes': 'BlockdevDetectZeroesOptions',
             'bps': 'int', 'bps_rd': 'int', 'bps_wr': 'int',
             'iops': 'int', 'iops_rd': 'int', 'iops_wr': 'int',
diff --git a/tests/qemu-iotests/184.out b/tests/qemu-iotests/184.out
index 87c73070e3..77e5489d65 100644
--- a/tests/qemu-iotests/184.out
+++ b/tests/qemu-iotests/184.out
@@ -54,8 +54,7 @@ Testing:
                 "direct": false,
                 "writeback": true
             },
-            "file": "json:{\"throttle-group\": \"group0\", \"driver\": \"throttle\", \"file\": {\"driver\": \"null-co\"}}",
-            "encryption_key_missing": false
+            "file": "json:{\"throttle-group\": \"group0\", \"driver\": \"throttle\", \"file\": {\"driver\": \"null-co\"}}"
         },
         {
             "iops_rd": 0,
@@ -82,8 +81,7 @@ Testing:
                 "direct": false,
                 "writeback": true
             },
-            "file": "null-co://",
-            "encryption_key_missing": false
+            "file": "null-co://"
         }
     ]
 }
diff --git a/tests/qemu-iotests/191.out b/tests/qemu-iotests/191.out
index 022021efab..ea88777374 100644
--- a/tests/qemu-iotests/191.out
+++ b/tests/qemu-iotests/191.out
@@ -150,8 +150,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.ovl2",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.ovl2"
         },
         {
             "iops_rd": 0,
@@ -179,8 +178,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.ovl2",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.ovl2"
         },
         {
             "iops_rd": 0,
@@ -221,8 +219,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT"
         },
         {
             "iops_rd": 0,
@@ -250,8 +247,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT"
         },
         {
             "iops_rd": 0,
@@ -292,8 +288,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.mid",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.mid"
         },
         {
             "iops_rd": 0,
@@ -321,8 +316,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.mid",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.mid"
         },
         {
             "iops_rd": 0,
@@ -351,8 +345,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.base",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.base"
         },
         {
             "iops_rd": 0,
@@ -380,8 +373,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.base",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.base"
         }
     ]
 }
@@ -565,8 +557,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.ovl2",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.ovl2"
         },
         {
             "iops_rd": 0,
@@ -594,8 +585,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.ovl2",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.ovl2"
         },
         {
             "iops_rd": 0,
@@ -647,8 +637,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.ovl3",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.ovl3"
         },
         {
             "iops_rd": 0,
@@ -676,8 +665,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.ovl3",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.ovl3"
         },
         {
             "iops_rd": 0,
@@ -706,8 +694,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.base",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.base"
         },
         {
             "iops_rd": 0,
@@ -735,8 +722,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.base",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.base"
         },
         {
             "iops_rd": 0,
@@ -777,8 +763,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT"
         },
         {
             "iops_rd": 0,
@@ -806,8 +791,7 @@ wrote 65536/65536 bytes at offset 1048576
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT"
         }
     ]
 }
diff --git a/tests/qemu-iotests/273.out b/tests/qemu-iotests/273.out
index 8247cbaea1..4e840b6730 100644
--- a/tests/qemu-iotests/273.out
+++ b/tests/qemu-iotests/273.out
@@ -69,8 +69,7 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT"
         },
         {
             "iops_rd": 0,
@@ -98,8 +97,7 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT"
         },
         {
             "iops_rd": 0,
@@ -139,8 +137,7 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.mid",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.mid"
         },
         {
             "iops_rd": 0,
@@ -168,8 +165,7 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.mid",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.mid"
         },
         {
             "iops_rd": 0,
@@ -197,8 +193,7 @@ Testing: -blockdev file,node-name=base,filename=TEST_DIR/t.IMGFMT.base -blockdev
                 "direct": false,
                 "writeback": true
             },
-            "file": "TEST_DIR/t.IMGFMT.base",
-            "encryption_key_missing": false
+            "file": "TEST_DIR/t.IMGFMT.base"
         }
     ]
 }
-- 
2.30.2


