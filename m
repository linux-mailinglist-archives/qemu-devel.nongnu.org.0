Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D43E123B9B
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 01:32:00 +0100 (CET)
Received: from localhost ([::1]:47646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihNFv-00085Y-3U
	for lists+qemu-devel@lfdr.de; Tue, 17 Dec 2019 19:31:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36258)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <a5aeeb90df6eb9bfca22431fc4ee0d5eaa58c2e5@lizzy.crudebyte.com>)
 id 1ihNEP-0007Jc-8T
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:30:27 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <a5aeeb90df6eb9bfca22431fc4ee0d5eaa58c2e5@lizzy.crudebyte.com>)
 id 1ihNEN-0006PV-Sb
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:30:25 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:39153)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <a5aeeb90df6eb9bfca22431fc4ee0d5eaa58c2e5@lizzy.crudebyte.com>)
 id 1ihNEN-0005Ph-9l
 for qemu-devel@nongnu.org; Tue, 17 Dec 2019 19:30:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Message-Id:Subject:Date:Cc:To:From:Content-Type:
 Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Content-ID:
 Content-Description; bh=GgiXB8p8Xd/QoPlYaJiPVPesefRwdQros/8Qb85D0+4=; b=C1m+U
 13LUJaLnInujhKDG80CG/9j/tsX37UtqVvC7futfXH63kfcxzTFYzjWQ9t+eLsO21C8xG3p3RCN/P
 sz+qnK8UjbJSC/vczDg/Rl8oUMzZdfMyLtb1HU2AD/7VMVvvYBunVIeGa1bIr0H/VnbISjTAYvjef
 0FtZHQTsHdtj+PizxnpUuCZFtMQlx9Sf9ysaosEkBCyOQuQ4boSrkVd5712Y6RK6xlsLrnug92Vpe
 qhDGeUOFxaKpVdorbovrI9L0yqicfNJ97b0uG9A1A+bV/B/uxyyKDqWCOLYkhv39zU56/XFjDP2C1
 94j9WXsoXncSo8cCIq+W9Ei3hGqNA==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Date: Mon, 16 Dec 2019 15:43:39 +0100
Subject: [PATCH 2/9] 9pfs: validate count sent by client with T_readdir
Message-Id: <E1ihMum-00076q-5l@lizzy.crudebyte.com>
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

A good 9p client sends T_readdir with "count" parameter that's
sufficiently smaller than client's initially negotiated msize
(maximum message size). We perform a check for that though to
avoid the server to be interrupted with a "Failed to encode
VirtFS reply type 41" error message by bad clients.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 520177f40c..30e33b6573 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -2414,6 +2414,7 @@ static void coroutine_fn v9fs_readdir(void *opaque)
     int32_t count;
     uint32_t max_count;
     V9fsPDU *pdu = opaque;
+    V9fsState *s = pdu->s;
 
     retval = pdu_unmarshal(pdu, offset, "dqd", &fid,
                            &initial_offset, &max_count);
@@ -2422,6 +2423,13 @@ static void coroutine_fn v9fs_readdir(void *opaque)
     }
     trace_v9fs_readdir(pdu->tag, pdu->id, fid, initial_offset, max_count);
 
+    if (max_count > s->msize - P9_IOHDRSZ) {
+        max_count = s->msize - P9_IOHDRSZ;
+        warn_report_once(
+            "9p: bad client: T_readdir with count > msize - P9_IOHDRSZ"
+        );
+    }
+
     fidp = get_fid(pdu, fid);
     if (fidp == NULL) {
         retval = -EINVAL;
-- 
2.20.1


