Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D34720C783
	for <lists+qemu-devel@lfdr.de>; Sun, 28 Jun 2020 13:11:39 +0200 (CEST)
Received: from localhost ([::1]:40674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jpVDm-0002OO-3l
	for lists+qemu-devel@lfdr.de; Sun, 28 Jun 2020 07:11:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jpV6U-0007bN-UO; Sun, 28 Jun 2020 07:04:06 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:42461)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jpV6M-0000Xf-1q; Sun, 28 Jun 2020 07:04:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=4RyZy5V804lVKxA8KqkjTU8F4A+oI5KX0VxrhskdhLk=; 
 b=f+r8Aw+cslmcBE4qlOflCN7U8B7ZCDnkbGgiQQ4nUIkcucJlV7EpcdSHTJue7Jaj3WD51Hwzl47RRCwgDN6nfLmXs3h/10egqctAb6gtWqFNBQRpMnTQWJIR2S1NwxO2mokU0P/gd2Rxv3WYJqw2C3fArCU8mT4wKARvEqgt3t+CPvrQmSs/bJbmPe0Gf91kx9i3EX9/x3ZwN+jTPqqB1lfpUtQFuQHyaORgdpD8TbhpcUuAnGMxQSvklE845QnC/Yf2kwefYJ6qL2SvbjSvX+47pynvf0SU2WuX+tRem6zpPlF9eIoGoIZQ3oqFtLnt9CHJIh4hjzPm9Tn6rJkuag==;
Received: from 26.red-79-158-236.dynamicip.rima-tde.net ([79.158.236.26]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jpV5Y-0002gq-7A; Sun, 28 Jun 2020 13:03:10 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jpV5I-00039P-9M; Sun, 28 Jun 2020 13:02:52 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 27/34] qcow2: Add subcluster support to handle_alloc_space()
Date: Sun, 28 Jun 2020 13:02:36 +0200
Message-Id: <e132af62337823a8f199f6ef15664874d33eb11f.1593342067.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1593342067.git.berto@igalia.com>
References: <cover.1593342067.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/28 07:03:08
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
X-Spam_action: no action
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Alberto Garcia <berto@igalia.com>, qemu-block@nongnu.org,
 Derek Su <dereksu@qnap.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bdrv_co_pwrite_zeroes() call here fills complete clusters with
zeroes, but it can happen that some subclusters are not part of the
write request or the copy-on-write. This patch makes sure that only
the affected subclusters are overwritten.

A potential improvement would be to also fill with zeroes the other
subclusters if we can guarantee that we are not overwriting existing
data. However this would waste more disk space, so we should first
evaluate if it's really worth doing.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
---
 block/qcow2.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/qcow2.c b/block/qcow2.c
index a3481cd85b..86258fbc22 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -2411,6 +2411,9 @@ static int handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
 
     for (m = l2meta; m != NULL; m = m->next) {
         int ret;
+        uint64_t start_offset = m->alloc_offset + m->cow_start.offset;
+        unsigned nb_bytes = m->cow_end.offset + m->cow_end.nb_bytes -
+            m->cow_start.offset;
 
         if (!m->cow_start.nb_bytes && !m->cow_end.nb_bytes) {
             continue;
@@ -2425,16 +2428,14 @@ static int handle_alloc_space(BlockDriverState *bs, QCowL2Meta *l2meta)
          * efficiently zero out the whole clusters
          */
 
-        ret = qcow2_pre_write_overlap_check(bs, 0, m->alloc_offset,
-                                            m->nb_clusters * s->cluster_size,
+        ret = qcow2_pre_write_overlap_check(bs, 0, start_offset, nb_bytes,
                                             true);
         if (ret < 0) {
             return ret;
         }
 
         BLKDBG_EVENT(bs->file, BLKDBG_CLUSTER_ALLOC_SPACE);
-        ret = bdrv_co_pwrite_zeroes(s->data_file, m->alloc_offset,
-                                    m->nb_clusters * s->cluster_size,
+        ret = bdrv_co_pwrite_zeroes(s->data_file, start_offset, nb_bytes,
                                     BDRV_REQ_NO_FALLBACK);
         if (ret < 0) {
             if (ret != -ENOTSUP && ret != -EAGAIN) {
-- 
2.20.1


