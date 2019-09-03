Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A124A69A1
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Sep 2019 15:22:34 +0200 (CEST)
Received: from localhost ([::1]:46020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i58lV-0007qj-9c
	for lists+qemu-devel@lfdr.de; Tue, 03 Sep 2019 09:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49912)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i58kI-0007F6-GA
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:21:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1i58kH-0006pj-Hu
 for qemu-devel@nongnu.org; Tue, 03 Sep 2019 09:21:18 -0400
Received: from relay.sw.ru ([185.231.240.75]:38740)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1i58kE-0006o6-OZ; Tue, 03 Sep 2019 09:21:14 -0400
Received: from [10.94.3.0] (helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1i58kB-0003ZI-DJ; Tue, 03 Sep 2019 16:21:11 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Date: Tue,  3 Sep 2019 16:21:10 +0300
Message-Id: <20190903132110.380933-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.18.0
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH] iotests: skip 232 when run tests as root
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

chmod a-w don't help under root, so skip the test in such case.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

 tests/qemu-iotests/232 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qemu-iotests/232 b/tests/qemu-iotests/232
index 2063f78876..da35a63d85 100755
--- a/tests/qemu-iotests/232
+++ b/tests/qemu-iotests/232
@@ -70,6 +70,12 @@ size=128M
 
 _make_test_img $size
 
+chmod a-w $TEST_IMG
+(echo test > $TEST_IMG) 2>/dev/null && \
+    _notrun "Readonly attribute is ignored, probably you run this test as" \
+            "root, which is unsupported."
+chmod a+w $TEST_IMG
+
 if [ -n "$TEST_IMG_FILE" ]; then
     TEST_IMG=$TEST_IMG_FILE
 fi
-- 
2.18.0


