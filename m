Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B7484830D6
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Jan 2022 13:03:29 +0100 (CET)
Received: from localhost ([::1]:56508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4M3k-0008IC-7y
	for lists+qemu-devel@lfdr.de; Mon, 03 Jan 2022 07:03:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n4M0m-0007Nq-5x
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 07:00:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n4M0j-0006ff-Ag
 for qemu-devel@nongnu.org; Mon, 03 Jan 2022 07:00:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641211220;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=0fKP9zosX7TfMKiXpXX9yY5E+SH8zJ4zQq33T8EFkfg=;
 b=cHMxRp8dTYOPtk/AIT+rGRkf6YnXHEt9KMwTb1UCP3n1pselnuoKoA5JT/9MWLHPiwBFJd
 pFgVpWoRa496wGtSohR6a9mlFcxdZ1RHzx8YV243Wzl7EI5fPcn9UEiGKbgUoTSQOGD+CK
 e5b1J8WYuK2dkcLbtV6fENRUQqjEblw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-86-o1Wl2scxMoyawuislI5Wgg-1; Mon, 03 Jan 2022 07:00:17 -0500
X-MC-Unique: o1Wl2scxMoyawuislI5Wgg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1B228042E1;
 Mon,  3 Jan 2022 12:00:16 +0000 (UTC)
Received: from localhost (unknown [10.39.194.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0682672414;
 Mon,  3 Jan 2022 12:00:15 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/308: Fix for CAP_DAC_OVERRIDE
Date: Mon,  3 Jan 2022 13:00:14 +0100
Message-Id: <20220103120014.13061-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.37, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With CAP_DAC_OVERRIDE (which e.g. root generally has), permission checks
will be bypassed when opening files.

308 in one instance tries to open a read-only file (FUSE export) with
qemu-io as read/write, and expects this to fail.  However, when running
it as root, opening will succeed (thanks to CAP_DAC_OVERRIDE) and only
the actual write operation will fail.

Note this as "Case not run", but have the test pass in either case.

Reported-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Fixes: 2c7dd057aa7bd7a875e9b1a53975c220d6380bc4
       ("export/fuse: Pass default_permissions for mount")
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/308     | 25 +++++++++++++++++++++++--
 tests/qemu-iotests/308.out |  2 +-
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
index 2e3f8f4282..bde4aac2fa 100755
--- a/tests/qemu-iotests/308
+++ b/tests/qemu-iotests/308
@@ -230,8 +230,29 @@ echo '=== Writable export ==='
 fuse_export_add 'export-mp' "'mountpoint': '$EXT_MP', 'writable': true"
 
 # Check that writing to the read-only export fails
-$QEMU_IO -f raw -c 'write -P 42 1M 64k' "$TEST_IMG" 2>&1 \
-    | _filter_qemu_io | _filter_testdir | _filter_imgfmt
+output=$($QEMU_IO -f raw -c 'write -P 42 1M 64k' "$TEST_IMG" 2>&1 \
+             | _filter_qemu_io | _filter_testdir | _filter_imgfmt)
+
+# Expected reference output: Opening the file fails because it has no
+# write permission
+reference="Could not open 'TEST_DIR/t.IMGFMT': Permission denied"
+
+if echo "$output" | grep -q "$reference"; then
+    echo "Writing to read-only export failed: OK"
+elif echo "$output" | grep -q "write failed: Permission denied"; then
+    # With CAP_DAC_OVERRIDE (e.g. when running this test as root), the export
+    # can be opened regardless of its file permissions, but writing will then
+    # fail.  This is not the result for which we want to test, so count this as
+    # a SKIP.
+    _casenotrun "Opening RO export as R/W succeeded, perhaps because of" \
+        "CAP_DAC_OVERRIDE"
+
+    # Still, write this to the reference output to make the test pass
+    echo "Writing to read-only export failed: OK"
+else
+    echo "Writing to read-only export failed: ERROR"
+    echo "$output"
+fi
 
 # But here it should work
 $QEMU_IO -f raw -c 'write -P 42 1M 64k' "$EXT_MP" | _filter_qemu_io
diff --git a/tests/qemu-iotests/308.out b/tests/qemu-iotests/308.out
index fc47bb11a2..e4467a10cf 100644
--- a/tests/qemu-iotests/308.out
+++ b/tests/qemu-iotests/308.out
@@ -95,7 +95,7 @@ virtual size: 0 B (0 bytes)
               'mountpoint': 'TEST_DIR/t.IMGFMT.fuse', 'writable': true
           } }
 {"return": {}}
-qemu-io: can't open device TEST_DIR/t.IMGFMT: Could not open 'TEST_DIR/t.IMGFMT': Permission denied
+Writing to read-only export failed: OK
 wrote 65536/65536 bytes at offset 1048576
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 65536/65536 bytes at offset 1048576
-- 
2.33.1


