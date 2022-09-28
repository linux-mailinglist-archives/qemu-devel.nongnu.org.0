Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 685855ED93F
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 11:35:46 +0200 (CEST)
Received: from localhost ([::1]:43574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odTTl-00077L-CS
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 05:35:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRMF-0001Bz-RT
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRME-00007a-5V
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=x9a/iLkvV9nX/Z9hqOhap4cH95/5W49ebk7XBIO4w1A=;
 b=EzT/OBPKWyXdTRAtc7gmzbQMCHCjkoXwc0HjP+dUeEM4hkKR6WUwAjak4BiYRo5B7Wxwup
 rBgNe0uTpbv5KoacQMouo61e9+7bJSHzISYLI3d88wbR29XXWl8jcXx9SbnWhifmKzY9Fw
 nu/+7EwuCLJ9tC49Coo1yhvf9hyCkyU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-161-sXvwVTk-NQKz_Kzk6VMZgw-1; Wed, 28 Sep 2022 03:19:46 -0400
X-MC-Unique: sXvwVTk-NQKz_Kzk6VMZgw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4A311882820;
 Wed, 28 Sep 2022 07:19:46 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03BDE40C83BB;
 Wed, 28 Sep 2022 07:19:44 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 33/37] tests/qtest: pflash-cfi02-test: Avoid using hardcoded
 /tmp
Date: Wed, 28 Sep 2022 09:18:39 +0200
Message-Id: <20220928071843.1468323-34-thuth@redhat.com>
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
Message-Id: <20220927110632.1973965-16-bmeng.cn@gmail.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/pflash-cfi02-test.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/tests/qtest/pflash-cfi02-test.c b/tests/qtest/pflash-cfi02-test.c
index 7fce614b64..0b52c2ca5c 100644
--- a/tests/qtest/pflash-cfi02-test.c
+++ b/tests/qtest/pflash-cfi02-test.c
@@ -56,7 +56,7 @@ typedef struct {
     QTestState *qtest;
 } FlashConfig;
 
-static char image_path[] = "/tmp/qtest.XXXXXX";
+static char *image_path;
 
 /*
  * The pflash implementation allows some parameters to be unspecified. We want
@@ -608,6 +608,7 @@ static void test_cfi_in_autoselect(const void *opaque)
 static void cleanup(void *opaque)
 {
     unlink(image_path);
+    g_free(image_path);
 }
 
 /*
@@ -635,16 +636,14 @@ static const FlashConfig configuration[] = {
 
 int main(int argc, char **argv)
 {
-    int fd = mkstemp(image_path);
-    if (fd == -1) {
-        g_printerr("Failed to create temporary file %s: %s\n", image_path,
-                   strerror(errno));
-        exit(EXIT_FAILURE);
-    }
+    GError *err = NULL;
+    int fd = g_file_open_tmp("qtest.XXXXXX", &image_path, &err);
+    g_assert_no_error(err);
+
     if (ftruncate(fd, UNIFORM_FLASH_SIZE) < 0) {
         int error_code = errno;
         close(fd);
-        unlink(image_path);
+        cleanup(NULL);
         g_printerr("Failed to truncate file %s to %u MB: %s\n", image_path,
                    UNIFORM_FLASH_SIZE, strerror(error_code));
         exit(EXIT_FAILURE);
-- 
2.31.1


