Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E3D2A0865
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Oct 2020 15:49:55 +0100 (CET)
Received: from localhost ([::1]:46584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kYVj0-0005nt-9o
	for lists+qemu-devel@lfdr.de; Fri, 30 Oct 2020 10:49:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <850207b415781436af3af7deeae72bc9d74af749@lizzy.crudebyte.com>)
 id 1kYVeW-0000k5-L9
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:45:16 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:40599)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <850207b415781436af3af7deeae72bc9d74af749@lizzy.crudebyte.com>)
 id 1kYVeU-00036e-Q0
 for qemu-devel@nongnu.org; Fri, 30 Oct 2020 10:45:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=aoWMVpHvg2rHeMMDy40wr05kM1klAVxUGDEzPDTlgyg=; b=EE4MC
 wE0a/MAaCS2FyuVAHD/pTaV4UBwlirMSRUZPTUH4WHDeQRtLonoA7srD9aYjha7Rw3lHrGkhDEPqy
 SXH+QNdXJGBgodVG9mN4tSsqSS3jZQAy1sKR2Xt1f5lrBN9JnY74uotwez+Omqd6C2JGnQPn63/OS
 LzUD3VEGG46C8FnE9qJ4y8l48+r1ogmqoetVsmagUL6sGhfnflYITDqt/c4+iJC1V3xpQ9qU7Q1uK
 U8oj7Eefp0amzDpIAT97oQknVh3aM6E3QJtsLuvukiLclahsPv4wvmn5rKpRcLlzWR/Yg51V7NT5w
 G+5xxiAk9LRmIXJTFW4aSmSa1ayZQ==;
Message-Id: <850207b415781436af3af7deeae72bc9d74af749.1604067568.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1604067568.git.qemu_oss@crudebyte.com>
References: <cover.1604067568.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Tue, 20 Oct 2020 18:09:14 +0200
Subject: [PULL v2 04/16] tests/9pfs: Factor out do_version() helper
To: qemu-devel@nongnu.org,
    Peter Maydell <peter.maydell@linaro.org>
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=850207b415781436af3af7deeae72bc9d74af749@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/30 07:59:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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

From: Greg Kurz <groug@kaod.org>

fs_version() is a top level test function. Factor out the reusable
code to a separate helper instead of hijacking it in other tests.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <160321015403.266767.4533967728943968456.stgit@bahia.lan>
Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index c15908f27b..59bcea4c30 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -567,10 +567,8 @@ static void v9fs_rflush(P9Req *req)
     v9fs_req_free(req);
 }
 
-static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
+static void do_version(QVirtio9P *v9p)
 {
-    QVirtio9P *v9p = obj;
-    alloc = t_alloc;
     const char *version = "9P2000.L";
     uint16_t server_len;
     char *server_version;
@@ -585,13 +583,19 @@ static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(server_version);
 }
 
+static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    alloc = t_alloc;
+    do_version(obj);
+}
+
 static void fs_attach(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
     alloc = t_alloc;
     P9Req *req;
 
-    fs_version(v9p, NULL, t_alloc);
+    do_version(v9p);
     req = v9fs_tattach(v9p, 0, getuid(), 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rattach(req, NULL);
@@ -831,7 +835,7 @@ static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
     v9fs_qid root_qid, *wqid;
     P9Req *req;
 
-    fs_version(v9p, NULL, t_alloc);
+    do_version(v9p);
     req = v9fs_tattach(v9p, 0, getuid(), 0);
     v9fs_req_wait_for_reply(req, NULL);
     v9fs_rattach(req, &root_qid);
-- 
2.20.1


