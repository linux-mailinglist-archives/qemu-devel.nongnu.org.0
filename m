Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585A9E5FBA
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Oct 2019 23:35:02 +0200 (CEST)
Received: from localhost ([::1]:42524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOTi8-0001we-G0
	for lists+qemu-devel@lfdr.de; Sat, 26 Oct 2019 17:35:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60031)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iOTZj-00004s-EM
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 17:26:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iOTZi-0005Lk-Ca
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 17:26:19 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42487)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iOTZg-0005Et-8Y; Sat, 26 Oct 2019 17:26:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=ne3oe81fqJGBRCtc4R9D7qJYrDbbBX1uoz/3g2YvNFw=; 
 b=OU3u8AvrwrXEQnJZEvHfeGJnqoaTxsF0RCcEecH4Tt8ngQb8vTvobNmZl8pByabg0d7ufg53Nk9OXCL+gpasj2Au696NW35pz9dI3tnNWg/RonOxnC8HQiDJyQbnxJUpO9zij6WcpD3oUXS7xtNEbJ3j+dtRFX+b6E/LHcaoZZlrGKWSnTVveXB0PDGFf77dHUXL51X6XkGSf91wqIXRBN6tKKoIGTsA0tDWAAtOfFnZaRgIZXgsO4VfOKM5BuQ7VjRf+Ae/hCt3W8OLrrWyTBfzOT9aEkqLyR+5bOXetNVb720yD5PRzbUe97oGH8F/l4jNAyI7mBdvgBIgk4zA1Q==;
Received: from 87-100-137-117.bb.dnainternet.fi ([87.100.137.117]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iOTZJ-000468-6e; Sat, 26 Oct 2019 23:25:53 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iOTZ0-0001Ph-W7; Sun, 27 Oct 2019 00:25:35 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 21/26] qcow2: Clear the L2 bitmap when allocating a
 compressed cluster
Date: Sun, 27 Oct 2019 00:25:23 +0300
Message-Id: <cb9f9b7784eba384b84de18262242e8c0f0aae16.1572125022.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1572125022.git.berto@igalia.com>
References: <cover.1572125022.git.berto@igalia.com>
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

Compressed clusters always have the bitmap part of the extended L2
entry set to 0.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index acb7226e03..3ba8a98073 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -783,6 +783,7 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
     BLKDBG_EVENT(bs->file, BLKDBG_L2_UPDATE_COMPRESSED);
     qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
     set_l2_entry(s, l2_slice, l2_index, cluster_offset);
+    set_l2_bitmap(s, l2_slice, l2_index, 0);
     qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
 
     *host_offset = cluster_offset & s->cluster_offset_mask;
-- 
2.20.1


