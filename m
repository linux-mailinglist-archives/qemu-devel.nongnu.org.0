Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5161E1360F0
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jan 2020 20:17:54 +0100 (CET)
Received: from localhost ([::1]:36528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ipdJZ-000555-26
	for lists+qemu-devel@lfdr.de; Thu, 09 Jan 2020 14:17:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39315)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1ipdGC-0003WV-T3
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 14:14:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1ipdGB-0007J6-EI
 for qemu-devel@nongnu.org; Thu, 09 Jan 2020 14:14:24 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:58342)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1ipdG9-0006BE-Fv; Thu, 09 Jan 2020 14:14:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=rYrNjyo1odRCvrRwXrISC+TPRRtheFI6QJmzzrZY1Qw=; 
 b=WYIM4E/o1s/61ArO3ZGiKM2aUsZZdkh1ptkOJe+Aq06Oy664J9fVmRhdrhXBAfcdNmIkafeLWlUouiDQQEIcpX4AdK1pnHcfaLoNnBftwepjRTnYB8KpDxmtzjTc8anRswXWxTIdDBZqeGdZmxnP4Byjizq5mrcZwb6fCMFABz59UylZVURzeH/W2D0FIng4H6pe52Z6MeqwWNqnWgSPoikyTJKinvUn9qNGJJVEtaVEHiQHk6Jx0i5bFSzDaP25k59yvDW3HPbFs5oRSkP+JczgUGeSa6yphGnc91AaVIzAasbjVd6d6/ll1wUeEFUB0u/glojuO3NToLONTbE5DQ==;
Received: from [213.99.255.143] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1ipdFp-0006Ml-Nu; Thu, 09 Jan 2020 20:14:01 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1ipdF0-0005R5-Nf; Thu, 09 Jan 2020 20:13:10 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/4] qcow2: Tighten cluster_offset alignment assertions
Date: Thu,  9 Jan 2020 20:13:01 +0100
Message-Id: <fe47feb4fc96cf1242ba9e9431f910aef575cf16.1578596897.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1578596897.git.berto@igalia.com>
References: <cover.1578596897.git.berto@igalia.com>
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

qcow2_alloc_cluster_offset() and qcow2_get_cluster_offset() always
return offsets that are cluster-aligned so don't just check that they
are sector-aligned.

The check in qcow2_co_preadv_task() is also replaced by an assertion
for the same reason.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index 848a6c5182..783d2b9578 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2175,10 +2175,7 @@ static coroutine_fn int qcow2_co_preadv_task(BlockDriverState *bs,
                                           offset, bytes, qiov, qiov_offset);
 
     case QCOW2_CLUSTER_NORMAL:
-        if ((file_cluster_offset & 511) != 0) {
-            return -EIO;
-        }
-
+        assert(QEMU_IS_ALIGNED(file_cluster_offset, s->cluster_size));
         if (bs->encrypted) {
             return qcow2_co_preadv_encrypted(bs, file_cluster_offset,
                                              offset, bytes, qiov, qiov_offset);
@@ -2514,7 +2511,7 @@ static coroutine_fn int qcow2_co_pwritev_part(
             goto out_locked;
         }
 
-        assert((cluster_offset & 511) == 0);
+        assert(QEMU_IS_ALIGNED(cluster_offset, s->cluster_size));
 
         ret = qcow2_pre_write_overlap_check(bs, 0,
                                             cluster_offset + offset_in_cluster,
@@ -3904,7 +3901,7 @@ qcow2_co_copy_range_to(BlockDriverState *bs,
             goto fail;
         }
 
-        assert((cluster_offset & 511) == 0);
+        assert(QEMU_IS_ALIGNED(cluster_offset, s->cluster_size));
 
         ret = qcow2_pre_write_overlap_check(bs, 0,
                 cluster_offset + offset_in_cluster, cur_bytes, true);
-- 
2.20.1


