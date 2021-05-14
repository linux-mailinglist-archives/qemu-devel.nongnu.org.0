Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6418D3809AC
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 14:35:43 +0200 (CEST)
Received: from localhost ([::1]:54900 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhX2c-0006Yd-H8
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 08:35:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjw-0001C3-Gn
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lhWjm-0005EL-Jb
 for qemu-devel@nongnu.org; Fri, 14 May 2021 08:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620994572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CZLa2NAA5RnSm1ynLTuWU4Ic/fIz8t7Ut7/0Lk3iolE=;
 b=B6GC+sjktROps8G8BIgcvPHRL2XBBUgibUpTstzFUtvn8NzZs1u2V6RMKQkfEnbYlA+x/I
 fN/vbsqpqFn/0Wu8kYSYgDCNc3DklkzpGNxi2WKtuPWjZrBlftP4leEWZyQs2nrGN+NEqP
 j1iQYn7MGlV2Ylxmf8i22oMu+EgE44o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-JmNZE3CoPweYaGawTPrWGQ-1; Fri, 14 May 2021 08:16:08 -0400
X-MC-Unique: JmNZE3CoPweYaGawTPrWGQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 98D959F93C;
 Fri, 14 May 2021 12:16:07 +0000 (UTC)
Received: from thuth.com (ovpn-112-191.ams2.redhat.com [10.36.112.191])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 43DEF6060F;
 Fri, 14 May 2021 12:16:06 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 14/20] tests: Avoid side effects inside g_assert() arguments
Date: Fri, 14 May 2021 14:15:12 +0200
Message-Id: <20210514121518.832729-15-thuth@redhat.com>
In-Reply-To: <20210514121518.832729-1-thuth@redhat.com>
References: <20210514121518.832729-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

For us, assertions are always enabled, but side-effect expressions
inside the argument to g_assert() are bad style anyway. Fix three
occurrences in IPMI related tests, which will silence some Coverity
nits.

Fixes: CID 1432322, CID 1432287, CID 1432291
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210503165525.26221-4-peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/ipmi-bt-test.c  | 6 ++++--
 tests/qtest/ipmi-kcs-test.c | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/ipmi-bt-test.c b/tests/qtest/ipmi-bt-test.c
index a42207d416..8492f02a9c 100644
--- a/tests/qtest/ipmi-bt-test.c
+++ b/tests/qtest/ipmi-bt-test.c
@@ -98,7 +98,8 @@ static void bt_wait_b_busy(void)
 {
     unsigned int count = 1000;
     while (IPMI_BT_CTLREG_GET_B_BUSY() != 0) {
-        g_assert(--count != 0);
+        --count;
+        g_assert(count != 0);
         usleep(100);
     }
 }
@@ -107,7 +108,8 @@ static void bt_wait_b2h_atn(void)
 {
     unsigned int count = 1000;
     while (IPMI_BT_CTLREG_GET_B2H_ATN() == 0) {
-        g_assert(--count != 0);
+        --count;
+        g_assert(count != 0);
         usleep(100);
     }
 }
diff --git a/tests/qtest/ipmi-kcs-test.c b/tests/qtest/ipmi-kcs-test.c
index fc0a918c8d..afc24dd3e4 100644
--- a/tests/qtest/ipmi-kcs-test.c
+++ b/tests/qtest/ipmi-kcs-test.c
@@ -73,7 +73,8 @@ static void kcs_wait_ibf(void)
 {
     unsigned int count = 1000;
     while (IPMI_KCS_CMDREG_GET_IBF() != 0) {
-        g_assert(--count != 0);
+        --count;
+        g_assert(count != 0);
     }
 }
 
-- 
2.27.0


