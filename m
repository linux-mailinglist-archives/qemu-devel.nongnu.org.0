Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1887AD40
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 18:07:39 +0200 (CEST)
Received: from localhost ([::1]:34454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsUf4-0005qk-I8
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 12:07:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49223)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hsUZd-0005Rr-OD
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 12:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hsUZb-0005Zg-Hl
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 12:02:01 -0400
Received: from relay.sw.ru ([185.231.240.75]:53300)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hsUZZ-0005Y9-M8; Tue, 30 Jul 2019 12:01:57 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hsUZS-0001RG-Fs; Tue, 30 Jul 2019 19:01:50 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Tue, 30 Jul 2019 19:01:37 +0300
Message-Id: <1564502498-805893-3-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1564502498-805893-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1564502498-805893-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH 2/3] tests: Fix uninitialized byte in
 test_visitor_in_fuzz
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
Cc: vsementsov@virtuozzo.com, berto@igalia.com, ehabkost@redhat.com,
 kvm@vger.kernel.org, mtosatti@redhat.com, mdroth@linux.vnet.ibm.com,
 armbru@redhat.com, andrey.shinkevich@virtuozzo.com, den@openvz.org,
 pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

One byte in the local buffer stays uninitialized, at least with the
first iteration, because of the double decrement in the
test_visitor_in_fuzz(). This is what Valgrind does not like and not
critical for the test itself. So, reduce the number of the memory
issues reports.

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 tests/test-string-input-visitor.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/test-string-input-visitor.c b/tests/test-string-input-visitor.c
index 34b54df..5418e08 100644
--- a/tests/test-string-input-visitor.c
+++ b/tests/test-string-input-visitor.c
@@ -444,16 +444,14 @@ static void test_visitor_in_fuzz(TestInputVisitorData *data,
     char buf[10000];
 
     for (i = 0; i < 100; i++) {
-        unsigned int j;
+        unsigned int j, k;
 
         j = g_test_rand_int_range(0, sizeof(buf) - 1);
 
         buf[j] = '\0';
 
-        if (j != 0) {
-            for (j--; j != 0; j--) {
-                buf[j - 1] = (char)g_test_rand_int_range(0, 256);
-            }
+        for (k = 0; k != j; k++) {
+            buf[k] = (char)g_test_rand_int_range(0, 256);
         }
 
         v = visitor_input_test_init(data, buf);
-- 
1.8.3.1


