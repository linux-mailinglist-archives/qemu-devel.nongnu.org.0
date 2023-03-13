Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEFC6B7A06
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 15:12:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbitQ-0005bJ-49; Mon, 13 Mar 2023 10:11:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbitM-0005X2-5T
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:11:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pbitK-0006cO-KS
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 10:11:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678716669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xXUWi/D5ENS/HMywWSU2ibnGR6zQfeC988o8MFTww+s=;
 b=IT6chbjlCsuL19iFLMbO/FDvrpGPHpWBaZ5W21UGr6jYqVFRsjctE5+Jyoc+MVlIL7qWp6
 HEm5zcV3OkaHY10zd02hSga6VA00pYzkxR7r0gqbJeFkjpeVMYP/YtQWHo6/slzr2Fv8po
 ObbKXQyoeWuW72gpPzn7Eb4CTalHDtk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-88-0UWyOnf4Mdu9OH-Ov206pw-1; Mon, 13 Mar 2023 10:11:06 -0400
X-MC-Unique: 0UWyOnf4Mdu9OH-Ov206pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A65AE3828889;
 Mon, 13 Mar 2023 14:11:05 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.77])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9F1C21121315;
 Mon, 13 Mar 2023 14:11:04 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Cc: Nina Schoetterl-Glausch <nsg@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>
Subject: [PULL 5/5] tests/tcg/s390x: Add C(G)HRL test
Date: Mon, 13 Mar 2023 15:10:57 +0100
Message-Id: <20230313141057.230810-6-thuth@redhat.com>
In-Reply-To: <20230313141057.230810-1-thuth@redhat.com>
References: <20230313141057.230810-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Nina Schoetterl-Glausch <nsg@linux.ibm.com>

Test COMPARE HALFWORD RELATIVE LONG instructions.
Test that the bytes following the second operand do not affect the
instruction.
Test the sign extension performed on the second operand.

Signed-off-by: Nina Schoetterl-Glausch <nsg@linux.ibm.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20230310114157.3024170-3-nsg@linux.ibm.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/tcg/s390x/chrl.c          | 80 +++++++++++++++++++++++++++++++++
 tests/tcg/s390x/Makefile.target |  1 +
 2 files changed, 81 insertions(+)
 create mode 100644 tests/tcg/s390x/chrl.c

diff --git a/tests/tcg/s390x/chrl.c b/tests/tcg/s390x/chrl.c
new file mode 100644
index 0000000000..b1c3a1c561
--- /dev/null
+++ b/tests/tcg/s390x/chrl.c
@@ -0,0 +1,80 @@
+#include <stdlib.h>
+#include <assert.h>
+#include <stdint.h>
+
+static void test_chrl(void)
+{
+    uint32_t program_mask, cc;
+
+    asm volatile (
+        ".pushsection .rodata\n"
+        "0:\n\t"
+        ".short 1, 0x8000\n\t"
+        ".popsection\n\t"
+
+        "chrl %[r], 0b\n\t"
+        "ipm %[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (1)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+
+    asm volatile (
+        ".pushsection .rodata\n"
+        "0:\n\t"
+        ".short -1, 0x8000\n\t"
+        ".popsection\n\t"
+
+        "chrl %[r], 0b\n\t"
+        "ipm %[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (-1)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+}
+
+static void test_cghrl(void)
+{
+    uint32_t program_mask, cc;
+
+    asm volatile (
+        ".pushsection .rodata\n"
+        "0:\n\t"
+        ".short 1, 0x8000, 0, 0\n\t"
+        ".popsection\n\t"
+
+        "cghrl %[r], 0b\n\t"
+        "ipm %[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (1L)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+
+    asm volatile (
+        ".pushsection .rodata\n"
+        "0:\n\t"
+        ".short -1, 0x8000, 0, 0\n\t"
+        ".popsection\n\t"
+
+        "cghrl %[r], 0b\n\t"
+        "ipm %[program_mask]\n"
+        : [program_mask] "=r" (program_mask)
+        : [r] "r" (-1L)
+    );
+
+    cc = program_mask >> 28;
+    assert(!cc);
+}
+
+int main(void)
+{
+    test_chrl();
+    test_cghrl();
+    return EXIT_SUCCESS;
+}
diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
index b7f576f983..cf93b96686 100644
--- a/tests/tcg/s390x/Makefile.target
+++ b/tests/tcg/s390x/Makefile.target
@@ -28,6 +28,7 @@ TESTS+=div
 TESTS+=clst
 TESTS+=long-double
 TESTS+=cdsg
+TESTS+=chrl
 
 cdsg: CFLAGS+=-pthread
 cdsg: LDFLAGS+=-pthread
-- 
2.31.1


