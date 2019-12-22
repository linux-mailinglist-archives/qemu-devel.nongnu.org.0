Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C21128DBD
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 12:46:50 +0100 (CET)
Received: from localhost ([::1]:46766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iizhA-0004BU-FL
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 06:46:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44203)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iizZD-0003UD-Si
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iizZC-000759-6c
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 06:38:35 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:35042)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iizZB-0004nS-JD; Sun, 22 Dec 2019 06:38:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=FfRwlFoUXwcSP1PUYtt1ApuHt/UcQFWHMXoKMvFasHA=; 
 b=Vd9T794WPeEoNkJP48CItIAD0AP/Shc/0+3bItdcHMbbG/LgbN+D4XYmOf1PFbxWnoyRpvu1mdacu992dQHJf2+Iq7u9bqK+EQnaKC23ANyd7HNgOxvP3D3mtW6OuJDTfPpaMf7mwG2gT3oMosIK3sy/mtQuojIV1dTFMp/0j3Kr5w99oc2kpg2IHidGHwGZcPtReQEvEuU74Uhe8tQvI5hWAZJUfy2hUxpl44UyclFOR61IhHqHPN7w1fbfOMX8R9RgdaHffBdvZcN8cxPHCdvWu56DdqVov0cJW+fiVJn/MuHeM20thlYYP3jmG9Vl3xGcs+2t6+pL8VfLl/1iXA==;
Received: from [80.30.182.172] (helo=perseus.local)
 by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iizYV-0005dM-01; Sun, 22 Dec 2019 12:37:52 +0100
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iizXu-0001W7-RE; Sun, 22 Dec 2019 12:37:14 +0100
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v3 20/27] qcow2: Fix offset calculation in
 handle_dependencies()
Date: Sun, 22 Dec 2019 12:37:01 +0100
Message-Id: <655e0ce198903682430272f6cfecb08afee6667c.1577014346.git.berto@igalia.com>
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

l2meta_cow_start() and l2meta_cow_end() are not necessarily
cluster-aligned if the image has subclusters, so update the
calculation of old_start and old_end to guarantee that no two requests
try to write on the same cluster.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index ede75138d2..0a40944667 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1279,8 +1279,8 @@ static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
 
         uint64_t start = guest_offset;
         uint64_t end = start + bytes;
-        uint64_t old_start = l2meta_cow_start(old_alloc);
-        uint64_t old_end = l2meta_cow_end(old_alloc);
+        uint64_t old_start = start_of_cluster(s, l2meta_cow_start(old_alloc));
+        uint64_t old_end = ROUND_UP(l2meta_cow_end(old_alloc), s->cluster_size);
 
         if (end <= old_start || start >= old_end) {
             /* No intersection */
-- 
2.20.1


