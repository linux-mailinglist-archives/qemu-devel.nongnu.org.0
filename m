Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C98B3040D8
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:50:19 +0100 (CET)
Received: from localhost ([::1]:50860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pfc-0007A3-II
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PE6-00013y-KW
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20131)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PE4-0006T7-R4
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670908;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SGpXupDLQ4IQxpPTPRwr6ATQZsaS/l6KWMN0wT4WftU=;
 b=DEZO8+rUAaNQUufkFZVU6t2FnisstxiWmoBf/ew6Y2R5thVs6/eneVdg+ozkmtIlTE/A4n
 bsGVAyo7MKbgk6RXKvTW0U9E+KUQ+REARilyC+IHdJENrgKNaZJq6XjS94USAcaCfRZbuX
 oWsxjAPA/sJSKs/ckQ4AZ6lhcoTzKMM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-j0u5SOr-Oc24ym_BdAz9uA-1; Tue, 26 Jan 2021 09:21:46 -0500
X-MC-Unique: j0u5SOr-Oc24ym_BdAz9uA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F2419107ACE8;
 Tue, 26 Jan 2021 14:21:44 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 94BF95C1A3;
 Tue, 26 Jan 2021 14:21:44 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 38/53] iotests: 185: prepare for backup over block-copy
Date: Tue, 26 Jan 2021 15:20:01 +0100
Message-Id: <20210126142016.806073-39-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The further change of moving backup to be a one block-copy call will
make copying chunk-size and cluster-size two separate things. So, even
with 64k cluster sized qcow2 image, default chunk would be 1M.
185 test however assumes, that with speed limited to 64K, one iteration
would result in offset=64K. It will change, as first iteration would
result in offset=1M independently of speed.

So, let's explicitly specify, what test wants: set max-chunk to 64K, so
that one iteration is 64K. Note, that we don't need to limit
max-workers, as block-copy rate limiter will handle the situation and
wouldn't start new workers when speed limit is obviously reached.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-13-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/qemu-iotests/185     | 3 ++-
 tests/qemu-iotests/185.out | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/qemu-iotests/185 b/tests/qemu-iotests/185
index 7bc8fe5767..f2ec5c5ceb 100755
--- a/tests/qemu-iotests/185
+++ b/tests/qemu-iotests/185
@@ -183,7 +183,8 @@ _send_qemu_cmd $h \
                       'target': '$TEST_IMG.copy',
                       'format': '$IMGFMT',
                       'sync': 'full',
-                      'speed': 65536 } }" \
+                      'speed': 65536,
+                      'x-perf': {'max-chunk': 65536} } }" \
     "return"
 
 # If we don't sleep here 'quit' command races with disk I/O
diff --git a/tests/qemu-iotests/185.out b/tests/qemu-iotests/185.out
index eab55d22bf..9dedc8eacb 100644
--- a/tests/qemu-iotests/185.out
+++ b/tests/qemu-iotests/185.out
@@ -88,7 +88,8 @@ Formatting 'TEST_DIR/t.qcow2.copy', fmt=qcow2 cluster_size=65536 extended_l2=off
                       'target': 'TEST_DIR/t.IMGFMT.copy',
                       'format': 'IMGFMT',
                       'sync': 'full',
-                      'speed': 65536 } }
+                      'speed': 65536,
+                      'x-perf': { 'max-chunk': 65536 } } }
 Formatting 'TEST_DIR/t.qcow2.copy', fmt=qcow2 cluster_size=65536 extended_l2=off compression_type=zlib size=67108864 lazy_refcounts=off refcount_bits=16
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id": "disk"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP}, "event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id": "disk"}}
-- 
2.29.2


