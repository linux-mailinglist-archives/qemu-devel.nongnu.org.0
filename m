Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2092D148F
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 16:25:53 +0100 (CET)
Received: from localhost ([::1]:38828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmIOe-0007cP-5m
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 10:25:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kmILr-0005Td-5s
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:22:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:45832)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kmILk-0003DG-Uo
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 10:22:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607354571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Mf1X5ybzSYevEuYm1dKRx9d933YZSqRjpShJM1pDqKc=;
 b=EgDBkZvzv8omGl6WXz8ZYiRrE/kWpRGwexmSuch0PAueFcIQKgCScf2fo/PV+/n5u9eICv
 JkBYRrSp6CjeOc8yFfMoaxR4l+2tuvTXFoqOdFLkRWWjdvt2GDpIYbKwO0wYyCyL8AaxFt
 HNvx13EWruFTYJRxN42w6hMZYHJXEI8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-7ecaLwEqMQqV__LgR76f-g-1; Mon, 07 Dec 2020 10:22:48 -0500
X-MC-Unique: 7ecaLwEqMQqV__LgR76f-g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B3FC4107ACE8;
 Mon,  7 Dec 2020 15:22:47 +0000 (UTC)
Received: from localhost (ovpn-114-162.ams2.redhat.com [10.36.114.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 546B310016FF;
 Mon,  7 Dec 2020 15:22:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests/221: Discard image before qemu-img map
Date: Mon,  7 Dec 2020 16:22:45 +0100
Message-Id: <20201207152245.66987-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See the new comment for why this should be done.

I do not have a reproducer on master, but when using FUSE block exports,
this test breaks depending on the underlying filesystem (for me, it
works on tmpfs, but fails on xfs, because the block allocated by
file-posix has 16 kB there instead of 4 kB).

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/221     |  7 +++++++
 tests/qemu-iotests/221.out | 14 ++++++--------
 2 files changed, 13 insertions(+), 8 deletions(-)

diff --git a/tests/qemu-iotests/221 b/tests/qemu-iotests/221
index 0e9096fec7..73c45a4ca6 100755
--- a/tests/qemu-iotests/221
+++ b/tests/qemu-iotests/221
@@ -46,6 +46,13 @@ echo "=== Check mapping of unaligned raw image ==="
 echo
 
 _make_test_img 65537 # qemu-img create rounds size up
+
+# file-posix allocates the first block of any images when it is created;
+# the size of this block depends on the host page size and the file
+# system block size, none of which are constant.  Discard the whole
+# image so we will not see this allocation in qemu-img map's output.
+$QEMU_IO -c 'discard 0 65537' "$TEST_IMG" | _filter_qemu_io
+
 $QEMU_IMG map --output=json "$TEST_IMG" | _filter_qemu_img_map
 
 truncate --size=65537 "$TEST_IMG" # so we resize it and check again
diff --git a/tests/qemu-iotests/221.out b/tests/qemu-iotests/221.out
index dca024a0c3..93846c7dab 100644
--- a/tests/qemu-iotests/221.out
+++ b/tests/qemu-iotests/221.out
@@ -3,18 +3,16 @@ QA output created by 221
 === Check mapping of unaligned raw image ===
 
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=65537
-[{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 4096, "length": 61952, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
-[{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 4096, "length": 61952, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
+discard 65537/65537 bytes at offset 0
+64.001 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+[{ "start": 0, "length": 66048, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
+[{ "start": 0, "length": 66048, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
 wrote 1/1 bytes at offset 65536
 1 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
-[{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 4096, "length": 61440, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
+[{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
 { "start": 65536, "length": 1, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 65537, "length": 511, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
-[{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 4096, "length": 61440, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
+[{ "start": 0, "length": 65536, "depth": 0, "zero": true, "data": false, "offset": OFFSET},
 { "start": 65536, "length": 1, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 65537, "length": 511, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
 *** done
-- 
2.28.0


