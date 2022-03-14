Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6D54D91D7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Mar 2022 01:57:36 +0100 (CET)
Received: from localhost ([::1]:47410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTvVH-0007M0-Ku
	for lists+qemu-devel@lfdr.de; Mon, 14 Mar 2022 20:57:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nTsJ5-0007xC-IO; Mon, 14 Mar 2022 17:32:47 -0400
Received: from smtp17.mail.ru ([94.100.176.154]:45436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nTsJ1-00066H-Vn; Mon, 14 Mar 2022 17:32:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=kfAPurf6Z0xHxxnKh4su7FgWWCOyWJsMbE/qiHynMnw=; 
 t=1647293564;x=1647898964; 
 b=ei/bmgiQ+yV+Zf+Z+HK+ufkN69pR5t9EG4t1Tjo/OgRJDYmaWYz2qn95SA8yBTHRSdR1b9lrgKSiS3ys8R9gdrNggWXwWI4IMmLmcimcbWRFDUndBZdzdh/f/bI+z3HmLFLTfd2L7Qjl4dW5QawJQTXILN6O74zI+Az+Fb/rtwZiwZ2b+okd6CQJ+wZrQgdubmBNi1Cg7DATMS/mZ5MfnaXVVK/d/qUDwei0LziHo+a0Juhe9TpOF8IRpW6IlEs01UYGDl0vcRMHFgV0msmvQlt8z+7vum/WMvuA6kiRwvBMRGn7h9lzLsG/1Fec24iG5ceUYPNl5j8lCroKM6lh6w==;
Received: by smtp17.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nTsIy-0004pZ-4c; Tue, 15 Mar 2022 00:32:40 +0300
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, armbru@redhat.com, hreitz@redhat.com,
 kwolf@redhat.com, jsnow@redhat.com, v.sementsov-og@ya.ru,
 v.sementsov-og@mail.ru, eblake@redhat.com, yuriy.vasiliev@virtuozzo.com
Subject: [PATCH v2 3/3] iotests/223: check new possibility of exporting
 bitmaps by node/name
Date: Tue, 15 Mar 2022 00:32:26 +0300
Message-Id: <20220314213226.362217-4-v.sementsov-og@mail.ru>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220314213226.362217-1-v.sementsov-og@mail.ru>
References: <20220314213226.362217-1-v.sementsov-og@mail.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp17.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD95983D7D89D92196DAEE08C8B4332C69BD3B54C3E627D4433182A05F53808504039975E164BA3911D1B8A64D5D85DAB355CC9DC0577DE93A53847A4440D360A94
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE72AC9FB60380F23AEEA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063770398A047C76876C8638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8CBE701DCB8D94BC2275EAC8EAF6C4CD96F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE70F3DDF2BBF19B93A9FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD18C26CFBAC0749D213D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BAA867293B0326636D2E47CDBA5A96583BA9C0B312567BB2376E601842F6C81A19E625A9149C048EE599709FD55CB46A6846F39228950D27DD8FC6C240DEA7642DBF02ECDB25306B2B78CF848AE20165D0A6AB1C7CE11FEE3D2AC72D04CD5349BAD7EC71F1DB88427C4224003CC836476EA7A3FFF5B025636E2021AF6380DFAD1A18204E546F3947CB11811A4A51E3B096D1867E19FE1407959CC434672EE6371089D37D7C0E48F6C8AA50765F7900637C8EA4C46B761A5D4EFF80C71ABB335746BA297DBC24807EABDAD6C7F3747799A
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: C20DE7B7AB408E4181F030C43753B8186998911F362727C414F749A5E30D975CD97CDA27012969F645B71CE8512A074C56449612DA770D6D9C2B6934AE262D3EE7EAB7254005DCED7532B743992DF240BDC6A1CF3F042BAD6DF99611D93F60EFCE66FDB1904541E0699F904B3F4130E343918A1A30D5E7FCCB5012B2E24CD356
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D344F2126FF337FA651881701AA0027D1AA73E7B229221953A9D618433D333E8C35EFF4B24E4156EC8F1D7E09C32AA3244CF7FEAC316F810B1170FA6AA316826047A8CE788DE6831205ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojqbhzdNy/MvgiPWfLi/cXkQ==
X-Mailru-Sender: 6C3E74F07C41AE94C4973423E83F3A159D968AF17CAB685042E9924A61E8A50FA419A7BE50F8661CE6462B2528CDCABCB7EB570DD03A1E57B847871DB86736497E5CFB87F3DDD4B722B820C1B2086D890DA7A0AF5A3A8387
X-Mras: Ok
Received-SPF: pass client-ip=94.100.176.154;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp17.mail.ru
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Mar 2022 20:52:36 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>

Add simple test that new interface introduced in previous commit works.

Signed-off-by: Vladimir Sementsov-Ogievskiy <v.sementsov-og@ya.ru>
---
 tests/qemu-iotests/223     | 16 +++++++++++++
 tests/qemu-iotests/223.out | 47 ++++++++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/223 b/tests/qemu-iotests/223
index da87f2f4a2..0bbb283010 100755
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
index e58ea5abbd..0647941531 100644
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


