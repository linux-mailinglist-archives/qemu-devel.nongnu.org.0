Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE3E8574F6F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 15:41:17 +0200 (CEST)
Received: from localhost ([::1]:40290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBz5h-0001YV-00
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 09:41:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47604)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oByt7-0006Xk-Co
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:28:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1oByt5-0002Ba-2j
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 09:28:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657805294;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DmjEeHwaCQ2353LqfByqBwE9orihxYTBgt9bplA4baI=;
 b=WBzhsqM2NOLS43gtDAjSuQkm9eS3cXV5oCEp/Ld/quYt+IZNz3JDDgEnr9DmHsdxWPNaxz
 ybWDAAWZ8kSmOWGVFYLfBLCKrf8iJKg943wdmaVm5LZHnzkOdg7V2eG8nMcvS8Cu0aJnJK
 X9HfBvJAJW9ECHzFHNHEHGsBIUZhAnY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-58-_CVuJObBOUmOIKZLWz5HBg-1; Thu, 14 Jul 2022 09:28:07 -0400
X-MC-Unique: _CVuJObBOUmOIKZLWz5HBg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAE5B80A0B7;
 Thu, 14 Jul 2022 13:28:06 +0000 (UTC)
Received: from localhost (unknown [10.39.192.157])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 915041121314;
 Thu, 14 Jul 2022 13:28:06 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V . Lunev" <den@openvz.org>,
 Kevin Wolf <kwolf@redhat.com>
Subject: [PATCH 2/2] iotests/131: Add parallels regression test
Date: Thu, 14 Jul 2022 15:28:01 +0200
Message-Id: <20220714132801.72464-3-hreitz@redhat.com>
In-Reply-To: <20220714132801.72464-1-hreitz@redhat.com>
References: <20220714132801.72464-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Test an allocating write to a parallels image that has a backing node.
Before HEAD^, doing so used to give me a failed assertion (when the
backing node contains only `42` bytes; the results varies with the value
chosen, for `0` bytes, for example, all I get is EIO).

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/131     | 35 ++++++++++++++++++++++++++++++++++-
 tests/qemu-iotests/131.out | 13 +++++++++++++
 2 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/131 b/tests/qemu-iotests/131
index d7456cae5b..a847692b4c 100755
--- a/tests/qemu-iotests/131
+++ b/tests/qemu-iotests/131
@@ -43,7 +43,7 @@ _supported_os Linux
 
 inuse_offset=$((0x2c))
 
-size=64M
+size=$((64 * 1024 * 1024))
 CLUSTER_SIZE=64k
 IMGFMT=parallels
 _make_test_img $size
@@ -70,6 +70,39 @@ _check_test_img
 _check_test_img -r all
 { $QEMU_IO -c "read -P 0x11 64k 64k" "$TEST_IMG"; } 2>&1 | _filter_qemu_io | _filter_testdir
 
+echo "== allocate with backing =="
+# Verify that allocating clusters works fine even when there is a backing image.
+# Regression test for a bug where we would pass a buffer read from the backing
+# node as a QEMUIOVector object, which could cause anything from I/O errors over
+# assertion failures to invalid reads from memory.
+
+# Clear image
+_make_test_img $size
+# Create base image
+TEST_IMG="$TEST_IMG.base" _make_test_img $size
+
+# Write some data to the base image (which would trigger an assertion failure if
+# interpreted as a QEMUIOVector)
+$QEMU_IO -c 'write -P 42 0 64k' "$TEST_IMG.base" | _filter_qemu_io
+
+# Parallels does not seem to support storing a backing filename in the image
+# itself, so we need to build our backing chain on the command line
+imgopts="driver=$IMGFMT,file.driver=$IMGPROTO,file.filename=$TEST_IMG"
+imgopts+=",backing.driver=$IMGFMT"
+imgopts+=",backing.file.driver=$IMGPROTO,backing.file.filename=$TEST_IMG.base"
+
+# Cause allocation in the top image
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
+    $QEMU_IO --image-opts "$imgopts" -c 'write -P 1 0 64' | _filter_qemu_io
+
+# Verify
+QEMU_IO_OPTIONS=$QEMU_IO_OPTIONS_NO_FMT \
+    $QEMU_IO --image-opts "$imgopts" \
+    -c 'read -P 1 0 64' \
+    -c "read -P 42 64 $((64 * 1024 - 64))" \
+    -c "read -P 0 64k $((size - 64 * 1024))" \
+    | _filter_qemu_io
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/131.out b/tests/qemu-iotests/131.out
index 70da03dee5..de5ef7a8f5 100644
--- a/tests/qemu-iotests/131.out
+++ b/tests/qemu-iotests/131.out
@@ -37,4 +37,17 @@ Double checking the fixed image now...
 No errors were found on the image.
 read 65536/65536 bytes at offset 65536
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+== allocate with backing ==
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
+wrote 65536/65536 bytes at offset 0
+64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 64/64 bytes at offset 0
+64 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 64/64 bytes at offset 0
+64 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 65472/65472 bytes at offset 64
+63.938 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+read 67043328/67043328 bytes at offset 65536
+63.938 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.35.3


