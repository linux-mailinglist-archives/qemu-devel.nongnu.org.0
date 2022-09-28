Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD195ED723
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:09:30 +0200 (CEST)
Received: from localhost ([::1]:57708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odS8G-0003zd-0j
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLm-0000ym-Lz
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21168)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLh-0008UE-1T
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i0YznsIzHmGPhqkaGSdouJT+RzkCcPK63D9jyeY1UD0=;
 b=Y5twolEoi19efYRfb4O/kLFoLa9G3AwCzKKepyFm+N4MFduvnO1UcZqB3N2ICGKDV7z0IQ
 EEv6igOW/pgwHcrSp/5QQHarZDU7BLxXCN+6xF4m1k8gDQRE6VIU8WqOMmvW1Gr95McODg
 fyqrK+X5Ixn9caQ6a+GB4jNDlkP5dvo=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-664-HLNbarwSN3ebGQH6-V6Gtw-1; Wed, 28 Sep 2022 03:19:11 -0400
X-MC-Unique: HLNbarwSN3ebGQH6-V6Gtw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AD9803C01D9D;
 Wed, 28 Sep 2022 07:19:10 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 91AD440C83BB;
 Wed, 28 Sep 2022 07:19:09 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 14/37] tests/unit: test-image-locking: Avoid using hardcoded
 /tmp
Date: Wed, 28 Sep 2022 09:18:20 +0200
Message-Id: <20220928071843.1468323-15-thuth@redhat.com>
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

This case was written to use hardcoded /tmp directory for temporary
files. Update to use g_file_open_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220925113032.1949844-23-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/test-image-locking.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tests/unit/test-image-locking.c b/tests/unit/test-image-locking.c
index ba057bd66c..a47299c247 100644
--- a/tests/unit/test-image-locking.c
+++ b/tests/unit/test-image-locking.c
@@ -76,10 +76,10 @@ static void check_locked_bytes(int fd, uint64_t perm_locks,
 static void test_image_locking_basic(void)
 {
     BlockBackend *blk1, *blk2, *blk3;
-    char img_path[] = "/tmp/qtest.XXXXXX";
+    g_autofree char *img_path = NULL;
     uint64_t perm, shared_perm;
 
-    int fd = mkstemp(img_path);
+    int fd = g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
     assert(fd >= 0);
 
     perm = BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
@@ -117,10 +117,10 @@ static void test_image_locking_basic(void)
 static void test_set_perm_abort(void)
 {
     BlockBackend *blk1, *blk2;
-    char img_path[] = "/tmp/qtest.XXXXXX";
+    g_autofree char *img_path = NULL;
     uint64_t perm, shared_perm;
     int r;
-    int fd = mkstemp(img_path);
+    int fd = g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
     assert(fd >= 0);
 
     perm = BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
-- 
2.31.1


