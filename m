Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3339B139E5F
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 01:37:03 +0100 (CET)
Received: from localhost ([::1]:57478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irACc-0004Fm-6K
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 19:37:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34509)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <0edf21d2cb2a6cf22ba1065bf451b44ad5962cbd@lizzy.crudebyte.com>)
 id 1irABT-00034W-3y
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:35:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <0edf21d2cb2a6cf22ba1065bf451b44ad5962cbd@lizzy.crudebyte.com>)
 id 1irABS-0001Q7-44
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:35:51 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:49893)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <0edf21d2cb2a6cf22ba1065bf451b44ad5962cbd@lizzy.crudebyte.com>)
 id 1irABQ-0000gb-Cn
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:35:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=DaJOrz3IZpnkejwrW0e8xc6WCAlOTLpMiIkJfiSMCLg=; b=d5svA
 8GGIzqQYlpHqWKvvVolpdWh5F8qt0v09+uqz616hdIBH8B9AslcRZa7mxk1+iBlO0ZLEQyEZkjOrL
 cXfN8TbWAiPlNY7eadiE4z7XjsJSpYS3bWuuYydjJKUxJYFZCvfw1KzLk+t8krCTWX60dD3FOv53j
 JYDWGuvhqZeKOHrY1SDjzh2ccC3jg+WxQTygkd0ANnimYANAUsPszEQUtor+XTAZYDgTYmaVL4uk1
 qiDyTrnT8xnqBfTUceKb/j1euu1AFQg+WdlNU1KxSZCiKIjKi2aUCaG0IqZbDZKkGLemT/L/tIhzd
 o/Bf14Vyj7mNxALn99uZoHpcB1r+Q==;
Message-Id: <0edf21d2cb2a6cf22ba1065bf451b44ad5962cbd.1578957500.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1578957500.git.qemu_oss@crudebyte.com>
References: <cover.1578957500.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Mon, 13 Jan 2020 23:22:08 +0100
Subject: [PATCH v3 03/11] 9pfs: validate count sent by client with T_readdir
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
index a5fbe821d4..30da2fedf3 100644
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


