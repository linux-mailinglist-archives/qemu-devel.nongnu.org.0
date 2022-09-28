Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D95535ED813
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 10:44:58 +0200 (CEST)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odSgb-0003gj-AV
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 04:44:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRM2-00016E-W8
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRM1-000054-Dc
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349576;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CJhyWf8VOIPFc/8+4MV56CGViqzkStB9MarF3b5Sfoo=;
 b=Cto8fLMnzPHpiFyCJ9J3pQ06QgdpuRkuaN9C16Szgo+58eHJDbSjY0GcopqIKYj7KAmCZ7
 fF0HyeN9lBje7It6Wg0HDnceUmb5R92IOEdNoIFbz4lZsfj9WxSJcDJZNOronxSoDA9QTi
 oyPVzqyzy2wo6nNNOE5jz6Mov13ClaU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-580-3iMRJNxPPwCX3uhxBoXjkQ-1; Wed, 28 Sep 2022 03:19:31 -0400
X-MC-Unique: 3iMRJNxPPwCX3uhxBoXjkQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E0CA0101A528;
 Wed, 28 Sep 2022 07:19:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 38E0A40C83BB;
 Wed, 28 Sep 2022 07:19:26 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>
Subject: [PULL 23/37] tests/qtest: bios-tables-test: Adapt the case for win32
Date: Wed, 28 Sep 2022 09:18:29 +0200
Message-Id: <20220928071843.1468323-24-thuth@redhat.com>
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

Single quotes in the arguments (oem_id='CRASH ') are not removed in
the Windows environment before it is passed to the QEMU executable.
The space in the argument causes the "-acpitable" option parser to
think that all of its parameters are done, hence it complains:

  '-acpitable' requires one of 'data' or 'file'

Change to use double quotes which works fine on all platforms.

Also /dev/null does not work on win32, and nul should be used.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Michael S. Tsirkin <mst@redhat.com>
Message-Id: <20220925113032.1949844-39-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/bios-tables-test.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
index 46a46fe0aa..2ebeb530b2 100644
--- a/tests/qtest/bios-tables-test.c
+++ b/tests/qtest/bios-tables-test.c
@@ -1615,6 +1615,12 @@ static void test_acpi_virt_viot(void)
     free_test_data(&data);
 }
 
+#ifndef _WIN32
+# define DEV_NULL "/dev/null"
+#else
+# define DEV_NULL "nul"
+#endif
+
 static void test_acpi_q35_slic(void)
 {
     test_data data = {
@@ -1622,9 +1628,9 @@ static void test_acpi_q35_slic(void)
         .variant = ".slic",
     };
 
-    test_acpi_one("-acpitable sig=SLIC,oem_id='CRASH ',oem_table_id='ME',"
-                  "oem_rev=00002210,asl_compiler_id='qemu',"
-                  "asl_compiler_rev=00000000,data=/dev/null",
+    test_acpi_one("-acpitable sig=SLIC,oem_id=\"CRASH \",oem_table_id=ME,"
+                  "oem_rev=00002210,asl_compiler_id=qemu,"
+                  "asl_compiler_rev=00000000,data=" DEV_NULL,
                   &data);
     free_test_data(&data);
 }
-- 
2.31.1


