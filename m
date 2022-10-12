Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A84905FC2A2
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Oct 2022 11:04:57 +0200 (CEST)
Received: from localhost ([::1]:55702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiXfc-0004br-GG
	for lists+qemu-devel@lfdr.de; Wed, 12 Oct 2022 05:04:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiXaY-0000rW-Tg
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:59:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oiXaX-00086c-KK
 for qemu-devel@nongnu.org; Wed, 12 Oct 2022 04:59:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665565180;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=9/PGeRxzlL/LXZ1nc6/2psKtyGWYy1DQzFGnXBplkMc=;
 b=Pwh5QN60J6eY3yQWPwffeoEenLvbGY8/2Xs666I6i7ysUiZ7B8+Nrb7YlvEOIfDWwHQW74
 iRoV2gXNca95jJ8ocyC6XHU+h9LYIHod4lE/ob4Vkbz8ynZizt7r3/wpmKe7I4UpJAPIB1
 gR4Jr2wNkr+mF/r9hv3YzGr/cHleWpw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-661-mj366lirMNqZL4gkO_STDQ-1; Wed, 12 Oct 2022 04:59:36 -0400
X-MC-Unique: mj366lirMNqZL4gkO_STDQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2602C1C006B2;
 Wed, 12 Oct 2022 08:59:36 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.235])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1B74D40E993E;
 Wed, 12 Oct 2022 08:59:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Fam Zheng <fam@euphon.net>,
	qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org
Subject: [PATCH] tests/unit/test-image-locking: Fix handling of temporary files
Date: Wed, 12 Oct 2022 10:59:32 +0200
Message-Id: <20221012085932.799221-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

test-image-locking leaves some temporary files around - clean
them up. While we're at it, test-image-locking is a unit test,
so it should not use "qtest.*" for temporary file names. Give
them better names instead, so that it clear where the temporary
files come from.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/unit/test-image-locking.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tests/unit/test-image-locking.c b/tests/unit/test-image-locking.c
index a47299c247..2624cec6a0 100644
--- a/tests/unit/test-image-locking.c
+++ b/tests/unit/test-image-locking.c
@@ -79,7 +79,7 @@ static void test_image_locking_basic(void)
     g_autofree char *img_path = NULL;
     uint64_t perm, shared_perm;
 
-    int fd = g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
+    int fd = g_file_open_tmp("qemu-tst-img-lock.XXXXXX", &img_path, NULL);
     assert(fd >= 0);
 
     perm = BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
@@ -120,7 +120,7 @@ static void test_set_perm_abort(void)
     g_autofree char *img_path = NULL;
     uint64_t perm, shared_perm;
     int r;
-    int fd = g_file_open_tmp("qtest.XXXXXX", &img_path, NULL);
+    int fd = g_file_open_tmp("qemu-tst-img-lock.XXXXXX", &img_path, NULL);
     assert(fd >= 0);
 
     perm = BLK_PERM_WRITE | BLK_PERM_CONSISTENT_READ;
@@ -140,6 +140,8 @@ static void test_set_perm_abort(void)
     check_locked_bytes(fd, perm, ~shared_perm);
     blk_unref(blk1);
     blk_unref(blk2);
+    close(fd);
+    unlink(img_path);
 }
 
 int main(int argc, char **argv)
-- 
2.31.1


