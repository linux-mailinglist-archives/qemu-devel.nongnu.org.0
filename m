Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C4FC5ED8DA
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:24:13 +0200 (CEST)
Received: from localhost ([::1]:54150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTIa-0006A8-Fj
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:24:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLU-0000wo-5A
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23108)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLS-0008SD-HG
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZoEDCSw4xYTrv72BG6q3jqBdnLXfwig/ukmMFjh8lXg=;
 b=fzlziSgKDZRBczROlOjAvp8CcacG9kv8yIxEJp2pMAGzEt7uzf5jAKPkDEUhBzp4ykGhB6
 HV0c5WmAvt98UPhMWHsUQzOz2p//oshywWOVzU52jLQ+TnymXIyAqsGZNn0xE3gvRVEh4A
 Hd0Rc/OhH+SAAvFdJTka8XJRujg9sTo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-pxV-hzn5N1WkSc6iKvnDpw-1; Wed, 28 Sep 2022 03:18:56 -0400
X-MC-Unique: pxV-hzn5N1WkSc6iKvnDpw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7C489101CC67;
 Wed, 28 Sep 2022 07:18:56 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5C1AE40C83BB;
 Wed, 28 Sep 2022 07:18:55 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 05/37] tests/qtest: cxl-test: Avoid using hardcoded /tmp
Date: Wed, 28 Sep 2022 09:18:11 +0200
Message-Id: <20220928071843.1468323-6-thuth@redhat.com>
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
files. Update to use g_dir_make_tmp() for a portable implementation.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20220925113032.1949844-9-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/cxl-test.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/tests/qtest/cxl-test.c b/tests/qtest/cxl-test.c
index 2e14da7dee..cbe0fb549b 100644
--- a/tests/qtest/cxl-test.c
+++ b/tests/qtest/cxl-test.c
@@ -93,10 +93,9 @@ static void cxl_2root_port(void)
 static void cxl_t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_PXB_CMD QEMU_RP QEMU_T3D, tmpfs, tmpfs);
 
@@ -107,10 +106,9 @@ static void cxl_t3d(void)
 static void cxl_1pxb_2rp_2t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_PXB_CMD QEMU_2RP QEMU_2T3D,
                     tmpfs, tmpfs, tmpfs, tmpfs);
@@ -122,10 +120,9 @@ static void cxl_1pxb_2rp_2t3d(void)
 static void cxl_2pxb_4rp_4t3d(void)
 {
     g_autoptr(GString) cmdline = g_string_new(NULL);
-    char template[] = "/tmp/cxl-test-XXXXXX";
-    const char *tmpfs;
+    g_autofree const char *tmpfs = NULL;
 
-    tmpfs = g_mkdtemp(template);
+    tmpfs = g_dir_make_tmp("cxl-test-XXXXXX", NULL);
 
     g_string_printf(cmdline, QEMU_2PXB_CMD QEMU_4RP QEMU_4T3D,
                     tmpfs, tmpfs, tmpfs, tmpfs, tmpfs, tmpfs,
-- 
2.31.1


