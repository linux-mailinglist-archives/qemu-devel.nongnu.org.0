Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA3F2260A4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jul 2020 15:19:48 +0200 (CEST)
Received: from localhost ([::1]:52148 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jxVhr-0003SC-3Y
	for lists+qemu-devel@lfdr.de; Mon, 20 Jul 2020 09:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jxVgf-00020p-DQ
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 09:18:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:44294
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1jxVgd-0001zD-N8
 for qemu-devel@nongnu.org; Mon, 20 Jul 2020 09:18:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595251111;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y+NxlkH3rhIut/JMt1D7oYh8k9S9q2R+3FMhNB5ptXU=;
 b=ZkSITt2MtS65wGmLgYlWZ7FjyCCgDaF9oQCkHAyrzg6+NCONUg773YZmhzUnL4xgyREeoF
 8NKD1Ah2EghyGg+pAij0I1Iq/Wwm+hsxNkUeB35OLX2U84J8zFqpATA85Q75Hlevr7+k68
 qGm9ZLcwprCGRCOGIriQvFQtPwEQ8Ak=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432-UgGZlyhbMAeK0eQQyO4VzQ-1; Mon, 20 Jul 2020 09:18:28 -0400
X-MC-Unique: UgGZlyhbMAeK0eQQyO4VzQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C11918C63C0;
 Mon, 20 Jul 2020 13:18:28 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-59.ams2.redhat.com [10.36.114.59])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E35467303C;
 Mon, 20 Jul 2020 13:18:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-5.1 2/2] iotests: Test sparseness for qemu-img convert -n
Date: Mon, 20 Jul 2020 15:18:10 +0200
Message-Id: <20200720131810.177978-3-kwolf@redhat.com>
In-Reply-To: <20200720131810.177978-1-kwolf@redhat.com>
References: <20200720131810.177978-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/20 02:11:17
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: kwolf@redhat.com, nsoffer@redhat.com, qemu-devel@nongnu.org,
 mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/122     | 34 ++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/122.out | 17 +++++++++++++++++
 2 files changed, 51 insertions(+)

diff --git a/tests/qemu-iotests/122 b/tests/qemu-iotests/122
index dfd1cd05d6..1112fc0730 100755
--- a/tests/qemu-iotests/122
+++ b/tests/qemu-iotests/122
@@ -281,6 +281,40 @@ $QEMU_IMG convert -O $IMGFMT -n "$TEST_IMG" "$TEST_IMG".orig
 
 $QEMU_IMG compare "$TEST_IMG" "$TEST_IMG".orig
 
+echo
+echo '=== -n to an empty image ==='
+echo
+
+_make_test_img 64M
+
+# Convert with -n, which should not result in a fully allocated image, not even
+# with compat=0.10 (because the target doesn't have a backing file)
+TEST_IMG="$TEST_IMG".orig _make_test_img -o compat=1.1 64M
+$QEMU_IMG convert -O $IMGFMT -n "$TEST_IMG" "$TEST_IMG".orig
+$QEMU_IMG map --output=json "$TEST_IMG".orig
+
+TEST_IMG="$TEST_IMG".orig _make_test_img -o compat=0.10 64M
+$QEMU_IMG convert -O $IMGFMT -n "$TEST_IMG" "$TEST_IMG".orig
+$QEMU_IMG map --output=json "$TEST_IMG".orig
+
+echo
+echo '=== -n to an empty image with a backing file ==='
+echo
+
+_make_test_img 64M
+TEST_IMG="$TEST_IMG".base _make_test_img 64M
+
+# Convert with -n, which should still not result in a fully allocated image for
+# compat=1.1 (because it can use zero clusters), but it should be fully
+# allocated with compat=0.10
+TEST_IMG="$TEST_IMG".orig _make_test_img -b "$TEST_IMG".base -F $IMGFMT -o compat=1.1 64M
+$QEMU_IMG convert -O $IMGFMT -n "$TEST_IMG" "$TEST_IMG".orig
+$QEMU_IMG map --output=json "$TEST_IMG".orig
+
+TEST_IMG="$TEST_IMG".orig _make_test_img -b "$TEST_IMG".base -F $IMGFMT -o compat=0.10 64M
+$QEMU_IMG convert -O $IMGFMT -n "$TEST_IMG" "$TEST_IMG".orig
+$QEMU_IMG map --output=json "$TEST_IMG".orig
+
 echo
 echo '=== -n -B to an image without a backing file ==='
 echo
diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
index f1f195ed77..b8028efb1d 100644
--- a/tests/qemu-iotests/122.out
+++ b/tests/qemu-iotests/122.out
@@ -229,6 +229,23 @@ wrote 65536/65536 bytes at offset 0
 64 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 Images are identical.
 
+=== -n to an empty image ===
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+Formatting 'TEST_DIR/t.IMGFMT.orig', fmt=IMGFMT size=67108864
+[{ "start": 0, "length": 67108864, "depth": 0, "zero": true, "data": false}]
+Formatting 'TEST_DIR/t.IMGFMT.orig', fmt=IMGFMT size=67108864
+[{ "start": 0, "length": 67108864, "depth": 0, "zero": true, "data": false}]
+
+=== -n to an empty image with a backing file ===
+
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
+Formatting 'TEST_DIR/t.IMGFMT.orig', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
+[{ "start": 0, "length": 67108864, "depth": 0, "zero": true, "data": false}]
+Formatting 'TEST_DIR/t.IMGFMT.orig', fmt=IMGFMT size=67108864 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
+[{ "start": 0, "length": 67108864, "depth": 0, "zero": false, "data": true, "offset": 327680}]
+
 === -n -B to an image without a backing file ===
 
 Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=67108864
-- 
2.25.4


