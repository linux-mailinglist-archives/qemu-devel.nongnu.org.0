Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7B77128DBF
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 12:50:00 +0100 (CET)
Received: from localhost ([::1]:46828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iizkF-0006uH-6a
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 06:49:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41524)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iizYp-0002nz-HD
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iizYo-0005cp-8I
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:11 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34980)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iizYn-0004Up-Db; Sun, 22 Dec 2019 06:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=1HJa94babNCY+tS0ic1Tyr09nP5Ql5uC87OGgfrBtTg=; 
 b=jWvVW+tMqs6gvQhMvGhtbeXe1MullaeJSVOxjMbrKzbOUkQDH4HR31NTw29P7+rxtp0efcJAaZ9/lt+NflvsZBJsOxEDubhQSnvHmu6aA7gwJHif8e3fxr/rkHJotIPMPmcRkPiEGwy5iXDMZVIXfHs20tQtoTB+AVDE2wq91dizFymGAvZIH/EzfCwRc9KNfFlOGRfWzwDCYovVP+zFmlJn7WDMHdul//5JNALtr6ypLPHOXvio43VX6I1o57flA+i3Zi+CUFohGeJqZ42+c7l0BluT2KYnVHb5iYZFfZBGLYVBpAcv0v3I/KyrxM4CgTPej4WfO9iMUhqg46JtzQ==;
Received: from [80.30.182.172] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iizYU-0005dJ-SX; Sun, 22 Dec 2019 12:37:51 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iizXu-0001W0-OU; Sun, 22 Dec 2019 12:37:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 17/27] qcow2: Add subcluster support to
 discard_in_l2_slice()
Date: Sun, 22 Dec 2019 12:36:58 +0100
Message-Id: <69a823b113145f6b2187ed6cfd4291e55c92c5f6.1577014346.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1577014346.git.berto@igalia.com>
References: <cover.1577014346.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: Kevin Wolf <kwolf@redhat.com>, Anton Nefedov <anton.nefedov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "Denis V . Lunev" <den@openvz.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Setting the QCOW_OFLAG_ZERO bit of the L2 entry is forbidden if an
image has subclusters. Instead, the individual 'all zeroes' bits must
be used.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 70b0aaa00a..207f670c94 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1790,7 +1790,11 @@ static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
 
         /* First remove L2 entries */
         qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
-        if (!full_discard && s->qcow_version >= 3) {
+        if (has_subclusters(s)) {
+            set_l2_entry(s, l2_slice, l2_index + i, 0);
+            set_l2_bitmap(s, l2_slice, l2_index + i,
+                          full_discard ? 0 : QCOW_L2_BITMAP_ALL_ZEROES);
+        } else if (!full_discard && s->qcow_version >= 3) {
             set_l2_entry(s, l2_slice, l2_index + i, QCOW_OFLAG_ZERO);
         } else {
             set_l2_entry(s, l2_slice, l2_index + i, 0);
-- 
2.20.1


