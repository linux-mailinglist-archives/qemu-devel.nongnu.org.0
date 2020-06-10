Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDFE1F57B2
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Jun 2020 17:23:23 +0200 (CEST)
Received: from localhost ([::1]:51956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jj2ZW-0004cy-61
	for lists+qemu-devel@lfdr.de; Wed, 10 Jun 2020 11:23:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jj2H0-0002o6-TR; Wed, 10 Jun 2020 11:04:15 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:58283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jj2Gs-0006ws-OY; Wed, 10 Jun 2020 11:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=jdA6WaY7hKoW016heKIZFDBwkSoL0B2SxxYO4r5/VA8=; 
 b=eZV4qFckifDjt4FTfYAVFCQDiJ8ALLbuca/d4A/JvZDfEFVb7A0slXps0tuoDWVey5MA5Qhr/nmeQi96pbLIYH+xSvs1eWcUuwIbxdq1TgTAZpq8mUGkCgNyN5XY4gAJAhXzjjjbBmpUR/5XFkNvFaj/BFLYXfqjpon/nPJVRGFqxB+7Ybma0KB3xJ7lxfmYWFhcbtGWP0CUx6Mc8vWQW71edYe9wgLVwSt9iiNsw9DVlktuf7833n84sAQwiHFeZYU38yiSgpulJxl+fL18Hd/cr+vioY31zO8rSCwGFI8yEXayvQ10qvRfXsCvUK+ZpAZtSTR6ZpPaFfB0Pml3dg==;
Received: from [81.0.38.199] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jj2GR-0007hC-OP; Wed, 10 Jun 2020 17:03:39 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jj2GC-0007Nc-Eb; Wed, 10 Jun 2020 17:03:24 +0200
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 26/34] qcow2: Clear the L2 bitmap when allocating a
 compressed cluster
Date: Wed, 10 Jun 2020 17:03:04 +0200
Message-Id: <616a16649a459538624d5197f988d90fc68d1281.1591801197.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1591801197.git.berto@igalia.com>
References: <cover.1591801197.git.berto@igalia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/10 11:03:39
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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

Compressed clusters always have the bitmap part of the extended L2
entry set to 0.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2-cluster.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index 2276cee6d6..deff838fe8 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -861,6 +861,9 @@ int qcow2_alloc_compressed_cluster_offset(BlockDriverState *bs,
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


