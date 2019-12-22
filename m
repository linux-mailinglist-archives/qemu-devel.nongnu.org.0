Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41808128DB0
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 12:40:22 +0100 (CET)
Received: from localhost ([::1]:46598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iizau-0004hU-Lg
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 06:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41507)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iizYp-0002nw-EN
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iizYo-0005c7-5y
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:11 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34983)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iizYn-0004V6-DZ; Sun, 22 Dec 2019 06:38:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=ieXDi5ioqJCItbaztNvJyCyrJUb3lZG7EmUXCdrCtsM=; 
 b=XYDaHwDagAxK83krAbTO2HObdLEydAnPk+UtYRJLLHBtKDCr3p1sFbN/ngqARcgQkyxlZiquEl1bSG42+37xxBpxHBHa2owHMW/EVlwnMW0Sb4sLnKFkD8/0pqemqKEVctVwiBw2CUCHdqAifH3uRmA1yGqp3dRWDbIKgDduBeSeEhJ0Qf/FuOGp4k17S6COJXlbRVmwAVHFw6Z4Kq/6SVlw7T2tI1UNHvuzuimzdVeluY69wru5rcvsxv2PWxIY7WZweoyYe7QTRlRK360xHCetzM7YSfM2VbZxGubzw02xVvk3TLrARZ1Ru5zsSadz9ydGqGzCTHHmWj4PpHhv5w==;
Received: from [80.30.182.172] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iizYV-0005dQ-25; Sun, 22 Dec 2019 12:37:51 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iizXu-0001WK-Ui; Sun, 22 Dec 2019 12:37:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 24/27] qcow2: Restrict qcow2_co_pwrite_zeroes() to full
 clusters only
Date: Sun, 22 Dec 2019 12:37:05 +0100
Message-Id: <7a68ff6b42f3d0c7e5118099d17934e08a6bb49f.1577014346.git.berto@igalia.com>
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

Ideally it should be possible to zero individual subclusters using
this function, but this is currently not implemented.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/qcow2.c b/block/qcow2.c
index 242001afa2..0267722065 100644
--- a/block/qcow2.c
+++ b/block/qcow2.c
@@ -3754,6 +3754,12 @@ static coroutine_fn int qcow2_co_pwrite_zeroes(BlockDriverState *bs,
             qemu_co_mutex_unlock(&s->lock);
             return -ENOTSUP;
         }
+        /* TODO: allow zeroing separate subclusters, we only allow
+         * zeroing full clusters at the moment. */
+        if (nr != bytes) {
+            qemu_co_mutex_unlock(&s->lock);
+            return -ENOTSUP;
+        }
         if (type != QCOW2_SUBCLUSTER_UNALLOCATED_PLAIN &&
             type != QCOW2_SUBCLUSTER_UNALLOCATED_ALLOC &&
             type != QCOW2_SUBCLUSTER_ZERO_PLAIN &&
-- 
2.20.1


