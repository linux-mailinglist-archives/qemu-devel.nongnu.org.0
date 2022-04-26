Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F5F4510A64
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 22:26:05 +0200 (CEST)
Received: from localhost ([::1]:40914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njRl6-000273-BI
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 16:26:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRar-0008KL-3j
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1njRan-0007g2-5e
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 16:15:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651004124;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lrZuG4BACZaT1jIkxBzpTpfXmT38CDbucT7Tn5Cke2Y=;
 b=JGOf0KhvaOcs6fno0JUe57+H1UIEN6Z0ZEOufeoONTzEaIqdR+EifzeiXhnfMjEOXCvDlH
 YHLVCwK3ov3PJDp0ToQL9lsUvTtkJumi/d96b84+oqRLaRXGplndtdQwI1F6/LAjXeOi/l
 pfFPZa7blYBPgNDdh3BMG4TxOsV2NA4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-518-1FcoW6FpO6el6_HKcnFcOA-1; Tue, 26 Apr 2022 16:15:21 -0400
X-MC-Unique: 1FcoW6FpO6el6_HKcnFcOA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DAA43C02B6F;
 Tue, 26 Apr 2022 20:15:20 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27AC7556206;
 Tue, 26 Apr 2022 20:15:20 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/13] iotests/223: check new possibility of exporting bitmaps
 by node/name
Date: Tue, 26 Apr 2022 15:15:04 -0500
Message-Id: <20220426201514.170410-4-eblake@redhat.com>
In-Reply-To: <20220426201514.170410-1-eblake@redhat.com>
References: <20220426201514.170410-1-eblake@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>

Add simple test that new interface introduced in previous commit works.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
Message-Id: <20220314213226.362217-4-v.sementsov-og@mail.ru>
[eblake: Adjust S-o-b to Vladimir's new email, with permission]
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/223     | 16 +++++++++++++
 tests/qemu-iotests/223.out | 47 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/223 b/tests/qemu-iotests/223
index da87f2f4a233..0bbb28301076 100755
--- a/tests/qemu-iotests/223
+++ b/tests/qemu-iotests/223
@@ -120,6 +120,11 @@ _send_qemu_cmd $QEMU_HANDLE '{"execute":"blockdev-add",
     "file":{"driver":"file", "filename":"'"$TEST_IMG"'"}}}' "return"
 _send_qemu_cmd $QEMU_HANDLE '{"execute":"block-dirty-bitmap-disable",
   "arguments":{"node":"n", "name":"b"}}' "return"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"blockdev-add",
+  "arguments":{"driver":"null-co", "node-name":"null",
+    "size": 4194304}}' "return"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-dirty-bitmap-add",
+  "arguments":{"node":"null", "name":"b3"}}' "return"

 for attempt in normal iothread; do

@@ -155,6 +160,9 @@ _send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-add",
 _send_qemu_cmd $QEMU_HANDLE '{"execute":"nbd-server-add",
   "arguments":{"device":"n", "name":"n2", "writable":true,
   "description":"some text", "bitmap":"b2"}}' "return"
+_send_qemu_cmd $QEMU_HANDLE '{"execute":"block-export-add",
+  "arguments":{"type": "nbd", "node-name":"n", "id":"n3", "name": "n3",
+  "bitmaps":[{"node":"null","name":"b3"}]}}' "return"
 $QEMU_NBD_PROG -L -k "$SOCK_DIR/nbd"

 echo
@@ -178,6 +186,14 @@ IMG="driver=nbd,export=n2,server.type=unix,server.path=$SOCK_DIR/nbd"
 $QEMU_IMG map --output=json --image-opts \
   "$IMG,x-dirty-bitmap=qemu:dirty-bitmap:b2" | _filter_qemu_img_map

+echo
+echo "=== Check bitmap taken from another node ==="
+echo
+
+IMG="driver=nbd,export=n3,server.type=unix,server.path=$SOCK_DIR/nbd"
+$QEMU_IMG map --output=json --image-opts \
+  "$IMG,x-dirty-bitmap=qemu:dirty-bitmap:b3" | _filter_qemu_img_map
+
 echo
 echo "=== End qemu NBD server ==="
 echo
