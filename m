Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 285E02D7D06
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:38:16 +0100 (CET)
Received: from localhost ([::1]:49356 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmMx-0005uo-2L
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:38:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluv-00048p-48
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluN-0002C4-QI
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=goZmBIyniVyMLlSXxfgjCKnVNMJmhLBkaO5nJxyHp/A=;
 b=FPZ657PQ+X82jNq/hBtjZXweLKu6dZn3PvkAK6iqGG42DZgiCh1VJbdmyToQAYzwSkhYlT
 DMkblPQYoyAQDI/h4iP/RGk1/uHap/4wc5TvqC3/zK1AgF+lmVr/1bbns3dE07UZN3dmvl
 EhhN7fIdFGmQ5+ERsDPlxElKnBPef2o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-lchqb4DTNouqX9dMbSSUuA-1; Fri, 11 Dec 2020 12:08:39 -0500
X-MC-Unique: lchqb4DTNouqX9dMbSSUuA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 97F9A100C660;
 Fri, 11 Dec 2020 17:08:38 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 96E835D731;
 Fri, 11 Dec 2020 17:08:37 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/34] iotests: Derive image names from $TEST_IMG
Date: Fri, 11 Dec 2020 18:07:53 +0100
Message-Id: <20201211170812.228643-16-kwolf@redhat.com>
In-Reply-To: <20201211170812.228643-1-kwolf@redhat.com>
References: <20201211170812.228643-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Max Reitz <mreitz@redhat.com>

Avoid creating images with custom filenames in $TEST_DIR, because
non-file protocols may want to keep $TEST_IMG (and all other test
images) in some other directory.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201027190600.192171-12-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/200     | 3 +--
 tests/qemu-iotests/200.out | 4 ++--
 tests/qemu-iotests/229     | 3 +--
 tests/qemu-iotests/229.out | 6 +++---
 4 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/tests/qemu-iotests/200 b/tests/qemu-iotests/200
index 59f7854b9f..a7aabbd032 100755
--- a/tests/qemu-iotests/200
+++ b/tests/qemu-iotests/200
@@ -44,8 +44,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
 _supported_fmt qcow2 qed
 _supported_proto file
 
-BACKING_IMG="${TEST_DIR}/backing.img"
-TEST_IMG="${TEST_DIR}/test.img"
+BACKING_IMG="$TEST_IMG.base"
 
 TEST_IMG="$BACKING_IMG" _make_test_img 512M
 _make_test_img -F $IMGFMT -b "$BACKING_IMG" 512M
diff --git a/tests/qemu-iotests/200.out b/tests/qemu-iotests/200.out
index a6776070e4..5883f16ac3 100644
--- a/tests/qemu-iotests/200.out
+++ b/tests/qemu-iotests/200.out
@@ -1,6 +1,6 @@
 QA output created by 200
-Formatting 'TEST_DIR/backing.img', fmt=IMGFMT size=536870912
-Formatting 'TEST_DIR/test.img', fmt=IMGFMT size=536870912 backing_file=TEST_DIR/backing.img backing_fmt=IMGFMT
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=536870912
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=536870912 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
 wrote 314572800/314572800 bytes at offset 512
 300 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
diff --git a/tests/qemu-iotests/229 b/tests/qemu-iotests/229
index 89a5359f32..5f759fa587 100755
--- a/tests/qemu-iotests/229
+++ b/tests/qemu-iotests/229
@@ -51,8 +51,7 @@ _supported_os Linux
 _unsupported_imgopts data_file
 
 
-DEST_IMG="$TEST_DIR/d.$IMGFMT"
-TEST_IMG="$TEST_DIR/b.$IMGFMT"
+DEST_IMG="$TEST_IMG.dest"
 BLKDEBUG_CONF="$TEST_DIR/blkdebug.conf"
 
 _make_test_img 2M
diff --git a/tests/qemu-iotests/229.out b/tests/qemu-iotests/229.out
index 4de6dfaa28..7eed393013 100644
--- a/tests/qemu-iotests/229.out
+++ b/tests/qemu-iotests/229.out
@@ -1,6 +1,6 @@
 QA output created by 229
-Formatting 'TEST_DIR/b.IMGFMT', fmt=IMGFMT size=2097152
-Formatting 'TEST_DIR/d.IMGFMT', fmt=IMGFMT size=2097152
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=2097152
+Formatting 'TEST_DIR/t.IMGFMT.dest', fmt=IMGFMT size=2097152
 wrote 2097152/2097152 bytes at offset 0
 2 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 {'execute': 'qmp_capabilities'}
@@ -8,7 +8,7 @@ wrote 2097152/2097152 bytes at offset 0
 
 === Starting drive-mirror, causing error & stop  ===
 
-{'execute': 'drive-mirror', 'arguments': {'device': 'testdisk', 'format': 'IMGFMT', 'target': 'blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/d.IMGFMT', 'sync': 'full', 'mode': 'existing', 'on-source-error': 'stop', 'on-target-error': 'stop' }}
+{'execute': 'drive-mirror', 'arguments': {'device': 'testdisk', 'format': 'IMGFMT', 'target': 'blkdebug:TEST_DIR/blkdebug.conf:TEST_DIR/t.IMGFMT.dest', 'sync': 'full', 'mode': 'existing', 'on-source-error': 'stop', 'on-target-error': 'stop' }}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "testdisk"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "testdisk"}}
 {"return": {}}
-- 
2.29.2


