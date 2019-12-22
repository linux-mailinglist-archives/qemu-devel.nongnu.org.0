Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6543B128DC8
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 12:59:05 +0100 (CET)
Received: from localhost ([::1]:47006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iizt2-0007Tg-7S
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 06:59:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43773)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iizZ9-0003Mn-J0
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iizZ8-0006qx-FG
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:31 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:34943)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iizZ8-0004Oj-27; Sun, 22 Dec 2019 06:38:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=IVBAlyVPifyO1dOQL27WASmPqtIuzSy/kdIJ89D+GVQ=; 
 b=YHzGwartUlNd0tmyum2aO+cTZ7w6vxWrPAc9bkHEo1ugWPgSNUlDADgcIx+Q48lX3PxM7PlwLyRTq2r66ooJSFJFBTHL8ALfQIuAhSWljbgGKOqUSw9Q3ZDJNGPd15EmHyGCJAaqj/mtyHwuma8pk3fJjj/9ebuV9462U3o+F4Smvk2a55oESVdtMpzlK56cC/YdChN5jJDke2D1Y2t0qh2IJuxrtW0Dm9tVMl8n4wktdRmen6GoKPiZJS1oXLVUO5YxBHJVXGWBUWlT5ZalmAM+TEKkjaLo/O6MS93eZyD4s8Nibw3ZXF97Fa3ebYG+MlpZ8jNWnNv/eRPZdfo+Ig==;
Received: from [80.30.182.172] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iizYU-0005d8-IW; Sun, 22 Dec 2019 12:37:50 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iizXu-0001Ve-D2; Sun, 22 Dec 2019 12:37:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 06/27] qcow2: Add dummy has_subclusters() function
Date: Sun, 22 Dec 2019 12:36:47 +0100
Message-Id: <bebe4058df5210ac3293e917ad6b61abac398f60.1577014346.git.berto@igalia.com>
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

This function will be used by the qcow2 code to check if an image has
subclusters or not.

At the moment this simply returns false. Once all patches needed for
subcluster support are ready then QEMU will be able to create and
read images with subclusters and this function will return the actual
value.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/block/qcow2.h b/block/qcow2.h
index 6823d3f68f..1db3fc5dbc 100644
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


