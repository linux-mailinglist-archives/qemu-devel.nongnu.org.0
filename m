Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28BC66E39C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 11:40:53 +0200 (CEST)
Received: from localhost ([::1]:43494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoPNk-0001rV-00
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 05:40:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41236)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hoPND-0000PW-J6
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 05:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hoPNC-000862-Ek
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 05:40:19 -0400
Received: from relay.sw.ru ([185.231.240.75]:57178)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hoPNA-0007vh-CF; Fri, 19 Jul 2019 05:40:18 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hoPN6-0004GH-1z; Fri, 19 Jul 2019 12:40:12 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Fri, 19 Jul 2019 12:40:01 +0300
Message-Id: <1563529204-3368-5-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1563529204-3368-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1563529204-3368-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v4 4/7] iotests: Valgrind fails with
 nonexistent directory
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
 andrey.shinkevich@virtuozzo.com, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Valgrind uses the exported variable TMPDIR and fails if the
directory does not exist. Let us exclude such a test case from
being run under the Valgrind and notify the user of it.

Suggested-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/qemu-iotests/051 | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/qemu-iotests/051 b/tests/qemu-iotests/051
index ce942a5..f8141ca 100755
--- a/tests/qemu-iotests/051
+++ b/tests/qemu-iotests/051
@@ -377,6 +377,10 @@ printf %b "qemu-io $device_id \"write -P 0x33 0 4k\"\ncommit $device_id\n" |
 $QEMU_IO -c "read -P 0x33 0 4k" "$TEST_IMG" | _filter_qemu_io
 
 # Using snapshot=on with a non-existent TMPDIR
+if [ "${VALGRIND_QEMU}" == "y" ]; then
+    _casenotrun "Valgrind needs a valid TMPDIR for itself"
+fi
+VALGRIND_QEMU="" \
 TMPDIR=/nonexistent run_qemu -drive driver=null-co,snapshot=on
 
 # Using snapshot=on together with read-only=on
-- 
1.8.3.1


