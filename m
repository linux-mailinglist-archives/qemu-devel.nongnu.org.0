Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1A248EB80
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 15:18:57 +0100 (CET)
Received: from localhost ([::1]:39140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8NPs-0004oM-2G
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 09:18:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0e-0003H2-Iv
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1n8N0c-0000NL-Tw
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 08:52:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642168370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I4aq1SO/dnyF/nSA0Mkl9gIarZVffuIuzcCCoM6+wKE=;
 b=CwkMjYIpw/2+XaMAD/Gbyzg7DhF12K+Re59rx8VJBvIHRe7ecoeegrrff7uvDti8ZN+Ecd
 /sEpL1NZ49RDtkDGXjneSdBtA86hT3qAJS9/7ul36wIS1AWz3YpMxeTbK+CX7QUTDehKb0
 p7UrEU5gOa8WhX6yCX5zOLxP89U0loA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-422-fQLYUzfuNPmfx0a1WR0rkw-1; Fri, 14 Jan 2022 08:52:49 -0500
X-MC-Unique: fQLYUzfuNPmfx0a1WR0rkw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C4881023F4E;
 Fri, 14 Jan 2022 13:52:48 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1BB38105B20E;
 Fri, 14 Jan 2022 13:52:46 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 13/16] iotests: Test qemu-img convert of zeroed data cluster
Date: Fri, 14 Jan 2022 14:52:23 +0100
Message-Id: <20220114135226.185407-14-kwolf@redhat.com>
In-Reply-To: <20220114135226.185407-1-kwolf@redhat.com>
References: <20220114135226.185407-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This demonstrates what happens when the block status changes in
sub-min_sparse granularity, but all of the parts are zeroed out. The
alignment logic in is_allocated_sectors() prevents that the target image
remains fully sparse as expected, but turns it into a data cluster of
explicit zeros.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20211217164654.1184218-2-vsementsov@virtuozzo.com>
Tested-by: Peter Lieven <pl@kamp.de>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/122     |  1 +
 tests/qemu-iotests/122.out | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/122 b/tests/qemu-iotests/122
index efb260d822..be0f6b79e5 100755
--- a/tests/qemu-iotests/122
+++ b/tests/qemu-iotests/122
@@ -251,6 +251,7 @@ $QEMU_IO -c "write -P 0 0 64k" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_test
 $QEMU_IO -c "write 0 1k" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_testdir
 $QEMU_IO -c "write 8k 1k" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_testdir
 $QEMU_IO -c "write 17k 1k" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_testdir
+$QEMU_IO -c "write -P 0 65k 1k" "$TEST_IMG" 2>&1 | _filter_qemu_io | _filter_testdir
 
 for min_sparse in 4k 8k; do
     echo
diff --git a/tests/qemu-iotests/122.out b/tests/qemu-iotests/122.out
index 8fbdac2b39..69b8e8b803 100644
--- a/tests/qemu-iotests/122.out
+++ b/tests/qemu-iotests/122.out
@@ -192,6 +192,8 @@ wrote 1024/1024 bytes at offset 8192
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 1024/1024 bytes at offset 17408
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 1024/1024 bytes at offset 66560
+1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 convert -S 4k
 [{ "start": 0, "length": 4096, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
@@ -199,7 +201,9 @@ convert -S 4k
 { "start": 8192, "length": 4096, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
 { "start": 12288, "length": 4096, "depth": 0, "present": false, "zero": true, "data": false},
 { "start": 16384, "length": 4096, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 20480, "length": 67088384, "depth": 0, "present": false, "zero": true, "data": false}]
+{ "start": 20480, "length": 46080, "depth": 0, "present": false, "zero": true, "data": false},
+{ "start": 66560, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
+{ "start": 67584, "length": 67041280, "depth": 0, "present": false, "zero": true, "data": false}]
 
 convert -c -S 4k
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true},
@@ -211,7 +215,9 @@ convert -c -S 4k
 
 convert -S 8k
 [{ "start": 0, "length": 24576, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 24576, "length": 67084288, "depth": 0, "present": false, "zero": true, "data": false}]
+{ "start": 24576, "length": 41984, "depth": 0, "present": false, "zero": true, "data": false},
+{ "start": 66560, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true, "offset": OFFSET},
+{ "start": 67584, "length": 67041280, "depth": 0, "present": false, "zero": true, "data": false}]
 
 convert -c -S 8k
 [{ "start": 0, "length": 1024, "depth": 0, "present": true, "zero": false, "data": true},
-- 
2.31.1


