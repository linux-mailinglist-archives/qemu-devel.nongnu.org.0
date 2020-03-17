Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 774C5188D11
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Mar 2020 19:24:12 +0100 (CET)
Received: from localhost ([::1]:39064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jEGst-000407-Fh
	for lists+qemu-devel@lfdr.de; Tue, 17 Mar 2020 14:24:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48819)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jEGmw-0003Sn-UC
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:18:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jEGmu-00007i-R2
 for qemu-devel@nongnu.org; Tue, 17 Mar 2020 14:18:02 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:58008)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jEGmu-0005xv-6Z; Tue, 17 Mar 2020 14:18:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=WWiO0wG6yJvhykhaYHX4vvs8tz93hvSckABso3lwaFM=; 
 b=fJkjztVdyOZbcU47cTfqcr0tlhYB3MURjj1IUQF7ydof+WPFr+aRDOY13Y+SPzTCmyfEpN00XtYchGDkBnvyoEYfYMP8TCd966s+REmnmhQkyFkpYYnRjHw8WkNT576IZF+2z4aAxCN4/7t0JtnpWrHGLtHv61zQcLVL+cr1UCBVMikzPOOHlfZOM94fCfTHqvKJZ02xvXbw2xQSnCWTb+npEUCi1VKmFGuUp8hdiK9RotF6Smn6Qmy2GNASWgBh0UTG67dvlfviszEP5e0azf4XvBm3p2xQWr39rO8EOIk2+MRYn2EkUBPsEc9GQNx7O4CHdx1qdF2f1TnFDEckLA==;
Received: from [81.0.35.138] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1jEGmD-000152-4Z; Tue, 17 Mar 2020 19:17:17 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1jEGlw-0006OJ-A3; Tue, 17 Mar 2020 19:17:00 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 08/30] qcow2: Add dummy has_subclusters() function
Date: Tue, 17 Mar 2020 19:16:05 +0100
Message-Id: <0e88d0a02693bc48e1cf5a411ae32af973a6c3c2.1584468723.git.berto@igalia.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1584468723.git.berto@igalia.com>
References: <cover.1584468723.git.berto@igalia.com>
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

This function will be used by the qcow2 code to check if an image has
subclusters or not.

At the moment this simply returns false. Once all patches needed for
subcluster support are ready then QEMU will be able to create and
read images with subclusters and this function will return the actual
value.

Signed-off-by: Alberto Garcia <berto@igalia.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow2.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/qcow2.h b/block/qcow2.h
index 7754d9bd02..55298750bd 100644
--- a/block/qcow2.h
+++ b/block/qcow2.h
@@ -495,6 +495,12 @@ typedef enum QCow2MetadataOverlap {
 
 #define INV_OFFSET (-1ULL)
 
+static inline bool has_subclusters(BDRVQcow2State *s)
+{
+    /* FIXME: Return false until this feature is complete */
+    return false;
+}
+
 static inline uint64_t get_l2_entry(BDRVQcow2State *s, uint64_t *l2_slice,
                                     int idx)
 {
-- 
2.20.1


