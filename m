Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 176B12BB146
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 18:20:50 +0100 (CET)
Received: from localhost ([::1]:50900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgA5X-0006oJ-31
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 12:20:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48480)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kgA3X-00055N-29
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:18:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41705)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kgA3U-0008WA-2E
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 12:18:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605892719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8LVZXcvCwu/gbuX+5gUGHCq1KMjGh8RW9ntvKjcK/GM=;
 b=Uwy/eHx4+Xqtm6BK2sF2mGx7oYFcHpWRy+E1PufRBY65bQaG/oxM4cGlP2mU3hAbyaVci4
 Di10ziS+N1UX9kl4dki6NBoNIn11hGYug65906F73+Br6k5Mh4lTfo11si7cJrVuqm4wz+
 Ozh5DI3o+jVJfeh4CdWzUWuA3sHK5LQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-8wMyf_w_OTacKbzZry6SgQ-1; Fri, 20 Nov 2020 12:18:36 -0500
X-MC-Unique: 8wMyf_w_OTacKbzZry6SgQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E202E911E4;
 Fri, 20 Nov 2020 17:18:35 +0000 (UTC)
Received: from thuth.com (ovpn-112-135.ams2.redhat.com [10.36.112.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1652E5D6D1;
 Fri, 20 Nov 2020 17:18:34 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/4] tests/qtest: variable defined by g_autofree need to be
 initialized
Date: Fri, 20 Nov 2020 18:18:26 +0100
Message-Id: <20201120171828.488611-3-thuth@redhat.com>
In-Reply-To: <20201120171828.488611-1-thuth@redhat.com>
References: <20201120171828.488611-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

From: Chen Qun <kuhn.chenqun@huawei.com>

According to the glib function requirements, we need initialise
 the variable. Otherwise there will be compilation warnings:

glib-autocleanups.h:28:3: warning: ‘full_name’ may be
used uninitialized in this function [-Wmaybe-uninitialized]
   28 |   g_free (*pp);
      |   ^~~~~~~~~~~~

Reported-by: Euler Robot <euler.robot@huawei.com>
Signed-off-by: Chen Qun <kuhn.chenqun@huawei.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Havard Skinnemoen <hskinnemoen@google.com>
Message-Id: <20201118115646.2461726-2-kuhn.chenqun@huawei.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/npcm7xx_timer-test.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/tests/qtest/npcm7xx_timer-test.c b/tests/qtest/npcm7xx_timer-test.c
index f08b0cd62a..83774a5b90 100644
--- a/tests/qtest/npcm7xx_timer-test.c
+++ b/tests/qtest/npcm7xx_timer-test.c
@@ -512,11 +512,9 @@ static void test_disable_on_expiration(gconstpointer test_data)
  */
 static void tim_add_test(const char *name, const TestData *td, GTestDataFunc fn)
 {
-    g_autofree char *full_name;
-
-    full_name = g_strdup_printf("npcm7xx_timer/tim[%d]/timer[%d]/%s",
-                                tim_index(td->tim), timer_index(td->timer),
-                                name);
+    g_autofree char *full_name = g_strdup_printf(
+        "npcm7xx_timer/tim[%d]/timer[%d]/%s", tim_index(td->tim),
+        timer_index(td->timer), name);
     qtest_add_data_func(full_name, td, fn);
 }
 
-- 
2.18.4


