Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8840E38B50D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 19:17:37 +0200 (CEST)
Received: from localhost ([::1]:48908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljmIi-0003Mt-AA
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 13:17:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm7U-0001wr-Da
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:06:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1ljm7K-0005fh-2N
 for qemu-devel@nongnu.org; Thu, 20 May 2021 13:06:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621530349;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pdOZcruB1pNkMCesftF2wj8eJkVMil4kQmgcUFP93NY=;
 b=O1FDF8T6+YkJcfc8QyQN1CKNj61gXsA/8HIAD3t3P8J5wjUW5getNITAVOX4tUl6MWRddZ
 wPC/CZaO9DC7HlH4OdslP78AhsYmWq/siKtD2rxqnZT54HiWOyWl2FeiKbJF3tfz0cKeSt
 NLJZ0eSGgKurMZzXtoghFHbnOsSP4Bk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-1g8xtBAEMC6K7PHXDM8KIg-1; Thu, 20 May 2021 13:05:45 -0400
X-MC-Unique: 1g8xtBAEMC6K7PHXDM8KIg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2DEA61E560;
 Thu, 20 May 2021 17:05:44 +0000 (UTC)
Received: from gondolin.fritz.box (ovpn-113-166.ams2.redhat.com
 [10.36.113.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D66DC5D6D5;
 Thu, 20 May 2021 17:05:42 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL v2 9/9] tests/tcg/x86_64: add vsyscall smoke test
Date: Thu, 20 May 2021 19:05:19 +0200
Message-Id: <20210520170519.300951-10-cohuck@redhat.com>
In-Reply-To: <20210520170519.300951-1-cohuck@redhat.com>
References: <20210520170519.300951-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-s390x@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ilya Leoshkevich <iii@linux.ibm.com>

Having a small test will prevent trivial regressions in the future.

Signed-off-by: Ilya Leoshkevich <iii@linux.ibm.com>
Message-Id: <20210519045738.1335210-3-iii@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 tests/tcg/x86_64/Makefile.target |  6 +++++-
 tests/tcg/x86_64/vsyscall.c      | 12 ++++++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)
 create mode 100644 tests/tcg/x86_64/vsyscall.c

diff --git a/tests/tcg/x86_64/Makefile.target b/tests/tcg/x86_64/Makefile.target
index 20bf96202ad2..2151ea6302ec 100644
--- a/tests/tcg/x86_64/Makefile.target
+++ b/tests/tcg/x86_64/Makefile.target
@@ -3,14 +3,18 @@
 # x86_64 tests - included from tests/tcg/Makefile.target
 #
 # Currently we only build test-x86_64 and test-i386-ssse3 from
-# $(SRC)/tests/tcg/i386/
+# $(SRC_PATH)/tests/tcg/i386/
 #
 
 include $(SRC_PATH)/tests/tcg/i386/Makefile.target
 
+X86_64_TESTS += vsyscall
 TESTS=$(MULTIARCH_TESTS) $(X86_64_TESTS) test-x86_64
 QEMU_OPTS += -cpu max
 
 test-x86_64: LDFLAGS+=-lm -lc
 test-x86_64: test-i386.c test-i386.h test-i386-shift.h test-i386-muldiv.h
 	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
+
+vsyscall: $(SRC_PATH)/tests/tcg/x86_64/vsyscall.c
+	$(CC) $(CFLAGS) $< -o $@ $(LDFLAGS)
diff --git a/tests/tcg/x86_64/vsyscall.c b/tests/tcg/x86_64/vsyscall.c
new file mode 100644
index 000000000000..786b047053aa
--- /dev/null
+++ b/tests/tcg/x86_64/vsyscall.c
@@ -0,0 +1,12 @@
+#include <stdio.h>
+#include <time.h>
+
+#define VSYSCALL_PAGE 0xffffffffff600000
+#define TIME_OFFSET 0x400
+typedef time_t (*time_func)(time_t *);
+
+int main(void)
+{
+    printf("%ld\n", ((time_func)(VSYSCALL_PAGE + TIME_OFFSET))(NULL));
+    return 0;
+}
-- 
2.31.1


