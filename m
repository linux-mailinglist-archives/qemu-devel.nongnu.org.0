Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC11D360EE8
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 17:24:38 +0200 (CEST)
Received: from localhost ([::1]:42394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX3rB-0005wM-SS
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 11:24:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lX3pO-0004NE-SX
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lX3pH-0008CE-0j
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 11:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618500157;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EoWyZ2dB1Ly3LvFvZQ+QSc42Tvdp2sayrjC5gsGvwNY=;
 b=Cjd0klJZny0tdzzw/f8q1jMmb7KdS7DWM2Q8uQmgyE+ZGJsEVt9FTmBFdn+ggv/OeUIGZQ
 07gDeg4HfG/i2ovK8jhvHMl8DtoDAK358B9Xny5yG0cGyoNKrEifP4JavrAu6iAocC8mus
 SAMFcbe3Lkof5RwXsAfFt1P7u/h1qHA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-RDeLtA0fOcqzU_GvQtpSIQ-1; Thu, 15 Apr 2021 11:22:36 -0400
X-MC-Unique: RDeLtA0fOcqzU_GvQtpSIQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 59B531020C41;
 Thu, 15 Apr 2021 15:22:35 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-169.ams2.redhat.com [10.36.113.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47241369A;
 Thu, 15 Apr 2021 15:22:26 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 1/2] iotests: Test qemu-img convert of zeroed data cluster
Date: Thu, 15 Apr 2021 17:22:13 +0200
Message-Id: <20210415152214.279844-2-kwolf@redhat.com>
In-Reply-To: <20210415152214.279844-1-kwolf@redhat.com>
References: <20210415152214.279844-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, pl@kamp.de, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This demonstrates what happens when the block status changes in
sub-min_sparse granularity, but all of the parts are zeroed out. The
alignment logic in is_allocated_sectors() prevents that the target image
remains fully sparse as expected, but turns it into a data cluster of
explicit zeros.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 tests/qemu-iotests/122     |  1 +
 tests/qemu-iotests/122.out | 10 ++++++++--
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/122 b/tests/qemu-iotests/122
index 5d550ed13e..7a213a4df9 100755
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
index 3a3e121d57..dcc44a2304 100644
--- a/tests/qemu-iotests/122.out
+++ b/tests/qemu-iotests/122.out
@@ -192,6 +192,8 @@ wrote 1024/1024 bytes at offset 8192
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 wrote 1024/1024 bytes at offset 17408
 1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
+wrote 1024/1024 bytes at offset 66560
+1 KiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
 
 convert -S 4k
 [{ "start": 0, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
@@ -199,7 +201,9 @@ convert -S 4k
 { "start": 8192, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
 { "start": 12288, "length": 4096, "depth": 0, "zero": true, "data": false},
 { "start": 16384, "length": 4096, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 20480, "length": 67088384, "depth": 0, "zero": true, "data": false}]
+{ "start": 20480, "length": 46080, "depth": 0, "zero": true, "data": false},
+{ "start": 66560, "length": 1024, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
+{ "start": 67584, "length": 67041280, "depth": 0, "zero": true, "data": false}]
 
 convert -c -S 4k
 [{ "start": 0, "length": 1024, "depth": 0, "zero": false, "data": true},
@@ -211,7 +215,9 @@ convert -c -S 4k
 
 convert -S 8k
 [{ "start": 0, "length": 24576, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 24576, "length": 67084288, "depth": 0, "zero": true, "data": false}]
+{ "start": 24576, "length": 41984, "depth": 0, "zero": true, "data": false},
+{ "start": 66560, "length": 1024, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
+{ "start": 67584, "length": 67041280, "depth": 0, "zero": true, "data": false}]
 
 convert -c -S 8k
 [{ "start": 0, "length": 1024, "depth": 0, "zero": false, "data": true},
-- 
2.30.2


