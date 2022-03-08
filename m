Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EC44D0DB5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Mar 2022 02:52:04 +0100 (CET)
Received: from localhost ([::1]:56856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRP16-0000Fe-R5
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 20:52:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROu1-00008Z-DT
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21042)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nROty-0006Nu-Ql
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 20:44:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646703878;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UG/F3ZYrF6lpvi9A8Nh4T3gBRPdRufkGiwmtqTouavs=;
 b=OuozSq3A1lbHL6dWK1+MghtDU18hJn7quwj5hLlAlt2kDZz4SGCE1GB/rcUSNRIUIRxJ/D
 YDY8VJIT7LPOANM4ZugInb+IdUZ1cuI9bwCx0+APhZ30MUE8LDdXwarqusbScjHRBv1vgF
 0qvYWBMR6VK6pl9X83sCm2rPCYW+foY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-323-uRWCqwBhMGK2w6_LkVQLXA-1; Mon, 07 Mar 2022 20:44:35 -0500
X-MC-Unique: uRWCqwBhMGK2w6_LkVQLXA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0C522801AFC;
 Tue,  8 Mar 2022 01:44:34 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.5])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3DA6D5E480;
 Tue,  8 Mar 2022 01:44:33 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 08/15] tests/qemu-iotests: introduce filter for qemu-nbd export
 list
Date: Mon,  7 Mar 2022 19:44:12 -0600
Message-Id: <20220308014419.3056549-9-eblake@redhat.com>
In-Reply-To: <20220308014419.3056549-1-eblake@redhat.com>
References: <20220308014419.3056549-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel P. Berrangé <berrange@redhat.com>

Introduce a filter for the output of qemu-nbd export list so it can be
reused in multiple tests.

The filter is a bit more permissive that what test 241 currently uses,
as its allows printing of the export count, along with any possible
error messages that might be emitted.

Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
Message-Id: <20220304193610.3293146-9-berrange@redhat.com>
Tested-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 tests/qemu-iotests/common.filter | 5 +++++
 tests/qemu-iotests/241           | 6 +++---
 tests/qemu-iotests/241.out       | 6 ++++++
 3 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index f53d8cbb9daa..9790411bf0e4 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -309,6 +309,11 @@ _filter_nbd()
         -e 's#\(foo\|PORT/\?\|.sock\): Failed to .*$#\1#'
 }

+_filter_qemu_nbd_exports()
+{
+    grep '\(exports available\|export\|size\|min block\|qemu-nbd\):'
+}
+
 _filter_qmp_empty_return()
 {
     grep -v '{"return": {}}'
diff --git a/tests/qemu-iotests/241 b/tests/qemu-iotests/241
index c962c8b6075d..f196650afad0 100755
--- a/tests/qemu-iotests/241
+++ b/tests/qemu-iotests/241
@@ -58,7 +58,7 @@ echo

 nbd_server_start_unix_socket -f $IMGFMT "$TEST_IMG_FILE"

-$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
+$QEMU_NBD_PROG --list -k $nbd_unix_socket | _filter_qemu_nbd_exports
 $QEMU_IMG map -f raw --output=json "$TEST_IMG" | _filter_qemu_img_map
 $QEMU_IO -f raw -c map "$TEST_IMG"
 nbd_server_stop
@@ -71,7 +71,7 @@ echo
 # sector alignment, here at the server.
 nbd_server_start_unix_socket "$TEST_IMG_FILE" 2> "$TEST_DIR/server.log"

-$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
+$QEMU_NBD_PROG --list -k $nbd_unix_socket | _filter_qemu_nbd_exports
 $QEMU_IMG map -f raw --output=json "$TEST_IMG" | _filter_qemu_img_map
 $QEMU_IO -f raw -c map "$TEST_IMG"
 nbd_server_stop
@@ -84,7 +84,7 @@ echo
 # Now force sector alignment at the client.
 nbd_server_start_unix_socket -f $IMGFMT "$TEST_IMG_FILE"

-$QEMU_NBD_PROG --list -k $nbd_unix_socket | grep '\(size\|min\)'
+$QEMU_NBD_PROG --list -k $nbd_unix_socket | _filter_qemu_nbd_exports
 $QEMU_IMG map --output=json "$TEST_IMG" | _filter_qemu_img_map
 $QEMU_IO -c map "$TEST_IMG"
 nbd_server_stop
diff --git a/tests/qemu-iotests/241.out b/tests/qemu-iotests/241.out
index 56e95b599a3d..88e8cfcd7e25 100644
--- a/tests/qemu-iotests/241.out
+++ b/tests/qemu-iotests/241.out
@@ -2,6 +2,8 @@ QA output created by 241

 === Exporting unaligned raw image, natural alignment ===

+exports available: 1
+ export: ''
   size:  1024
   min block: 1
 [{ "start": 0, "length": 1000, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
@@ -10,6 +12,8 @@ QA output created by 241

 === Exporting unaligned raw image, forced server sector alignment ===

+exports available: 1
+ export: ''
   size:  1024
   min block: 512
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET}]
@@ -20,6 +24,8 @@ WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed

 === Exporting unaligned raw image, forced client sector alignment ===

+exports available: 1
+ export: ''
   size:  1024
   min block: 1
 [{ "start": 0, "length": 1000, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-- 
2.35.1


