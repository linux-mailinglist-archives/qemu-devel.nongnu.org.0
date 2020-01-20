Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFF214355B
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Jan 2020 02:48:57 +0100 (CET)
Received: from localhost ([::1]:46956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itif2-0002XP-Sn
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 20:48:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44893)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <3990d3891e8ae2074709b56449e96ab4b4b93b7d@lizzy.crudebyte.com>)
 id 1itibW-0000T9-KI
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:45:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <3990d3891e8ae2074709b56449e96ab4b4b93b7d@lizzy.crudebyte.com>)
 id 1itibV-0007IF-Ig
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:45:18 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:53849)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <3990d3891e8ae2074709b56449e96ab4b4b93b7d@lizzy.crudebyte.com>)
 id 1itibV-0006Ei-9e
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 20:45:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=7tEonSnrfPBmvi2rnHz7Js0mmcJm7e6YY3nfwXi8nFo=; b=XapR1
 n3sShFSpFjYLX/PTSQQ7aR43E/B5QKmGbcsyEv9LsZuMoS/pkkQmqqEJ1aiiqKUT/Aw84RcyX99LL
 W4CGiEac1j6UjkgzxGGMrpghrZq2ik3eMWQC0n/eJt8C/njauUNujK+x1uqbE5TImkH2jrJUuPTEd
 b71PO5ng8dzarq79wY/HQk/aCaiOLYWWbt62KUSogJvsBHsOm67Tm2W9ylrDxOk4+BEmeiwxUzziR
 /SfMOJp2S5f5jh7aAg5xOJZqmfZfurRM5fm662MdqSj3SdwPbhWZfAVKD2fPV1NSnt3vkEIYf9p7g
 9MFmK6XMikuT1Ud2gAri9W+1V7mcQ==;
Message-Id: <3990d3891e8ae2074709b56449e96ab4b4b93b7d.1579567020.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1579567019.git.qemu_oss@crudebyte.com>
References: <cover.1579567019.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 21 Jan 2020 00:50:33 +0100
Subject: [PATCH v4 03/11] 9pfs: validate count sent by client with T_readdir
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.194.90.13
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A good 9p client sends T_readdir with "count" parameter that's sufficiently
smaller than client's initially negotiated msize (maximum message size).
We perform a check for that though to avoid the server to be interrupted
with a "Failed to encode VirtFS reply type 41" transport error message by
bad clients. This count value constraint uses msize - 11, because 11 is the
header size of R_readdir.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index a5fbe821d4..18370183c4 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -2426,6 +2426,7 @@ static void coroutine_fn v9fs_readdir(void *opaque)
     int32_t count;
     uint32_t max_count;
     V9fsPDU *pdu = opaque;
+    V9fsState *s = pdu->s;
 
     retval = pdu_unmarshal(pdu, offset, "dqd", &fid,
                            &initial_offset, &max_count);
@@ -2434,6 +2435,13 @@ static void coroutine_fn v9fs_readdir(void *opaque)
     }
     trace_v9fs_readdir(pdu->tag, pdu->id, fid, initial_offset, max_count);
 
+    if (max_count > s->msize - 11) {
+        max_count = s->msize - 11;
+        warn_report_once(
+            "9p: bad client: T_readdir with count > msize - 11"
+        );
+    }
+
     fidp = get_fid(pdu, fid);
     if (fidp == NULL) {
         retval = -EINVAL;
-- 
2.20.1


