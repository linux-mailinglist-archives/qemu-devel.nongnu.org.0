Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8287823099A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jul 2020 14:09:42 +0200 (CEST)
Received: from localhost ([::1]:45776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0OQP-0008SD-JH
	for lists+qemu-devel@lfdr.de; Tue, 28 Jul 2020 08:09:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k0OPC-00076f-TR
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 08:08:26 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:38027
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1k0OPB-0006Ya-6x
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 08:08:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595938104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oSpe9pTqo7BzNs/hDMNPOd8c7glVrVneoUOM7xjk9wY=;
 b=EqgeGLROcSJGyKWqNKTCWUicIW9PRYpD/KN1gQSXfoUx9OQq5WRlJoh0AIEF5x8yIXRxoE
 dbbq/PWK7FNLMO6+uhvK3poFC8ZHkr5Yq3Vt1oSiSaPh+sdf+mCU2gRlfb2wzu6Z0NaFe0
 cy9+SXy7UaTz8pr7M+Yh/sinuJSh+yw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-471-w_zQl8HJNd6sFojPYDhHHQ-1; Tue, 28 Jul 2020 08:08:22 -0400
X-MC-Unique: w_zQl8HJNd6sFojPYDhHHQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7D00519057A1;
 Tue, 28 Jul 2020 12:08:21 +0000 (UTC)
Received: from localhost (ovpn-112-145.ams2.redhat.com [10.36.112.145])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0D0A710013C1;
 Tue, 28 Jul 2020 12:08:17 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH for-5.1 2/2] iotests/028: Add test for cross-base-EOF reads
Date: Tue, 28 Jul 2020 14:08:05 +0200
Message-Id: <20200728120806.265916-3-mreitz@redhat.com>
In-Reply-To: <20200728120806.265916-1-mreitz@redhat.com>
References: <20200728120806.265916-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=mreitz@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/27 23:55:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Bruce Rogers <brogers@suse.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-stable@nongnu.org, qemu-devel@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/028     | 19 +++++++++++++++++++
 tests/qemu-iotests/028.out | 11 +++++++++++
 2 files changed, 30 insertions(+)

diff --git a/tests/qemu-iotests/028 b/tests/qemu-iotests/028
index 5d043cef92..6dd3ae09a3 100755
--- a/tests/qemu-iotests/028
+++ b/tests/qemu-iotests/028
@@ -142,6 +142,25 @@ TEST_IMG="${TEST_IMG}.copy" io_zero readv $(( offset + 32 * 1024 )) 512 1024 32
 
 _check_test_img
 
+echo
+echo '=== Reading across backing EOF in one operation ==='
+echo
+
+# Use a cluster boundary as the base end here
+base_size=$((3 * 1024 * 1024 * 1024))
+
+TEST_IMG="$TEST_IMG.base" _make_test_img $base_size
+_make_test_img -b "$TEST_IMG.base" -F $IMGFMT $image_size
+
+# Write 16 times 42 at the end of the base image
+$QEMU_IO -c "write -P 42 $((base_size - 16)) 16" "$TEST_IMG.base" \
+    | _filter_qemu_io
+
+# Read 32 bytes across the base EOF from the top;
+# should be 16 times 0x2a, then 16 times 0x00
+$QEMU_IO -c "read -v $((base_size - 16)) 32" "$TEST_IMG" \
+    | _filter_qemu_io
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/028.out b/tests/qemu-iotests/028.out
index 12f82c6a6c..5a68de5c46 100644
--- a/tests/qemu-iotests/028.out
+++ b/tests/qemu-iotests/028.out
@@ -730,4 +730,15 @@ read 512/512 bytes at offset 3221257728
 read 512/512 bytes at offset 3221258752
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 No errors were found on the image.
+
+=== Reading across backing EOF in one operation ===
+
+Formatting 'TEST_DIR/t.IMGFMT.base', fmt=IMGFMT size=3221225472
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=4294968832 backing_file=TEST_DIR/t.IMGFMT.base backing_fmt=IMGFMT
+wrote 16/16 bytes at offset 3221225456
+16 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+bffffff0:  2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a 2a  ................
+c0000000:  00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................
+read 32/32 bytes at offset 3221225456
+32 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 *** done
-- 
2.26.2


