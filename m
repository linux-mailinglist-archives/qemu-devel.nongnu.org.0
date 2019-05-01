Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88EA910CA1
	for <lists+qemu-devel@lfdr.de>; Wed,  1 May 2019 20:18:00 +0200 (CEST)
Received: from localhost ([127.0.0.1]:38031 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLtnr-0000kn-NL
	for lists+qemu-devel@lfdr.de; Wed, 01 May 2019 14:17:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45584)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hLtkb-0007Ml-AW
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:14:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <berto@igalia.com>) id 1hLtka-0002bh-Ck
	for qemu-devel@nongnu.org; Wed, 01 May 2019 14:14:37 -0400
Received: from fanzine.igalia.com ([91.117.99.155]:38852)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <berto@igalia.com>)
	id 1hLtka-0002RE-4C; Wed, 01 May 2019 14:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; 
	h=References:In-Reply-To:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From;
	bh=ewSLV48hoUTk5bwPLhqgyOC8xegkUkvaV7q8eMrrfkw=; 
	b=jDMNJsKfyYI6pJtOR6g8pKqw5XSuI0UCjNmoWzOwHXrG+PO1BziowF3lgR+bsbCNL7+ZSmaZ1i/6+wSqco8Vy+4g81+RLrE2M2rOI2Fn1oAEK+oxF89VCfOPteoMcZ970M1TnFGcRxamSvIDRkI+n+WqUSY/G8KhvO3PgoRSaUwK43WO9hZLq5ZZzwzKQj4byxlAbx59DEst/TnFAnb68Gepkd+6I3eGkA8YSOU0uHXeSBPjw0lh0fOyfDz1Yn5OdDQ+cE/bPlQxnbhpB2US9c1EA8XNyE6HhR55hvMoplpMWFPbwQF07zg5okHpUW7SydIYWLDh5C50D4ocw/Vofw==;
Received: from 87-92-6-174.bb.dnainternet.fi ([87.92.6.174] helo=perseus.local)
	by fanzine.igalia.com with esmtpsa 
	(Cipher TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim)
	id 1hLtkH-0002EC-7J; Wed, 01 May 2019 20:14:17 +0200
Received: from berto by perseus.local with local (Exim 4.89)
	(envelope-from <berto@igalia.com>)
	id 1hLtk2-0002yJ-IP; Wed, 01 May 2019 21:14:02 +0300
From: Alberto Garcia <berto@igalia.com>
To: qemu-devel@nongnu.org
Date: Wed,  1 May 2019 21:13:55 +0300
Message-Id: <09c6ad4af497136c11291257ee8bf10608e2b86e.1556732434.git.berto@igalia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1556732434.git.berto@igalia.com>
References: <cover.1556732434.git.berto@igalia.com>
In-Reply-To: <cover.1556732434.git.berto@igalia.com>
References: <cover.1556732434.git.berto@igalia.com>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
	timestamps) [generic] [fuzzy]
X-Received-From: 91.117.99.155
Subject: [Qemu-devel] [PATCH v2 1/5] qcow2: Replace bdrv_write() with
 bdrv_pwrite()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
	qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's only one bdrv_write() call left in the qcow2 code, and it can
be trivially replaced with the byte-based bdrv_pwrite().

Signed-off-by: Alberto Garcia <berto@igalia.com>
---
 block/qcow2-refcount.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
index e0fe322500..83f66eed7a 100644
--- a/block/qcow2-refcount.c
+++ b/block/qcow2-refcount.c
@@ -2409,8 +2409,8 @@ write_refblocks:
         on_disk_refblock = (void *)((char *) *refcount_table +
                                     refblock_index * s->cluster_size);
 
-        ret = bdrv_write(bs->file, refblock_offset / BDRV_SECTOR_SIZE,
-                         on_disk_refblock, s->cluster_sectors);
+        ret = bdrv_pwrite(bs->file, refblock_offset, on_disk_refblock,
+                          s->cluster_size);
         if (ret < 0) {
             fprintf(stderr, "ERROR writing refblock: %s\n", strerror(-ret));
             goto fail;
-- 
2.11.0


