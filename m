Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB9BD79FB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 17:41:24 +0200 (CEST)
Received: from localhost ([::1]:48974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKOwt-0004rW-7X
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 11:41:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48483)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1iKOhL-0003LT-3D
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 11:25:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1iKOhJ-0003rn-V1
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 11:25:18 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:47189)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1iKOhJ-0003cO-Ed; Tue, 15 Oct 2019 11:25:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
 bh=lTwe5L6tkrphvOujsjpMEe2kl6IeFgukQZj+3XdsYfc=; 
 b=C2Falpd6Ql/0ANCSvsmHSJoGsluJldaysj5EzhmvEa2SEwbYxWoFLz0ejOXDb5EdwsAZ6rVE9er6wRZWcMwbkz4j6Y0kL1Jvf1fo00Ch8/QUXPLPXyljddQJLuPedFZMJc7fW6x2no70Ztfjl7AEvq9iDOMOEXHVWwKm53rVOGC0eqNyaZGGU3+OW4cttDwNIr6bGPjmaI2XrCHc+CdCDFsijkuHQBC6jOjFHtW8cJMTMCzw1P7Q0xUoDC+80VNwo2qn/lKDYY/0MuuvhV/BvsADBmg1YOFUl+EZ6JKXLep7lzsVFmZek+CULuk/7XbR+d7Js/6xBVIOM6i80qtnSA==;
Received: from 82-181-115-92.bb.dnainternet.fi ([82.181.115.92]
 helo=perseus.local) by fanzine.igalia.com with esmtpsa 
 (Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
 id 1iKOge-0003ag-6s; Tue, 15 Oct 2019 17:24:36 +0200
Received: from berto by perseus.local with local (Exim 4.92)
 (envelope-from <berto@igalia.com>)
 id 1iKOfn-00061t-3A; Tue, 15 Oct 2019 18:23:43 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 19/23] qcow2: Fix offset calculation in
 handle_dependencies()
Date: Tue, 15 Oct 2019 18:23:30 +0300
Message-Id: <846c6f37fea8f824887d2dcf62062041f6419ae1.1571152571.git.berto@igalia.com>
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

l2meta_cow_start() and l2meta_cow_end() are not necessarily
cluster-aligned if the image has subclusters, so update the
calculation of old_start and old_end to guarantee that no two requests
try to write on the same cluster.

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-cluster.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-cluster.c b/block/qcow2-cluster.c
index dc72f0e595..75579c1470 100644
--- a/block/qcow2-cluster.c
+++ b/block/qcow2-cluster.c
@@ -1262,8 +1262,8 @@ static int handle_dependencies(BlockDriverState *bs, uint64_t guest_offset,
 
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


