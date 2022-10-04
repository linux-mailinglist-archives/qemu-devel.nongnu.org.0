Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 319C55F4B21
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 23:48:36 +0200 (CEST)
Received: from localhost ([::1]:41010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofpmF-00066r-9u
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 17:48:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7f280ec6a1f9d8afed46567a796562c4dc28afa9@lizzy.crudebyte.com>)
 id 1ofpM8-0006od-2i
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:36 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:33525)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <7f280ec6a1f9d8afed46567a796562c4dc28afa9@lizzy.crudebyte.com>)
 id 1ofpM6-0002fg-GQ
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 17:21:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=ebz7OqktTkES3rzVSDqZI3+/Vs/u+VUQJpyPQL0qwdw=; b=CUxel
 YxupZszmmeHnmucqejrMTtMnkOFLizHMVW/peL7wYbw5lD4yP4czdeT7xYLa5TRbN27HFwVuzdHIk
 rECGN6lESx5ROnfjIHRmnaoGl/f/bO+tEu2YPOb0Bps9D86899krK1MFVoHAYjzrxeCH+gYTfPtdm
 ynRuIlUeyQqXUKU5yPm3faur/RMm5YwkhInud0ZV8EAk5Dnbn58cA1Emi+an7WDn/g6Z8KVlb+15p
 2dsw9wBbf9xNRG4VdtIl8WTSLvQ+tk+XmwySG5ANHLzpyzjFpR2+s4NA2k/TuNYpCILjK3LUYzQtX
 WatI+ospqlX8rOvMpK2I6bczwP2jA==;
Message-Id: <7f280ec6a1f9d8afed46567a796562c4dc28afa9.1664917004.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1664917004.git.qemu_oss@crudebyte.com>
References: <cover.1664917004.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 4 Oct 2022 22:54:00 +0200
Subject: [PATCH 13/20] tests/9p: simplify callers of twrite()
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=7f280ec6a1f9d8afed46567a796562c4dc28afa9@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Now as twrite() is using a declarative approach, simplify the
code of callers of this function.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index a5b9284acb..5ad7bebec7 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -377,7 +377,6 @@ static void fs_write(void *obj, void *data, QGuestAllocator *t_alloc)
     char *wnames[] = { g_strdup(QTEST_V9FS_SYNTH_WRITE_FILE) };
     g_autofree char *buf = g_malloc0(write_count);
     uint32_t count;
-    P9Req *req;
 
     tattach({ .client = v9p });
     twalk({
@@ -386,12 +385,10 @@ static void fs_write(void *obj, void *data, QGuestAllocator *t_alloc)
 
     tlopen({ .client = v9p, .fid = 1, .flags = O_WRONLY });
 
-    req = twrite({
+    count = twrite({
         .client = v9p, .fid = 1, .offset = 0, .count = write_count,
-        .data = buf, .requestOnly = true
-    }).req;
-    v9fs_req_wait_for_reply(req, NULL);
-    v9fs_rwrite(req, &count);
+        .data = buf
+    }).count;
     g_assert_cmpint(count, ==, write_count);
 
     g_free(wnames[0]);
-- 
2.30.2


