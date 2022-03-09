Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 308BB4D399E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Mar 2022 20:13:25 +0100 (CET)
Received: from localhost ([::1]:51440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nS1kS-0000hj-45
	for lists+qemu-devel@lfdr.de; Wed, 09 Mar 2022 14:13:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <62e8103d249fcdb03ad6c706840579a075333398@lizzy.crudebyte.com>)
 id 1nS1ix-0007va-Ck
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:11:51 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:46089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <62e8103d249fcdb03ad6c706840579a075333398@lizzy.crudebyte.com>)
 id 1nS1iv-0004bW-PW
 for qemu-devel@nongnu.org; Wed, 09 Mar 2022 14:11:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=Y22/N2T+yp5XUNQcROO4zlRG0A7OoAe0gcpC8S1OTlA=; b=EK0sP
 7jkvNaWlsR+cwpOVOIvSfqmq5M+XT9q9+Z3I6pVFBHBrgMCtAwaf9S/mm7otXhbD0hiFZ5DgVOLbR
 UYCGm3TtcBxzqIxjdYDOCNVoic/TqL/V1RYYRJTNUgPEDcZZnK6SU5uL6nLDeqkOMfhAWVYSp7Tk+
 hYtuV+tMx/ofJ9EIdK/HDjJIkh23YkEGPQNfcOgnDjGks1nMOELtnT3C+Bgnwv9wqIFuxUB3joIHY
 NVdB3oaw5LSlABaP0M7xFpEcGmGnbkhPgS3sswGj29J2NE2HyG9erhd6n+i2Qk/pWSfPlX2SKP3mV
 8wLmjqz2HFotmpoPWuHYoUgof1z2Q==;
Message-Id: <62e8103d249fcdb03ad6c706840579a075333398.1646850707.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1646850707.git.qemu_oss@crudebyte.com>
References: <cover.1646850707.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Wed, 9 Mar 2022 13:18:50 +0100
Subject: [PATCH 1/6] tests/9pfs: walk to non-existent dir
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=62e8103d249fcdb03ad6c706840579a075333398@lizzy.crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_06_12=1.543,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Expect ENOENT Rlerror response when trying to walk to a
non-existent directory.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
---
 tests/qtest/virtio-9p-test.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 01ca076afe..22bdd74bc1 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -606,6 +606,25 @@ static uint32_t do_walk(QVirtio9P *v9p, const char *path)
     return fid;
 }
 
+/* utility function: walk to requested dir and expect passed error response */
+static void do_walk_expect_error(QVirtio9P *v9p, const char *path, uint32_t err)
+{
+    char **wnames;
+    P9Req *req;
+    uint32_t _err;
+    const uint32_t fid = genfid();
+
+    int nwnames = split(path, "/", &wnames);
+
+    req = v9fs_twalk(v9p, 0, fid, nwnames, wnames, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rlerror(req, &_err);
+
+    g_assert_cmpint(_err, ==, err);
+
+    split_free(&wnames);
+}
+
 static void fs_version(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     alloc = t_alloc;
@@ -974,6 +993,15 @@ static void fs_walk_no_slash(void *obj, void *data, QGuestAllocator *t_alloc)
     g_free(wnames[0]);
 }
 
+static void fs_walk_nonexistent(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtio9P *v9p = obj;
+    alloc = t_alloc;
+
+    do_attach(v9p);
+    do_walk_expect_error(v9p, "non-existent", ENOENT);
+}
+
 static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
@@ -1409,6 +1437,8 @@ static void register_virtio_9p_test(void)
                   &opts);
     qos_add_test("synth/walk/dotdot_from_root", "virtio-9p",
                  fs_walk_dotdot,  &opts);
+    qos_add_test("synth/walk/non_existent", "virtio-9p", fs_walk_nonexistent,
+                  &opts);
     qos_add_test("synth/lopen/basic", "virtio-9p", fs_lopen,  &opts);
     qos_add_test("synth/write/basic", "virtio-9p", fs_write,  &opts);
     qos_add_test("synth/flush/success", "virtio-9p", fs_flush_success,
-- 
2.30.2


