Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B86D7D79BE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 17:27:43 +0200 (CEST)
Received: from localhost ([::1]:48700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKOje-0005Dk-Fv
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 11:27:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48075)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iKOgy-0002kq-7e
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 11:24:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iKOgw-0003fP-Qn
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 11:24:55 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:47105)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iKOgw-0003ZF-4w; Tue, 15 Oct 2019 11:24:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=PwQd/y4S0FBQizWvZQAHM2WnDJ0t7VTyKQq0iYWEjWI=; 
 b=eZ4srQEvncVNHcdLWXmHguaadSgn3/Obl2xjqHZmSuv0usdICsMdamij6aekLQiWzOGxlTk3C9eEg0rnh0u5uU93Qh4gRuxqPgdE1tG2KRPssNy5YCTt6p/XiY0MZ+cUXHO6FHvYOfUzDLlOIvf6Iab1XC7Q8ZGrFWejyy3FKdD8A13fJ32Kwy8PYwXHNHoirvkUjG5IKGLtTiQ59rLRx7Z8KseSt3XPEcH/uhYxSi0k6LbGYeiz3gKAQbp4ZRGfspfe+40YsT6qb94JMNrgLnkKhBAOtIz/9uwZ8EzjQS8Z11bdYpjeFUvEPRFJ3Dg6YCOHVw+4iGfLeiI3nYS4lg==;
Received: from 82-181-115-92.bb.dnainternet.fi ([82.181.115.92]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iKOge-0003ad-1k; Tue, 15 Oct 2019 17:24:36 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iKOfn-00061j-09; Tue, 15 Oct 2019 18:23:43 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 16/23] qcow2: Add subcluster support to
 discard_in_l2_slice()
Date: Tue, 15 Oct 2019 18:23:27 +0300
Message-Id: <cb5c8e7005ba04d057d1b394309997c302e8658c.1571152571.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1571152571.git.berto@igalia.com>
References: <cover.1571152571.git.berto@igalia.com>
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
 Max Reitz <mreitz@redhat.com>, "Denis V . Lunev" <den@openvz.org>
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
index c554b1a88c..bf32447d18 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1769,7 +1769,11 @@ static int discard_in_l2_slice(BlockDriverState *bs, uint64_t offset,
 
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


