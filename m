Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D907393536
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 19:59:04 +0200 (CEST)
Received: from localhost ([::1]:37536 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmKHf-0004qI-Ej
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 13:59:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3d154cc9474cb0d5507d67211bd5e328ed2d7093@lizzy.crudebyte.com>)
 id 1lmKGQ-0003Gj-AE
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:57:46 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:51773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <3d154cc9474cb0d5507d67211bd5e328ed2d7093@lizzy.crudebyte.com>)
 id 1lmKGO-0003MB-KH
 for qemu-devel@nongnu.org; Thu, 27 May 2021 13:57:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=y/GOcUShy5FjWgYDSfPOlFUsllk9Rf3WUCR1lrW76tY=; b=hcvuc
 eQOsRd4QCMK7bCEmi9uUkEjSamKlfBh0CEflFPmsotIFHUQcwZbAAJveJ3OuNszMt/JRe/jhdOWS1
 lHmfDx9GKKq2csCR0xDRY+6hMoGwlesIF0CwNW6sNZohUCBRej5bKmQ4Wi5VbQGYNpGq0JaFMQMmM
 5cXANaEXK2cQ9tSvyVbYCXk9niCzbKuA5fFSulN1lMZr76ZtOt7SH9cmK6N2YJyd2n5jDP5qkhIOs
 RpTrYIUzUnpSXyXSkQR+Lo6g3G72w53JC6wAKIO+dsrtB2N+yL1mBT53H7oQD+3QifOc0vbmXrOEP
 ArP1NA64pZXr5Q+llpyWSnaiklBtA==;
Message-Id: <3d154cc9474cb0d5507d67211bd5e328ed2d7093.1622135592.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1622135592.git.qemu_oss@crudebyte.com>
References: <cover.1622135592.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 27 May 2021 19:03:17 +0200
Subject: [PATCH 1/3] 9pfs: Twalk benchmark
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=3d154cc9474cb0d5507d67211bd5e328ed2d7093@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch is not intentended to be merged, it just acts as performance
A/B comparison benchmark for the subsequent patch.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 41fed41de1..2cd9e427b4 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -20,6 +20,18 @@
 #include "libqos/virtio-9p.h"
 #include "libqos/qgraph.h"
 
+/*
+ * to benchmark the real time (not CPU time) that elapsed between start of
+ * a request and arrival of its response
+ */
+static double wall_time(void)
+{
+    struct timeval t;
+    struct timezone tz;
+    gettimeofday(&t, &tz);
+    return t.tv_sec + t.tv_usec * 0.000001;
+}
+
 #define QVIRTIO_9P_TIMEOUT_US (10 * 1000 * 1000)
 static QGuestAllocator *alloc;
 
@@ -646,12 +658,30 @@ static void fs_walk(void *obj, void *data, QGuestAllocator *t_alloc)
     }
 
     do_attach(v9p);
+    const double start = wall_time();
     req = v9fs_twalk(v9p, 0, 1, P9_MAXWELEM, wnames, 0);
+    const double twalk = wall_time();
     v9fs_req_wait_for_reply(req, NULL);
+    const double waitforreply = wall_time();
     v9fs_rwalk(req, &nwqid, &wqid);
+    const double end = wall_time();
 
     g_assert_cmpint(nwqid, ==, P9_MAXWELEM);
 
+    printf("\nTime client spent on sending Twalk: %fs\n\n",
+           twalk - start);
+
+    printf("Time client spent for waiting for reply from server: %fs "
+           "[MOST IMPORTANT]\n", waitforreply - start);
+    printf("(This is the most important value, because it reflects the time\n"
+           "the 9p server required to process and return the result of the\n"
+           "Twalk request.)\n\n");
+
+    printf("Total client time: %fs\n", end - start);
+
+    //printf("Details of response message data: R_readddir nentries=%d "
+    //       "rbytes=%d\n", nentries, count);
+
     for (i = 0; i < P9_MAXWELEM; i++) {
         g_free(wnames[i]);
     }
-- 
2.20.1


