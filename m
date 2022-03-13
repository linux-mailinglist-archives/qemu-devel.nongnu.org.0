Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4C84D7415
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 10:49:14 +0100 (CET)
Received: from localhost ([::1]:49954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTKqg-0001J3-0E
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 05:49:14 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <4166692e9162e81a5ccf9b8302d1aee309dbd7fc@lizzy.crudebyte.com>)
 id 1nTKmq-00074J-8k
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 05:45:16 -0400
Received: from lizzy.crudebyte.com ([91.194.90.13]:43671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <4166692e9162e81a5ccf9b8302d1aee309dbd7fc@lizzy.crudebyte.com>)
 id 1nTKmo-0004gJ-PV
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 05:45:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Cc:To:Subject:Date:From:References:In-Reply-To:
 Message-Id:Content-Type:Content-Transfer-Encoding:MIME-Version:Content-ID:
 Content-Description; bh=TJAeDlUJJUlZd5EXAz9aRvXtuj5klvD+5R2Ki1HIheQ=; b=h8jyz
 38LvOO3o9XHw7DHB1uacyxlrEHY0Nfo5kq2Au1Fw7wKDBVPxwQjLzUD/WgIbC3aoK2Q0pQIaSOiqr
 +nID0+PcGh5sFFmCDUBUcYctsFdIVRMWygiUTY3VXJnNAXSIPtroTd8/0jp5jld3RRdbxtAXAi/54
 4iprPAqTb2tb+O7j2XTSXhYYWzFws+zvWigFDeFZK3z6I1DwcrPgnUCzIuD+TUx5hb2f3LfdQt6D2
 ps2VAPpNqKpE7ebPBYfzfb3vkIiQNneb0e+7ONogE/8Caj/kcrMTfbRrnLwcSE7Q4E/5dQwxIpaKj
 WJrgb4OQJcPpUbXepbUlNE7LVloWw==;
Message-Id: <4166692e9162e81a5ccf9b8302d1aee309dbd7fc.1647163863.git.qemu_oss@crudebyte.com>
In-Reply-To: <cover.1647163863.git.qemu_oss@crudebyte.com>
References: <cover.1647163863.git.qemu_oss@crudebyte.com>
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
Date: Sun, 13 Mar 2022 10:28:20 +0100
Subject: [PATCH v3 2/7] tests/9pfs: Twalk with nwname=0
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>
Received-SPF: none client-ip=91.194.90.13;
 envelope-from=4166692e9162e81a5ccf9b8302d1aee309dbd7fc@lizzy.crudebyte.com;
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

Send Twalk request with nwname=0. In this case no QIDs should
be returned by 9p server; this is equivalent to walking to dot.

Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
Reviewed-by: Greg Kurz <groug@kaod.org>
---
 tests/qtest/virtio-9p-test.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
index 22bdd74bc1..6c00da03f4 100644
--- a/tests/qtest/virtio-9p-test.c
+++ b/tests/qtest/virtio-9p-test.c
@@ -1002,6 +1002,27 @@ static void fs_walk_nonexistent(void *obj, void *data, QGuestAllocator *t_alloc)
     do_walk_expect_error(v9p, "non-existent", ENOENT);
 }
 
+static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
+{
+    QVirtio9P *v9p = obj;
+    alloc = t_alloc;
+    v9fs_qid root_qid;
+    g_autofree v9fs_qid *wqid = NULL;
+    P9Req *req;
+
+    do_version(v9p);
+    req = v9fs_tattach(v9p, 0, getuid(), 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rattach(req, &root_qid);
+
+    req = v9fs_twalk(v9p, 0, 1, 0, NULL, 0);
+    v9fs_req_wait_for_reply(req, NULL);
+    v9fs_rwalk(req, NULL, &wqid);
+
+    /* special case: no QID is returned if nwname=0 was sent */
+    g_assert(wqid == NULL);
+}
+
 static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtio9P *v9p = obj;
@@ -1435,6 +1456,7 @@ static void register_virtio_9p_test(void)
     qos_add_test("synth/walk/basic", "virtio-9p", fs_walk,  &opts);
     qos_add_test("synth/walk/no_slash", "virtio-9p", fs_walk_no_slash,
                   &opts);
+    qos_add_test("synth/walk/none", "virtio-9p", fs_walk_none, &opts);
     qos_add_test("synth/walk/dotdot_from_root", "virtio-9p",
                  fs_walk_dotdot,  &opts);
     qos_add_test("synth/walk/non_existent", "virtio-9p", fs_walk_nonexistent,
-- 
2.30.2


