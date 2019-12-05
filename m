Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C9EE21143AA
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Dec 2019 16:34:41 +0100 (CET)
Received: from localhost ([::1]:56339 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ict9M-0004xQ-9z
	for lists+qemu-devel@lfdr.de; Thu, 05 Dec 2019 10:34:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49037)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icswL-0000J9-7a
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:21:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1icswF-000642-4A
 for qemu-devel@nongnu.org; Thu, 05 Dec 2019 10:21:08 -0500
Received: from relay.sw.ru ([185.231.240.75]:43568)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1icswD-0005dS-57; Thu, 05 Dec 2019 10:21:06 -0500
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1icsvf-00007O-Nx; Thu, 05 Dec 2019 18:20:31 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 21/21] nbd: assert that Error** is not NULL in
 nbd_iter_channel_error
Date: Thu,  5 Dec 2019 18:20:19 +0300
Message-Id: <20191205152019.8454-22-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191205152019.8454-1-vsementsov@virtuozzo.com>
References: <20191205152019.8454-1-vsementsov@virtuozzo.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org, armbru@redhat.com, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The local_err parameter is not here to return information about
nbd_iter_channel_error failure. Instead it's assumed to be filled when
passed to the function. This is already stressed by its name
(local_err, instead of classic errp). Stress it additionally by
assertion.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nbd.c b/block/nbd.c
index 5f18f78a94..d085554f21 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -866,6 +866,7 @@ typedef struct NBDReplyChunkIter {
 static void nbd_iter_channel_error(NBDReplyChunkIter *iter,
                                    int ret, Error **local_err)
 {
+    assert(local_err && *local_err);
     assert(ret < 0);
 
     if (!iter->ret) {
-- 
2.21.0


