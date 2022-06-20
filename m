Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62FFE552267
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 18:39:54 +0200 (CEST)
Received: from localhost ([::1]:38268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3KRN-0002G6-Fi
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 12:39:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFM-0005lZ-8J
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o3KFK-0005N3-HR
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 12:27:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655742446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MAZeZkYpGCQOItsNFseIPRpqqRPm3vhYpjjCbxi4WWA=;
 b=OfxZZAkOvoZCSpb3/7XrJp+2n/gjQWr4fDAFvrglZYexWxEG/UF4sLIW/Z/JIxr3LcYdE6
 BqyAOVaWcjubCNuE97LwoVNU8y8ZdyjGgKVz9LxWL9ClGIn1diR8+0afiv5EggdtlmNdIX
 T+nuoFSfxqY3uZnJhztbnlaLfay+ZKE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-388-vcmPXKziNfqiXTnnzxr8pg-1; Mon, 20 Jun 2022 12:27:22 -0400
X-MC-Unique: vcmPXKziNfqiXTnnzxr8pg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4CDE585A580;
 Mon, 20 Jun 2022 16:27:22 +0000 (UTC)
Received: from localhost (unknown [10.39.193.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 098622166B26;
 Mon, 20 Jun 2022 16:27:21 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Subject: [PATCH v2 10/12] iotests/106, 214, 308: Read only one size line
Date: Mon, 20 Jun 2022 18:27:02 +0200
Message-Id: <20220620162704.80987-11-hreitz@redhat.com>
In-Reply-To: <20220620162704.80987-1-hreitz@redhat.com>
References: <20220620162704.80987-1-hreitz@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

These tests read size information (sometimes disk size, sometimes
virtual size) from qemu-img info's output.  Once qemu-img starts
printing info about child nodes, we are going to see multiple instances
of that per image, but these tests are only interested in the first one,
so use "head -n 1" to get it.

Signed-off-by: Hanna Reitz <hreitz@redhat.com>
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
2.35.3


