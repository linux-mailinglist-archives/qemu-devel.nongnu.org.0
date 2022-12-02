Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F000D6407AC
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Dec 2022 14:28:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p164W-0005ni-Mc; Fri, 02 Dec 2022 08:27:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p164M-0005nO-FA
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:27:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1p164K-0004Gh-Ck
 for qemu-devel@nongnu.org; Fri, 02 Dec 2022 08:27:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669987627;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=QIImfJgqwIHG66Q0poMzRPI983sxe8T+J7ZFfwU1Ns8=;
 b=FeyDoUCuBb5ka2VfC7wrQW1atnF31hVDAPgcREmkiIjitCyPW5rMvm1+0KAgWUIWjT4vJ4
 h73zG4OP55IB6BHIwcRzkfxEjzig5cMl0Hw/+O7n0nyH3ccQcGHuAIX58IvE12p1JwsxKe
 tuRMWM7RCxXgdnJoTNmh+FiBmg5ncF4=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-423-R5i-sq9pNfSug1goT4Rbbg-1; Fri, 02 Dec 2022 08:27:06 -0500
X-MC-Unique: R5i-sq9pNfSug1goT4Rbbg-1
Received: by mail-wr1-f72.google.com with SMTP id
 d6-20020adfa346000000b0024211c0f988so1065752wrb.9
 for <qemu-devel@nongnu.org>; Fri, 02 Dec 2022 05:27:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QIImfJgqwIHG66Q0poMzRPI983sxe8T+J7ZFfwU1Ns8=;
 b=Vy8gDBCHYlKENXjSz8wb4V5p9gi/IffGhOvN7nJU0F7l/5GJ3ejvtS3PBZrlDmeZj2
 c7SLiabYfLptACfOGpe1VIPNvvgkiio68o7CYvB1DzZ5BH62rfHGWhhFq91a/4C7idkR
 Cl4phR600EHSLvfsyAu2iaACiDbxIukVSqPS5XGxXicB8tnPcgDJE0I8Sca26QjB634Z
 SFI/gvaMfZAvAhYvQAhemlBUPRWSUKfEVEd8pP66ZSY5yEk0ARkKuZbc+cG45Iwq19Pd
 gxtlhJcz7EO3UJB6bKFZdK9tTd1wBqA3H0pn1I/W26CalSJI+zptSu5+lhTHPqgczAdu
 FJzw==
X-Gm-Message-State: ANoB5pn5JS6RcFpSsQtmSNEbMCsM3fqipgFd5303yLotnQErL2J4X6Ew
 cMw1RbZ3lax/d2PqJnO6R32okmeQ9EucCq+39nEslkmCCz0WdEPof1JUBJ00SakM+gawt8KV5HP
 JqPztQgvRazjATonWqwKwHqQd9ThQ7Jv5vj1DgOuqZOh+RjvnhT3xKUGOec9w1wbVa7U=
X-Received: by 2002:a7b:cb83:0:b0:3cf:96da:3846 with SMTP id
 m3-20020a7bcb83000000b003cf96da3846mr53876284wmi.10.1669987624640; 
 Fri, 02 Dec 2022 05:27:04 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5wcPIG2TnXpnIF62zWaEKsQBclBGokDeVzm6wkEzCym1/Va9rcnBmvdQDKhRzQZBuzZM0etg==
X-Received: by 2002:a7b:cb83:0:b0:3cf:96da:3846 with SMTP id
 m3-20020a7bcb83000000b003cf96da3846mr53876266wmi.10.1669987624296; 
 Fri, 02 Dec 2022 05:27:04 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a5d4e92000000b0024206ed539fsm6871484wru.66.2022.12.02.05.27.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 05:27:03 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	kwolf@redhat.com,
	eesposit@redhat.com
Subject: [RFC PATCH] test-bdrv-drain: keep graph manipulations out of
 coroutines
