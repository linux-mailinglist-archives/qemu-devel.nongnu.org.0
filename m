Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF85A5ED812
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:44:16 +0200 (CEST)
Received: from localhost ([::1]:53598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSfv-0002xh-Nf
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:44:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLh-0000yM-OA
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29207)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLX-0008Sq-43
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349546;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=d7S+a/NPPz5Pdw3vVRItqYkq+YsyiaI0EzdUXzDOmMg=;
 b=TXECj1a777byUxBv9iU8Dm++ksY5bS2vhxAqRc8c0bJM7UGm32gVw2ex3DG2OgcwGgEYE4
 Vc2WBVWe9jZiQs2Ez/Ss1DCIbYHmP4YyzOLc7m9acdYnZ2LDWGK+YPq6PriOAF1uOqC+aK
 4KEXO9s8qGS2T4FE1Ok054EFYsjNK8k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-587-yFTQ52xrNlW8B2Zr7Tv2ag-1; Wed, 28 Sep 2022 03:19:03 -0400
X-MC-Unique: yFTQ52xrNlW8B2Zr7Tv2ag-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E2123811E67;
 Wed, 28 Sep 2022 07:19:02 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C916340C83BB;
 Wed, 28 Sep 2022 07:19:01 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 09/37] tests/qtest: ide-test: Avoid using hardcoded /tmp
Date: Wed, 28 Sep 2022 09:18:15 +0200
Message-Id: <20220928071843.1468323-10-thuth@redhat.com>
In-Reply-To: <20220928071843.1468323-1-thuth@redhat.com>
References: <20220928071843.1468323-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Message-Id: <20220925113032.1949844-14-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/ide-test.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/tests/qtest/ide-test.c b/tests/qtest/ide-test.c
index 5bcb75a7e5..25302be6dc 100644
--- a/tests/qtest/ide-test.c
+++ b/tests/qtest/ide-test.c
@@ -121,8 +121,8 @@ enum {
 static QPCIBus *pcibus = NULL;
 static QGuestAllocator guest_malloc;
 
-static char tmp_path[] = "/tmp/qtest.XXXXXX";
-static char debug_path[] = "/tmp/qtest-blkdebug.XXXXXX";
+static char *tmp_path;
+static char *debug_path;
 
 static QTestState *ide_test_start(const char *cmdline_fmt, ...)
 {
@@ -1015,12 +1015,12 @@ int main(int argc, char **argv)
     int ret;
 
     /* Create temporary blkdebug instructions */
-    fd = mkstemp(debug_path);
+    fd = g_file_open_tmp("qtest-blkdebug.XXXXXX", &debug_path, NULL);
     g_assert(fd >= 0);
     close(fd);
 
     /* Create a temporary raw image */
-    fd = mkstemp(tmp_path);
+    fd = g_file_open_tmp("qtest.XXXXXX", &tmp_path, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert(ret == 0);
@@ -1049,7 +1049,9 @@ int main(int argc, char **argv)
 
     /* Cleanup */
     unlink(tmp_path);
+    g_free(tmp_path);
     unlink(debug_path);
+    g_free(debug_path);
 
     return ret;
 }
-- 
2.31.1


