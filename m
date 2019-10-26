Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C84DFE5FD6
	for <lists+qemu-devel@lfdr.de>; Sun, 27 Oct 2019 00:15:03 +0200 (CEST)
Received: from localhost ([::1]:43018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iOUKs-0005Fr-NA
	for lists+qemu-devel@lfdr.de; Sat, 26 Oct 2019 18:15:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60290)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iOTZw-0000Vf-AF
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 17:26:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iOTZv-0005Qz-8m
 for qemu-devel@nongnu.org; Sat, 26 Oct 2019 17:26:32 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42504)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iOTZu-0005Ew-UY; Sat, 26 Oct 2019 17:26:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=q//BQvH+ej6Gl1Fi6fEopfSlEKcCs1jmZCmU1j0FoFk=; 
 b=Ynv/NO/bpoqX+emSleICMrUJ9dVQ0lJweyvh4RmBkJXgW+v4j/4s5L4tt47wfNJWb8CXmxi0N6AjSjAQEdIHaUeaLugCT8W3gYW+7I/YROPxjbLJvNZVChCeizdbZzdVAR5z3tgecv0k6urcvIznWYGVH4xICEDQkeB1BRM/15pHFOg89rXsAAj5bb00Rs7b/d0v7HtIpcNjrNjwvy9UxpjKYfpHhzZps+6+nqZaRcHdNkgfwtRNe+iEdXjBXOzN/PBB/w1lFPYfKI+30oDBcOryPDDJsOaU8ocZx+rMkWjgrhgSmZ5/RcdIgsDhnR1WtNARXyDhDJF7OSbTsEUKRg==;
Received: from 87-100-137-117.bb.dnainternet.fi ([87.100.137.117]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iOTZI-000464-W7; Sat, 26 Oct 2019 23:25:53 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iOTZ0-0001Pb-RW; Sun, 27 Oct 2019 00:25:34 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 18/26] qcow2: Add subcluster support to
 expand_zero_clusters_in_l1()
Date: Sun, 27 Oct 2019 00:25:20 +0300
Message-Id: <f99f051139f84a4d34bc52696aa2c2b125d5c3fd.1572125022.git.berto@igalia.com>
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

Two changes are needed in order to add subcluster support to this
function: deallocated clusters must have their bitmaps cleared, and
expanded clusters must have all the "subcluster allocated" bits set.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index aa3eb727a5..62f2a9fcc0 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -2036,6 +2036,7 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                         /* not backed; therefore we can simply deallocate the
                          * cluster */
                         set_l2_entry(s, l2_slice, j, 0);
+                        set_l2_bitmap(s, l2_slice, j, 0);
                         l2_dirty = true;
                         continue;
                     }
@@ -2102,6 +2103,7 @@ static int expand_zero_clusters_in_l1(BlockDriverState *bs, uint64_t *l1_table,
                 } else {
                     set_l2_entry(s, l2_slice, j, offset);
                 }
+                set_l2_bitmap(s, l2_slice, j, QCOW_L2_BITMAP_ALL_ALLOC);
                 l2_dirty = true;
             }
 
-- 
2.20.1


