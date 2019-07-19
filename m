Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A446E399
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Jul 2019 11:40:50 +0200 (CEST)
Received: from localhost ([::1]:43490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoPNh-0001mb-Jo
	for lists+qemu-devel@lfdr.de; Fri, 19 Jul 2019 05:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41227)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hoPND-0000PT-CX
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 05:40:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <andrey.shinkevich@virtuozzo.com>) id 1hoPNC-00085s-Cu
 for qemu-devel@nongnu.org; Fri, 19 Jul 2019 05:40:19 -0400
Received: from relay.sw.ru ([185.231.240.75]:57188)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hoPNA-0007wv-D2; Fri, 19 Jul 2019 05:40:18 -0400
Received: from [172.16.25.136] (helo=localhost.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92)
 (envelope-from <andrey.shinkevich@virtuozzo.com>)
 id 1hoPN7-0004GH-0A; Fri, 19 Jul 2019 12:40:13 +0300
From: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
To: qemu-devel@nongnu.org,
	qemu-block@nongnu.org
Date: Fri, 19 Jul 2019 12:40:04 +0300
Message-Id: <1563529204-3368-8-git-send-email-andrey.shinkevich@virtuozzo.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1563529204-3368-1-git-send-email-andrey.shinkevich@virtuozzo.com>
References: <1563529204-3368-1-git-send-email-andrey.shinkevich@virtuozzo.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 185.231.240.75
Subject: [Qemu-devel] [PATCH v4 7/7] block/nbd: NBDReply is used being
 uninitialized
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

In case nbd_co_receive_one_chunk() fails in
nbd_reply_chunk_iter_receive(), 'NBDReply reply' parameter is used in
the check nbd_reply_is_simple() without being initialized. The iotest
083 does not pass under the Valgrind: $./check -nbd -valgrind 083.
The alternative solution is to swap the operands in the condition:
'if (s->quit || nbd_reply_is_simple(reply))'

Signed-off-by: Andrey Shinkevich <andrey.shinkevich@virtuozzo.com>
---
 block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nbd.c b/block/nbd.c
index 81edabb..8480ad4 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -786,7 +786,7 @@ static int nbd_co_receive_cmdread_reply(BDRVNBDState *s, uint64_t handle,
                                         int *request_ret, Error **errp)
 {
     NBDReplyChunkIter iter;
-    NBDReply reply;
+    NBDReply reply = {};
     void *payload = NULL;
     Error *local_err = NULL;
 
-- 
1.8.3.1


