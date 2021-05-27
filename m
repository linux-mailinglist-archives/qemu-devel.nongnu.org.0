Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D46039BDC6
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 18:57:10 +0200 (CEST)
Received: from localhost ([::1]:52864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpD89-0002rd-9V
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 12:57:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e43c658ec76b394005d514034c2defd0eacb7ea0@lizzy.crudebyte.com>)
 id 1lpCmc-0004Ru-Hw
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:34:54 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:35679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <e43c658ec76b394005d514034c2defd0eacb7ea0@lizzy.crudebyte.com>)
 id 1lpCma-0002cX-Nu
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 12:34:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=F+zcqFLh8DFiVXFYYi8rgDfObpfpt7catkfkcaYSDRA=; b=W+75G
 OC319uyuv8AerJXS7QzQUL6L73KXaCCEyXVyDNlrBiERM7B93/audOz6hXziJB+7AY5ZdMjEQWfqP
 bJkh6gTnF/NyafOrbc75nt6kauOYOX2upt/DUMNh2UjiRi6k9sXlvx6r+sptq8Q/X9yVPdGBcf+mG
 Le3B/Fo7qZabl4WBt9dxcBODf4CICu36Sk1SswBtxNQ4nh6SdmufLyJw1+aOKu6zRShxPIh4JS7Jy
 BNj6+d+65QdsTCu9+WyGrg4dsTLzKzMh5lToS1/oKyoTigRO3ow3K2vee0r5zUWK9KnDN6BVEY1Ie
 mmgcBAnvr5jfFTlI42B75dQlMKMaA==;
Message-Id: <e43c658ec76b394005d514034c2defd0eacb7ea0.1622821729.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1622821729.git.qemu_oss@crudebyte.com>
References: <cover.1622821729.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Thu, 27 May 2021 19:03:17 +0200
Subject: [PATCH v2 2/7] 9pfs: Twalk benchmark
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=e43c658ec76b394005d514034c2defd0eacb7ea0@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: 13
X-Spam_score: 1.3
X-Spam_bar: +
X-Spam_report: (1.3 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_96_XX=3.405,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
A/B comparison benchmark for the subsequent patches.

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


