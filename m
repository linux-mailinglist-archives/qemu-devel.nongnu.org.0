Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383011264F5
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 15:38:18 +0100 (CET)
Received: from localhost ([::1]:42758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihwwT-0003r1-26
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 09:38:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60237)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihwsi-0007Zo-2f
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:34:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1ihwsg-0002RN-4Q
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 09:34:23 -0500
Received: from relay.sw.ru ([185.231.240.75]:38590)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihwsf-0002FH-PK; Thu, 19 Dec 2019 09:34:21 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1ihwsZ-0006jF-UG; Thu, 19 Dec 2019 17:34:16 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] qapi/block: fix nbd-server-add spec
Date: Thu, 19 Dec 2019 17:34:15 +0300
Message-Id: <20191219143415.28490-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, qemu-block@nongnu.org, armbru@redhat.com,
 mreitz@redhat.com, nsoffer@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"NAME" here may be interpreted like it should match @name, which is
export name. But it was never mentioned in such way. Make it obvious,
that actual "<dirty-bitmap-export-name>" (see docs/interop/nbd.txt)
will match @bitmap parameter.

Fixes: 5fcbeb06812685a2
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---

Hi all.

This patch follows discussion on Nir's patch
 [PATCH] block: nbd: Fix dirty bitmap context name
 ( https://lists.gnu.org/archive/html/qemu-devel/2019-12/msg04309.html )

Let's just fix qapi spec now. 

 qapi/block.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/block.json b/qapi/block.json
index 145c268bb6..8042ef78f0 100644
--- a/qapi/block.json
+++ b/qapi/block.json
@@ -255,7 +255,8 @@
 
 # @bitmap: Also export the dirty bitmap reachable from @device, so the
 #          NBD client can use NBD_OPT_SET_META_CONTEXT with
-#          "qemu:dirty-bitmap:NAME" to inspect the bitmap. (since 4.0)
+#          "qemu:dirty-bitmap:BITMAP" to inspect the bitmap (BITMAP here
+#          matches @bitmap parameter). (since 4.0)
 #
 # Returns: error if the server is not running, or export with the same name
 #          already exists.
-- 
2.21.0


