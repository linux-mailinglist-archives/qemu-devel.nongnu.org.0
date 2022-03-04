Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015D54CD5AA
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 14:57:22 +0100 (CET)
Received: from localhost ([::1]:36860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ8Qr-0003FR-2R
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 08:57:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52840)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <71f51f31342fa9b3eb53ff267345ee9d59d0cebf@lizzy.crudebyte.com>)
 id 1nQ7xP-0002I5-O1
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:27:00 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:34357)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <71f51f31342fa9b3eb53ff267345ee9d59d0cebf@lizzy.crudebyte.com>)
 id 1nQ7xO-0006rB-6j
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 08:26:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=yKS8v7D5O2e+Blqy1u72eKRpQqfklC5OzihiNL/eqwU=; b=kbUaJ
 tq/SkeMBtW9MroiHKzUY0CJyu6zTqfb/eaaL2V5innyZ1v6PY3St4Bg7RXP717AOATQKyoN2FiH1M
 b7W2ndiTd2qiU0TLaIX+VNz7O18suNwCWhtBuuS3+DvFpux5u5eDWzrD1PR8y+b7K3d1f6LHZU13V
 rSJTwVzU+HN0dhBsQYh/PmBB+azdZPLpYhFpUzvueNT0Vbd3Nfo6QGqDpgSOq0UqFvdAkg/KPB9E1
 jI6FnJxp7UO1kUib3ftcTwCwXZPkaXWwQDwhNWFexInCC/JttaFMDwPrFw+G0JcrufhFbqbb/MFxB
 SAfcq98xOr5ww02hYxrdV/dekUiaA==;
Message-Id: <71f51f31342fa9b3eb53ff267345ee9d59d0cebf.1646396869.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646396869.git.qemu_oss@crudebyte.com>
References: <cover.1646396869.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Fri, 04 Mar 2022 13:27:49 +0100
Subject: [PULL 10/19] 9p: darwin: Adjust assumption on virtio-9p-test
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=71f51f31342fa9b3eb53ff267345ee9d59d0cebf@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Will Cohen <wwcohen@gmail.com>

The previous test depended on the assumption that P9_DOTL_AT_REMOVEDIR
and AT_REMOVEDIR have the same value.

While this is true on Linux, it is not true everywhere, and leads to an
incorrect test failure on unlink_at, noticed when adding 9p to darwin:

Received response 7 (RLERROR) instead of 77 (RUNLINKAT)
Rlerror has errno 22 (Invalid argument)
**

ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion
failed (hdr.id == id): (7 == 77) Bail out!

ERROR:../tests/qtest/virtio-9p-test.c:305:v9fs_req_recv: assertion
failed (hdr.id == id): (7 == 77)

Signed-off-by: Fabian Franz <fabianfranz.oss@gmail.com>
[Will Cohen: - Add explanation of patch and description
               of pre-patch test failure]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Acked-by: Thomas Huth <thuth@redhat.com>
[Will Cohen: - Move this patch before 9p: darwin: meson
               patch to avoid qtest breakage during
               bisecting]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
Message-Id: <20220227223522.91937-11-wwcohen@gmail.com>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 502e5ad0c7..01ca076afe 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1253,7 +1253,7 @@ static void fs_unlinkat_dir(void *obj, void *data, QGuestAllocator *t_alloc)
     /* ... and is actually a directory */
     g_assert((st.st_mode & S_IFMT) == S_IFDIR);
 
-    do_unlinkat(v9p, "/", "02", AT_REMOVEDIR);
+    do_unlinkat(v9p, "/", "02", P9_DOTL_AT_REMOVEDIR);
     /* directory should be gone now */
     g_assert(stat(new_dir, &st) != 0);
 }
-- 
2.20.1


