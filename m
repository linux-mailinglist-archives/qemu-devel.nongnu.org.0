Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A92C347D141
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Dec 2021 12:46:58 +0100 (CET)
Received: from localhost ([::1]:51650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n005B-0000xg-PI
	for lists+qemu-devel@lfdr.de; Wed, 22 Dec 2021 06:46:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51154)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzsw-0001JB-P9
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:34:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mzzsi-00072W-MH
 for qemu-devel@nongnu.org; Wed, 22 Dec 2021 06:34:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640172842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=udEztULZ4lqPUg1czD/LOzeZJLmpXbIItISvorfhQIk=;
 b=PelFmp8Yyk7yI7q74DeLl4u0yna2wZ5tJ+eBfRbv9/tW8c4VE6M/7Lls0yojO3Zv8sUuvh
 B8S+5bmkjpUuo+5f+W77QJ1SL+AMN/E6xzD30/PSK+6H8IfKpbxzsbzcbw97pinCT1gnvh
 D1iO33T4ODYodlfJZ3bngyuDDzOhiWA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-449-ZetR0qGLNdGcwK0UPKirwQ-1; Wed, 22 Dec 2021 06:34:00 -0500
X-MC-Unique: ZetR0qGLNdGcwK0UPKirwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DC691801ADB;
 Wed, 22 Dec 2021 11:33:59 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.135])
 by smtp.corp.redhat.com (Postfix) with ESMTP id ED34378DFB;
 Wed, 22 Dec 2021 11:33:58 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 8/9] tests/qtest/boot-order-test: Check whether machines are
 available
Date: Wed, 22 Dec 2021 12:32:58 +0100
Message-Id: <20211222113259.823203-9-thuth@redhat.com>
In-Reply-To: <20211222113259.823203-1-thuth@redhat.com>
References: <20211222113259.823203-1-thuth@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Machines might not always be compiled into the QEMU binary, so
we should skip the test instead of failing if it is not available.

Message-Id: <20211220081054.151515-5-thuth@redhat.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/boot-order-test.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tests/qtest/boot-order-test.c b/tests/qtest/boot-order-test.c
index fac580d6c4..f1f59b1261 100644
--- a/tests/qtest/boot-order-test.c
+++ b/tests/qtest/boot-order-test.c
@@ -34,6 +34,11 @@ static void test_a_boot_order(const char *machine,
     uint64_t actual;
     QTestState *qts;
 
+    if (machine && !qtest_has_machine(machine)) {
+        g_test_skip("Machine is not available");
+        return;
+    }
+
     qts = qtest_initf("-nodefaults%s%s %s", machine ? " -M " : "",
                       machine ?: "", test_args);
     actual = read_boot_order(qts);
-- 
2.27.0


