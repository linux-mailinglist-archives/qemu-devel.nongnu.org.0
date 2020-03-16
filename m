Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609EC1864F1
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Mar 2020 07:15:10 +0100 (CET)
Received: from localhost ([::1]:34702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jDj1p-00012J-1n
	for lists+qemu-devel@lfdr.de; Mon, 16 Mar 2020 02:15:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51064)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jDitk-0007ex-Qy
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 02:06:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <vsementsov@virtuozzo.com>) id 1jDitj-0008Io-TX
 for qemu-devel@nongnu.org; Mon, 16 Mar 2020 02:06:48 -0400
Received: from relay.sw.ru ([185.231.240.75]:49924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <vsementsov@virtuozzo.com>)
 id 1jDitg-0007ML-JB; Mon, 16 Mar 2020 02:06:44 -0400
Received: from vovaso.qa.sw.ru ([10.94.3.0] helo=kvm.qa.sw.ru)
 by relay.sw.ru with esmtp (Exim 4.92.3)
 (envelope-from <vsementsov@virtuozzo.com>)
 id 1jDitY-0004fQ-DT; Mon, 16 Mar 2020 09:06:36 +0300
From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
To: qemu-block@nongnu.org
Subject: [PATCH 2/2] block/qcow2: zero data_file child after free
Date: Mon, 16 Mar 2020 09:06:31 +0300
Message-Id: <20200316060631.30052-3-vsementsov@virtuozzo.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200316060631.30052-1-vsementsov@virtuozzo.com>
References: <20200316060631.30052-1-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, den@openvz.org, vsementsov@virtuozzo.com,
 qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

data_file being NULL doesn't seem to be a correct state, but it's
better than dead pointer and simpler to debug.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index d44b45633d..6cdefe059f 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -1758,6 +1758,7 @@ static int coroutine_fn qcow2_do_open(BlockDriverState *bs, QDict *options,
     g_free(s->image_data_file);
     if (has_data_file(bs)) {
         bdrv_unref_child(bs, s->data_file);
+        s->data_file = NULL;
     }
     g_free(s->unknown_header_fields);
     cleanup_unknown_header_ext(bs);
@@ -2621,6 +2622,7 @@ static void qcow2_close(BlockDriverState *bs)
 
     if (has_data_file(bs)) {
         bdrv_unref_child(bs, s->data_file);
+        s->data_file = NULL;
     }
 
     qcow2_refcount_close(bs);
-- 
2.21.0


