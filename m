Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6799B380EC4
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:22:54 +0200 (CEST)
Received: from localhost ([::1]:57172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbWX-0006JK-C0
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawm-0006CO-Lg
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31642)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawj-00062Y-HQ
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010752;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jMd50PhVZcUVsRJNmfFXojjuhVL/jJyaaZsXEE0ZAl0=;
 b=Z41UsmVmWd7uGoiKhJDl3L2wSC3jLXMlxEJ29YPR9QuU4sk5L49oQPtoDUlSCjCzROHAf5
 m0/qFO42yuwau/s5DVeNF4E3sfzlG/xRiO30mEH4VBy0y80zoFHsZ0Sf7SdLfXsbx00JmN
 PqrpxdBUReoxM2OQIaagk4Ihj6uh4IY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-504-sWfzM-wVPmKly2U6HLqbUg-1; Fri, 14 May 2021 12:45:48 -0400
X-MC-Unique: sWfzM-wVPmKly2U6HLqbUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E782C800D62;
 Fri, 14 May 2021 16:45:47 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F3385D9CD;
 Fri, 14 May 2021 16:45:47 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 15/19] test-write-threshold: rewrite
 test_threshold_(not_)trigger tests
Date: Fri, 14 May 2021 18:45:10 +0200
Message-Id: <20210514164514.1057680-16-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

These tests use bdrv_write_threshold_exceeded() API, which is used only
for test (since pre-previous commit). Better is testing real API, which
is used in block.c as well.

So, let's call bdrv_write_threshold_check_write(), and check is
bs->write_threshold_offset cleared or not (it's cleared iff threshold
triggered).

Also we get rid of BdrvTrackedRequest use here. Note, that paranoiac
bdrv_check_request() calls were added in 8b1170012b1 to protect
BdrvTrackedRequest. Drop them now.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210506090621.11848-4-vsementsov@virtuozzo.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 tests/unit/test-write-threshold.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/tests/unit/test-write-threshold.c b/tests/unit/test-write-threshold.c
index fc1c45a2eb..fd40a815b8 100644
--- a/tests/unit/test-write-threshold.c
+++ b/tests/unit/test-write-threshold.c
@@ -55,41 +55,27 @@ static void test_threshold_multi_set_get(void)
 
 static void test_threshold_not_trigger(void)
 {
-    uint64_t amount = 0;
     uint64_t threshold = 4 * 1024 * 1024;
     BlockDriverState bs;
-    BdrvTrackedRequest req;
 
     memset(&bs, 0, sizeof(bs));
-    memset(&req, 0, sizeof(req));
-    req.offset = 1024;
-    req.bytes = 1024;
-
-    bdrv_check_request(req.offset, req.bytes, &error_abort);
 
     bdrv_write_threshold_set(&bs, threshold);
-    amount = bdrv_write_threshold_exceeded(&bs, &req);
-    g_assert_cmpuint(amount, ==, 0);
+    bdrv_write_threshold_check_write(&bs, 1024, 1024);
+    g_assert_cmpuint(bdrv_write_threshold_get(&bs), ==, threshold);
 }
 
 
 static void test_threshold_trigger(void)
 {
-    uint64_t amount = 0;
     uint64_t threshold = 4 * 1024 * 1024;
     BlockDriverState bs;
-    BdrvTrackedRequest req;
 
     memset(&bs, 0, sizeof(bs));
-    memset(&req, 0, sizeof(req));
-    req.offset = (4 * 1024 * 1024) - 1024;
-    req.bytes = 2 * 1024;
-
-    bdrv_check_request(req.offset, req.bytes, &error_abort);
 
     bdrv_write_threshold_set(&bs, threshold);
-    amount = bdrv_write_threshold_exceeded(&bs, &req);
-    g_assert_cmpuint(amount, >=, 1024);
+    bdrv_write_threshold_check_write(&bs, threshold - 1024, 2 * 1024);
+    g_assert_cmpuint(bdrv_write_threshold_get(&bs), ==, 0);
 }
 
 typedef struct TestStruct {
-- 
2.31.1