diff --git a/tests/qemu-iotests/223.out b/tests/qemu-iotests/223.out
index e58ea5abbd5a..06479415312b 100644
--- a/tests/qemu-iotests/223.out
+++ b/tests/qemu-iotests/223.out
@@ -33,6 +33,13 @@ wrote 2097152/2097152 bytes at offset 2097152
 {"execute":"block-dirty-bitmap-disable",
   "arguments":{"node":"n", "name":"b"}}
 {"return": {}}
+{"execute":"blockdev-add",
+  "arguments":{"driver":"null-co", "node-name":"null",
+    "size": 4194304}}
+{"return": {}}
+{"execute":"block-dirty-bitmap-add",
+  "arguments":{"node":"null", "name":"b3"}}
+{"return": {}}

 === Set up NBD with normal access ===

@@ -69,7 +76,11 @@ exports available: 0
   "arguments":{"device":"n", "name":"n2", "writable":true,
   "description":"some text", "bitmap":"b2"}}
 {"return": {}}
-exports available: 2
+{"execute":"block-export-add",
+  "arguments":{"type": "nbd", "node-name":"n", "id":"n3", "name": "n3",
+  "bitmaps":[{"node":"null","name":"b3"}]}}
+{"return": {}}
+exports available: 3
  export: 'n'
   size:  4194304
   flags: 0x58f ( readonly flush fua df multi cache )
@@ -89,6 +100,15 @@ exports available: 2
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b2
+ export: 'n3'
+  size:  4194304
+  flags: 0x58f ( readonly flush fua df multi cache )
+  min block: 1
+  opt block: 4096
+  max block: 33554432
+  available meta contexts: 2
+   base:allocation
+   qemu:dirty-bitmap:b3

 === Contrast normal status to large granularity dirty-bitmap ===

@@ -114,6 +134,10 @@ read 2097152/2097152 bytes at offset 2097152
 { "start": 1024, "length": 2096128, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
 { "start": 2097152, "length": 2097152, "depth": 0, "present": false, "zero": false, "data": false}]

+=== Check bitmap taken from another node ===
+
+[{ "start": 0, "length": 4194304, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET}]
+
 === End qemu NBD server ===

 {"execute":"nbd-server-remove",
@@ -128,6 +152,7 @@ read 2097152/2097152 bytes at offset 2097152
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "n2"}}
 {"error": {"class": "GenericError", "desc": "Export 'n2' is not found"}}
 {"execute":"nbd-server-stop"}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "n3"}}
 {"return": {}}
 {"execute":"nbd-server-stop"}
 {"error": {"class": "GenericError", "desc": "NBD server not running"}}
@@ -170,7 +195,11 @@ exports available: 0
   "arguments":{"device":"n", "name":"n2", "writable":true,
   "description":"some text", "bitmap":"b2"}}
 {"return": {}}
-exports available: 2
+{"execute":"block-export-add",
+  "arguments":{"type": "nbd", "node-name":"n", "id":"n3", "name": "n3",
+  "bitmaps":[{"node":"null","name":"b3"}]}}
+{"return": {}}
+exports available: 3
  export: 'n'
   size:  4194304
   flags: 0x58f ( readonly flush fua df multi cache )
@@ -190,6 +219,15 @@ exports available: 2
   available meta contexts: 2
    base:allocation
    qemu:dirty-bitmap:b2
+ export: 'n3'
+  size:  4194304
+  flags: 0x58f ( readonly flush fua df multi cache )
+  min block: 1
+  opt block: 4096
+  max block: 33554432
+  available meta contexts: 2
+   base:allocation
+   qemu:dirty-bitmap:b3

 === Contrast normal status to large granularity dirty-bitmap ===

@@ -215,6 +253,10 @@ read 2097152/2097152 bytes at offset 2097152
 { "start": 1024, "length": 2096128, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
 { "start": 2097152, "length": 2097152, "depth": 0, "present": false, "zero": false, "data": false}]

+=== Check bitmap taken from another node ===
+
+[{ "start": 0, "length": 4194304, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET}]
+
 === End qemu NBD server ===

 {"execute":"nbd-server-remove",
@@ -229,6 +271,7 @@ read 2097152/2097152 bytes at offset 2097152
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "n2"}}
 {"error": {"class": "GenericError", "desc": "Export 'n2' is not found"}}
 {"execute":"nbd-server-stop"}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "BLOCK_EXPORT_DELETED", "data": {"id": "n3"}}
 {"return": {}}
 {"execute":"nbd-server-stop"}
 {"error": {"class": "GenericError", "desc": "NBD server not running"}}
-- 
2.35.1


