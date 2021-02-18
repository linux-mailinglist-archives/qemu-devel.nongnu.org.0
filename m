Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5B931F0E3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 21:19:58 +0100 (CET)
Received: from localhost ([::1]:47694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCpmH-0007IW-Jr
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 15:19:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpi7-00058A-CL
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:15:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lCpi3-0000Bt-4N
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 15:15:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613679334;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2PgYbSCTOsTLlBB4//5cUx+3IxOfNqMe3enY2o2akKc=;
 b=IoSgwlfy3Gl/xUdWm8HUc6W0wq4xOWsGkCTOyS7REUKlCNt1oE2P/gWph8Vx9guE+4cLRY
 29+s9NoiW9zD9+pLMHWKSYLsdH6oTpU2PBPxR4/0iJlD0JREcUhZJh+YmBDVA8uBffIHic
 5GjiMG7REasBwaQt3bGrKgpcIh/NINs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-204-TLaXAl0QPRSSKNS04OF4RQ-1; Thu, 18 Feb 2021 15:15:32 -0500
X-MC-Unique: TLaXAl0QPRSSKNS04OF4RQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C1541020C20;
 Thu, 18 Feb 2021 20:15:31 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-156.phx2.redhat.com [10.3.113.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A45FB5B4B2;
 Thu, 18 Feb 2021 20:15:30 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] iotests: Update 241 to expose backing layer fragmentation
Date: Thu, 18 Feb 2021 14:15:24 -0600
Message-Id: <20210218201528.127099-2-eblake@redhat.com>
In-Reply-To: <20210218201528.127099-1-eblake@redhat.com>
References: <20210218201528.127099-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Previous commits (such as 6e280648, 75d34eb9) have mentioned that our
NBD server still sends unaligned fragments when an active layer with
large advertised minimum block size is backed by another layer with a
smaller block size. Expand the test to actually cover these scenario,
by using two different approaches: qcow2 encryption (which forces
512-byte alignment) with an unaligned raw backing file, and blkdebug
with a 4k alignment.

The encryption test passes with the desired results, but only because
the client side works around the server's non-compliance; if you
repeat the test manually with tracing turned on, you will see the
server sending a status for 1000 bytes of data then 1048 bytes of
hole, which is not aligned. But reverting commit 737d3f5244 shows that
it is indeed the client working around the bug in the server.

Meanwhile, the blkdebug test gives incorrect results: remember, when
using x-dirty-bitmap with qemu-img map as a way to sniff alternative
metadata contexts, the meanings of "data" and "zero" are determined by
that context.  Our client workaround is assuming that the fragmented
replies can be merged according to base:allocation rules, but those
rules do not work for other contexts (merging dirty and clean bitmap
should produce dirty; merging allocated and unallocated should produce
allocated; see the FIXME for more about the decoded values we expect).

Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/241     | 60 ++++++++++++++++++++++++++++++++++----
 tests/qemu-iotests/241.out | 21 +++++++++++++
 2 files changed, 76 insertions(+), 5 deletions(-)

diff --git a/tests/qemu-iotests/241 b/tests/qemu-iotests/241
index c962c8b6075d..5217af82dc65 100755
--- a/tests/qemu-iotests/241
+++ b/tests/qemu-iotests/241
@@ -3,7 +3,7 @@
 #
 # Test qemu-nbd vs. unaligned images
 #
-# Copyright (C) 2018-2019 Red Hat, Inc.
+# Copyright (C) 2018-2021 Red Hat, Inc.
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
@@ -27,7 +27,7 @@ status=1 # failure is the default!
 _cleanup()
 {
     _cleanup_test_img
-    rm -f "$TEST_DIR/server.log"
+    rm -f "$TEST_DIR/server.log" "$TEST_IMG_FILE.mid" "$TEST_IMG_FILE.qcow2"
     nbd_server_stop
 }
 trap "_cleanup; exit \$status" 0 1 2 3 15
@@ -37,7 +37,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 . ./common.filter
 . ./common.nbd

-_supported_fmt raw
+_supported_fmt raw # although the test also requires use of qcow2
 _supported_proto nbd
 _supported_os Linux
 _require_command QEMU_NBD
@@ -89,11 +89,61 @@ $QEMU_IMG map --output=json "$TEST_IMG" | _filter_qemu_img_map
 $QEMU_IO -c map "$TEST_IMG"
 nbd_server_stop

-# Not tested yet: we also want to ensure that qemu as NBD client does
+echo
+echo "=== Encrypted qcow2 file backed by unaligned raw image ==="
+echo
+
+# Enabling encryption in qcow2 forces 512-alignment
+SECRET=secret,id=sec0,data=12345
+$QEMU_IMG create -f qcow2 -b "$TEST_IMG_FILE" -F raw --object "$SECRET" \
+  -o encrypt.format=luks,encrypt.key-secret=sec0,encrypt.iter-time=10 \
+  "$TEST_IMG_FILE.qcow2" 2k | _filter_img_create
+nbd_server_start_unix_socket --object "$SECRET" --image-opts \
+  driver=qcow2,file.filename="$TEST_IMG_FILE.qcow2",encrypt.key-secret=sec0
+
+$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
+$QEMU_IMG map --output=json "$TEST_IMG" | _filter_qemu_img_map
+$QEMU_IO -c map "$TEST_IMG"
+nbd_server_stop
+
+echo
+echo "=== Use blkdebug for larger alignment than backing layer ==="
+echo
+
+$QEMU_IMG create -f qcow2 -o cluster_size=1024 \
+  "$TEST_IMG_FILE" 2k | _filter_img_create
+$QEMU_IMG create -f qcow2 -b "$TEST_IMG_FILE" -F qcow2 -o cluster_size=512 \
+  "$TEST_IMG_FILE.mid" | _filter_img_create
+$QEMU_IMG bitmap --add -g 512 --enable "$TEST_IMG_FILE.mid" b0
+$QEMU_IO -f qcow2 -c 'w 512 512' "$TEST_IMG_FILE.mid" | _filter_qemu_io
+$QEMU_IMG create -f qcow2 -b "$TEST_IMG_FILE.mid" -F qcow2 \
+  "$TEST_IMG_FILE.qcow2" 4k | _filter_img_create
+FILE=image.file.filename="$TEST_IMG_FILE.qcow2"
+nbd_server_start_unix_socket -B b0 -A --image-opts \
+  driver=blkdebug,align=4096,image.driver=qcow2,image.file.driver=file,"$FILE"
+
+TEST_IMG="driver=nbd,server.type=unix,server.path=$nbd_unix_socket"
+$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
+# FIXME: this should report a single 4k block of "data":false which translates
+# to the dirty bitmap being set for at least part of the region; "data":true
+# is wrong unless the entire 4k is clean.
+$QEMU_IMG map --output=json --image-opts \
+	  "$TEST_IMG",x-dirty-bitmap=qemu:dirty-bitmap:b0 | _filter_qemu_img_map
+
+# FIXME: this should report a single 4k block of "zero":true,"data":true,
+# meaning allocated from the backing chain.  Using "zero":false,"data":false
+# (allocated in active layer) or "zero":false,"data":true (entire region
+# unallocated) is wrong.
+$QEMU_IMG map --output=json --image-opts \
+  "$TEST_IMG",x-dirty-bitmap=qemu:allocation-depth | _filter_qemu_img_map
+nbd_server_stop
+
+# Not tested here: we also want to ensure that qemu as NBD client does
 # not access beyond the end of a server's advertised unaligned size:
 #  nbdkit -U - memory size=513 --run 'qemu-io -f raw -c "r 512 512" $nbd'
 # However, since qemu as server always rounds up to a sector alignment,
-# we would have to use nbdkit to provoke the current client failures.
+# we would have to use nbdkit to demonstrate this scenario (see
+# commit 9cf638508c for more information).

 # success, all done
 echo '*** done'
diff --git a/tests/qemu-iotests/241.out b/tests/qemu-iotests/241.out
index 75f9f465e522..67aaeed34f50 100644
--- a/tests/qemu-iotests/241.out
+++ b/tests/qemu-iotests/241.out
@@ -25,4 +25,25 @@ WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed
 [{ "start": 0, "length": 1000, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 1000, "length": 24, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
 1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)
+
+=== Encrypted qcow2 file backed by unaligned raw image ===
+
+Formatting 'TEST_DIR/t.IMGFMT.qcow2', fmt=qcow2 size=2048 backing_file=TEST_DIR/t.IMGFMT backing_fmt=IMGFMT
+  size:  2048
+  min block: 512
+[{ "start": 0, "length": 1024, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
+{ "start": 1024, "length": 1024, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
+2 KiB (0x800) bytes     allocated at offset 0 bytes (0x0)
+
+=== Use blkdebug for larger alignment than backing layer ===
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=qcow2 size=2048
+Formatting 'TEST_DIR/t.IMGFMT.mid', fmt=qcow2 size=2048 backing_file=TEST_DIR/t.IMGFMT backing_fmt=qcow2
+wrote 512/512 bytes at offset 512
+512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Formatting 'TEST_DIR/t.IMGFMT.qcow2', fmt=qcow2 size=4096 backing_file=TEST_DIR/t.IMGFMT.mid backing_fmt=qcow2
+  size:  4096
+  min block: 4096
+[{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
+[{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET}]
 *** done
-- 
2.30.1