Date: Fri,  2 Dec 2022 14:27:01 +0100
Message-Id: <20221202132701.531048-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Changes to the BlockDriverState graph will have to take the
corresponding lock for writing, and therefore cannot be done
inside a coroutine.  Move them outside the test body.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 tests/unit/test-bdrv-drain.c | 63 ++++++++++++++++++++++++++----------
 1 file changed, 46 insertions(+), 17 deletions(-)

diff --git a/tests/unit/test-bdrv-drain.c b/tests/unit/test-bdrv-drain.c
index 6ae44116fe79..d85083dd4f9e 100644
--- a/tests/unit/test-bdrv-drain.c
+++ b/tests/unit/test-bdrv-drain.c
@@ -199,25 +199,40 @@ static void do_drain_end_unlocked(enum drain_type drain_type, BlockDriverState *
     }
 }
 
+static BlockBackend *blk;
+static BlockDriverState *bs, *backing;
+
+static void test_drv_cb_init(void)
+{
+    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
+    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
+                              &error_abort);
+    blk_insert_bs(blk, bs, &error_abort);
+
+    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
+    bdrv_set_backing_hd(bs, backing, &error_abort);
+}
+
+static void test_drv_cb_fini(void)
+{
+    bdrv_unref(backing);
+    bdrv_unref(bs);
+    blk_unref(blk);
+    backing = NULL;
+    bs = NULL;
+    blk = NULL;
+}
+
 static void test_drv_cb_common(enum drain_type drain_type, bool recursive)
 {
-    BlockBackend *blk;
-    BlockDriverState *bs, *backing;
     BDRVTestState *s, *backing_s;
     BlockAIOCB *acb;
     int aio_ret;
 
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, NULL, 0);
 
-    blk = blk_new(qemu_get_aio_context(), BLK_PERM_ALL, BLK_PERM_ALL);
-    bs = bdrv_new_open_driver(&bdrv_test, "test-node", BDRV_O_RDWR,
-                              &error_abort);
     s = bs->opaque;
-    blk_insert_bs(blk, bs, &error_abort);
-
-    backing = bdrv_new_open_driver(&bdrv_test, "backing", 0, &error_abort);
     backing_s = backing->opaque;
-    bdrv_set_backing_hd(bs, backing, &error_abort);
 
     /* Simple bdrv_drain_all_begin/end pair, check that CBs are called */
     g_assert_cmpint(s->drain_count, ==, 0);
@@ -252,30 +267,44 @@ static void test_drv_cb_common(enum drain_type drain_type, bool recursive)
 
     g_assert_cmpint(s->drain_count, ==, 0);
     g_assert_cmpint(backing_s->drain_count, ==, 0);
-
-    bdrv_unref(backing);
-    bdrv_unref(bs);
-    blk_unref(blk);
 }
 
-static void test_drv_cb_drain_all(void)
+static void test_drv_cb_do_drain_all(void)
 {
     test_drv_cb_common(BDRV_DRAIN_ALL, true);
 }
 
-static void test_drv_cb_drain(void)
+static void test_drv_cb_do_drain(void)
 {
     test_drv_cb_common(BDRV_DRAIN, false);
 }
 
+static void test_drv_cb_drain_all(void)
+{
+    test_drv_cb_init();
+    test_drv_cb_do_drain_all();
+    test_drv_cb_fini();
+}
+
+static void test_drv_cb_drain(void)
+{
+    test_drv_cb_init();
+    test_drv_cb_do_drain();
+    test_drv_cb_fini();
+}
+
 static void test_drv_cb_co_drain_all(void)
 {
-    call_in_coroutine(test_drv_cb_drain_all);
+    test_drv_cb_init();
+    call_in_coroutine(test_drv_cb_do_drain_all);
+    test_drv_cb_fini();
 }
 
 static void test_drv_cb_co_drain(void)
 {
-    call_in_coroutine(test_drv_cb_drain);
+    test_drv_cb_init();
+    call_in_coroutine(test_drv_cb_do_drain);
+    test_drv_cb_fini();
 }
 
 static void test_quiesce_common(enum drain_type drain_type, bool recursive)
-- 
2.38.1


