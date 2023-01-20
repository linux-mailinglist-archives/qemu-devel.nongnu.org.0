Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE7A8675484
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 13:31:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIqUO-0003Q9-8b; Fri, 20 Jan 2023 07:27:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUL-0003Mv-JV
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1pIqUJ-0000VJ-U2
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 07:27:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674217639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GKojYdrMESCd942kK/e4cqghIL9ZAsgeFTcF29GcQWE=;
 b=W7jJUJDcaZbmvD3k0khehOWhkJvlyQxnrjfypWjzKdJE192hZmcX0JkUo8tJgKueY/2cFi
 +Rcw9GrcVkDmJLw44MuJ7Hck1Zn14sY1GLa1AN2dZpXxYWevL3NyIa9s/9MEY5d/pfbW4z
 Vhwnc0KC9uEJGZ10imaPvI0w+bQMPF0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-335-yP3j3AciP-Sc-BHIi8AL5w-1; Fri, 20 Jan 2023 07:27:15 -0500
X-MC-Unique: yP3j3AciP-Sc-BHIi8AL5w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8F4D6101157B;
 Fri, 20 Jan 2023 12:27:15 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.193.74])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C4E4A40C6EC4;
 Fri, 20 Jan 2023 12:27:14 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 36/38] iotests/106, 214, 308: Read only one size line
Date: Fri, 20 Jan 2023 13:26:31 +0100
Message-Id: <20230120122633.84983-37-kwolf@redhat.com>
In-Reply-To: <20230120122633.84983-1-kwolf@redhat.com>
References: <20230120122633.84983-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Hanna Reitz <hreitz@redhat.com>

These tests read size information (sometimes disk size, sometimes
virtual size) from qemu-img info's output.  Once qemu-img starts
printing info about child nodes, we are going to see multiple instances
of that per image, but these tests are only interested in the first one,
so use "head -n 1" to get it.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
Message-Id: <20220620162704.80987-11-hreitz@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/106 | 4 ++--
 tests/qemu-iotests/214 | 6 ++++--
 tests/qemu-iotests/308 | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/tests/qemu-iotests/106 b/tests/qemu-iotests/106
index 9d6adb542d..ae0fc46691 100755
--- a/tests/qemu-iotests/106
+++ b/tests/qemu-iotests/106
@@ -66,7 +66,7 @@ for create_mode in off falloc full; do
             expected_size=$((expected_size + $GROWTH_SIZE))
         fi
 
-        actual_size=$($QEMU_IMG info -f "$IMGFMT" "$TEST_IMG" | grep 'disk size')
+        actual_size=$($QEMU_IMG info -f "$IMGFMT" "$TEST_IMG" | grep 'disk size' | head -n 1)
         actual_size=$(echo "$actual_size" | sed -e 's/^[^0-9]*\([0-9]\+\).*$/\1/')
 
         # The actual size may exceed the expected size, depending on the file
@@ -105,7 +105,7 @@ for growth_mode in falloc full; do
     _make_test_img -o "extent_size_hint=0" 2G
     $QEMU_IMG resize -f "$IMGFMT" --preallocation=$growth_mode "$TEST_IMG" +${GROWTH_SIZE}K
 
-    actual_size=$($QEMU_IMG info -f "$IMGFMT" "$TEST_IMG" | grep 'disk size')
+    actual_size=$($QEMU_IMG info -f "$IMGFMT" "$TEST_IMG" | grep 'disk size' | head -n 1)
     actual_size=$(echo "$actual_size" | sed -e 's/^[^0-9]*\([0-9]\+\).*$/\1/')
 
     if [ $actual_size -lt $GROWTH_SIZE ]; then
diff --git a/tests/qemu-iotests/214 b/tests/qemu-iotests/214
index c66e246ba2..55ffcd7f44 100755
--- a/tests/qemu-iotests/214
+++ b/tests/qemu-iotests/214
@@ -102,7 +102,8 @@ let data_size="8 * $cluster_size"
 $QEMU_IO -c "write -P 0xaa 0 $data_size" "$TEST_IMG" \
          2>&1 | _filter_qemu_io | _filter_testdir
 sizeA=$($QEMU_IMG info --output=json "$TEST_IMG" |
-        sed -n '/"actual-size":/ s/[^0-9]//gp')
+        sed -n '/"actual-size":/ s/[^0-9]//gp' |
+        head -n 1)
 
 _make_test_img 2M -o cluster_size=$cluster_size
 echo "Write compressed data:"
@@ -124,7 +125,8 @@ $QEMU_IO -c "write -P 0xcc $offset $data_size" "json:{\
                           _filter_qemu_io | _filter_testdir
 
 sizeB=$($QEMU_IMG info --output=json "$TEST_IMG" |
-        sed -n '/"actual-size":/ s/[^0-9]//gp')
+        sed -n '/"actual-size":/ s/[^0-9]//gp' |
+        head -n 1)
 
 if [ $sizeA -lt $sizeB ]
 then
diff --git a/tests/qemu-iotests/308 b/tests/qemu-iotests/308
index bde4aac2fa..09275e9a10 100755
--- a/tests/qemu-iotests/308
+++ b/tests/qemu-iotests/308
@@ -217,12 +217,12 @@ echo
 echo '=== Remove export ==='
 
 # Double-check that $EXT_MP appears as a non-empty file (the raw image)
-$QEMU_IMG info -f raw "$EXT_MP" | grep 'virtual size'
+$QEMU_IMG info -f raw "$EXT_MP" | grep 'virtual size' | head -n 1
 
 fuse_export_del 'export-mp'
 
 # See that the file appears empty again
-$QEMU_IMG info -f raw "$EXT_MP" | grep 'virtual size'
+$QEMU_IMG info -f raw "$EXT_MP" | grep 'virtual size' | head -n 1
 
 echo
 echo '=== Writable export ==='
-- 
2.38.1


