Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7B22D7CE6
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 18:30:06 +0100 (CET)
Received: from localhost ([::1]:58106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmF3-0005KG-Ku
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 12:30:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knlui-00042F-BM
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1knluL-0002Ai-Ty
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:09:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607706519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=taUdhaWhTrR05pDkOeeNsQ06+IhI3i10r0/TDU7Yldg=;
 b=ZpVMUMNF7PlXlcY3ScyI5sdpgqmMnRZ4CFAdTQuVfs8WcANiAKlURO48pXgGIiYRL7F71m
 jzhNIUbAKk2NhOiv2iIkMTcBPJv3pou3GWA7Iv7WDQM61e1Ha04q4KcdDryK+VcoX9pLHZ
 +F8IDp4BQPG5V3bAHEVk7Q+puvKPbtU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-Ac2Z56fTPYOdndC2LZ83bQ-1; Fri, 11 Dec 2020 12:08:37 -0500
X-MC-Unique: Ac2Z56fTPYOdndC2LZ83bQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F25FBB8102;
 Fri, 11 Dec 2020 17:08:35 +0000 (UTC)
Received: from merkur.redhat.com (ovpn-114-231.ams2.redhat.com [10.36.114.231])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F21865D731;
 Fri, 11 Dec 2020 17:08:34 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/34] iotests: Use convert -n in some cases
Date: Fri, 11 Dec 2020 18:07:51 +0100
Message-Id: <20201211170812.228643-14-kwolf@redhat.com>
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

qemu-img convert (without -n) can often be replaced by a combination of
_make_test_img + qemu-img convert -n.  Doing so allows converting to
protocols that do not allow direct file creation, such as FUSE exports.
The only problem is that for formats other than qcow2 and qed (qcow1 at
least), this may lead to high disk usage for some reason, so we cannot
do it everywhere.

But we can do it in 028 and 089, so let us do that so they can run on
FUSE exports.  Also, in 028 this allows us to remove a 9-line comment
that used to explain why we cannot safely filter drive-backup's image
creation output.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Message-Id: <20201027190600.192171-10-mreitz@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/028     | 14 ++++----------
 tests/qemu-iotests/028.out |  3 +++
 tests/qemu-iotests/089     |  3 ++-
 tests/qemu-iotests/089.out |  1 +
 4 files changed, 10 insertions(+), 11 deletions(-)

diff --git a/tests/qemu-iotests/028 b/tests/qemu-iotests/028
index 6dd3ae09a3..864dc4a4e2 100755
--- a/tests/qemu-iotests/028
+++ b/tests/qemu-iotests/028
@@ -116,16 +116,10 @@ else
     QEMU_COMM_TIMEOUT=1
 fi
 
-# Silence output since it contains the disk image path and QEMU's readline
-# character echoing makes it very hard to filter the output. Plus, there
-# is no telling how many times the command will repeat before succeeding.
-# (Note that creating the image results in a "Formatting..." message over
-# stdout, which is the same channel the monitor uses.  We cannot reliably
-# wait for it because the monitor output may interact with it in such a
-# way that _timed_wait_for cannot read it.  However, once the block job is
-# done, we know that the "Formatting..." message must have appeared
-# already, so the output is still deterministic.)
-silent=y _send_qemu_cmd $h "drive_backup disk ${TEST_IMG}.copy" "(qemu)"
+TEST_IMG="$TEST_IMG.copy" _make_test_img $image_size
+_send_qemu_cmd $h "drive_backup -n disk ${TEST_IMG}.copy" "(qemu)" \
+    | _filter_imgfmt
+
 silent=y qemu_cmd_repeat=20 _send_qemu_cmd $h "info block-jobs" "No active jobs"
 _send_qemu_cmd $h "info block-jobs" "No active jobs"
 _send_qemu_cmd $h 'quit' ""
diff --git a/tests/qemu-iotests/028.out b/tests/qemu-iotests/028.out
index 5a68de5c46..e580488216 100644
--- a/tests/qemu-iotests/028.out
+++ b/tests/qemu-iotests/028.out
@@ -468,6 +468,9 @@ No errors were found on the image.
 
 block-backup
 
+Formatting 'TEST_DIR/t.IMGFMT.copy', fmt=IMGFMT size=4294968832
+QEMU X.Y.Z monitor - type 'help' for more information
+(qemu) drive_backup -n disk TEST_DIR/t.IMGFMT.copy
 (qemu) info block-jobs
 No active jobs
 === IO: pattern 195
diff --git a/tests/qemu-iotests/089 b/tests/qemu-iotests/089
index 66c5415abe..03a2ccf1e8 100755
--- a/tests/qemu-iotests/089
+++ b/tests/qemu-iotests/089
@@ -62,7 +62,8 @@ TEST_IMG="$TEST_IMG.base" _make_test_img $IMG_SIZE
 $QEMU_IO -c 'write -P 42 0 512' -c 'write -P 23 512 512' \
          -c 'write -P 66 1024 512' "$TEST_IMG.base" | _filter_qemu_io
 
-$QEMU_IMG convert -f raw -O $IMGFMT "$TEST_IMG.base" "$TEST_IMG"
+_make_test_img $IMG_SIZE
+$QEMU_IMG convert -f raw -O $IMGFMT -n "$TEST_IMG.base" "$TEST_IMG"
 
 $QEMU_IO_PROG --cache $CACHEMODE --aio $AIOMODE \
          -c 'read -P 42 0 512' -c 'read -P 23 512 512' \
diff --git a/tests/qemu-iotests/089.out b/tests/qemu-iotests/089.out
index 15682c2886..c53fc4823a 100644
--- a/tests/qemu-iotests/089.out
+++ b/tests/qemu-iotests/089.out
@@ -9,6 +9,7 @@ wrote 512/512 bytes at offset 512
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 512/512 bytes at offset 1024
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864
 read 512/512 bytes at offset 0
 512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 read 512/512 bytes at offset 512
-- 
2.29.2


