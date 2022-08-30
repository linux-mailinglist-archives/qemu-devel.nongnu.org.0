Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4402A5A6CA9
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 21:00:18 +0200 (CEST)
Received: from localhost ([::1]:50064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6TA-0002VD-Os
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 15:00:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38910)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6AB-0007PI-1G
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A6-00056Y-Sd
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884834;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ftPwrgWCFS+Lpkyl6UYQ2VP3sjUlfXCBiqOHOk1jIIM=;
 b=CkgpG6pccL9qrqb1vnuk0I2ffRVGDP+qyFtDZ416+GfsUuP3mKoW1YK44Pq/pZxF2xpZ/I
 gn0xU4+CRvE/5ortXryLvFv4mDRiBeupr36DO0TwXq6ykeJT+4R6snzj0b9ifcLtu+HItw
 coxP084bY3CWSJAlZ7yFX8HTvLhzz8s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-WjbYvdSPO4WHPIElt51Yrg-1; Tue, 30 Aug 2022 14:40:30 -0400
X-MC-Unique: WjbYvdSPO4WHPIElt51Yrg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 93C1880231E;
 Tue, 30 Aug 2022 18:40:30 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A4F11415117;
 Tue, 30 Aug 2022 18:40:29 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>
Subject: [PULL 09/23] tests/qtest: i440fx-test: Skip running request_{bios,
 pflash} for win32
Date: Tue, 30 Aug 2022 20:39:58 +0200
Message-Id: <20220830184012.77978-10-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The request_{bios,pflash} test cases call mmap() which does not
exist on win32. Exclude them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220824094029.1634519-21-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/i440fx-test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/i440fx-test.c b/tests/qtest/i440fx-test.c
index 6d7d4d8d8f..3890f1237c 100644
--- a/tests/qtest/i440fx-test.c
+++ b/tests/qtest/i440fx-test.c
@@ -278,6 +278,8 @@ static void test_i440fx_pam(gconstpointer opaque)
     qtest_end();
 }
 
+#ifndef _WIN32
+
 #define BLOB_SIZE ((size_t)65536)
 #define ISA_BIOS_MAXSZ ((size_t)(128 * 1024))
 
@@ -396,6 +398,8 @@ static void request_pflash(FirmwareTestFixture *fixture,
     fixture->is_bios = false;
 }
 
+#endif /* _WIN32 */
+
 int main(int argc, char **argv)
 {
     TestData data;
@@ -406,8 +410,10 @@ int main(int argc, char **argv)
 
     qtest_add_data_func("i440fx/defaults", &data, test_i440fx_defaults);
     qtest_add_data_func("i440fx/pam", &data, test_i440fx_pam);
+#ifndef _WIN32
     add_firmware_test("i440fx/firmware/bios", request_bios);
     add_firmware_test("i440fx/firmware/pflash", request_pflash);
+#endif
 
     return g_test_run();
 }
-- 
2.31.1


