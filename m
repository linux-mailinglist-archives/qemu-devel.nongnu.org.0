Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9F45ED671
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 09:41:35 +0200 (CEST)
Received: from localhost ([::1]:47834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odRhF-0005CJ-D0
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 03:41:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLS-0000vi-RX
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1odRLQ-0008Rr-JG
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 03:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664349539;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nsT/MYvq1C+hW8KNERyVSGCrtj4yc5rro7ngvowcej4=;
 b=S6qa1ONbvyfqCTHm85lXP6f9UmTF3gtYyHglRp19VMM5n/pdpl3Gj/IfPEQW2qSYNsHaYT
 YsGfFX2jmCA0wVXtIcF28WjyL/TPP/ulinQaHd9v7S5k7nvEo8Lyjr0J8YpTIzUzTqGs4P
 kJGrgMoB15XZAjD3EjUd60thpT1c4lw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-82-3p88ceqnMUCd9hbvy3899g-1; Wed, 28 Sep 2022 03:18:58 -0400
X-MC-Unique: 3p88ceqnMUCd9hbvy3899g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2447A2999B4C;
 Wed, 28 Sep 2022 07:18:58 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.28])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E164A40C83BB;
 Wed, 28 Sep 2022 07:18:56 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 06/37] tests/qtest: fdc-test: Avoid using hardcoded /tmp
Date: Wed, 28 Sep 2022 09:18:12 +0200
Message-Id: <20220928071843.1468323-7-thuth@redhat.com>
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
Message-Id: <20220925113032.1949844-10-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/fdc-test.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/tests/qtest/fdc-test.c b/tests/qtest/fdc-test.c
index 52ade90a7d..1f9b99ad6d 100644
--- a/tests/qtest/fdc-test.c
+++ b/tests/qtest/fdc-test.c
@@ -68,7 +68,7 @@ enum {
     DSKCHG  = 0x80,
 };
 
-static char test_image[] = "/tmp/qtest.XXXXXX";
+static char *test_image;
 
 #define assert_bit_set(data, mask) g_assert_cmphex((data) & (mask), ==, (mask))
 #define assert_bit_clear(data, mask) g_assert_cmphex((data) & (mask), ==, 0)
@@ -608,7 +608,7 @@ int main(int argc, char **argv)
     int ret;
 
     /* Create a temporary raw image */
-    fd = mkstemp(test_image);
+    fd = g_file_open_tmp("qtest.XXXXXX", &test_image, NULL);
     g_assert(fd >= 0);
     ret = ftruncate(fd, TEST_IMAGE_SIZE);
     g_assert(ret == 0);
@@ -640,6 +640,7 @@ int main(int argc, char **argv)
     /* Cleanup */
     qtest_end();
     unlink(test_image);
+    g_free(test_image);
 
     return ret;
 }
-- 
2.31.1


