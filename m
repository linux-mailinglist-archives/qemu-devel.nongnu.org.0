Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ACFD139E51
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 01:34:04 +0100 (CET)
Received: from localhost ([::1]:57418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irA9j-00061t-Mc
	for lists+qemu-devel@lfdr.de; Mon, 13 Jan 2020 19:34:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33724)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <d06e6257e5bce83c393df183514e61a380366f3a@lizzy.crudebyte.com>)
 id 1irA8T-0005Kt-T6
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:32:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <d06e6257e5bce83c393df183514e61a380366f3a@lizzy.crudebyte.com>)
 id 1irA8S-0007CY-PL
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:32:45 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:52331)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71)
 (envelope-from <d06e6257e5bce83c393df183514e61a380366f3a@lizzy.crudebyte.com>)
 id 1irA8S-0006M1-Ae
 for qemu-devel@nongnu.org; Mon, 13 Jan 2020 19:32:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=+KvNmyLG6kAE2TZaj6MEGe1C+5iebgEtjpC5n6Htklk=; b=ESqTo
 qjy6pN/gGpJVw4FuqOimXOp7oSNInl/joGmmsVQouZu1a1Q8gChPSJ6orn19a+VJx7DCZ3lnnl/8L
 Db9oxb7x/SiE9jC9W7l2dThxcGxMAAkL7tM5LTXbHPRTZoylALNnwepEtojtalcymMDWkY9mjmWY8
 RTFZL/CEr3m+Sxx5Vty/TD++XcNJn44Ocot6Cj05E8flhQrSW3MErz3BJ37cHQ5m2P37tBg4F4tfH
 96Fx/Q9VPhJVLofA4A4ufU9k3Gz+D7PB/gwsT7tApsm0pwFJvp8bPrlvDmdcT5LgH+FAWO1M7FblM
 6/oCjFmxLGJ6wSJjOs7P6k8MR/WNg==;
Message-Id: <d06e6257e5bce83c393df183514e61a380366f3a.1578957500.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1578957500.git.qemu_oss@crudebyte.com>
References: <cover.1578957500.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 14 Jan 2020 00:17:26 +0100
Subject: [PATCH v3 11/11] hw/9pfs/9p.c: benchmark time on T_readdir request
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

This patch is not intended to be merged, it measures
and prints the time the 9p server spends on handling
a T_readdir request. It prints the total time it spent
on handling the request, and also the time it spent
on I/O (fs driver) only.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 hw/9pfs/9p.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 5ebd424af9..7cdf18080f 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -2311,6 +2311,15 @@ static void v9fs_free_dirents(struct V9fsDirEnt *e)
     }
 }
 
+static double wall_time(void)
+{
+    struct timeval t;
+    struct timezone tz;
+    gettimeofday(&t, &tz);
+    return t.tv_sec + t.tv_usec * 0.000001;
+}
+
+
 static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
                                         int32_t max_count)
 {
@@ -2330,6 +2339,8 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
      */
     const bool dostat = pdu->s->ctx.export_flags & V9FS_REMAP_INODES;
 
+    const double start = wall_time();
+
     /*
      * Fetch all required directory entries altogether on a background IO
      * thread from fs driver. We don't want to do that for each entry
@@ -2344,6 +2355,10 @@ static int coroutine_fn v9fs_do_readdir(V9fsPDU *pdu, V9fsFidState *fidp,
     }
     count = 0;
 
+    const double end = wall_time();
+    printf("\n\nTime 9p server spent on synth_readdir() I/O only (synth "
+           "driver): %fs\n", end - start);
+
     for (struct V9fsDirEnt *e = entries; e; e = e->next) {
         dent = e->dent;
 
@@ -2416,6 +2431,8 @@ static void coroutine_fn v9fs_readdir(void *opaque)
     V9fsPDU *pdu = opaque;
     V9fsState *s = pdu->s;
 
+    const double start = wall_time();
+
     retval = pdu_unmarshal(pdu, offset, "dqd", &fid,
                            &initial_offset, &max_count);
     if (retval < 0) {
@@ -2459,6 +2476,10 @@ out:
     put_fid(pdu, fidp);
 out_nofid:
     pdu_complete(pdu, retval);
+
+    const double end = wall_time();
+    printf("Time 9p server spent on entire T_readdir request: %fs "
+           "[IMPORTANT]\n", end - start);
 }
 
 static int v9fs_xattr_write(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
-- 
2.20.1


