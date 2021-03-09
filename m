Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2255332BB9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Mar 2021 17:18:37 +0100 (CET)
Received: from localhost ([::1]:49496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJf48-00033g-QP
	for lists+qemu-devel@lfdr.de; Tue, 09 Mar 2021 11:18:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeeu-0003tk-FB
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:38557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lJeek-0000vy-M6
 for qemu-devel@nongnu.org; Tue, 09 Mar 2021 10:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615305137;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U+HHGIuH/YpAKfJf1hR+G2k66HPimBt8/OdCroYtQN8=;
 b=VRrngEak/7Qx+VWxsD+MmOLE+K0reKT9kglVSBWV37pUhTR5Y7/kGQgpR0WCBHN2mYxJit
 VrOc8prkAZpO1SpV3XHQs6l04RSofneSW8+Ut0skrXshg9VY4kE3oz3UbhWy3X/qLTOifh
 OVmxiSCHP4DV+nr2BuAO9aeMMufMGWU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-BaM0eEVGMD2fpSZhdeiBFQ-1; Tue, 09 Mar 2021 10:52:14 -0500
X-MC-Unique: BaM0eEVGMD2fpSZhdeiBFQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05FD580432D;
 Tue,  9 Mar 2021 15:52:13 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-36.phx2.redhat.com [10.3.112.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 645BB19C46;
 Tue,  9 Mar 2021 15:52:12 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/17] nbd: server: Report holes for raw images
Date: Tue,  9 Mar 2021 09:51:47 -0600
Message-Id: <20210309155202.1312571-3-eblake@redhat.com>
In-Reply-To: <20210309155202.1312571-1-eblake@redhat.com>
References: <20210309155202.1312571-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Nir Soffer <nirsof@gmail.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Nir Soffer <nsoffer@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nir Soffer <nirsof@gmail.com>

When querying image extents for raw image, qemu-nbd reports holes as
zero:

$ qemu-nbd -t -r -f raw empty-6g.raw

$ qemu-img map --output json nbd://localhost
[{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": true, "offset": 0}]

$ qemu-img map --output json empty-6g.raw
[{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": false, "offset": 0}]

Turns out that qemu-img map reports a hole based on BDRV_BLOCK_DATA, but
nbd server reports a hole based on BDRV_BLOCK_ALLOCATED.

The NBD protocol says:

    NBD_STATE_HOLE (bit 0): if set, the block represents a hole (and
    future writes to that area may cause fragmentation or encounter an
    NBD_ENOSPC error); if clear, the block is allocated or the server
    could not otherwise determine its status.

qemu-img manual says:

    whether the sectors contain actual data or not (boolean field data;
    if false, the sectors are either unallocated or stored as
    optimized all-zero clusters);

To me, data=false looks compatible with NBD_STATE_HOLE. From user point
of view, getting same results from qemu-nbd and qemu-img is more
important than being more correct about allocation status.

Changing nbd server to report holes using BDRV_BLOCK_DATA makes qemu-nbd
results compatible with qemu-img map:

$ qemu-img map --output json nbd://localhost
[{ "start": 0, "length": 6442450944, "depth": 0, "zero": true, "data": false, "offset": 0}]

Signed-off-by: Nir Soffer <nsoffer@redhat.com>
Message-Id: <20210219160752.1826830-1-nsoffer@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 nbd/server.c               | 4 ++--
 tests/qemu-iotests/241.out | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/nbd/server.c b/nbd/server.c
index 7229f487d296..86a44a9b41c1 100644
--- a/nbd/server.c
+++ b/nbd/server.c
@@ -2087,8 +2087,8 @@ static int blockstatus_to_extents(BlockDriverState *bs, uint64_t offset,
             return ret;
         }

-        flags = (ret & BDRV_BLOCK_ALLOCATED ? 0 : NBD_STATE_HOLE) |
-                (ret & BDRV_BLOCK_ZERO      ? NBD_STATE_ZERO : 0);
+        flags = (ret & BDRV_BLOCK_DATA ? 0 : NBD_STATE_HOLE) |
+                (ret & BDRV_BLOCK_ZERO ? NBD_STATE_ZERO : 0);

         if (nbd_extent_array_add(ea, num, flags) < 0) {
             return 0;
diff --git a/tests/qemu-iotests/241.out b/tests/qemu-iotests/241.out
index 75f9f465e522..3f8c173cc82d 100644
--- a/tests/qemu-iotests/241.out
+++ b/tests/qemu-iotests/241.out
@@ -5,7 +5,7 @@ QA output created by 241
   size:  1024
   min block: 1
 [{ "start": 0, "length": 1000, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
+{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
 1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)

 === Exporting unaligned raw image, forced server sector alignment ===
@@ -23,6 +23,6 @@ WARNING: Image format was not specified for 'TEST_DIR/t.raw' and probing guessed
   size:  1024
   min block: 1
 [{ "start": 0, "length": 1000, "depth": 0, "zero": false, "data": true, "offset": OFFSET},
-{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": true, "offset": OFFSET}]
+{ "start": 1000, "length": 24, "depth": 0, "zero": true, "data": false, "offset": OFFSET}]
 1 KiB (0x400) bytes     allocated at offset 0 bytes (0x0)
 *** done
-- 
2.30.1


