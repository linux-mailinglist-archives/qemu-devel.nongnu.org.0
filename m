Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 066449D36C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Aug 2019 17:53:17 +0200 (CEST)
Received: from localhost ([::1]:54972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2HIx-0000JS-HN
	for lists+qemu-devel@lfdr.de; Mon, 26 Aug 2019 11:53:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60884)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1i2HGN-00073E-JQ
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 11:50:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1i2HGM-0004TK-Ev
 for qemu-devel@nongnu.org; Mon, 26 Aug 2019 11:50:35 -0400
Received: from relay.sw.ru ([185.231.240.75]:44126)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1i2HGM-0004Ri-0f; Mon, 26 Aug 2019 11:50:34 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1i2HGJ-0006N5-DM; Mon, 26 Aug 2019 18:50:31 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Mon, 26 Aug 2019 18:50:28 +0300
Message-Id: <1566834628-485525-7-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1566834628-485525-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1566834628-485525-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v6 6/6] iotests: extend sleeping time under
 Valgrind
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, mreitz@redhat.com,
 andrey.shinkevich@virtuozzo.com, den@openvz.org, jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

To synchronize the time when QEMU is running longer under the Valgrind,
increase the sleeping time in the test 247.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 tests/qemu-iotests/247 | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/247 b/tests/qemu-iotests/247
index 546a794..c853b73 100755
--- a/tests/qemu-iotests/247
+++ b/tests/qemu-iotests/247
@@ -57,7 +57,11 @@ TEST_IMG="$TEST_IMG.4" _make_test_img $size
 {"execute":"block-commit",
  "arguments":{"device":"format-4", "top-node": "format-2", "base-node":"format-0", "job-id":"job0"}}
 EOF
-sleep 1
+if [ "${VALGRIND_QEMU}" == "y" ]; then
+    sleep 10
+else
+    sleep 1
+fi
 echo '{"execute":"quit"}'
 ) | $QEMU -qmp stdio -nographic -nodefaults \
     -blockdev file,node-name=file-0,filename=$TEST_IMG.0,auto-read-only=on \
-- 
1.8.3.1


