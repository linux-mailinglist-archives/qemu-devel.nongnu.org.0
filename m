Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4775725F982
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Sep 2020 13:33:05 +0200 (CEST)
Received: from localhost ([::1]:59390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFFOS-0007XJ-Al
	for lists+qemu-devel@lfdr.de; Mon, 07 Sep 2020 07:33:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF38-000454-AH
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:11:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFF34-0008IE-6n
 for qemu-devel@nongnu.org; Mon, 07 Sep 2020 07:11:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599477057;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LY/mhals1RefPJVSBSDNO2omv/SwWDkLpDs9jAKGCzw=;
 b=aLxVsIjQ7ZSjJYFgJIdxcUX9Cdw95FPqqRf9imJzeSD8dOxy7+wSTCs/81gMS8xrZY6wZY
 pEApKylMm1waFnfWRn/LkgPhqGtRPCBiauHxPINtWtnEbOdzmHor//pKzVynd38b3oApBP
 HyqL2yt8bhVmJqMWO+ZQZJ1paNeB7xg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-BvuHs8__OXyUXabH3GbQSw-1; Mon, 07 Sep 2020 07:10:55 -0400
X-MC-Unique: BvuHs8__OXyUXabH3GbQSw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9B1F21DDEC;
 Mon,  7 Sep 2020 11:10:54 +0000 (UTC)
Received: from linux.fritz.box.com (ovpn-114-154.ams2.redhat.com
 [10.36.114.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 986D87E435;
 Mon,  7 Sep 2020 11:10:53 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 54/64] iotests: Test that qcow2's data-file is flushed
Date: Mon,  7 Sep 2020 13:09:26 +0200
Message-Id: <20200907110936.261684-55-kwolf@redhat.com>
In-Reply-To: <20200907110936.261684-1-kwolf@redhat.com>
References: <20200907110936.261684-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/07 05:27:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

Flushing a qcow2 node must lead to the data-file node being flushed as
well.

Signed-off-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/244     | 49 ++++++++++++++++++++++++++++++++++++++
 tests/qemu-iotests/244.out |  7 ++++++
 2 files changed, 56 insertions(+)

diff --git a/tests/qemu-iotests/244 b/tests/qemu-iotests/244
index efe3c0428b..f2b2dddf1c 100755
--- a/tests/qemu-iotests/244
+++ b/tests/qemu-iotests/244
@@ -217,6 +217,55 @@ $QEMU_IMG amend -f $IMGFMT -o "data_file=blkdebug::$TEST_IMG.data" "$TEST_IMG"
 $QEMU_IMG convert -f $IMGFMT -O $IMGFMT -n -C "$TEST_IMG.src" "$TEST_IMG"
 $QEMU_IMG compare -f $IMGFMT -F $IMGFMT "$TEST_IMG.src" "$TEST_IMG"
 
+echo
+echo "=== Flushing should flush the data file ==="
+echo
+
+# We are going to flush a qcow2 file with a blkdebug node inserted
+# between the qcow2 node and its data file node.  The blkdebug node
+# will return an error for all flushes and so we if the data file is
+# flushed, we will see qemu-io return an error.
+
+# We need to write something or the flush will not do anything; we
+# also need -t writeback so the write is not done as a FUA write
+# (which would then fail thanks to the implicit flush)
+$QEMU_IO -c 'write 0 512' -c flush \
+    -t writeback \
+    "json:{
+         'driver': 'qcow2',
+         'file': {
+             'driver': 'file',
+             'filename': '$TEST_IMG'
+         },
+         'data-file': {
+             'driver': 'blkdebug',
+             'inject-error': [{
+                 'event': 'none',
+                 'iotype': 'flush'
+             }],
+             'image': {
+                 'driver': 'file',
+                 'filename': '$TEST_IMG.data'
+             }
+         }
+     }" \
+    | _filter_qemu_io
+
+result=${PIPESTATUS[0]}
+echo
+
+case $result in
+    0)
+        echo "ERROR: qemu-io succeeded, so the data file was not flushed"
+        ;;
+    1)
+        echo "Success: qemu-io failed, so the data file was flushed"
+        ;;
+    *)
+        echo "ERROR: qemu-io returned unknown exit code $result"
+        ;;
+esac
+
 # success, all done
 echo "*** done"
 rm -f $seq.full
diff --git a/tests/qemu-iotests/244.out b/tests/qemu-iotests/244.out
index dbab7359a9..7269b4295a 100644
--- a/tests/qemu-iotests/244.out
+++ b/tests/qemu-iotests/244.out
@@ -131,4 +131,11 @@ Offset          Length          Mapped to       File
 Formatting 'TEST_DIR/t.IMGFMT', fmt=IMGFMT size=67108864 data_file=TEST_DIR/t.IMGFMT.data
 Images are identical.
 Images are identical.
+
+=== Flushing should flush the data file ===
+
+wrote 512/512 bytes at offset 0
+512 bytes, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+
+Success: qemu-io failed, so the data file was flushed
 *** done
-- 
2.25.4


