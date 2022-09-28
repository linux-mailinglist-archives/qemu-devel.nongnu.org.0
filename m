Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B16F5ED85A
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:59:44 +0200 (CEST)
Received: from localhost ([::1]:40414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSut-0006ny-Gk
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:59:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLq-00010I-CE
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57249)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLm-0008UV-Gh
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8sqrbAh9YbIpZcl1GEUv3IkCM+lHs5Japl0w/cbqeH0=;
 b=K/g3KFTzgsWxW/LMGexilV+3CWZKQNFaN/AdYwE/mOXhmujk3EFfovn2JP3pDnzpCo3CFU
 LYMK8Sg7dvRkIyx1ivouHAI5gAntPUc/Uuo7FZlOl/ep7M1J6ruGauyoYPcAape6VgM522
 PjXZjc4c0Pcqn5YqBmoBiNnx7yrxipA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-220-_Mel49NWPG2MrdPrrtztkg-1; Wed, 28 Sep 2022 03:19:16 -0400
X-MC-Unique: _Mel49NWPG2MrdPrrtztkg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5873E1C20AEC;
 Wed, 28 Sep 2022 07:19:16 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 27C1140C83BB;
 Wed, 28 Sep 2022 07:19:14 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 17/37] tests/qtest: Skip running virtio-net-test cases that
 require socketpair() for win32
Date: Wed, 28 Sep 2022 09:18:23 +0200
Message-Id: <20220928071843.1468323-18-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bin Meng <bin.meng@windriver.com>

Some of the virtio-net-test test cases require socketpair() to do the
test setup. Skip them for win32.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220925113032.1949844-29-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/virtio-net-test.c | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/tests/qtest/virtio-net-test.c b/tests/qtest/virtio-net-test.c
index 6ded252901..dff43f0f60 100644
--- a/tests/qtest/virtio-net-test.c
+++ b/tests/qtest/virtio-net-test.c
@@ -165,8 +165,6 @@ static void stop_cont_test(void *obj, void *data, QGuestAllocator *t_alloc)
     rx_stop_cont_test(dev, t_alloc, rx, sv[0]);
 }
 
-#endif
-
 static void hotplug(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtioPCIDevice *dev = obj;
@@ -286,6 +284,8 @@ static void *virtio_net_test_setup(GString *cmd_line, void *arg)
     return sv;
 }
 
+#endif /* _WIN32 */
+
 static void large_tx(void *obj, void *data, QGuestAllocator *t_alloc)
 {
     QVirtioNet *dev = obj;
@@ -319,16 +319,15 @@ static void *virtio_net_test_setup_nosocket(GString *cmd_line, void *arg)
 
 static void register_virtio_net_test(void)
 {
-    QOSGraphTestOptions opts = {
-        .before = virtio_net_test_setup,
-    };
+    QOSGraphTestOptions opts = { 0 };
 
-    qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
 #ifndef _WIN32
+    opts.before = virtio_net_test_setup;
+    qos_add_test("hotplug", "virtio-net-pci", hotplug, &opts);
     qos_add_test("basic", "virtio-net", send_recv_test, &opts);
     qos_add_test("rx_stop_cont", "virtio-net", stop_cont_test, &opts);
-#endif
     qos_add_test("announce-self", "virtio-net", announce_self, &opts);
+#endif
 
     /* These tests do not need a loopback backend.  */
     opts.before = virtio_net_test_setup_nosocket;
-- 
2.31.1


