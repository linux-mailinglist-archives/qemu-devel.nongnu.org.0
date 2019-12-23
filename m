Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFD3129264
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Dec 2019 08:44:58 +0100 (CET)
Received: from localhost ([::1]:54326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ijIOf-00010F-64
	for lists+qemu-devel@lfdr.de; Mon, 23 Dec 2019 02:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59953)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ijINU-0000UX-2h
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 02:43:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ijINP-00038d-Lp
 for qemu-devel@nongnu.org; Mon, 23 Dec 2019 02:43:43 -0500
Received: from relay.sw.ru ([185.231.240.75]:40842)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ijINM-0002lb-Pb; Mon, 23 Dec 2019 02:43:37 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ijING-0000ky-98; Mon, 23 Dec 2019 10:43:30 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH] iotests: fix usage -machine accel= together with -accel option
Date: Mon, 23 Dec 2019 10:43:29 +0300
Message-Id: <20191223074329.21262-1-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [fuzzy]
X-Received-From: 185.231.240.75
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
Cc: kwolf@redhat.com, pbonzini@redhat.com, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 6f6e1698a68ceb made these options incompatible, but it breaks
iotests:
  -accel qtest comes from QEMUQtestMachine
  and
  -machine accel=qtest comes from QEMU_OPTIONS

After this patch, -accel may still be duplicated, but this is less
invasive.

Also, fix extra comma in comment, added by the same 6f6e1698a68ceb

Fixes: 6f6e1698a68ceb
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 vl.c                     | 2 +-
 tests/qemu-iotests/check | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/vl.c b/vl.c
index 86474a55c9..9fb859969c 100644
--- a/vl.c
+++ b/vl.c
@@ -2779,7 +2779,7 @@ static void configure_accelerators(const char *progname)
         for (tmp = accel_list; !accel_initialised && tmp && *tmp; tmp++) {
             /*
              * Filter invalid accelerators here, to prevent obscenities
-             * such as "-machine accel=tcg,,thread=single".
+             * such as "-machine accel=tcg,thread=single".
              */
             if (accel_find(*tmp)) {
                 qemu_opts_parse_noisily(qemu_find_opts("accel"), *tmp, true);
diff --git a/tests/qemu-iotests/check b/tests/qemu-iotests/check
index 90970b0549..2890785a10 100755
--- a/tests/qemu-iotests/check
+++ b/tests/qemu-iotests/check
@@ -587,13 +587,13 @@ export QEMU_PROG="$(type -p "$QEMU_PROG")"
 
 case "$QEMU_PROG" in
     *qemu-system-arm|*qemu-system-aarch64)
-        export QEMU_OPTIONS="-nodefaults -display none -machine virt,accel=qtest"
+        export QEMU_OPTIONS="-nodefaults -display none -machine virt -accel qtest"
         ;;
     *qemu-system-tricore)
-        export QEMU_OPTIONS="-nodefaults -display none -machine tricore_testboard,accel=qtest"
+        export QEMU_OPTIONS="-nodefaults -display none -machine tricore_testboard -accel qtest"
         ;;
     *)
-        export QEMU_OPTIONS="-nodefaults -display none -machine accel=qtest"
+        export QEMU_OPTIONS="-nodefaults -display none -accel qtest"
         ;;
 esac
 
-- 
2.21.0


