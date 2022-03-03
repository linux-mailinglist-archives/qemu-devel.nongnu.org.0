Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 058064CC283
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 17:19:58 +0100 (CET)
Received: from localhost ([::1]:60402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPoBJ-0001uS-2G
	for lists+qemu-devel@lfdr.de; Thu, 03 Mar 2022 11:19:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPnwX-0008Ep-LJ
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:04:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nPnwW-0007BS-3P
 for qemu-devel@nongnu.org; Thu, 03 Mar 2022 11:04:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646323479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OWv+Ya8kDTMPeWLKIvrepCejs68gzemWvc3RjnEd/0Y=;
 b=R+K+czsvcdwtFa3pZ3IUxqMmrYCflRum8yioMWaX55djvE/TDDKsb/YvH4f+qRH0xN0ZAF
 EivrJrYeVOxfPi0JzyYYYCrn1JZdY8GsWGe45goz4whsef8ZInmfvV2D1EbphRuKkv5bzf
 lVlOsldMDWiSF0jhun7ym+7eYtRwcDs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-156-Nk8IyAc9OPW2wyp9Ai-nTA-1; Thu, 03 Mar 2022 11:04:36 -0500
X-MC-Unique: Nk8IyAc9OPW2wyp9Ai-nTA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5F989501E3;
 Thu,  3 Mar 2022 16:04:35 +0000 (UTC)
Received: from localhost.localdomain.com (unknown [10.33.36.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 184A71006876;
 Thu,  3 Mar 2022 16:04:32 +0000 (UTC)
From: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/12] tests/qemu-iotests: introduce filter for qemu-nbd
 export list
Date: Thu,  3 Mar 2022 16:03:26 +0000
Message-Id: <20220303160330.2979753-9-berrange@redhat.com>
In-Reply-To: <20220303160330.2979753-1-berrange@redhat.com>
References: <20220303160330.2979753-1-berrange@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce a filter for the output of qemu-nbd export list so it can be
reused in multiple tests.

The filter is a bit more permissive that what test 241 currently uses,
as its allows printing of the export count, along with any possible
error messages that might be emitted.

Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
---
 tests/qemu-iotests/241           | 6 +++---
 tests/qemu-iotests/241.out       | 3 +++
 tests/qemu-iotests/common.filter | 5 +++++
 3 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/tests/qemu-iotests/241 b/tests/qemu-iotests/241
index c962c8b607..f196650afa 100755
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
index 56e95b599a..db2d71ab9d 100644
--- a/tests/qemu-iotests/241.out
+++ b/tests/qemu-iotests/241.out
@@ -2,6 +2,7 @@ QA output created by 241
 
 === Exporting unaligned raw image, natural alignment ===
 
+exports available: 1
   size:  1024
   min block: 1
 [{ "start": 0, "length": 1000, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
@@ -10,6 +11,7 @@ QA output created by 241
 
 === Exporting unaligned raw image, forced server sector alignment ===
 
+exports available: 1
   size:  1024
   min block: 512
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET}]
@@ -20,6 +22,7 @@ WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed
 
 === Exporting unaligned raw image, forced client sector alignment ===
 
+exports available: 1
   size:  1024
   min block: 1
 [{ "start": 0, "length": 1000, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
diff --git a/tests/qemu-iotests/common.filter b/tests/qemu-iotests/common.filter
index 25d1d22929..940c9884bd 100644
--- a/tests/qemu-iotests/common.filter
+++ b/tests/qemu-iotests/common.filter
@@ -308,6 +308,11 @@ _filter_nbd()
         -e 's#\(foo\|PORT/\?\|.sock\): Failed to .*$#\1#'
 }
 
+_filter_qemu_nbd_exports()
+{
+    grep '\(exports available\|size\|min block\|qemu-nbd\):'
+}
+
 _filter_qmp_empty_return()
 {
     grep -v '{"return": {}}'
-- 
2.34.1


