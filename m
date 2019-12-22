Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A253D128DC0
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 12:50:48 +0100 (CET)
Received: from localhost ([::1]:46834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iizl1-0007bU-5o
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 06:50:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iizZ8-0003Lj-UX
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iizZ7-0006ng-KF
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:30 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34971)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iizZ7-0004Ur-8u; Sun, 22 Dec 2019 06:38:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=8ovRW+9TPD4268Z3Rpebx38DdbkpGyk/zhXsYbm5FYM=; 
 b=c4pph57QMDwzk4sUF1xgi1WOw5cM9BvGF3klLFzCWHu+S3fw7JOwiOTaiz5+2OlN+Rz2oaRz1DNYlBaRs4Y0KumlHr0Zh2md7Peby1FwpDy8UUjP6zf6IqJhHNtSVMEQbcYimTwCqifEuCuxNSMWVc7oLdMHQO/rwQvoKdX7S44UulruorsP+vPBtgA+8uyjkf89vrtjxzPGATcHEYOrFmy5VtUVIUxeY5y3J2msTy846uokFZdZYmdmPMPikpwbSnWU239wE8aquH4Be76MvRKTBr8uiurZcZIOV7LPe8Rrar6m4kKnuG7ZgTFSlvnI3KWJwNWlxcqod7+snZLOQA==;
Received: from [80.30.182.172] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iizYV-0005dO-0L; Sun, 22 Dec 2019 12:37:51 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iizXu-0001WE-Sx; Sun, 22 Dec 2019 12:37:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 22/27] qcow2: Clear the L2 bitmap when allocating a
 compressed cluster
Date: Sun, 22 Dec 2019 12:37:03 +0100
Message-Id: <410dd2fcfc6d0a177e3aea669cbc8f665f0df20a.1577014346.git.berto@igalia.com>
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

Compressed clusters always have the bitmap part of the extended L2
entry set to 0.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index ed291a4042..af0f01621c 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -789,6 +789,9 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
     BLKDBG_EVENT(bs->file, BLKDBG_L2_UPDATE_COMPRESSED);
     qcow2_cache_entry_mark_dirty(s->l2_table_cache, l2_slice);
     set_l2_entry(s, l2_slice, l2_index, cluster_offset);
+    if (has_subclusters(s)) {
+        set_l2_bitmap(s, l2_slice, l2_index, 0);
+    }
     qcow2_cache_put(s->l2_table_cache, (void **) &l2_slice);
 
     *host_offset = cluster_offset & s->cluster_offset_mask;
-- 
2.20.1


